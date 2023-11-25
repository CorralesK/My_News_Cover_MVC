<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\NewsModel;
use App\Models\CategoriesModel;

class News extends BaseController
{
    /**
     * Method to display the home page with the list of news.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function index()
    {
        $newsModel = model(NewsModel::class);
        $categoriesModel = model(CategoriesModel::class);
        $session = session();

        $data = [
            'title'         => 'My Cover',
            'news'          => $newsModel->getNews($session->get('user')['id']),
            'categories'    => $categoriesModel->getByUser($session->get('user')['id']),
        ];        

        return view('Users/index', $data);
    }

    /**
     * Method to display the home page with the list of news.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function showBYCategory($categoryID = null)
    {
        $newsModel = model(NewsModel::class);
        $categoriesModel = model(CategoriesModel::class);
        $session = session();

        $data = [
            'title'         => 'My Cover',
            'news'          => $newsModel->getNews($session->get('user')['id'], $categoryID),
            'categories'    => $categoriesModel->getByUser($session->get('user')['id']),
        ];        
        
        return view('Users/index', $data);
    }
}
