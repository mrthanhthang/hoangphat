<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;

class OrderController extends AbstractActionController
{
    protected $itemTable;
    protected $categoryTable;
    protected $orderTable;
    protected $orderDetailTable;
    
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
    public function getOrderTable()
    {
        if (!$this->orderTable) {
            $sm = $this->getServiceLocator();
            $this->orderTable = $sm->get('Admin\Model\OrderTable');
        }
        return $this->orderTable;
    }
    
    public function getOrderDetailTable()
    {
        if (!$this->orderDetailTable) {
            $sm = $this->getServiceLocator();
            $this->orderDetailTable = $sm->get('Admin\Model\OrderDetailTable');
        }
        return $this->orderDetailTable;
    }
    
    public function indexAction()
    {
        $pIndex = $this->params()->fromQuery('page', 1);
        $order_name = $this->params()->fromQuery('order_name');
        $order_email = $this->params()->fromQuery('order_email');
        if ($order_name || $order_email) {
            $arrOrd = $this->getOrderTable()->searchOrder($order_name, $order_email, $pIndex);
        }else
            $arrOrd = $this->getOrderTable()->fetchAll($pIndex);
			
        return new ViewModel(array(
            'arrOrd' => $arrOrd,
        ));
    }
    
    public function detailAction()
    {
        $id = $this->params()->fromQuery('id', 0);
        $ord = $this->getOrderTable()->getOrder($id);
        $ordDetail = array();
        $arrItem = array();
        if($ord){
            $ordDetail = $this->getOrderDetailTable()->getOrderDetailByOrderId($ord->id);
            foreach($ordDetail as $i){
                $item = $this->getItemTable()->getItem($i->id);
                if($item){
                    $item->quantity = $i->quantity;
                    $arrItem[] = $item;
                } 
            }
        }
			
        return new ViewModel(array(
            'ord' => $ord,
            'arrItem' => $arrItem,
        ));
    }
}