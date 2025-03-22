USE TiendaSuplementacion;

-- Tabla de clientes (no tiene dependencias, se puede crear primero)
CREATE TABLE IF NOT EXISTS clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(255),
  telefono VARCHAR(20)
);

-- Tabla de proveedores (no tiene dependencias, se puede crear también al inicio)
CREATE TABLE IF NOT EXISTS proveedores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(100)
);

-- Tabla de productos (depende de proveedores)
CREATE TABLE IF NOT EXISTS productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255),
  precio DECIMAL(10,2),
  proveedor_id INT,
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

-- Tabla de ventas (depende de clientes y productos)
CREATE TABLE IF NOT EXISTS ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  producto_id INT,
  fecha DATE,
  cantidad INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Inserción de datos en proveedores
INSERT INTO proveedores (nombre, telefono, email) VALUES
('NutriFit', '555-1234', 'contacto@nutrifit.com'),
('SportMax', '555-5678', 'info@sportmax.com'),
('VidaSana', '555-9012', 'ventas@vidasana.com');

-- Inserción de datos en productos
INSERT INTO productos (nombre, descripcion, precio, proveedor_id) VALUES
('Proteína Whey', 'Proteína de suero de leche', 29.99, 1),
('Creatina Monohidratada', 'Creatina en polvo para rendimiento', 19.99, 2),
('Multivitamínico', 'Vitaminas y minerales esenciales', 14.99, 3);

-- Inserción de datos en clientes
INSERT INTO clientes (nombre, direccion, telefono) VALUES
('Carlos Pérez', 'Calle 123, Ciudad A', '555-0011'),
('Lucía Gómez', 'Avenida 456, Ciudad B', '555-0022'),
('Mario Rodríguez', 'Plaza 789, Ciudad C', '555-0033');

-- Inserción de datos en ventas
INSERT INTO ventas (cliente_id, producto_id, fecha, cantidad) VALUES
(1, 1, '2024-03-01', 2),
(2, 2, '2024-03-05', 1),
(3, 3, '2024-03-10', 3);
