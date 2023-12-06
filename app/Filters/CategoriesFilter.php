<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class CategoriesFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $roleId = session()->get('user')['roleId'];

        if ($roleId != 1 && strpos(uri_string(), 'categories') === 0) {
            return redirect()->to(base_url('login'))->with('error', 'Solo el administrador puede ingresar al área de categorías');
        }

        return;
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {

    }
}
