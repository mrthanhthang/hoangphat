<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class ArticleController extends AbstractActionController
{

    protected $articleTable;
    protected $articleCategoryTable;

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
    public function indexAction()
    {
        $pIndex = $this->params()->fromQuery('page', 1);
        $arrArticle = $this->getArticleTable()->fetchAllJoinCat($pIndex);
        /*Action product*/
        if(isset($_GET['action']) && $_GET['action']){
            $action = $_GET['action'];
            $id = $_GET['id'];
            /*Set home product*/
            if($action == 'sethome'){
                $data = array('home' => SET_HOME);
                $this->getArticleTable()->updateItem($id,$data);
                return $this->redirect()->toRoute('adarticle');
            }
            /*UN Set home product*/
            if($action == 'unsethome'){
                $data = array('home' => UN_SET_HOME);
                $this->getArticleTable()->updateItem($id,$data);
                return $this->redirect()->toRoute('adarticle');
            }
            /*Enable product*/
            if($action == 'enable'){
                $this->getArticleTable()->changStatusItem($id,ENABLE);
                return $this->redirect()->toRoute('adarticle');
            }
            /*Disable product*/
            if($action == 'disable'){
                $this->getArticleTable()->changStatusItem($id,DISABLE);
                return $this->redirect()->toRoute('adarticle');
            }
        }
        return new ViewModel(array(
            'arrArticle' => $arrArticle,
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
            /*Get properties,id if Edit article*/
            if (isset($_GET['id'])) {
                $article = $this->getArticleTable()->getArticle($_GET['id']);
                $objRequest->id = $article->id;
                $properties = $article -> properties;
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

            /*Attach File*/
            if ($_FILES['arr_file']) {
                $arr_file = $this->getArticleTable()->reArrayFiles($_FILES['arr_file']);
                foreach($arr_file as $file){
                    if($file['name']){
                        $newFile = "artcat" . $file['size']. "_" . time('now') . "." . substr($file["name"], strrpos($file["name"], '.') + 1);
                        move_uploaded_file($file["tmp_name"], $mkdirArticle . $newFile);
                        $properties['file'][] = $newFile;
                    }
                }
            }

            /*Delete File attach*/
            if(isset($objRequest->remove) && $objRequest->remove && count($objRequest->remove)){
                foreach($objRequest->remove as $remove){
                    if($properties['file'][$remove]) unlink($mkdirArticle.$properties['file'][$remove]);
                    unset($properties['file'][$remove]);
                }
            }

            $objRequest->properties = $properties;
            $this->getArticleTable()->saveArticle($objRequest);
            return $this->redirect()->toRoute('adarticle');
        }

        /* Edit Article*/
        if (isset($_GET['id'])) {
            $article = $this->getArticleTable()->getArticle($_GET['id']);
            /* Delete avata*/
            if(isset($_GET['delva']) && $_GET['delva'] == 'delva'){

                if($article -> properties['avata']){
                    unlink($mkdirArticle.$article -> properties['avata']);
                    unset($article -> properties['avata']);
                    $this->getArticleTable()->saveArticle($article);
                    return $this->redirect()->toRoute('adarticle', array('action' => 'save'), array('query' => array('id' => $article->id )));
                }
            }

            return array(
                'article' => $article,
                'treeArtCat' => $treeArtCat
            );
        }
        return array('treeArtCat' => $treeArtCat);
    }
    public function delAction()
    {
        $id = $this->params()->fromQuery('id');
        $article = $this->getArticleTable()->getArticle($id);


        if($article) {
            $mkdirArticle = 'public/img/admin/article/';
            $properties = $article->properties;
            if($properties['avata']) unlink($mkdirArticle.$properties['avata']);
            if($properties['file']){
                foreach($properties['file'] as $file){
                    unlink($mkdirArticle.$file);
               }
            }
            $this->getArticleTable()->deleteItem($article->id);
        }
        return $this->redirect()->toRoute('adarticle');
        return new ViewModel(array());
    }
}