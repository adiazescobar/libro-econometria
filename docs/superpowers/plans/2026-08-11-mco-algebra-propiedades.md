# MCO: aspectos algebraicos y propiedades finitas — Plan de implementación

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Completar los capítulos teóricos de estimación y propiedades de MCO siguiendo los apuntes de Ana María, con derivaciones completas y una secuencia pedagógica explícita.

**Architecture:** `05-Estimacion-teoria.Rmd` concentrará los resultados algebraicos que se cumplen por construcción en la muestra. `07-Propiedades-teoria.Rmd`, después de FWL, concentrará los resultados probabilísticos en muestras finitas y la demostración de Gauss–Markov. `06-FWL-teoria.Rmd` se conservará como puente conceptual y solo se ajustará si hace falta una transición.

**Tech Stack:** Bookdown, R Markdown, MathJax/LaTeX y R/knitr.

## Global Constraints

- Mantener español, notación matricial y estructura visual existente (`box-intuicion`, `box-cuidado`, `box-resumen`, `box-ejercicios`).
- Seguir `Apuntes de clase AMD.tex` en contenido y orden lógico, corrigiendo erratas algebraicas.
- Distinguir rigurosamente errores poblacionales `\epsilon` y residuos estimados `\hat{\epsilon}`.
- Distinguir propiedades algebraicas, que no requieren supuestos probabilísticos, de propiedades en muestras finitas, que sí los requieren.
- No mezclar normalidad con Gauss–Markov: la normalidad se reserva para inferencia exacta.
- No modificar los capítulos prácticos salvo que un enlace quede roto.

---

### Task 1: Aspectos algebraicos de la solución de MCO

**Files:**
- Modify: `05-Estimacion-teoria.Rmd`

**Interfaces:**
- Consumes: ecuaciones normales y fórmula de MCO ya derivadas en el capítulo.
- Produces: resultados algebraicos usados después por FWL, propiedades finitas e inferencia.

- [ ] Ampliar los objetivos para incluir residuos, valores ajustados, descomposiciones y bondad de ajuste.
- [ ] Añadir una sección autónoma “Aspectos algebraicos de la solución de MCO”.
- [ ] Derivar `X'\hat\epsilon=0`, suma cero de residuos cuando hay constante y ortogonalidad entre `\hat y` y `\hat\epsilon`.
- [ ] Derivar `y'y=\hat y'\hat y+\hat\epsilon'\hat\epsilon` y explicar que es la descomposición no centrada.
- [ ] Derivar la descomposición centrada `STC=SEC+SRC` cuando hay constante y presentar `R^2` centrado y no centrado.
- [ ] Definir SRC, `\hat\sigma^2=SRC/(n-K)` y error estándar de la regresión, aclarando que la insesgadez de `\hat\sigma^2` se demuestra después.
- [ ] Derivar el error muestral `\hat\beta-\beta=(X'X)^{-1}X'\epsilon` como transición hacia propiedades finitas.
- [ ] Actualizar resumen, cuidados, ejercicios y enlace final para que la secuencia lleve a FWL.
- [ ] Revisar dimensiones matriciales, transpuestas y condiciones que requieren intercepto.

### Task 2: Propiedades de MCO en muestras finitas

**Files:**
- Modify: `07-Propiedades-teoria.Rmd`

**Interfaces:**
- Consumes: fórmula del error muestral del capítulo 05 y la intuición de variación parcial del capítulo 06.
- Produces: insesgamiento, varianza condicional, estimación de `\sigma^2` y Gauss–Markov/MELI.

- [ ] Reorganizar la apertura alrededor de la distribución muestral condicional a `X`.
- [ ] Mostrar paso a paso el insesgamiento bajo `E[\epsilon\mid X]=0` y explicar la versión clásica con `X` no estocástica.
- [ ] Derivar paso a paso `Var(\hat\beta\mid X)=\sigma^2(X'X)^{-1}` bajo perturbaciones esféricas.
- [ ] Demostrar que `\hat\sigma^2=\hat\epsilon'\hat\epsilon/(n-K)` es insesgado usando `\hat\epsilon=M_X\epsilon`, trazas y `rango(M_X)=n-K`.
- [ ] Definir con precisión qué significa que un estimador sea lineal, insesgado y eficiente.
- [ ] Enunciar Gauss–Markov y demostrarlo para `\tilde\beta=Cy`, escribiendo `C=A+D`, estableciendo `DX=0` y mostrando `Var(\tilde\beta\mid X)-Var(\hat\beta\mid X)=\sigma^2DD'\succeq0`.
- [ ] Aclarar que la comparación matricial es semidefinida positiva y no una desigualdad escalar estricta.
- [ ] Actualizar tabla de supuestos, intuiciones, cuidados, resumen y ejercicios.
- [ ] Verificar que la normalidad aparezca solo como requisito adicional para inferencia exacta.

### Task 3: Transiciones y verificación del libro

**Files:**
- Inspect and modify only if needed: `06-FWL-teoria.Rmd`
- Verify: `_bookdown.yml`, `docs/estimacion-mco-teoria.html`, `docs/propiedades-mco-teoria.html`

**Interfaces:**
- Consumes: capítulos 05–07 revisados.
- Produces: secuencia navegable y salida Bookdown válida.

- [ ] Confirmar que estimación termina preparando FWL y que FWL termina preparando propiedades finitas.
- [ ] Buscar etiquetas duplicadas, enlaces internos rotos y errores de notación en los capítulos 05–07.
- [ ] Ejecutar `Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"` desde la raíz del libro.
- [ ] Confirmar código de salida cero y existencia de los HTML de estimación, FWL y propiedades.
- [ ] Inspeccionar en el HTML renderizado las fórmulas clave: ortogonalidad, descomposición, error muestral, varianza, estimador de `\sigma^2` y diferencia de varianzas de Gauss–Markov.
- [ ] Revisar `git diff --check` y el diff limitado a los archivos previstos.

## Resultado de verificación — 2026-08-11

- `05-Estimacion-teoria.Rmd` y `07-Propiedades-teoria.Rmd` renderizaron individualmente a HTML con `rmarkdown::render()` y código de salida cero.
- Los HTML resultantes contienen las ecuaciones clave de ortogonalidad y Gauss–Markov.
- `git diff --check` terminó sin errores.
- El render Bookdown integral se intentó dos veces, pero permaneció en el chunk preexistente `simulation scatter`, antes de llegar a los capítulos modificados. Se interrumpió para evitar bloquear la sesión; no produjo un error atribuible a estos cambios.
