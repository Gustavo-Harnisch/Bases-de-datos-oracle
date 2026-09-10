# Informe para IA: portal de clases y formularios PDF

> Actualizado el 1 de septiembre de 2026 después de reorganizar los materiales por unidad.

## 1. Objetivo

Planificar y completar un portal docente de **Bases de datos Oracle** que permita:

1. mostrar las clases en una web ordenada y fácil de navegar;
2. publicar automáticamente el sitio mediante GitHub Pages;
3. generar un PDF general del curso desde el mismo contenido Markdown;
4. crear formularios, guías y pruebas descargables como PDF A4;
5. mantener una única fuente de contenido para web e impresión.

## 2. Restricción de alcance obligatoria

La carpeta `Proyecto final/` **no forma parte de este trabajo**.

La IA debe:

- ignorar por completo su contenido;
- no incluirlo en árboles, diagnósticos, planes ni estimaciones;
- no modificar ni usar sus archivos como fuente docente;
- considerarlo contenido excluido mediante `.gitignore`.

El alcance se limita al portal de clases, el material docente, GitHub Pages y la generación de PDF.

## 3. Estado actual

El repositorio ya cuenta con:

- Material for MkDocs;
- 36 páginas de clases entre agosto y diciembre de 2026;
- navegación por mes, semana y día definida en `mkdocs.yml`;
- buscador en español;
- publicación automática en GitHub Pages;
- generación de un PDF general del curso;
- estilos de impresión A4;
- patrones visuales reutilizables y una cuadrícula de doble columna para web y PDF;
- fragmentos Markdown reutilizables con `pymdownx.snippets`;
- una primera clase real que demuestra teoría, ejemplos, actividad, descargas y código completo sincronizado;
- seis presentaciones `U1/presentaciones/leccion-01.ppt` a `leccion-06.ppt` con la teoría de SQL;
- scripts en `U1/codigos/` con explicaciones, ejemplos y tareas;
- conversión automática de las seis presentaciones a PDF y copia automática de los SQL al compilar;
- tres evaluaciones Word clasificadas dentro de `U1/evaluaciones/`.

Al momento de esta actualización, `U1/codigos/leccion-03-parte-02.sql` tiene un ajuste local pendiente que elimina espacios finales. No cambia la lógica SQL ni agrega contenido nuevo.

La mayoría de las clases todavía son plantillas con fecha, navegación, objetivos, contenidos, materiales y notas. Falta incorporar el contenido pedagógico real.

No existe todavía una sección pública en MkDocs para evaluaciones ni un proceso para generar un PDF individual por formulario o prueba. Los Word se conservarán como fuentes originales y deberán transformarse en Markdown revisado antes de publicarse.

## 4. Árbol actual relevante

