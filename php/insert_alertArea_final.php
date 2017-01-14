<?php
include ("con_db.php");
try{

	
	$connexion = new conDb();
	$connexion->connectDb();
        
		
		/* variable en attente de données*/
		$longitude = $_POST["longi"];
		$latitude = $_POST["lati"];
        $email_user = $_POST["login"];
		//récupère l'alerte sélectionné par l'utilisateur
        $id_alertSel = $_POST["type"];     
		
	/* 
	**Variable utiliser pour la récupération des données dans la procédure stocké, elle servent au bon déroulement de l'appel de la procédure**
	
	@idAlertReq
	@msg
	emailUser
	*/
        
 
			$connexionUser = "CALL insertAlert_area('".$longitude."','".$latitude."', '".$email_user."', '".$id_alertSel."',@idAlert_user,@id_user,@msg)";
			$connexionUser_procedure = $connexion->bdd->prepare($connexionUser);
			$connexionUser_procedure ->execute();

			/* le message à afficher est OK, car on teste juste l'insertion des alerte et une mis a jour des alerte*/
			$msg = $connexion->bdd->query("SELECT @msg AS message")->fetch(PDO::FETCH_ASSOC);

			echo json_encode($msg);


		}
catch (Exception $e){
	die("Erreur :" .$e->getMessage());
}

?>