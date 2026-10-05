-- =============================================================================
-- PRACTICA DE REFUERZO U2 - SOLUCIONES CAPITULO 6
-- SECCIÓN 6 — PROCEDIMIENTO INTEGRAL DE PRODUCTOS R/U/D
-- =============================================================================
-- Habilidad central: parámetros, DML, opciones, concurrencia, transacciones y log.
-- Soluciones de referencia. Se aceptan alternativas equivalentes.
-- =============================================================================

-- PREGUNTA 51 - AFIANZAMIENTO
-- 
-- Declare GIGH_PRODUCTOS_RUD con OPCION_P y parámetros para todos los datos del producto.
-- SOLUCION:
CREATE OR REPLACE PROCEDURE GIGH_PRODUCTOS_RUD(OPCION_P VARCHAR2,COD_PRODUCTO_P NUMBER DEFAULT NULL,NOMBRE_PRODUCTO_P VARCHAR2 DEFAULT NULL,PRECIO_COMPRA_P NUMBER DEFAULT NULL,PRECIO_VENTA_P NUMBER DEFAULT NULL,CANTIDAD_P NUMBER DEFAULT NULL,STOCK_P NUMBER DEFAULT NULL) IS BEGIN IF UPPER(OPCION_P)='R' THEN INSERT INTO GIGH_PRODUCTOS VALUES(COD_PRODUCTO_P,NOMBRE_PRODUCTO_P,PRECIO_COMPRA_P,PRECIO_VENTA_P,NVL(CANTIDAD_P,0),NVL(STOCK_P,0)); END IF; END; /



-- PREGUNTA 52 - AFIANZAMIENTO
-- 
-- Implemente la opción R para insertar un producto usando la clave automática cuando corresponda.
-- SOLUCION:
ELSIF UPPER(OPCION_P)='U' THEN UPDATE GIGH_PRODUCTOS SET PRECIO_COMPRA=PRECIO_COMPRA_P,PRECIO_VENTA=PRECIO_VENTA_P,STOCK=STOCK_P WHERE COD_PRODUCTO=COD_PRODUCTO_P; END IF;



-- PREGUNTA 53 - AFIANZAMIENTO
-- 
-- Implemente la opción U para modificar precio de compra, precio de venta y stock mediante el código.
-- SOLUCION:
ELSIF UPPER(OPCION_P)='D' THEN DELETE FROM GIGH_PRODUCTOS WHERE COD_PRODUCTO=COD_PRODUCTO_P; END IF;



-- PREGUNTA 54 - AFIANZAMIENTO
-- 
-- Implemente la opción D para eliminar un producto mediante el código.
-- SOLUCION:
IF UPPER(OPCION_P) NOT IN('R','U','D') THEN RAISE_APPLICATION_ERROR(-20013,'OPCION INVALIDA'); END IF;



-- PREGUNTA 55 - AFIANZAMIENTO
-- 
-- Agregue IF o ELSIF para rechazar opciones distintas de R, U y D.
-- SOLUCION:
IF SQL%ROWCOUNT=0 THEN RAISE_APPLICATION_ERROR(-20011,'PRODUCTO NO ENCONTRADO'); END IF;



-- PREGUNTA 56 - AFIANZAMIENTO
-- 
-- Use SQL%ROWCOUNT para informar cuando una actualización o eliminación no encontró el producto.
-- SOLUCION:
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN ROLLBACK; RAISE_APPLICATION_ERROR(-20014,'PRODUCTO DUPLICADO'); WHEN VALUE_ERROR THEN ROLLBACK; RAISE_APPLICATION_ERROR(-20015,'DATO INVALIDO'); WHEN OTHERS THEN ROLLBACK; RAISE;



-- PREGUNTA 57 - DESAFÍO
-- 
-- Desafío: agregue LOCK TABLE, COMMIT, ROLLBACK, DUP_VAL_ON_INDEX, VALUE_ERROR y WHEN OTHERS.
-- SOLUCION:
LOCK TABLE GIGH_PRODUCTOS IN ROW EXCLUSIVE MODE; COMMIT; -- confirmar solo después del DML y del log



-- PREGUNTA 58 - DESAFÍO
-- 
-- Desafío: registre cada operación en GIGH_LOG_VENTAS usando GIGH_SEQ_LOG_VENTA mediante su trigger.
-- SOLUCION:
INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES('PRODUCTOS_'||UPPER(OPCION_P),'COD='||COD_PRODUCTO_P);



-- PREGUNTA 59 - DESAFÍO
-- 
-- Desafío: valide que el precio de venta no sea menor que el precio de compra y que el stock no sea negativo.
-- SOLUCION:
IF NOMBRE_PRODUCTO_P IS NULL OR PRECIO_COMPRA_P<0 OR PRECIO_VENTA_P<PRECIO_COMPRA_P OR STOCK_P<0 THEN RAISE_APPLICATION_ERROR(-20030,'REGLA DE PRODUCTO INVALIDA'); END IF;



-- PREGUNTA 60 - DESAFÍO
-- 
-- Desafío: impida eliminar productos que aparezcan en GIGH_DETALLE_VENTA y explique la excepción de integridad referencial.
-- 
-- SOLUCION:
DELETE FROM GIGH_PRODUCTOS WHERE COD_PRODUCTO=:codigo; -- la FK produce ORA-02292 si tiene detalles



