# MkDocs y PDF: uso rápido

La regla principal es sencilla:

> Edita una sola vez los archivos `.md` dentro de `docs/`. El sitio web y el PDF se generan desde esos mismos archivos.

## Ver los cambios mientras editas

Desde la raíz del repositorio:

```bash
.venv/bin/mkdocs serve
```

Abre <http://127.0.0.1:8000>. Al guardar un Markdown, el navegador se actualiza automáticamente.

## Generar el sitio y el PDF final

```bash
./scripts/build-docs-pdf.sh
```

Resultados:

```text
site/                                             Sitio completo
site/assets/pdf/bases-de-datos-oracle.pdf         PDF del curso
site/assets/pdf/presentaciones/                   PPT convertidos a PDF
site/assets/downloads/u1/codigos/                 SQL descargables
```

No edites nada dentro de `site/`: esa carpeta se borra y vuelve a crear en cada compilación.

## Primera instalación

Solo si todavía no existe `.venv/`:

```bash
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements-docs.txt
```

Para generar el PDF se necesita Chrome o Chromium. Para convertir los PowerPoint también se utiliza LibreOffice cuando está disponible.

## Patrón de dos columnas

```html
<div class="lesson-columns" markdown>

<div class="content-pattern" data-pattern="concepto" data-title="Concepto" markdown>

Contenido teórico.

</div>

<div class="content-pattern" data-pattern="ejemplo" data-title="Ejemplo" markdown>

Ejemplo aplicado.

</div>

</div>
```

En pantalla pequeña se muestra una columna. En computador y PDF se muestran dos columnas. Consulta `docs/guia/patrones.md` para ver todos los patrones.

## Comprobación rápida antes de publicar

```bash
.venv/bin/mkdocs build --strict
./scripts/build-docs-pdf.sh
```

Si ambos comandos terminan correctamente, el contenido web y el PDF están sincronizados.
