<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;
use Zend\Db\Sql\Select;

class ArticleCategoryTable
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
                             $select->order('position');
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
    public function getParentID($parent_id = 0) {
        $parent_id  = (int) $parent_id;
        $resultSet = $this->tableGateway->select(array('parent_id' => $parent_id));
        if (!$resultSet) {
            return false;
        }
        return $resultSet;
    }
    public function getTreeMenu($parent_id = 0,$space = "", $trees = array()) {
       $arrArtCat = $this -> getParentID($parent_id);
       $numrow = count($arrArtCat);         
        if($numrow > 0){
            foreach($arrArtCat as $item){
                $item -> name = $space.$item -> name;
                $trees[] = $item;               
                $trees = $this -> getTreeMenu($item -> id, $space.'&nbsp;&nbsp;&nbsp;|--', $trees);          
            }
        }       
       return $trees;
    }
    public function getArticleCategory($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    public function saveArticleCategory($obj)
    {
        $data = array(
            'parent_id' => $obj->parent_id,
            'name'  => $obj->name,
            'description' => $obj->description,
            'position' => $obj->position,
            'properties' => serialize($obj->properties)      
        );
               
        $id = (int)$obj->id;
        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getArticleCategory($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }
}