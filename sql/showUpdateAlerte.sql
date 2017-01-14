CREATE DEFINER=`root`@`localhost` PROCEDURE `showUpdateAlerte`()
BEGIN


/* affiche les alertes de moins de 5 minute*/

Select alertes.longitude, alertes.latitude, alertes.type_alerte_iDtype_alerte, type_alerte.nom
from alertes, alerte_utilisateur, type_alerte
where alertes.type_alerte_iDtype_alerte = type_alerte.iDtype_alerte
and alerte_utilisateur.alertes_iDalertes = alertes.iDalertes
and alerte_utilisateur.date_alerte >= date_sub(now(), interval 5 minute);

		
        
		delete from alerte_utilisateur 
        where exists (select * from alertes, alerte_utilisateur
        where alertes.iDalertes = alerte_utilisateur.alertes_iDalertes
        and alerte_utilisateur.date_alerte <= date_sub(now(), interval 5 minute)) ;
        
  
       
                

END