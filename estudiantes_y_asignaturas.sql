CREATE DATABASE estudiantes_y_asignaturas;
GO
USE estudiantes_y_asignaturas;

CREATE TABLE estudiantes (
    id_estudiante INT,
    nombre VARCHAR(50),
    edad INT,
    carrera VARCHAR(50),
	nota_media DECIMAL(2,1)
);

CREATE TABLE asignaturas (
    id_asignatura INT,
    nombre_curso VARCHAR(50),
    creditos INT,
    departamento VARCHAR(50)
);


--1. Insertar 5 estudiantes, sin especificar el nombre de los campos

INSERT INTO estudiantes VALUES (1,'Juan Pérez',20,'Ingeniería de Sistemas',8.5)
INSERT INTO estudiantes VALUES(2,'María García',22,'Psicología',7.2);
INSERT INTO estudiantes VALUES (3,'Carlos Martínez',21,'Administración de Empresas',9.5);
INSERT INTO estudiantes VALUES (4,'Sofía López',19,'Contabilidad',5.5);
INSERT INTO estudiantes VALUES (5,'Luis Rodríguez',23,'Ingeniería Civil',8.7);

--2. Insertar 5 estudiantes más, especificando el nombre de los campos 
INSERT INTO estudiantes (id_estudiante, nombre, edad, carrera, nota_media) VALUES (6,'Ana Ruiz',20,'Medicina',9.2);
INSERT INTO estudiantes (id_estudiante, nombre, edad, carrera, nota_media) VALUES (7,'Pablo Gómez',22,'Arquitectura',8.1);
INSERT INTO estudiantes (id_estudiante, nombre, edad, carrera, nota_media) VALUES (8,'Andrea Díaz',21,'Economía',6.7);
INSERT INTO estudiantes (id_estudiante, nombre, edad, carrera, nota_media) VALUES (9,'Elena Fernández',20,'Psicología',7.3);
INSERT INTO estudiantes (id_estudiante, nombre, edad, carrera, nota_media) VALUES (10,'Miguel Torres',24,'Economía',8.2);

--3. Insertar 5 asignaturas, sin especificar el nombre de los campos
INSERT INTO asignaturas VALUES (1,'Bases de Datos',3,'Ciencias de la Computación');
INSERT INTO asignaturas VALUES (2,'Matemáticas Avanzadas',4,'Matemáticas');
INSERT INTO asignaturas VALUES (3,'Finanzas Corporativas',3,'Economía');
INSERT INTO asignaturas VALUES (4,'Psicología Social',3,'Psicología');
INSERT INTO asignaturas VALUES (5,'Inglés Avanzado',2,'Lenguas Extranjeras');

--4. Insertar 5 asignaturas más, especificando el nombre de los campos 
INSERT INTO asignaturas (id_asignatura, nombre_curso, creditos, departamento) VALUES (6,'Programación en C',4,'Ciencias de la Computación');
INSERT INTO asignaturas (id_asignatura, nombre_curso, creditos, departamento) VALUES (7,'Arte Contemporáneo',2,'Bellas Artes');
INSERT INTO asignaturas (id_asignatura, nombre_curso, creditos, departamento) VALUES (8,'Derecho Civil',3,'Derecho');
INSERT INTO asignaturas (id_asignatura, nombre_curso, creditos, departamento) VALUES (9,'Marketing Estratégico',3,'Marketing');
INSERT INTO asignaturas (id_asignatura, nombre_curso, creditos, departamento) VALUES (10,'Física Cuántica',4,'Física');

--5- Listar todos datos, de todos los estudiantes
	
	select * from estudiantes;

--6. Listar el nombre y la edad de todos los estudiantes, ordenados alfabeticamente por su nombre empezando por A
	
	select nombre, edad from estudiantes
	order by nombre asc;

--7. Listar el nombre y la edad de todos los estudiantes, ordenados por su edad
	
	select nombre, edad from estudiantes
	order by edad;

--8. Listar el nombre y la edad de los estudiantes que que empiezan por 'A' o por 'M'
	
	select nombre, edad from estudiantes
	where nombre like 'A%' or nombre like 'M%';

--9. Listar el nombre, edad y la nota media los estudiantes, ordenados por su edad y si ésta coincide por su nota media
	
	select nombre, edad, AVG(nota_media) as Nota_media from estudiantes
	group by nombre, edad
	order by edad, nota_media;

--10. Listar las asignaturas por orden alfabetico
	
	select nombre_curso   from asignaturas
	order by nombre_curso;

--11. Ordenar las asignaturas por numero de creditos
	
	select * from asignaturas
	order by creditos;

--12. Calcular la cantidad total de créditos de todos los cursos
	
	select SUM(creditos) Cantidad_Total from asignaturas;

--13. Calcular la edad promedio de los estudiantes
	
	Select Avg(edad) Promedio_Estudiantes from estudiantes;

--14. Listar los estudiantes que estén por debajo de la edad promedio
	
	select nombre, edad from estudiantes 
	where edad < (Select AVG(edad)as Edad_promedio FROM estudiantes);

--15. Obtener el departamento con más asignaturas
	
	select Top (1) departamento, Count(*) as Cantidad_asigaturas from asignaturas
	group by departamento order by Cantidad_asigaturas desc ;

--16. Obtener la asignatura con más créditos
	
	Select nombre_curso from asignaturas
	where creditos = (select Max(creditos) from asignaturas);

--17. Obtener la suma total de créditos entre todas las asignaturas
	
	select SUM(creditos) Suma_Total from asignaturas;

--18. Obtener la cantidad de estudiantes en cada carrera
	
	Select carrera, COUNT(*) Cantidad_estudiantes from estudiantes
	Group by carrera;

--19. Obtener la cantidad de estudiantes por cada edad (GROUP BY)
	
	Select Count from estudiantes
