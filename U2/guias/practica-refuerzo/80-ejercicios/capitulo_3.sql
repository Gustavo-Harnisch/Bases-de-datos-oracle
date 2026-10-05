-- =============================================================================
-- PRACTICA DE REFUERZO U2 - CAPITULO 3
-- # SECCIÓN 3 — TRIGGERS DE MAYÚSCULAS
-- =============================================================================
-- Habilidad central: `BEFORE`, `INSERT`, `UPDATE`, `UPPER`, `TRIM` y valores nulos.
--
-- Instrucciones:
-- 1. Resuelva cada ejercicio en Oracle PL/SQL.
-- 2. Utilice el prefijo GIGH_ y ejecute cada bloque con /. 
-- 3. Compruebe errores de compilacion con SHOW ERRORS.
-- 4. Escriba su solucion debajo de cada enunciado.
-- =============================================================================

-- PREGUNTA 21 - AFIANZAMIENTO
-- 
-- Cree GIGH_CLIENTE_MAYUSCULAS para convertir nombre y apellidos a mayúsculas antes de insertar.
-- SOLUCION:



-- PREGUNTA 22 - AFIANZAMIENTO
-- 
-- Amplíe el trigger para normalizar también EMAIL_CLIENTE y eliminar espacios laterales.
-- SOLUCION:



-- PREGUNTA 23 - AFIANZAMIENTO
-- 
-- Cree GIGH_PRODUCTO_MAYUSCULAS para normalizar NOMBRE_PRODUCTO en inserciones.
-- SOLUCION:



-- PREGUNTA 24 - AFIANZAMIENTO
-- 
-- Modifique ambos triggers para que funcionen en INSERT OR UPDATE.
-- SOLUCION:



-- PREGUNTA 25 - AFIANZAMIENTO
-- 
-- Inserte nombres en minúsculas con espacios y compruebe el resultado almacenado.
-- SOLUCION:



-- PREGUNTA 26 - AFIANZAMIENTO
-- 
-- Actualice un producto y un cliente con texto mixto y valide nuevamente la normalización.
-- SOLUCION:



-- PREGUNTA 27 - DESAFÍO
-- 
-- Desafío: maneje valores nulos sin convertirlos en una cadena vacía cuando la columna sea opcional.
-- SOLUCION:



-- PREGUNTA 28 - DESAFÍO
-- 
-- Desafío: agregue una validación que rechace nombres vacíos con RAISE_APPLICATION_ERROR y un código entre -20030 y -20039.
-- SOLUCION:



-- PREGUNTA 29 - DESAFÍO
-- 
-- Desafío: normalice correos con LOWER en vez de UPPER y explique qué decisión es más adecuada para la presentación y la unicidad.
-- SOLUCION:



-- PREGUNTA 30 - DESAFÍO
-- 
-- Desafío: compruebe que los triggers no modifican las columnas numéricas de precios, cantidad o stock.
-- 
-- SOLUCION:



