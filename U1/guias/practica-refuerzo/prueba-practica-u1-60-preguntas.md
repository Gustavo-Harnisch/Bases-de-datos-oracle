---
title: "Prueba práctica intensiva — Unidad 1"
subtitle: "60 consultas SQL sobre el modelo OEHR"
lang: es-CL
geometry: margin=1.8cm
fontsize: 10pt
header-includes:
  - |
    \usepackage{float}
    \usepackage{needspace}
    \floatplacement{figure}{H}
    \newcommand{\cajacorta}{\par\noindent\fbox{\parbox[t][3.2cm][t]{0.96\linewidth}{\textbf{Respuesta SQL:}}}\par\medskip}
    \newcommand{\cajamedia}{\par\noindent\fbox{\parbox[t][5.0cm][t]{0.96\linewidth}{\textbf{Respuesta SQL:}}}\par\medskip}
    \newcommand{\cajalarga}{\par\noindent\fbox{\parbox[t][7.2cm][t]{0.96\linewidth}{\textbf{Respuesta SQL:}}}\par\medskip}
    \newcommand{\cajaextra}{\par\noindent\fbox{\parbox[t][9.2cm][t]{0.96\linewidth}{\textbf{Respuesta SQL:}}}\par\medskip}
---

# Identificación

| Dato | Información |
| --- | --- |
| Nombre |  |
| Sección |  |
| Fecha |  |
| Curso | Base de Datos |
| Puntaje referencial | 60 puntos |

# Propósito y estructura

Esta práctica prepara para los **seis requerimientos de la prueba real de Unidad 1**. Cada sección corresponde directamente a uno de esos requerimientos y contiene diez ejercicios:

- **Las primeras seis preguntas de cada sección:** afianzamiento progresivo de la habilidad original.
- **Las últimas cuatro preguntas de cada sección:** desafío avanzado que combina la habilidad original con varios `JOIN`, recorridos de claves foráneas, agrupaciones, `HAVING` o subconsultas.

Las cajas de respuesta cambian de tamaño según la extensión razonable de la consulta esperada. Una solución equivalente es válida si entrega exactamente el resultado pedido.

# Instrucciones

1. Resuelva los ejercicios individualmente en Oracle SQL.
2. Utilice solo sentencias `SELECT`; no modifique los datos.
3. Use los nombres físicos con prefijo `OEHR_` y alias de tabla en consultas multitabla.
4. Escriba antes de cada respuesta un comentario como `-- Pregunta 1`.
5. Respete columnas, alias, filtros, agrupaciones y ordenamientos solicitados.
6. Determine los puntos de unión mediante las claves primarias y foráneas del modelo.
7. Ejecute y compruebe cada consulta. Evite productos cartesianos y filtros de grupo ubicados incorrectamente en `WHERE`.

# Caso y modelo relacional

El equipo de Recursos Humanos de Oracle necesita ampliar la reportería de su aplicación. Utilice el mismo modelo OEHR de la prueba real para resolver requerimientos sobre cargos, trabajadores, jefaturas, departamentos, ubicaciones e historial laboral.

![Modelo relacional OEHR utilizado en la Unidad 1](modelo-relacional-oehr.png){ width=88% }

En la figura los nombres aparecen sin prefijo. En Oracle debe utilizar `OEHR_REGIONS`, `OEHR_COUNTRIES`, `OEHR_LOCATIONS`, `OEHR_DEPARTMENTS`, `OEHR_JOBS`, `OEHR_EMPLOYEES` y `OEHR_JOB_HISTORY`.

\newpage

# Sección 1 — Variaciones del requerimiento real 1

**Habilidad central:** concatenación, alias de columna, funciones de texto, `UPPER`, `LIKE` y condiciones alternativas sobre los cargos.

\Needspace{6cm}
## Pregunta 1 — Afianzamiento

Muestre el código, nombre y sueldo mínimo de los cargos cuyo código comience con la letra S. La comparación no debe depender de mayúsculas o minúsculas. Use los alias `COD_CARGO`, `NOMBRE_CARGO` y `SUELDO_MINIMO`.

\cajamedia

\Needspace{6cm}
## Pregunta 2 — Afianzamiento

