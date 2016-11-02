<?php
include ("con_db.php");

try{
	
	
	$connexion = new conDb();
	$connexion->connectDb();


    /* appel d'une procedure stocké sans paramètre*/
	$recup_alertes = "CALL get_alerts()";
	$all_alert = $connexion->bdd->prepare($recup_alertes );
	$all_alert  ->execute();

	/*récupération de toute les données de la table*/
	$tableau_alert= $all_alert ->fetchAll(PDO::FETCH_OBJ);

	echo json_encode($tableau_alert);
	
	/*while($rows= $connexionUser_procedure->fetch()){
	echo $rows['iDtype_alerte']. " " .$rows['nom']."<br/>";
	}*/
	
	
	/*foreach($rows as $rs){
		
	echo $rs['nom']."<br/>";
	break;
	
	}*/
		
		}
catch (Exception $e){
	die("Erreur :" .$e->getMessage());
}

