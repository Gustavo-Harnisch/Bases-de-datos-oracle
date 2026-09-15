# Práctica de refuerzo de Unidad 1

Este material reutiliza el caso de reportería de Recursos Humanos y el modelo relacional OEHR de la ES1 histórica. Conserva una práctica inicial de 36 preguntas y una versión intensiva de 60 preguntas.

## Archivos

- `prueba-practica-u1-36-preguntas.md`: fuente editable de la versión del estudiante.
- `prueba-practica-u1-36-preguntas.pdf`: versión lista para imprimir.
- `pauta-prueba-practica-u1-36-preguntas.sql`: pauta docente separada.
- `prueba-practica-u1-60-preguntas.md`: fuente editable del cuadernillo intensivo, con cajas de respuesta variables.
- `prueba-practica-u1-60-preguntas.pdf`: cuadernillo intensivo listo para imprimir.
- `pauta-prueba-practica-u1-60-preguntas.sql`: pauta docente de las 60 consultas.
- `modelo-relacional-oehr.png`: figura original extraída de `../es1-consultas-sql.docx` (`word/media/image1.png`).

## Distribución

La práctica inicial contiene seis preguntas por tema. La versión intensiva se divide según los seis requerimientos de la prueba real: seis ejercicios de afianzamiento y cuatro desafíos avanzados por sección.

1. `SELECT`, expresiones, alias, concatenación y `DISTINCT`.
2. Restricción, operadores, patrones, nulos y ordenamiento.
3. Funciones de texto, número y fecha.
4. Conversión, formato, fechas y tratamiento de nulos.
5. Funciones de grupo, `GROUP BY` y `HAVING`.
6. `JOIN`, claves foráneas, autorrelaciones y subconsultas.

Para regenerar el PDF desde esta carpeta:

```bash
pandoc prueba-practica-u1-36-preguntas.md \
  --from markdown \
  --pdf-engine=xelatex \
  --output prueba-practica-u1-36-preguntas.pdf

pandoc prueba-practica-u1-60-preguntas.md \
  --from markdown \
  --pdf-engine=xelatex \
  --output prueba-practica-u1-60-preguntas.pdf
```
