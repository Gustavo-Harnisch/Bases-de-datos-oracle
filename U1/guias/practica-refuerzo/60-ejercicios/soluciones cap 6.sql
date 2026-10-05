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






-- PREGUNTA 52 - AFIANZAMIENTO
-- Muestre los empleados con comision del mismo departamento que John Russell.
-- Genere un usuario en minusculas con las dos primeras letras del nombre y las
-- tres primeras letras del apellido. Use los alias EMPLEADO, USUARIO y
-- COMISION.

-- SOLUCION:






-- PREGUNTA 53 - AFIANZAMIENTO
-- Muestre el codigo, el nombre, el sueldo y la comision de quienes tengan
-- comision no nula, trabajen en el departamento de John Russell y posean un
-- sueldo fuera del rango de 5.000 a 10.000 dolares. Ordene por sueldo de mayor
-- a menor.

-- SOLUCION:






-- PREGUNTA 54 - AFIANZAMIENTO
-- Muestre quienes tengan comision no nula, sueldo fuera de 5.000 a 10.000
-- dolares y departamento igual al de John Russell. Incluya el nombre del cargo
-- y genere un correo con la inicial del nombre, el apellido completo y
-- @empresa.cl.

-- SOLUCION:






-- PREGUNTA 55 - AFIANZAMIENTO
-- Muestre empleado, correo, departamento y ciudad de quienes tengan comision
-- no nula, sueldo fuera de 5.000 a 10.000 dolares y departamento igual al de
-- John Russell. El correo debe usar la primera letra del nombre, las dos
-- ultimas letras del apellido y @rrhh.cl.

-- SOLUCION:






-- PREGUNTA 56 - AFIANZAMIENTO
-- Para quienes tengan comision no nula, sueldo fuera de 5.000 a 10.000 dolares
-- y departamento igual al de John Russell, muestre el nombre, el porcentaje de
-- comision con el signo % y el valor mensual ganado por comision.
--
-- El valor mensual de la comision se obtiene aplicando COMMISSION_PCT al sueldo
-- del empleado.

-- SOLUCION:






-- PREGUNTA 57 - DESAFIO AVANZADO
-- Muestre quienes tengan comision no nula, sueldo fuera de 5.000 a 10.000
-- dolares y departamento igual al de John Russell. Incluya departamento, cargo,
-- ciudad, pais y jefe directo. Deben aparecer aunque no tengan jefe. El correo
-- debe contener la inicial del nombre, las tres primeras letras del apellido,
-- el codigo del cargo y @sql.cl.

-- SOLUCION:






-- PREGUNTA 58 - DESAFIO AVANZADO
-- Agrupe por cargo a los empleados con comision del departamento de John
-- Russell. Muestre cargo, cantidad, sueldo promedio y comision promedio.
-- Incluya cargos con al menos dos empleados cuyo sueldo promedio este fuera del
-- rango de 5.000 a 10.000 dolares.

-- SOLUCION:






-- PREGUNTA 59 - DESAFIO AVANZADO
-- Muestre empleados con comision no nula, sueldo fuera de 5.000 a 10.000
-- dolares y departamento igual al de John Russell, pero solo cuando ganen mas
-- que el promedio de los empleados con comision de su mismo departamento y
-- cargo. Incluya codigo, empleado, cargo, sueldo y comision, y use una
-- subconsulta correlacionada.

-- SOLUCION:






-- PREGUNTA 60 - DESAFIO AVANZADO
-- Busque empleados con comision no nula y sueldo fuera de 5.000 a 10.000
-- dolares en cualquier departamento situado en la misma ciudad que el
-- departamento de John Russell. Recorra empleados, departamentos y ubicaciones
-- tanto en la consulta como en la subconsulta. Muestre empleado, correo
-- propuesto, nombre del cargo, departamento, ciudad, sueldo y comision. El
-- correo debe usar la inicial del nombre, dos letras del apellido desde la
-- segunda posicion, el codigo del cargo y @desafio.cl.

-- SOLUCION:
