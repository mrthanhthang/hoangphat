<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;

class OrderDetailTable
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

    public function getOrderDetail($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            return false;
        }
        return $row;
    }
    
    public function getOrderDetailByOrderId($order_id)
    {
        $order_id  = (int) $order_id;
        $resultSet = $this->tableGateway->select(array('order_id' => $order_id));
        if (!$resultSet) {
            return false;
        }
        return $resultSet;
    }
    
    public function searchOrderDetail($name = '', $pIndex=null)
    {
        $obj = new OrderDetail;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($obj->getArrayCopy() as $field => $value){
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
    public function saveOrderDetail($obj)
    {
        $data = array(
            'order_id'  => $obj->order_id,
            'itemt_id' => $obj->itemt_id,
            'quantity' => $obj->quantity,
        );

        $id = isset($obj->id) ? (int)$obj->id : 0;
        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getOrderDetail($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

    public function deleteOrderDetail($id)
    {
        $this->tableGateway->delete(array('id' => $id));
    }
}