Muestre el código, nombre y sueldo mínimo de los cargos cuyo nombre comience con la letra S. Utilice `UPPER` y `LIKE`.

\cajacorta

\Needspace{7cm}
## Pregunta 3 — Afianzamiento

Genere una columna `REPORTE` con el formato `El cargo Sales Manager tiene el código SA_MAN`, junto con el sueldo mínimo, para los cargos cuyo código o nombre comience con A.

\cajamedia

\Needspace{7cm}
## Pregunta 4 — Afianzamiento

Muestre una frase con el formato `SA_MAN corresponde a Sales Manager`, además de los sueldos mínimo y máximo, para los cargos cuyo nombre contenga la palabra `Manager`, sin distinguir mayúsculas o minúsculas.

\cajamedia

\Needspace{7cm}
## Pregunta 5 — Afianzamiento

Muestre código y nombre concatenados bajo el alias `CARGO`, junto con el sueldo mínimo, cuando el código tenga A como segundo carácter o el nombre termine en `Clerk`.

\cajamedia

\Needspace{7cm}
## Pregunta 6 — Afianzamiento

Muestre el texto `El código del cargo <nombre> es: <código>` y su sueldo mínimo para todo cargo cuyo código o nombre comience con S. Ordene por sueldo mínimo descendente y luego por nombre.

\cajamedia

\Needspace{9cm}
## Pregunta 7 — Desafío avanzado

Para cada cargo cuyo código o nombre comience con S, muestre código, nombre, cantidad de empleados y sueldo promedio real redondeado a cero decimales. Incluya solamente cargos con al menos dos empleados. Use `OEHR_JOBS` y `OEHR_EMPLOYEES`.

\cajalarga

\Needspace{10cm}
## Pregunta 8 — Desafío avanzado

Muestre código y nombre de los cargos cuyo código o nombre comience con S y cuyo sueldo promedio real de empleados sea superior al sueldo mínimo definido para el cargo. Incluya el mínimo definido y el promedio real, y ordene por promedio descendente.

\cajaextra

\newpage
## Pregunta 9 — Desafío avanzado

Por departamento, muestre su código, nombre y cantidad de empleados que ocupan cargos cuyo código o nombre comience con S. Incluya solo departamentos con dos o más de esos empleados. Debe unir departamentos, empleados y cargos.

\cajaextra

\Needspace{11cm}
## Pregunta 10 — Desafío avanzado

Por región, muestre el nombre de la región, la cantidad de empleados y la cantidad de cargos distintos cuyo código o nombre comience con S. Recorra desde `OEHR_REGIONS` hasta `OEHR_JOBS` mediante todas las claves foráneas necesarias e incluya solo regiones con más de un empleado coincidente.

\cajaextra

\newpage

# Sección 2 — Variaciones del requerimiento real 2

**Habilidad central:** `COUNT`, `AVG`, `MIN`, `MAX`, diferencias aritméticas, `GROUP BY`, `HAVING` y alias de resultado.

\Needspace{6cm}
## Pregunta 11 — Afianzamiento

Por cargo, muestre el código y la cantidad de empleados. Use los alias `CARGO` y `CANTIDAD_EMPLEADOS`.

\cajacorta

\Needspace{7cm}
## Pregunta 12 — Afianzamiento

Por cargo, muestre código, sueldo promedio redondeado a cero decimales, sueldo mínimo real y sueldo máximo real de sus empleados.

\cajamedia

\Needspace{7cm}
## Pregunta 13 — Afianzamiento

Por cargo, muestre código, número de empleados, promedio de sueldos y diferencia entre sueldo máximo y mínimo. Incluya solo cargos cuya diferencia sea distinta de cero.

\cajamedia

\Needspace{7cm}
## Pregunta 14 — Afianzamiento

Por departamento, muestre su código, cantidad de empleados y suma total de sueldos. Excluya los registros sin departamento y ordene el total de mayor a menor.

\cajamedia

\Needspace{7cm}
## Pregunta 15 — Afianzamiento

Por cargo, muestre la cantidad total de empleados y la cantidad que posee comisión. Incluya solo cargos con al menos dos empleados.

