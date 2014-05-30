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
    
    public function getOrderDetailTable()
    {
        if (!$this->orderDetailTable) {
            $sm = $this->getServiceLocator();
            $this->orderDetailTable = $sm->get('Admin\Model\OrderDetailTable');
        }
        return $this->orderDetailTable;
    }
    
    public function getOrderTable()
    {
        if (!$this->orderTable) {
            $sm = $this->getServiceLocator();
            $this->orderTable = $sm->get('Admin\Model\OrderTable');
        }
        return $this->orderTable;
    }
    //index page
    public function indexAction()
    {
        $arrHD = $this->getItemTable()->getHotDealItem();
        $arrSO = $this->getItemTable()->getSaleOffItem(6);
        $arrLT = $this->getItemTable()->getLatestItem(6);
        $arrCat = $this->getCategoryTable()->fetchAll();
        return new ViewModel(
            array('arrHD' => $arrHD, 'arrSO' => $arrSO, 'arrLT' => $arrLT, 'arrCat' => $arrCat)
        );
    }
    
    //index page
    public function categoryAction()
    {
        $cid = $this->params()->fromQuery('cid');
        $arrItem = $this->getItemTable()->getItemByCategory($cid);
        $arrCat = $this->getCategoryTable()->fetchAll();
        return new ViewModel(
            array( 'arrCat' => $arrCat, 'arrItem' => $arrItem)
        );
    }
    
    //product page
    public function productAction()
    {
        $pid = $this->params()->fromQuery('pid');
        $pro = $this->getItemTable()->getItem($pid);
		if(!$pro)
			$this->redirect()->toRoute('main', array('action' => 'index'));
        $pro->view = $pro->view +1;
        $this->getItemTable()->saveItem($pro);
        $arrCat = $this->getCategoryTable()->fetchAll();
        $url = $this->getItemTable()->getHostDirection();
        return new ViewModel(
            array('pro' => $pro, 'arrCat' => $arrCat, 'url' => $url)
        );
    }

    public function latestAction()
    {
        $pIndex = $this->params()->fromQuery('page', 1);
        $arrLT = $this->getItemTable()->fetchAll($pIndex);
        $arrCat = $this->getCategoryTable()->fetchAll();
        return new ViewModel(
            array('arrCat' => $arrCat, 'arrLT' => $arrLT)
        );
    }
    
    public function saleoffAction()
    {
        $arrSO = $this->getItemTable()->getSaleOffItem();
        $arrCat = $this->getCategoryTable()->fetchAll();
        return new ViewModel(
            array('arrCat' => $arrCat, 'arrSO' => $arrSO)
        );
    }
    //product page
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
        $arrCat = $this->getCategoryTable()->fetchAll();
        $request = $this->getRequest();
        if ($request->isPost()) {
            $objRequest = $request->getPost();
            try {
                $transport = new SmtpTransport(new SmtpOptions(array(
                                    'name' => 'gmail',
                                    'host' => 'smtp.gmail.com',
                                    'port' => 465,
                                    'connectionClass' => 'login',
                                    'connectionConfig' => array(
                                        'ssl' => 'ssl',
                                        'username' => 'jasonsmith2812@gmail.com',
                                        'password' => 'vuthiphuongtran',
                                    )
                                )));
                $message = new Message();
                $message->addTo('jasonsmith2812@gmail.com')
                        ->addFrom($objRequest->email)
                        ->setSubject($objRequest->subject)
                        ->setBody($objRequest->message);
                $transport->send($message);
            } catch (Zend_Exception $e) {
                return false;
            }
        }
        return new ViewModel(
            array('arrCat' => $arrCat)
        );
    }
    //contact page
    public function cartAction()
    {
        $session = new Container('system');
        $ses_id = session_id();
        if(!isset($session->cart)){
            $session->cart = array();
        }
        if(!isset($session->cart[$ses_id])){
            $session->cart[] = $ses_id;
            $session->cart[$ses_id] = array();
        }
        $request = $this->getRequest();
        if ($request->isPost()) {
            $objRequest = $request->getPost();
            $order = (object) Null;
            $order->order_name = $objRequest->order_name;
            $order->order_email = $objRequest->order_email;
            $order->order_phone = $objRequest->order_phone;
            $order->order_address = $objRequest->order_address;
            $id_order = $this->getOrderTable()->saveOrder($order);
            foreach($objRequest->cart as $key => $value){
                if($this->getItemTable()->getItem($key)){
                    $orderDetail = (object) Null;
                    $orderDetail->order_id = $id_order;
                    $orderDetail->itemt_id = $key;
                    $orderDetail->quantity = $value;
                    $this->getOrderDetailTable()->saveOrderDetail($orderDetail);
                }
            }
            
            //Send mail admin
            try {
                $html = new MimePart('Bạn nhận được đơn đặt hàng từ khách hàng: <strong>'.$objRequest->order_name.'</strong> 
					(Email: '.$objRequest->order_email.', điện thoại: '.$objRequest->order_phone.'  ).<br />
					Chi tiết đơn hàng bạn vui lòng xem tại hệ thống Admin, với mã số đơn hàng là: <strong>'.$id_order.'<strong> .');
                $html->type = "text/html";
                $body = new MimeMessage();
                $body->setParts(array($html));
                $transport = new SmtpTransport(new SmtpOptions(array(
                                    'name' => 'gmail',
                                    'host' => 'smtp.gmail.com',
                                    'port' => 465,
                                    'connectionClass' => 'login',
                                    'connectionConfig' => array(
                                        'ssl' => 'ssl',
                                        'username' => 'jasonsmith2812@gmail.com',
                                        'password' => 'vuthiphuongtran',
                                    )
                                )));
                $message = new Message();
                $message->addTo('mrthanhthang@gmail.com')
                        ->addFrom($objRequest->order_email)
						->addCC('thanhthang9@gmail.com')
                        ->setSubject('Đơn đặt hàng')
                        ->setBody($body);
                $transport->send($message);
                
            } catch (Zend_Exception $e) {
                return false;
            }
            
            //Send mail user
            try {
                $html = new MimePart('Cảm ơn bạn đã đặt hàng tại <strong>Chánh Tây</strong>. Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất.');
                $html->type = "text/html";
                $body = new MimeMessage();
                $body->setParts(array($html));
                $transport = new SmtpTransport(new SmtpOptions(array(
                                    'name' => 'gmail',
                                    'host' => 'smtp.gmail.com',
                                    'port' => 465,
                                    'connectionClass' => 'login',
                                    'connectionConfig' => array(
                                        'ssl' => 'ssl',
                                        'username' => 'jasonsmith2812@gmail.com',
                                        'password' => 'vuthiphuongtran',
                                    )
                                )));
                $message = new Message();
                $message->addTo($objRequest->order_email)
                        ->addFrom('phuongdy.chanhtay@gmail.com')
                        ->setSubject('Công ty TNHH Chánh Tây')
                        ->setBody($body);
                $transport->send($message);
                
            } catch (Zend_Exception $e) {
                return false;
            }
            unset($session->cart[$ses_id]);
            return $this->redirect()->toRoute('main');
        }
        $arrItem = $this->getItemTable()->listItem($session->cart[$ses_id]);
        if(!count($arrItem)) return $this->redirect()->toRoute('main');
        $arrCat = $this->getCategoryTable()->fetchAll();
        return new ViewModel(
            array('arrCat' => $arrCat, 'arrItem' => $arrItem)
        );
    } 
    public function servCartAction(){
        $session = new Container('system');
        $ses_id = session_id(); 
        if(!isset($session->cart)){
            $session->cart = array();
        }
        if(!isset($session->cart[$ses_id])){
            $session->cart[] = $ses_id;
            $session->cart[$ses_id] = array();
        }
        $pid = $this->params()->fromQuery('key');
        $pro = $this->getItemTable()->getItem($pid);
        if($pro){
            array_push($session->cart[$ses_id], $pid);
            $session->cart[$ses_id] = array_unique($session->cart[$ses_id]);
        } 
        $json = json_encode(array('cart' => count($session->cart[$ses_id])));
        $response = $this->getResponse()->setContent($json);
        return $response;
    }
    
    public function orderAction(){
        $session = new Container('system');
        $ses_id = session_id(); 
        if(!isset($session->cart)){
            $session->cart = array();
        }
        if(!isset($session->cart[$ses_id])){
            $session->cart[] = $ses_id;
            $session->cart[$ses_id] = array();
        }
        $pid = $this->params()->fromQuery('key');
        $pro = $this->getItemTable()->getItem($pid);
        if($pro){
            array_push($session->cart[$ses_id], $pid);
            $session->cart[$ses_id] = array_unique($session->cart[$ses_id]);
        } 
        return $this->redirect()->toRoute('main', array('action' => 'cart'));
    }
}
