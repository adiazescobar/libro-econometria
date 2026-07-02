# Plantilla canonica para capitulos de Econometria II

Este archivo define el contrato editorial del libro. Cada tema debe separarse en dos paginas: una de teoria y una de practica.

## Pagina de teoria

Usar estas secciones, con estos nombres y en este orden:

1. `## Objetivos de aprendizaje`
2. `## Intuición y motivación`
3. `## Desarrollo teórico`
4. `## Supuestos y propiedades`
5. `## Errores comunes y cuidados`
6. `## Resumen`
7. `## Ejercicios conceptuales`
8. `## Referencias`

Reglas:

- Los objetivos deben ir al inicio y ser observables: "podras estimar", "podras interpretar", "podras derivar".
- La intuicion debe explicar la pregunta econometrica antes de introducir algebra.
- El desarrollo teorico debe usar notacion consistente y registro academico en espanol.
- La notacion para minimos cuadrados debe usar siempre `SRC` para suma de residuos al cuadrado.
- Los residuos estimados deben escribirse como `\hat{\epsilon}_i`.
- Evitar mezclar `SRC`, `SSE`, `SRE`, `\tilde{e}` o `\tilde{\epsilon}` en el mismo capitulo.
- El resumen debe cerrar la teoria antes de pasar a la practica.

## Pagina de practica

Usar estas secciones, con estos nombres y en este orden:

1. `## Objetivos de la práctica`
2. `## Pregunta aplicada`
3. `## Datos`
4. `## Estimación en R`
5. `## Interpretación`
6. `## Estimación en Stata`
7. `## Estimación en Python y Google Colab`
8. `## Comparación R, Stata y Python`
9. `## Errores frecuentes en la práctica`
10. `## Ejercicios computacionales`

Reglas:

- La practica debe tener una pregunta aplicada concreta.
- Los datos deben ser reproducibles sin depender de rutas locales.
- R es la implementacion base.
- Stata debe incluir codigo que el estudiante pueda copiar y correr.
- Python debe incluir instrucciones para Google Colab cuando use paquetes externos.
- Los resultados esperados en Stata y Python deben venir del modelo de R mediante `r inline` o estar marcados como resultados esperados que deben verificarse al correr.
- Toda practica debe incluir interpretacion econometrica, no solo codigo.

## Cajas canonicas

Usar solo estas cajas nuevas para el piloto y para capitulos futuros:

- `.box-intuicion`: para intuiciones verbales, geometricas o economicas.
- `.box-ejemplo`: para mini ejemplos, interpretaciones de resultados o demostraciones aplicadas.
- `.box-cuidado`: para errores frecuentes, advertencias y condiciones de interpretacion.
- `.box-resumen`: para cierres cortos, listas de ideas principales y equivalencias.
- `.box-ejercicios`: para ejercicios conceptuales o computacionales.

Las cajas canonicas tienen titulo automatico definido en `style.css`; no escribir manualmente "Cuidado:", "Ejemplo:" o "Resumen:" dentro de la caja.

## Figuras y tablas

- Toda figura generada por R debe llevar `fig.cap`.
- No escribir numeracion manual como "Grafico 1", "Grafico 2", etc.
- La numeracion debe quedar a cargo de bookdown.
- Las tablas importantes deben llevar `caption`.
- Referenciar figuras y tablas con referencias cruzadas cuando el capitulo lo requiera.

## Idioma y registro

- Todo el texto pedagogico debe estar en espanol.
- Mantener registro academico claro y cercano, sin expresiones excesivamente informales.
- Evitar restos de ingles en derivaciones y explicaciones.
- Los nombres de funciones y paquetes se mantienen en su idioma original.

## Enlaces teoria-practica

- Al final de la teoria incluir un enlace a la practica.
- Al inicio de la practica incluir un enlace de regreso a la teoria.
- El enlace debe funcionar en la salida `gitbook` generada en `docs/`.