\cajamedia

\Needspace{8cm}
## Pregunta 16 — Afianzamiento

Por departamento y cargo, muestre la cantidad de empleados, el promedio salarial y la diferencia entre máximo y mínimo para departamentos entre 50 y 100. Incluya únicamente grupos cuya diferencia sea mayor que 1.000 dólares.

\cajalarga

\Needspace{10cm}
## Pregunta 17 — Desafío avanzado

Muestre código y nombre del cargo, cantidad de empleados, sueldo promedio real y sueldo mínimo definido en `OEHR_JOBS`. Incluya solamente cargos cuyo promedio real sea superior al mínimo definido y que posean al menos dos empleados.

\cajaextra

\Needspace{10cm}
## Pregunta 18 — Desafío avanzado

Por departamento, muestre código, nombre, nombre de su jefe, cantidad de trabajadores y promedio salarial. Incluya departamentos con al menos tres trabajadores y promedio superior a 5.000 dólares. Deben aparecer solo departamentos con jefe asignado.

\cajaextra

\Needspace{11cm}
## Pregunta 19 — Desafío avanzado

Por región, muestre nombre, cantidad de empleados, sueldo promedio y diferencia entre el sueldo máximo y mínimo. Recorra región, país, ubicación, departamento y empleado. Incluya solo regiones cuya diferencia salarial supere 5.000 dólares.

\cajaextra

\Needspace{10cm}
## Pregunta 20 — Desafío avanzado

Muestre los cargos cuyo sueldo promedio sea superior al promedio salarial de toda la empresa. Incluya código de cargo, cantidad de empleados, promedio del cargo y promedio general; resuelva la comparación mediante una subconsulta y ordene de mayor a menor.

\cajaextra

# Sección 3 — Variaciones del requerimiento real 3

**Habilidad central:** `JOIN`, `ON`, alias, desambiguación, autorrelaciones y vínculo entre trabajador, departamento y jefe del departamento.

\Needspace{8cm}
## Pregunta 21 — Afianzamiento

Muestre código y nombre completo de cada trabajador, nombre de su departamento y nombre completo del jefe asociado a ese departamento. Use los alias `CODIGO_TRABAJADOR`, `NOMBRE_TRABAJADOR`, `DEPARTAMENTO` y `JEFE_DEPARTAMENTO`.

\cajalarga

\Needspace{9cm}
## Pregunta 22 — Afianzamiento

Muestre código y apellido del trabajador, departamento y apellido del jefe del departamento para departamentos entre 30 y 90. Ordene por código de departamento y apellido del trabajador.

\cajalarga

\Needspace{9cm}
## Pregunta 23 — Afianzamiento

Muestre los trabajadores cuyo sueldo sea mayor que el sueldo del jefe de su departamento. Incluya trabajador, sueldo del trabajador, departamento, jefe y sueldo del jefe.

\cajalarga

\Needspace{9cm}
## Pregunta 24 — Afianzamiento

Muestre código y nombre de cada departamento que tenga jefe asignado, nombre completo de ese jefe y nombre del cargo que desempeña. Ordene por código de departamento.

\cajalarga

\Needspace{10cm}
## Pregunta 25 — Afianzamiento

Muestre código y nombre del trabajador, su cargo, departamento, ciudad y jefe del departamento. Debe unir empleados, cargos, departamentos, ubicaciones y nuevamente empleados. Ordene por departamento y apellido.

\cajaextra

\Needspace{9cm}
## Pregunta 26 — Afianzamiento

Muestre todos los trabajadores, incluso quienes no tienen departamento. Incluya código, apellido, departamento y jefe del departamento. Cuando falte un dato, muestre `SIN DEPARTAMENTO` o `SIN JEFE` mediante `NVL`.

\cajalarga

\Needspace{10cm}
## Pregunta 27 — Desafío avanzado

Realice el recorrido trabajador → departamento → jefe del departamento → departamento en el que trabaja ese jefe. Muestre trabajador, departamento del trabajador, jefe asociado y departamento del jefe. Los jefes sin departamento registrado deben aparecer.

\cajaextra

\Needspace{11cm}
## Pregunta 28 — Desafío avanzado

Por departamento, muestre código, nombre, jefe, cantidad de trabajadores y sueldo promedio. Incluya solo departamentos con al menos tres trabajadores y promedio superior a 5.000 dólares. Use `GROUP BY` y `HAVING` sin duplicar al jefe en el conteo.

\cajaextra

\Needspace{11cm}
## Pregunta 29 — Desafío avanzado

Muestre los trabajadores cuyo sueldo sea superior al promedio de su propio departamento. Incluya código, trabajador, sueldo, departamento y jefe del departamento. Resuelva el promedio mediante una subconsulta correlacionada.

\cajaextra

\Needspace{12cm}
## Pregunta 30 — Desafío avanzado

Muestre los departamentos cuyo sueldo promedio sea mayor que el promedio general de la empresa. Incluya jefe, cantidad de trabajadores, sueldo mínimo, máximo y promedio. Considere solo departamentos con más de un trabajador y resuelva la comparación mediante una subconsulta.

\cajaextra

\newpage

# Sección 4 — Variaciones del requerimiento real 4

**Habilidad central:** promedios de sueldos mínimos, agrupación de cargos, `GROUP BY`, `HAVING` y comparación entre rangos configurados y sueldos reales.

\Needspace{6cm}
## Pregunta 31 — Afianzamiento

Muestre los códigos de oficio cuyo promedio de sueldo mínimo sea mayor que 3.000 dólares. Use los alias `CODIGO_OFICIO` y `PROMEDIO_SUELDO_MINIMO`.

\cajacorta

\Needspace{7cm}
## Pregunta 32 — Afianzamiento

Agrupe los oficios por los dos primeros caracteres de su código. Muestre el área y el promedio de sus sueldos mínimos redondeado a cero decimales. Incluya solo áreas cuyo promedio sea superior a 4.000 dólares.

\cajamedia

\Needspace{7cm}
## Pregunta 33 — Afianzamiento

Muestre los códigos de oficio cuyo promedio de sueldo mínimo esté entre 2.500 y 8.000 dólares. Ordene desde el promedio más alto.

\cajamedia

\Needspace{8cm}
## Pregunta 34 — Afianzamiento

Por cada área definida por los dos primeros caracteres del código de oficio, muestre cantidad de oficios y promedio de sueldo mínimo. Incluya solo áreas con al menos dos oficios y promedio superior a 3.000 dólares.

\cajalarga

\Needspace{9cm}
## Pregunta 35 — Afianzamiento

Para cada oficio ocupado, muestre código, nombre, sueldo mínimo configurado, cantidad de trabajadores y sueldo promedio real. Incluya solo oficios cuyo promedio real sea mayor que el mínimo configurado.

\cajalarga

\Needspace{10cm}
## Pregunta 36 — Afianzamiento

Por departamento, muestre código, nombre, cantidad de trabajadores y promedio del sueldo mínimo configurado para los cargos de esos trabajadores. Incluya solo departamentos con al menos dos trabajadores y promedio de mínimos superior a 4.000 dólares.

\cajaextra

\Needspace{11cm}
## Pregunta 37 — Desafío avanzado

Agrupe los trabajadores por el área de su oficio, definida por los dos primeros caracteres de `JOB_ID`. Muestre cantidad de trabajadores, promedio salarial real y promedio de sueldo mínimo configurado. Incluya áreas con al menos tres trabajadores cuyo promedio real supere en 50 % el promedio de mínimos.

\cajaextra

\Needspace{11cm}
## Pregunta 38 — Desafío avanzado

Por departamento, muestre cantidad de oficios distintos, promedio salarial real y promedio de los sueldos mínimos asociados. Incluya departamentos con al menos dos oficios y cuyo promedio real sea mayor que el promedio de mínimos.

\cajaextra

\Needspace{11cm}
## Pregunta 39 — Desafío avanzado

Muestre los oficios ocupados por más de un trabajador cuyo promedio real sea mayor que el promedio general de sueldos. Incluya código, nombre, mínimo y máximo configurados, cantidad de trabajadores y promedio real.

\cajaextra

\Needspace{12cm}
## Pregunta 40 — Desafío avanzado

Forme familias de oficios con los dos primeros caracteres de `JOB_ID`. Calcule la cantidad de oficios y el promedio de mínimos usando una sola vez cada cargo del catálogo `OEHR_JOBS`; calcule por separado la cantidad de trabajadores de la familia. Muestre solo familias cuyo promedio mínimo sea mayor que el promedio general del catálogo y que tengan al menos dos trabajadores.

\cajaextra

\newpage

# Sección 5 — Variaciones del requerimiento real 5

**Habilidad central:** empleados que comparten departamento con personas de referencia, `IN`, subconsultas, concatenación y combinación con relaciones del modelo.

\Needspace{6cm}
## Pregunta 41 — Afianzamiento

Muestre código, nombre y apellido de quienes trabajan en el mismo departamento que algún empleado de apellido Whalen. Obtenga el departamento mediante una subconsulta.

\cajamedia

\Needspace{8cm}
## Pregunta 42 — Afianzamiento

Muestre código y nombre completo de quienes pertenecen a los mismos departamentos que Whalen o King, junto con el nombre del departamento. Use los alias `COD_EMPLEADO`, `NOMBRE_EMPLEADO` y `DEPARTAMENTO`.

\cajalarga

\Needspace{8cm}
## Pregunta 43 — Afianzamiento

Muestre código, nombre completo, sueldo y cargo de quienes trabajan en los mismos departamentos que Whalen o King y ganan más de 7.000 dólares. Ordene por sueldo descendente.

\cajalarga

\Needspace{9cm}
## Pregunta 44 — Afianzamiento

Muestre los empleados de los mismos departamentos que Whalen o King, junto con el nombre de su cargo y el sueldo mínimo definido para este. Una empleados y cargos, y use una subconsulta para los departamentos.

\cajalarga

\Needspace{9cm}
## Pregunta 45 — Afianzamiento

Muestre los empleados de los mismos departamentos que Whalen o King y el nombre completo de su jefe directo. Deben aparecer también quienes no tienen jefe. Use una autorrelación externa.

\cajalarga

\Needspace{10cm}
## Pregunta 46 — Afianzamiento

Por cada departamento en el que trabaje Whalen o King, muestre código, nombre, cantidad de empleados y sueldo promedio. Incluya solo departamentos con dos o más empleados.

\cajaextra

\Needspace{11cm}
## Pregunta 47 — Desafío avanzado

Muestre los empleados de los mismos departamentos que Whalen o King. Incluya departamento, cargo, ciudad y jefe directo; deben aparecer quienes no tengan jefe. Una empleados, departamentos, cargos, ubicaciones y nuevamente empleados.

\cajaextra

\Needspace{11cm}
## Pregunta 48 — Desafío avanzado

Para los departamentos de Whalen o King, muestre departamento, ciudad, cantidad de empleados, sueldo mínimo, máximo y promedio. Incluya solo grupos con promedio superior a 5.000 dólares y diferencia entre máximo y mínimo distinta de cero.

\cajaextra

\Needspace{12cm}
## Pregunta 49 — Desafío avanzado

Muestre los empleados que trabajan en los mismos departamentos que Whalen o King y ganan más que el promedio de su propio departamento. Incluya empleado, departamento, sueldo y promedio departamental. Use una subconsulta correlacionada tanto para mostrar como para comparar el promedio.

\cajaextra

\Needspace{12cm}
## Pregunta 50 — Desafío avanzado

Whalen y King pueden trabajar en departamentos ubicados en la misma ciudad que otros departamentos. Recorra empleados → departamentos → ubicaciones y luego regrese hacia todos los empleados, incluyendo a las personas de referencia si cumplen. Muestre empleado, departamento, ciudad, nombre del país y nombre del cargo; una también `OEHR_COUNTRIES` y `OEHR_JOBS`.

\cajaextra

\newpage

# Sección 6 — Variaciones del requerimiento real 6

**Habilidad central:** `SUBSTR`, concatenación de correos, comisión no nula, `NOT BETWEEN`, conectores lógicos y departamento obtenido mediante subconsulta.

\Needspace{8cm}
## Pregunta 51 — Afianzamiento

