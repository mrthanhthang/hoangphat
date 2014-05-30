<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;
use Zend\Db\Sql\Select;

class CustomerTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll($pIndex = null)
    {    
      //echo __METHOD__;    
      return $this->tableGateway->select();
      $resultSet = $this->tableGateway->select(function (Select $select) {
                             $select->order('date_create DESC');
                        });
        if( is_numeric($pIndex)){
            $paginator = new Paginator(new Iterator($resultSet->buffer()));
            $paginator->setCurrentPageNumber($pIndex)
                        ->setItemCountPerPage(12)
                        ->setPageRange(5);
            return $paginator;
        }
        return $resultSet;
    }
    
    public function getCustomer($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    public function saveCustomer($obj)
    {
        $data = array(
            'username' => $obj->username,
            'password'  => $obj->password,
            'fullname' => $obj->fullname,
            'address' => $obj->address,
            'email' => $obj->email,
            'tel' => $obj->tel,
        );       
        $id = (int)$obj->id;
        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getCategory($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }    
}