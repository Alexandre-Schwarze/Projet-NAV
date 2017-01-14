CREATE DEFINER=`root`@`localhost` PROCEDURE `getConUser`(
IN email_user varchar(50), mdp_user varchar(50),
OUT msg varchar (255) 
)
BEGIN
select utilisateur.email, utilisateur.mdp 
from utilisateur
where utilisateur.email = email_user and
mdp = mdp_user;


if ROW_COUNT ()>0 then
set msg ='ok';

else

set msg = 'ko' ;
end if;

/*A tester
if emailSaisi = email_user  && mdp_user != mdpSaisi then
set msg = 'Mot de passe incorrect' ;
end if;*/

/* A tester
if email_user != emailSaisi && mdp_user = mdpSaisi then
set msg = 'E-mail incorrect';
end if;*/

END