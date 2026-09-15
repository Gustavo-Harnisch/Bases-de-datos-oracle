-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- SOLUCIONES DEL CAPITULO 6: TEXTO, COMISIONES Y SUBCONSULTAS
-- =============================================================================
--
-- Cada ejercicio incluye una posible solucion mediante una sentencia SELECT.
-- Se utilizan nombres fisicos con el prefijo OEHR_. Pueden existir soluciones
-- equivalentes que produzcan exactamente el mismo resultado.
-- =============================================================================


-- PREGUNTA 51 - AFIANZAMIENTO
-- Muestre el nombre completo, el correo propuesto y la comision de los
-- empleados con comision no nula, sueldo fuera de 5.000 a 10.000 dolares y
-- departamento igual al de Neena Kochhar. Forme el correo con la primera letra
-- del nombre, la segunda letra del apellido, el codigo del cargo y
-- @pruebasql.cl.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       LOWER(SUBSTR(E.FIRST_NAME, 1, 1) ||
             SUBSTR(E.LAST_NAME, 2, 1) ||
             E.JOB_ID || '@pruebasql.cl') AS CORREO_PROPUESTO,
       E.COMMISSION_PCT AS COMISION
FROM OEHR_EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'NEENA'
                            AND UPPER(LAST_NAME) = 'KOCHHAR');


-- PREGUNTA 52 - AFIANZAMIENTO
-- Muestre los empleados con comision del mismo departamento que John Russell.
-- Genere un usuario en minusculas con las dos primeras letras del nombre y las
-- tres primeras letras del apellido. Use los alias EMPLEADO, USUARIO y
-- COMISION.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       LOWER(SUBSTR(E.FIRST_NAME, 1, 2) ||
             SUBSTR(E.LAST_NAME, 1, 3)) AS USUARIO,
       E.COMMISSION_PCT AS COMISION
FROM OEHR_EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL');


-- PREGUNTA 53 - AFIANZAMIENTO
-- Muestre el codigo, el nombre, el sueldo y la comision de quienes tengan
-- comision no nula, trabajen en el departamento de John Russell y posean un
-- sueldo fuera del rango de 5.000 a 10.000 dolares. Ordene por sueldo de mayor
-- a menor.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS CODIGO,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE,
       E.SALARY AS SUELDO,
       E.COMMISSION_PCT AS COMISION
FROM OEHR_EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL')
ORDER BY E.SALARY DESC;


-- PREGUNTA 54 - AFIANZAMIENTO
-- Muestre quienes tengan comision no nula, sueldo fuera de 5.000 a 10.000
-- dolares y departamento igual al de John Russell. Incluya el nombre del cargo
-- y genere un correo con la inicial del nombre, el apellido completo y
-- @empresa.cl.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       LOWER(SUBSTR(E.FIRST_NAME, 1, 1) ||
             E.LAST_NAME || '@empresa.cl') AS CORREO,
       J.JOB_TITLE AS CARGO
FROM OEHR_EMPLOYEES E
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL');


-- PREGUNTA 55 - AFIANZAMIENTO
-- Muestre empleado, correo, departamento y ciudad de quienes tengan comision
-- no nula, sueldo fuera de 5.000 a 10.000 dolares y departamento igual al de
-- John Russell. El correo debe usar la primera letra del nombre, las dos
-- ultimas letras del apellido y @rrhh.cl.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       LOWER(SUBSTR(E.FIRST_NAME, 1, 1) ||
             SUBSTR(E.LAST_NAME, -2) || '@rrhh.cl') AS CORREO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       L.CITY AS CIUDAD
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_LOCATIONS L
  ON L.LOCATION_ID = D.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL');


-- PREGUNTA 56 - AFIANZAMIENTO
-- Para quienes tengan comision no nula, sueldo fuera de 5.000 a 10.000 dolares
-- y departamento igual al de John Russell, muestre el nombre, el porcentaje de
-- comision con el signo % y el valor mensual ganado por comision.
--
-- El valor mensual de la comision se obtiene aplicando COMMISSION_PCT al sueldo
-- del empleado.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       TO_CHAR(E.COMMISSION_PCT * 100) || '%' AS PORCENTAJE_COMISION,
       E.SALARY * E.COMMISSION_PCT AS COMISION_MENSUAL
FROM OEHR_EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL');


