<?php

	$requete = $_POST['requete'];
	$bdd = new PDO('mysql:host=localhost;dbname=nav_db', 'root', '');
	//$bdd = mysql_connect('localhost', 'root', '') or die("Erreur de connexion au serveur.");
	//mysql_select_db('nav_db', $bdd) or die("Erreur de connexion à la base");
	$result = "ko";

	switch ($requete) {
		case 'insertUser':
			$nom = $_POST['nom'];
			$prenom = $_POST['prenom'];
			$email = $_POST['email'];
			$mdp = $_POST['mdp'];

			$sql = 'INSERT INTO utilisateur (nom, prenom, email, mdp) VALUES ("'.$nom.'","'.$prenom.'","'.$email.'","'.$mdp.'");';
			$req = $bdd->prepare($sql);
  			$req->execute();
			$result = "ok";
			break;

		case 'insertAlert':
			$idUser = $_POST['idUser'];
			$longitude = $_POST['longitude'];
			$latitude = $_POST['latitude'];
			$alert = $_POST['alert'];
			$date = date("Y-m-d") . " " . date("H:i:s");

			/**************************************************************************************
			latitude - 1 / 111 < $latitude < latitude + 1 / 111 
			longitude - 1 / 76 < $longitude < longitude + 1 / 76 
						Carré de 1Km de coté
			**************************************************************************************/
			$sql = 'SELECT iDalertes FROM alertes WHERE longitude < "'.$longitude.'" + 1 / 76 AND longitude > "'.$longitude.'" - 1 / 76	AND latitude < "'.$latitude.'" + 1 / 111 AND latitude > "'.$latitude.'" - 1 / 111 AND type_alerte_iDtype_alerte = "'.$alert.'";';
			$req = $bdd->prepare($sql);
  			$req->execute();
			$idAlert = $req->fetchAll();
			$idAlert = $idAlert[0]['iDalertes'];

			if (isset($idAlert) && $idAlert != "Undefined" && $idAlert != "null") {
				$sql = 'INSERT INTO alerte_utilisateur VALUES ("'.$idAlert.'","'.$idUser.'","'.$date.'");';
				$req = $bdd->prepare($sql);
  				$req->execute();

				$sql = 'UPDATE alertes SET nombre_notification = nombre_notification + 1 WHERE iDalertes = "'.$idAlert.'";';
				$req = $bdd->prepare($sql);
	  			$req->execute();
			} else {
				var_dump("okey");
				$sql = 'INSERT INTO alertes (longitude, latitude, nombre_notification, type_alerte_iDtype_alerte) VALUES ("'.$longitude.'","'.$latitude.'", 1,"'.$alert.'");';
				$req = $bdd->prepare($sql);
	  			$req->execute();
			}

			$result = "ok";
			break;

		case 'selectAlerts':
			$longitude = $_POST['longitude'];
			$latitude = $_POST['latitude'];

			/***********************************************************
								Carré de 20Km de coté
			***********************************************************/
			$sql = 'SELECT * FROM alertes WHERE longitude < "'.$longitude.'" + 20 / 76 AND longitude > "'.$longitude.'" - 20 / 76	AND latitude < "'.$latitude.'" + 20 / 111 AND latitude > "'.$latitude.'" - 20 / 111;';
  			$req = $bdd->prepare($sql);
  			$req->execute();
  			$result = json_encode($req->fetchAll());
			break;

		case 'selectUser':
			$email = $_POST['email'];
			$mdp = $_POST['mdp'];

			$sql = 'SELECT * FROM utilisateur WHERE email = "'.$email.'" AND mdp = "'.$mdp.'";';
			$req = $bdd->prepare($sql);
  			$req->execute();
  			$rep = $req->fetchAll();
			if (isset($rep) && $rep != '') {
				$result = json_encode($rep);
			} else {
				$result = "ko";
			}
			break;

		// Case get AlertTypes //
		case 'selectAlertsTypes':

			$sql = 'SELECT * FROM type_alerte';
			$req = $bdd->prepare($sql);
  			$req->execute();
  			$rep = $req->fetchAll();
			if (isset($rep) && $rep != '') 
			{
				$result = json_encode($rep);
			} else {
				$result = "ko";
			}
			break;

			
		default:
			// return "Requête non trouvée !";
			break;
	}

	echo $result;

?>