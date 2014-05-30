<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;

class OrderTable
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
                        ->setItemCountPerPage(20)
                        ->setPageRange(5);
            return $paginator;
        }
        return $resultSet;
    }

    public function getOrder($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            return false;
        }
        return $row;
    }
    
    public function searchOrder($name = '', $email = '', $pIndex=null)
    {
        $obj = new Order;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($obj->getArrayCopy() as $field => $value){
            $listField[] = $field;
        }
        $listField = implode(',', $listField);
        
        $condition = array();
        $sql = "SELECT $listField FROM `$table` WHERE 1>0";
        if($name){
            $sql .= " AND `order_name` LIKE ?";
            $condition[] = "%$name%";
        }
        if($email){
            $sql .= " AND `order_email` = ?";
            $condition[] = $email;
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
    public function saveOrder($obj)
    {
        $data = array(
            'date_order'    => date('Y-m-d H:i:s', time()),
            'order_name'    => $obj->order_name,
            'order_email'   => $obj->order_email,
            'order_phone'   => $obj->order_phone,
            'order_address' => $obj->order_address,
        );

        $id = isset($obj->id) ? (int)$obj->id : 0;
        if ($id == 0) {
            $new = $this->tableGateway->insert($data);
            $id = $this->tableGateway->getLastInsertValue();
        } else {
            if ($this->getOrder($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
        return $id;
    }

    public function deleteOrder($id)
    {
        $this->tableGateway->delete(array('id' => $id));
    }
}