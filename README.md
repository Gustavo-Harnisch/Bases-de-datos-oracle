# Bases de datos Oracle

[![Documentación](https://github.com/Gustavo-Harnisch/Bases-de-datos-oracle/actions/workflows/docs.yml/badge.svg)](https://github.com/Gustavo-Harnisch/Bases-de-datos-oracle/actions/workflows/docs.yml)

Repositorio de material, ejercicios y proyectos relacionados con bases de datos
Oracle.

## Organización del repositorio

```text
docs/                 Sitio MkDocs y calendario de clases
U1/                   Presentaciones, códigos, evaluaciones y guías de unidad 1
U2/                   Ejercicios y soluciones de unidad 2
datos/oehr/           Scripts del esquema de ejemplo Oracle OEHR
material-academico/   Programa, planificación y material de normalización
scripts/              Automatización del sitio y los PDF
overrides/            Plantillas personalizadas de MkDocs
otros/                Archivos conservados pendientes de clasificar o retirar
```

`Proyecto final/` está fuera del alcance actual y se encuentra incluido en
`.gitignore`.

## Documentación con MkDocs

La documentación usa Material for MkDocs, contenido modular mediante fragmentos
Markdown y selector de tema automático, claro y oscuro. Las mismas páginas se
combinan además en una versión A4 lista para imprimir: no hay que mantener una
copia separada del contenido.

La versión publicada está disponible en
[gustavo-harnisch.github.io/Bases-de-datos-oracle](https://gustavo-harnisch.github.io/Bases-de-datos-oracle/).

```bash
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements-docs.txt
.venv/bin/mkdocs serve
```

Abre `http://127.0.0.1:8000` en el navegador.

Para comprobar que todas las páginas, referencias y fragmentos son válidos:

```bash
.venv/bin/mkdocs build --strict
```

Para compilar el sitio y generar el documento imprimible:

```bash
./scripts/build-docs-pdf.sh
```

El resultado queda en
`site/assets/pdf/bases-de-datos-oracle.pdf`. El script necesita Google Chrome o
Chromium; se puede indicar otro ejecutable mediante `CHROME_BIN`.

La guía de uso y la estructura para agregar contenido están dentro de `docs/`.

## Publicación automática

El workflow `.github/workflows/docs.yml` valida los cambios de documentación en
cada pull request. Al integrar cambios en `main`, compila el sitio, genera el PDF
y publica ambos automáticamente en GitHub Pages. El PDF también queda disponible
como artefacto descargable de la ejecución. El flujo puede iniciarse manualmente
desde la pestaña **Actions** de GitHub.
