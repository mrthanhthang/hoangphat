<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class CategoryController extends AbstractActionController
{
    protected $itemTable;
    protected $categoryTable;
    
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
    
    public function indexAction()
    {
        $pIndex = $this->params()->fromQuery('page', 1);
        $name = $this->params()->fromQuery('name');
        $pid = $this->params()->fromQuery('pid');       
       
        if ($name || $pid) {
            $arrCat = $this->getCategoryTable()->searchCategory($name, $pid, $pIndex);
        }else
            $arrCat = $this->getCategoryTable()->fetchAll($pIndex);
       // echo '<pre>';
//        print_r($arrCat);
//        echo '</pre>';      
        return new ViewModel(array(
            'arrCat' => $arrCat,
        ));
    }
    
    public function delAction()
    {
        $id = $this->params()->fromQuery('id');
        $item = $this->getCategoryTable()->getCategory($id);
        if($item) $this->getCategoryTable()->deleteCategory($item->id);
        return $this->redirect()->toRoute('adcat');
        return new ViewModel(array());
    }
    
    public function saveAction() {
        $request = $this->getRequest();
        if ($request->isPost()) {
            $objRequest = $request->getPost();
            if (isset($_GET['id'])) {
                $cus = $this->getCategoryTable()->getCategory($_GET['id']);
                $objRequest->id = $cus->id;
            }
            if (!file_exists('public/img/admin/cats'))
                mkdir('public/img/admin/cats');
            if ($_FILES["image"]["name"] != null) {
                $newFile = "cat_" . $_FILES["image"]['size'] . "_" . time('now') . "." . substr($_FILES["image"]["name"], strrpos($_FILES["image"]["name"], '.') + 1);
                move_uploaded_file($_FILES["image"]["tmp_name"], "public/img/admin/cats/" . $newFile);
                $objRequest->image = $newFile;
            } else {
                $objRequest->image = isset($cus->image) ? $cus->image : '';
            }
            $this->getCategoryTable()->saveCategory($objRequest);
            return $this->redirect()->toRoute('adcat');
        }
        $arrPID = $this->getCategoryTable()->getParentID();
        if (isset($_GET['id'])) {
            $cus = $this->getCategoryTable()->getCategory($_GET['id']);
            return array(
                'cat' => $cus,
                'arrPID' => $arrPID,
            );
        }
        return array('arrPID' => $arrPID,);
    }
}