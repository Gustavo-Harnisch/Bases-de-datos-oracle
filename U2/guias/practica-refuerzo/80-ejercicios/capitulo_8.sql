-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 8
-- # SECCIÓN 8 — SECUENCIA Y AUDITORÍA DE LOG_VENTAS
-- =============================================================================
-- Habilidad central: secuencia de log, trazabilidad, consultas y auditoría de DML.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 71 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_LOG_VENTA y documente sus valores inicial, mínimo, máximo y política de ciclo.
-- SOLUCION:



-- PREGUNTA 72 - AFIANZAMIENTO
-- 
-- Cree el trigger GIGH_LOG_AUTOINCREMENTAL para asignar COD_LOG automáticamente.
-- SOLUCION:



-- PREGUNTA 73 - AFIANZAMIENTO
-- 
-- Inserte un log con instrucción, detalle y fecha sin indicar el código.
-- SOLUCION:



-- PREGUNTA 74 - AFIANZAMIENTO
-- 
-- Registre manualmente las operaciones PRODUCTOS_R, PRODUCTOS_U y PRODUCTOS_D.
-- SOLUCION:



-- PREGUNTA 75 - AFIANZAMIENTO
-- 
-- Consulte el log ordenado por COD_LOG y luego por FECHAHORA.
-- SOLUCION:



-- PREGUNTA 76 - AFIANZAMIENTO
-- 
-- Muestre cuántas operaciones existen por tipo de instrucción mediante GROUP BY.
-- SOLUCION:



-- PREGUNTA 77 - DESAFÍO
-- 
-- Desafío: cree un trigger de auditoría de productos para registrar INSERT, UPDATE y DELETE con USER.
-- SOLUCION:



-- PREGUNTA 78 - DESAFÍO
-- 
-- Desafío: guarde en el detalle de auditoría el código de producto y, en una actualización, los valores anterior y nuevo del stock.
-- SOLUCION:



-- PREGUNTA 79 - DESAFÍO
-- 
-- Desafío: pruebe que un ROLLBACK elimina también el registro de auditoría creado dentro de la misma transacción.
-- SOLUCION:



-- PREGUNTA 80 - DESAFÍO
-- 
-- Desafío: construya un reporte diario del log con cantidad de operaciones, primera hora y última hora por tipo.
-- 
-- 
-- # Lista de comprobación final
-- 
-- - [ ] Todas las tablas tienen el prefijo del estudiante.
-- - [ ] Los DROP respetan las dependencias entre claves foráneas.
-- - [ ] Los triggers usan correctamente :NEW y :OLD.
-- - [ ] Las secuencias se utilizan solo para generar identificadores.
-- - [ ] Los procedimientos diferencian parámetros y columnas.
-- - [ ] Cada operación DML tiene tratamiento de transacción.
-- - [ ] Las excepciones específicas aparecen antes de WHEN OTHERS.
-- - [ ] Se ejecutaron pruebas válidas, inválidas, duplicados y concurrencia.
-- - [ ] Cada requerimiento está separado con comentarios --.
-- SOLUCION:



