<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4 border border-secondary-subtle mt-5 rounded-3 bg-light shadow">

            <h1 class="mt-3 mb-4 text-center h2">Registro</h1>

            <form method="post" action="<?php echo base_url('auth/store'); ?>">
                <div class="form-group mb-2">
                    <label for="inputFirstName" class="form-label">Primer nombre</label>
                    <input type="text" class="form-control" id="inputFirstName" name="firstName" placeholder="Enter your first name" required>
                </div>
                <div class="form-group mb-2">
                    <label for="inputLastName" class="form-label">Apellido</label>
                    <input type="text" class="form-control" id="inputLastName" name="lastName" placeholder="Enter your last name" required>
                </div>
                <div class="form-group mb-2">
                    <label for="inputEmail" class="form-label">Correo</label>
                    <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group mb-3">
                    <label for="inputPassword" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" minlength="8" placeholder="Enter your password" required>
                </div>
                <div class="form-group text-center d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Registrarse</button>
                </div>
                <div class="form-group mb-3 text-center">
                    <p>¿Ya tiene una cuenta? <a href="<?php echo base_url('login'); ?>" class="btn btn-link">Iniciar Sesión</a></p>
                </div>
            </form>
        </div>
    </div>
</div>
<?= $this->endSection() ?>