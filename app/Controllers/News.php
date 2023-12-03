<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;
use App\Models\NewsModel;
use App\Models\TagsModel;

class News extends BaseController
{
    protected $categoriesModel;
    protected $newsModel;
    protected $tagsModel;
    protected $session;
    protected $data;

    /**
     * Constructor method for the NewsController class.
     * Initializes necessary models and session data.
     */
    public function __construct()
    {
        $this->categoriesModel = model(CategoriesModel::class);
        $this->newsModel = model(NewsModel::class);
        $this->tagsModel = model(TagsModel::class);
        $this->session = session();

        $this->data['title'] = 'My Cover';
        $this->data['categories'] = $this->categoriesModel->getByUser($this->session->get('user')['id']);
        $this->data['tags'] = $this->tagsModel->getTags($this->session->get('user')['id']);
    }

    /**
     * Method to display the home page with the list of news.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function index()
    {
        $this->data['news'] = $this->newsModel->getNews($this->session->get('user')['id']);

        return view('Users/index', $this->data);
    }

    /**
     * Method for displaying the home page with the list of news according to the selected category
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function showBYCategory($categoryID = null)
    {
        $this->data['news'] = $this->newsModel->getNews($this->session->get('user')['id'], $categoryID);

        return view('Users/index', $this->data);
    }

    /**
     * Method to display the home page with the list of news according to the selected tags.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function showBYTags()
    {
        $tagsSelected = $this->request->getPost('tags');
        $this->data['news'] = $this->newsModel->showBYTags($this->session->get('user')['id'], $tagsSelected);

        return view('Users/index', $this->data);
    }

    /**
     * Method to display search results.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function search()
    {
        $word = $this->request->getVar('search');

        $this->data['news'] = $this->newsModel->search($this->session->get('user')['id'], $word);

        if ($this->data['news'] == null) {
            $this->data['error'] = 'No se encontraron resultados para: "' . $word . '"';
        }
        return view('Users/index', $this->data);
    }
}
