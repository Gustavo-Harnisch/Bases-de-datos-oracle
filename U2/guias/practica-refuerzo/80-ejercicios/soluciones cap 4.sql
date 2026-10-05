-- =============================================================================
-- PRACTICA DE REFUERZO U2 - SOLUCIONES CAPITULO 4
-- SECCIÓN 4 — TRIGGER RECTIFICADOR
-- =============================================================================
-- Habilidad central: actualización de claves, `:OLD`, `:NEW` y detalle de ventas.
-- Soluciones de referencia. Se aceptan alternativas equivalentes.
-- =============================================================================

-- PREGUNTA 31 - AFIANZAMIENTO
-- 
-- Cree una venta y un detalle asociado y consulte ambas tablas antes de modificar el código de venta.
-- SOLUCION:
SELECT COD_VENTA,COD_PRODUCTO FROM GIGH_DETALLE_VENTA WHERE COD_VENTA=5;



-- PREGUNTA 32 - AFIANZAMIENTO
-- 
-- Implemente GIGH_RECTIFICADOR como trigger BEFORE UPDATE OF COD_VENTA sobre GIGH_VENTA.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_RECTIFICADOR BEFORE UPDATE OF COD_VENTA ON GIGH_VENTA FOR EACH ROW BEGIN UPDATE GIGH_DETALLE_VENTA SET COD_VENTA=:NEW.COD_VENTA WHERE COD_VENTA=:OLD.COD_VENTA; END; /



-- PREGUNTA 33 - AFIANZAMIENTO
-- 
-- Actualice una venta de código 5 a 6 y compruebe que todos sus detalles adoptaron el código nuevo.
-- SOLUCION:
INSERT INTO GIGH_VENTA(COD_VENTA,COD_CLIENTE) VALUES(5,1); INSERT INTO GIGH_DETALLE_VENTA VALUES(5,1,1,1200); UPDATE GIGH_VENTA SET COD_VENTA=6 WHERE COD_VENTA=5; SELECT * FROM GIGH_DETALLE_VENTA WHERE COD_VENTA=6;



-- PREGUNTA 34 - AFIANZAMIENTO
-- 
-- Pruebe una venta con dos productos y verifique que se actualizan varias filas del detalle.
-- SOLUCION:
INSERT INTO GIGH_DETALLE_VENTA VALUES(5,1,1,1200); INSERT INTO GIGH_DETALLE_VENTA VALUES(5,2,2,1800); UPDATE GIGH_VENTA SET COD_VENTA=6 WHERE COD_VENTA=5; SELECT COUNT(*) FROM GIGH_DETALLE_VENTA WHERE COD_VENTA=6;



-- PREGUNTA 35 - AFIANZAMIENTO
-- 
-- Compruebe que un UPDATE sobre FECHA_VENTA no dispara la lógica de rectificación.
-- SOLUCION:
UPDATE GIGH_VENTA SET FECHA_VENTA=SYSDATE WHERE COD_VENTA=5; -- no cambia COD_VENTA



-- PREGUNTA 36 - AFIANZAMIENTO
-- 
-- Muestre con una consulta la diferencia entre :OLD.COD_VENTA y :NEW.COD_VENTA.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_RECTIFICADOR BEFORE UPDATE OF COD_VENTA ON GIGH_VENTA FOR EACH ROW BEGIN DBMS_OUTPUT.PUT_LINE(:OLD.COD_VENTA||' -> '||:NEW.COD_VENTA); UPDATE GIGH_DETALLE_VENTA SET COD_VENTA=:NEW.COD_VENTA WHERE COD_VENTA=:OLD.COD_VENTA; END; /



-- PREGUNTA 37 - DESAFÍO
-- 
-- Desafío: controle que el nuevo código no exista antes de modificar la venta y genere un error personalizado.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_RECTIFICADOR BEFORE UPDATE OF COD_VENTA ON GIGH_VENTA FOR EACH ROW DECLARE n NUMBER; BEGIN SELECT COUNT(*) INTO n FROM GIGH_VENTA WHERE COD_VENTA=:NEW.COD_VENTA; IF n>0 THEN RAISE_APPLICATION_ERROR(-20040,'CODIGO YA EXISTE'); END IF; UPDATE GIGH_DETALLE_VENTA SET COD_VENTA=:NEW.COD_VENTA WHERE COD_VENTA=:OLD.COD_VENTA; END; /



-- PREGUNTA 38 - DESAFÍO
-- 
-- Desafío: maneje la actualización de una venta sin detalles y registre en DBMS_OUTPUT cuántas filas fueron afectadas.
-- SOLUCION:
UPDATE GIGH_VENTA SET COD_VENTA=9 WHERE COD_VENTA=8; DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' venta actualizada');



-- PREGUNTA 39 - DESAFÍO
-- 
-- Desafío: explique cómo la actualización del detalle evita una violación de la clave foránea durante el cambio de código.
-- SOLUCION:
-- El trigger actualiza primero las filas hijas; al finalizar el UPDATE la FK ya apunta al nuevo padre.



-- PREGUNTA 40 - DESAFÍO
-- 
-- Desafío: agregue una auditoría que registre en GIGH_LOG_VENTAS el código anterior, el nuevo código y la fecha del cambio.
-- 
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_RECTIFICADOR_LOG BEFORE UPDATE OF COD_VENTA ON GIGH_VENTA FOR EACH ROW BEGIN UPDATE GIGH_DETALLE_VENTA SET COD_VENTA=:NEW.COD_VENTA WHERE COD_VENTA=:OLD.COD_VENTA; INSERT INTO GIGH_LOG_VENTAS(INSTRUCCION,DETALLE) VALUES('RECTIFICADOR',:OLD.COD_VENTA||' -> '||:NEW.COD_VENTA); END; /



