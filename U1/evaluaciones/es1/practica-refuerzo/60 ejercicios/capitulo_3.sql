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

SELECT E.EMPLOYEE_ID AS CODIGO_TRABAJADOR,
        E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_COMPLETO,
        D.DEPARTMENT_NAME AS DEPARTAMENTO,
        B.FIRST_NAME ||  ' ' || B.LAST_NAME AS JEFE
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.EMPLOYEES B
    ON B.EMPLOYEE_ID = D.MANAGER_ID;



-- PREGUNTA 22 - AFIANZAMIENTO
-- Muestre el codigo y el apellido del trabajador, el departamento y el
-- apellido del jefe del departamento para los departamentos entre 30 y 90.
-- Ordene por codigo de departamento y apellido del trabajador.


SELECT E.EMPLOYEE_ID AS CODIGO_TRABAJADOR,
    E.FIRST_NAME ||' '||E.LAST_NAME AS APELLIDO,
    D.DEPARTMENT_NAME AS DEPARTAMENTO,
    B.LAST_NAME AS JEFE
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.EMPLOYEES B
    ON D.MANAGER_ID = B.EMPLOYEE_ID
WHERE D.DEPARTMENT_ID BETWEEN 30 AND 90
ORDER BY D.DEPARTMENT_ID,
    E.LAST_NAME;



-- PREGUNTA 23 - AFIANZAMIENTO
-- Muestre los trabajadores cuyo sueldo sea mayor que el sueldo del jefe de su
-- departamento. Incluya el trabajador, su sueldo, el departamento, el jefe y
-- el sueldo del jefe.

SELECT  E.FIRST_NAME ||' '||E.LAST_NAME AS NOMBRE_APELLIDO,
    E.SALARY AS SALARIO_DE_TRABAJADOR,
    D.DEPARTMENT_NAME AS NOMBRE_DEPARTAMENTO,
    B.FIRST_NAME ||' '||B.LAST_NAME AS NOMBRE_JEFE,
    B.SALARY AS SALARIO_DE_JEFE
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.EMPLOYEES B
    ON B.EMPLOYEE_ID = D.MANAGER_ID
WHERE B.SALARY < E.SALARY;



-- PREGUNTA 24 - AFIANZAMIENTO
-- Muestre el codigo y el nombre de cada departamento que tenga jefe asignado,
-- el nombre completo de ese jefe y el nombre del cargo que desempena. Ordene
-- por codigo de departamento.

SELECT D.DEPARTMENT_ID AS DEPARTAMENTO,
    B.EMPLOYEE_ID,
    B.FIRST_NAME || ' ' || B.LAST_NAME AS NOMBRE_JEFE
FROM HR.DEPARTMENTS D
JOIN HR.EMPLOYEES B
    ON D.MANAGER_ID = B.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID DESC;



-- PREGUNTA 25 - AFIANZAMIENTO
-- Muestre el codigo y el nombre del trabajador, su cargo, su departamento, la
-- ciudad y el jefe del departamento. Debe unir empleados, cargos,
-- departamentos, ubicaciones y nuevamente empleados. Ordene por departamento
-- y apellido del trabajador.

SELECT E.EMPLOYEE_ID AS ID_TRABAJADOR,
    E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_TRABAJADOR,
    J.JOB_TITLE AS CARGO,
    L.CITY AS CIUDAD,
    D.DEPARTMENT_NAME,
    B.FIRST_NAME || ' ' || B.LAST_NAME AS NOMBRE_JEFE
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.EMPLOYEES B
    ON B.EMPLOYEE_ID = D.MANAGER_ID
JOIN HR.LOCATIONS L
    ON L.LOCATION_ID = D.LOCATION_ID
JOIN HR.JOBS J
    ON J.JOB_ID = E.JOB_ID
ORDER BY D.DEPARTMENT_ID DESC,
    E.LAST_NAME DESC;

-- PREGUNTA 26 - AFIANZAMIENTO
-- Muestre todos los trabajadores, incluso quienes no tienen departamento.
-- Incluya codigo, apellido, departamento y jefe del departamento. Cuando falte
-- un dato, muestre SIN DEPARTAMENTO o SIN JEFE mediante NVL.

SELECT E.EMPLOYEE_ID AS CODIGO_EMPLEADO,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_COMPLETO,
       NVL(D.DEPARTMENT_NAME, 'SIN DEPARTAMENTO') AS DEPARTAMENTO,
       NVL(B.FIRST_NAME || ' ' || B.LAST_NAME, 'SIN JEFE') AS JEFE
