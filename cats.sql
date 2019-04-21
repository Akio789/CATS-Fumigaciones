-- Create database
DROP DATABASE IF EXISTS cats;
CREATE DATABASE cats;
use cats;

-- Create tables 
CREATE TABLE Usuario (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(20),
    password VARCHAR(20),
    nombre VARCHAR(100),
    puesto VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(100),
    administrador BOOLEAN DEFAULT false,
    PRIMARY KEY (id)  
);

CREATE TABLE Proveedor (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    correo VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE Producto (
 	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    cant_disp INT,
    costo DOUBLE,
    idProveedor INT,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(id)
);

CREATE TABLE Cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(100),
    direccion VARCHAR(100),
    correo VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE Fumigador (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    correo VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE Servicio (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    costo DOUBLE,
    fecha VARCHAR(100),
    idFumigador INT,
    idCliente INT,
    FOREIGN KEY (idFumigador) REFERENCES Fumigador(id),
	FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE ProductoServicio (
    id_producto INT,
    id_servicio INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id)
);

CREATE TABLE UsuarioProducto (
    id_usuario INT,
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

CREATE TABLE UsuarioServicio (
    id_usuario INT,
    id_servicio INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id)
);


CREATE TABLE UsuarioCliente (
    id_usuario INT,
    id_cliente INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
	fecha TIMESTAMP
);

CREATE TABLE UsuarioProveedor (
    id_usuario INT,
    id_proveedor INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id),
	fecha TIMESTAMP
);

CREATE TABLE UsuarioFumigador (
    id_usuario INT,
    id_fumigador INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_fumigador) REFERENCES Fumigador(id),
	fecha TIMESTAMP
);

-- Dummy data
INSERT INTO `Usuario` (username, password, nombre, puesto, telefono, correo, direccion, administrador) VALUES ('user1', '123', 'Akio', 'Manager', '123456', 'user1@gmail.com', 'Insurgentes Sur', false);

CREATE USER 'catsUser'@'localhost' IDENTIFIED BY 'myPassword';
GRANT ALL PRIVILEGES ON *.* TO 'catsUser'@'localhost';