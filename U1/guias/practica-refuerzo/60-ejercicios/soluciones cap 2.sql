-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- SOLUCIONES DEL CAPITULO 2: FUNCIONES DE GRUPO Y AGRUPACIONES
-- =============================================================================
--
-- Habilidad central:
-- COUNT, AVG, MIN, MAX, diferencias aritmeticas, GROUP BY, HAVING y alias de
-- resultado.
--
-- Instrucciones:
-- 1. Cada ejercicio incluye una posible solucion mediante una sentencia SELECT.
-- 2. Las consultas no modifican los datos de las tablas.
-- 3. Se utilizan los nombres fisicos de las tablas con el prefijo OEHR_.
-- 4. Se respetan las columnas, los alias, los filtros, las agrupaciones y los
--    ordenamientos solicitados en cada enunciado.
-- 5. Pueden existir otras soluciones equivalentes que produzcan el mismo
--    resultado.
--
-- Tabla principal del capitulo: OEHR_EMPLOYEES
-- Para los desafios avanzados tambien se utilizan las tablas indicadas en
-- cada enunciado.
-- =============================================================================


-- PREGUNTA 11 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo y la cantidad de empleados. Use los alias
-- CARGO y CANTIDAD_EMPLEADOS.

-- SOLUCION:






-- PREGUNTA 12 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo, el sueldo promedio redondeado a cero
-- decimales, el sueldo minimo real y el sueldo maximo real de sus empleados.

-- SOLUCION:






-- PREGUNTA 13 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo, la cantidad de empleados, el promedio de
-- sueldos y la diferencia entre el sueldo maximo y el sueldo minimo. Incluya
-- solamente los cargos cuya diferencia sea distinta de cero.
--
-- La diferencia solicitada se obtiene restando el menor sueldo real al mayor
-- sueldo real de los empleados de cada cargo.

-- SOLUCION:






-- PREGUNTA 14 - AFIANZAMIENTO
-- Por cada departamento, muestre su codigo, la cantidad de empleados y la suma
-- total de sus sueldos. Excluya los registros que no tengan departamento y
-- ordene el total de sueldos de mayor a menor.

-- SOLUCION:






-- PREGUNTA 15 - AFIANZAMIENTO
-- Por cada cargo, muestre la cantidad total de empleados y la cantidad que
-- posee comision. Incluya solamente los cargos que tengan al menos dos
-- empleados.
--
-- Para determinar quien posee comision, considere solamente los valores de
-- COMMISSION_PCT que no sean nulos.

-- SOLUCION:






-- PREGUNTA 16 - AFIANZAMIENTO
-- Por cada combinacion de departamento y cargo, muestre la cantidad de
-- empleados, el promedio salarial y la diferencia entre el sueldo maximo y el
-- sueldo minimo. Considere departamentos cuyos codigos esten entre 50 y 100.
-- Incluya unicamente los grupos cuya diferencia sea mayor que 1.000 dolares.

-- SOLUCION:






-- PREGUNTA 17 - DESAFIO AVANZADO
-- Muestre el codigo y el nombre del cargo, la cantidad de empleados, el sueldo
-- promedio real y el sueldo minimo definido en OEHR_JOBS. Incluya solamente
-- los cargos cuyo promedio real sea superior al minimo definido y que posean
-- al menos dos empleados.

-- SOLUCION:






-- PREGUNTA 18 - DESAFIO AVANZADO
-- Por cada departamento, muestre su codigo, su nombre, el nombre completo de
-- su jefe, la cantidad de trabajadores y el promedio salarial. Incluya los
-- departamentos que tengan al menos tres trabajadores y cuyo promedio sea
-- superior a 5.000 dolares. Deben aparecer solo los departamentos que tengan
-- un jefe asignado.

-- SOLUCION:






-- PREGUNTA 19 - DESAFIO AVANZADO
-- Por cada region, muestre su nombre, la cantidad de empleados, el sueldo
-- promedio y la diferencia entre el sueldo maximo y el sueldo minimo. Recorra
-- region, pais, ubicacion, departamento y empleado. Incluya solamente las
-- regiones cuya diferencia salarial sea superior a 5.000 dolares.

-- SOLUCION:






-- PREGUNTA 20 - DESAFIO AVANZADO
-- Muestre los cargos cuyo sueldo promedio sea superior al promedio salarial de
-- toda la empresa. Incluya el codigo del cargo, la cantidad de empleados, el
-- promedio del cargo y el promedio general. Resuelva la comparacion mediante
-- una subconsulta y ordene los resultados de mayor a menor segun el promedio
-- del cargo.

-- SOLUCION:
