<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class CustomerController extends AbstractActionController
{
    protected $customerTable;
   
    public function getCustomerTable()
    {
        if (!$this->customerTable) {
            $sm = $this->getServiceLocator();
            $this->customerTable = $sm->get('Admin\Model\CustomerTable');
        }
        return $this->customerTable;
    }
    
    public function indexAction()
    {            
        $pIndex = $this->params()->fromQuery('page', 1);
        $name = $this->params()->fromQuery('name');
        
        if ($name) {
            //$arrCus = $this->getCustomerTable()->searchItem($name, $cat_id, $pIndex);
        }else
            $arrCus = $this->getCustomerTable()->fetchAll($pIndex);			
      
        return new ViewModel(array(
            'arrCus' => $arrCus,			
        ));
    }
    public function saveAction() {
        $request = $this->getRequest();
        if ($request->isPost()) {
            $objRequest = $request->getPost();     
            $this->getCustomerTable()->saveCustomer($objRequest); 
            return $this->redirect()->toRoute('adcus');               
        }
        /* Edit Customer*/
        if (isset($_GET['id'])) {
            $customer = $this->getCustomerTable()->getCustomer($_GET['id']);            
            return array(
                'cus' => $customer,                
            );
        }       
    }   
}