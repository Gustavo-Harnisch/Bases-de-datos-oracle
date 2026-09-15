-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- SOLUCIONES DEL CAPITULO 3: TRABAJADORES, DEPARTAMENTOS Y JEFATURAS
-- =============================================================================
--
-- Cada ejercicio incluye una posible solucion mediante una sentencia SELECT.
-- Se utilizan nombres fisicos con el prefijo OEHR_. Pueden existir soluciones
-- equivalentes que produzcan exactamente el mismo resultado.
-- =============================================================================


-- PREGUNTA 21 - AFIANZAMIENTO
-- Muestre el codigo y el nombre completo de cada trabajador, el nombre de su
-- departamento y el nombre completo del jefe asociado a ese departamento. Use
-- los alias CODIGO_TRABAJADOR, NOMBRE_TRABAJADOR, DEPARTAMENTO y
-- JEFE_DEPARTAMENTO.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS CODIGO_TRABAJADOR,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_TRABAJADOR,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE_DEPARTAMENTO
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID;


-- PREGUNTA 22 - AFIANZAMIENTO
-- Muestre el codigo y el apellido del trabajador, el departamento y el
-- apellido del jefe del departamento para los departamentos entre 30 y 90.
-- Ordene por codigo de departamento y apellido del trabajador.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS CODIGO_TRABAJADOR,
       E.LAST_NAME AS APELLIDO_TRABAJADOR,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       M.LAST_NAME AS APELLIDO_JEFE
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID
WHERE D.DEPARTMENT_ID BETWEEN 30 AND 90
ORDER BY D.DEPARTMENT_ID, E.LAST_NAME;


-- PREGUNTA 23 - AFIANZAMIENTO
-- Muestre los trabajadores cuyo sueldo sea mayor que el sueldo del jefe de su
-- departamento. Incluya el trabajador, su sueldo, el departamento, el jefe y
-- el sueldo del jefe.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS TRABAJADOR,
       E.SALARY AS SUELDO_TRABAJADOR,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE,
       M.SALARY AS SUELDO_JEFE
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID
WHERE E.SALARY > M.SALARY;


-- PREGUNTA 24 - AFIANZAMIENTO
-- Muestre el codigo y el nombre de cada departamento que tenga jefe asignado,
-- el nombre completo de ese jefe y el nombre del cargo que desempena. Ordene
-- por codigo de departamento.

-- SOLUCION:
SELECT D.DEPARTMENT_ID AS COD_DEPARTAMENTO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE,
       J.JOB_TITLE AS CARGO_JEFE
FROM OEHR_DEPARTMENTS D
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID
JOIN OEHR_JOBS J
  ON J.JOB_ID = M.JOB_ID
ORDER BY D.DEPARTMENT_ID;


-- PREGUNTA 25 - AFIANZAMIENTO
-- Muestre el codigo y el nombre del trabajador, su cargo, su departamento, la
-- ciudad y el jefe del departamento. Debe unir empleados, cargos,
-- departamentos, ubicaciones y nuevamente empleados. Ordene por departamento
-- y apellido del trabajador.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS COD_TRABAJADOR,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS TRABAJADOR,
       J.JOB_TITLE AS CARGO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       L.CITY AS CIUDAD,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE_DEPARTAMENTO
FROM OEHR_EMPLOYEES E
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_LOCATIONS L
  ON L.LOCATION_ID = D.LOCATION_ID
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID
ORDER BY D.DEPARTMENT_NAME, E.LAST_NAME;


-- PREGUNTA 26 - AFIANZAMIENTO
-- Muestre todos los trabajadores, incluso quienes no tienen departamento.
-- Incluya codigo, apellido, departamento y jefe del departamento. Cuando falte
-- un dato, muestre SIN DEPARTAMENTO o SIN JEFE mediante NVL.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS COD_TRABAJADOR,
       E.LAST_NAME AS APELLIDO,
       NVL(D.DEPARTMENT_NAME, 'SIN DEPARTAMENTO') AS DEPARTAMENTO,
       NVL(M.FIRST_NAME || ' ' || M.LAST_NAME, 'SIN JEFE') AS JEFE_DEPARTAMENTO
FROM OEHR_EMPLOYEES E
LEFT JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
LEFT JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID;


-- PREGUNTA 27 - DESAFIO AVANZADO
-- Realice el recorrido trabajador -> departamento -> jefe del departamento ->
-- departamento en el que trabaja ese jefe. Muestre el trabajador, su
-- departamento, el jefe asociado y el departamento del jefe. Los jefes sin
-- departamento registrado deben aparecer.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS TRABAJADOR,
       D.DEPARTMENT_NAME AS DEPARTAMENTO_TRABAJADOR,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE_ASOCIADO,
       DM.DEPARTMENT_NAME AS DEPARTAMENTO_JEFE
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID
LEFT JOIN OEHR_DEPARTMENTS DM
  ON DM.DEPARTMENT_ID = M.DEPARTMENT_ID;


-- PREGUNTA 28 - DESAFIO AVANZADO
-- Por cada departamento, muestre el codigo, el nombre, el jefe, la cantidad de
-- trabajadores y el sueldo promedio. Incluya solo los departamentos con al
-- menos tres trabajadores y promedio superior a 5.000 dolares. Use GROUP BY y
-- HAVING sin duplicar al jefe en el conteo.

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


-- PREGUNTA 29 - DESAFIO AVANZADO
-- Muestre los trabajadores cuyo sueldo sea superior al promedio de su propio
-- departamento. Incluya codigo, trabajador, sueldo, departamento y jefe del
-- departamento. Resuelva el promedio mediante una subconsulta correlacionada.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS COD_TRABAJADOR,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS TRABAJADOR,
       E.SALARY AS SUELDO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE_DEPARTAMENTO
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = D.MANAGER_ID
WHERE E.SALARY > (SELECT AVG(E2.SALARY)
                  FROM OEHR_EMPLOYEES E2
                  WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID);


-- PREGUNTA 30 - DESAFIO AVANZADO
-- Muestre los departamentos cuyo sueldo promedio sea mayor que el promedio
-- general de la empresa. Incluya jefe, cantidad de trabajadores, sueldo
-- minimo, sueldo maximo y sueldo promedio. Considere solo departamentos con
-- mas de un trabajador y resuelva la comparacion mediante una subconsulta.

-- SOLUCION:
SELECT D.DEPARTMENT_ID AS COD_DEPARTAMENTO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_TRABAJADORES,
       MIN(E.SALARY) AS SUELDO_MINIMO,
       MAX(E.SALARY) AS SUELDO_MAXIMO,
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
HAVING COUNT(E.EMPLOYEE_ID) > 1
   AND AVG(E.SALARY) > (SELECT AVG(SALARY)
                        FROM OEHR_EMPLOYEES);
