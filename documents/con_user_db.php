<?php

try{
	$bdd = new PDO("mysql:localhost;port=3306;dbname=nav_db;charset=utf8", "root", "fuckallyoh");
	$bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $email = "frane@gmail.fr";
        $mdp = "user1";       
        
        
	$connexionUser = "CALL getConUser('".$email ."','".$mdp."',@msg, @emailSaisi,@mdpSaisi)";
    $connexionUser_procedure = $bdd->prepare($connexionUser);
	$connexionUser_procedure ->execute();
	//$connexionUser = $bdd->prepare("Select `id`, `login`, `password` AS mdp from admin");
	//$end = $query->execute();
	$rows = $bdd->query("SELECT @msg AS message")->fetch(PDO::FETCH_ASSOC);
	print_r( $connexionUser_procedure);
	//$rows= $connexionUser_procedure->fetchAll(PDO::FETCH_OBJ);

	if($rows){
	echo $rows['message'];
	}


		
		}
catch (Exception $e){
	die("Erreur :" .$e->getMessage());
}

