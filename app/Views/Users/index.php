<?= $this->extend('templates/main') ?>

<?= $this->section('content') ?>
<ul class="nav justify-content-center bg-dark">
  <li class="nav-item">
    <a class="nav-link item text-light" aria-current="page" href="<?php echo base_url("home") ?>">Home</a>
  </li>
  <?php foreach ($categories as $category): ?>
    <li class="nav-item">
      <a class="nav-link item text-light" href="<?php echo base_url("home/{$category['id']}")?>">
        <?php echo $category['name'] ?>
      </a>
    </li>
  <?php endforeach; ?>
</ul>

<div class="container w-75">
    <h1 class="mt-5 mb-4 text-center h2">Su portada exclusiva de noticias</h1>
    <hr class="mt-2 mb-4 border-2">
    <div class="row">
    <?php foreach ($news as $newsItem): ?>
        
        <div class='card shadow m-3 p-0'>
            <a href="<?php echo base_url("{$newsItem['permanlink']}"); ?>" target='_blank'>
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
                <a class="text-dark text-decoration-none" href="<?php echo base_url("{$newsItem['permanlink']}"); ?>" target='_blank'>
                    <h2 class='card-title'><?php echo esc($newsItem['title']); ?></h2>
                </a>
                <p class='card-text'>
                    <?php echo esc($newsItem['description']); ?>...
                </p>
            </div>
            <div class='card-footer pt-0'>
                <a href="<?php echo base_url("{$newsItem['permanlink']}"); ?>" target='_blank' class='card-link'>Leer más</a>
            </div>
        </div>
        
    <?php endforeach ?>
    </div>
</div>
<?= $this->endSection() ?>