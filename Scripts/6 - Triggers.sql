USE Hardware_informatico;


-- Trigger de INSERT en tabla Productos.
-- Registra los campos que se ingresaron, el usuario que hizo el ingreso, y la fecha en que se generó el ingreso de un producto
-- de la tabla Productos, en el log LOG_Productos.
DROP TRIGGER IF EXISTS TRG_Productos_INSERT;
DELIMITER //
CREATE TRIGGER TRG_Productos_INSERT AFTER INSERT ON hardware_informatico.Productos
FOR EACH ROW
BEGIN

INSERT INTO LOG_Productos (Accion, ID_Producto, Marca, Modelo, Tipo, Stock, Costo, Precio, Usuario, Fecha)
VALUES (
	'INSERT',
    NEW.ID_Producto,
	NEW.Marca,
    NEW.Modelo,
    NEW.Tipo,
    NEW.Stock,
    NEW.Costo,
    NEW.Precio,
	CURRENT_USER(),
	NOW()
);

END //
DELIMITER ;


-- Trigger de UPDATE en tabla Productos.
-- Registra los valores previos y posteriores a la modificación, el usuario que hizo la modificación,
-- y la fecha en que se generó la modificación de un producto de la tabla Productos, en el log LOG_Productos.
DROP TRIGGER IF EXISTS TRG_Productos_UPDATE;
DELIMITER //
CREATE TRIGGER TRG_Productos_UPDATE BEFORE UPDATE ON hardware_informatico.Productos
FOR EACH ROW
BEGIN

INSERT INTO LOG_Productos (Accion, ID_Producto, Marca, Modelo, Tipo, Stock, Costo, Precio, Usuario, Fecha)
VALUES (
	'UPDATE',
    CONCAT('ANTERIOR: ', OLD.ID_Producto, ' - ', 'Nuevo: ', NEW.ID_Producto),
    CONCAT('ANTERIOR: ', OLD.Marca, ' - ', 'Nuevo: ', NEW.Marca),
    CONCAT('ANTERIOR: ', OLD.Modelo, ' - ', 'Nuevo: ', NEW.Modelo),
    CONCAT('ANTERIOR: ', OLD.Tipo, ' - ', 'Nuevo: ', NEW.Tipo),
    CONCAT('ANTERIOR: ', OLD.Stock, ' - ', 'Nuevo: ', NEW.Stock),
    CONCAT('ANTERIOR: ', OLD.Costo, ' - ', 'Nuevo: ', NEW.Costo),
    CONCAT('ANTERIOR: ', OLD.Precio, ' - ', 'Nuevo: ', NEW.Precio),
	CURRENT_USER(),
	NOW()
);

END //
DELIMITER ;


-- Trigger de DELETE en tabla Productos.
-- Registra los campos que se eliminaron, el usuario que hizo la eliminación, y la fecha en que se generó la eliminación de un producto
-- de la tabla Productos, en el log LOG_Productos.
DROP TRIGGER IF EXISTS TRG_Productos_Delete;
DELIMITER //
CREATE TRIGGER TRG_Productos_Delete BEFORE DELETE ON hardware_informatico.Productos
FOR EACH ROW
BEGIN

INSERT INTO LOG_Productos (Accion, ID_Producto, Marca, Modelo, Tipo, Stock, Costo, Precio, Usuario, Fecha)
VALUES (
	'DELETE',
    OLD.ID_Producto,
	OLD.Marca,
    OLD.Modelo,
    OLD.Tipo,
    OLD.Stock,
    OLD.Costo,
    OLD.Precio,
	CURRENT_USER(),
	NOW()
);

END //
DELIMITER ;



-- Trigger de INSERT en tabla PC_Componentes.
-- Registra los campos que se ingresaron, el usuario que hizo el ingreso, y la fecha en que se generó el ingreso de un componente
-- de una PC armada de la tabla PC_Componentes, en el log LOG_PC_Componentes.
DROP TRIGGER IF EXISTS TRG_PC_Componentes_Insert;
DELIMITER //
CREATE TRIGGER TRG_PC_Componentes_Insert AFTER INSERT ON hardware_informatico.PC_Componentes
FOR EACH ROW
BEGIN

INSERT INTO LOG_PC_Componentes (Accion, ID_PC_Comp, ID_PC, ID_Producto, Cantidad, Usuario, Fecha)
VALUES (
	'INSERT',
    NEW.ID_PC_Comp,
	NEW.ID_PC,
    NEW.ID_Producto,
    NEW.Cantidad,
	CURRENT_USER(),
	NOW()
);

END //
DELIMITER ;


-- Trigger de UPDATE en tabla PC_Componentes.
-- Registra los valores previos y posteriores a la modificación, el usuario que hizo la modificación, y la fecha en que se generó la modificación
-- de un componente de una PC armada de la tabla PC_Componentes, en el log LOG_PC_Componentes.
DROP TRIGGER IF EXISTS TRG_PC_Componentes_Update;
DELIMITER //
CREATE TRIGGER TRG_PC_Componentes_Update BEFORE UPDATE ON hardware_informatico.PC_Componentes
FOR EACH ROW
BEGIN

INSERT INTO LOG_PC_Componentes (Accion, ID_PC_Comp, ID_PC, ID_Producto, Cantidad, Usuario, Fecha)
VALUES (
	'UPDATE',
    CONCAT('ANTERIOR: ', OLD.ID_PC_Comp, ' - ', 'Nuevo: ', NEW.ID_PC_Comp),
    CONCAT('ANTERIOR: ', OLD.ID_PC, ' - ', 'Nuevo: ', NEW.ID_PC),
    CONCAT('ANTERIOR: ', OLD.ID_Producto, ' - ', 'Nuevo: ', NEW.ID_Producto),
    CONCAT('ANTERIOR: ', OLD.Cantidad, ' - ', 'Nuevo: ', NEW.Cantidad),
	CURRENT_USER(),
	NOW()
);

END //
DELIMITER ;


-- Trigger de DELETE en tabla PC_Componentes.
-- Registra los campos que se eliminaron, el usuario que hizo la eliminación, y la fecha en que se generó la eliminación
-- de un componente de una PC armada de la tabla PC_Componentes, en el log LOG_PC_Componentes.
DROP TRIGGER IF EXISTS TRG_PC_Componentes_Delete;
DELIMITER //
CREATE TRIGGER TRG_PC_Componentes_Delete BEFORE DELETE ON hardware_informatico.PC_Componentes
FOR EACH ROW
BEGIN

INSERT INTO LOG_PC_Componentes (Accion, ID_PC_Comp, ID_PC, ID_Producto, Cantidad, Usuario, Fecha)
VALUES (
	'DELETE',
    OLD.ID_PC_Comp,
	OLD.ID_PC,
	OLD.ID_Producto,
	OLD.Cantidad,
	CURRENT_USER(),
	NOW()
);

END //
DELIMITER ;




-- Prueba.
/*
INSERT INTO `Productos` (`Marca`,`Modelo`,`Tipo`,`Stock`,`Costo`,`Precio`) VALUES ('PRUEBA','PRUEBA','PRUEBA',1,456,789);
UPDATE `Productos` SET Tipo = 'PRUEBA' WHERE ID_Producto = 1;

INSERT INTO `PC_Componentes` (`ID_PC`,`ID_Producto`,`Cantidad`) VALUES (1,10,1);
UPDATE `PC_Componentes` SET Cantidad = 9 WHERE ID_PC_Comp = 3;
DELETE FROM `PC_Componentes` WHERE ID_PC_Comp = 2;

SELECT * FROM LOG_Productos;
SELECT * FROM LOG_PC_Componentes;
*/