```text
Bases-de-datos-oracle/
├── README.md
├── STUPID.md                       # Guía rápida: editar, ver y generar PDF
├── .gitignore
├── mkdocs.yml
├── requirements-docs.txt
├── .github/
│   └── workflows/
│       └── docs.yml                  # Compila, genera PDF y publica Pages
├── docs/
│   ├── index.md                      # Portada
│   ├── _includes/
│   │   └── inicio/
│   │       ├── presentacion.md
│   │       └── accesos.md
│   ├── clases/
│   │   ├── index.md                  # Calendario de 36 clases
│   │   └── 2026/
│   │       ├── agosto/               # 3 semanas, 6 clases
│   │       ├── septiembre/           # 5 semanas, 10 clases
│   │       ├── octubre/              # 4 semanas, 8 clases
│   │       ├── noviembre/            # 4 semanas, 8 clases
│   │       └── diciembre/            # 2 semanas, 4 clases
│   ├── guia/
│   │   ├── entorno.md
│   │   ├── modularidad.md
│   │   ├── impresion.md
│   │   └── patrones.md             # Tarjetas semánticas y doble columna
│   └── stylesheets/
│       └── print.css                 # Papel A4
├── overrides/
│   ├── main.html                     # Botón para descargar el PDF
│   └── print_site_banner.tpl
├── scripts/
│   └── build-docs-pdf.sh             # Sitio + PDF general + PPT en PDF + SQL
├── U1/
│   ├── README.md
│   ├── presentaciones/
│   │   ├── leccion-01.ppt
│   │   ├── leccion-02.ppt
│   │   ├── leccion-03.ppt
│   │   ├── leccion-04.ppt
│   │   ├── leccion-05.ppt
│   │   └── leccion-06.ppt
│   ├── codigos/
│   │   ├── leccion-01.sql
│   │   ├── leccion-02.sql
│   │   ├── leccion-03.sql
│   │   ├── leccion-03-parte-02.sql
│   │   ├── leccion-04.sql
│   │   ├── leccion-04-parte-02.sql
│   │   ├── leccion-05.sql
│   │   └── leccion-06.sql
│   ├── evaluaciones/
│   │   ├── README.md
│   │   ├── es1/
│   │   │   ├── es1-consultas-sql.docx
│   │   │   └── pauta-es1-consultas-sql.sql
│   │   └── es2/
│   │       ├── es2-programacion-plsql.docx
│   │       └── recuperativas/
│   │           └── es2-programacion-plsql-recuperativa.docx
│   └── guias/
│       └── instalar-docker-lab.docx
├── U2/
│   ├── README.md
│   ├── ejercicios/
│   │   ├── tarea-01.sql
│   │   └── tarea-02.sql
│   └── soluciones/
│       ├── u2-c4-solucion-cacb.sql
│       ├── u2-c4-solucion-gigh.sql
│       ├── u2-c4-solucion-gigh-v2.sql
│       └── u2-c4-solucion-gigh-variables-claras.sql
├── datos/
│   ├── README.md
│   └── oehr/                          # 15 scripts del esquema Oracle OEHR
├── material-academico/
│   ├── README.md
│   ├── programa/
│   ├── planificacion/
│   └── normalizacion/
└── otros/
    ├── README.md
    ├── bark-registro-usuarios.txt
    ├── instrucciones-mkdocs-antiguas.txt
    └── taller-sistemas-operativos.c
```

Contenido que debe quedar fuera del contexto:

```text
.git/
.venv/
site/
__pycache__/
Proyecto final/
```

## 5. Estructura objetivo propuesta

Los elementos señalados como propuestos todavía no existen necesariamente.

```text
docs/
├── index.md
├── programa/                            # Propuesto
│   ├── descripcion.md
│   ├── unidades.md
│   └── evaluaciones.md
├── clases/
│   ├── index.md
│   └── 2026/<mes>/semana-<nn>/<dia>.md
├── evaluaciones/                        # Propuesto
│   ├── index.md
│   ├── formularios/
│   │   ├── plantilla-prueba.md
│   │   ├── diagnostico.md
│   │   └── retroalimentacion.md
│   ├── pruebas/
│   │   ├── prueba-01.md
│   │   ├── prueba-02.md
│   │   └── examen.md
│   └── pautas/
│       ├── pauta-prueba-01.md
│       ├── pauta-prueba-02.md
│       └── pauta-examen.md
├── _includes/
│   ├── inicio/
│   ├── clases/                           # Propuesto
│   └── formularios/                      # Propuesto
├── assets/
│   ├── images/
│   └── downloads/
├── guia/
└── stylesheets/
    ├── print.css
    └── forms.css                         # Propuesto

scripts/
├── build-docs-pdf.sh
└── build-evaluations-pdf.sh              # Propuesto

U1/evaluaciones/                           # Fuentes Word no públicas
├── es1/
└── es2/

site/                                     # Generado e ignorado
└── assets/pdf/
    ├── bases-de-datos-oracle.pdf
    ├── presentaciones/
    │   ├── leccion-01.pdf
    │   └── leccion-06.pdf
    └── evaluaciones/
        ├── diagnostico.pdf
        ├── prueba-01.pdf
        ├── prueba-02.pdf
        └── examen.pdf
```

