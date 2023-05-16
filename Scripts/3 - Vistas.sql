USE Hardware_informatico;


CREATE OR REPLACE VIEW VW_Motherboard AS
SELECT p.ID_Producto, p.Marca, p.Modelo, m.Zocalo, m.Chipset, m.Slots_RAM, m.Tecnologia_RAM, m.Vel_Max_RAM, m.Puertos_PCI, p.Stock, p.Precio FROM Motherboard m
LEFT JOIN Productos p
ON m.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_Procesador AS
SELECT p.ID_Producto, p.Marca, p.Modelo, a.Zocalo, a.Chipset, a.Cant_Nucleos, a.Vel_Max, a.VGA, a.Cooler, p.Stock, p.Precio FROM Procesador a
LEFT JOIN Productos p
ON a.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_RAM AS
SELECT p.ID_Producto, p.Marca, p.Modelo, r.Tecnologia, r.Vel_Max, r.Capacidad, r.PC_Notebook, p.Stock, p.Precio FROM RAM r
LEFT JOIN Productos p
ON r.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_SSD AS
SELECT p.ID_Producto, p.Marca, p.Modelo, s.Tecnologia, s.Capacidad, s.Vel_Lectura, s.Vel_Escritura, p.Stock, p.Precio FROM SSD s
LEFT JOIN Productos p
ON s.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_HDD AS
SELECT p.ID_Producto, p.Marca, p.Modelo, h.Capacidad, h.Vel_Lectura, h.Vel_Escritura, h.Vel_Rotacion, p.Stock, p.Precio FROM HDD h
LEFT JOIN Productos p
ON h.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_VGA AS
SELECT p.ID_Producto, p.Marca, p.Modelo, v.Capacidad, v.Tasa_Reloj, v.Consumo, p.Stock, p.Precio FROM VGA v
LEFT JOIN Productos p
ON v.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_Fuente AS
SELECT p.ID_Producto, p.Marca, p.Modelo, f.Potencia, p.Stock, p.Precio FROM Fuente f
LEFT JOIN Productos p
ON f.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_Gabinete AS
SELECT p.ID_Producto, p.Marca, p.Modelo, g.Formato, g.Color, g.Fuente, p.Stock, p.Precio FROM Gabinete g
LEFT JOIN Productos p
ON g.ID_Producto = p.ID_Producto;

CREATE OR REPLACE VIEW VW_Clientes AS
SELECT * FROM Clientes;

CREATE OR REPLACE VIEW VW_Vendedores AS
SELECT * FROM Vendedores;