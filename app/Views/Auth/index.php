<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4 border border-secondary-subtle mt-5 rounded-3 bg-light shadow">

            <h1 class="mt-3 mb-4 text-center h2">Iniciar Sesión</h1>

            <form method="post" action="<?php echo base_url('auth/login'); ?>">
                <div class="form-group mb-2">
                    <label for="email" class="form-label">Correo</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group mb-2">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" minlength="8" placeholder="Enter your password" required>
                </div>
                <div class="form-group mb-3 text-center d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                </div>
                <div class="form-group mb-3 text-center">
                    <p>¿No tiene cuenta? <a href="<?php echo base_url('signup'); ?>" class="btn btn-link">Registrarse</a></p>
                </div>
            </form>
        </div>
    </div>
</div>
<?= $this->endSection() ?>