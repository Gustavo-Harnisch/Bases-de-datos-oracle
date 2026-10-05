-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 1
-- # SECCIÓN 1 — MODELO RELACIONAL Y ORDEN DE OBJETOS
-- =============================================================================
-- Habilidad central: modelo físico, restricciones, dependencias y limpieza idempotente.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 1 - AFIANZAMIENTO
-- 
-- Escriba los CREATE TABLE de GIGH_CLIENTE y GIGH_PRODUCTOS con sus columnas, tipos, claves primarias y restricciones de obligatoriedad.
-- SOLUCION:



-- PREGUNTA 2 - AFIANZAMIENTO
-- 
-- Complete las tablas GIGH_VENTA, GIGH_DETALLE_VENTA y GIGH_LOG_VENTAS. Incluya la clave primaria compuesta del detalle.
-- SOLUCION:



-- PREGUNTA 3 - AFIANZAMIENTO
-- 
-- Agregue las claves foráneas entre cliente–venta, venta–detalle y producto–detalle. Use nombres de restricciones con prefijo GIGH_.
-- SOLUCION:



-- PREGUNTA 4 - AFIANZAMIENTO
-- 
-- Ordene los DROP TABLE ... CASCADE CONSTRAINTS para eliminar el modelo completo sin errores de dependencia.
-- SOLUCION:



-- PREGUNTA 5 - AFIANZAMIENTO
-- 
-- Construya un script idempotente que capture ORA-00942 al intentar eliminar una tabla inexistente y relance cualquier otro error.
-- SOLUCION:



-- PREGUNTA 6 - AFIANZAMIENTO
-- 
-- Inserte un registro válido en cada tabla y compruebe con consultas que las claves y relaciones quedaron creadas.
-- SOLUCION:



-- PREGUNTA 7 - DESAFÍO
-- 
-- Desafío: agregue restricciones CHECK para precios, cantidades, stock y totales, y demuestre con una inserción inválida qué excepción produce Oracle.
-- SOLUCION:



-- PREGUNTA 8 - DESAFÍO
-- 
-- Desafío: diseñe una versión del modelo que permita eliminar un cliente solo si no tiene ventas, explicando el efecto de la clave foránea.
-- SOLUCION:



-- PREGUNTA 9 - DESAFÍO
-- 
-- Desafío: escriba un bloque que consulte USER_CONSTRAINTS y USER_CONS_COLUMNS para listar las restricciones del modelo GIGH_.
-- SOLUCION:



-- PREGUNTA 10 - DESAFÍO
-- 
-- Desafío: integre limpieza, creación, carga mínima y consultas de verificación en un único script ejecutable desde un esquema vacío.
-- 
-- SOLUCION:



