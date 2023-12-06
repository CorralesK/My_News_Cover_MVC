<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="<?= base_url('/css/styles.css')?>">
    
    <title><?php echo $title ?></title>
</head>
<body>
    <header class="header bn-primary">
        <div class="container d-flex align-items-center justify-content-between">
            <a href="<?=base_url('home')?>" class="logo m-2">
                <img src="<?=base_url('img/logo.png')?>" alt="My News Cover" class="img-fluid" style="max-height: 3em;">
            </a>

            <?php if (isset($role)): ?>
                <div class="dropdown text-end m-2">
                    <a href="#" class="d-block link-body-emphasis text-decoration-none text-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                        </svg>
                    </a>
                    <ul class="dropdown-menu text-small dropdown-menu-dark user">
                        <?php if ($role == 1): ?>
                            <li><a class="dropdown-item active" href="<?=base_url('categories')?>">Categorias</a></li>
                        <?php else: ?>
                            <li><a class="dropdown-item" href="<?=base_url('home')?>">My Cover</a></li>
                            <li><a class="dropdown-item" href="<?=base_url('newsSources')?>">Fuentes de Noticias</a></li>
                        <?php endif;?>
                        <?php if (isset($isPublic)): ?>
                            <li>
                                <form id="publishForm" action="<?= base_url('publish') ?>" method="post" class="dropdown-item">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" name="publish" type="checkbox" id="flexSwitchCheckDefault" <?= $isPublic ? 'checked' : '' ?> onchange="document.getElementById('publishForm').submit();">
                                        <label class="form-check-label text-light" for="flexSwitchCheckDefault">Portada pública</label>
                                    </div>
                                </form>
                                <?php if (isset($publishURL)): ?>
                                <div class="input-group">
                                    <span class="overflow-x-scroll text-light" id="urlContainer"> <?= esc($publishURL) ?> </span>
                                    <button class="btn btn-outline-secondary input-group-text" type="submit" id="copy-btn">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1z"/>
                                        </svg>
                                    </button>
                                </div>
                                <?php endif?>
                            </li>
                        <?php endif;?>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<?=base_url('logout')?>">Cerrar Sesión</a></li>
                    </ul>
                </div>
            <?php endif;?>
        </div>
    </header>
    
    <div>
        <?php if(session()->getFlashdata('error')):?>
            <div class="alert alert-danger"><?= esc(session()->getFlashdata('error')); ?></div>
        <?php endif ?>

        <?php if(session()->getFlashdata('success')):?>
            <div class="alert alert-success"><?= esc(session()->getFlashdata('success')); ?></div>
        <?php endif ?>
    </div>
    
    <?= $this->renderSection('content') ?>

    <footer class="text-center">
        <hr class="mb-0">
        <section>
            <a class="btn btn-link m-1 text-decoration-none text-dark" href="<?= base_url('home'); ?>">
                <i>My Cover</i>
            </a> |
            <a class="btn btn-link m-1 text-decoration-none text-dark" href="<?= base_url('about'); ?>">
                <i>About</i>
            </a>
        </section>
        <div class="text-center text-dark pb-2">
            © <?= date('Y'); ?> My News Cover
        </div>
    </footer>
    
    <script src="<?= base_url('js/main.js') ?>"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
