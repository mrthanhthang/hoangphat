<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Paginator\Paginator;
use Zend\Paginator\Adapter\Iterator;
use Zend\Db\Sql\Select;
use Zend\Db\ResultSet\ResultSet;

class ArticleTable
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
    public function fetchAllJoinCat($pIndex = null) {
        $tableName = $this->tableGateway->getTable();
        $sql = "SELECT a.*,c.name FROM `$tableName` a LEFT JOIN article_category c ON a.cat_id=c.id";
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();
        $resultSet = new ResultSet();
        $resultSet->initialize($result);
        if (is_numeric($pIndex)) {
            $resultSet->buffer()->next();
            $paginator = new Paginator(new Iterator($resultSet));
            $paginator->setCurrentPageNumber($pIndex)
                ->setItemCountPerPage(3)
                ->setPageRange(5);
            return $paginator;
        }
        else
            return $resultSet;
    }
    public function fetchAllJoinCat2($pIndex = null) {
        $sqlSelect = $this->tableGateway->getSql()->select();
        $sqlSelect->columns(array('article_category.name'));
        $sqlSelect->join('article_category', 'article_category.id = article.cat_id', array(), 'left');

        $resultSet = $this->tableGateway->selectWith($sqlSelect);
        if (is_numeric($pIndex)) {
            $resultSet->buffer()->next();
            $paginator = new Paginator(new Iterator($resultSet));
            $paginator->setCurrentPageNumber($pIndex)
                ->setItemCountPerPage(3)
                ->setPageRange(5);
            return $paginator;
        }
        else
            return $resultSet;
    }
    public function getArticle($id)
    {
        $id  = (int) $id;
        $rowset = $this->tableGateway->select(array('id' => $id));
        $row = $rowset->current();
        if (!$row) {
            throw new \Exception("Could not find row $id");
        }
        return $row;
    }
    public function saveArticle($obj)
    {
        $data = array(
            'id' => $obj->id ? $obj->id : '',
            'cat_id'  => $obj->cat_id ? $obj->cat_id : '',
            'title' => $obj->title ? $obj->title : '',
            'description' => $obj->description ? $obj->description : '',
            'detail' => $obj->detail ? $obj->cat_id : '',
            'position' => $obj->position ? $obj->position : '',
            'properties' => serialize($obj->properties) ? serialize($obj->properties) : ''
        );

        $id = (int)$obj->id;
        if ($id == 0) {
            $this->tableGateway->insert($data);
        } else {
            if ($this->getArticle($id)) {
                $this->tableGateway->update($data, array('id' => $id));
            } else {
                throw new \Exception('Form id does not exist');
            }
        }
    }

}