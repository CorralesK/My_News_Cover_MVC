<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;
use App\Models\NewsSourcesModel;

class NewsSources extends BaseController
{
    protected $newsSourcesModel;
    protected $categoriesModel;
    protected $session;
    protected $data;

    /**
     * Constructor method for the NewsSourcesController class.
     * Initializes necessary models and session data.
     */
    public function __construct()
    {
        $this->newsSourcesModel = model(NewsSourcesModel::class);
        $this->categoriesModel = model(CategoriesModel::class);
        $this->session = session();

        $this->data['role'] = $this->session->get('user')['roleId'];
        $this->data['categories'] = $this->categoriesModel->getCategories();
        $this->data['sourcesItem'] = 'active';
        $this->data['homeItem'] = '';
    }

    /**
     * Method to display the table of news sources.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the news sources management page.
     */
    public function index()
    {
        $this->data['title'] = 'Fuentes de Noticias';
        $this->data['sources'] = $this->newsSourcesModel->getByUser($this->session->get('user')['id']);

        return view('Users/NewsSources/index', $this->data);
    }

    /**
     * Method to display the form to add a new news source.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the create news source view.
     */
    public function create()
    {
        $this->data['title'] = 'Agregar Fuente';

        return view('Users/NewsSources/createSource', $this->data);
    }

    /**
     * Method to store a new source.
     *
     * @return \CodeIgniter\HTTP\RedirectResponse Redirects to the source management page.
     */
    public function store()
    {
        $source = [
            'url' => $this->request->getPost('url'),
            'name' => $this->request->getPost('name'),
            'categoryId' => $this->request->getPost('category'),
            'userId' => $this->session->get('user')['id'],
        ];

        if ($this->newsSourcesModel->insert($source)) {
            return redirect()->to(base_url('newsSources'))->with('success', "La fuente se ha guardado correctamente.");
        }

        return redirect()->to(base_url('newsSources'))->with('error', "Se ha producido un error al guardar la fuente. Vuelva a intentarlo más tarde.");
    }

    /**
     * Method to display the form to edit a specific news source.
     *
     * @param int|null $id The ID of the news source to edit.
     *
     * @return \CodeIgniterRedirectResponse|CodeIgniterRedirectResponse Edit or redirect view with error success.
     */
    public function edit($id = null)
    {
        if ($id === null) {
            return redirect()->to(base_url('newsSources'))->with('error', 'ID de Fuente no proporcionado');
        }

        $this->data['title'] = 'Editar Fuente de Noticias';
        $this->data['source'] = $this->newsSourcesModel->find($id);

        if ($this->data['source'] === null) {
            return redirect()->to(base_url('newsSources'))->with('error', 'Fuente de Noticias no encontrada');
        }

        return view('Users/NewsSources/editSource', $this->data);
    }

    /**
     * Method to update the information of an existing news source.
     *
     * @param int|null $id The ID of the news source to edit.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the news source management page.
     */
    public function update($id = null)
    {
        $sourceData = [
            'url' => $this->request->getPost('url'),
            'name' => $this->request->getPost('name'),
            'categoryId' => $this->request->getPost('category'),
        ];

        if ($this->newsSourcesModel->update($id, $sourceData)) {
            return redirect()->to(base_url('newsSources'))->with('success', "La Fuente de Noticias se ha actualizado correctamente.");
        }

        return redirect()->to(base_url('newsSources'))->with('error', "Se ha producido un error al actualizar la Fuente de Noticias. Vuelva a intentarlo más tarde.");
    }

    /**
     * Method to delete a news source.
     *
     * @param int|null $id ID of the news source to delete.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the news source management page.
     */
    public function delete($id = null)
    {
        if ($id === null) {
            return redirect()->to(base_url('newsSources'))->with('error', 'ID de Fuente de Noticias no proporcionado');
        }

        if ($this->newsSourcesModel->delete($id)) {
            return redirect()->to(base_url('newsSources'))->with('success', "Fuente de Noticias eliminada exitosamente");
        }

        return redirect()->to(base_url('newsSources'))->with('error', "Se ha producido un error al eliminar la Fuente de Noticias. Vuelva a intentarlo más tarde.");
    }
}