## 6. Uso conjunto de PPT, SQL y MkDocs

Las presentaciones y los scripts cumplen funciones diferentes y complementarias:

```text
PPT de la lección ──┬──> conversión a PDF de diapositivas para descarga
                    └──> extracción y adaptación de objetivos y teoría
Script SQL asociado ─────> enunciados, explicación aplicada, ejemplos y tareas
                              │
                              ↓
Página Markdown de la clase ─> contenido web accesible + bloques SQL
                              │
                              ├── PDF general del curso
                              └── descarga del PDF de diapositivas y del SQL
```

La IA no debe limitarse a incrustar el PPT. Debe convertir su contenido en una explicación web legible, manteniendo los objetivos y conceptos relevantes. Los ejemplos deben tomarse del `.sql`, donde los comentarios presentan primero el requerimiento y luego la consulta que lo resuelve.

Cada `leccion-NN.ppt` se convierte también a un PDF individual, por ejemplo `site/assets/pdf/presentaciones/leccion-NN.pdf`, mediante LibreOffice en modo headless. `scripts/build-docs-pdf.sh` ya realiza esa conversión localmente y el workflow instala LibreOffice para repetirla en GitHub Actions. El PDF de diapositivas es un material complementario; no reemplaza la página accesible en MkDocs.

La clase 1 ya sirve como implementación de referencia: utiliza `lesson-columns`, tarjetas identificadas por `data-pattern`, inserta el script original mediante `pymdownx.snippets` y ofrece enlaces al PDF de la presentación y al SQL descargable. Los patrones están documentados en `docs/guia/patrones.md` y el uso rápido en `STUPID.md`.

Antes de publicar texto o imágenes provenientes de las presentaciones Oracle, se deben revisar los permisos de reutilización. Cuando corresponda, se debe resumir y atribuir el material en vez de copiar diapositivas completas.

### Correspondencia comprobada de la unidad 1

| Lección | Presentación | Código aplicado | Contenido principal |
|---|---|---|---|
| 1 | `U1/presentaciones/leccion-01.ppt` | `U1/codigos/leccion-01.sql` | `SELECT`, `FROM`, expresiones, alias, concatenación y `DISTINCT` |
| 2 | `U1/presentaciones/leccion-02.ppt` | `U1/codigos/leccion-02.sql` | `WHERE`, operadores, nulos, `ORDER BY` y restricciones |
| 3 | `U1/presentaciones/leccion-03.ppt` | `U1/codigos/leccion-03.sql` y `leccion-03-parte-02.sql` | Funciones de texto, número y fecha |
| 4 | `U1/presentaciones/leccion-04.ppt` | `U1/codigos/leccion-04.sql` y `leccion-04-parte-02.sql` | Conversiones, formatos, `NVL`, `NVL2` y condicionales |
| 5 | `U1/presentaciones/leccion-05.ppt` | `U1/codigos/leccion-05.sql` | Agregación, `GROUP BY` y `HAVING` |
| 6 | `U1/presentaciones/leccion-06.ppt` | `U1/codigos/leccion-06.sql` | `JOIN`, alias, autounión y uniones externas |

La planificación debe confirmar si estas seis lecciones corresponden directamente a las primeras seis fechas del calendario 2026 antes de modificar esas páginas.

## 7. Presentación de cada clase

Cada clase debe mantener una estructura homogénea:

```text
Título, fecha, semana y unidad
Clase anterior · calendario · clase siguiente
Objetivos de aprendizaje
Contenidos
Actividad inicial
Resumen inicial proveniente del PPT
Conceptos y sintaxis
Ejemplos SQL explicados paso a paso
Ejercicio práctico
Materiales y descargas
Tarea o trabajo autónomo
Código completo de la clase
Notas para el docente
```

Cada ejemplo debe conservar el patrón que ya aparece en los `.sql`: primero el problema o requerimiento y después el código que lo resuelve. En MkDocs se normalizará así:

````markdown
### Ejemplo: limitar empleados por departamento

