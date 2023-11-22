<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

 //Users
$routes->get('login', 'Users::index');
$routes->post('auth/login', 'Users::login');

$routes->get('signup', 'Users::signup');
$routes->post('auth/store', 'Users::store');

$routes->get('logout', 'Users::logout');

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
$routes->post('newsSources/update/(:num)', 'NewsSources::update/$1');

$routes->get('newsSources/delete/(:num)', 'NewsSources::delete/$1');