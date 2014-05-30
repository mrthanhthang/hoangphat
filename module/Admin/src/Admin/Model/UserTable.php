<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;

class UserTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll($pIndex = null)
    {
        $resultSet = $this->tableGateway->select();
        if( is_numeric($pIndex)){
            $paginator = new Paginator(new Iterator($resultSet->buffer()));
            $paginator->setCurrentPageNumber($pIndex)
                        ->setItemCountPerPage(1)
                        ->setPageRange(5);
            return $paginator;
        }
        return $resultSet;
    }

    public function getUser($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
    public function checkAuthenicate($username = '', $password = '')
    {
        $username  = addslashes($username);
        $password  = md5(addslashes($password));
        $rowset = $this->tableGateway->select(array('username' => $username, 'password' => $password));
        
        $row = $rowset->current();        
        if (!$row) {
            return 0;
        }
        return $row;
    }
    
    public function searchUser($name = '', $pIndex=null)
    {
        $user = new User;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($user->getArrayCopy() as $field => $value){
            $listField[] = $field;
        }
        $listField = implode(',', $listField);
        
        $sql = "SELECT $listField FROM `$table` WHERE `name` LIKE ?";
        $resultSet = $this->tableGateway->adapter->query($sql, array("%$name%"));
        if(is_numeric($pIndex)){
            $paginator = new Paginator(new Iterator($resultSet->buffer()));
            $paginator->setCurrentPageNumber($pIndex)
                        ->setItemCountPerPage(1)
                        ->setPageRange(5);
            return $paginator;
        }
        
        return $resultSet;
    }
    public function saveCategory($obj)
    {
        $data = array(
            'name' => $obj->name,
            'username'  => $obj->username,
            'password' => $obj->password,
        );

        $id = (int)$obj->id;
        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getUser($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

    public function deleteMenu($id)
    {
        $this->tableGateway->delete(array('id' => $id));
    }
}