**Necesidad o enunciado.** Explicar qué información se busca.

**Concepto.** Explicar brevemente la cláusula, función u operador utilizado.

```sql
SELECT employee_id, last_name
FROM oehr_employees
WHERE department_id = 90;
```

**Lectura del código.** Describir cada cláusula y el resultado esperado.
````

Al final de la página debe existir una sección **Código completo de la clase** con:

- el script completo en un bloque SQL o componente desplegable;
- un enlace para descargar el archivo `.sql` original;
- separación clara entre demostraciones, ejercicios y soluciones;
- una advertencia si el código histórico contiene errores todavía no corregidos.

Requisitos:

- acceso desde el calendario general;
- navegación anterior y siguiente;
- agrupación visible por mes y semana;
- buscador en español;
- enlaces a scripts SQL, presentaciones y ejercicios;
- estado visible cuando una clase no esté terminada;
- correcta visualización en computador y teléfono;
- bloques SQL legibles y copiables;
- fragmentos reutilizables para evitar duplicación;
- títulos compatibles con el índice del PDF;
- contenido accesible aunque el estudiante no pueda abrir el PPT;
- código completo al final, después de la explicación progresiva.

## 8. PDF general

Debe conservarse el flujo existente:

```text
docs/*.md
   ├── MkDocs ────────────────> site/
   └── print-site + Chrome ───> site/assets/pdf/bases-de-datos-oracle.pdf
```

El orden del PDF debe seguir `nav` en `mkdocs.yml`. El comando actual es:

```bash
./scripts/build-docs-pdf.sh
```

## 9. Formularios y pruebas PDF

Además del PDF general, se necesita **un PDF independiente por formulario o evaluación**. El estudiante no debe descargar el curso completo para obtener una prueba.

Tipos previstos:

- diagnóstico;
- guía de ejercicios;
- control;
- prueba escrita;
- examen;
- retroalimentación;
- pauta o rúbrica docente.

### Evaluaciones Word revisadas

| Fuente ordenada | Clasificación | Estado antes de publicar |
|---|---|---|
| `U1/evaluaciones/es1/es1-consultas-sql.docx` | ES1, consultas SQL, 30 %, 35 puntos, 6 requerimientos | Actualizar datos de 2026, revisar instrucciones y retirar la contraseña antigua. |
| `U1/evaluaciones/es2/es2-programacion-plsql.docx` | ES2 regular, PL/SQL, 30 %, 50 puntos | Corregir redacción, actualizar datos y convertir el modelo y la rúbrica. |
| `U1/evaluaciones/es2/recuperativas/es2-programacion-plsql-recuperativa.docx` | ES2 recuperativa, 50 puntos | Tratar como versión alternativa, sin nombre personal en la versión publicada. |

`U1/evaluaciones/es1/pauta-es1-consultas-sql.sql` coincide parcialmente con los requerimientos de ES1, pero no debe publicarse todavía como pauta oficial: contiene consultas incompletas, marcadores vacíos y errores que deben verificarse en Oracle.

La conversión no debe publicar automáticamente el Word. El proceso esperado es:

```text
Word original → extracción → revisión académica y de seguridad
→ Markdown normalizado → vista MkDocs → PDF individual validado
```

Cada prueba debe admitir:

- institución, asignatura, título y versión;
- nombre, RUT o identificador, sección y fecha;
- puntaje total, puntaje obtenido y nota;
- tiempo e instrucciones;
- selección múltiple y verdadero/falso;
- desarrollo y ejercicios SQL;
- tablas, casillas y líneas de respuesta;
- rúbricas, puntajes y saltos de página.

Requisitos de los PDF:

- formato A4 y márgenes aptos para impresión;
- sin navegación ni elementos propios del sitio;
- código SQL sin cortes horizontales;
- preguntas que no se dividan entre páginas cuando sea posible;
- espacios suficientes para responder;
- archivo estable y descriptivo;
- versión de estudiante sin soluciones;
- pauta docente separada;
- generación reproducible localmente y en GitHub Actions.

