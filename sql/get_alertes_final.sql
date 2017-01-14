CREATE DEFINER=`root`@`localhost` PROCEDURE `get_alerts`()
BEGIN
select * from type_alerte;
END