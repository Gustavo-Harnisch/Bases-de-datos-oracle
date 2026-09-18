-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- CAPITULO 2: FUNCIONES DE GRUPO Y AGRUPACIONES
-- =============================================================================
--
-- Habilidad central:
-- COUNT, AVG, MIN, MAX, diferencias aritmeticas, GROUP BY, HAVING y alias de
-- resultado.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio utilizando una sentencia SELECT.
-- 2. No modifique los datos de las tablas.
-- 3. Utilice los nombres fisicos de las tablas con el prefijo OEHR_.
-- 4. Escriba su consulta debajo del enunciado correspondiente.
-- 5. Respete las columnas, los alias, los filtros, las agrupaciones y los
--    ordenamientos solicitados.
-- 6. Recuerde que WHERE filtra filas antes de agrupar y HAVING filtra grupos
--    despues de aplicar las funciones de grupo.
--
-- Tabla principal del capitulo: OEHR_EMPLOYEES
-- Para los desafios avanzados tambien se utilizan las tablas indicadas en
-- cada enunciado.
-- =============================================================================


-- PREGUNTA 11 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo y la cantidad de empleados. Use los alias
-- CARGO y CANTIDAD_EMPLEADOS.

SELECT J.JOB_ID AS CARGO,
    COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
    ON J.JOB_ID = E.JOB_ID
GROUP BY
    J.JOB_ID;


-- PREGUNTA 12 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo, el sueldo promedio redondeado a cero
-- decimales, el sueldo minimo real y el sueldo maximo real de sus empleados.

SELECT J.JOB_ID AS CODIGO,
    ROUND(AVG(E.SALARY),0) AS PROMEDIO,
    J.MIN_SALARY AS SALARIO_MINIMO,
    J.MAX_SALARY AS SALARIO_MAXIMO
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
    ON J.JOB_ID = E.JOB_ID
GROUP BY
    J.JOB_ID,
    J.MIN_SALARY,
    J.MAX_SALARY;


-- PREGUNTA 13 - AFIANZAMIENTO
-- Por cada cargo, muestre su codigo, la cantidad de empleados, el promedio de
-- sueldos y la diferencia entre el sueldo maximo y el sueldo minimo. Incluya
-- solamente los cargos cuya diferencia sea distinta de cero.
--
-- La diferencia solicitada se obtiene restando el menor sueldo real al mayor
-- sueldo real de los empleados de cada cargo.

SELECT J.JOB_ID AS CODIGO,
    ROUND(AVG(E.SALARY),0) AS PROMEDIO,
    J.MAX_SALARY - J.MIN_SALARY AS DELTA_MAX_MIN
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
    ON J.JOB_ID = E.JOB_ID
GROUP BY
    J.JOB_ID,
    J.MAX_SALARY,
    J.MIN_SALARY
HAVING J.MAX_SALARY - MIN_SALARY <> 0
ORDER BY
    ROUND(AVG(E.SALARY),0) ASC;




-- PREGUNTA 14 - AFIANZAMIENTO
-- Por cada departamento, muestre su codigo, la cantidad de empleados y la suma
-- total de sus sueldos. Excluya los registros que no tengan departamento y
-- ordene el total de sueldos de mayor a menor.

SELECT E.DEPARTMENT_ID AS ID_DEPARTAMENTO,
    COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
    SUM(E.SALARY) AS SUMATORIA_SUELDO
FROM HR.EMPLOYEES E
WHERE E.DEPARTMENT_ID IS NOT NULL
GROUP BY E.DEPARTMENT_ID
ORDER BY SUM(E.SALARY) DESC;



-- PREGUNTA 15 - AFIANZAMIENTO
-- Por cada cargo, muestre la cantidad total de empleados y la cantidad que
-- posee comision. Incluya solamente los cargos que tengan al menos dos
-- empleados.
--
-- Para determinar quien posee comision, considere solamente los valores de
-- COMMISSION_PCT que no sean nulos.

SELECT J.JOB_ID AS NOMBRE_DEL_CARGO,
    COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
    SUM(E.COMMISSION_PCT) AS SUMATORIA_COMISION
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
    ON J.JOB_ID = E.JOB_ID
WHERE  E.COMMISSION_PCT IS NOT NULL
GROUP BY
    J.JOB_ID
HAVING COUNT(EMPLOYEE_ID) >= 2;

