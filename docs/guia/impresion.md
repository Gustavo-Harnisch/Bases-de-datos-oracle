# Generar y entregar el PDF

La documentación web y el documento imprimible se construyen desde los mismos
archivos Markdown. El orden del PDF es el orden definido en `nav` dentro de
`mkdocs.yml`, por lo que no existe una segunda copia del curso que pueda quedar
desactualizada.

## Flujo de publicación

```text
docs/*.md
   │
   ├── MkDocs ────────────────> site/ (sitio web)
   │
   └── página unificada A4 ───> site/assets/pdf/bases-de-datos-oracle.pdf

U1/presentaciones/*.ppt ───────> site/assets/pdf/presentaciones/*.pdf
U1/codigos/*.sql ──────────────> site/assets/downloads/u1/codigos/*.sql
```

El plugin de impresión reúne las páginas en `/imprimir/`. Esa página sirve para
revisar el documento completo en el navegador o usar **Imprimir > Guardar como
PDF**. El script automatiza el mismo proceso con Chrome en modo sin interfaz.

## Generar el archivo

Desde la raíz del repositorio:

```bash
./scripts/build-docs-pdf.sh
```

Requisitos:

- el entorno Python con `requirements-docs.txt` instalado;
- Google Chrome o Chromium disponible en el sistema;
- LibreOffice Impress para convertir las presentaciones a PDF.

Si el navegador usa otro nombre o ruta:

```bash
CHROME_BIN=/ruta/al/chrome ./scripts/build-docs-pdf.sh
```

El archivo final queda en:

```text
site/assets/pdf/bases-de-datos-oracle.pdf
site/assets/pdf/presentaciones/
site/assets/downloads/u1/codigos/
```

## Preparar contenido para papel

- Agrega cada página a `nav`; ese será también su lugar en el PDF.
- Usa títulos en orden (`#`, `##`, `###`) para conservar un índice legible.
- Evita tablas demasiado anchas; en papel A4 tienen menos espacio que en la web.
- Usa bloques de código breves o divide las líneas largas.
- Usa `lesson-columns` y los patrones documentados en
  [Patrones visuales y doble columna](patrones.md) para organizar pares de
  conceptos, sintaxis y ejemplos.
- Aplica `class="page-break"` a un elemento HTML cuando necesites comenzar una
  página nueva de forma explícita.

La hoja `docs/stylesheets/print.css` define papel A4, márgenes, saltos y reglas
para evitar que tablas, imágenes y bloques de código se corten entre páginas.

## Entrega automática

El workflow de documentación ejecuta el mismo script. En cada ejecución conserva
el PDF como artefacto descargable y, al publicar `main`, lo incluye también en el
sitio. El botón con el icono PDF situado en cada página apunta a esa copia.
