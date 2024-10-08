<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UsersModel;

class Users extends BaseController
{
    protected $userModel;
    protected $session;

    /**
     * Constructor method for the CategoriesController class.
     * Initializes necessary models and session data.
     */
    public function __construct()
    {
        $this->userModel = model(UsersModel::class);
        $this->session = session();
    }

    /**
     * Method to display the form to login.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the login view.
     */
    public function index()
    {
        $this->session->destroy();

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
        $validationRules = [
            'email' => 'required|valid_email',
            'password' => 'required|min_length[8]',
        ];

        if ($this->validate($validationRules)) {
            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');

            $user = $this->userModel->where('email', $email)->first();

            if ($user && password_verify($password, $user['password'])) {
                $this->session->set('user', $user);

                $redirectURL = ($user['roleId'] == 1) ? 'categories' : 'home';
                return redirect()->to(base_url($redirectURL));
            }
        }
        return redirect()->to(base_url('login'))->with('error', 'Correo o contraseña incorrectos');
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
        $existingUser = $this->userModel->where('email', $this->request->getPost('email'))->first();

        if ($existingUser) {
            return redirect()->to(base_url('signup'))->with('error', 'El usuario ya existe');
        }

        $user = [
            'firstName' => $this->request->getPost('firstName'),
            'lastName' => $this->request->getPost('lastName'),
            'email' => $this->request->getPost('email'),
            'password' => password_hash($this->request->getPost('password'), PASSWORD_BCRYPT),
            'roleId' => 2,
        ];

        if ($this->sendEmail($user)) {
            $userId = $this->userModel->insert($user);

            if ($userId) {
                $this->session->set('user', $this->userModel->find($userId));

                return redirect()->to(base_url('home'));
            }
        }
        return redirect()->to(base_url('signup'))->with('error', 'Se ha producido un error al registrar el usuario. Vuelva a intentarlo.');
    }

    /**
     * Method to log out the user.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the login page.
     */
    public function logout()
    {
        $this->session->destroy();

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

    /**
     * Method for managing the process of making a user's news cover public.
     *
     * @return \CodeIgniterHTTP\RedirectResponse Redirects to the home page after the update.
     */
    public function publish()
    {
        $userId = $this->session->get('user')['id'];

        $user = $this->userModel->where('id', $userId)->first();

        if ($this->request->getPost('publish')) {

            $this->userModel->update($userId, ['public' => 1]);
            $user['publishURL'] = base_url("users/" . base64_encode($user['email']));
            $user['public'] = 1;

        } else {
            $this->userModel->update($userId, ['public' => 0]);
            $user['public'] = 0;
        }

        $this->session->set('user', $user);
        return redirect()->to(base_url('home'));
    }

    /**
     * Method to redirect to the public home page of a specific user.
     *
     * @param string $encryptedEmail The encrypted email parameter.
     * @throws \CodeIgniterExceptionsPageNotFoundException If the user is not found or the news cover page is private.
     */
    public function userCoverPublic($encryptedEmail)
    {
        $email = base64_decode($encryptedEmail);

        $userData = $this->userModel->where(['email' => $email, 'public' => 1])->first();

        if ($userData) {
            unset($userData['roleId']);

            $this->session->set('user', $userData);

            return redirect()->to(base_url('home'));
            
        } else {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }
}
