<?php
	Class conDb{


	private $dbname = "waze2";
	private $login_db = "root";
	private $password_db = "";
	private $port = 3306;
	public $bdd ;

	public function connectDb(){

			$db = $this->dbname;
			$login = $this->login_db;
			$password = $this->password_db;

			try{
			$this->bdd = new PDO("mysql:http//localhost/;port=3306;dbname=".$db.";charset=utf8",$login,$password);
			$this->bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);



			}
			catch (Exception $e){
				die("Erreur : " .$e->getMessage());
			}

		}


	}


?>