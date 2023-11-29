<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;
use App\Models\NewsModel;

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

    /**
     * Method to display search results.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function search()
    {
        $newsModel = model(NewsModel::class);
        $categoriesModel = model(CategoriesModel::class);
        $session = session();

        $word = $this->request->getVar('search');
        
        $data = [
            'title'         => 'My Cover',
            'news'          => $newsModel->search($session->get('user')['id'], $word),
            'categories'    => $categoriesModel->getByUser($session->get('user')['id']),
        ];

        if ($data['news'] == null) {
            $data['error'] = 'No se encontraron resultados para: "' . $word . '"';
        }
        return view('Users/index', $data);
    }
}
