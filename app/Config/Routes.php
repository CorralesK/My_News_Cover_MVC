<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

//Categories
$routes->get('categories', 'Categories::index');

$routes->get('categories/create', 'Categories::create');
$routes->post('categories/store', 'Categories::store');

$routes->get('categories/edit/(:num)', 'Categories::edit/$1');
$routes->post('categories/update', 'Categories::update');

$routes->get('categories/delete/(:num)', 'Categories::delete/$1');

//News Sources
$routes->get('newsSources', 'NewsSources::index');

$routes->get('newsSources/create', 'NewsSources::create');
$routes->post('newsSources/store', 'NewsSources::store');

$routes->get('newsSources/edit/(:num)', 'NewsSources::edit/$1');
$routes->post('newsSources/update', 'NewsSources::update');

$routes->get('newsSources/delete/(:num)', 'NewsSources::delete/$1');