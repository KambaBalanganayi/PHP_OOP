<?php

try{
  require "includes/ChargementClasses.inc.php";
  require "includes/connexionPDO.inc.php";
  $oReq = new RequetesSQL();
  $livres = $oReq->getLivres();

}catch(Exception $e){
  echo $e->getMessage();
  exit;
}


?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <title>Livres</title>
  <link rel="stylesheet" type="text/css" href="css/styles.css?v=1.1">
</head>

<body>
  <header>
    <nav>
      <ul>
        <li><a href="index.php">Livres</a></li>
      </ul>
    </nav>
  </header>
  <main>
    <section>
      <h1>LIVRES</h1>
      <div>
        <?php foreach ($livres as $livre) :?> 
          <a href="livre.php?livre_id=<?= $livre["livre_id"]?>">
          <article>
            <h3><?= $livre["livre_titre"]?></h3>
            <p><?= $livre["auteur_prenom"]." ". $livre["auteur_nom"]?></p>
          </article>
        </a>
      <?php endforeach ?>

      </div>
    </section>
  </main>
</body>
</html>