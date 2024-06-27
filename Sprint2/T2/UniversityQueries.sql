
—1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = ‘alumno’ ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

—2
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = ‘alumno’  AND telefono is null;

—3
SELECT * FROM persona WHERE tipo = ‘alumno’ AND YEAR(fecha_nacimiento) = 1999;

—4
SELECT * FROM persona WHERE tipo = ‘profesor’ AND telefono is null AND nif LIKE ‘%K’;

—5
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

—6
SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id INNER JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY persona.apellido1, persona.apellido2, persona.nombre;

—7
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar AND nif = ‘26902806M’;

—8
SELECT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = ‘Grado en Ingeniería Informática (Plan 2015)’;

—9
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON curso_escolar.id  = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;


-LEFT JOIN I RIGHT JOIN-

—1
SELECT dep.nombre, p.apellido2, p.apellido1, p.nombre FROM departamento dep LEFT JOIN profesor pro ON dep.id = pro.id_departamento LEFT JOIN persona p ON pro.id_profesor = p.id AND p.tipo = 'profesor'ORDER BY dep.nombre ASC, p.apellido2 ASC, p.apellido1 ASC,p.nombre ASC;

—2
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p RIGHT JOIN profesor ON profesor.id_profesor = p.id RIGHT JOIN departamento d ON d.id = profesor.id_departamento WHERE p.tipo = ‘profesor’ AND profesor.id_departamento IS NULL;

—3
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;

—4
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor ON p.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE p.tipo = ‘profesor’ AND asignatura.nombre IS NULL;

-5
SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;

-6
SELECT DISTINCT departamento.nombre FROM asignatura RIGHT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id WHERE asignatura.nombre IS NULL;



-CONSULTES RESUM-

—1
SELECT COUNT(tipo) FROM persona WHERE tipo = ‘alumno’;

—2
SELECT COUNT(tipo) AS ‘alumnes nascuts al 1999’ FROM persona WHERE YEAR(fecha_nacimimento) = 1999;

—3
SELECT departamento.nombre, COUNT(profesor.id_profesor) AS ‘nombre de professors’ FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;

—4
SELECT departamento.nombre, COUNT(profesor.id_profesor) AS ‘nombre de professors’ FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre

—5
SELECT g.nombre AS ’nom del grau’, COUNT(asignatura.id_grado) AS ‘nombre d’assignatures’ FROM grado g LEFT JOIN asignatura ON g.id = asignatura.id_grado GROUP BY g.nombre ORDER BY COUNT(asignatura.id_grado) DESC;
—6
SELECT g.nombre AS ’nom del grau’, COUNT(asignatura.id_grado) AS ‘nombre d’assignatures’ FROM grado g LEFT JOIN asignatura ON g.id = asignatura.id_grado GROUP BY g.nombre HAVING COUNT(asignatura.id_grado) >40;

—7
SELECT g.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado g INNER JOIN asignatura oN g.id = asignatura.id_grado GROUP BY g.nombre, asignatura.tipo;