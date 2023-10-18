
CREATE TABLE departamento (
  id INT NOT NULL UNIQUE PRIMARY KEY,
  nombre CHAR(30) NOT NULL);


CREATE INDEX departamento_nombre_index ON departamento (nombre);


CREATE TABLE empleado (
  id INT NOT NULL ,
  nombre VARCHAR(60) NOT NULL,
  apellido1 VARCHAR(75) NOT NULL,
  apellido2 VARCHAR(75) NULL,
  dni CHAR(10) NOT NULL,
  telefono CHAR(15) NOT NULL,
  departamento_id INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (dni),
  CONSTRAINT fk_empleado_departamento
    FOREIGN KEY (departamento_id)
    REFERENCES departamento (id));


CREATE INDEX telefono_idx ON empleado(telefono);

-- -----------------------------------------------------
-- Data for table departamento
-- -----------------------------------------------------
INSERT INTO departamento (id, nombre) VALUES (1, 'Administración');
INSERT INTO departamento (id, nombre) VALUES (2, 'Ventas Comerciales');
INSERT INTO departamento (id, nombre) VALUES (3, 'Ventas Mayoristas');
INSERT INTO departamento (id, nombre) VALUES (4, 'Atención al cliente');

-- -----------------------------------------------------
-- Data for table empleado
-- -----------------------------------------------------
INSERT INTO empleado (id, nombre, apellido1, apellido2, dni, telefono, departamento_id) VALUES (1, 'Benito', 'Asensio', 'Asensio', '05666777J', '666777888', 4);
INSERT INTO empleado (id, nombre, apellido1, apellido2, dni, telefono, departamento_id) VALUES (2, 'Ismael', 'León', 'Guerrero', '13123456K', '679999876', 1);
INSERT INTO empleado (id, nombre, apellido1, apellido2, dni, telefono, departamento_id) VALUES (3, 'Sara', 'López', 'García', '13654456L', '665555123', 1);
