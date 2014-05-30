<?php

return array(
    'controllers' => array(
        'invokables' => array(
            'Admin\Controller\Admin' => 'Admin\Controller\AdminController',
            'Admin\Controller\Item' => 'Admin\Controller\ItemController',
            'Admin\Controller\Category' => 'Admin\Controller\CategoryController',
            'Admin\Controller\Order' => 'Admin\Controller\OrderController',
            'Admin\Controller\Customer' => 'Admin\Controller\CustomerController',
            'Admin\Controller\ArticleCategory' => 'Admin\Controller\ArticleCategoryController',
            'Admin\Controller\Article' => 'Admin\Controller\ArticleController',
            
        ),
    ),
    'admin' => array(
        'use_admin_layout'      => true,
        'admin_layout_template' => 'layout/admin',
    ),

    'navigation' => array(
        'admin' => array(),
        'itm' => array(),
    ),

    'router' => array(
        'routes' => array(
            'admin' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/admin[/]',
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Admin',
                        'action'     => 'index',
                    ),
                ),
            ),
            'aditm' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/admin/itm[/][:action[/]][/page/:page]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'page'   => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Item',
                        'action'     => 'index',
                    ),
                ),
            ),
            'adcat' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/admin/cat[/][:action][/page/:page]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'page'   => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Category',
                        'action'     => 'index',
                    ),
                ),
            ),
            'adord' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/admin/ord[/][:action][/page/:page]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'page'   => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Order',
                        'action'     => 'index',
                    ),
                ),
            ),
            /*Thanh Thang update 25/12/2013*/
            'adcus' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/admin/cus[/][:action][/page/:page]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'page'   => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Customer',
                        'action'     => 'index',
                    ),
                ),
            ),
            /* Article */
            'adarticle' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/admin/article[/][:action][/page/:page]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'page'   => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Article',
                        'action'     => 'index',
                    ),
                ),
            ),
            /*Article Category*/
            'adartCat' => array(
                'type' => 'Segment',
                'options' => array(
                    'route'    => '/admin/artCat[/][:action][/page/:page]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'page'   => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Admin\Controller\ArticleCategory',
                        'action'     => 'index',
                    ),
                ),
            ),
            /*Thanh Thang: End update */
        ),
    ),

    

    'view_manager' => array(
        'template_map' => array(
            'partial/pagination'  => __DIR__ . '/../view/partial/pagination.phtml',
            'partial/result_not_found'  => __DIR__ . '/../view/partial/result_not_found.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view'
        ),
    ),
);
