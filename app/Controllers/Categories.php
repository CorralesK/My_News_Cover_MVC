<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;

class Categories extends BaseController
{
    protected $categoriesModel;
    protected $session;
    protected $data;

    /**
     * Constructor method for the CategoriesController class.
     * Initializes necessary models and session data.
     */
    public function __construct()
    {
        $this->categoriesModel = model(CategoriesModel::class);
        $this->session = session();

        $this->data['role'] = $this->session->get('user')['roleId'];
    }

    /**
     * Method to display the list of news categories.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the category management page.
     */
    public function index()
    {
        $this->data['title'] = 'Categorias de Noticias';
        $this->data['categories'] = $this->categoriesModel->getCategories();

        return view('Categories/index', $this->data);
    }

    /**
     * Method to display the form to add a new category.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the add category view.
     */
    public function create()
    {
        $this->data['title'] = 'Agregar Categoría';

        return view('Categories/createCategory', $this->data);
    }

    /**
     * Method to store a new category.
     *
     * @return \CodeIgniter\HTTP\RedirectResponse Redirects to the category management page.
     */
    public function store()
    {
        $category['name'] = $this->request->getPost('name');

        if ($this->categoriesModel->insert($category)) {
            return redirect()->to(base_url('categories'))->with('success', "La categoría se ha guardado correctamente.");
        }

        return redirect()->to(base_url('categories'))->with('error', "Se ha producido un error al guardar la categoría. Vuelva a intentarlo más tarde.");
    }

    /**
     * Method to display the form to edit a specific category.
     *
     * @param int|null $id The ID of the category to edit.
     *
     * @return \CodeIgniterRedirectResponse|CodeIgniterRedirectResponse Edit or redirect view with error success.
     */
    public function edit($id = null)
    {
        if ($id === null) {
            return redirect()->to(base_url('categories'))->with('error', 'ID de categoría no proporcionado');
        }

        $this->data['title'] = 'Editar Categoría';
        $this->data['category'] = $this->categoriesModel->find($id);

        if ($this->data['category'] === null) {
            return redirect()->to(base_url('categories'))->with('error', 'Categoría no encontrada');
        }

        return view('categories/editCategory', $this->data);
    }

    /**
     * Method to update the information of an existing category.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the category management page.
     */
    public function update()
    {
        $categoryId = $this->request->getPost('id');
        $categoryData['name'] = $this->request->getPost('name');

        if ($this->categoriesModel->update($categoryId, $categoryData)) {
            return redirect()->to(base_url('categories'))->with('success', "La categoría se ha actualizado correctamente.");
        }

        return redirect()->to(base_url('categories'))->with('error', "Se ha producido un error al actualizar la categoría. Vuelva a intentarlo más tarde.");
    }

    /**
     * Method to delete a category.
     *
     * @param int|null $id ID of the category to delete.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the category management page.
     */
    public function delete($id = null)
    {
        if ($id === null) {
            return redirect()->to(base_url('categories'))->with('error', 'ID de categoría no proporcionado');
        }

        try {
            $this->categoriesModel->delete($id);
            return redirect()->to(base_url('categories'))->with('success', 'Categoría eliminada exitosamente.');

        } catch (\Exception $e) {
            return redirect()->to(base_url('categories'))->with('error', $e->getsuccess());
        }
    }
}
