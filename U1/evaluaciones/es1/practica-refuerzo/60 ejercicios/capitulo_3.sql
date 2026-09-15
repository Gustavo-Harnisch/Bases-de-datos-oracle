-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- CAPITULO 3: RELACIONES ENTRE TRABAJADORES, DEPARTAMENTOS Y JEFATURAS
-- =============================================================================
--
-- Habilidad central:
-- JOIN, ON, alias de tablas, desambiguacion, autorrelaciones y vinculos entre
-- trabajadores, departamentos y jefaturas.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio utilizando una sentencia SELECT.
-- 2. No modifique los datos de las tablas.
-- 3. Utilice los nombres fisicos de las tablas con el prefijo OEHR_.
-- 4. Use alias diferentes cuando una misma tabla participe mas de una vez.
-- 5. Determine cada union mediante las claves primarias y foraneas del modelo.
-- 6. Respete las columnas, los filtros, los grupos y los ordenamientos pedidos.
-- =============================================================================


-- PREGUNTA 21 - AFIANZAMIENTO
-- Muestre el codigo y el nombre completo de cada trabajador, el nombre de su
-- departamento y el nombre completo del jefe asociado a ese departamento. Use
-- los alias CODIGO_TRABAJADOR, NOMBRE_TRABAJADOR, DEPARTAMENTO y
-- JEFE_DEPARTAMENTO.



-- PREGUNTA 22 - AFIANZAMIENTO
-- Muestre el codigo y el apellido del trabajador, el departamento y el
-- apellido del jefe del departamento para los departamentos entre 30 y 90.
-- Ordene por codigo de departamento y apellido del trabajador.



-- PREGUNTA 23 - AFIANZAMIENTO
-- Muestre los trabajadores cuyo sueldo sea mayor que el sueldo del jefe de su
-- departamento. Incluya el trabajador, su sueldo, el departamento, el jefe y
-- el sueldo del jefe.



-- PREGUNTA 24 - AFIANZAMIENTO
-- Muestre el codigo y el nombre de cada departamento que tenga jefe asignado,
-- el nombre completo de ese jefe y el nombre del cargo que desempena. Ordene
-- por codigo de departamento.



-- PREGUNTA 25 - AFIANZAMIENTO
-- Muestre el codigo y el nombre del trabajador, su cargo, su departamento, la
-- ciudad y el jefe del departamento. Debe unir empleados, cargos,
-- departamentos, ubicaciones y nuevamente empleados. Ordene por departamento
-- y apellido del trabajador.



-- PREGUNTA 26 - AFIANZAMIENTO
-- Muestre todos los trabajadores, incluso quienes no tienen departamento.
-- Incluya codigo, apellido, departamento y jefe del departamento. Cuando falte
-- un dato, muestre SIN DEPARTAMENTO o SIN JEFE mediante NVL.



-- PREGUNTA 27 - DESAFIO AVANZADO
-- Realice el recorrido trabajador -> departamento -> jefe del departamento ->
-- departamento en el que trabaja ese jefe. Muestre el trabajador, su
-- departamento, el jefe asociado y el departamento del jefe. Los jefes sin
-- departamento registrado deben aparecer.



-- PREGUNTA 28 - DESAFIO AVANZADO
-- Por cada departamento, muestre el codigo, el nombre, el jefe, la cantidad de
-- trabajadores y el sueldo promedio. Incluya solo los departamentos con al
-- menos tres trabajadores y promedio superior a 5.000 dolares. Use GROUP BY y
-- HAVING sin duplicar al jefe en el conteo.



-- PREGUNTA 29 - DESAFIO AVANZADO
-- Muestre los trabajadores cuyo sueldo sea superior al promedio de su propio
-- departamento. Incluya codigo, trabajador, sueldo, departamento y jefe del
-- departamento. Resuelva el promedio mediante una subconsulta correlacionada.



-- PREGUNTA 30 - DESAFIO AVANZADO
-- Muestre los departamentos cuyo sueldo promedio sea mayor que el promedio
-- general de la empresa. Incluya jefe, cantidad de trabajadores, sueldo
-- minimo, sueldo maximo y sueldo promedio. Considere solo departamentos con
-- mas de un trabajador y resuelva la comparacion mediante una subconsulta.


