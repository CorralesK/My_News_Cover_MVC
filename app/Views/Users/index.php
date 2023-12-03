<?=$this->extend('templates/main')?>

<?=$this->section('content')?>
<nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container w-75">

    <ul class="nav nav-underline">
        <li class="nav-item">
            <a class="nav-link text-light" aria-current="page" href="<?php echo base_url("home") ?>">Home</a>
        </li>
        <?php foreach ($categories as $category): ?>
        <li class="nav-item">
        <a class="nav-link text-light" href="<?php echo base_url("home/{$category['id']}") ?>">
            <?php echo $category['name'] ?>
        </a>
        </li>
        <?php endforeach;?>
    </ul>

    <form class="d-flex input-group w-25" role="search" action="<?php echo base_url("home/search") ?>">
        <input type="search" class="form-control" name="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success input-group-text" type="submit">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
            </svg>
        </button>
    </form>
  </div>
</nav>

<div class="container w-75">
    <h1 class="mt-5 mb-4 text-center h2">Su portada exclusiva de noticias</h1>
    <hr class="mt-2 mb-4 border-2">

    <form action="<?= base_url('home/tags') ?>" method="post">
        <div class="d-flex">
            <div class="wrapper">
                <div class="icon"><i id="left" class="fa-solid fa-angle-left"></i></div>
                <div class="tabs-box">
                    <?php foreach ($tags as $tag): ?>
                        <div class="tab m-2">
                            <input type="checkbox" class="btn-check" name="tags[]" id="btn-check-<?= $tag['id'] ?>" value="<?= $tag['id'] ?>" autocomplete="off">
                            <label class="btn" for="btn-check-<?= $tag['id'] ?>"><?= $tag['name'] ?></label>
                        </div>
                    <?php endforeach; ?>
                </div>
                <div class="icon"><i id="right" class="fa-solid fa-angle-right"></i></div>
            </div>
            <div class="btn-box mt-2">
                <button type="submit" class="btn btn-secondary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
                        <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2z"/>
                    </svg> Filtrar
                </button>
            </div>
        </div>
    </form>

    <div class="row mt-4">
        <?php if (isset($error)): ?>
            <p><?php echo $error; ?></p>
        <?php endif?>

        <?php foreach ($news as $newsItem): ?>
            <div class='card shadow m-3 p-0'>
                <a href="<?php echo esc($newsItem['permanlink']); ?>" target='_blank'>
                    <img src="<?php echo esc($newsItem['img']); ?>" class='card-img-top' alt='...'>
                </a>
                <div class='card-body pb-2'>
                    <div class="d-flex justify-content-between">
                        <p class='card-text mb-2'>
                            <?php echo esc($newsItem['date']); ?>
                        </p>
                        <p class='card-text mb-0'>
                            <?php echo esc($newsItem['category']); ?>
                        </p>
                    </div>
                    <a class="text-dark text-decoration-none" href="<?php echo esc($newsItem['permanlink']); ?>" target='_blank'>
                        <h2 class='card-title'><?php echo esc($newsItem['title']); ?></h2>
                    </a>
                    <p class='card-text'>
                        <?php echo esc($newsItem['description']); ?>...
                    </p>
                </div>
                <div class='card-footer pt-0'>
                    <a href="<?php echo esc($newsItem['permanlink']); ?>" target='_blank' class='card-link'>Leer más</a>
                </div>
            </div>
        <?php endforeach?>
    </div>
</div>
<?=$this->endSection()?>