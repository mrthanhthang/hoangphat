<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;

class CategoryTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll($pIndex = null)
    {
        
        $resultSet = $this->tableGateway->select(array('parent_id' => 0));
        if( is_numeric($pIndex)){
            $paginator = new Paginator(new Iterator($resultSet->buffer()));
            $paginator->setCurrentPageNumber($pIndex)
                        ->setItemCountPerPage(20)
                        ->setPageRange(5);
            return $paginator;
        }
        return $resultSet;
    }

    public function getCategory($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    
     public function getParentID($parent_id = 0) {
        $parent_id  = (int) $parent_id;
        $resultSet = $this->tableGateway->select(array('parent_id' => $parent_id));
        if (!$resultSet) {
            return false;
        }
        return $resultSet;
    }
    
    public function searchCategory($name = '', $parent_id = 0, $pIndex=null)
    {
        $table = $this->tableGateway->table;
        $condition = array();
        $sql = "SELECT * FROM `$table` WHERE 1>0";
        if($name){
            $sql .= " AND `name` LIKE ?";
            $condition[] = "%$name%";
        }
        if($parent_id){
            $sql .= " AND `parent_id` = ?";
            $condition[] = $parent_id;
        }
        $resultSet = $this->tableGateway->adapter->query($sql, $condition);
        if(is_numeric($pIndex)){
            $paginator = new Paginator(new Iterator($resultSet->buffer()));
            $paginator->setCurrentPageNumber($pIndex)
                        ->setItemCountPerPage(20)
                        ->setPageRange(5);
            return $paginator;
        }
        
        return $resultSet;
    }
    public function saveCategory($obj)
    {
        $data = array(
            'name' => $obj->name,
            'image'  => $obj->image,
            'parent_id' => $obj->parent_id,
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

    public function deleteCategory($id)
    {
        $this->tableGateway->delete(array('id' => $id));
    }
}