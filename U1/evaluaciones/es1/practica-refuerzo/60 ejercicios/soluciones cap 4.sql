-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- SOLUCIONES DEL CAPITULO 4: AGRUPACION Y COMPARACION DE SUELDOS
-- =============================================================================
--
-- Cada ejercicio incluye una posible solucion mediante una sentencia SELECT.
-- Se utilizan nombres fisicos con el prefijo OEHR_. Pueden existir soluciones
-- equivalentes que produzcan exactamente el mismo resultado.
-- =============================================================================


-- PREGUNTA 31 - AFIANZAMIENTO
-- Muestre los codigos de oficio cuyo promedio de sueldo minimo sea mayor que
-- 3.000 dolares. Use los alias CODIGO_OFICIO y PROMEDIO_SUELDO_MINIMO.

-- SOLUCION:
SELECT JOB_ID AS CODIGO_OFICIO,
       AVG(MIN_SALARY) AS PROMEDIO_SUELDO_MINIMO
FROM OEHR_JOBS
GROUP BY JOB_ID
HAVING AVG(MIN_SALARY) > 3000;


-- PREGUNTA 32 - AFIANZAMIENTO
-- Agrupe los oficios por los dos primeros caracteres de su codigo. Muestre el
-- area y el promedio de sus sueldos minimos redondeado a cero decimales.
-- Incluya solamente las areas cuyo promedio sea superior a 4.000 dolares.

-- SOLUCION:
SELECT SUBSTR(JOB_ID, 1, 2) AS AREA,
       ROUND(AVG(MIN_SALARY), 0) AS PROMEDIO_SUELDO_MINIMO
FROM OEHR_JOBS
GROUP BY SUBSTR(JOB_ID, 1, 2)
HAVING AVG(MIN_SALARY) > 4000;


-- PREGUNTA 33 - AFIANZAMIENTO
-- Muestre los codigos de oficio cuyo promedio de sueldo minimo este entre
-- 2.500 y 8.000 dolares. Ordene desde el promedio mas alto.

-- SOLUCION:
SELECT JOB_ID AS CODIGO_OFICIO,
       AVG(MIN_SALARY) AS PROMEDIO_SUELDO_MINIMO
FROM OEHR_JOBS
GROUP BY JOB_ID
HAVING AVG(MIN_SALARY) BETWEEN 2500 AND 8000
ORDER BY AVG(MIN_SALARY) DESC;


-- PREGUNTA 34 - AFIANZAMIENTO
-- Por cada area definida por los dos primeros caracteres del codigo de oficio,
-- muestre la cantidad de oficios y el promedio de sueldo minimo. Incluya solo
-- las areas con al menos dos oficios y promedio superior a 3.000 dolares.

-- SOLUCION:
SELECT SUBSTR(JOB_ID, 1, 2) AS AREA,
       COUNT(JOB_ID) AS CANTIDAD_OFICIOS,
       ROUND(AVG(MIN_SALARY), 0) AS PROMEDIO_SUELDO_MINIMO
FROM OEHR_JOBS
GROUP BY SUBSTR(JOB_ID, 1, 2)
HAVING COUNT(JOB_ID) >= 2
   AND AVG(MIN_SALARY) > 3000;


-- PREGUNTA 35 - AFIANZAMIENTO
-- Para cada oficio ocupado, muestre codigo, nombre, sueldo minimo configurado,
-- cantidad de trabajadores y sueldo promedio real. Incluya solamente los
-- oficios cuyo promedio real sea mayor que el minimo configurado.

-- SOLUCION:
SELECT J.JOB_ID AS CODIGO_OFICIO,
       J.JOB_TITLE AS NOMBRE_OFICIO,
       J.MIN_SALARY AS MINIMO_CONFIGURADO,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_TRABAJADORES,
       ROUND(AVG(E.SALARY), 0) AS PROMEDIO_REAL
FROM OEHR_JOBS J
JOIN OEHR_EMPLOYEES E
  ON E.JOB_ID = J.JOB_ID
GROUP BY J.JOB_ID, J.JOB_TITLE, J.MIN_SALARY
HAVING AVG(E.SALARY) > J.MIN_SALARY;


-- PREGUNTA 36 - AFIANZAMIENTO
-- Por cada departamento, muestre codigo, nombre, cantidad de trabajadores y
-- promedio del sueldo minimo configurado para los cargos de esos trabajadores.
-- Incluya solo departamentos con al menos dos trabajadores y promedio de
-- minimos superior a 4.000 dolares.

-- SOLUCION:
SELECT D.DEPARTMENT_ID AS COD_DEPARTAMENTO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_TRABAJADORES,
       ROUND(AVG(J.MIN_SALARY), 0) AS PROMEDIO_MINIMOS
FROM OEHR_DEPARTMENTS D
JOIN OEHR_EMPLOYEES E
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(E.EMPLOYEE_ID) >= 2
   AND AVG(J.MIN_SALARY) > 4000;


