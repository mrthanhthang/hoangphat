<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Sql\Select;

class ItemTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll($pIndex = null)
    {
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
    
    function getHostDirection(){
        $s = empty($_SERVER["HTTPS"]) ? '' : ($_SERVER["HTTPS"] == "on") ? "s" : "";
        $sp = strtolower($_SERVER["SERVER_PROTOCOL"]);
        $protocol = substr($sp, 0, strpos($sp, "/")) . $s;
        $port = ($_SERVER["SERVER_PORT"] == "80") ? "" : (":".$_SERVER["SERVER_PORT"]);
        //$folder = preg_replace('/index.php/', '', $_SERVER['PHP_SELF']);
        return $protocol . "://" . $_SERVER['SERVER_NAME'] . $port;
    }
    
    function reArrayFiles(&$file_post) {

        $file_ary = array();
        $file_count = count($file_post['name']);
        $file_keys = array_keys($file_post);
    
        for ($i=0; $i<$file_count; $i++) {
            foreach ($file_keys as $key) {
                $file_ary[$i][$key] = $file_post[$key][$i];
            }
        }
    
        return $file_ary;
    }

    public function getItem($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            return false;
        }
        return $row;
    }

    public function getHotDealItem()
    {
        $item = new Item;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($item->getArrayCopy() as $field => $value){
            $listField[] = $field;
        }
        $listField = implode(',', $listField);
        
        $sql = "SELECT * FROM `$table` ORDER BY `view` DESC LIMIT 0,10";
        $resultSet = $this->tableGateway->adapter->query($sql, array());
        if(!$resultSet) return false;
        return $resultSet;
    }
    
    public function getLatestItem($limit = 0)
    {
        $item = new Item;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($item->getArrayCopy() as $field => $value){
            $listField[] = $field;
        }
        $listField = implode(',', $listField);
        
        $sql = "SELECT * FROM `$table` ORDER BY `date_create` DESC";
        if($limit && is_numeric($limit))  $sql .= ' LIMIT 0,'.$limit;
        $resultSet = $this->tableGateway->adapter->query($sql, array());
        if(!$resultSet) return false;
        return $resultSet;
    }
    
    public function getSaleOffItem($limit = 0)
    {
        $item = new Item;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($item->getArrayCopy() as $field => $value){
            $listField[] = $field;
        }
        $listField = implode(',', $listField);
        
        $sql = "SELECT * FROM `$table` WHERE `discount_percent` != ? ORDER BY `date_create` DESC";
        if($limit && is_numeric($limit))  $sql .= ' LIMIT 0,'.$limit;
        $resultSet = $this->tableGateway->adapter->query($sql, array(0));
        if(!$resultSet) return false;
        return $resultSet;
    }
    
    public function getItemByCategory($category_id = 0)
    {
        $item = new Item;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($item->getArrayCopy() as $field => $value){
            $listField[] = $field;
        }
        $listField = implode(',', $listField);
        
        $sql = "SELECT * FROM `$table` WHERE `category_id` = ? ORDER BY `date_create` DESC";
        $resultSet = $this->tableGateway->adapter->query($sql, array($category_id));
        if(!$resultSet) return false;
        return $resultSet;
    }
    
    public function listItem($listId = array())
    {
        $obj = new Item();
        $fields = array_keys($obj->getArrayCopy());
        $fields = implode(",", $fields);

        if($listId) $listId = implode(",", $listId);
        else $listId = 'false';
        $tableName = $this->tableGateway->getTable();
        $sql = "SELECT $fields FROM $tableName WHERE `id` IN ($listId)";
        $statement = $this->tableGateway->adapter->query($sql);
        $result = $statement->execute();
        $resultSet = new ResultSet;
        $resultSet->initialize($result);
        if(!$resultSet)
            return false;
        return $resultSet;
    }
    
    public function searchItem($name = '', $category_id = '', $pIndex=null)
    {
        $item = new Item;
        $table = $this->tableGateway->table;
        $listField = array();
        foreach($item->getArrayCopy() as $field => $value){
            $listField[] = $field;
        }
        $listField = implode(',', $listField);
        
        $condition = array();
        $sql = "SELECT $listField FROM `$table` WHERE 1>0";
        if($name){
            $sql .= " AND `name` LIKE ?";
            $condition[] = "%$name%";
        }
        if($category_id){
            $sql .= " AND `category_id` = ?";
            $condition[] = $category_id;
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
    public function saveItem($obj)
    {
        $data = array(
            'name' => $obj->name,
            'category_id'  => $obj->category_id,
            'description' => $obj->description,
            'arr_images'  => $obj->arr_images,
            'date_create' => date('Y-m-d H:i:s', time()),
            'is_active'  => $obj->is_active,
            'price' => $obj->price,
            'discount_percent'  => $obj->discount_percent,
            'view'  => isset($obj->view) ? $obj->view : 0,
        );

        $id = (int)$obj->id;
        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getItem($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

    public function deleteItem($id)
    {
        $this->tableGateway->delete(array('id' => $id));
    }
}