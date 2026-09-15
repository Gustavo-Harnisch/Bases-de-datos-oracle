-- =============================================================================
-- PRUEBA PRACTICA INTENSIVA - UNIDAD 1
-- CAPITULO 5: EMPLEADOS RELACIONADOS MEDIANTE SUBCONSULTAS
-- =============================================================================
--
-- Habilidad central:
-- Empleados que comparten departamento con personas de referencia, IN,
-- subconsultas, concatenacion y combinacion con relaciones del modelo.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio utilizando una sentencia SELECT.
-- 2. No modifique los datos de las tablas.
-- 3. Utilice los nombres fisicos de las tablas con el prefijo OEHR_.
-- 4. Escriba su consulta debajo del enunciado correspondiente.
-- 5. Use las subconsultas para obtener departamentos, promedios o ciudades de
--    referencia segun lo solicitado.
-- 6. Respete las uniones, filtros, agrupaciones y ordenamientos pedidos.
-- =============================================================================


-- PREGUNTA 41 - AFIANZAMIENTO
-- Muestre el codigo, el nombre y el apellido de quienes trabajan en el mismo
-- departamento que algun empleado de apellido Whalen. Obtenga el departamento
-- mediante una subconsulta.



-- PREGUNTA 42 - AFIANZAMIENTO
-- Muestre el codigo y el nombre completo de quienes pertenecen a los mismos
-- departamentos que Whalen o King, junto con el nombre del departamento. Use
-- los alias COD_EMPLEADO, NOMBRE_EMPLEADO y DEPARTAMENTO.



-- PREGUNTA 43 - AFIANZAMIENTO
-- Muestre el codigo, el nombre completo, el sueldo y el cargo de quienes
-- trabajan en los mismos departamentos que Whalen o King y ganan mas de 7.000
-- dolares. Ordene por sueldo de mayor a menor.



-- PREGUNTA 44 - AFIANZAMIENTO
-- Muestre los empleados de los mismos departamentos que Whalen o King, junto
-- con el nombre de su cargo y el sueldo minimo definido para este. Una
-- empleados y cargos, y use una subconsulta para obtener los departamentos.



-- PREGUNTA 45 - AFIANZAMIENTO
-- Muestre los empleados de los mismos departamentos que Whalen o King y el
-- nombre completo de su jefe directo. Deben aparecer tambien quienes no tengan
-- jefe. Use una autorrelacion externa.



-- PREGUNTA 46 - AFIANZAMIENTO
-- Por cada departamento en el que trabaje Whalen o King, muestre el codigo, el
-- nombre, la cantidad de empleados y el sueldo promedio. Incluya solamente los
-- departamentos que tengan dos o mas empleados.



-- PREGUNTA 47 - DESAFIO AVANZADO
-- Muestre los empleados de los mismos departamentos que Whalen o King. Incluya
-- departamento, cargo, ciudad y jefe directo. Deben aparecer quienes no tengan
-- jefe. Una empleados, departamentos, cargos, ubicaciones y nuevamente
-- empleados.



-- PREGUNTA 48 - DESAFIO AVANZADO
-- Para los departamentos de Whalen o King, muestre departamento, ciudad,
-- cantidad de empleados, sueldo minimo, sueldo maximo y sueldo promedio.
-- Incluya solo grupos con promedio superior a 5.000 dolares y cuya diferencia
-- entre el maximo y el minimo sea distinta de cero.



-- PREGUNTA 49 - DESAFIO AVANZADO
-- Muestre los empleados que trabajan en los mismos departamentos que Whalen o
-- King y ganan mas que el promedio de su propio departamento. Incluya empleado,
-- departamento, sueldo y promedio departamental. Use una subconsulta
-- correlacionada tanto para mostrar como para comparar el promedio.



-- PREGUNTA 50 - DESAFIO AVANZADO
-- Whalen y King pueden trabajar en departamentos ubicados en la misma ciudad
-- que otros departamentos. Recorra empleados -> departamentos -> ubicaciones y
-- luego regrese hacia todos los empleados, incluyendo a las personas de
-- referencia si cumplen. Muestre empleado, departamento, ciudad, nombre del
-- pais y nombre del cargo. Una tambien OEHR_COUNTRIES y OEHR_JOBS.