Muestre nombre completo, correo propuesto y comisión de los empleados con comisión no nula, sueldo fuera de 5.000 a 10.000 dólares y departamento igual al de Neena Kochhar. Forme el correo con la primera letra del nombre, segunda letra del apellido, código del cargo y `@pruebasql.cl`.

\cajalarga

\Needspace{8cm}
## Pregunta 52 — Afianzamiento

Muestre los empleados con comisión del mismo departamento que John Russell. Genere un usuario en minúsculas con las dos primeras letras del nombre y las tres primeras del apellido. Use los alias `EMPLEADO`, `USUARIO` y `COMISION`.

\cajalarga

\Needspace{8cm}
## Pregunta 53 — Afianzamiento

Muestre código, nombre, sueldo y comisión de quienes tengan comisión no nula, trabajen en el departamento de John Russell y posean sueldo fuera del rango de 5.000 a 10.000 dólares. Ordene por sueldo descendente.

\cajalarga

\Needspace{9cm}
## Pregunta 54 — Afianzamiento

Muestre quienes tengan comisión no nula, sueldo fuera de 5.000 a 10.000 dólares y departamento igual al de John Russell. Incluya el nombre del cargo y genere un correo con la inicial del nombre, el apellido completo y `@empresa.cl`.

\cajalarga

\Needspace{10cm}
## Pregunta 55 — Afianzamiento

Muestre empleado, correo, departamento y ciudad de quienes tengan comisión no nula, sueldo fuera de 5.000 a 10.000 dólares y departamento igual al de John Russell. El correo debe usar la primera letra del nombre, las dos últimas letras del apellido y `@rrhh.cl`.

\cajaextra

\Needspace{8cm}
## Pregunta 56 — Afianzamiento

Para quienes tengan comisión no nula, sueldo fuera de 5.000 a 10.000 dólares y departamento igual al de John Russell, muestre nombre, porcentaje de comisión con signo `%` y valor mensual ganado por comisión.

\cajalarga

\Needspace{12cm}
## Pregunta 57 — Desafío avanzado

Muestre quienes tengan comisión no nula, sueldo fuera de 5.000 a 10.000 dólares y departamento igual al de John Russell. Incluya departamento, cargo, ciudad, país y jefe directo; deben aparecer aunque no tengan jefe. El correo debe contener inicial del nombre, tres primeras letras del apellido, código del cargo y `@sql.cl`.

\cajaextra

\Needspace{11cm}
## Pregunta 58 — Desafío avanzado

Agrupe por cargo a los empleados con comisión del departamento de John Russell. Muestre cargo, cantidad, sueldo promedio y comisión promedio. Incluya cargos con al menos dos empleados cuyo sueldo promedio esté fuera del rango de 5.000 a 10.000 dólares.

\cajaextra

\Needspace{12cm}
## Pregunta 59 — Desafío avanzado

Muestre empleados con comisión no nula, sueldo fuera de 5.000 a 10.000 dólares y departamento igual al de John Russell, pero solo cuando ganen más que el promedio de los empleados con comisión de su mismo departamento y cargo. Incluya código, empleado, cargo, sueldo y comisión, y use una subconsulta correlacionada.

\cajaextra

\Needspace{12cm}
## Pregunta 60 — Desafío avanzado

Busque empleados con comisión no nula y sueldo fuera de 5.000 a 10.000 dólares en cualquier departamento situado en la misma ciudad que el departamento de John Russell. Recorra empleados, departamentos y ubicaciones tanto en la consulta como en la subconsulta. Muestre empleado, correo propuesto, nombre del cargo, departamento, ciudad, sueldo y comisión. El correo debe usar la inicial del nombre, dos letras del apellido desde la segunda posición, el código del cargo y `@desafio.cl`.

\cajaextra

# Comprobación final

- Respondí las 60 preguntas y numeré cada consulta.
- En cada sección resolví seis ejercicios de afianzamiento y cuatro desafíos avanzados.
- Usé las claves foráneas correctas y evité productos cartesianos.
- Diferencié filtros de fila (`WHERE`) y de grupo (`HAVING`).
- Revisé alias, nulos, subconsultas y ordenamientos antes de entregar.
