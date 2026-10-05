-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 5
-- # SECCIÓN 5 — FUNCIÓN DE CORREOS
-- =============================================================================
-- Habilidad central: funciones, `SELECT INTO`, duplicados, sufijos y excepciones.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 41 - AFIANZAMIENTO
-- 
-- Declare la estructura de GIGH_GENERA_EMAIL con parámetros de nombre y primer apellido y retorno VARCHAR2.
-- SOLUCION:



-- PREGUNTA 42 - AFIANZAMIENTO
-- 
-- Genere el correo base con formato NOMBRE.APELLIDO@JUANISMARKET.CL.
-- SOLUCION:



-- PREGUNTA 43 - AFIANZAMIENTO
-- 
-- Aplique TRIM y una normalización consistente de mayúsculas o minúsculas.
-- SOLUCION:



-- PREGUNTA 44 - AFIANZAMIENTO
-- 
-- Consulte GIGH_CLIENTE para detectar si el correo base ya existe.
-- SOLUCION:



-- PREGUNTA 45 - AFIANZAMIENTO
-- 
-- Agregue el sufijo 1 antes de la arroba cuando exista el correo base.
-- SOLUCION:



-- PREGUNTA 46 - AFIANZAMIENTO
-- 
-- Extienda la lógica para producir los sufijos 2, 3 y siguientes sin duplicar correos.
-- SOLUCION:



-- PREGUNTA 47 - DESAFÍO
-- 
-- Desafío: controle nombres o apellidos nulos con una excepción propia y RAISE_APPLICATION_ERROR.
-- SOLUCION:



-- PREGUNTA 48 - DESAFÍO
-- 
-- Desafío: elimine tildes y espacios internos de nombres y apellidos antes de construir el correo.
-- SOLUCION:



-- PREGUNTA 49 - DESAFÍO
-- 
-- Desafío: pruebe la función con cuatro clientes repetidos y muestre los cuatro correos generados.
-- SOLUCION:



-- PREGUNTA 50 - DESAFÍO
-- 
-- Desafío: explique la condición de carrera entre dos sesiones y proponga un bloqueo o una restricción UNIQUE para garantizar la integridad.
-- 
-- SOLUCION:



