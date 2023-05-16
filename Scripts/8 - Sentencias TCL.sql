USE Hardware_informatico;
SET @@autocommit = 0;


START TRANSACTION;
DELETE FROM Procesador WHERE ID_Procesador = 6;
/*
INSERT INTO `Procesador` (`Zocalo`,`Chipset`,`Cant_Nucleos`,`Vel_Max`,`VGA`,`Cooler`,`ID_Producto`) VALUES ('LGA1700','LGA1700',12,'5.0 GHz','Intel UHD 730','No',12);
COMMIT;
ROLLBACK;
*/

START TRANSACTION;
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Gabriel','Garcia');
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Julio','Rios');
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Carlos','Santos');
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Julieta','Robles');
SAVEPOINT SP_1;
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Alberto','Gutierrez');
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Marcelo','Sosa');
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Karina','Martinez');
INSERT INTO `Vendedores` (`Nombre`,`Apellido`) VALUES ('Florencia','Lopez');
SAVEPOINT SP_2;
/*
RELEASE SAVEPOINT SP_1;
COMMIT;
ROLLBACK;
*/