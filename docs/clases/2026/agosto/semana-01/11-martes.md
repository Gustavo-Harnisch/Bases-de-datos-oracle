# Clase 1: Martes 11 de agosto

**Fecha:** Martes 11 de agosto de 2026  
**Semana:** 1 de 18  
**Clase:** 1 de 36

[Calendario](../../../index.md) · [Clase 2: Miércoles 12 de agosto →](12-miercoles.md)

## Objetivos

- Reconocer las cláusulas principales de una consulta `SELECT`.
- Recuperar todas las columnas o una selección de columnas.
- Utilizar expresiones aritméticas, alias, concatenación y `DISTINCT`.

## Contenidos

<div class="lesson-columns" markdown>

<div class="content-pattern" data-pattern="concepto" data-title="Concepto" markdown>

Una consulta básica indica **qué columnas** se desean mostrar y **desde qué tabla** se obtienen. La proyección selecciona columnas; la selección de filas se incorporará en la clase siguiente.

</div>

<div class="content-pattern" data-pattern="sintaxis" data-title="Sintaxis básica" markdown>

```sql
SELECT columna_1, columna_2
FROM nombre_tabla;
```

El asterisco (`*`) recupera todas las columnas de la tabla.

</div>

</div>

## Ejemplo guiado

<div class="lesson-columns" markdown>

<div class="content-pattern" data-pattern="ejemplo" data-title="Todas las columnas" markdown>

**Necesidad:** consultar todos los datos de los departamentos.

```sql
SELECT *
FROM oehr_departments;
```

</div>

<div class="content-pattern" data-pattern="ejemplo" data-title="Columnas específicas" markdown>

**Necesidad:** mostrar solamente el código y el nombre del departamento.

```sql
SELECT department_id, department_name
FROM oehr_departments;
```

</div>

</div>

## Expresiones y presentación del resultado

<div class="lesson-columns" markdown>

<div class="content-pattern" data-pattern="concepto" data-title="Cálculos y alias" markdown>

Las expresiones pueden realizar cálculos directamente en `SELECT`. Un alias cambia el encabezado mostrado sin modificar la tabla.

```sql
SELECT employee_id,
       salary * 12 AS sueldo_anual
FROM oehr_employees;
```

</div>

<div class="content-pattern" data-pattern="concepto" data-title="Concatenación y valores únicos" markdown>

El operador `||` une textos. `DISTINCT` elimina valores repetidos del resultado.

```sql
SELECT DISTINCT job_id
FROM oehr_employees;
```

</div>

</div>

## Actividad práctica

<div class="content-pattern" data-pattern="actividad" data-title="Trabajo en clase" markdown>

Construye una consulta que muestre código, nombre completo y sueldo anual de cada empleado. Usa alias descriptivos y conserva una sentencia por requerimiento.

</div>

## Materiales

- <a href="../../../../../assets/pdf/presentaciones/leccion-01.pdf">Diapositivas de la lección en PDF</a>
- <a href="../../../../../assets/downloads/u1/codigos/leccion-01.sql" download>Descargar el SQL de la clase</a>
- Fuente original: `U1/presentaciones/leccion-01.ppt`.

## Código completo de la clase

Este bloque se inserta directamente desde `U1/codigos/leccion-01.sql`. Al editar ese archivo, el sitio y el PDF se actualizan en la siguiente compilación.

```sql
--8<-- "U1/codigos/leccion-01.sql"
```

## Notas

La página Markdown es la fuente única para la versión web y la versión imprimible.