-- PREGUNTA 37 - DESAFIO AVANZADO
-- Agrupe los trabajadores por el area de su oficio, definida por los dos
-- primeros caracteres de JOB_ID. Muestre la cantidad de trabajadores, el
-- promedio salarial real y el promedio de sueldo minimo configurado. Incluya
-- areas con al menos tres trabajadores cuyo promedio real supere en un 50 % el
-- promedio de minimos.

-- SOLUCION:
SELECT SUBSTR(E.JOB_ID, 1, 2) AS AREA,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_TRABAJADORES,
       ROUND(AVG(E.SALARY), 0) AS PROMEDIO_REAL,
       ROUND(AVG(J.MIN_SALARY), 0) AS PROMEDIO_MINIMOS
FROM OEHR_EMPLOYEES E
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
GROUP BY SUBSTR(E.JOB_ID, 1, 2)
HAVING COUNT(E.EMPLOYEE_ID) >= 3
   AND AVG(E.SALARY) > AVG(J.MIN_SALARY) * 1.5;


-- PREGUNTA 38 - DESAFIO AVANZADO
-- Por cada departamento, muestre la cantidad de oficios distintos, el promedio
-- salarial real y el promedio de los sueldos minimos asociados. Incluya
-- departamentos con al menos dos oficios y cuyo promedio real sea mayor que el
-- promedio de minimos.

-- SOLUCION:
SELECT D.DEPARTMENT_ID AS COD_DEPARTAMENTO,
       D.DEPARTMENT_NAME AS DEPARTAMENTO,
       COUNT(DISTINCT E.JOB_ID) AS OFICIOS_DISTINTOS,
       ROUND(AVG(E.SALARY), 0) AS PROMEDIO_REAL,
       ROUND(AVG(J.MIN_SALARY), 0) AS PROMEDIO_MINIMOS
FROM OEHR_DEPARTMENTS D
JOIN OEHR_EMPLOYEES E
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN OEHR_JOBS J
  ON J.JOB_ID = E.JOB_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(DISTINCT E.JOB_ID) >= 2
   AND AVG(E.SALARY) > AVG(J.MIN_SALARY);


-- PREGUNTA 39 - DESAFIO AVANZADO
-- Muestre los oficios ocupados por mas de un trabajador cuyo promedio real sea
-- mayor que el promedio general de sueldos. Incluya codigo, nombre, minimo y
-- maximo configurados, cantidad de trabajadores y promedio real.

-- SOLUCION:
SELECT J.JOB_ID AS CODIGO_OFICIO,
       J.JOB_TITLE AS NOMBRE_OFICIO,
       J.MIN_SALARY AS MINIMO_CONFIGURADO,
       J.MAX_SALARY AS MAXIMO_CONFIGURADO,
       COUNT(E.EMPLOYEE_ID) AS CANTIDAD_TRABAJADORES,
       ROUND(AVG(E.SALARY), 0) AS PROMEDIO_REAL
FROM OEHR_JOBS J
JOIN OEHR_EMPLOYEES E
  ON E.JOB_ID = J.JOB_ID
GROUP BY J.JOB_ID,
         J.JOB_TITLE,
         J.MIN_SALARY,
         J.MAX_SALARY
HAVING COUNT(E.EMPLOYEE_ID) > 1
   AND AVG(E.SALARY) > (SELECT AVG(SALARY)
                        FROM OEHR_EMPLOYEES);


-- PREGUNTA 40 - DESAFIO AVANZADO
-- Forme familias de oficios con los dos primeros caracteres de JOB_ID. Calcule
-- la cantidad de oficios y el promedio de minimos usando una sola vez cada
-- cargo del catalogo OEHR_JOBS. Calcule por separado la cantidad de
-- trabajadores de la familia. Muestre solo las familias cuyo promedio minimo
-- sea mayor que el promedio general del catalogo y que tengan al menos dos
-- trabajadores.

-- SOLUCION:
SELECT F.AREA,
       F.CANTIDAD_OFICIOS,
       F.PROMEDIO_MINIMOS,
       T.CANTIDAD_TRABAJADORES
FROM (SELECT SUBSTR(JOB_ID, 1, 2) AS AREA,
             COUNT(JOB_ID) AS CANTIDAD_OFICIOS,
             ROUND(AVG(MIN_SALARY), 0) AS PROMEDIO_MINIMOS
      FROM OEHR_JOBS
      GROUP BY SUBSTR(JOB_ID, 1, 2)
      HAVING AVG(MIN_SALARY) > (SELECT AVG(MIN_SALARY)
                                FROM OEHR_JOBS)) F
JOIN (SELECT SUBSTR(JOB_ID, 1, 2) AS AREA,
             COUNT(EMPLOYEE_ID) AS CANTIDAD_TRABAJADORES
      FROM OEHR_EMPLOYEES
      GROUP BY SUBSTR(JOB_ID, 1, 2)
      HAVING COUNT(EMPLOYEE_ID) >= 2) T
  ON T.AREA = F.AREA;
