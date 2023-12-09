<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;
use App\Models\NewsModel;
use App\Models\NewsSourcesModel;
use App\Models\TagsModel;

class News extends BaseController
{
    protected $categoriesModel;
    protected $sourcesModel;
    protected $newsModel;
    protected $tagsModel;
    protected $session;
    protected $userId;
    protected $data;

    /**
     * Constructor method for the NewsController class.
     * Initializes necessary models and session data.
     */
    public function __construct()
    {
        $this->categoriesModel = model(CategoriesModel::class);
        $this->sourcesModel = model(NewsSourcesModel::class);
        $this->newsModel = model(NewsModel::class);
        $this->tagsModel = model(TagsModel::class);

        $this->session = session();
        $this->userId = $this->session->get('user')['id'];

        $this->data['title'] = 'My Cover';
        $this->data['categories'] = $this->categoriesModel->getByUser($this->userId);
        $this->data['tags'] = $this->tagsModel->getTags($this->userId);
        $this->data['isPublic'] = $this->session->get('user')['public'];

        if(isset($this->session->get('user')['roleId'])){
            $this->data['role'] = $this->session->get('user')['roleId'];
        }

        if(isset($this->session->get('user')['publishURL'])){
            $this->data['publishURL'] = $this->session->get('user')['publishURL'];
        }

        $this->data['sourcesItem'] = '';
        $this->data['homeItem'] = 'active';
        $this->data['activeCategory'] = '';
    }

    /**
     * Method to display the home page with the list of news.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function index()
    {
        if (!$this->sourcesModel->hasNewsSources($this->userId)) {
            return redirect()->to(base_url('newsSources/create'));
        }

        $this->data['activeCategory'] = 0;

        $this->data['news'] = $this->newsModel->getNews($this->userId);
        return view('Users/index', $this->data);
    }

    /**
     * Method for displaying the home page with the list of news according to the selected category
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page.
     */
    public function showBYCategory($categoryID = null)
    {
        $this->data['news'] = $this->newsModel->getNews($this->userId, $categoryID);

        $this->data['activeCategory'] = $categoryID;

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
        $this->data['news'] = $this->newsModel->showBYTags($this->userId, $tagsSelected);

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

        $this->data['news'] = $this->newsModel->search($this->userId, $word);

        if ($this->data['news'] == null) {
            $this->data['error'] = 'No se encontraron resultados para: "' . $word . '"';
        }
        return view('Users/index', $this->data);
    }
}
