<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;
use App\Models\NewsSourcesModel;

class NewsSources extends BaseController
{
    /**
     * Method to display the list of news sources.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the news sources management page.
     */
    public function index()
    {
        $data['title'] = 'Fuentes de Noticias';

        $newsSourcesModel = model(NewsSourcesModel::class);
        $categoriesModel = model(CategoriesModel::class);
        $data['sources'] = $newsSourcesModel->orderBy('name', 'ASC')->findAll();

        foreach ($data['sources'] as &$source) {
            $source['categoryName'] = $categoriesModel->find($source['categoryId'])['name'];
        }

        return view('Users/NewsSources/index', $data);
    }

    /**
     * Method to display the form to add a new news source.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the create news source view.
     */
    public function create()
    {
        $data['title'] = 'Agregar Fuente';

        $categoriesModel = model(CategoriesModel::class);
        $data['categories'] = $categoriesModel->orderBy('name', 'ASC')->findAll();

        return view('Users/NewsSources/createSource', $data);
    }

    /**
     * Method to store a new source.
     *
     * @return \CodeIgniter\HTTP\RedirectResponse Redirects to the source management page.
     */
    public function store()
    {
        $newsSourcesModel = model(NewsSourcesModel::class);
        $session = session();

        $source['url'] = $this->request->getPost('url');
        $source['name'] = $this->request->getPost('name');
        $source['categoryId'] = $this->request->getPost('category');
        $source['userId'] = $session->get('user')['id'];

        if ($newsSourcesModel->insert($source)) {
            $message = "La fuente se ha guardado correctamente.";
        } else {
            $message = "Se ha producido un error al guardar la fuente. Vuelva a intentarlo más tarde.";
        }

        return redirect()->to(base_url('newsSources'))->with('message', $message);
    }

    /**
     * Method to display the form to edit a specific news source.
     *
     * @param int|null $id The ID of the news source to edit.
     *
     * @return \CodeIgniterRedirectResponse|CodeIgniterRedirectResponse Edit or redirect view with error message.
     */
    public function edit($id = null)
    {
        if ($id === null) {
            return redirect()->to(base_url('newsSources'))->with('error', 'ID de Fuente no proporcionado');
        }
        $data['title'] = 'Editar Fuente de Noticias';

        $newsSourcesModel = model(NewsSourcesModel::class);
        $categoriesModel = model(CategoriesModel::class);

        $data['source'] = $newsSourcesModel->find($id);
        $data['categories'] = $categoriesModel->orderBy('name', 'ASC')->findAll();

        if ($data['source'] === null) {
            return redirect()->to(base_url('newsSources'))->with('error', 'Fuente de Noticias no encontrada');
        }

        return view('Users/NewsSources/editSource', $data);
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
        $sourceData['url'] = $this->request->getPost('url');
        $sourceData['name'] = $this->request->getPost('name');
        $sourceData['categoryId'] = $this->request->getPost('category');

        $newsSourcesModel = model(NewsSourcesModel::class);
        if ($newsSourcesModel->update($id, $sourceData)) {
            $message = "La Fuente de Noticias se ha actualizado correctamente.";
        } else {
            $message = "Se ha producido un error al actualizar la Fuente de Noticias. Vuelva a intentarlo más tarde.";
        }

        return redirect()->to(base_url('newsSources'))->with('message', $message);
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
        $newsSourcesModel = model(NewsSourcesModel::class);
        if ($newsSourcesModel->where('id', $id)->delete()) {
            $message = "Fuente de Noticias eliminada exitosamente";
        } else {
            $message = "Se ha producido un error al eliminar la Fuente de Noticias. Vuelva a intentarlo más tarde.";
        }
        return redirect()->to(base_url('newsSources'))->with('message', $message);
    }
}
