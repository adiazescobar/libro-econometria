---
title: "Álgebra Matricial para Econometría"
output: html_document
---

# Álgebra Matricial para Econometría

Antes de introducir los supuestos fundamentales del modelo de regresión lineal, es importante repasar algunos conceptos clave del álgebra matricial. Este lenguaje permite expresar de forma compacta y elegante muchos de los resultados econométricos, facilitando la comprensión de los modelos lineales y sus propiedades.

## Matrices {-}

Una **matriz** \( A \in \mathbb{R}^{m \times n} \) es un conjunto de elementos \( a_{ij} \), donde \( i = 1, \ldots, m \) (filas) y \( j = 1, \ldots, n \) (columnas), organizados de la siguiente manera:

\[
A =
\begin{pmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{pmatrix}
\]

La **dimensión** o **orden** de la matriz es \( m \times n \), lo que indica que tiene \( m \) filas y \( n \) columnas. Cuando \( m = n \), se dice que la matriz es **cuadrada**; si \( m \neq n \), es una matriz **rectangular**. Las matrices se representan con letras **mayúsculas en negrita**, como \( \mathbf{A} \), y sus elementos con letras minúsculas con subíndices, como \( a_{ij} \).

Los elementos de una matriz pueden ser números reales, \( a_{ij} \in \mathbb{R} \).

**Ejemplo.** La matriz

\[
B =
\begin{pmatrix}
3 & 1 & 7 \\
2 & 4 & 5
\end{pmatrix}
\]

es una matriz **rectangular** de orden \( 2 \times 3 \). Tiene 2 filas y 3 columnas. El elemento en la fila 2 y columna 3 es \( b_{23} = 5 \).

### Traspuesta de una matriz {-}

La **traspuesta** de una matriz \( A = [a_{ij}] \) de dimensión \( m \times n \) es otra matriz \( A' = [a_{ji}] \) de dimensión \( n \times m \), obtenida al intercambiar filas por columnas. Es decir, la primera fila de \( A \) se convierte en la primera columna de \( A' \), la segunda fila en la segunda columna, y así sucesivamente.

\[
A' =
\begin{pmatrix}
a_{11} & a_{21} & \cdots & a_{m1} \\
a_{12} & a_{22} & \cdots & a_{m2} \\
\vdots & \vdots & \ddots & \vdots \\
a_{1n} & a_{2n} & \cdots & a_{mn}
\end{pmatrix}
\]

**Ejemplo.** Sea la matriz

\[
A =
\begin{pmatrix}
6 & 5 & 7 & 4 \\
5 & 4 & 2 & 5 \\
1 & 1 & 11 & 1
\end{pmatrix}
\]

que es de orden \( 3 \times 4 \). Su traspuesta es:

\[
A' =
\begin{pmatrix}
6 & 5 & 1 \\
5 & 4 & 1 \\
7 & 2 & 11 \\
4 & 5 & 1
\end{pmatrix}
\]

Esta nueva matriz es de orden \( 4 \times 3 \).


## Vectores {-}

Un **vector columna** es una matriz de orden \( m \times 1 \), es decir, una matriz que solo tiene una columna:

\[
\mathbf{a} =
\begin{pmatrix}
a_1 \\
a_2 \\
\vdots \\
a_m
\end{pmatrix}
\]

Se denota con una letra **minúscula en negrita** y se puede escribir de forma abreviada como \( \mathbf{a} = [a_i] \). Cada elemento \( a_i \) indica la posición del componente dentro del vector.

Un **vector fila**, en cambio, es una matriz de orden \( 1 \times m \), es decir, solo tiene una fila:

\[
\mathbf{a}' = \begin{pmatrix} a_1 & a_2 & \cdots & a_m \end{pmatrix}
\]

La **traspuesta** de un vector columna es un vector fila, y viceversa. En línea, se escribe \( \mathbf{a} = (a_1, a_2, \ldots, a_m)' \) para indicar que es columna, usando la notación de traspuesta.

*Ejemplo* Sea el vector columna

\[
\mathbf{v} =
\begin{pmatrix}
2 \\
-1 \\
4
\end{pmatrix}
\quad \text{de orden } 3 \times 1,
\quad \text{su traspuesta es } \mathbf{v}' = \begin{pmatrix} 2 & -1 & 4 \end{pmatrix}
\]

### Producto escalar {-}

**Definición.** Sean \( \mathbf{a} = (a_1, \ldots, a_m)' \) y \( \mathbf{b} = (b_1, \ldots, b_m)' \) dos vectores columna del mismo orden \( m \times 1 \), su **producto escalar** es:

\[
\mathbf{a}'\mathbf{b} = \sum_{i=1}^m a_i b_i = a_1b_1 + a_2b_2 + \cdots + a_m b_m
\]

*Ejemplo* Si \( \mathbf{a} = (1, 2, 3)' \) y \( \mathbf{b} = (4, 5, 6)' \), entonces:

\[
\mathbf{a}'\mathbf{b} = 1 \cdot 4 + 2 \cdot 5 + 3 \cdot 6 = 4 + 10 + 18 = 32
\]

### Norma y normalización {-}

**Definición.** La **norma** de un vector \( \mathbf{x} \) se define como:

\[
\|\mathbf{x}\| = \sqrt{\mathbf{x}'\mathbf{x}} = \sqrt{x_1^2 + x_2^2 + \cdots + x_m^2}
\]

El vector **normalizado** es:

\[
\frac{\mathbf{x}}{\|\mathbf{x}\|}
\]

### Ortogonalidad {-}

**Definición.** Dos vectores \( \mathbf{a} \) y \( \mathbf{b} \) son **ortogonales** (se denota \( \mathbf{a} \perp \mathbf{b} \)) si:

\[
\mathbf{a}'\mathbf{b} = 0
\]


\[
\bar{y} = \frac{\mathbf{i}'\mathbf{y}}{\mathbf{i}'\mathbf{i}}
\]

## Operaciones con matrices {-}

### Igualdad de matrices  {-}

Dos matrices \( A = [a_{ij}] \) y \( B = [b_{ij}] \) de igual orden \( m \times n \) son **iguales** si:

\[
a_{ij} = b_{ij}, \quad \text{para todo } i = 1, \ldots, m; \; j = 1, \ldots, n
\]

### Suma y resta de matrices  {-}

La **suma** de dos matrices del mismo orden es la matriz \( C = A + B = [c_{ij}] \) donde:

\[
c_{ij} = a_{ij} + b_{ij}
\]

**Propiedades:**

- Conmutativa: \( A + B = B + A \)
- Asociativa: \( (A + B) + C = A + (B + C) \)
- Elemento neutro: \( A + 0 = A \)
- Opuesto: \( A + (-A) = 0 \)

**Ejemplo:**

\[
A =
\begin{pmatrix}
6 & 5 & 7 & 4 \\
5 & 4 & 2 & 5 \\
1 & 1 & 11 & 1
\end{pmatrix},
\quad
B =
\begin{pmatrix}
7 & 11 & 2 & 9 \\
5 & 8 & 8 & 1 \\
6 & 10 & 8 & 10
\end{pmatrix}
\]

\[
A + B =
\begin{pmatrix}
13 & 16 & 9 & 13 \\
10 & 12 & 10 & 6 \\
7 & 11 & 19 & 11
\end{pmatrix}
\]

**Resta:** se define como \( A - B = A + (-B) \)


### Multiplicación por un escalar  {-}

\[
\lambda A = [\lambda a_{ij}]
\]

**Ejemplo:**

\[
2A =
\begin{pmatrix}
12 & 10 & 14 & 8 \\
10 & 8 & 4 & 10 \\
2 & 2 & 22 & 2
\end{pmatrix}
\]


### Multiplicación de matrices  {-}

Sean \( A \in \mathbb{R}^{m \times n} \) y \( B \in \mathbb{R}^{n \times p} \), el producto \( AB \in \mathbb{R}^{m \times p} \) se define por:

\[
c_{ij} = \sum_{k=1}^{n} a_{ik} b_{kj}
\]

**Propiedades:**

- Asociativa: \( (AB)C = A(BC) \)
- Distributiva: \( A(B + C) = AB + AC \)
- **No conmutativa:** en general \( AB \neq BA \)

**Ejemplo:**

\[
A =
\begin{pmatrix}
6 & 5 & 7 & 4 \\
5 & 4 & 2 & 5 \\
1 & 1 & 11 & 1
\end{pmatrix},
\quad
B' =
\begin{pmatrix}
7 & 5 & 6 \\
11 & 8 & 10 \\
2 & 8 & 8 \\
9 & 1 & 10
\end{pmatrix}
\]

\[
F = A B' =
\begin{pmatrix}
147 & 130 & 182 \\
128 & 78 & 136 \\
49 & 102 & 114
\end{pmatrix}
\]


### Transposición de matrices  {-}

Ya definida en la sección anterior. Propiedades clave:

- \( (A')' = A \)
- \( (A + B)' = A' + B' \)
- \( (AB)' = B'A' \)



### Traza de una matriz  {-}

La **traza** de una matriz cuadrada es la suma de los elementos de su diagonal principal:

\[
\text{tr}(A) = \sum_{i=1}^{n} a_{ii}
\]

**Propiedades:**

- \( \text{tr}(A) = \text{tr}(A') \)
- \( \text{tr}(A + B) = \text{tr}(A) + \text{tr}(B) \)
- \( \text{tr}(AB) = \text{tr}(BA) \)

**Ejemplo:**

\[
\text{tr}(F) = 147 + 78 + 114 = 339
\]


## Determinantes  {-}

Para matrices cuadradas \( A \in \mathbb{R}^{n \times n} \), el **determinante** se denota \( |A| \).

- Para \( 2 \times 2 \):

\[
|A| =
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix}
= ad - bc
\]

- Para \( 3 \times 3 \):

\[
|A| = a_{11}a_{22}a_{33} + a_{12}a_{23}a_{31} + a_{13}a_{21}a_{32}
- a_{13}a_{22}a_{31} - a_{12}a_{21}a_{33} - a_{11}a_{23}a_{32}
\]

**Ejemplo:**

\[
G =
\begin{pmatrix}
1 & 1 & 3 \\
1 & 1 & 0 \\
3 & 1 & 2
\end{pmatrix}
\Rightarrow |G| = -6
\]


## Matriz inversa  {-}

Una matriz cuadrada \( A \) es **invertible** si existe \( A^{-1} \) tal que:

\[
A A^{-1} = A^{-1} A = I
\]

Se calcula como:

\[
A^{-1} = \frac{1}{|A|} \cdot \text{adj}(A)
\]

donde \( \text{adj}(A) \) es la matriz adjunta (traspuesta de los cofactores).

**Propiedades:**

1. \( (A^{-1})^{-1} = A \)
2. \( (AB)^{-1} = B^{-1} A^{-1} \)
3. \( (A')^{-1} = (A^{-1})' \)

**Ejemplo:**

\[
G^{-1} = \frac{1}{-6}
\begin{pmatrix}
2 & 1 & -3 \\
-2 & -7 & 3 \\
-2 & 2 & 0
\end{pmatrix}
\]


## Rango de una matriz  {-}

El **rango** de una matriz es el número máximo de filas (o columnas) linealmente independientes.

**Definiciones:**

- Vectores son linealmente **dependientes** si \( c_1a_1 + \cdots + c_n a_n = 0 \) con \( c_i \neq 0 \)
- Son **independientes** si la única combinación que da cero es con todos los \( c_i = 0 \)

**Propiedades:**

1. \( \text{rang}(AB) \leq \min\{\text{rang}(A), \text{rang}(B)\} \)
2. Si \( A \) es invertible: \( \text{rang}(AB) = \text{rang}(B) \)
3. \( \text{rang}(A) = \text{rang}(A A') = \text{rang}(A' A) \)


## Sistemas de ecuaciones lineales  {-}

Un **sistema de ecuaciones lineales** con \( m \) ecuaciones y \( n \) incógnitas se puede escribir de la forma:

\[
\begin{aligned}
a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n &= b_1 \\
a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n &= b_2 \\
&\vdots \\
a_{m1}x_1 + a_{m2}x_2 + \cdots + a_{mn}x_n &= b_m
\end{aligned}
\]

En forma matricial, este sistema se escribe como:

\[
A \mathbf{x} = \mathbf{b}
\]

donde

\[
A =
\begin{pmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{pmatrix},
\quad
\mathbf{x} =
\begin{pmatrix}
x_1 \\
x_2 \\
\vdots \\
x_n
\end{pmatrix},
\quad
\mathbf{b} =
\begin{pmatrix}
b_1 \\
b_2 \\
\vdots \\
b_m
\end{pmatrix}
\]

### Sistema de Cramer {-}

**Definición.** Un sistema de ecuaciones lineales se denomina **sistema de Cramer** si:

- La matriz \( A \) es cuadrada (\( m = n \))
- La matriz \( A \) es no singular, es decir, \( |A| \neq 0 \)

En este caso, el sistema tiene una **única solución** dada por:

\[
\mathbf{x} = A^{-1} \mathbf{b}
\]



**Ejemplo numérico**

Considere el sistema:

\[
\begin{aligned}
12x_1 + 20x_2 &= 388 \\
4x_1 + 17x_2 &= 212
\end{aligned}
\]

En forma matricial:

\[
\begin{pmatrix}
12 & 20 \\
4 & 17
\end{pmatrix}
\begin{pmatrix}
x_1 \\
x_2
\end{pmatrix}
=
\begin{pmatrix}
388 \\
212
\end{pmatrix}
\]

Paso 1: Calcular la inversa de \( A \)

Primero calculamos el determinante:

\[
|A| = 12 \cdot 17 - 20 \cdot 4 = 204 - 80 = 124
\]

Luego, la matriz de cofactores traspuesta (adjunta):

\[
\text{adj}(A) =
\begin{pmatrix}
17 & -20 \\
-4 & 12
\end{pmatrix}
\]

Entonces,

\[
A^{-1} = \frac{1}{124}
\begin{pmatrix}
17 & -20 \\
-4 & 12
\end{pmatrix}
\]

Paso 2: Multiplicar \( A^{-1} \mathbf{b} \)

\[
\mathbf{x} = A^{-1} \mathbf{b} = \frac{1}{124}
\begin{pmatrix}
17 & -20 \\
-4 & 12
\end{pmatrix}
\begin{pmatrix}
388 \\
212
\end{pmatrix}
\]

Calculamos el producto:

\[
\begin{aligned}
x_1 &= \frac{1}{124}(17 \cdot 388 - 20 \cdot 212) = \frac{1}{124}(6596 - 4240) = \frac{2356}{124} = 19 \\
x_2 &= \frac{1}{124}(-4 \cdot 388 + 12 \cdot 212) = \frac{1}{124}(-1552 + 2544) = \frac{992}{124} = 8
\end{aligned}
\]

Solución final:

\[
\boxed{
x_1 = 19, \quad x_2 = 8
}
\]



Este procedimiento es válido siempre que la matriz \( A \) sea cuadrada y su determinante no sea cero. Si \( |A| = 0 \), el sistema no tiene solución única: puede ser incompatible o tener infinitas soluciones.


## Matrices cuadradas especiales {-}

Las siguientes matrices cuadradas tienen propiedades estructurales claves que facilitan el desarrollo de métodos econométricos.



### 1. Matriz diagonal {-}

Una **matriz diagonal** \( A = [a_{ij}] \in \mathbb{R}^{m \times m} \) tiene ceros fuera de la diagonal principal:

\[
A =
\begin{pmatrix}
a_{11} & 0 & \cdots & 0 \\
0 & a_{22} & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & a_{mm}
\end{pmatrix}
= \text{diag}(a_{11}, a_{22}, \ldots, a_{mm})
\]



### 2. Matriz identidad {-}

La **matriz identidad** \( I_m \) es una matriz diagonal con unos en la diagonal:

\[
I_m =
\begin{pmatrix}
1 & 0 & \cdots & 0 \\
0 & 1 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & 1
\end{pmatrix}
\]

Propiedades: \( AI_m = I_mA = A \), \( I_m^{-1} = I_m \)


### 3. Matriz escalar {-}

Una **matriz escalar** es una matriz diagonal cuyos elementos en la diagonal son iguales a un mismo número \( \lambda \):

\[
A = \lambda I_m
\]


### 4. Matriz triangular inferior {-}

Una **matriz triangular inferior** cumple:

\[
a_{ij} = 0 \quad \text{para todo } i < j
\]

\[
A =
\begin{pmatrix}
a_{11} & 0 & \cdots & 0 \\
a_{21} & a_{22} & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mm}
\end{pmatrix}
\]



### 5. Matriz nula {-}

La **matriz nula** tiene todos sus elementos iguales a cero:

\[
0 =
\begin{pmatrix}
0 & 0 & \cdots & 0 \\
0 & 0 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & 0
\end{pmatrix}
\]


### 6. Matriz simétrica {-}

Una matriz \( A \in \mathbb{R}^{m \times m} \) es **simétrica** si:

\[
A = A' \quad \text{es decir, } a_{ij} = a_{ji}
\]



### 7. Matriz idempotente {-}

Una matriz \( A \) es **idempotente** si:

\[
A^2 = A
\]

Ejemplo clave: la **matriz de proyección** sobre el espacio generado por las columnas de \( X \):

\[
P = X(X'X)^{-1}X'
\]

Cumple:

- \( P = P' \) (simétrica)
- \( P^2 = P \) (idempotente)



### 8. Matriz ortogonal {-}

Una matriz \( Q \) es **ortogonal** si:

\[
Q'Q = QQ' = I
\Rightarrow Q^{-1} = Q'
\]

Sus columnas (y filas) son vectores ortonormales.


### 9. Matrices de proyección: \( P \) y \( M \) {-}

En regresión lineal, dos matrices juegan un rol fundamental:

#### a) Matriz de proyección sobre el espacio columna de \( X \): {-}

\[
P = X(X'X)^{-1}X'
\]

- **Idempotente:** \( P^2 = P \)
- **Simétrica:** \( P' = P \)
- Proyecta cualquier vector \( y \) sobre el espacio generado por las columnas de \( X \): \( \hat{y} = P y \)

#### b) Matriz de aniquilación o proyección ortogonal: {-}

\[
M = I - P
\]

- **Idempotente:** \( M^2 = M \)
- **Simétrica:** \( M' = M \)
- Proyecta sobre el complemento ortogonal del espacio generado por \( X \): \( e = M y \) (residuos)

Estas matrices son centrales para expresar la descomposición:

\[
y = \hat{y} + e = P y + M y
\]

donde \( \hat{y} \) es la parte explicada por \( X \), y \( e \) es la parte no explicada (residuos).


## Derivadas de una función multidimensional {-}

### Derivadas de una forma lineal {-}

Sea la **forma lineal** \( \mathbf{a}'\mathbf{x} = a_1x_1 + a_2x_2 + \cdots + a_nx_n \), una función escalar de \( n \) variables independientes \( x_1, \ldots, x_n \). 

La **derivada parcial** con respecto a una variable \( x_i \) es simplemente:

\[
\frac{\partial \mathbf{a}'\mathbf{x}}{\partial x_i} = a_i
\]

La derivada de \( \mathbf{a}'\mathbf{x} \) con respecto al vector \( \mathbf{x} \) es:

\[
\frac{\partial \mathbf{a}'\mathbf{x}}{\partial \mathbf{x}} =
\begin{pmatrix}
\frac{\partial \mathbf{a}'\mathbf{x}}{\partial x_1} \\
\frac{\partial \mathbf{a}'\mathbf{x}}{\partial x_2} \\
\vdots \\
\frac{\partial \mathbf{a}'\mathbf{x}}{\partial x_n}
\end{pmatrix}
=
\begin{pmatrix}
a_1 \\
a_2 \\
\vdots \\
a_n
\end{pmatrix}
= \mathbf{a}
\]

De forma análoga, la derivada de \( \mathbf{a}'\mathbf{x} \) respecto de \( \mathbf{x}' \) es un vector fila:

\[
\frac{\partial \mathbf{a}'\mathbf{x}}{\partial \mathbf{x}'} = 
\begin{pmatrix}
a_1 & a_2 & \cdots & a_n
\end{pmatrix}
= \mathbf{a}'
\]


### Derivadas de una forma cuadrática {-}

Sea la **forma cuadrática** \( \mathbf{x}'A\mathbf{x} \), donde \( A \) es una matriz simétrica. Esta puede escribirse como:

\[
\mathbf{x}'A\mathbf{x} = \sum_{i=1}^{n} a_{ii}x_i^2 + 2\sum_{i=1}^{n-1}\sum_{j=i+1}^{n} a_{ij}x_ix_j
\]

La derivada de \( \mathbf{x}'A\mathbf{x} \) con respecto al vector \( \mathbf{x} \) es:

\[
\frac{\partial (\mathbf{x}'A\mathbf{x})}{\partial \mathbf{x}} = 2A\mathbf{x}
\]

Esto es, un vector columna cuya i-ésima componente es:

\[
\frac{\partial (\mathbf{x}'A\mathbf{x})}{\partial x_i} = 2(a_{i1}x_1 + a_{i2}x_2 + \cdots + a_{in}x_n)
\]

### Derivadas de segundo orden (matriz Hessiana) {-}

La derivada segunda de \( \mathbf{x}'A\mathbf{x} \) con respecto a \( x_i \) es:

\[
\frac{\partial^2 (\mathbf{x}'A\mathbf{x})}{\partial x_i^2} = 2a_{ii}
\]

La derivada mixta con respecto a \( x_i \) y \( x_j \) es:

\[
\frac{\partial^2 (\mathbf{x}'A\mathbf{x})}{\partial x_i \partial x_j} = 2a_{ij}
\]

La **matriz de segundas derivadas** (Hessiana) es:

\[
\frac{\partial^2 (\mathbf{x}'A\mathbf{x})}{\partial \mathbf{x} \partial \mathbf{x}'} = 2A
\]



### Resumen {-}

- Derivada de forma lineal: \( \frac{\partial (\mathbf{a}'\mathbf{x})}{\partial \mathbf{x}} = \mathbf{a} \)
- Derivada de forma cuadrática: \( \frac{\partial (\mathbf{x}'A\mathbf{x})}{\partial \mathbf{x}} = 2A\mathbf{x} \)
- Matriz Hessiana: \( \frac{\partial^2 (\mathbf{x}'A\mathbf{x})}{\partial \mathbf{x} \partial \mathbf{x}'} = 2A \)


## 📘 Preguntas de repaso {-}

1. Sea \( \mathbf{i} = (1, 1, \ldots, 1)' \) un vector \( m \times 1 \) de unos. Calcule \( \mathbf{i}'\mathbf{i} \).
2. Sean \( \mathbf{i} = (1, \ldots, 1)' \) y \( \mathbf{y} = (y_1, \ldots, y_m)' \). Calcule \( \mathbf{i}'\mathbf{y} \).
3. Demuestre que la **media** de las observaciones \( y_1, \ldots, y_m \) puede expresarse como:

