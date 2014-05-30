<?php
namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;

class AdminController extends AbstractActionController
{
    protected $userTable;
    
    // module/Menu/src/Menu/Controller/MenuController.php:
    public function getUserTable()
    {
        if (!$this->userTable) {
            $sm = $this->getServiceLocator();
            $this->userTable = $sm->get('Admin\Model\UserTable');
        }
        return $this->userTable;
    }
    public function indexAction() {
        $container = new Container('system');
        if(isset($container->user) && $container->user) 
            return $this->redirect()->toRoute('aditm');
        $request = $this->getRequest();
        if ($request->isPost()) {
            $objRequest = $request->getPost();
            $user = $this->getUserTable()->checkAuthenicate($objRequest->username, $objRequest->password);
            if($user){
                $container->user = $user; /* Tao session*/
                return $this->redirect()->toRoute('aditm');
            } 
        }
    
        $viewModel = new ViewModel;
        $viewModel->setTerminal(true);
        return $viewModel;
    }
}