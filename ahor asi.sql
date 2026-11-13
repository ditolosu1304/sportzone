-- -----------------------------------------------------
-- 1. LIMPIEZA Y CREACIÓN DE LA BASE DE DATOS
-- -----------------------------------------------------
DROP DATABASE IF EXISTS tienda_online;
CREATE DATABASE IF NOT EXISTS tienda_online;
USE tienda_online;

-- -----------------------------------------------------
-- 2. CREACIÓN DE TABLAS (Con IF NOT EXISTS para evitar errores)
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS proveedor (
  idproveedor INT NOT NULL AUTO_INCREMENT,
  ubicacion VARCHAR(45),
  correo_contacto VARCHAR(45),
  telefono VARCHAR(45),
  empresa VARCHAR(45),
  PRIMARY KEY (idproveedor)
);

CREATE TABLE IF NOT EXISTS producto (
  idproducto INT NOT NULL AUTO_INCREMENT,
  modelo VARCHAR(45),
  marca VARCHAR(45),
  precio VARCHAR(45),
  proveedor_idproveedor INT NOT NULL,
  PRIMARY KEY (idproducto),
  FOREIGN KEY (proveedor_idproveedor) REFERENCES proveedor (idproveedor)
);

CREATE TABLE IF NOT EXISTS garantia (
  idgarantia INT NOT NULL AUTO_INCREMENT,
  esatdo VARCHAR(45),
  tipo_falla VARCHAR(45),
  meses_cobertura VARCHAR(45),
  producto_idproducto INT NOT NULL,
  PRIMARY KEY (idgarantia),
  FOREIGN KEY (producto_idproducto) REFERENCES producto (idproducto)
);

CREATE TABLE IF NOT EXISTS cliente (
  idcliente INT NOT NULL AUTO_INCREMENT,
  celular VARCHAR(45),
  correo VARCHAR(45),
  nombre VARCHAR(45),
  apellido VARCHAR(45),
  PRIMARY KEY (idcliente)
);

CREATE TABLE IF NOT EXISTS empleado (
  idempleado INT NOT NULL AUTO_INCREMENT,
  telefono VARCHAR(45),
  puesto VARCHAR(45),
  nombre VARCHAR(45),
  apellido VARCHAR(45),
  PRIMARY KEY (idempleado)
);

CREATE TABLE IF NOT EXISTS venta (
  idventa INT NOT NULL AUTO_INCREMENT,
  fecha VARCHAR(45),
  valor VARCHAR(45),
  cliente_idcliente INT NOT NULL,
  empleado_idempleado INT NOT NULL,
  PRIMARY KEY (idventa),
  FOREIGN KEY (cliente_idcliente) REFERENCES cliente (idcliente),
  FOREIGN KEY (empleado_idempleado) REFERENCES empleado (idempleado)
);

CREATE TABLE IF NOT EXISTS sucursal (
  idsucursal INT NOT NULL AUTO_INCREMENT,
  ciudad VARCHAR(45),
  correo VARCHAR(45),
  telefono VARCHAR(45),
  nombre_sucursal VARCHAR(45),
  PRIMARY KEY (idsucursal)
);

CREATE TABLE IF NOT EXISTS metodo_pago (
  idmetodo_pago INT NOT NULL AUTO_INCREMENT,
  plataforma VARCHAR(45),
  estado VARCHAR(45),
  tipo_pago VARCHAR(45),
  venta_idventa INT NOT NULL,
  PRIMARY KEY (idmetodo_pago),
  FOREIGN KEY (venta_idventa) REFERENCES venta (idventa)
);


-- -----------------------------------------------------
-- 3. INSERCIÓN DE DATOS DE PRUEBA (6 Registros c/u)
-- -----------------------------------------------------

INSERT INTO proveedor (idproveedor, ubicacion, correo_contacto, telefono, empresa) VALUES
(1, 'Bogotá', 'contacto@techcorp.com', '3101234567', 'TechCorp Colombia'),
(2, 'Medellín', 'ventas@logitech.co', '3119876543', 'Logitech Distribuciones'),
(3, 'Cali', 'soporte@samsung.com', '3124567890', 'Samsung Importaciones'),
(4, 'Barranquilla', 'info@sony.com.co', '3137654321', 'Sony Electro'),
(5, 'Bucaramanga', 'contacto@xiaomi.co', '3145432109', 'Xiaomi Store BD'),
(6, 'Pereira', 'ventas@asus.com', '3158765432', 'Asus Tech Group');

