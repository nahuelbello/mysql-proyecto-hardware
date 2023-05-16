USE Hardware_informatico;


-- Ordena la tabla Productos según la columna y el orden elegidos en los parámetros de entrada.
-- Requiere el ingreso de una cadena de texto en los parámetros 'Columna' y 'Orden'.
DROP PROCEDURE IF EXISTS SP_Ordenamiento;
DELIMITER //
CREATE PROCEDURE SP_Ordenamiento (IN Columna VARCHAR(20), IN Orden CHAR(4), OUT Fallo VARCHAR(60))
BEGIN
IF (Columna = '' OR Orden = '') THEN
	SET Fallo = 'Los campos no pueden estar vacíos.';
	
ELSEIF (Orden != 'asc' AND Orden != 'desc') THEN
	SET Fallo = 'El campo orden solo admite valores "asc" y "desc".';

ELSE
	SET @Resultado = CONCAT('SELECT * FROM Productos ORDER BY ', Columna, ' ', Orden);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END IF;
END //
DELIMITER ;


-- Inserta registros nuevos en la tabla Productos.
-- Requiere el ingreso de una cadena de texto en los parámetros 'Marca' y 'Tipo'; y un número entero en los parámetros 'Stock', 'Costo' y 'Precio'.
DROP PROCEDURE IF EXISTS SP_Insercion;
DELIMITER //
CREATE PROCEDURE SP_Insercion (IN Marca VARCHAR(20), IN Modelo VARCHAR(80), IN Tipo CHAR(12), IN Stock TINYINT, IN Costo DECIMAL(10, 2), IN Precio DECIMAL(10, 2), OUT Fallo VARCHAR(60))
BEGIN
IF (Marca = '' OR Modelo = '' OR Tipo = '' OR Stock = '' OR Costo = '' OR Precio = '') THEN
	SET Fallo = 'Los campos no pueden estar vacíos.';

ELSEIF (Stock < 0) THEN
	SET Fallo = 'El stock debe ser un número válido';

ELSEIF (Precio <= 0) THEN
	SET Fallo = 'El precio debe ser un número válido';

ELSEIF (Costo <= 0) THEN
	SET Fallo = 'El costo debe ser un número válido';

ELSE
	INSERT INTO `Productos` (`Marca`,`Modelo`,`Tipo`,`Stock`,`Costo`,`Precio`) VALUES (Marca, Modelo, Tipo, Stock, Costo, Precio);
END IF;
END //
DELIMITER ;


-- Modifica el costo de un producto en la tabla Productos y actualiza el precio de venta.
-- Requiere el ingreso de un número entero en los parámetros 'Prod' y 'Costo'.
DROP PROCEDURE IF EXISTS SP_ModificarPrecio;
DELIMITER //
CREATE PROCEDURE SP_ModificarPrecio (IN Prod SMALLINT, IN Costo INT)
BEGIN
	SET @Precio = Costo * 1.3;
	UPDATE Productos SET Costo = Costo, Precio = @Precio WHERE ID_Producto = Prod;
END //
DELIMITER ;


-- Agrega más stock de un producto en la tabla Productos.
-- Requiere el ingreso de un número entero en los parámetros 'Prod' y 'Cant'.
DROP PROCEDURE IF EXISTS SP_AgregarStock;
DELIMITER //
CREATE PROCEDURE SP_AgregarStock (IN Prod SMALLINT, IN Cant INT)
BEGIN
	SET @NuevoStock = Cant + (SELECT Stock FROM Productos WHERE ID_Producto = Prod);
	UPDATE Productos SET Stock = @NuevoStock WHERE ID_Producto = Prod;
END //
DELIMITER ;


-- Consulta el stock disponible de un producto.
-- Requiere el ingreso de un número entero en el parámetro 'Prod'.
DROP PROCEDURE IF EXISTS SP_ConsultarStock;
DELIMITER //
CREATE PROCEDURE SP_ConsultarStock (IN Prod INT)
BEGIN
	SET @Resultado = CONCAT('SELECT Marca,Modelo,Stock FROM Productos WHERE ID_Producto = ', Prod);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END //
DELIMITER ;


-- Consulta una venta por número de venta.
-- Requiere el ingreso de un número entero en el parámetro 'Nro_Venta'.
DROP PROCEDURE IF EXISTS SP_ConsultarVentas;
DELIMITER //
CREATE PROCEDURE SP_ConsultarVentas (IN Nro_Venta INT)
BEGIN
	SET @Resultado = CONCAT('SELECT * FROM Ventas WHERE Nro_Venta = ', Nro_Venta);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END //
DELIMITER ;


-- Consulta las ventas realizadas a un cliente.
-- Requiere el ingreso de un número entero en el parámetro 'Cliente'.
DROP PROCEDURE IF EXISTS SP_ConsultarVentasCliente;
DELIMITER //
CREATE PROCEDURE SP_ConsultarVentasCliente (IN Cliente INT)
BEGIN
	SET @Resultado = CONCAT('SELECT * FROM Ventas WHERE Cliente = ', Cliente);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END //
DELIMITER ;




-- Prueba.
/*
SET @Columna = 'marca';
SET @Orden = 'asc';
CALL SP_Ordenamiento(@Columna, @Orden, @Fallo);

SET @Marca = 'NUEVO MODELO';
SET @Modelo = 'NUEVO MODELO';
SET @Tipo = 'Motherboard';
SET @Stock = 1;
SET @Costo = 234;
SET @Precio = 56789;
CALL SP_Insercion(@Marca, @Modelo, @Tipo, @Stock, @Costo, @Precio, @Resultado);
SELECT * FROM Productos;
SELECT @resultado;

Call SP_ModificarPrecio(31,FN_PrecioPC(1));
SELECT * FROM Productos;

Call SP_AgregarStock(1,1);
SELECT * FROM Productos;

CALL SP_ConsultarStock(1);

CALL SP_ConsultarVentas(3);
SELECT * FROM Ventas;

CALL SP_ConsultarVentasCliente(3);
SELECT * FROM Ventas;
*/