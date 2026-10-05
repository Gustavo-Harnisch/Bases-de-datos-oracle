-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- SOLUCIONES DEL CAPITULO 1: CONSULTAS SOBRE CARGOS
-- =============================================================================
--
-- Habilidad central:
-- Concatenacion, alias de columna, funciones de texto, UPPER, LIKE y
-- condiciones alternativas sobre los cargos.
--
-- Instrucciones:
-- 1. Cada ejercicio incluye una posible solucion mediante una sentencia SELECT.
-- 2. Las consultas no modifican los datos de las tablas.
-- 3. Se utilizan los nombres fisicos de las tablas con el prefijo OEHR_.
-- 4. Se respetan las columnas, los alias, los filtros y los ordenamientos
--    solicitados en cada enunciado.
-- 5. Pueden existir otras soluciones equivalentes que produzcan el mismo
--    resultado.
--
-- Tabla principal del capitulo: OEHR_JOBS
-- Para los desafios avanzados tambien se utilizan las tablas indicadas en
-- cada enunciado.
-- =============================================================================


-- PREGUNTA 1 - AFIANZAMIENTO
-- Muestre el codigo, nombre y sueldo minimo de los cargos cuyo codigo comience
-- con la letra S. La comparacion no debe depender de mayusculas o minusculas.
-- Use los alias COD_CARGO, NOMBRE_CARGO y SUELDO_MINIMO.

-- SOLUCION:






-- PREGUNTA 2 - AFIANZAMIENTO
-- Muestre el codigo, nombre y sueldo minimo de los cargos cuyo nombre comience
-- con la letra S. Utilice UPPER y LIKE.

-- SOLUCION:






-- PREGUNTA 3 - AFIANZAMIENTO
-- Genere una columna REPORTE con el formato:
--
-- El cargo Sales Manager tiene el codigo SA_MAN
--
-- Muestre tambien el sueldo minimo. Considere los cargos cuyo codigo o nombre
-- comience con A.

-- SOLUCION:






-- PREGUNTA 4 - AFIANZAMIENTO
-- Muestre una frase con el formato:
--
-- SA_MAN corresponde a Sales Manager
--
-- Incluya ademas los sueldos minimo y maximo. Considere los cargos cuyo nombre
-- contenga la palabra Manager, sin distinguir mayusculas o minusculas.

-- SOLUCION:






-- PREGUNTA 5 - AFIANZAMIENTO
-- Muestre el codigo y el nombre concatenados en una sola columna con el alias
-- CARGO, junto con el sueldo minimo. Considere los cargos cuyo codigo tenga la
-- letra A como segundo caracter o cuyo nombre termine en Clerk.
--
-- La columna CARGO debe permitir leer claramente el codigo y el nombre del
-- cargo como un unico texto.

-- SOLUCION:






-- PREGUNTA 6 - AFIANZAMIENTO
-- Muestre un texto con el siguiente formato:
--
-- El codigo del cargo <nombre del cargo> es: <codigo del cargo>
--
-- Muestre tambien el sueldo minimo. Considere todos los cargos cuyo codigo o
-- nombre comience con S. Ordene los resultados por sueldo minimo de mayor a
-- menor y, en caso de igualdad, por nombre del cargo.

-- SOLUCION:






-- PREGUNTA 7 - DESAFIO AVANZADO
-- Para cada cargo cuyo codigo o nombre comience con S, muestre su codigo, su
-- nombre, la cantidad de empleados y el sueldo promedio real redondeado a cero
-- decimales. Incluya solamente los cargos que tengan al menos dos empleados.
-- Utilice OEHR_JOBS y OEHR_EMPLOYEES.

-- SOLUCION:






-- PREGUNTA 8 - DESAFIO AVANZADO
-- Muestre el codigo y el nombre de los cargos cuyo codigo o nombre comience
-- con S y cuyo sueldo promedio real de empleados sea superior al sueldo minimo
-- definido para el cargo. Incluya el sueldo minimo definido y el sueldo
-- promedio real. Ordene los resultados por promedio real de mayor a menor.

-- SOLUCION:






-- PREGUNTA 9 - DESAFIO AVANZADO
-- Por cada departamento, muestre su codigo, su nombre y la cantidad de
-- empleados que ocupan cargos cuyo codigo o nombre comience con S. Incluya solo
-- los departamentos que tengan dos o mas empleados que cumplan esa condicion.
-- Debe unir OEHR_DEPARTMENTS, OEHR_EMPLOYEES y OEHR_JOBS.

-- SOLUCION:






-- PREGUNTA 10 - DESAFIO AVANZADO
-- Por cada region, muestre el nombre de la region, la cantidad de empleados y
-- la cantidad de cargos distintos cuyo codigo o nombre comience con S.
-- Recorra desde OEHR_REGIONS hasta OEHR_JOBS mediante todas las claves foraneas
-- necesarias. Incluya solo las regiones con mas de un empleado coincidente.

-- SOLUCION:
