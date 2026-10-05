-- =============================================================================
-- PRACTICA DE REFUERZO U2 - SOLUCIONES CAPITULO 7
-- SECCIÓN 7 — PROCEDIMIENTO DE CARGA DE CLIENTES
-- =============================================================================
-- Habilidad central: inserción integral, función de correo, concurrencia y manejo de errores.
-- Soluciones de referencia. Se aceptan alternativas equivalentes.
-- =============================================================================

-- PREGUNTA 61 - AFIANZAMIENTO
-- 
-- Declare GIGH_CARGA_CLIENTE con parámetros para código, nombre, apellidos y correo.
-- SOLUCION:
CREATE OR REPLACE PROCEDURE GIGH_CARGA_CLIENTE(COD_CLIENTE_P NUMBER DEFAULT NULL,NOMBRE_CLIENTE_P VARCHAR2,APELLIDO1_CLIENTE_P VARCHAR2,APELLIDO2_CLIENTE_P VARCHAR2 DEFAULT NULL,EMAIL_CLIENTE_P VARCHAR2 DEFAULT NULL) IS BEGIN INSERT INTO GIGH_CLIENTE VALUES(COD_CLIENTE_P,NOMBRE_CLIENTE_P,APELLIDO1_CLIENTE_P,APELLIDO2_CLIENTE_P,EMAIL_CLIENTE_P); END; /



-- PREGUNTA 62 - AFIANZAMIENTO
-- 
-- Inserte todos los campos de un cliente y permita que el trigger genere el código cuando sea nulo.
-- SOLUCION:
INSERT INTO GIGH_CLIENTE(COD_CLIENTE,NOMBRE_CLIENTE,APELLIDO1_CLIENTE,APELLIDO2_CLIENTE,EMAIL_CLIENTE) VALUES(NULL,'ANA','PEREZ','GOMEZ',NULL);



-- PREGUNTA 63 - AFIANZAMIENTO
-- 
-- Use GIGH_GENERA_EMAIL cuando el correo no sea proporcionado por el llamador.
-- SOLUCION:
IF EMAIL_CLIENTE_P IS NULL THEN V_EMAIL:=GIGH_GENERA_EMAIL(NOMBRE_CLIENTE_P,APELLIDO1_CLIENTE_P); END IF;



-- PREGUNTA 64 - AFIANZAMIENTO
-- 
-- Permita recibir un correo explícito y compruebe la restricción UNIQUE.
-- SOLUCION:
IF EMAIL_CLIENTE_P IS NOT NULL THEN V_EMAIL:=EMAIL_CLIENTE_P; END IF;



-- PREGUNTA 65 - AFIANZAMIENTO
-- 
-- Agregue LOCK TABLE y confirme una inserción correcta con COMMIT.
-- SOLUCION:
LOCK TABLE GIGH_CLIENTE IN ROW EXCLUSIVE MODE; INSERT INTO GIGH_CLIENTE VALUES(...); COMMIT;



-- PREGUNTA 66 - AFIANZAMIENTO
-- 
-- Capture DUP_VAL_ON_INDEX, VALUE_ERROR y errores inesperados con mensajes claros.
-- SOLUCION:
EXCEPTION WHEN DUP_VAL_ON_INDEX THEN ROLLBACK; RAISE_APPLICATION_ERROR(-20021,'CLIENTE DUPLICADO'); WHEN VALUE_ERROR THEN ROLLBACK; RAISE_APPLICATION_ERROR(-20022,'DATO INVALIDO'); WHEN OTHERS THEN ROLLBACK; RAISE;



-- PREGUNTA 67 - DESAFÍO
-- 
-- Desafío: cree una excepción propia para nombre o apellido obligatorio y asígnela con PRAGMA EXCEPTION_INIT.
-- SOLUCION:
DECLARE E_NOMBRE EXCEPTION; PRAGMA EXCEPTION_INIT(E_NOMBRE,-20030); BEGIN IF TRIM(NOMBRE_CLIENTE_P) IS NULL THEN RAISE E_NOMBRE; END IF; END; /



-- PREGUNTA 68 - DESAFÍO
-- 
-- Desafío: demuestre con dos llamadas iguales que la función genera correos diferentes sin intervención manual.
-- SOLUCION:
BEGIN GIGH_CARGA_CLIENTE(NULL,'ANA','PEREZ',NULL,NULL); GIGH_CARGA_CLIENTE(NULL,'ANA','PEREZ',NULL,NULL); END; /



-- PREGUNTA 69 - DESAFÍO
-- 
-- Desafío: diseñe una prueba con SAVEPOINT que permita deshacer una carga sin perder una carga anterior válida.
-- SOLUCION:
SAVEPOINT antes_carga; GIGH_CARGA_CLIENTE(NULL,'ANA','PEREZ',NULL,NULL); ROLLBACK TO antes_carga;



-- PREGUNTA 70 - DESAFÍO
-- 
-- Desafío: documente cómo el bloqueo y la restricción UNIQUE trabajan juntos para resolver cargas concurrentes.
-- 
-- SOLUCION:
-- Bloquear la tabla durante la consulta de duplicados y conservar UNIQUE(EMAIL_CLIENTE) como garantía final.