Flujo objetivo:

```text
docs/evaluaciones/pruebas/prueba-01.md
                  ├── página web
                  └── Chrome headless
                         ↓
site/assets/pdf/evaluaciones/prueba-01.pdf
```

La IA debe decidir si amplía `build-docs-pdf.sh` o crea `build-evaluations-pdf.sh`. La solución debe permitir agregar evaluaciones sin reescribir el script y sin duplicar contenido.

## 10. GitHub Pages y automatización

El workflow actual:

1. configura Python;
2. instala dependencias y LibreOffice Impress;
3. compila MkDocs en modo estricto;
4. genera el PDF general;
5. convierte las seis presentaciones de U1 a PDF;
6. copia los SQL de U1 como descargas del sitio;
7. guarda todo `site/assets/pdf/` como artefacto;
8. publica `site/` en GitHub Pages al integrar en `main`.

El plan debe extenderlo para:

- generar todos los PDF de evaluaciones;
- comprobar que cada PDF exista y sea válido;
- guardarlos como artefactos;
- publicarlos dentro del sitio;
- fallar claramente cuando un documento no compile;
- evitar publicar pautas docentes accidentalmente.

## 11. `.gitignore` requerido

```gitignore
.venv/
site/
__pycache__/
Proyecto final/
```

Si `Proyecto final/` ya está registrado en el índice, agregarlo al `.gitignore` no lo retira del índice ni del historial. La IA debe informarlo y proponer el procedimiento apropiado, pero no ejecutarlo sin autorización explícita.

## 12. Brechas principales

1. Completar objetivos, contenidos, actividades y materiales de las 36 clases.
2. Transformar cada pareja PPT + SQL en una clase Markdown con teoría, ejemplos explicados y código completo al final.
3. Mapear `U1/`, `U2/`, `datos/oehr/` y `material-academico/` con las clases.
4. Definir unidades y resultados de aprendizaje.
5. Crear plantillas reutilizables de clases y evaluaciones.
6. Convertir y revisar las tres evaluaciones Word sin publicar datos antiguos o credenciales.
7. Crear la sección web de evaluaciones.
8. Generar PDF independientes para pruebas y formularios.
9. Separar versiones de estudiante y docente.
10. Validar SQL, enlaces, navegación y archivos PDF automáticamente.
11. Extender la revisión responsive e impresión A4 al resto de las clases.

## 13. Fases sugeridas

### Fase 1: diseño académico

- Definir unidades, resultados y evaluaciones.
- Mapear las 36 clases con el programa.
- Inventariar los materiales existentes.
- Confirmar la asociación de PPT y SQL con las fechas del calendario.

### Fase 2: estructura y plantillas

- Definir la plantilla de clase.
- Definir plantillas de prueba, formulario y pauta.
- Crear navegación de programa y evaluaciones.

### Fase 3: contenido

- Completar las clases por unidad y semana.
- Convertir la teoría de los PPT en contenido web accesible.
- Incorporar los ejemplos comentados de los SQL.
- Añadir el código completo descargable al final de cada clase.
- Validar calendario y navegación.

### Fase 4: PDF de evaluaciones

- Implementar estilos A4 de formularios.
- Convertir los Word revisados a Markdown normalizado.
- Generar un PDF por evaluación.
- Verificar saltos, espacios y bloques SQL.
- Automatizar el proceso en GitHub Actions.

### Fase 5: calidad y publicación

- Ejecutar `mkdocs build --strict`.
- Validar el PDF general y los individuales.
- Revisar web, móvil e impresión.
- Publicar y comprobar todas las descargas.

## 14. Criterios de aceptación

