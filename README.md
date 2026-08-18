# Bases de datos Oracle

[![Documentación](https://github.com/Gustavo-Harnisch/Bases-de-datos-oracle/actions/workflows/docs.yml/badge.svg)](https://github.com/Gustavo-Harnisch/Bases-de-datos-oracle/actions/workflows/docs.yml)

Repositorio de material, ejercicios y proyectos relacionados con bases de datos
Oracle.

## Documentación con MkDocs

La documentación usa Material for MkDocs, contenido modular mediante fragmentos
Markdown y selector de tema automático, claro y oscuro.

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

La guía de uso y la estructura para agregar contenido están dentro de `docs/`.

## Publicación automática

El workflow `.github/workflows/docs.yml` valida los cambios de documentación en
cada pull request. Al integrar cambios en `main`, compila el sitio y lo publica
automáticamente en GitHub Pages. También puede ejecutarse manualmente desde la
pestaña **Actions** de GitHub.
