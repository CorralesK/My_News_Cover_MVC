<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<div class="container w-75">
    <h1 class="mt-5 mb-4 h2">Fuentes de Noticias</h1>

    <table class="table table-striped table-hover table-bordered mb-4 w-75">
        <thead>
            <tr>
                <th>URL de la fuente</th>
                <th>Nombre de la fuente</th>
                <th>Categoría</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($sources as $source): ?>
                <tr>
                <td><a href="<?= esc($source['url']); ?>"><?= esc($source['url']); ?></a></td>
                <td><?= esc($source['name']); ?></td>
                <td><?= esc($source['categoryName']); ?></td>
                <td>
                    <a class="text-warning text-decoration-none" href="<?php echo site_url('newsSources/edit/' . $source['id']); ?>">Editar</a> |
                    <a class="text-danger text-decoration-none" href="<?php echo site_url('newsSources/delete/' . $source['id']); ?>" onclick="return confirm('¿Seguro que deseas eliminar a <?= esc($source['name']); ?>?');">Eliminar</a>
                </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <a href="<?php echo site_url('newsSources/create'); ?>" type="btn" class="btn btn-primary">Agregar</a>

</div>
<?= $this->endSection() ?>