- Las 36 clases aparecen y se pueden recorrer correctamente.
- Cada clase contiene material o muestra su estado pendiente.
- Las primeras lecciones integran la teoría del PPT y los ejemplos del SQL asociado.
- Cada PPT tiene un PDF de diapositivas descargable desde su clase.
- Cada ejemplo se presenta como enunciado, concepto, código y explicación.
- El código completo de la clase aparece al final y se puede descargar.
- La compilación estricta termina sin errores.
- GitHub Pages publica el portal.
- El PDF general conserva el orden esperado.
- Los patrones de concepto, sintaxis, ejemplo, actividad y advertencia conservan sus colores y la doble columna en web y PDF.
- Cada evaluación genera un PDF independiente válido.
- Los PDF se descargan desde el sitio.
- Las pruebas impresas tienen encabezado, puntaje y espacio para respuestas.
- Las evaluaciones Word originales permanecen separadas de las versiones públicas.
- No se publica ninguna contraseña, dato de acceso o nombre personal innecesario.
- Las pautas no se publican junto a la versión del estudiante por error.
- `.venv/`, `site/` y `Proyecto final/` quedan excluidos.
- El README explica cómo añadir clases y evaluaciones.

## 15. Prompt para entregar a otra IA

```text
Actúa como arquitecto de documentación educativa y responsable técnico de un
portal docente construido con Material for MkDocs.

El alcance es exclusivamente:
- organizar y mostrar las 36 clases de Bases de datos Oracle;
- reutilizar el material docente existente;
- transformar las presentaciones PPT en contenido MkDocs accesible;
- convertir cada PPT en un PDF de diapositivas descargable;
- usar los scripts SQL como ejemplos explicados y código descargable al final;
- publicar el sitio en GitHub Pages;
- generar un PDF general del curso;
- generar PDF A4 independientes para formularios, pruebas y pautas.

RESTRICCIÓN OBLIGATORIA: ignora por completo la carpeta Proyecto final/. No la
analices, no la incluyas en el plan, no modifiques sus archivos y considérala
una ruta destinada a .gitignore.

Inspecciona README.md, STUPID.md, mkdocs.yml, docs/, U1/presentaciones/,
U1/codigos/, U1/evaluaciones/README.md, U1/evaluaciones/,
scripts/build-docs-pdf.sh,
docs/stylesheets/print.css, requirements-docs.txt y .github/workflows/docs.yml.

Para cada clase usa el PPT como fuente de objetivos y teoría. Usa el SQL asociado
para presentar cada ejemplo en el orden: necesidad, concepto, código y explicación.
Convierte además cada PPT en un PDF individual enlazado desde la clase. Al final
agrega el código completo de la clase y su descarga. No publiques una
prueba Word directamente: conviértela a Markdown, actualiza sus datos, elimina
credenciales y genera una versión de estudiante separada de la pauta docente.

Entrega:
1. diagnóstico actual;
2. arquitectura editorial;
3. árbol objetivo;
4. mapa de las 36 clases por unidad y resultado de aprendizaje;
5. plantilla Markdown de clase;
6. plantilla imprimible de prueba;
7. estrategia para un PDF individual por evaluación;
8. cambios en MkDocs y GitHub Actions;
9. backlog por fases y dependencias;
10. criterios de aceptación y estrategia de pruebas.

Separa archivos existentes de archivos propuestos. No inventes contenido
académico que no pueda deducirse del programa: regístralo como decisión
pendiente. Evita duplicar contenido entre web y PDF y protege las pautas
docentes para que no se publiquen accidentalmente.
```

## 16. Archivos para la IA planificadora

Adjuntar:

- `INFORME_Y_TREE_PARA_IA.md`;
- `README.md`;
- `STUPID.md`;
- `mkdocs.yml`;
- `requirements-docs.txt`;
- `.gitignore`;
- `.github/workflows/docs.yml`;
- `docs/`;
- `scripts/build-docs-pdf.sh`;
- `overrides/`;
- `U1/README.md`;
- `U1/evaluaciones/README.md`;
- `U1/evaluaciones/`;
- `U1/presentaciones/`;
- `U1/codigos/`.

Para mapear contenido se pueden adjuntar `U1/`, `U2/`, `datos/oehr/` y `material-academico/`.

No adjuntar `.git/`, `.venv/`, `site/` ni `Proyecto final/`.
