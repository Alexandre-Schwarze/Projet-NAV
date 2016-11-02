<?php
	Class conDb{
		

	private $dbname = "nav_db";
	private $login_db = "root";
	private $password_db = "fuckallyoh";
	private $port = 3306;
	public $bdd ;
	
	public function connectDb(){
		
			$db = $this->dbname;
			$login = $this->login_db;
			$password = $this->password_db;
			
			try{
			$this->bdd = new PDO("mysql:localhost;port=3306;dbname=".$db.";charset=utf8",$login,$password);
			$this->bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			 
			 $result = "connexion réussi";
				
			echo $result;		
				
			}	
			catch (Exception $e){
				die("Erreur : " .$e->getMessage());
			}
	
		}


	}
	//$connexion_database = new conDb();
	//$connexion_database->connectDb();

?>