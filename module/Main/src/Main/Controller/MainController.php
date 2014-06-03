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
    //index page
    public function indexAction()
    {
        $arrCat = $this->getCategoryTable()->fetchAll();
        $arrProductHome = $this->getItemTable()->listSetHome();
        return new ViewModel(
            array('arrProductHome' => $arrProductHome)
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

}
