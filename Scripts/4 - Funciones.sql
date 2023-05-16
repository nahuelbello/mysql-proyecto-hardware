USE Hardware_informatico;


-- Multiplica la cantidad de productos que contiene el PC ingresado por su precio respectivo y suma los resultados.
-- Requiere el ingreso de un número entero.
DROP FUNCTION IF EXISTS FN_PrecioPC;
DELIMITER //
CREATE FUNCTION FN_PrecioPC(PC_nro INT)		
RETURNS INT
DETERMINISTIC
BEGIN
SET @resultado = (SELECT SUM(p.Precio * c.Cantidad) FROM PC_Componentes c
LEFT JOIN Productos p
ON c.ID_Producto = p.ID_Producto
WHERE c.ID_PC = PC_nro);
RETURN @resultado;
END //
DELIMITER ;


-- Genera órdenes de venta.
-- Requiere el ingreso de un número entero en los siguientes parámetros: 'Venta', 'Producto', 'Cantidad', 'Descuento', 'Cliente' y 'Vendedor'.
DROP FUNCTION IF EXISTS FN_CargarVenta;
DELIMITER //
CREATE FUNCTION FN_CargarVenta(Venta INT, Producto INT, Cantidad INT, Descuento INT, Cliente INT, Vendedor INT)
RETURNS INT
DETERMINISTIC
MODIFIES SQL DATA
BEGIN
SET @precio = (SELECT Precio FROM Productos WHERE ID_Producto = Producto);
INSERT INTO `Ventas` (`Nro_Venta`,`ID_Producto`,`Cantidad`,`Precio`,`Descuento`,`Fecha`,`Cliente`,`Vendedor`)
VALUES (Venta,Producto,Cantidad,@precio,Descuento,NOW(),Cliente,Vendedor);
RETURN @precio;
END //
DELIMITER ;




-- Prueba
/*
SELECT FN_PrecioPC(1);
SELECT c.Cantidad, p.Precio FROM PC_Componentes c
LEFT JOIN Productos p
ON c.ID_Producto = p.ID_Producto
WHERE c.ID_PC = 1;

SELECT FN_CargarVenta(1,2,3,0,1,2);
SELECT * FROM Ventas;
*/