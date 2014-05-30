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

            $objRequest->properties = $properties;
            $this->getArticleTable()->saveArticle($objRequest);
            return $this->redirect()->toRoute('adarticle');
        }

        /* Edit Article*/
        if (isset($_GET['id'])) {
            $article = $this->getArticleTable()->getArticle($_GET['id']);
            return array(
                'article' => $article,
                'treeArtCat' => $treeArtCat
            );
        }
        return array('treeArtCat' => $treeArtCat);
    }
}