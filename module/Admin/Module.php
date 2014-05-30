<?php
namespace Admin;

use Zend\ModuleManager\Feature;
use Zend\Loader;
use Zend\EventManager\EventInterface;
use Zend\Mvc\MvcEvent;
use Zend\Mvc\Router\RouteMatch;
use Zend\Session\Container;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\ModuleManager\ModuleManager;
use Admin\Model\Item;
use Admin\Model\ItemTable;
use Admin\Model\Category;
use Admin\Model\CategoryTable;
use Admin\Model\User;
use Admin\Model\UserTable;
use Admin\Model\Order;
use Admin\Model\OrderTable;
use Admin\Model\Detail;
use Admin\Model\OrderDetailTable;

use Admin\Model\Customer;
use Admin\Model\CustomerTable;
use Admin\Model\Article;
use Admin\Model\ArticleTable;
use Admin\Model\ArticleCategory;
use Admin\Model\ArticleCategoryTable;



use Zend\Mvc\Controller\Plugin\Redirect;
/**
 * Module class for Admin
 *
 * @package Admin
 */
class Module implements
    Feature\AutoloaderProviderInterface,
    Feature\ConfigProviderInterface,
    Feature\ServiceProviderInterface,
    Feature\BootstrapListenerInterface
{
    /**
     * @{inheritdoc}
     */
    public function getAutoloaderConfig()
    {
        return array(
            Loader\AutoloaderFactory::STANDARD_AUTOLOADER => array(
                Loader\StandardAutoloader::LOAD_NS => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    /**
     * @{inheritdoc}
     */
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    /**
     * @{inheritdoc}
     */
    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'admin_navigation' => 'Admin\Navigation\Service\AdminNavigationFactory',
                'Admin\Model\ItemTable' =>  function($sm) {
                    $tableGateway = $sm->get('ItemTableGateway');
                    $table = new ItemTable($tableGateway);
                    return $table;
                },
                'ItemTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    return new TableGateway('item', $dbAdapter, null, $resultSetPrototype);
                },
                'Admin\Model\CategoryTable' =>  function($sm) {
                    $tableGateway = $sm->get('CategoryTableGateway');
                    $table = new CategoryTable($tableGateway);
                    return $table;
                },
                'CategoryTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    return new TableGateway('category', $dbAdapter, null, $resultSetPrototype);
                },
                'Admin\Model\UserTable' =>  function($sm) {
                    $tableGateway = $sm->get('UserTableGateway');
                    $table = new UserTable($tableGateway);
                    return $table;
                },
                'UserTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    return new TableGateway('user', $dbAdapter, null, $resultSetPrototype);
                },
                'Admin\Model\OrderTable' =>  function($sm) {
                    $tableGateway = $sm->get('OrderTableGateway');
                    $table = new OrderTable($tableGateway);
                    return $table;
                },
                'OrderTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    return new TableGateway('order', $dbAdapter, null, $resultSetPrototype);
                },
                'Admin\Model\OrderDetailTable' =>  function($sm) {
                    $tableGateway = $sm->get('OrderDetailTableGateway');
                    $table = new OrderDetailTable($tableGateway);
                    return $table;
                },
                'OrderDetailTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    return new TableGateway('order_detail', $dbAdapter, null, $resultSetPrototype);
                },
                /* Thanh Thang: Update 25/12/2013*/
                /* Customer Table*/
                'Admin\Model\CustomerTable' =>  function($sm) {
                    $tableGateway = $sm->get('CustomerTableGateway');
                    $table = new CustomerTable($tableGateway);
                    return $table;
                },
                'CustomerTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Customer());
                    return new TableGateway('customer', $dbAdapter, null, $resultSetPrototype);                    
                },                
                /* ArticleCategory Table*/
                'Admin\Model\ArticleCategoryTable' =>  function($sm) {
                    $tableGateway = $sm->get('ArticleCategoryTableGateway');
                    $table = new ArticleCategoryTable($tableGateway);
                    return $table;
                },
                'ArticleCategoryTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new ArticleCategory());
                    return new TableGateway('article_category', $dbAdapter, null, $resultSetPrototype);                    
                },                                
                /*Thanh Thang: End update 18/02/2014*/
                /* Article Table*/
                'Admin\Model\ArticleTable' =>  function($sm) {
                    $tableGateway = $sm->get('ArticleTableGateway');
                    $table = new ArticleTable($tableGateway);
                    return $table;
                },
                'ArticleTableGateway' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Article());
                    return new TableGateway('article', $dbAdapter, null, $resultSetPrototype);                    
                },
            ),
        );
    }

    /**
     * @{inheritdoc}
     */
    public function onBootstrap(EventInterface $e)
    {
        $app = $e->getParam('application');
        $em  = $app->getEventManager();
        $em->attach(MvcEvent::EVENT_DISPATCH, array($this, 'selectLayoutBasedOnRoute'));
        
    }

    public function authPreDispatch($event) {
    
            //- assemble your own URL - this is just an example
            $url = $event->getRouter()->assemble(array('action' =>'index'), array('name' => 'admin'));
            return $url;
    }
    /**
     * Select the admin layout based on route name
     *
     * @param  MvcEvent $e
     * @return void
     */
    public function selectLayoutBasedOnRoute(MvcEvent $e)
    {
        $app    = $e->getParam('application');
        $sm     = $app->getServiceManager();
        $config = $sm->get('config');

        if (false === $config['admin']['use_admin_layout']) {
            return;
        }

        $match      = $e->getRouteMatch();
        $controller = $e->getTarget();
        if (!$match instanceof RouteMatch
            || 0 !== strpos($match->getMatchedRouteName(), 'ad')
            || $controller->getEvent()->getResult()->terminate()
        ) {
            return;
        }
        
        $layout     = $config['admin']['admin_layout_template'];
        $controller->layout($layout);
        $session = new Container('system');
        if(!isset($session->user) || !$session->user){
            if (isset($_SERVER['HTTP_USER_AGENT']) && (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false)) echo '<script>location=\''.$this->authPreDispatch($e).'\'</script>';
            else  echo '<script type"javascripts">location.href=\''.$this->authPreDispatch($e).'\'</script>'; 
        }else{
             $e->getViewModel()->setVariable('user', $session->user);
        }
    }
}
