<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container w-75">
    <ul class="nav nav-underline">
        <li class="nav-item">
            <a class="nav-link text-light" aria-current="page" href="<?php echo base_url("home") ?>">Home</a>
        </li>
        <?php foreach ($categories as $category): ?>
        <li class="nav-item">
        <a class="nav-link text-light" href="<?php echo base_url("home/{$category['id']}")?>">
            <?php echo $category['name'] ?>
        </a>
        </li>
        <?php endforeach; ?>
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
    <div class="row">
        <?php if(isset($error)): ?>
            <p><?php echo $error; ?></p>
        <?php endif ?>
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
        
    <?php endforeach ?>
    </div>
</div>
<?= $this->endSection() ?>