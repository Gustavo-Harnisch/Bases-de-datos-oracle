-- PAUTA ES1: CONSULTAS SQL
-- Caso: Sistema de Recursos Humanos de Oracle

-- Requerimiento 1:
-- Mostrar el nombre y el codigo del cargo concatenados, junto con su sueldo
-- minimo, para los cargos cuyo codigo o nombre comience con la letra S.
SELECT CONCAT(
           'El código del cargo ',
           CONCAT(JOB_TITLE, CONCAT(' es: ', JOB_ID))
       ) AS "CARGO",
       MIN_SALARY AS "SUELDO MINIMO"
FROM OEHR_JOBS
WHERE UPPER(JOB_ID) LIKE 'S%'
   OR UPPER(JOB_TITLE) LIKE 'S%';


-- Requerimiento 2:
-- Mostrar por oficio la cantidad de empleados, el promedio de sus sueldos y
-- la diferencia entre el sueldo maximo y minimo, cuando esta sea distinta de 0.
SELECT JOB_ID AS "Oficio",
       COUNT(EMPLOYEE_ID) AS "Cantidad Empleados",
       AVG(SALARY) AS "Promedio de Sueldos",
       MAX(SALARY) - MIN(SALARY) AS "Diferencia Sueldos"
FROM OEHR_EMPLOYEES
GROUP BY JOB_ID
HAVING MAX(SALARY) - MIN(SALARY) <> 0;


-- Requerimiento 3:
-- Mostrar el codigo y nombre del trabajador, su departamento y el nombre del
-- jefe asociado a dicho departamento.
SELECT E.EMPLOYEE_ID AS "CODIGO TRABAJADOR",
       CONCAT(E.FIRST_NAME, CONCAT(' ', E.LAST_NAME)) AS "NOMBRE TRABAJADOR",
       D.DEPARTMENT_NAME AS "DEPARTAMENTO",
       CONCAT(J.FIRST_NAME, CONCAT(' ', J.LAST_NAME)) AS "JEFE DEPARTAMENTO"
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN OEHR_EMPLOYEES J
  ON D.MANAGER_ID = J.EMPLOYEE_ID;


-- Requerimiento 4:
-- Mostrar los codigos de oficio cuyo promedio de sueldos minimos sea mayor
-- que 3000 dolares.
SELECT JOB_ID AS "CODIGO OFICIO",
       AVG(MIN_SALARY) AS "PROMEDIO SUELDO MINIMO"
FROM OEHR_JOBS
GROUP BY JOB_ID
HAVING AVG(MIN_SALARY) > 3000;


-- Requerimiento 5:
-- Mostrar los empleados que pertenecen a los mismos departamentos que Whalen
-- o King.
SELECT E.EMPLOYEE_ID AS "CODIGO EMPLEADO",
       CONCAT(E.FIRST_NAME, CONCAT(' ', E.LAST_NAME)) AS "NOMBRE EMPLEADO",
       D.DEPARTMENT_NAME AS "DEPARTAMENTO"
FROM OEHR_EMPLOYEES E
JOIN OEHR_DEPARTMENTS D
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM OEHR_EMPLOYEES
    WHERE UPPER(LAST_NAME) IN ('WHALEN', 'KING')
);


-- Requerimiento 6:
-- Mostrar nombre, correo propuesto y comision de los empleados que tienen una
-- comision, cuyo sueldo esta fuera del rango de 5000 a 10000 dolares y que
-- pertenecen al mismo departamento que Neena Kochhar.
SELECT CONCAT(E.FIRST_NAME, CONCAT(' ', E.LAST_NAME)) AS "NOMBRE EMPLEADO",
       CONCAT(
           SUBSTR(E.FIRST_NAME, 1, 1),
           CONCAT(
               SUBSTR(E.LAST_NAME, 2, 1),
               CONCAT(E.JOB_ID, '@pruebasql.cl')
           )
       ) AS "NUEVO CORREO",
       E.COMMISSION_PCT AS "COMISION"
FROM OEHR_EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL
  AND E.SALARY NOT BETWEEN 5000 AND 10000
  AND E.DEPARTMENT_ID IN (
      SELECT DEPARTMENT_ID
      FROM OEHR_EMPLOYEES
      WHERE UPPER(FIRST_NAME) = 'NEENA'
        AND UPPER(LAST_NAME) = 'KOCHHAR'
  );
