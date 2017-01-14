CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAlert_area`(
IN longitude_user float(35),
IN latitude_user float(35),
IN email_user varchar(35),
IN id_typeAlert int(6),
OUT idAlert_user int(6),
OUT id_user int(6),
OUT msg varchar(55)
)
BEGIN


Select iDutilisateur into id_user from utilisateur where email = email_user;


		select  iDalertes 
		into idAlert_user
		from alertes
		where longitude< longitude_user + 1 /76 
		and longitude > longitude_user -1/76 
		and latitude < latitude_user +1 / 111
		and latitude > latitude_user -1/111
		and type_alerte_iDtype_alerte = id_typeAlert;

			if (select found_rows() )> 0 then

				Update alertes set nombre_notification = nombre_notification +1
                where iDalertes =idAlert_user;

			else 
				
				Insert INTO alertes
                (longitude, latitude,nombre_notification,type_alerte_iDtype_alerte)
				Values (longitude_user,latitude_user,1, id_typeAlert);

			end if;

		Insert INTO alerte_utilisateur
		(alertes_iDalertes, date_alerte, utilisateur_iDutilisateur)
		Values (idAlert_user, CURRENT_TIMESTAMP, id_user);

		if (select found_rows() )> 0 then
         
			set msg ='ok';

			else

			set msg = 'ko';

		end if;

END