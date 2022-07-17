
CREATE TABLE users (

	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	username VARCHAR (50) NOT NULL, 
	PASSWORD VARCHAR (100) NOT NULL
);


ALTER TABLE users
RENAME COLUMN PASSWORD TO password;

/* agregar una constraint sobre el campo username . UNIQUE */
`codo-a-codo`ALTER TABLE users 
ADD CONSTRAINT UNIQUE (username);

/*modificar la tabla de socios, agregando un campo users.id*/
ALTER TABLE socios
ADD COLUMN users_id INT NOt NULL;

/* agregar un FK en socios.users_id con la tabla users.id */
ALTER TABLE socios
ADD CONSTRAINT FK_socios_users
FOREIGN KEY (users_id)
REFERENCES users (id);



/*ELIMINAMOS una FK */
ALTER TABLE socios
DROP FOREIGN KEY  FK_socios_users;

ALTER TABLE socios
DROP INDEX   FK_socios_users;

/* crear una tabla, pero no dar una PK  al inicio */

CREATE TABLE categoria (
	id INT NOT NULL,
	descripcion VARCHAR (100) NOT NULL
);

ALTER TABLE categoria 
ADD PRIMARY KEY (id);

ALTER TABLE categoria 
MODIFY COLUMN id INT AUTO_INCREMENT NOT NULL 

ALTER TABLE pedido
ADD CHECK (monto_total >=0);


CREATE TABLE  VENTAS (
	id INT PRIMARY KEY AUTO_INCREMENT,
	socios_id INT NOT NULL,
	feha_venta DATE NOT NULL,
	monto FLOAT NOT NULL 
	);


ALTER TABLE ventas 
RENAME COLUMN feha_venta TO fecha_venta;
/* select * */
SELECT * FROM socios;
/* cargar un registro a la tabla de ventas*/
INSERT INTO ventas (socios_id, fecha_venta, monto) VALUES (1, CURDATE(),1500);

/* como hgo pra ver los datos de ventas*/ 
SELECT * FROM ventas;

/*D.D.L.
- SELECT
-INSERT
-UPDATE
-DELETE


-ORDER BY
-GROUP BY
- HAVING
*/
/* COMO actualizar un valor en ventas*/
UPDATE ventas 
SET monto = 2500
WHERE id = 1;

/*agregar un registro mas */
INSERT INTO ventas (socios_id, fecha_venta, monto) VALUES (2, CURDATE(),5500);

SELECT * FROM ventas;

INSERT INTO ventas (socios_id, fecha_venta, monto) VALUES (15, CURDATE(),52200);


/*como borrar un registro en ventas*/
DELETE FROM ventas WHERE id = 3
DELETE FROM ventas WHERE id = socios_id =15 /* cual es la manera correcta?? se debe elimiar siempre por el id (primary key) y no por el socio ya que el socio puede 
tener otras ventas que no se deseen eliminar. 

/* creando una FK en ventas sobre el campo socios_id*/

ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_socios_id
FOREIGN KEY (socios_id) 
REFERENCES vendedor (id);

/* creamos vendedor*/
CREATE TABLE vendedor (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (100) NOT NULL, 
	apellido VARCHAR (100) NOT NULL,
	documento VARCHAR (13) NOT NULL 
);

/* agregar dos vendedores*/
INSERT INTO vendedor (nombre, apellido, documento) VALUES ('CARLOS', 'LOPEZ', '22232323');
INSERT INTO vendedor (nombre, apellido, documento) VALUES ('ARMANDO', 'DONADO', '546462323');

SELECT  * FROM vendedor

/*quiero ver las ventas de todos los vendedores*/
SELECT *FROM ventas 
	INNER JOIN vendedor
	ON ventas.socios_id = vendedor.id 

/* alias */
SELECT id, nombre FROM vendedor;

SELECT id AS CODIGO, nombre AS NAME FROM vendedor;

/*quiro el id de socio, el monto, y el apellido*/
 SELECT a.socios_id, a.monto,
 b.apellido
 FROM ventas a
 INNER JOIN vendedor b
 ON a. socios_id = b.id


INSERT INTO vendedor (nombre, apellido, documento) VALUES ('FULANO', 'PEREZ', '88826232');
INSERT INTO vendedor (nombre, apellido, documento) VALUES ('SULTANO', 'DIAZ', '2555556');
INSERT INTO vendedor (nombre, apellido, documento) VALUES ('MENGUANO', 'FERRER', '56465464');
INSERT INTO vendedor (nombre, apellido, documento) VALUES ('ALCANO', 'D', '6656565');

SELECT * FROM vendedor; 
SELECT * FROM ventas; 

SELECT * 
FROM ventas a
	RIGHT JOIN vendedor b 
	ON a.socios_id = b.id


/*venta de mayor monto*/
 SELECT MAX(monto) FROM ventas;



/*INSERT INTO producto (nombre, precio,fecha_creacion,imagen,codigo)
VALUES ('mate listo',1500, CURDATE(), '','001')


SELECT * FROM producto 


UPDATE producto precio SET precio = precio *1.1
DELETE FROM producto WHERE id = 1*/









