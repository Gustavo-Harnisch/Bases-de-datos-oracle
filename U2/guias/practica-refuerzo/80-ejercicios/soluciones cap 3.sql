-- =============================================================================
-- PRACTICA DE REFUERZO U2 - SOLUCIONES CAPITULO 3
-- SECCIÓN 3 — TRIGGERS DE MAYÚSCULAS
-- =============================================================================
-- Habilidad central: `BEFORE`, `INSERT`, `UPDATE`, `UPPER`, `TRIM` y valores nulos.
-- Soluciones de referencia. Se aceptan alternativas equivalentes.
-- =============================================================================

-- PREGUNTA 21 - AFIANZAMIENTO
-- 
-- Cree GIGH_CLIENTE_MAYUSCULAS para convertir nombre y apellidos a mayúsculas antes de insertar.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_CLIENTE_MAYUSCULAS BEFORE INSERT ON GIGH_CLIENTE FOR EACH ROW BEGIN :NEW.NOMBRE_CLIENTE:=UPPER(TRIM(:NEW.NOMBRE_CLIENTE)); :NEW.APELLIDO1_CLIENTE:=UPPER(TRIM(:NEW.APELLIDO1_CLIENTE)); :NEW.APELLIDO2_CLIENTE:=UPPER(TRIM(:NEW.APELLIDO2_CLIENTE)); END; /



-- PREGUNTA 22 - AFIANZAMIENTO
-- 
-- Amplíe el trigger para normalizar también EMAIL_CLIENTE y eliminar espacios laterales.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_CLIENTE_MAYUSCULAS BEFORE INSERT OR UPDATE ON GIGH_CLIENTE FOR EACH ROW BEGIN :NEW.EMAIL_CLIENTE:=UPPER(TRIM(:NEW.EMAIL_CLIENTE)); END; /



-- PREGUNTA 23 - AFIANZAMIENTO
-- 
-- Cree GIGH_PRODUCTO_MAYUSCULAS para normalizar NOMBRE_PRODUCTO en inserciones.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_PRODUCTO_MAYUSCULAS BEFORE INSERT ON GIGH_PRODUCTOS FOR EACH ROW BEGIN :NEW.NOMBRE_PRODUCTO:=UPPER(TRIM(:NEW.NOMBRE_PRODUCTO)); END; /



-- PREGUNTA 24 - AFIANZAMIENTO
-- 
-- Modifique ambos triggers para que funcionen en INSERT OR UPDATE.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_PRODUCTO_MAYUSCULAS BEFORE INSERT OR UPDATE ON GIGH_PRODUCTOS FOR EACH ROW BEGIN :NEW.NOMBRE_PRODUCTO:=UPPER(TRIM(:NEW.NOMBRE_PRODUCTO)); END; /



-- PREGUNTA 25 - AFIANZAMIENTO
-- 
-- Inserte nombres en minúsculas con espacios y compruebe el resultado almacenado.
-- SOLUCION:
INSERT INTO GIGH_CLIENTE VALUES(NULL,' ana ',' perez ',NULL,'ana.perez@juanismarket.cl'); SELECT * FROM GIGH_CLIENTE;



-- PREGUNTA 26 - AFIANZAMIENTO
-- 
-- Actualice un producto y un cliente con texto mixto y valide nuevamente la normalización.
-- SOLUCION:
UPDATE GIGH_PRODUCTOS SET NOMBRE_PRODUCTO=' pan integral ' WHERE COD_PRODUCTO=1; SELECT NOMBRE_PRODUCTO FROM GIGH_PRODUCTOS WHERE COD_PRODUCTO=1;



-- PREGUNTA 27 - DESAFÍO
-- 
-- Desafío: maneje valores nulos sin convertirlos en una cadena vacía cuando la columna sea opcional.
-- SOLUCION:
BEGIN IF TRIM(:nombre) IS NULL THEN RAISE_APPLICATION_ERROR(-20030,'NOMBRE OBLIGATORIO'); END IF; END; /



-- PREGUNTA 28 - DESAFÍO
-- 
-- Desafío: agregue una validación que rechace nombres vacíos con RAISE_APPLICATION_ERROR y un código entre -20030 y -20039.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_PRODUCTO_VALIDO BEFORE INSERT OR UPDATE ON GIGH_PRODUCTOS FOR EACH ROW BEGIN IF :NEW.NOMBRE_PRODUCTO IS NULL THEN RAISE_APPLICATION_ERROR(-20031,'NOMBRE VACIO'); END IF; END; /



-- PREGUNTA 29 - DESAFÍO
-- 
-- Desafío: normalice correos con LOWER en vez de UPPER y explique qué decisión es más adecuada para la presentación y la unicidad.
-- SOLUCION:
-- Para presentación: LOWER(TRIM(:NEW.EMAIL_CLIENTE)); para unicidad se recomienda guardar una forma normalizada única.



-- PREGUNTA 30 - DESAFÍO
-- 
-- Desafío: compruebe que los triggers no modifican las columnas numéricas de precios, cantidad o stock.
-- 
-- SOLUCION:
SELECT COD_PRODUCTO,PRECIO_COMPRA,PRECIO_VENTA,CANTIDAD,STOCK FROM GIGH_PRODUCTOS; -- solo columnas numéricas, sin modificaciones



