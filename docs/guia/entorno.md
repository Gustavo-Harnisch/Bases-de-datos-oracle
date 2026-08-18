# Ejecutar la documentación

## Preparar el entorno

Desde la raíz del repositorio:

```bash
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements-docs.txt
```

## Abrir el sitio en el navegador

```bash
.venv/bin/mkdocs serve
```

MkDocs mostrará la dirección local, normalmente
[`http://127.0.0.1:8000`](http://127.0.0.1:8000). Mientras el servidor esté
activo, los cambios en los archivos se recargan automáticamente.

## Validar la compilación

```bash
.venv/bin/mkdocs build --strict
```

El resultado se genera en `site/`, una carpeta ignorada por Git.

