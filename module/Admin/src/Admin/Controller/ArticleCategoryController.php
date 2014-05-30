<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class ArticleCategoryController extends AbstractActionController
{
    protected $articleCategoryTable;
   
    public function getArticleCategoryTable()
    {
        if (!$this->articleCategoryTable) {
            $sm = $this->getServiceLocator();
            $this->articleCategoryTable = $sm->get('Admin\Model\ArticleCategoryTable');
        }
        return $this->articleCategoryTable;
    }
    
    public function indexAction()
    {            
        $pIndex = $this->params()->fromQuery('page', 1);
        $name = $this->params()->fromQuery('name');
        
        if ($name) {
            //$arrCus = $this->getCustomerTable()->searchItem($name, $cat_id, $pIndex);
        }else
            $arrArtCat = $this->getArticleCategoryTable()->fetchAll($pIndex);			
      
        return new ViewModel(array(
            'arrArtCat' => $arrArtCat,			
        ));
    }
    public function saveAction() {
        $mkdirArticle = 'public/img/admin/article/';
        $treeArtCat = $this->getArticleCategoryTable()->getTreeMenu(0);        
        $request = $this->getRequest();
        $properties = array();
        $id = '';
        if ($request->isPost()) {
            $objRequest = $request->getPost();        
            if (isset($_GET['id'])) {
                $articleCategory = $this->getArticleCategoryTable()->getArticleCategory($_GET['id']);
                $objRequest->id = $articleCategory->id;
                $properties = $articleCategory -> properties;                
            }
            /*Attach Images*/            
            if (!file_exists($mkdirArticle))
                mkdir($mkdirArticle);
            if ($_FILES['image']['name']) {             
                $file = $_FILES['image'];
                $newFile = "artcat" . $file['size']. "_" . time('now') . "." . substr($file["name"], strrpos($file["name"], '.') + 1);
                move_uploaded_file($file["tmp_name"], $mkdirArticle . $newFile);
                $properties['avata'] = $newFile;
            }
          
            $objRequest->properties = $properties;             
            $this->getArticleCategoryTable()->saveArticleCategory($objRequest); 
            return $this->redirect()->toRoute('adartCat');    
        }
                   
        /* Edit Article Category*/
        if (isset($_GET['id'])) {
            $articleCategory = $this->getArticleCategoryTable()->getArticleCategory($_GET['id']);            
            return array(
                'articleCategory' => $articleCategory,
                'treeArtCat' => $treeArtCat                
            );
        }       
        return array('treeArtCat' => $treeArtCat);
    }
}