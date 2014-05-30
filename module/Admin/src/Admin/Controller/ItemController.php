<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;

class ItemController extends AbstractActionController
{
    protected $itemTable;
    protected $categoryTable;
    protected $userTable;
    
    public function getUserTable()
    {
        if (!$this->userTable) {
            $sm = $this->getServiceLocator();
            $this->userTable = $sm->get('Admin\Model\UserTable');
        }
        return $this->userTable;
    }
    
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
        $cat_id = $this->params()->fromQuery('category_id');
        if ($name || $cat_id) {
            $arrItem = $this->getItemTable()->searchItem($name, $cat_id, $pIndex);
        }else
            $arrItem = $this->getItemTable()->fetchAll($pIndex);
			
        $arrPID = $this->getCategoryTable()->getParentID();      
        return new ViewModel(array(
            'arrItem' => $arrItem,
			'arrPID' => $arrPID,
        ));
    }
    
    public function saveAction() {
        $request = $this->getRequest();
        if ($request->isPost()) {
            $objRequest = $request->getPost();
            $objRequest->date_create = date('Y-m-d H:i:s', time());
            $objRequest->arr_images = array();
            if (isset($_GET['id'])) {
                $item = $this->getItemTable()->getItem($_GET['id']);
                $objRequest->id = $item->id;
                $objRequest->arr_images = unserialize($item->arr_images);
            }
            //Attach Images
            if (!file_exists('public/img/admin/items'))
                mkdir('public/img/admin/items');
            if ($_FILES['arr_images']) {
                $file_ary = $this->getItemTable()->reArrayFiles($_FILES['arr_images']);
                foreach ($file_ary as $key => $file) {
                    if ($file['name'] != null) {
                        $newFile = "item_" . $file['size']. "_" . time('now') . "." . substr($file["name"], strrpos($file["name"], '.') + 1);
                        move_uploaded_file($file["tmp_name"], "public/img/admin/items/" . $newFile);
                        $objRequest->arr_images[$key] = $newFile;
                    } else {
                        isset($item) ? $objRequest->arr_images[$key] = $objRequest->arr_images[$key] : $objRequest->arr_images[$key] = '';
                    }
                }
            }
            if(isset($objRequest->remove) && $objRequest->remove && count($objRequest->remove)){
                foreach($objRequest->remove as $remove){
                    unset($objRequest->arr_images[$remove]);
                }
            }
            
            $listImg = array();
            foreach($objRequest->arr_images as $img){
                if($img) $listImg[] = $img;
            }
            $objRequest->arr_images = serialize(array_unique($listImg));
            $this->getItemTable()->saveItem($objRequest);
            return $this->redirect()->toRoute('aditm');
        }
        $arrPID = $this->getCategoryTable()->getParentID();
        if (isset($_GET['id'])) {          
            $item = $this->getItemTable()->getItem($_GET['id']);
            return array(
                'item' => $item,
                'arrPID' => $arrPID,
            );
        }
        return array(
                'arrPID' => $arrPID,
        );
    }
    
    public function delAction()
    {
        $id = $this->params()->fromQuery('id');
        $item = $this->getItemTable()->getItem($id);
        if($item) $this->getItemTable()->deleteItem($item->id);
        return $this->redirect()->toRoute('aditm');
        return new ViewModel(array());
    }
    
    public function logoutAction() {
        $container = new Container('system');
        if(isset($container->user) && $container->user)$container->user = '';
        return $this->redirect()->toRoute('admin');

        $viewModel = new ViewModel;
        $viewModel->setTerminal(true);
        return $viewModel;
    }
}