<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<div class="container w-75">
    <h1 class="mt-5 mb-4 h2">Agregar Fuente</h1>

    <form method="post" action="<?php echo base_url('newsSources/store'); ?>" class="w-50">
        <div class="form-group mb-2">
            <label for="name">Nombre de la fuente</label>
            <input type="text" id="name" class="form-control" name="name" placeholder="Enter the name" required>
        </div>

        <div class="form-group mb-2">
            <label for="url">RSS URL</label>
            <input type="text" id="url" class="form-control" name="url" placeholder="Enter the url" required>
        </div>

        <div class="form-group mb-4">
            <label for="category">Categoría</label>
            <select id="category" class="form-control" name="category" required>
            <?php
            foreach ($categories as $category) {
                echo "<option value=\"{$category['id']}\"> {$category['name']} </option>";
            }
            ?>
            </select>
        </div>

        <button type="submit" class="btn btn-primary"> Guardar </button>
        <a href="<?php echo base_url('newsSources'); ?>" type="btn" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
<?= $this->endSection() ?>