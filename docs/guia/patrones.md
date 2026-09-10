# Patrones visuales y doble columna

Los patrones permiten que las clases mantengan la misma estructura en el sitio y en el PDF. Se identifican mediante `data-pattern` y reciben automáticamente color, borde y espaciado.

## Dos columnas

````html
<div class="lesson-columns" markdown>

<div class="content-pattern" data-pattern="concepto" data-title="Concepto" markdown>

Explicación breve del tema.

</div>

<div class="content-pattern" data-pattern="sintaxis" data-title="Sintaxis" markdown>

```sql
SELECT columna
FROM tabla;
```

</div>

</div>
````

La clase `lesson-columns` genera dos columnas en pantallas amplias y en el PDF. En teléfonos cambia automáticamente a una columna.

## Patrones disponibles

| Valor de `data-pattern` | Uso recomendado |
|---|---|
| `concepto` | Definición o explicación teórica |
| `sintaxis` | Forma general de una sentencia |
| `ejemplo` | Caso resuelto paso a paso |
| `actividad` | Ejercicio para desarrollar |
| `advertencia` | Error frecuente o precaución |

El atributo `data-title` controla la etiqueta que aparece en la parte superior de la tarjeta.

## Contenido de ancho completo

Dentro de una cuadrícula, agrega `full-width` cuando un bloque deba ocupar ambas columnas:

```html
<div class="content-pattern full-width" data-pattern="ejemplo" data-title="Código completo" markdown>

El contenido ocupa el ancho completo.

</div>
```

Los bloques largos de SQL deben ir a ancho completo para conservar su legibilidad.

## Código sincronizado con el archivo SQL

No copies manualmente un script completo. Insértalo desde su archivo original:

````markdown
```sql
;--8<-- "U1/codigos/leccion-01.sql"
```
````

Si se modifica el `.sql`, la siguiente compilación actualizará automáticamente el sitio y el PDF.
