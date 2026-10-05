-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 7
-- # SECCIÓN 7 — PROCEDIMIENTO DE CARGA DE CLIENTES
-- =============================================================================
-- Habilidad central: inserción integral, función de correo, concurrencia y manejo de errores.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 61 - AFIANZAMIENTO
-- 
-- Declare GIGH_CARGA_CLIENTE con parámetros para código, nombre, apellidos y correo.
-- SOLUCION:



-- PREGUNTA 62 - AFIANZAMIENTO
-- 
-- Inserte todos los campos de un cliente y permita que el trigger genere el código cuando sea nulo.
-- SOLUCION:



-- PREGUNTA 63 - AFIANZAMIENTO
-- 
-- Use GIGH_GENERA_EMAIL cuando el correo no sea proporcionado por el llamador.
-- SOLUCION:



-- PREGUNTA 64 - AFIANZAMIENTO
-- 
-- Permita recibir un correo explícito y compruebe la restricción UNIQUE.
-- SOLUCION:



-- PREGUNTA 65 - AFIANZAMIENTO
-- 
-- Agregue LOCK TABLE y confirme una inserción correcta con COMMIT.
-- SOLUCION:



-- PREGUNTA 66 - AFIANZAMIENTO
-- 
-- Capture DUP_VAL_ON_INDEX, VALUE_ERROR y errores inesperados con mensajes claros.
-- SOLUCION:



-- PREGUNTA 67 - DESAFÍO
-- 
-- Desafío: cree una excepción propia para nombre o apellido obligatorio y asígnela con PRAGMA EXCEPTION_INIT.
-- SOLUCION:



-- PREGUNTA 68 - DESAFÍO
-- 
-- Desafío: demuestre con dos llamadas iguales que la función genera correos diferentes sin intervención manual.
-- SOLUCION:



-- PREGUNTA 69 - DESAFÍO
-- 
-- Desafío: diseñe una prueba con SAVEPOINT que permita deshacer una carga sin perder una carga anterior válida.
-- SOLUCION:



-- PREGUNTA 70 - DESAFÍO
-- 
-- Desafío: documente cómo el bloqueo y la restricción UNIQUE trabajan juntos para resolver cargas concurrentes.
-- 
-- SOLUCION:



