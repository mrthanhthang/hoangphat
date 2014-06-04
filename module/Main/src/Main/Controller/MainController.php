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
        $projectHome = $this->getArticleTable()->getArticleWhere(array( 'cat_id' => $idArticleCat , 'home' => SET_HOME ), 1);
        /* List Product set home*/
        $arrProductHome = $this->getItemTable()->listSetHome();
        return new ViewModel(
            array('arrProductHome' => $arrProductHome, 'arrArticleHome' => $arrArticleHome, 'projectHome' => $projectHome)
        );
    }
    
    //product page
    public function productAction()
    {

    }

    //About page
    public function aboutAction()
    {
        $arrCat = $this->getCategoryTable()->fetchAll();
        return new ViewModel(
            array('arrCat' => $arrCat)
        );
    }
    //contact page
    public function contactAction()
    {
        return new ViewModel(
            array('arrCat' => $arrCat)
        );
    }

}
