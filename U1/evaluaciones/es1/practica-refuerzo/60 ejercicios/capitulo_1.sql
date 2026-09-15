-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- CAPITULO 1: CONSULTAS SOBRE CARGOS
-- =============================================================================
--
-- Habilidad central:
-- Concatenacion, alias de columna, funciones de texto, UPPER, LIKE y
-- condiciones alternativas sobre los cargos.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio utilizando una sentencia SELECT.
-- 2. No modifique los datos de las tablas.
-- 3. Utilice los nombres fisicos de las tablas con el prefijo OEHR_.
-- 4. Escriba su consulta debajo del enunciado correspondiente.
-- 5. Respete las columnas, los alias, los filtros y los ordenamientos pedidos.
-- 6. Cuando se indique un formato de texto, concatene los datos para producir
--    una sola cadena exactamente con la estructura mostrada.
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
SELECT JOB_ID AS COD_CARGO,
       JOB_TITLE AS NOMBRE_CARGO,
       MIN_SALARY AS SUELDO_MINIMO
FROM OEHR_JOBS
WHERE UPPER(JOB_ID) LIKE 'S%';


-- PREGUNTA 2 - AFIANZAMIENTO
-- Muestre el codigo, nombre y sueldo minimo de los cargos cuyo nombre comience
-- con la letra S. Utilice UPPER y LIKE.

-- SOLUCION:
SELECT JOB_ID AS COD_CARGO,
       JOB_TITLE AS NOMBRE_CARGO,
       MIN_SALARY AS SUELDO_MINIMO
FROM OEHR_JOBS
WHERE UPPER(JOB_TITLE) LIKE 'S%';


-- PREGUNTA 3 - AFIANZAMIENTO
-- Genere una columna REPORTE con el formato:
--
-- El cargo Sales Manager tiene el codigo SA_MAN
--
-- Muestre tambien el sueldo minimo. Considere los cargos cuyo codigo o nombre
-- comience con A.

-- SOLUCION:
SELECT 'El cargo ' || JOB_TITLE || ' tiene el codigo ' || JOB_ID AS REPORTE,
       MIN_SALARY AS SUELDO_MINIMO
FROM OEHR_JOBS
WHERE UPPER(JOB_ID) LIKE 'A%'
   OR UPPER(JOB_TITLE) LIKE 'A%';


-- PREGUNTA 4 - AFIANZAMIENTO
-- Muestre una frase con el formato:
--
-- SA_MAN corresponde a Sales Manager
--
-- Incluya ademas los sueldos minimo y maximo. Considere los cargos cuyo nombre
-- contenga la palabra Manager, sin distinguir mayusculas o minusculas.

-- SOLUCION:
SELECT JOB_ID || ' corresponde a ' || JOB_TITLE AS CARGO,
       MIN_SALARY AS SUELDO_MINIMO,
       MAX_SALARY AS SUELDO_MAXIMO
FROM OEHR_JOBS
WHERE UPPER(JOB_TITLE) LIKE '%MANAGER%';


-- PREGUNTA 5 - AFIANZAMIENTO
-- Muestre el codigo y el nombre concatenados en una sola columna con el alias
-- CARGO, junto con el sueldo minimo. Considere los cargos cuyo codigo tenga la
-- letra A como segundo caracter o cuyo nombre termine en Clerk.
--
-- La columna CARGO debe permitir leer claramente el codigo y el nombre del
-- cargo como un unico texto.

-- SOLUCION:
SELECT JOB_ID || ' - ' || JOB_TITLE AS CARGO,
       MIN_SALARY AS SUELDO_MINIMO
FROM OEHR_JOBS
WHERE UPPER(JOB_ID) LIKE '_A%'
   OR UPPER(JOB_TITLE) LIKE '%CLERK';


-- PREGUNTA 6 - AFIANZAMIENTO
-- Muestre un texto con el siguiente formato:
--
-- El codigo del cargo <nombre del cargo> es: <codigo del cargo>
--
-- Muestre tambien el sueldo minimo. Considere todos los cargos cuyo codigo o
-- nombre comience con S. Ordene los resultados por sueldo minimo de mayor a
-- menor y, en caso de igualdad, por nombre del cargo.

-- SOLUCION:
SELECT 'El codigo del cargo ' || JOB_TITLE || ' es: ' || JOB_ID AS REPORTE,
       MIN_SALARY AS SUELDO_MINIMO
FROM OEHR_JOBS
WHERE UPPER(JOB_ID) LIKE 'S%'
   OR UPPER(JOB_TITLE) LIKE 'S%'
ORDER BY MIN_SALARY DESC, JOB_TITLE;


-- PREGUNTA 7 - DESAFIO AVANZADO
-- Para cada cargo cuyo codigo o nombre comience con S, muestre su codigo, su
-- nombre, la cantidad de empleados y el sueldo promedio real redondeado a cero
-- decimales. Incluya solamente los cargos que tengan al menos dos empleados.
-- Utilice OEHR_JOBS y OEHR_EMPLOYEES.

