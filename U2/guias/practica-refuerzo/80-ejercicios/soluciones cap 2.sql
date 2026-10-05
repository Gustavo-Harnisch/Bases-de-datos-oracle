-- =============================================================================
-- PRACTICA DE REFUERZO U2 - SOLUCIONES CAPITULO 2
-- SECCIÓN 2 — SECUENCIAS Y TRIGGERS AUTOINCREMENTALES
-- =============================================================================
-- Habilidad central: secuencias, `:NEW`, claves automáticas y pruebas de generación.
-- Soluciones de referencia. Se aceptan alternativas equivalentes.
-- =============================================================================

-- PREGUNTA 11 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_CLIENTE con START WITH 1, incremento unitario y NOCYCLE.
-- SOLUCION:
CREATE SEQUENCE GIGH_SEQ_CLIENTE START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;



-- PREGUNTA 12 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_PRODUCTO con límites razonables para el crecimiento del minimarket.
-- SOLUCION:
CREATE SEQUENCE GIGH_SEQ_PRODUCTO START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;



-- PREGUNTA 13 - AFIANZAMIENTO
-- 
-- Cree GIGH_SEQ_LOG_VENTA y documente por qué una secuencia no garantiza números consecutivos.
-- SOLUCION:
CREATE SEQUENCE GIGH_SEQ_LOG_VENTA START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;



-- PREGUNTA 14 - AFIANZAMIENTO
-- 
-- Implemente GIGH_CLIENTE_AUTOINCREMENTAL para asignar NEXTVAL cuando :NEW.COD_CLIENTE sea nulo.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_CLIENTE_AUTOINCREMENTAL BEFORE INSERT ON GIGH_CLIENTE FOR EACH ROW WHEN(NEW.COD_CLIENTE IS NULL) BEGIN :NEW.COD_CLIENTE:=GIGH_SEQ_CLIENTE.NEXTVAL; END; /



-- PREGUNTA 15 - AFIANZAMIENTO
-- 
-- Implemente GIGH_PRODUCTO_AUTOINCREMENTAL y pruebe dos inserciones sin indicar código.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_PRODUCTO_AUTOINCREMENTAL BEFORE INSERT ON GIGH_PRODUCTOS FOR EACH ROW WHEN(NEW.COD_PRODUCTO IS NULL) BEGIN :NEW.COD_PRODUCTO:=GIGH_SEQ_PRODUCTO.NEXTVAL; END; /



-- PREGUNTA 16 - AFIANZAMIENTO
-- 
-- Pruebe qué ocurre cuando se entrega un código explícito y explique por qué el trigger no debe reemplazarlo.
-- SOLUCION:
INSERT INTO GIGH_CLIENTE(COD_CLIENTE,NOMBRE_CLIENTE,APELLIDO1_CLIENTE,EMAIL_CLIENTE) VALUES(99,'ANA','PEREZ','ANA.PEREZ@JUANISMARKET.CL'); -- conserva el código explícito



-- PREGUNTA 17 - DESAFÍO
-- 
-- Desafío: cree un trigger autoincremental para GIGH_LOG_VENTAS y registre tres operaciones usando la secuencia.
-- SOLUCION:
CREATE OR REPLACE TRIGGER GIGH_LOG_AUTOINCREMENTAL BEFORE INSERT ON GIGH_LOG_VENTAS FOR EACH ROW WHEN(NEW.COD_LOG IS NULL) BEGIN :NEW.COD_LOG:=GIGH_SEQ_LOG_VENTA.NEXTVAL; END; /



-- PREGUNTA 18 - DESAFÍO
-- 
-- Desafío: simule dos sesiones insertando clientes y explique por qué una secuencia evita que ambas obtengan el mismo código.
-- SOLUCION:
-- NEXTVAL es atómico entre sesiones: cada INSERT obtiene un valor distinto.
INSERT INTO GIGH_CLIENTE(COD_CLIENTE,NOMBRE_CLIENTE,APELLIDO1_CLIENTE,EMAIL_CLIENTE) VALUES(NULL,'DOS','SESIONES','DOS@JUANISMARKET.CL');



-- PREGUNTA 19 - DESAFÍO
-- 
-- Desafío: provoque un ROLLBACK después de consumir NEXTVAL y compruebe que el número puede quedar con un salto.
-- SOLUCION:
SAVEPOINT antes; SELECT GIGH_SEQ_CLIENTE.NEXTVAL FROM DUAL; ROLLBACK TO antes; -- la secuencia puede dejar un salto



-- PREGUNTA 20 - DESAFÍO
-- 
-- Desafío: escriba un bloque que consulte USER_SEQUENCES y valide inicio, incremento, máximo, ciclo y caché de las secuencias.
-- 
-- SOLUCION:
SELECT SEQUENCE_NAME,MIN_VALUE,MAX_VALUE,INCREMENT_BY,CYCLE_FLAG,CACHE_SIZE FROM USER_SEQUENCES WHERE SEQUENCE_NAME LIKE 'GIGH%';



