# Práctica de refuerzo de Unidad 2

Guía de programación PL/SQL basada en la ES2 y en el caso de Juanita's Market.
Conserva la estructura de la práctica de refuerzo de la Unidad 1:
identificación, propósito, instrucciones, caso, modelo relacional, preguntas
con cajas de respuesta y lista de comprobación.

## Archivos

- `practica-refuerzo-es2-plsql.md`: fuente editable.
- `practica-refuerzo-es2-plsql.pdf`: versión lista para imprimir.
- `modelo-relacional-juanitas-market.png`: modelo de la ES2.

## Distribución

La guía contiene 80 preguntas distribuidas en los ocho requerimientos de la ES2.
Cada sección tiene diez preguntas:

- Preguntas 1 a 6 de cada sección: afianzamiento progresivo.
- Preguntas 7 a 10 de cada sección: desafíos de integración, concurrencia,
  validación y auditoría.

El prefijo utilizado en la guía es `GIGH_`.

Para regenerar el PDF desde esta carpeta:

```bash
pandoc practica-refuerzo-es2-plsql.md \
  --from markdown \
  --pdf-engine=xelatex \
  --output practica-refuerzo-es2-plsql.pdf
```

## Carpeta de 80 ejercicios

La subcarpeta `80-ejercicios/` conserva la organización de la práctica intensiva
de la Unidad 1:

- `capitulo_1.sql` a `capitulo_8.sql`: enunciados para que trabaje el estudiante.
- `soluciones cap 1.sql` a `soluciones cap 8.sql`: soluciones de referencia.

Cada capítulo contiene diez preguntas y usa el prefijo `GIGH_`.