-- SOLUCION:
SELECT J.JOB_ID AS COD_CARGO,
       J.JOB_TITLE AS NOMBRE_CARGO,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
       ROUND(AVG(E.SALARY), 0) AS SUELDO_PROMEDIO
FROM OEHR_JOBS J
JOIN OEHR_EMPLOYEES E
  ON E.JOB_ID = J.JOB_ID
WHERE UPPER(J.JOB_ID) LIKE 'S%'
   OR UPPER(J.JOB_TITLE) LIKE 'S%'
GROUP BY J.JOB_ID, J.JOB_TITLE
HAVING COUNT(E.EMPLOYEE_ID) >= 2;


-- PREGUNTA 8 - DESAFIO AVANZADO
-- Muestre el codigo y el nombre de los cargos cuyo codigo o nombre comience
-- con S y cuyo sueldo promedio real de empleados sea superior al sueldo minimo
-- definido para el cargo. Incluya el sueldo minimo definido y el sueldo
-- promedio real. Ordene los resultados por promedio real de mayor a menor.

-- SOLUCION:
SELECT J.JOB_ID AS COD_CARGO,
       J.JOB_TITLE AS NOMBRE_CARGO,
       J.MIN_SALARY AS MINIMO_DEFINIDO,
       ROUND(AVG(E.SALARY), 0) AS PROMEDIO_REAL
FROM OEHR_JOBS J
JOIN OEHR_EMPLOYEES E
  ON E.JOB_ID = J.JOB_ID
WHERE UPPER(J.JOB_ID) LIKE 'S%'
   OR UPPER(J.JOB_TITLE) LIKE 'S%'
GROUP BY J.JOB_ID, J.JOB_TITLE, J.MIN_SALARY
HAVING AVG(E.SALARY) > J.MIN_SALARY
ORDER BY AVG(E.SALARY) DESC;

-- RESUMEN DE LO APRENDIDO:
-- Cuando se utilizan funciones como AVG, COUNT, SUM, MIN o MAX, las columnas
-- normales que aparecen en el SELECT deben incluirse en el GROUP BY. La
-- columna que se desea calcular debe permanecer dentro de la funcion y no se
-- debe usar para formar los grupos.
--
-- En este ejercicio, JOB_ID, JOB_TITLE y MIN_SALARY describen cada cargo, por
-- eso deben formar parte del GROUP BY. En cambio, SALARY es el valor cuyo
-- promedio se quiere calcular mediante AVG, por eso no debe agregarse al
-- GROUP BY. Si se agrupa por SALARY, los empleados se separan por sueldo y ya
-- no se obtiene el promedio general de cada cargo.
--
-- Forma sencilla de recordarlo: GROUP BY indica como se forman los grupos y
-- AVG indica que valor se calcula dentro de cada grupo. En este caso, se agrupa
-- por cargo y se calcula el promedio de los sueldos de sus empleados.



-- PREGUNTA 9 - DESAFIO AVANZADO
-- Por cada departamento, muestre su codigo, su nombre y la cantidad de
-- empleados que ocupan cargos cuyo codigo o nombre comience con S. Incluya solo
-- los departamentos que tengan dos o mas empleados que cumplan esa condicion.
-- Debe unir OEHR_DEPARTMENTS, OEHR_EMPLOYEES y OEHR_JOBS.


SELECT D.DEPARTMENT_ID AS  CODIGO_DEPARTAMENTO,
      D.DEPARTMENT_NAME AS NOMBRE_DEPARTAMENTO,
      COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
JOIN HR.JOBS J
   ON J.JOB_ID = E.JOB_ID
WHERE UPPER(J.JOB_ID) LIKE 'S%'
   OR UPPER(J.JOB_TITLE) LIKE 'S%'
GROUP BY
   D.DEPARTMENT_ID,
   D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) > 2;


-- PREGUNTA 10 - DESAFIO AVANZADO
-- Por cada region, muestre el nombre de la region, la cantidad de empleados y
-- la cantidad de cargos distintos cuyo codigo o nombre comience con S.
-- Recorra desde OEHR_REGIONS hasta OEHR_JOBS mediante todas las claves foraneas
-- necesarias. Incluya solo las regiones con mas de un empleado coincidente.

SELECT R.REGION_NAME AS NOMBRE_REGION,
      COUNT(E.EMPLOYEE_ID) AS CANTIDAD_EMPLEADOS,
      COUNT(DISTINCT J.JOB_ID) AS CARGOS_DIFERENTES
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
   ON  E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS L
   ON D.LOCATION_ID = L.LOCATION_ID
JOIN HR.COUNTRIES C
   ON L.COUNTRY_ID = C.COUNTRY_ID
JOIN HR.REGIONS R
   ON C.REGION_ID = R.REGION_ID
JOIN HR.JOBS J
   ON J.JOB_ID = E.JOB_ID
WHERE UPPER(J.JOB_ID) LIKE 'S%'
   OR UPPER(J.JOB_TITLE) LIKE 'S%'
GROUP BY
      R.REGION_NAME
HAVING COUNT(E.EMPLOYEE_ID) >=1;

