-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- CAPITULO 4: AGRUPACION DE CARGOS Y COMPARACION DE SUELDOS
-- =============================================================================
--
-- Habilidad central:
-- Promedios de sueldos minimos, agrupacion de cargos, GROUP BY, HAVING y
-- comparacion entre rangos configurados y sueldos reales.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio utilizando una sentencia SELECT.
-- 2. No modifique los datos de las tablas.
-- 3. Utilice los nombres fisicos de las tablas con el prefijo OEHR_.
-- 4. Escriba su consulta debajo del enunciado correspondiente.
-- 5. Respete columnas, alias, agrupaciones, filtros y comparaciones solicitadas.
-- 6. Cuando se solicite un area o familia, formela con los dos primeros
--    caracteres de JOB_ID.
-- =============================================================================


-- PREGUNTA 31 - AFIANZAMIENTO
-- Muestre los codigos de oficio cuyo promedio de sueldo minimo sea mayor que
-- 3.000 dolares. Use los alias CODIGO_OFICIO y PROMEDIO_SUELDO_MINIMO.



-- PREGUNTA 32 - AFIANZAMIENTO
-- Agrupe los oficios por los dos primeros caracteres de su codigo. Muestre el
-- area y el promedio de sus sueldos minimos redondeado a cero decimales.
-- Incluya solamente las areas cuyo promedio sea superior a 4.000 dolares.



-- PREGUNTA 33 - AFIANZAMIENTO
-- Muestre los codigos de oficio cuyo promedio de sueldo minimo este entre
-- 2.500 y 8.000 dolares. Ordene desde el promedio mas alto.



-- PREGUNTA 34 - AFIANZAMIENTO
-- Por cada area definida por los dos primeros caracteres del codigo de oficio,
-- muestre la cantidad de oficios y el promedio de sueldo minimo. Incluya solo
-- las areas con al menos dos oficios y promedio superior a 3.000 dolares.



-- PREGUNTA 35 - AFIANZAMIENTO
-- Para cada oficio ocupado, muestre codigo, nombre, sueldo minimo configurado,
-- cantidad de trabajadores y sueldo promedio real. Incluya solamente los
-- oficios cuyo promedio real sea mayor que el minimo configurado.



-- PREGUNTA 36 - AFIANZAMIENTO
-- Por cada departamento, muestre codigo, nombre, cantidad de trabajadores y
-- promedio del sueldo minimo configurado para los cargos de esos trabajadores.
-- Incluya solo departamentos con al menos dos trabajadores y promedio de
-- minimos superior a 4.000 dolares.



-- PREGUNTA 37 - DESAFIO AVANZADO
-- Agrupe los trabajadores por el area de su oficio, definida por los dos
-- primeros caracteres de JOB_ID. Muestre la cantidad de trabajadores, el
-- promedio salarial real y el promedio de sueldo minimo configurado. Incluya
-- areas con al menos tres trabajadores cuyo promedio real supere en un 50 % el
-- promedio de minimos.



-- PREGUNTA 38 - DESAFIO AVANZADO
-- Por cada departamento, muestre la cantidad de oficios distintos, el promedio
-- salarial real y el promedio de los sueldos minimos asociados. Incluya
-- departamentos con al menos dos oficios y cuyo promedio real sea mayor que el
-- promedio de minimos.



-- PREGUNTA 39 - DESAFIO AVANZADO
-- Muestre los oficios ocupados por mas de un trabajador cuyo promedio real sea
-- mayor que el promedio general de sueldos. Incluya codigo, nombre, minimo y
-- maximo configurados, cantidad de trabajadores y promedio real.



-- PREGUNTA 40 - DESAFIO AVANZADO
-- Forme familias de oficios con los dos primeros caracteres de JOB_ID. Calcule
-- la cantidad de oficios y el promedio de minimos usando una sola vez cada
-- cargo del catalogo OEHR_JOBS. Calcule por separado la cantidad de
-- trabajadores de la familia. Muestre solo las familias cuyo promedio minimo
-- sea mayor que el promedio general del catalogo y que tengan al menos dos
-- trabajadores.


