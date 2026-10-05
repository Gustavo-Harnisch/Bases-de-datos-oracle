-- =============================================================================
-- PRACTICA DE REFUERZO U2 - SOLUCIONES CAPITULO 5
-- SECCIÓN 5 — FUNCIÓN DE CORREOS
-- =============================================================================
-- Habilidad central: funciones, `SELECT INTO`, duplicados, sufijos y excepciones.
-- Soluciones de referencia. Se aceptan alternativas equivalentes.
-- =============================================================================

-- PREGUNTA 41 - AFIANZAMIENTO
-- 
-- Declare la estructura de GIGH_GENERA_EMAIL con parámetros de nombre y primer apellido y retorno VARCHAR2.
-- SOLUCION:
CREATE OR REPLACE FUNCTION GIGH_GENERA_EMAIL(NOMBRE_CLIENTE_P VARCHAR2,APELLIDO1_CLIENTE_P VARCHAR2) RETURN VARCHAR2 IS BEGIN RETURN UPPER(TRIM(NOMBRE_CLIENTE_P))||'.'||UPPER(TRIM(APELLIDO1_CLIENTE_P))||'@JUANISMARKET.CL'; END; /



-- PREGUNTA 42 - AFIANZAMIENTO
-- 
-- Genere el correo base con formato NOMBRE.APELLIDO@JUANISMARKET.CL.
-- SOLUCION:
SELECT GIGH_GENERA_EMAIL('Juanita','Perez') FROM DUAL;



-- PREGUNTA 43 - AFIANZAMIENTO
-- 
-- Aplique TRIM y una normalización consistente de mayúsculas o minúsculas.
-- SOLUCION:
SELECT GIGH_GENERA_EMAIL(TRIM(' Juanita '),TRIM(' Perez ')) FROM DUAL;



-- PREGUNTA 44 - AFIANZAMIENTO
-- 
-- Consulte GIGH_CLIENTE para detectar si el correo base ya existe.
-- SOLUCION:
SELECT COUNT(*) INTO v_exist FROM GIGH_CLIENTE WHERE EMAIL_CLIENTE=v_email; -- validar antes de retornar



-- PREGUNTA 45 - AFIANZAMIENTO
-- 
-- Agregue el sufijo 1 antes de la arroba cuando exista el correo base.
-- SOLUCION:
IF NOMBRE_CLIENTE_P IS NULL OR APELLIDO1_CLIENTE_P IS NULL THEN RAISE_APPLICATION_ERROR(-20001,'NOMBRE/APELLIDO OBLIGATORIO'); END IF;



-- PREGUNTA 46 - AFIANZAMIENTO
-- 
-- Extienda la lógica para producir los sufijos 2, 3 y siguientes sin duplicar correos.
-- SOLUCION:
-- Bucle: mientras COUNT(*) > 0, incrementar sufijo y volver a consultar.



-- PREGUNTA 47 - DESAFÍO
-- 
-- Desafío: controle nombres o apellidos nulos con una excepción propia y RAISE_APPLICATION_ERROR.
-- SOLUCION:
BEGIN IF NOMBRE_CLIENTE_P IS NULL THEN RAISE_APPLICATION_ERROR(-20030,'NOMBRE OBLIGATORIO'); END IF; END; /



-- PREGUNTA 48 - DESAFÍO
-- 
-- Desafío: elimine tildes y espacios internos de nombres y apellidos antes de construir el correo.
-- SOLUCION:
V_BASE:=REGEXP_REPLACE(UPPER(TRIM(NOMBRE_CLIENTE_P)),'[ÁÀÄ]','A')||'.'||REGEXP_REPLACE(UPPER(TRIM(APELLIDO1_CLIENTE_P)),'[ÉÈË]','E');



-- PREGUNTA 49 - DESAFÍO
-- 
-- Desafío: pruebe la función con cuatro clientes repetidos y muestre los cuatro correos generados.
-- SOLUCION:
SELECT GIGH_GENERA_EMAIL('JUANITA','PEREZ') FROM DUAL; SELECT GIGH_GENERA_EMAIL('JUANITA','PEREZ') FROM DUAL; SELECT GIGH_GENERA_EMAIL('JUANITA','PEREZ') FROM DUAL; SELECT GIGH_GENERA_EMAIL('JUANITA','PEREZ') FROM DUAL;



-- PREGUNTA 50 - DESAFÍO
-- 
-- Desafío: explique la condición de carrera entre dos sesiones y proponga un bloqueo o una restricción UNIQUE para garantizar la integridad.
-- 
-- SOLUCION:
-- Usar UNIQUE(EMAIL_CLIENTE) y bloquear la tabla o capturar DUP_VAL_ON_INDEX para resolver la carrera.



