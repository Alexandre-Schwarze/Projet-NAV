CREATE DEFINER=`waze2`@`localhost` PROCEDURE `insert_user`(
IN nom_user varchar(45), 
IN prenom_user varchar(45),
IN email_user varchar(45), 
IN mdp_user varchar(45),
OUT msg varchar(255),
OUT emailRecup varchar(55)
 )
BEGIN

select utilisateur.email
into emailRecup
FROM utilisateur 
where utilisateur.email = email_user;


if emailRecup = email_user then
set msg = 'ko2';

else 

INSERT INTO utilisateur(nom, prenom, email, mdp)

VALUES (nom_user, prenom_user,email_user, mdp_user);

	if ROW_COUNT ()>0 then
    set msg = 'ok';
    else
    set msg = 'ko';
    end if;

end if;

END