FROM HR.EMPLOYEES E
LEFT JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
LEFT JOIN HR.EMPLOYEES B
    ON B.EMPLOYEE_ID = D.MANAGER_ID;


-- PREGUNTA 27 - DESAFIO AVANZADO
-- Realice el recorrido trabajador -> departamento -> jefe del departamento ->
-- departamento en el que trabaja ese jefe. Muestre el trabajador, su
-- departamento, el jefe asociado y el departamento del jefe. Los jefes sin
-- departamento registrado deben aparecer.

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_TRABAJADOR,
       D.DEPARTMENT_NAME AS DEPARTAMENTO_TRABAJADOR,
       B.FIRST_NAME || ' ' || B.LAST_NAME AS NOMBRE_JEFE,
       DB.DEPARTMENT_NAME AS DEPARTAMENTO_DEL_JEFE
FROM HR.EMPLOYEES E
LEFT JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
LEFT JOIN HR.EMPLOYEES B
    ON D.MANAGER_ID = B.EMPLOYEE_ID
LEFT JOIN HR.DEPARTMENTS DB
    ON DB.DEPARTMENT_ID = B.DEPARTMENT_ID;


-- PREGUNTA 28 - DESAFIO AVANZADO
-- Por cada departamento, muestre el codigo, el nombre, el jefe, la cantidad de
-- trabajadores y el sueldo promedio. Incluya solo los departamentos con al
-- menos tres trabajadores y promedio superior a 5.000 dolares. Use GROUP BY y
-- HAVING sin duplicar al jefe en el conteo.

SELECT D.DEPARTMENT_ID AS ID_DEPARTAMENTO,
       D.DEPARTMENT_NAME AS NOMBRE_DEPARTAMENTO,
       B.FIRST_NAME || ' ' || B.LAST_NAME AS NOMBRE_JEFE,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO
FROM HR.DEPARTMENTS D
JOIN HR.EMPLOYEES B
    ON D.MANAGER_ID = B.EMPLOYEE_ID
LEFT JOIN HR.EMPLOYEES E
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,
         D.DEPARTMENT_NAME,
         B.FIRST_NAME,
         B.LAST_NAME
HAVING COUNT(E.EMPLOYEE_ID) >= 3
   AND AVG(E.SALARY) > 5000
ORDER BY D.DEPARTMENT_ID ASC;


-- PREGUNTA 29 - DESAFIO AVANZADO
-- Muestre los trabajadores cuyo sueldo sea superior al promedio de su propio
-- departamento. Incluya codigo, trabajador, sueldo, departamento y jefe del
-- departamento. Resuelva el promedio mediante una subconsulta correlacionada.

SELECT E.EMPLOYEE_ID AS CODIGO_TRABAJADOR,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NOMBRE_TRABAJADOR,
       E.SALARY AS SALARIO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO_TRABAJADOR,
       B.FIRST_NAME || ' ' || B.LAST_NAME AS NOMBRE_JEFE
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.EMPLOYEES B
    ON D.MANAGER_ID = B.EMPLOYEE_ID
WHERE E.SALARY > (SELECT AVG(EE.SALARY)
                  FROM HR.EMPLOYEES EE
                  WHERE EE.DEPARTMENT_ID = E.DEPARTMENT_ID);


-- PREGUNTA 30 - DESAFIO AVANZADO
-- Muestre los departamentos cuyo sueldo promedio sea mayor que el promedio
-- general de la empresa. Incluya jefe, cantidad de trabajadores, sueldo
-- minimo, sueldo maximo y sueldo promedio. Considere solo departamentos con
-- mas de un trabajador y resuelva la comparacion mediante una subconsulta.

SELECT D.DEPARTMENT_ID AS DEPARTAMENTO,
       B.FIRST_NAME || ' ' || B.LAST_NAME AS NOMBRE_JEFE,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_DE_EMPLEADOS,
       MAX(E.SALARY) AS SALARIO_MAXIMO,
       MIN(E.SALARY) AS SALARIO_MINIMO,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.EMPLOYEES B
    ON D.MANAGER_ID = B.EMPLOYEE_ID
GROUP BY D.DEPARTMENT_ID,
         B.FIRST_NAME,
         B.LAST_NAME
HAVING COUNT(E.EMPLOYEE_ID) > 1
   AND AVG(E.SALARY) > (SELECT AVG(SALARY)
                       FROM HR.EMPLOYEES);
