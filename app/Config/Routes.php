<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

$routes->get('categories', 'Categories::index');

$routes->get('categories/add', 'Categories::addCategory');
$routes->post('categories/store', 'Categories::storeCategory');

$routes->get('categories/edit/(:num)', 'Categories::editCategory/$1');
$routes->post('categories/update', 'Categories::updateCategory');

$routes->get('categories/delete/(:num)', 'Categories::deleteCategory/$1');