-- PREGUNTA 16 - AFIANZAMIENTO
-- Por cada combinacion de departamento y cargo, muestre la cantidad de
-- empleados, el promedio salarial y la diferencia entre el sueldo maximo y el
-- sueldo minimo. Considere departamentos cuyos codigos esten entre 50 y 100.
-- Incluya unicamente los grupos cuya diferencia sea mayor que 1.000 dolares.

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

SELECT J.JOB_ID AS CARGO_ID,
       J.JOB_TITLE As NOMBRE_CARGO,
       COUNT(E.EMPLOYEE_ID) CANTIDAD_EMPLEADOS,
       ROUND(AVG(E.SALARY),0) PROMEDIO_SUELDO,
       J.MIN_SALARY AS SULEDO_MINIMO_CARGO
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
    ON E.JOB_ID = J.JOB_ID
GROUP BY
    J.JOB_ID,
    J.JOB_TITLE,
    J.MIN_SALARY
HAVING COUNT(E.EMPLOYEE_ID) >= 2 AND
    AVG(E.SALARY) > J.MIN_SALARY;



-- PREGUNTA 18 - DESAFIO AVANZADO
-- Por cada departamento, muestre su codigo, su nombre, el nombre completo de
-- su jefe, la cantidad de trabajadores y el promedio salarial. Incluya los
-- departamentos que tengan al menos tres trabajadores y cuyo promedio sea
-- superior a 5.000 dolares. Deben aparecer solo los departamentos que tengan
-- un jefe asignado.


SELECT D.DEPARTMENT_ID,
    D.DEPARTMENT_NAME,
    B.FIRST_NAME || ' ' || B.LAST_NAME,
    COUNT(E.EMPLOYEE_ID),
    ROUND(AVG(E.SALARY))
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.EMPLOYEES B
    ON D.MANAGER_ID = B.EMPLOYEE_ID
GROUP BY D.DEPARTMENT_ID,
    D.DEPARTMENT_NAME,
    B.FIRST_NAME,
    B.LAST_NAME
HAVING COUNT(E.EMPLOYEE_ID) >= 3
    AND ROUND(AVG(E.SALARY),0)
ORDER BY D.DEPARTMENT_ID ASC;



-- PREGUNTA 19 - DESAFIO AVANZADO
-- Por cada region, muestre su nombre, la cantidad de empleados, el sueldo
-- promedio y la diferencia entre el sueldo maximo y el sueldo minimo. Recorra
-- region, pais, ubicacion, departamento y empleado. Incluya solamente las
-- regiones cuya diferencia salarial sea superior a 5.000 dolares.


SELECT R.REGION_NAME AS NOMBRE_REGION,
    COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
    ROUND(AVG(E.SALARY)) AS PROMEDIO_SUELDO,
    MAX(E.SALARY) - MIN(E.SALARY) AS DIFERENCIA_SUELDOS
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.LOCATIONS L
    ON L.LOCATION_ID = D.LOCATION_ID
JOIN HR.COUNTRIES C
    ON C.COUNTRY_ID = L.COUNTRY_ID
JOIN HR.REGIONS R
    ON R.REGION_ID = C.REGION_ID
GROUP BY
    R.REGION_NAME
HAVING MAX(E.SALARY) - MIN(E.SALARY) > 5000
ORDER BY  MAX(E.SALARY) - MIN(E.SALARY);




-- PREGUNTA 20 - DESAFIO AVANZADO
-- Muestre los cargos cuyo sueldo promedio sea superior al promedio salarial de
-- toda la empresa. Incluya el codigo del cargo, la cantidad de empleados, el
-- promedio del cargo y el promedio general. Resuelva la comparacion mediante
-- una subconsulta y ordene los resultados de mayor a menor segun el promedio
-- del cargo.

SELECT J.JOB_ID AS CARGO,
    COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
    ROUND(AVG(E.SALARY)) AS PROMEDIO_DEL_CARGO,
    ROUND((
        SELECT AVG(SALARY)
        FROM HR.EMPLOYEES)
    ,0) AS PROMEDIO_GENERAL
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
    ON J.JOB_ID = E.JOB_ID
GROUP BY
    J.JOB_ID
HAVING AVG(E.SALARY) > (SELECT AVG(SALARY)
                        FROM HR.EMPLOYEES)
ORDER BY AVG(E.SALARY) DESC;
