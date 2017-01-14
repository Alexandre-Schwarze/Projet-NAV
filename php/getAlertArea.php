<?php
include ("con_db.php");

try{
	
	$connexion = new conDb();
	$connexion->connectDb();
	
	/* variable en attente de données*/
	$longitude = $_POST["longitude1"];
	$latitude = $_POST["latitude1"];
	
	$recup_alertes = "CALL get_alertArea('".$longitude."','".$latitude."')";
	$all_alert = $connexion->bdd->prepare($recup_alertes);
	$all_alert->execute();

	$tableau_alertUpdate = $all_alert ->fetchAll();
	
	echo json_encode($tableau_alertUpdate);

} catch (Exception $e){
	die("Erreur :" .$e->getMessage());
}

?>