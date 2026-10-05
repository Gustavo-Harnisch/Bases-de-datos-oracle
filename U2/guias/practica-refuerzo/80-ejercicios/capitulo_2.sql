-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 2
-- # SECCIÓN 2 — SECUENCIAS Y TRIGGERS AUTOINCREMENTALES
-- =============================================================================
-- Habilidad central: secuencias, `:NEW`, claves automáticas y pruebas de generación.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 11 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_CLIENTE con START WITH 1, incremento unitario y NOCYCLE.
-- SOLUCION:



-- PREGUNTA 12 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_PRODUCTO con límites razonables para el crecimiento del minimarket.
-- SOLUCION:



-- PREGUNTA 13 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_LOG_VENTA y documente por qué una secuencia no garantiza números consecutivos.
-- SOLUCION:



-- PREGUNTA 14 - AFIANZAMIENTO
-- 
-- Implemente GIGH_CLIENTE_AUTOINCREMENTAL para asignar NEXTVAL cuando :NEW.COD_CLIENTE sea nulo.
-- SOLUCION:



-- PREGUNTA 15 - AFIANZAMIENTO
-- 
-- Implemente GIGH_PRODUCTO_AUTOINCREMENTAL y pruebe dos inserciones sin indicar código.
-- SOLUCION:



-- PREGUNTA 16 - AFIANZAMIENTO
-- 
-- Pruebe qué ocurre cuando se entrega un código explícito y explique por qué el trigger no debe reemplazarlo.
-- SOLUCION:



-- PREGUNTA 17 - DESAFÍO
-- 
-- Desafío: cree un trigger autoincremental para GIGH_LOG_VENTAS y registre tres operaciones usando la secuencia.
-- SOLUCION:



-- PREGUNTA 18 - DESAFÍO
-- 
-- Desafío: simule dos sesiones insertando clientes y explique por qué una secuencia evita que ambas obtengan el mismo código.
-- SOLUCION:



-- PREGUNTA 19 - DESAFÍO
-- 
-- Desafío: provoque un ROLLBACK después de consumir NEXTVAL y compruebe que el número puede quedar con un salto.
-- SOLUCION:



-- PREGUNTA 20 - DESAFÍO
-- 
-- Desafío: escriba un bloque que consulte USER_SEQUENCES y valide inicio, incremento, máximo, ciclo y caché de las secuencias.
-- 
-- SOLUCION:



