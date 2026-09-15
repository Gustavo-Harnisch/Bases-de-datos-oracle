-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- SOLUCIONES DEL CAPITULO 5: EMPLEADOS Y SUBCONSULTAS
-- =============================================================================
--
-- Cada ejercicio incluye una posible solucion mediante una sentencia SELECT.
-- Se utilizan nombres fisicos con el prefijo OEHR_. Pueden existir soluciones
-- equivalentes que produzcan exactamente el mismo resultado.
-- =============================================================================


-- PREGUNTA 41 - AFIANZAMIENTO
-- Muestre el codigo, el nombre y el apellido de quienes trabajan en el mismo
-- departamento que algun empleado de apellido Whalen. Obtenga el departamento
-- mediante una subconsulta.

-- SOLUCION:
SELECT EMPLOYEE_ID AS CODIGO,
       FIRST_NAME AS NOMBRE,
       LAST_NAME AS APELLIDO
FROM OEHR_EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM OEHR_EMPLOYEES
                        WHERE UPPER(LAST_NAME) = 'WHALEN');


-- PREGUNTA 42 - AFIANZAMIENTO
-- Muestre el codigo y el nombre completo de quienes pertenecen a los mismos
-- departamentos que Whalen o King, junto con el nombre del departamento. Use
-- los alias COD_EMPLEADO, NOMBRE_EMPLEADO y DEPARTAMENTO.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS COD_EMPLEADO,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_EMPLEADO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'));


-- PREGUNTA 43 - AFIANZAMIENTO
-- Muestre el codigo, el nombre completo, el sueldo y el cargo de quienes
-- trabajan en los mismos departamentos que Whalen o King y ganan mas de 7.000
-- dolares. Ordene por sueldo de mayor a menor.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS COD_EMPLEADO,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_EMPLEADO,
       E.SALARY AS SUELDO,
       J.JOB_TITLE AS CARGO
FROM OEHR_EMPLOYEES E
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
WHERE E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'))
  AND E.SALARY > 7000
ORDER BY E.SALARY DESC;


-- PREGUNTA 44 - AFIANZAMIENTO
-- Muestre los empleados de los mismos departamentos que Whalen o King, junto
-- con el nombre de su cargo y el sueldo minimo definido para este. Una
-- empleados y cargos, y use una subconsulta para obtener los departamentos.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS COD_EMPLEADO,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_EMPLEADO,
       J.JOB_TITLE AS CARGO,
       J.MIN_SALARY AS SUELDO_MINIMO_CARGO
FROM OEHR_EMPLOYEES E
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
WHERE E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'));


-- PREGUNTA 45 - AFIANZAMIENTO
-- Muestre los empleados de los mismos departamentos que Whalen o King y el
-- nombre completo de su jefe directo. Deben aparecer tambien quienes no tengan
-- jefe. Use una autorrelacion externa.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS COD_EMPLEADO,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_EMPLEADO,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE_DIRECTO
FROM OEHR_EMPLOYEES E
LEFT JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = E.MANAGER_ID
WHERE E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'));


-- PREGUNTA 46 - AFIANZAMIENTO
-- Por cada departamento en el que trabaje Whalen o King, muestre el codigo, el
-- nombre, la cantidad de empleados y el sueldo promedio. Incluya solamente los
-- departamentos que tengan dos o mas empleados.

-- SOLUCION:
SELECT D.DEPARTMENT_ID AS COD_DEPARTAMENTO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO
FROM OEHR_DEPARTMENTS D
JOIN OEHR_EMPLOYEES E
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'))
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) >= 2;


-- PREGUNTA 47 - DESAFIO AVANZADO
-- Muestre los empleados de los mismos departamentos que Whalen o King. Incluya
-- departamento, cargo, ciudad y jefe directo. Deben aparecer quienes no tengan
-- jefe. Una empleados, departamentos, cargos, ubicaciones y nuevamente
-- empleados.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       J.JOB_TITLE AS CARGO,
       L.CITY AS CIUDAD,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE_DIRECTO
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
JOIN OEHR_LOCATIONS L
  ON L.LOCATION_ID = D.LOCATION_ID
LEFT JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = E.MANAGER_ID
WHERE E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'));


-- PREGUNTA 48 - DESAFIO AVANZADO
-- Para los departamentos de Whalen o King, muestre departamento, ciudad,
-- cantidad de empleados, sueldo minimo, sueldo maximo y sueldo promedio.
-- Incluya solo grupos con promedio superior a 5.000 dolares y cuya diferencia
-- entre el maximo y el minimo sea distinta de cero.

-- SOLUCION:
SELECT D.DEPARTMENT_NAME AS DEPARTAMENTO,
       L.CITY AS CIUDAD,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       MIN(E.SALARY) AS SUELDO_MINIMO,
       MAX(E.SALARY) AS SUELDO_MAXIMO,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO
FROM OEHR_DEPARTMENTS D
JOIN OEHR_LOCATIONS L
  ON L.LOCATION_ID = D.LOCATION_ID
JOIN OEHR_EMPLOYEES E
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'))
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.CITY
HAVING AVG(E.SALARY) > 5000
   AND MAX(E.SALARY) - MIN(E.SALARY) <> 0;


-- PREGUNTA 49 - DESAFIO AVANZADO
-- Muestre los empleados que trabajan en los mismos departamentos que Whalen o
-- King y ganan mas que el promedio de su propio departamento. Incluya empleado,
-- departamento, sueldo y promedio departamental. Use una subconsulta
-- correlacionada tanto para mostrar como para comparar el promedio.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       E.SALARY AS SUELDO,
       ROUND((SELECT AVG(E2.SALARY)
              FROM OEHR_EMPLOYEES E2
              WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID), 0)
         AS PROMEDIO_DEPARTAMENTAL
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING'))
  AND E.SALARY > (SELECT AVG(E3.SALARY)
                  FROM OEHR_EMPLOYEES E3
                  WHERE E3.DEPARTMENT_ID = E.DEPARTMENT_ID);


-- PREGUNTA 50 - DESAFIO AVANZADO
-- Whalen y King pueden trabajar en departamentos ubicados en la misma ciudad
-- que otros departamentos. Recorra empleados -> departamentos -> ubicaciones y
-- luego regrese hacia todos los empleados, incluyendo a las personas de
-- referencia si cumplen. Muestre empleado, departamento, ciudad, nombre del
-- pais y nombre del cargo. Una tambien OEHR_COUNTRIES y OEHR_JOBS.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       L.CITY AS CIUDAD,
       C.COUNTRY_NAME AS PAIS,
       J.JOB_TITLE AS CARGO
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_LOCATIONS L
  ON L.LOCATION_ID = D.LOCATION_ID
JOIN OEHR_COUNTRIES C
  ON C.COUNTRY_ID = L.COUNTRY_ID
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
WHERE L.CITY IN (SELECT LR.CITY
                 FROM OEHR_EMPLOYEES ER
                 JOIN OEHR_DEPARTMENTS DR
                   ON DR.DEPARTMENT_ID = ER.DEPARTMENT_ID
                 JOIN OEHR_LOCATIONS LR
                   ON LR.LOCATION_ID = DR.LOCATION_ID
                 WHERE UPPER(ER.LAST_NAME) IN ('WHALEN', 'KING'));
