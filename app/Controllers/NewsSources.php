<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;
use App\Models\NewsSourcesModel;

class NewsSources extends BaseController
{
    /**
     * Method to display the table of news sources.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the news sources management page.
     */
    public function index()
    {
        $newsSourcesModel = model(NewsSourcesModel::class);
        $categoriesModel = model(CategoriesModel::class);
        $session = session();

        $data = [
            'title'     => 'Fuentes de Noticias',
            'sources'   => $newsSourcesModel->getByUser($session->get('user')['id']),
        ];

        return view('Users/NewsSources/index', $data);
    }

    /**
     * Method to display the form to add a new news source.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the create news source view.
     */
    public function create()
    {
        $categoriesModel = model(CategoriesModel::class);

        $data = [
            'title'         => 'Agregar Fuente',
            'categories'    => $categoriesModel->getCategories(),
        ];

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

        $source = [
            'url'           => $this->request->getPost('url'),
            'name'          => $this->request->getPost('name'),
            'categoryId'    => $this->request->getPost('category'),
            'userId'        => $session->get('user')['id'],
        ];

        updateNews();

        if ($newsSourcesModel->insert($source)) {
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

        $newsSourcesModel = model(NewsSourcesModel::class);
        $categoriesModel = model(CategoriesModel::class);

        $data = [
            'title'         => 'Editar Fuente de Noticias',
            'source'        => $newsSourcesModel->find($id),
            'categories'    => $categoriesModel->getCategories(),
        ];

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
        $sourceData = [
            'url'           => $this->request->getPost('url'),
            'name'          => $this->request->getPost('name'),
            'categoryId'    => $this->request->getPost('category'),
        ];

        $newsSourcesModel = model(NewsSourcesModel::class);

        if ($newsSourcesModel->update($id, $sourceData)) {
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

        $newsSourcesModel = model(NewsSourcesModel::class);

        if ($newsSourcesModel->delete($id)) {
            return redirect()->to(base_url('newsSources'))->with('success', "Fuente de Noticias eliminada exitosamente");
        }
        return redirect()->to(base_url('newsSources'))->with('error', "Se ha producido un error al eliminar la Fuente de Noticias. Vuelva a intentarlo más tarde.");
    }

    /**
     * Method to run the cronjob.
     */
    public function updateNews() {
        $filePath = 'C:/xampp/htdocs/mynewscover.com/My_News_Cover_MVC/cronjob/newsgrabber.php';
        $command = "php $filePath";
        shell_exec($command);
    }
}
