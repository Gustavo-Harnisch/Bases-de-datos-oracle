# Bases de datos Oracle

Repositorio de material, ejercicios y proyectos relacionados con bases de datos
Oracle.

## Documentación con MkDocs

La documentación usa Material for MkDocs, contenido modular mediante fragmentos
Markdown y selector de tema automático, claro y oscuro.

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
