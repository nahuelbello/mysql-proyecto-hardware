USE MySQL;


-- Crea el usuario 'kenny_barron' con permisos de solo lectura para todas las tablas del esquema 'Hardware_informatico'.
CREATE USER IF NOT EXISTS 'kenny_barron'@'localhost' IDENTIFIED BY 'jazztrio';
GRANT SELECT ON Hardware_informatico.Clientes TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.Fuente TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.Gabinete TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.HDD TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.LOG_PC_Componentes TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.LOG_Productos TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.Motherboard TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.PC TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.PC_Componentes TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.Procesador TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.Productos TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.RAM TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.SSD TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.Vendedores TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.Ventas TO 'kenny_barron'@'localhost';
GRANT SELECT ON Hardware_informatico.VGA TO 'kenny_barron'@'localhost';


-- Crea el usuario 'lectura_ins_modif' con permisos de lectura, inserción y modificación de datos para todas las tablas del esquema 'Hardware_informatico'.
CREATE USER IF NOT EXISTS 'herbie_hancock'@'localhost' IDENTIFIED BY 'rockit';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Clientes TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Fuente TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Gabinete TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.HDD TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.LOG_PC_Componentes TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.LOG_Productos TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Motherboard TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.PC TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.PC_Componentes TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Procesador TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Productos TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.RAM TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.SSD TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Vendedores TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.Ventas TO 'herbie_hancock'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Hardware_informatico.VGA TO 'herbie_hancock'@'localhost';