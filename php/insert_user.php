<?php
include ("con_db.php");
try{
	$connexion = new conDb();
	$connexion->connectDb();
        
		$nom = $_POST['nom']; 
		$prenom = $_POST['prenom']; 
        $email = $_POST['email']; 
        $mdp = $_POST['mdp'];       
        
        
			$connexionUser = "CALL insert_user('".$nom."','".$prenom."','".$email ."','".$mdp."',@msg, @emailRecup)";
			$connexionUser_procedure = $connexion->bdd->prepare($connexionUser);
			$connexionUser_procedure ->execute();

			$msg = $connexion->bdd->query("SELECT @msg AS message")->fetch(PDO::FETCH_ASSOC);

			echo json_encode($msg);

		}
catch (Exception $e){
	die("Erreur :" .$e->getMessage());
}

?>