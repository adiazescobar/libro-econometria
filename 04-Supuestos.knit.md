# Supuestos del Modelo Clásico de Regresión Lineal

## Proceso Generador de Datos {-}

El modelo de regresión lineal parte de la siguiente estructura:

\[
Y_i = X_i \beta + \epsilon_i
\]

Donde:
- \( Y_i \): variable dependiente (observación i)
- \( X_i \): vector fila con los regresores de la observación i
- \( \beta \): vector de parámetros poblacionales
- \( \epsilon_i \): error poblacional (componentes no observables)
- \( i = 1, 2, ..., n \)

> Esta formulación describe el proceso generador de datos (PGD), base para los supuestos del MCO.



## Tabla Resumen de Supuestos {-}

| Supuesto                         | Notación                                        | Implicación principal                                                   |
|----------------------------------|--------------------------------------------------|-------------------------------------------------------------------------|
| S1. Linealidad en los parámetros | \( y_i = X_i \beta + \epsilon_i \)              | El modelo es lineal en los parámetros                                  |
| S2. Exogeneidad estricta         | \( \mathbb{E}[\epsilon_i \mid X] = 0 \)         | No hay correlación entre regresores y error                            |
| S3. Colinealidad imperfecta      | \( \text{Rango}(X) = K \)                       | No hay multicolinealidad perfecta; modelo identificable                |
| S4. Perturbaciones esféricas     | \( \text{Var}(\epsilon_i \mid X) = \sigma^2 \), \( \text{Cov}(\epsilon_i, \epsilon_j \mid X) = 0 \) | Homocedasticidad y no autocorrelación                                 |
| S5. Regresores no estocásticos   | \( X \) es fija en repetidas muestras           | Simplifica demostraciones teóricas                                     |
| S6. Normalidad                   | \( \epsilon \mid X \sim \mathcal{N}(0, \sigma^2 I) \) | Solo necesaria para inferencia exacta                                  |



## S1. Linealidad en los Parámetros {-}

El valor esperado de \( y \) está relacionado linealmente con los regresores:

\[
\mathbb{E}[Y_i \mid X_i] = X_i \beta
\]

Esto permite distintas formas funcionales (lineales en parámetros):

- Lineal: \( y_i = \beta_1 + \beta_2 x_i + \epsilon_i \)
- Log-log: \( \log(y_i) = \beta_1 + \beta_2 \log(x_i) + \epsilon_i \)
- Log-lineal: \( \log(y_i) = \beta_1 + \beta_2 x_i + \epsilon_i \)
- Lineal-log: \( y_i = \beta_1 + \beta_2 \log(x_i) + \epsilon_i \)
- Cuadrático: \( y_i = \beta_1 + \beta_2 x_i + \beta_3 x_i^2 + \epsilon_i \)
- Interactuado: \( y_i = \beta_1 + \beta_2 x_1 + \beta_3 x_2 + \beta_4(x_1 x_2) + \epsilon_i \)



## S2. Exogeneidad Estricta {-}

\[
\mathbb{E}[\epsilon_i \mid X] = 0
\]

>Esto implica que no existe relación sistemática entre los regresores y el término de error.

Ejemplos:

- \( \mathbb{E}[u \mid X = 1] = 0 \)
- \( \mathbb{E}[u \mid X_2 = \text{Mujer}] = 0 \)

Demostración (Ley de la esperanza iterada):

\[
\mathbb{E}[\epsilon_i] = \mathbb{E}\left[ \mathbb{E}[\epsilon_i \mid X] \right] = \mathbb{E}[0] = 0
\]

Equivalencia: 
Si \( \mathbb{E}[\epsilon_i \mid X] = 0 \), entonces:

\[
\text{Cov}(\epsilon_i, X_j) = 0 \quad \forall j
\]


Pero qué quiere decir?

Una forma de pensar en esta definición es:

> Para *cualquier* valor de  $X$, el valor esperado de los residuos debe ser igual a cero

- _E.g._, $\mathop{E}\left[ u \mid X=1 \right]=0$ *and* $\mathop{E}\left[ u \mid X=100 \right]=0$

- _E.g._, $\mathop{E}\left[ u \mid X_2=\text{Mujer} \right]=0$ *and* $\mathop{E}\left[ u \mid X_2=\text{Hombre} \right]=0$

- Note: $\mathop{E}\left[ u \mid X \right]=0$ es más restrictivo que  $\mathop{E}\left[ u \right]=0$

Graficamente...



