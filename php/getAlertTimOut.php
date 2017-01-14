<?php
include ("con_db.php");

try{
	
	
	$connexion = new conDb();
	$connexion->connectDb();


    /* appel d'une procedure stocké sans paramètre*/
	$recup_alertes = "CALL showUpdateAlerte()";
	$all_alert = $connexion->bdd->prepare($recup_alertes );
	$all_alert  ->execute();

	/*récupération de toute les données de la table*/
	$tableau_alertUpdate= $all_alert ->fetchAll(PDO::FETCH_OBJ);

	echo json_encode($tableau_alert);
	

		
		}
catch (Exception $e){
	die("Erreur :" .$e->getMessage());
}
