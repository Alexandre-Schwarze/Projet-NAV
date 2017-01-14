<?php

include ("con_db.php");


try{


	$connexion = new conDb();
	$connexion->connectDb();

        
        $email = $_POST['email']; 
        $mdp =  $_POST['mdp'];     
        

	$connexionUser = "CALL getConUser('".$email ."','".$mdp."',@msg)";
    $connexionUser_procedure = $connexion->bdd->prepare($connexionUser);
	$connexionUser_procedure ->execute();
	$connexionUser_procedure->closeCursor();
	//$connexionUser = $bdd->prepare("Select `id`, `login`, `password` AS mdp from admin");
	//$end = $query->execute();
	$msg = $connexion->bdd->query("SELECT @msg AS message")->fetch();
	// print_r( $connexionUser_procedure);
	//$rows= $connexionUser_procedure->fetchAll(PDO::FETCH_OBJ);

	echo json_encode($msg);
	}
	catch (Exception $e)
	{
		echo json_encode("Erreur :" .$e->getMessage());
		//die("Erreur :" .$e->getMessage());
	}
?>