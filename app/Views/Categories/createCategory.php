<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<div class="container w-75">
    <h1 class="mt-5 mb-4 h2">Agregar Categoría</h1>

    <form method="post" action="<?php echo base_url('categories/store'); ?>" class="w-50">
        <div class="form-group mb-4">
            <label for="name">Nombre</label>
            <input type="text" id="name" class="form-control" name="name" placeholder="Enter the name" required>
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
        <a href="<?php echo base_url('categories'); ?>" type="btn" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
<?= $this->endSection() ?>