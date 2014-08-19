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
                ->setItemCountPerPage(ADMIN_NUM_PAGE)
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
            'detail' => $obj->detail ? $obj->detail : '',
            'position' => $obj->position ? $obj->position : '',
            'status' => ENABLE,
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
    /* array file */
    function reArrayFiles($file_post) {

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
    /* Update Item article*/
    public function updateItem($id, $data)
    {
        $this->tableGateway->update($data, array('id' => $id));
    }
    /* Chang status product*/
    public function changStatusItem($id, $value)
    {
        $this->tableGateway->update(array('status' => $value), array('id' => $id));
    }
    public function deleteItem($id)
    {
        $this->tableGateway->delete(array('id' => $id));
    }
    /* Get List Article sethome*/
    public function listSetHome($pIndex = null)
    {
        $select = $this->tableGateway->getSql()->select();
        $select->where(array(
            'home' => SET_HOME
        ));
        $select->order('position ASC');
        $select->limit(1);
        $row = $this->tableGateway->selectWith($select);
        return $row;
    }

    public function getArticleWhere($where = '', $limit = '')
    {
        $select = $this->tableGateway->getSql()->select();
        if($where) $select->where($where);
        $select->order('position ASC');
        if($limit) $select->limit($limit);
        $row = $this->tableGateway->selectWith($select);
        return $row;
    }
    public function getProjectHome($listIn)
    {
        //$listIn =  array('17', '18', '19');
        $item = new Item;
        $table = $this->tableGateway->table;
        $sql = "SELECT * FROM `$table` WHERE `cat_id` IN (".implode(',',$listIn).") and `home` = 1 LIMIT 0,1";
        $resultSet = $this->tableGateway->adapter->query($sql, array());
        if(!$resultSet) return false;
        return $resultSet;
    }
}