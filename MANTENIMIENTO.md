# Mantenimiento del libro

## La trampa del `.gitignore` (agosto 2026)

`.gitignore` incluye `*_files/`, que es el patrón estándar de R para ignorar
artefactos intermedios de knitr. **Pero `docs/_main_files/` no es un artefacto:**
ahí viven las figuras del libro publicado con GitHub Pages.

Sin una excepción, todas las figuras nuevas quedan sin subir y el sitio sale con
las imágenes rotas — aunque localmente se vean perfectas. Fue lo que pasó con la
migración a teoría/práctica de julio de 2026: 23 figuras de los capítulos de
práctica se generaron bien, se veían bien en el computador, y nunca llegaron al
servidor.

Por eso el `.gitignore` ahora tiene:

```
*_files/
!docs/_main_files/
!docs/_main_files/**
```

**No quitar esas dos últimas líneas.**

## Después de renderizar, verificar

El libro se ve bien localmente aunque el sitio esté roto. Antes de dar por
terminado un cambio, revisar que las figuras estén realmente publicadas:

```bash
cd libro_econometria
git status --porcelain | grep _main_files    # ¿hay figuras sin subir?
```

Y sobre el sitio ya desplegado, este comando revisa todas las imágenes de todos
los capítulos y reporta las rotas:

```bash
bash scripts/revisar-figuras.sh
```

## Capítulos huérfanos

Desplegar solo **agrega** archivos a `docs/`; nunca borra los que sobran. Cuando
un capítulo se renombra o se divide (como pasó al separar teoría y práctica), el
HTML viejo se queda en el servidor: desaparece del índice pero sigue accesible
por URL directa, y los estudiantes pueden llegar a él por Google o por un enlace
guardado del semestre anterior.

En agosto de 2026 se eliminaron ocho:

```
regresion-lineal.html
supuestos-de-mco.html
inferencia.html
anatomia-de-la-regresion-multiple.html
aspectos-algebraicos-de-la-solucion-de-mco.html
regresion-por-minimos-cuadrados-ordinarios-mco.html
propiedades-asintoticas-de-mco-y-pruebas-de-hipotesis.html
multicolinealidad-deteccion-consecuencias-y-no-soluciones.html
```

Al renombrar o dividir un capítulo, borrar a mano el HTML viejo de `docs/`.

## Copias en conflicto de Dropbox

El libro vive en Dropbox. Si se edita desde dos equipos aparecen archivos
`(Copia en conflicto de ...)` que se cuelan en el repositorio y se publican.
Para detectarlos:

```bash
find . -iname "*conflicto*"
```
