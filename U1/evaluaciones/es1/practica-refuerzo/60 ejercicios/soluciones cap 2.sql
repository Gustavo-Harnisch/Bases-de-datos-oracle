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
SELECT JOB_ID AS CARGO,
       COUNT(EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS
FROM OEHR_EMPLOYEES
GROUP BY JOB_ID;


-- PREGUNTA 12 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo, el sueldo promedio redondeado a cero
-- decimales, el sueldo minimo real y el sueldo maximo real de sus empleados.

-- SOLUCION:
SELECT JOB_ID AS CARGO,
       ROUND(AVG(SALARY), 0) AS SUELDO_PROMEDIO,
       MIN(SALARY) AS SUELDO_MINIMO,
       MAX(SALARY) AS SUELDO_MAXIMO
FROM OEHR_EMPLOYEES
GROUP BY JOB_ID;


-- PREGUNTA 13 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo, la cantidad de empleados, el promedio de
-- sueldos y la diferencia entre el sueldo maximo y el sueldo minimo. Incluya
-- solamente los cargos cuya diferencia sea distinta de cero.
--
-- La diferencia solicitada se obtiene restando el menor sueldo real al mayor
-- sueldo real de los empleados de cada cargo.

-- SOLUCION:
SELECT JOB_ID AS CARGO,
       COUNT(EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(SALARY), 0) AS SUELDO_PROMEDIO,
       MAX(SALARY) - MIN(SALARY) AS DIFERENCIA_SUELDOS
FROM OEHR_EMPLOYEES
GROUP BY JOB_ID
HAVING MAX(SALARY) - MIN(SALARY) <> 0;


-- PREGUNTA 14 - AFIANZAMIENTO
-- Por cada departamento, muestre su codigo, la cantidad de empleados y la suma
-- total de sus sueldos. Excluya los registros que no tengan departamento y
-- ordene el total de sueldos de mayor a menor.

-- SOLUCION:
SELECT DEPARTMENT_ID AS COD_DEPARTAMENTO,
       COUNT(EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       SUM(SALARY) AS TOTAL_SUELDOS
FROM OEHR_EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY SUM(SALARY) DESC;


-- PREGUNTA 15 - AFIANZAMIENTO
-- Por cada cargo, muestre la cantidad total de empleados y la cantidad que
-- posee comision. Incluya solamente los cargos que tengan al menos dos
-- empleados.
--
-- Para determinar quien posee comision, considere solamente los valores de
-- COMMISSION_PCT que no sean nulos.

-- SOLUCION:
SELECT JOB_ID AS CARGO,
       COUNT(EMPLOYEE_ID) AS TOTAL_EMPLEADOS,
       COUNT(COMMISSION_PCT) AS EMPLEADOS_CON_COMISION
FROM OEHR_EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(EMPLOYEE_ID) >= 2;


-- PREGUNTA 16 - AFIANZAMIENTO
-- Por cada combinacion de departamento y cargo, muestre la cantidad de
-- empleados, el promedio salarial y la diferencia entre el sueldo maximo y el
-- sueldo minimo. Considere departamentos cuyos codigos esten entre 50 y 100.
-- Incluya unicamente los grupos cuya diferencia sea mayor que 1.000 dolares.

-- SOLUCION:
SELECT DEPARTMENT_ID AS COD_DEPARTAMENTO,
       JOB_ID AS CARGO,
       COUNT(EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(SALARY), 0) AS SUELDO_PROMEDIO,
       MAX(SALARY) - MIN(SALARY) AS DIFERENCIA_SUELDOS
FROM OEHR_EMPLOYEES
WHERE DEPARTMENT_ID BETWEEN 50 AND 100
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING MAX(SALARY) - MIN(SALARY) > 1000;


-- PREGUNTA 17 - DESAFIO AVANZADO
-- Muestre el codigo y el nombre del cargo, la cantidad de empleados, el sueldo
-- promedio real y el sueldo minimo definido en OEHR_JOBS. Incluya solamente
-- los cargos cuyo promedio real sea superior al minimo definido y que posean
-- al menos dos empleados.

-- SOLUCION:
SELECT J.JOB_ID AS COD_CARGO,
       J.JOB_TITLE AS NOMBRE_CARGO,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(E.SALARY), 0) AS PROMEDIO_REAL,
       J.MIN_SALARY AS MINIMO_DEFINIDO
FROM OEHR_JOBS J
JOIN OEHR_EMPLOYEES E
  ON E.JOB_ID = J.JOB_ID
GROUP BY J.JOB_ID, J.JOB_TITLE, J.MIN_SALARY
HAVING AVG(E.SALARY) > J.MIN_SALARY
   AND COUNT(E.EMPLOYEE_ID) >= 2;


-- PREGUNTA 18 - DESAFIO AVANZADO
-- Por cada departamento, muestre su codigo, su nombre, el nombre completo de
-- su jefe, la cantidad de trabajadores y el promedio salarial. Incluya los
-- departamentos que tengan al menos tres trabajadores y cuyo promedio sea
-- superior a 5.000 dolares. Deben aparecer solo los departamentos que tengan
-- un jefe asignado.

-- SOLUCION:
SELECT D.DEPARTMENT_ID AS COD_DEPARTAMENTO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_TRABAJADORES,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO
FROM OEHR_DEPARTMENTS D
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID
JOIN OEHR_EMPLOYEES E
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,
         D.DEPARTMENT_NAME,
         M.FIRST_NAME,
         M.LAST_NAME
HAVING COUNT(E.EMPLOYEE_ID) >= 3
   AND AVG(E.SALARY) > 5000;


-- PREGUNTA 19 - DESAFIO AVANZADO
-- Por cada region, muestre su nombre, la cantidad de empleados, el sueldo
-- promedio y la diferencia entre el sueldo maximo y el sueldo minimo. Recorra
-- region, pais, ubicacion, departamento y empleado. Incluya solamente las
-- regiones cuya diferencia salarial sea superior a 5.000 dolares.

-- SOLUCION:
SELECT R.REGION_NAME AS REGION,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO,
       MAX(E.SALARY) - MIN(E.SALARY) AS DIFERENCIA_SUELDOS
FROM OEHR_REGIONS R
JOIN OEHR_COUNTRIES C
  ON C.REGION_ID = R.REGION_ID
JOIN OEHR_LOCATIONS L
  ON L.COUNTRY_ID = C.COUNTRY_ID
JOIN OEHR_DEPARTMENTS D
  ON D.LOCATION_ID = L.LOCATION_ID
JOIN OEHR_EMPLOYEES E
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY R.REGION_NAME
HAVING MAX(E.SALARY) - MIN(E.SALARY) > 5000;


-- PREGUNTA 20 - DESAFIO AVANZADO
-- Muestre los cargos cuyo sueldo promedio sea superior al promedio salarial de
-- toda la empresa. Incluya el codigo del cargo, la cantidad de empleados, el
-- promedio del cargo y el promedio general. Resuelva la comparacion mediante
-- una subconsulta y ordene los resultados de mayor a menor segun el promedio
-- del cargo.

-- SOLUCION:
SELECT JOB_ID AS CARGO,
       COUNT(EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(SALARY), 0) AS PROMEDIO_CARGO,
       ROUND((SELECT AVG(SALARY)
              FROM OEHR_EMPLOYEES), 0) AS PROMEDIO_GENERAL
FROM OEHR_EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > (SELECT AVG(SALARY)
                      FROM OEHR_EMPLOYEES)
ORDER BY AVG(SALARY) DESC;
