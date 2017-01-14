CREATE DEFINER=`root`@`localhost` PROCEDURE `get_alertArea`(
IN longitude_user float(25),
IN latitude_user float(25)
)
BEGIN

	/* récupère les alertes déjà présente dans un rayon de 1km avec comme paramètre la long et lat
	de l'utilisateur*/
	select alertes.longitude, alertes.latitude, type_alerte.nom
	from alertes,type_alerte
	where alertes.type_alerte_iDtype_alerte = type_alerte.iDtype_alerte
	and alertes.longitude < longitude_user + 1/76
	and alertes.longitude > longitude_user -1/76
	and alertes.latitude < latitude_user +1/111
	and alertes.latitude > latitude_user -1/111;
			

END