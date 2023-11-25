<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CategoriesModel;

class Categories extends BaseController
{
    /**
     * Method to display the list of news categories.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the category management page.
     */
    public function index()
    {
        $data['title'] = 'Categorias de Noticias';

        $categoriesModel = model(CategoriesModel::class);
        $data['categories'] = $categoriesModel->orderBy('name', 'ASC')->findAll();

        return view('Categories/index', $data);
    }

    /**
     * Method to display the form to add a new category.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the add category view.
     */
    public function create()
    {
        $data['title'] = 'Agregar Categoría';

        return view('Categories/createCategory', $data);
    }

    /**
     * Method to store a new category.
     *
     * @return \CodeIgniter\HTTP\RedirectResponse Redirects to the category management page.
     */
    public function store()
    {
        $categoriesModel = model(CategoriesModel::class);

        $category['name'] = $this->request->getPost('name');

        if ($categoriesModel->insert($category)) {
            $message = "La categoría se ha guardado correctamente.";
        } else {
            $message = "Se ha producido un error al guardar la categoría. Vuelva a intentarlo más tarde.";
        }

        return redirect()->to(base_url('categories'))->with('message', $message);
    }

    /**
     * Method to display the form to edit a specific category.
     *
     * @param int|null $id The ID of the category to edit.
     *
     * @return \CodeIgniterRedirectResponse|CodeIgniterRedirectResponse Edit or redirect view with error message.
     */
    public function edit($id = null)
    {
        if ($id === null) {
            return redirect()->to(base_url('categories'))->with('message', 'ID de categoría no proporcionado');
        }
        $data['title'] = 'Editar Categoría';

        $categoriesModel = model(CategoriesModel::class);
        $data['category'] = $categoriesModel->find($id);

        if ($data['category'] === null) {
            return redirect()->to(base_url('categories'))->with('message', 'Categoría no encontrada');
        }

        return view('categories/editCategory', $data);
    }

    /**
     * Method to update the information of an existing category.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the category management page.
     */
    public function update()
    {
        $categoriesModel = model(CategoriesModel::class);

        $categoryId = $this->request->getPost('id');
        $categoryData['name'] = $this->request->getPost('name');

        if ($categoriesModel->update($categoryId, $categoryData)) {
            $message = "La categoría se ha actualizado correctamente.";
        } else {
            $message = "Se ha producido un error al actualizar la categoría. Vuelva a intentarlo más tarde.";
        }

        return redirect()->to(base_url('categories'))->with('message', $message);
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
            return redirect()->to(base_url('categories'))->with('message', 'ID de categoría no proporcionado');
        }
        $categoriesModel = model(CategoriesModel::class);
        
        try {
            $categoriesModel->delete($id);
            return redirect()->to(base_url('categories'))->with('message', 'Categoría eliminada exitosamente.');

        } catch (\Exception $e) {
            return redirect()->to(base_url('categories'))->with('message', $e->getMessage());
        }
    }
}
