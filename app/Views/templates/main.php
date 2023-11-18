<?php
// Check if there is a message and display the message using JavaScript
if (session()->getFlashdata('message')) {
    echo '<script>alert("' . esc(session()->getFlashdata('message')) . '");</script>';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap">
    <link rel="stylesheet" href="../../assets/styles.css">
    
    <title><?php echo $title ?></title>
</head>
<body>
    <?= $this->renderSection('content') ?>

    <footer class="text-center">
        <hr class="mb-0">
        <section>
            <a class="btn btn-link m-1 text-decoration-none text-dark" href="<?= base_url('Users/index'); ?>">
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
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