INSERT INTO producto (idproducto, modelo, marca, precio, proveedor_idproveedor) VALUES
(1, 'Legion Pro 5', 'Lenovo', '4500000.00', 1),
(2, 'MX Master 3S', 'Logitech', '350000.00', 2),
(3, 'Galaxy S24', 'Samsung', '3800000.00', 3),
(4, 'WH-1000XM5', 'Sony', '1200000.00', 4),
(5, 'Smart Plug v2', 'Xiaomi', '60000.00', 5),
(6, 'DualSense Controller', 'Sony', '280000.00', 4);

INSERT INTO garantia (idgarantia, esatdo, tipo_falla, meses_cobertura, producto_idproducto) VALUES
(1, 'Vigente', 'Falla de fábrica', '12 meses', 1),
(2, 'Vigente', 'Desgaste de batería', '6 meses', 2),
(3, 'Vigente', 'Pantalla dañada', '24 meses', 3),
(4, 'Expirada', 'Fallo de bluetooth', '12 meses', 4),
(5, 'Vigente', 'Cortocircuito', '6 meses', 5),
(6, 'Vigente', 'Falla en joysticks', '12 meses', 6);

INSERT INTO cliente (idcliente, celular, correo, nombre, apellido) VALUES
(1, '3001112233', 'carlos.perez@gmail.com', 'Carlos', 'Pérez'),
(2, '3002223344', 'ana.gomez@hotmail.com', 'Ana', 'Gómez'),
(3, '3003334455', 'luis.martinez@yahoo.com', 'Luis', 'Martínez'),
(4, '3004445566', 'marta.rodriguez@outlook.com', 'Marta', 'Rodríguez'),
(5, '3005556677', 'jorge.lopez@gmail.com', 'Jorge', 'López'),
(6, '3006667788', 'sofia.castro@gmail.com', 'Sofía', 'Castro');

INSERT INTO empleado (idempleado, telefono, puesto, nombre, apellido) VALUES
(1, '3161110000', 'Asesor de Ventas', 'Andrés', 'Morales'),
(2, '3162220000', 'Cajero Principal', 'Camila', 'Vargas'),
(3, '3163330000', 'Gerente de Tienda', 'Fernando', 'Torres'),
(4, '3164440000', 'Soporte Técnico', 'Laura', 'Ríos'),
(5, '3165550000', 'Asesor de Ventas', 'Diego', 'Mendoza'),
(6, '3166660000', 'Auxiliar de Inventario', 'Paula', 'Navarro');

INSERT INTO venta (idventa, fecha, valor, cliente_idcliente, empleado_idempleado) VALUES
(1, '2026-11-01 10:30:00', '4500000.00', 1, 1),
(2, '2026-11-01 11:45:00', '350000.00', 2, 2),
(3, '2026-11-02 14:15:00', '3800000.00', 3, 1),
(4, '2026-11-02 16:00:00', '1200000.00', 4, 5),
(5, '2026-11-03 09:20:00', '60000.00', 5, 2),
(6, '2026-11-03 17:10:00', '280000.00', 6, 5);

INSERT INTO sucursal (idsucursal, ciudad, correo, telefono, nombre_sucursal) VALUES
(1, 'Bogotá', 'norte@tienda.com', '6011234567', 'Sucursal Norte'),
(2, 'Bogotá', 'centro@tienda.com', '6017654321', 'Sucursal Centro'),
(3, 'Medellín', 'poblado@tienda.com', '6042345678', 'Sucursal El Poblado'),
(4, 'Cali', 'chipichape@tienda.com', '6023456789', 'Sucursal Chipichape'),
(5, 'Barranquilla', 'buenavista@tienda.com', '6054567890', 'Sucursal Buenavista'),
(6, 'Bucaramanga', 'cabecera@tienda.com', '6075678901', 'Sucursal Cabecera');

INSERT INTO metodo_pago (idmetodo_pago, plataforma, estado, tipo_pago, venta_idventa) VALUES
(1, 'Nequi', 'Aprobado', 'Transferencia digital', 1),
(2, 'Datafono Redeban', 'Aprobado', 'Tarjeta de Crédito', 2),
(3, 'Efectivo', 'Aprobado', 'Contado', 3),
(4, 'Daviplata', 'Aprobado', 'Transferencia digital', 4),
(5, 'Datafono Bold', 'Rechazado', 'Tarjeta de Débito', 5),
(6, 'Bancolombia QR', 'Aprobado', 'Transferencia digital', 6);


-- -----------------------------------------------------
-- 4. CONSULTA DE LLAVES FORÁNEAS (Reporte del profesor)
-- -----------------------------------------------------
SELECT 
    table_name AS tabla_hija,
    column_name AS columna,
    referenced_table_name AS tabla_padre,
    referenced_column_name AS columna_padre,
    constraint_name AS llave_foranea
FROM information_schema.KEY_COLUMN_USAGE
WHERE table_schema = 'tienda_online'
  AND referenced_table_name IS NOT NULL
ORDER BY table_name, constraint_name;