
-- =============================================================
-- U2_C4 — SOLUCIÓN INTEGRAL (CACB_*)
-- Prácticas Oracle: secuencias + triggers + PA + pruebas
-- =============================================================

-- -------------------------------------------------------------
-- Limpieza idempotente (ignora errores si no existen objetos)
-- -------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CACB_DETALLE_NOTAS CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE CACB_USUARIOS CASCADE CONSTRAINTS';     EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_CACB_DETALLE_NOTAS'; EXCEPTION WHEN OTHERS THEN IF SQLCODE NOT IN (-2289,-02289) THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_CACB_USUARIOS';      EXCEPTION WHEN OTHERS THEN IF SQLCODE NOT IN (-2289,-02289) THEN RAISE; END IF; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP PROCEDURE CACB_CARGA_USUARIOS';   EXCEPTION WHEN OTHERS THEN IF SQLCODE != -4043 THEN RAISE; END IF; END;
/
-- (No es necesario dropear triggers explícitamente si se borran las tablas)

-- -------------------------------------------------------------
-- 1) TABLA CACB_DETALLE_NOTAS + PK
-- -------------------------------------------------------------
CREATE TABLE CACB_DETALLE_NOTAS(
  NRO_DETALLE NUMBER       CONSTRAINT PK_CACB_DETALLE_NOTAS PRIMARY KEY,
  NOTA1       NUMBER,
  NOTA2       NUMBER,
  NOTA3       NUMBER,
  PROMEDIO    NUMBER
);

-- Secuencia para PK
CREATE SEQUENCE SEQ_CACB_DETALLE_NOTAS START WITH 1 INCREMENT BY 1 NOCACHE;

-- Trigger PK autogenerada (si viene NULL)
CREATE OR REPLACE TRIGGER TRG_CACB_DETALLE_NOTAS_PK
BEFORE INSERT ON CACB_DETALLE_NOTAS
FOR EACH ROW
WHEN (NEW.NRO_DETALLE IS NULL)
BEGIN
  :NEW.NRO_DETALLE := SEQ_CACB_DETALLE_NOTAS.NEXTVAL;
END;
/
-- Trigger de promedio automático (en INSERT y UPDATE de notas)
CREATE OR REPLACE TRIGGER TRG_CACB_PROMEDIO_AUTO
BEFORE INSERT OR UPDATE OF NOTA1, NOTA2, NOTA3 ON CACB_DETALLE_NOTAS
FOR EACH ROW
BEGIN
  :NEW.PROMEDIO := ROUND( (NVL(:NEW.NOTA1,0) + NVL(:NEW.NOTA2,0) + NVL(:NEW.NOTA3,0)) / 3, 1 );
END;
/
-- Insert de prueba (con promedio explícito — será sobrescrito por el trigger)
INSERT INTO CACB_DETALLE_NOTAS (NRO_DETALLE, NOTA1, NOTA2, NOTA3, PROMEDIO)
VALUES (1, 5, 6, 3, 2.5);

-- Insert de prueba (sin promedio; NRO_DETALLE NULL para usar secuencia)
INSERT INTO CACB_DETALLE_NOTAS (NRO_DETALLE, NOTA1, NOTA2, NOTA3)
VALUES (NULL, 4, 5, 6);

-- -------------------------------------------------------------
-- 2) TABLA CACB_USUARIOS + PK + UQ correo + triggers
-- -------------------------------------------------------------
CREATE TABLE CACB_USUARIOS(
  ID_USUARIO NUMBER CONSTRAINT PK_CACB_USUARIOS PRIMARY KEY,
  NOMBRES    VARCHAR2(100),
  APELLIDO1  VARCHAR2(100),
  APELLIDO2  VARCHAR2(100),
  CORREO     VARCHAR2(200) NOT NULL
);

-- Unicidad de correo
ALTER TABLE CACB_USUARIOS ADD CONSTRAINT UQ_CACB_USUARIOS_CORREO UNIQUE (CORREO);

-- Secuencia para PK
CREATE SEQUENCE SEQ_CACB_USUARIOS START WITH 1 INCREMENT BY 1 NOCACHE;