-- PREGUNTA 57 - DESAFIO AVANZADO
-- Muestre quienes tengan comision no nula, sueldo fuera de 5.000 a 10.000
-- dolares y departamento igual al de John Russell. Incluya departamento, cargo,
-- ciudad, pais y jefe directo. Deben aparecer aunque no tengan jefe. El correo
-- debe contener la inicial del nombre, las tres primeras letras del apellido,
-- el codigo del cargo y @sql.cl.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       LOWER(SUBSTR(E.FIRST_NAME, 1, 1) ||
             SUBSTR(E.LAST_NAME, 1, 3) ||
             E.JOB_ID || '@sql.cl') AS CORREO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       J.JOB_TITLE AS CARGO,
       L.CITY AS CIUDAD,
       C.COUNTRY_NAME AS PAIS,
       M.FIRST_NAME || ' ' || M.LAST_NAME AS JEFE_DIRECTO
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
JOIN OEHR_LOCATIONS L
  ON L.LOCATION_ID = D.LOCATION_ID
JOIN OEHR_COUNTRIES C
  ON C.COUNTRY_ID = L.COUNTRY_ID
LEFT JOIN OEHR_EMPLOYEES M
  ON M.EMPLOYEE_ID = E.MANAGER_ID
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL');


-- PREGUNTA 58 - DESAFIO AVANZADO
-- Agrupe por cargo a los empleados con comision del departamento de John
-- Russell. Muestre cargo, cantidad, sueldo promedio y comision promedio.
-- Incluya cargos con al menos dos empleados cuyo sueldo promedio este fuera del
-- rango de 5.000 a 10.000 dolares.

-- SOLUCION:
SELECT E.JOB_ID AS CARGO,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO,
       ROUND(AVG(E.COMMISSION_PCT), 2) AS COMISION_PROMEDIO
FROM OEHR_EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL')
GROUP BY E.JOB_ID
HAVING COUNT(E.EMPLOYEE_ID) >= 2
   AND AVG(E.SALARY) NOT BETWEEN 5000 AND 10000;


-- PREGUNTA 59 - DESAFIO AVANZADO
-- Muestre empleados con comision no nula, sueldo fuera de 5.000 a 10.000
-- dolares y departamento igual al de John Russell, pero solo cuando ganen mas
-- que el promedio de los empleados con comision de su mismo departamento y
-- cargo. Incluya codigo, empleado, cargo, sueldo y comision, y use una
-- subconsulta correlacionada.

-- SOLUCION:
SELECT E.EMPLOYEE_ID AS CODIGO,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       E.JOB_ID AS CARGO,
       E.SALARY AS SUELDO,
       E.COMMISSION_PCT AS COMISION
FROM OEHR_EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                          FROM OEHR_EMPLOYEES
                          WHERE UPPER(FIRST_NAME) = 'JOHN'
                            AND UPPER(LAST_NAME) = 'RUSSELL')
  AND E.SALARY > (SELECT AVG(E2.SALARY)
                  FROM OEHR_EMPLOYEES E2
                  WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID
                    AND E2.JOB_ID = E.JOB_ID
                    AND E2.COMMISSION_PCT IS NOT NULL);


-- PREGUNTA 60 - DESAFIO AVANZADO
-- Busque empleados con comision no nula y sueldo fuera de 5.000 a 10.000
-- dolares en cualquier departamento situado en la misma ciudad que el
-- departamento de John Russell. Recorra empleados, departamentos y ubicaciones
-- tanto en la consulta como en la subconsulta. Muestre empleado, correo
-- propuesto, nombre del cargo, departamento, ciudad, sueldo y comision. El
-- correo debe usar la inicial del nombre, dos letras del apellido desde la
-- segunda posicion, el codigo del cargo y @desafio.cl.

-- SOLUCION:
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLEADO,
       LOWER(SUBSTR(E.FIRST_NAME, 1, 1) ||
             SUBSTR(E.LAST_NAME, 2, 2) ||
             E.JOB_ID || '@desafio.cl') AS CORREO_PROPUESTO,
       J.JOB_TITLE AS CARGO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       L.CITY AS CIUDAD,
       E.SALARY AS SUELDO,
       E.COMMISSION_PCT AS COMISION
FROM OEHR_EMPLOYEES E
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
JOIN OEHR_DEPARTMENTS D
  ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN OEHR_LOCATIONS L
  ON L.LOCATION_ID = D.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND L.CITY IN (SELECT LR.CITY
                 FROM OEHR_EMPLOYEES NK
                 JOIN OEHR_DEPARTMENTS DR
                   ON DR.DEPARTMENT_ID = NK.DEPARTMENT_ID
                 JOIN OEHR_LOCATIONS LR
                   ON LR.LOCATION_ID = DR.LOCATION_ID
                 WHERE UPPER(NK.FIRST_NAME) = 'JOHN'
                   AND UPPER(NK.LAST_NAME) = 'RUSSELL');
