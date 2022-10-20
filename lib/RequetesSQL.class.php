<?php

/**
 * Classe des requêtes SQL 
 *
 */
class RequetesSQL extends RequetesPDO {
    
  /**
   * Récupération de tous les livres de la table livre  
   * @return array
   */ 
  public function getLivres()
  {
    $this->sql = 'SELECT livre_id, livre_titre, livre_annee, livre_resume, auteur_nom, auteur_prenom 
                  FROM livre 
                  INNER JOIN auteur on auteur_id = livre_auteur_id
                  ORDER BY livre_id ASC';
    return $this->getLignes();
  }

  /**
   * Récupération d'un livre de la table livre à partir de son id 
   * @param int $id   
   * @return array or boolean false (si aucun résultat)
   */ 
  public function getLivre($livre_id)
  {
    $this->sql = 'SELECT livre_id, livre_titre, livre_annee, livre_resume, auteur_nom, auteur_prenom 
                  FROM livre 
                  INNER JOIN auteur ON auteur_id = livre_auteur_id
                  WHERE livre_id = :livre_id';
    return $this->getLignes(['livre_id' => $livre_id], RequetesPDO::UNE_SEULE_LIGNE);    
  }
  
  
}