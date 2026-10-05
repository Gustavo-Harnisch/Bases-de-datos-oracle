-- =============================================================================
-- PRACTICA DE REFUERZO U2 - SOLUCIONES CAPITULO 8
-- SECCIÓN 8 — SECUENCIA Y AUDITORÍA DE LOG_VENTAS
-- =============================================================================
-- Habilidad central: secuencia de log, trazabilidad, consultas y auditoría de DML.
-- Soluciones de referencia. Se aceptan alternativas equivalentes.
-- =============================================================================

-- PREGUNTA 71 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_LOG_VENTA y documente sus valores inicial, mínimo, máximo y política de ciclo.
-- SOLUCION:
CREATE SEQUENCE GIGH_SEQ_LOG_VENTA START WITH 1 INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE;



-- PREGUNTA 72 - AFIANZAMIENTO
-- 
-- Cree el trigger GIGH_LOG_AUTOINCREMENTAL para asignar COD_LOG automáticamente.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_LOG_AUTOINCREMENTAL BEFORE INSERT ON GIGH_LOG_VENTAS FOR EACH ROW WHEN(NEW.COD_LOG IS NULL) BEGIN :NEW.COD_LOG:=GIGH_SEQ_LOG_VENTA.NEXTVAL; END; /



-- PREGUNTA 73 - AFIANZAMIENTO
-- 
-- Inserte un log con instrucción, detalle y fecha sin indicar el código.
-- SOLUCION:
INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES('PRODUCTOS_R','CARGA');



-- PREGUNTA 74 - AFIANZAMIENTO
-- 
-- Registre manualmente las operaciones PRODUCTOS_R, PRODUCTOS_U y PRODUCTOS_D.
-- SOLUCION:
INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES('PRODUCTOS_U','ACTUALIZACION'); INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES('PRODUCTOS_D','BORRADO');



-- PREGUNTA 75 - AFIANZAMIENTO
-- 
-- Consulte el log ordenado por COD_LOG y luego por FECHAHORA.
-- SOLUCION:
SELECT * FROM GIGH_LOG_VENTAS ORDER BY COD_LOG,FECHAHORA;



-- PREGUNTA 76 - AFIANZAMIENTO
-- 
-- Muestre cuántas operaciones existen por tipo de instrucción mediante GROUP BY.
-- SOLUCION:
SELECT INSTRUCCION,COUNT(*) CANTIDAD FROM GIGH_LOG_VENTAS GROUP BY INSTRUCCION;



-- PREGUNTA 77 - DESAFÍO
-- 
-- Desafío: cree un trigger de auditoría de productos para registrar INSERT, UPDATE y DELETE con USER.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_AUD_PRODUCTOS AFTER INSERT OR UPDATE OR DELETE ON GIGH_PRODUCTOS FOR EACH ROW BEGIN INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES(CASE WHEN INSERTING THEN 'INSERT' WHEN UPDATING THEN 'UPDATE' ELSE 'DELETE' END,'COD='||NVL(TO_CHAR(:NEW.COD_PRODUCTO),TO_CHAR(:OLD.COD_PRODUCTO))||' USER='||USER); END; /



-- PREGUNTA 78 - DESAFÍO
-- 
-- Desafío: guarde en el detalle de auditoría el código de producto y, en una actualización, los valores anterior y nuevo del stock.
-- SOLUCION:
INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES('UPDATE_STOCK',:OLD.STOCK||' -> '||:NEW.STOCK);



-- PREGUNTA 79 - DESAFÍO
-- 
-- Desafío: pruebe que un ROLLBACK elimina también el registro de auditoría creado dentro de la misma transacción.
-- SOLUCION:
SAVEPOINT antes_log; INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES('PRUEBA','ROLLBACK'); ROLLBACK TO antes_log;



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
SELECT TRUNC(FECHAHORA) DIA,INSTRUCCION,COUNT(*) CANTIDAD,MIN(FECHAHORA) PRIMERA,MAX(FECHAHORA) ULTIMA FROM GIGH_LOG_VENTAS GROUP BY TRUNC(FECHAHORA),INSTRUCCION ORDER BY DIA,INSTRUCCION;



