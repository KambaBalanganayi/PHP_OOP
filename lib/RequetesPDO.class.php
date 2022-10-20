<?php

/**
 * Classe des requêtes PDO 
 *
 */
class RequetesPDO {

  protected $sql;

  const UNE_SEULE_LIGNE = true;

  /**
   * Requête $sql SELECT de récupération d'une ou plusieurs lignes
   * @param array   $params paramètres de la requête préparée
   * @param boolean $uneSeuleLigne true si une seule ligne à récupérer false sinon 
   * @return array or boolean false (si aucun résultat avec uneSeuleLigne à true)
   */ 
  public function getLignes($params = [], $uneSeuleLigne = false) {
    global $oPDO;
    $oPDOStatement = $oPDO->prepare($this->sql);
    
    // solution 1 : utilisatin de bindParam
    // ====================================
    // $nomsParams = array_keys($params);
    // foreach ($nomsParams as $nomParam) $oPDOStatement->bindParam(':'.$nomParam, $params[$nomParam]);

    // solution 2 : utilisation de bindValue
    // ===================================== 
    foreach ($params as $nomParam => $valParam) $oPDOStatement->bindValue(':'.$nomParam, $valParam);

    $oPDOStatement->execute();
    $result = $uneSeuleLigne ? $oPDOStatement->fetch(PDO::FETCH_ASSOC) : $oPDOStatement->fetchAll(PDO::FETCH_ASSOC);
    return $result;
  }
}