-- Trigger PK autogenerada
CREATE OR REPLACE TRIGGER TRG_CACB_USUARIOS_PK
BEFORE INSERT ON CACB_USUARIOS
FOR EACH ROW
WHEN (NEW.ID_USUARIO IS NULL)
BEGIN
  :NEW.ID_USUARIO := SEQ_CACB_USUARIOS.NEXTVAL;
END;
/
-- Trigger para forzar MAYÚSCULAS en campos de texto
CREATE OR REPLACE TRIGGER TRG_CACB_USUARIOS_UPPER
BEFORE INSERT OR UPDATE ON CACB_USUARIOS
FOR EACH ROW
BEGIN
  :NEW.NOMBRES   := UPPER(NVL(:NEW.NOMBRES,   ''));
  :NEW.APELLIDO1 := UPPER(NVL(:NEW.APELLIDO1, ''));
  :NEW.APELLIDO2 := UPPER(NVL(:NEW.APELLIDO2, ''));
  :NEW.CORREO    := UPPER(NVL(:NEW.CORREO,    ''));
END;
/
-- -------------------------------------------------------------
-- 3) PA: CACB_CARGA_USUARIOS (sin parámetro de PK)
--    - Genera CORREO único: AAAA.APELLIDO2@TESTSQL.CL
--      * AAAA = primeras 4 letras de APELLIDO1 (en mayúsculas)
--      * Si existe, agrega sufijo numérico antes de @: ...1@ ...2@ etc.
-- -------------------------------------------------------------
CREATE OR REPLACE PROCEDURE CACB_CARGA_USUARIOS(
  P_NOMBRES    IN VARCHAR2,
  P_APELLIDO1  IN VARCHAR2,
  P_APELLIDO2  IN VARCHAR2
) AS
  v_nombres VARCHAR2(100) := TRIM(P_NOMBRES);
  v_ap1     VARCHAR2(100) := TRIM(P_APELLIDO1);
  v_ap2     VARCHAR2(100) := TRIM(P_APELLIDO2);
  v_base    VARCHAR2(200);
  v_correo  VARCHAR2(200);
  v_idx     NUMBER := 0;
  v_cnt     NUMBER;
BEGIN
  -- Base: AAAA.APELLIDO2@TESTSQL.CL (en mayúsculas)
  v_base   := SUBSTR(UPPER(v_ap1), 1, 4) || '.' || UPPER(v_ap2) || '@TESTSQL.CL';
  v_correo := v_base;

  -- Forzar unicidad con sufijo incremental antes de la @
  LOOP
    SELECT COUNT(*) INTO v_cnt FROM CACB_USUARIOS WHERE CORREO = v_correo;
    EXIT WHEN v_cnt = 0;
    v_idx    := v_idx + 1;
    v_correo := REGEXP_REPLACE(v_base, '(@TESTSQL\.CL)$', TO_CHAR(v_idx) || '\1');
  END LOOP;

  INSERT INTO CACB_USUARIOS (NOMBRES, APELLIDO1, APELLIDO2, CORREO)
  VALUES (v_nombres, v_ap1, v_ap2, v_correo);
END;
/
-- -------------------------------------------------------------
-- 4) BLOQUE DE PRUEBAS
-- -------------------------------------------------------------
BEGIN
  -- Duplicado para probar sufijos 1,2,3...
  CACB_CARGA_USUARIOS('Carlos',  'Castro',  'Bustamante');
  CACB_CARGA_USUARIOS('Carlos',  'Castro',  'Bustamante');

  CACB_CARGA_USUARIOS('Felipe',  'Oyarzun', 'Santelices');
  CACB_CARGA_USUARIOS('Macarena','Urbina',  'Figueroa');
  CACB_CARGA_USUARIOS('Carmen',  'Bustos',  'Bustamante');
END;
/
-- Consultas de verificación sugeridas
PROMPT === VERIFICACIÓN: DETALLE_NOTAS ===
SELECT * FROM CACB_DETALLE_NOTAS ORDER BY NRO_DETALLE;

PROMPT === VERIFICACIÓN: USUARIOS (correo único y en mayúsculas) ===
SELECT ID_USUARIO, NOMBRES, APELLIDO1, APELLIDO2, CORREO
FROM CACB_USUARIOS ORDER BY ID_USUARIO;
