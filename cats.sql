-- MySQL dump 10.13  Distrib 5.1.50, for Win64 (unknown)
--
-- Host: localhost    Database: cats
-- ------------------------------------------------------
-- Server version	5.1.50-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/* Create database */
DROP DATABASE IF EXISTS cats;
CREATE DATABASE cats;
use cats;

/* Tables */
CREATE TABLE Usuario (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(20),
    password VARCHAR(20),
    nombre VARCHAR(100),
    puesto VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(100),
    administrador BIT,
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
    idProveedor INT NOT NULL,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(id)
);

CREATE TABLE Cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
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
    fecha DATE,
    idFumigador INT NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY (idFumigador) REFERENCES Fumigador(id),
	FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE ProductoServicio (
    id_producto INT NOT NULL,
    id_servicio INT NOT NULL,
    PRIMARY KEY (id_producto, id_servicio),
    FOREIGN KEY (id_producto) REFERENCES Producto(id),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id)
);

CREATE TABLE UsuarioProducto (
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_usuario,id_producto),
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

CREATE TABLE UsuarioServicio (
    id_usuario INT NOT NULL,
    id_servicio INT NOT NULL,
    PRIMARY KEY (id_usuario,id_servicio),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id)
);


CREATE TABLE UsuarioCliente (
    id_usuario INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_usuario, id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
	fecha Date
);

CREATE TABLE UsuarioProveedor (
    id_usuario INT NOT NULL,
    id_proveedor INT NOT NULL,
    PRIMARY KEY (id_usuario, id_proveedor),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id),
	fecha Date
);

CREATE TABLE UsuarioFumigador (
    id_usuario INT NOT NULL,
    id_fumigador INT NOT NULL,
    PRIMARY KEY (id_usuario, id_fumigador),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_fumigador) REFERENCES Fumigador(id),
	fecha Date
);

INSERT INTO `Usuario` (username, password, nombre, puesto, telefono, correo, direccion, administrador) VALUES ('user1', '123', 'Akio', 'Manager', '123456', 'user1@gmail.com', 'Insurgentes Sur', b'1');

CREATE USER 'catsUser'@'localhost' IDENTIFIED BY 'myPassword';
GRANT SELECT,UPDATE,INSERT ON *.* TO 'catsUser'@'localhost';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-08-27 21:26:29
