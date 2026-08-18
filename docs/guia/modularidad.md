# Contenido modular

Las páginas navegables viven dentro de `docs/`. Los fragmentos reutilizables se
guardan en `docs/_includes/` y no aparecen por separado en la navegación.

## Incluir un fragmento

Por ejemplo, `docs/index.md` compone su contenido con llamadas como esta:

```text
--8<-- "_includes/inicio/presentacion.md"
```

La extensión `pymdownx.snippets` sustituye esa línea por el contenido del archivo
durante la compilación. La opción `check_paths` hace que la compilación falle si
alguna ruta deja de existir, evitando enlaces silenciosamente rotos entre
fragmentos.

## Agregar una página

1. Crea el archivo Markdown dentro de `docs/`.
2. Si la página crece, extrae secciones a `docs/_includes/`.
3. Añade la página a `nav` en `mkdocs.yml`.
4. Ejecuta `.venv/bin/mkdocs build --strict` antes de publicar.

