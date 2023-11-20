<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<div class="container w-75">
    <h1 class="mt-5 mb-4 h2">Categorias</h1>

    <table class="table table-striped table-hover table-bordered mb-4 w-75">
        <thead>
            <tr>
                <th>Categoría</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($categories as $category): ?>
                <tr>
                    <td><?= esc($category['name']); ?></td>
                    <td>
                        <a class="link-warning text-decoration-none" href="<?php echo base_url("categories/edit/{$category['id']}"); ?>">Editar</a> |
                        <a class="link-danger text-decoration-none" href="<?php echo base_url("categories/delete/{$category['id']}"); ?>" onclick="return confirm('¿Seguro que deseas eliminar a <?= esc($category['name']); ?>?');">Eliminar</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <a href="<?php echo site_url('categories/create'); ?>" type="btn" class="btn btn-primary">Agregar</a>
</div>
<?= $this->endSection() ?>