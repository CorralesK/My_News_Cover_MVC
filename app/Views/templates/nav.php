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

    <form id="publishForm" action="<?= base_url('publish') ?>" method="post">
        <div class="form-check form-switch">
            <input class="form-check-input" name="publish" type="checkbox" id="flexSwitchCheckDefault" <?= $isPublic ? 'checked' : '' ?> onchange="document.getElementById('publishForm').submit();">
            <label class="form-check-label text-light" for="flexSwitchCheckDefault">Portada pública</label>
        </div>
    </form>
    <?php if (isset($publishURL)): ?>
    <div class="input-group">
        <span class="overflow-x-scroll text-light w-25" id="urlContainer"> <?= esc($publishURL) ?> </span>
        <button class="btn btn-outline-secondary input-group-text" type="submit" id="copy-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1z"/>
            </svg>
        </button>
    </div>
    <?php endif?>

  </div>
</nav>