<?php
//class dont on a besoin (classe Repository.php obligatoire)
require_once(ROOT . "/model/repository/Repository.php");
require_once(ROOT . "/model/entity/Profil.php");

class ProfilRepository extends Repository
{
    //(requête permettant d'obtenir tous les types de frais
    public function getLesProfils()
    {
        $lesProfils = array();
        $db = $this->dbConnect();
        $req = $db->prepare("SELECT id, libelle FROM profil order by libelle");
        $req->execute();
        $lesEnregs = $req->fetchAll();
        foreach ($lesEnregs  as $enreg) {
            $unProfil = new Profil(
                $enreg->id,
                $enreg->libelle,
            );
            array_push($lesProfils, $unProfil);
        }
        return $lesProfils;
    }
    
}
