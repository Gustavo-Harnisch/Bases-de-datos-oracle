-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 6
-- # SECCIÓN 6 — PROCEDIMIENTO INTEGRAL DE PRODUCTOS R/U/D
-- =============================================================================
-- Habilidad central: parámetros, DML, opciones, concurrencia, transacciones y log.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 51 - AFIANZAMIENTO
-- 
-- Declare GIGH_PRODUCTOS_RUD con OPCION_P y parámetros para todos los datos del producto.
-- SOLUCION:



-- PREGUNTA 52 - AFIANZAMIENTO
-- 
-- Implemente la opción R para insertar un producto usando la clave automática cuando corresponda.
-- SOLUCION:



-- PREGUNTA 53 - AFIANZAMIENTO
-- 
-- Implemente la opción U para modificar precio de compra, precio de venta y stock mediante el código.
-- SOLUCION:



-- PREGUNTA 54 - AFIANZAMIENTO
-- 
-- Implemente la opción D para eliminar un producto mediante el código.
-- SOLUCION:



-- PREGUNTA 55 - AFIANZAMIENTO
-- 
-- Agregue IF o ELSIF para rechazar opciones distintas de R, U y D.
-- SOLUCION:



-- PREGUNTA 56 - AFIANZAMIENTO
-- 
-- Use SQL%ROWCOUNT para informar cuando una actualización o eliminación no encontró el producto.
-- SOLUCION:



-- PREGUNTA 57 - DESAFÍO
-- 
-- Desafío: agregue LOCK TABLE, COMMIT, ROLLBACK, DUP_VAL_ON_INDEX, VALUE_ERROR y WHEN OTHERS.
-- SOLUCION:



-- PREGUNTA 58 - DESAFÍO
-- 
-- Desafío: registre cada operación en GIGH_LOG_VENTAS usando GIGH_SEQ_LOG_VENTA mediante su trigger.
-- SOLUCION:



-- PREGUNTA 59 - DESAFÍO
-- 
-- Desafío: valide que el precio de venta no sea menor que el precio de compra y que el stock no sea negativo.
-- SOLUCION:



-- PREGUNTA 60 - DESAFÍO
-- 
-- Desafío: impida eliminar productos que aparezcan en GIGH_DETALLE_VENTA y explique la excepción de integridad referencial.
-- 
-- SOLUCION:



