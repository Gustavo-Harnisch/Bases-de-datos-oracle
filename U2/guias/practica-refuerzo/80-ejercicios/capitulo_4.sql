-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 4
-- # SECCIÓN 4 — TRIGGER RECTIFICADOR
-- =============================================================================
-- Habilidad central: actualización de claves, `:OLD`, `:NEW` y detalle de ventas.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 31 - AFIANZAMIENTO
-- 
-- Cree una venta y un detalle asociado y consulte ambas tablas antes de modificar el código de venta.
-- SOLUCION:



-- PREGUNTA 32 - AFIANZAMIENTO
-- 
-- Implemente GIGH_RECTIFICADOR como trigger BEFORE UPDATE OF COD_VENTA sobre GIGH_VENTA.
-- SOLUCION:



-- PREGUNTA 33 - AFIANZAMIENTO
-- 
-- Actualice una venta de código 5 a 6 y compruebe que todos sus detalles adoptaron el código nuevo.
-- SOLUCION:



-- PREGUNTA 34 - AFIANZAMIENTO
-- 
-- Pruebe una venta con dos productos y verifique que se actualizan varias filas del detalle.
-- SOLUCION:



-- PREGUNTA 35 - AFIANZAMIENTO
-- 
-- Compruebe que un UPDATE sobre FECHA_VENTA no dispara la lógica de rectificación.
-- SOLUCION:



-- PREGUNTA 36 - AFIANZAMIENTO
-- 
-- Muestre con una consulta la diferencia entre :OLD.COD_VENTA y :NEW.COD_VENTA.
-- SOLUCION:



-- PREGUNTA 37 - DESAFÍO
-- 
-- Desafío: controle que el nuevo código no exista antes de modificar la venta y genere un error personalizado.
-- SOLUCION:



-- PREGUNTA 38 - DESAFÍO
-- 
-- Desafío: maneje la actualización de una venta sin detalles y registre en DBMS_OUTPUT cuántas filas fueron afectadas.
-- SOLUCION:



-- PREGUNTA 39 - DESAFÍO
-- 
-- Desafío: explique cómo la actualización del detalle evita una violación de la clave foránea durante el cambio de código.
-- SOLUCION:



-- PREGUNTA 40 - DESAFÍO
-- 
-- Desafío: agregue una auditoría que registre en GIGH_LOG_VENTAS el código anterior, el nuevo código y la fecha del cambio.
-- 
-- SOLUCION:



