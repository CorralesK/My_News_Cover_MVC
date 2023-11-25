<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UsersModel;

class Users extends BaseController
{
    /**
     * Method to display the form to login.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the login view.
     */
    public function index()
    {
        $session = session();
        $session->destroy();

        $data['title'] = 'Login';

        return view('Auth/index', $data);
    }

    /**
     * Method to authenticate the user.
     *
     * @return \CodeIgniter\HTTP\RedirectResponse Redirects based on the authentication status.
     */
    public function login()
    {
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');

        $userModel = model(UsersModel::class);

        $user = $userModel->where('email', $email)->first();

        if ($user && password_verify($password, $user['password'])) {
            $session = session();
            $session->set('user', $user);

            $redirectURL = ($user['roleId'] == 1) ? 'categories' : '/';
            return redirect()->to(base_url($redirectURL));

        } else {
            return redirect()->to(base_url('signup'));
        }
    }

    /**
     * Method to display the form to sign up.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the sign up view.
     */
    public function signup()
    {
        $data['title'] = 'Sign up';

        return view('Auth/signup', $data);
    }

    /**
     * Method to store a new user.
     *
     * @return \CodeIgniter\HTTP\RedirectResponse Redirects to the appropriate page based on the
     * success or failure of the registration process.
     */
    public function store()
    {
        $userModel = model(UsersModel::class);

        $user = [
            'firstName' => $this->request->getPost('firstName'),
            'lastName' => $this->request->getPost('lastName'),
            'email' => $this->request->getPost('email'),
            'password' => password_hash($this->request->getPost('password'), PASSWORD_BCRYPT),
            'roleId' => 2,
        ];

        if ($this->sendEmail($user)) {
            $userId = $userModel->insert($user);

            if ($userId) {
                $session = session();
                $session->set('user', $userModel->find($userId));

                return redirect()->to(base_url('/'));
            } else {
                return redirect()->to(base_url('login'));
            }
        }
        return redirect()->to(base_url('signup'));
    }

    /**
     * Method to log out the user.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the login page.
     */
    public function logout()
    {
        $session = session();
        $session->destroy();

        return redirect()->to(base_url('login'));
    }

    /**
     * Method to log out the user.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the login page.
     */
    public function sendEmail($user)
    {
        $email = \Config\Services::email();

        $email->setTo($user['email']);
        $email->setFrom('mycorver@gmail.com', 'My Corver');
        $email->setSubject('Confirmación de Registro');
        $email->setMessage('Hola ' . $user['firstName'] . ' ' . $user['lastName'] . ',

Gracias por registrarte en nuestro sitio. Este es un correo electrónico de prueba para fines ilustrativos.

Atentamente,
My News Cover');

        return $email->send();
    }
}
