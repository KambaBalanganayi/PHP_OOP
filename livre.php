<?php

try{
  require "includes/ChargementClasses.inc.php";
  require "includes/connexionPDO.inc.php";
  $oReq = new RequetesSQL();
  $livre_id = $_GET["livre_id"] ?? null;
  $livre = $oReq->getLivre($livre_id);
  if ($livre === false) throw new Exception("Livre inexistant");

}catch(Exception $e){
  echo $e->getMessage();
  exit;
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title><?php $livre["livre_titre"]?></title>
  <meta name="robots" content="noindex, nofollow">
  <link rel="stylesheet" type="text/css" href="css/styles.css">
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
      <h1><?php $livre["livre_titre"]?></h1>
      <div>
        <div class="info">
          <ul>
            <li>De <?= $livre["auteur_prenom"]." ". $livre["auteur_nom"]?></li>
            <li>Publié en <?= $livre["livre_annee"]?></li>
          </ul>
          <hr>
          <p><?= $livre["livre_resume"]?></p>
        </div>
      </div>  
    </section>
  </main>
</body>
</html>