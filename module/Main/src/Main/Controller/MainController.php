<?php

namespace Main\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;
use Zend\Mail\Message;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions as SmtpOptions;
use Zend\Mime\Message as MimeMessage;
use Zend\Mime\Part as MimePart;

class MainController extends AbstractActionController
{
    protected $itemTable;
    protected $categoryTable;
    protected $articleTable;
    protected $articleCategoryTable;
    
    public function getItemTable()
    {
        if (!$this->itemTable) {
            $sm = $this->getServiceLocator();
            $this->itemTable = $sm->get('Admin\Model\ItemTable');
        }
        return $this->itemTable;
    }
    public function getCategoryTable()
    {
        if (!$this->categoryTable) {
            $sm = $this->getServiceLocator();
            $this->categoryTable = $sm->get('Admin\Model\CategoryTable');
        }
        return $this->categoryTable;
    }
    public function getArticleTable()
    {
        if (!$this->articleTable) {
            $sm = $this->getServiceLocator();
            $this->articleTable = $sm->get('Admin\Model\ArticleTable');
        }
        return $this->articleTable;
    }
    public function getArticleCategoryTable()
    {
        if (!$this->articleCategoryTable) {
            $sm = $this->getServiceLocator();
            $this->articleCategoryTable = $sm->get('Admin\Model\ArticleCategoryTable');
        }
        return $this->articleCategoryTable;
    }

    /*Page*/
    //index page
    public function indexAction()
    {
        $idArticleCatNews = $this->getArticleCategoryTable()->getIdCategory('tin-tuc');
        $arrArticleHome = $this->getArticleTable()->getArticleWhere(array( 'cat_id' => $idArticleCatNews , 'home' => SET_HOME ), 4);
        /* List Du-an-tieu-Bieu set home*/
        $idArticleCat = $this->getArticleCategoryTable()->getIdCategory('du-an-tieu-bieu');
        $listCatProject = $this->getArticleCategoryTable()->getArticleCategoryWhere(array( 'parent_id' => $idArticleCat));
        foreach($listCatProject as $value){
            $listIdCatProject[] = $value -> id;
        }
       $catHome = $this->getCategoryTable()->getCategoryWhere(array( 'home' => SET_HOME));

        $projectHome = $this->getArticleTable()->getProjectHome($listIdCatProject);
        /* List Product set home*/
        $arrProductHome = $this->getItemTable()->listSetHome();
        return new ViewModel(
            array('arrProductHome' => $arrProductHome, 'arrArticleHome' => $arrArticleHome, 'projectHome' => $projectHome, 'catHome' => $catHome)
        );
    }
    //category page
    public function categoryAction()
    {
        $arritem = '';
        $category = '';
        $arrCat = $this->getCategoryTable()->fetchAll();
        $listCate = array();
        foreach($arrCat as $cat){
            $listCate[] = $cat;
        }
        isset($_GET['id']) ? $cateId = $_GET['id'] : $cateId = '';
        isset($_GET['parent_id']) ? $parent_id = $_GET['parent_id'] : $parent_id = '';
        if($cateId){
            isset($cateId) ? $category = $this->getCategoryTable()->getCategory($cateId) : $category = '';
            $arritem = $this->getItemTable()->getObjects(array( 'category_id' => $cateId , 'status' => ENABLE ));
        }else{
            $arrCategory = $this->getCategoryTable() -> getCategoryWhere('',1);
            foreach($arrCategory as $value){
                $category = $value;
            }
            if($category) {
                $cateId = $category['id'];
                $arritem = $this->getItemTable()->getObjects(array( 'category_id' => $cateId , 'status' => ENABLE ));
            }
        }
        return new ViewModel(
            array(  'arrCat' => $listCate,
                    'arritem' => $arritem,
                    'category' => $category,
                    'parent_id' => $parent_id,
                    'cateId' => $cateId,
                    'action' => 'category'
            )
        );
    }
    // Project page
    public function projectAction()
    {
        $arritem = '';
        $category = '';
        $acticle = '';
        // ID of category du-an-tieu-bieu
        $idCateProject = $this->getArticleCategoryTable()->getIdCategory('du-an-tieu-bieu');
        $idCateProject ? $listCatProject = $this->getArticleCategoryTable()->getArticleCategoryWhere(array( 'parent_id' =>  $idCateProject)) : $arrCatProject = array();
        $listCate = array();

        foreach($listCatProject as $key => $cat){
            if($key == 0)   $category = $cat;
            $listCate[] = $cat;
        }

        // ID category article
        isset($_GET['cateId']) ? $cateId = $_GET['cateId'] : $cateId = '';

        // ID acticle
        isset($_GET['id']) ? $id = $_GET['id'] : $id = '';

        // view article detail
        if($id){
            $acticle = $this->getArticleTable()->getArticle($id);
        }else{ // view article category
            if($cateId){
               $arritem = $this->getArticleTable()->getArticleWhere(array( 'cat_id' => $cateId , 'status' => ENABLE, ));

            }else{
                if($category) {
                    $cateId = $category -> id;
                    $arritem = $this->getArticleTable()->getArticleWhere(array( 'cat_id' => $cateId , 'status' => ENABLE, ));
                }
            }
        }

        return new ViewModel(
            array(  'arrCat' => $listCate,
                'arritem' => $arritem,
                'acticle' => $acticle,
                'cateId' => $cateId,
                'id' => $id,
                'action' => 'project'
            )
        );


    }
    //product page
    public function productAction()
    {
       // $treeArtCat = $this->getCategoryTable()->getTreeMenu(0);
        $arrTreeCat = $this->getCategoryTable()->getTreeMenu();
        $arrCat = $this->getCategoryTable()->fetchAll();

        $listCate = array();
        foreach($arrCat as $cat){
            $listCate[] = $cat;
        }

        $arrCat2 = $this->getCategoryTable()->getTreeMenu();
        $arritem = $this->getItemTable()->fetchAll();
        $arritem = $this->getItemTable()->fetchAll();
        return new ViewModel(
            array('arrCat' => $listCate, 'action' => 'index')
        );
    }

    //About page
    public function aboutAction()
    {
        $arrCat = $this->getCategoryTable()->fetchAll();
        return new ViewModel(
            array('arrCat' => $arrCat,'action' => 'about')
        );
    }
    //contact page
    public function contactAction()
    {

    }

    // News page
    public function newsAction()
    {
        $arritem = '';
        $category = '';
        $acticle = '';
        // ID of category tin-tuc
        $cateId = $this->getArticleCategoryTable()->getIdCategory('tin-tuc');
        // ID acticle
        isset($_GET['id']) ? $id = $_GET['id'] : $id = '';

        // view article detail
        if($id){
            $acticle = $this->getArticleTable()->getArticle($id);
        }else{ // view article category
            if($cateId){
                $arritem = $this->getArticleTable()->getArticleWhere(array( 'cat_id' => $cateId , 'status' => ENABLE, ));

            }
        }
        return new ViewModel(
            array(
                'arritem' => $arritem,
                'acticle' => $acticle,
                'cateId' => $cateId,
                'id' => $id,
                'action' => 'news'
            )
        );
    }

}
