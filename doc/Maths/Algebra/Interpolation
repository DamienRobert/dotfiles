vim: ft=markdownlight fdm=expr

Méthodes d'Interpolation
========================

L le pol d'interpolation: L(x_i)=y_i de degré n-1
l le pol "noyau": l(x_i)=0 (au bon ordre) de degré n

## Lagrange

https://en.wikipedia.org/wiki/Lagrange_polynomial
l_i(x)=\prod(x-x_j)/\prod(x_i-x_j) -> l_i(x_j)=\delta_ij
L(x)= \sum y_i l_i(x) vaut y_i en x_i.

Si l(x)=\prod(x-x_i) i=0,...n; on a l'(x_i)=\prod_{i \ne j} (x_i-x_j)
l_i(x)=l(x)/(l'(x_i)(x-x_i)) d'où la forme Barycentrique de Lagrange:
L(x)=l(x) \sum y_i / (l'(x_i) (x-x_i)) 
    = [\sum y_i / (l'(x_i) (x-x_i))] / [\sum 1 / (l'(x_i) (x-x_i))]

### Restes
f(x)-L(x)=f[x_0,...,x_n,x]l(x)=l(x)f^{n+1}(\xi)/(n+1)!
  et le reste est minimisé en des points d'interpolation qui minimisent
  max l(x); sur [0,1] c'est atteint pour le pol de Chebyshev T_n/2^{n-1}
  qui donne une norme 1/2^{n-1} [https://en.wikipedia.org/wiki/Chebyshev_nodes]

Coût: calcul de l_i(x)=> 2n produits + 1 division => O(n^2)
Sur la forme barycentrique: si les l'(x_i) ont été calculés (O(n^2)), le
calcul se fait ensuite en O(n); rajouter un point d'interpolation se fait
en O(n) pour mettre à jour les l'(x_i)
- Via du CRT rapide en binary tree on peut faire du O(n)

## Newton

https://en.wikipedia.org/wiki/Newton_polynomial
=> Retrouve le polynôme d'interpolation P(x_i)=y_i via les différences divisées:
   L(x)=[y0]+[y0,y1](x−x0)+⋯+[y0,…,yk](x−x0)(x−x1)⋯(x−x_{k−1}).
Intérêt: 
   - rajouter un point ne change pas tous les calculs
   - la matrice associée n'est plus une Vandermonde mais une matrice
     triangulaire inférieure: ∑ a_i n_i(x_j)=y_j où n_i=(x-x0)...(x-x_{i-1})
   - on peut évaluer L(x) via un schéma à la Hörner => n mul plutôt que 2n
   - Coût: rajouter un point demande n différences divisées de plus dans le
     triangle de Newton => O(n^2) mais avec une meilleure constante que Lagrange
   => B-spline: https://en.wikipedia.org/wiki/B-spline

## Hermite

https://en.wikipedia.org/wiki/Hermite_interpolation
=> Unlike Newton interpolation, Hermite interpolation matches an unknown function both in observed value, and the observed value of its first m derivatives.
ie on autorise les x_i à être répété (un nombre de fois égal à m+1)

Note: les différences divisées sont invariantes par permutations, et par
définition [f(x),f(x),f(x)]=f'''(x)/3!.

Exemples:
- https://en.wikipedia.org/wiki/Bernstein_polynomial
[=b_v,n: pol de degré n ayant multiplicité v en 0 et n-v en 1
et normalisé pour être d'intégrale 1/(n+1): b_v,n=\binom(n v) x^v (1-x)^{n-v}
1=\sum_v b_v,n; si f continue, \sum f(v/n)b_v,n -> f uniformément sur [0,1]]
=> Courbe de Bézier https://en.wikipedia.org/wiki/B%C3%A9zier_curve

- (x-a)^m/m! s'annule en a à l'ordre m (et a sa dérivée m-ième normalisée
à 1 en a) => utilisé dans la formule de Taylor.

### Restes
La formule d'erreur des restes est toujours valable:
  f(x)-L(x)=f[x_0,...,x_n,x]l(x)=l(x)f^{n+1}(\xi)/(n+1)!
  où l(x)=\prod(x-xi)^ni

[Rem: la méthode de calcul de décomposition des fonctions rationelles
montre que
f=\sum f_i^(k)(x_i)/k! (x-x_i)^k \prod(x-x_i)^n_i + O(\prod (x-x_i)^n_i)
  avec f_i=f (x-x_i)^n_i/l(x)
donne la forme de la décomposition de Hermite; la méthode de Newton des
différences divisées permettant de calculer cette décomposition rapidement.
En particulier le polynôme qui vaut 0 partout sauf f^(k)(x_i)=1 est de la
forme \sum_{n_i>m\ge k} a_m (x-x_i)^m \prod(x-x_j)^n_j. Et bien sûr si
x_j=x_i pour tout j on retrouve la décomp de Taylor: (x-x_i)^k/k!]


Différences divisées
=====================

https://en.wikipedia.org/wiki/Divided_differences
[cf aussi https://en.wikipedia.org/wiki/Finite_difference]

Définition par récurrence:
 [y_0,...,y_n]=([y_0,...,\hat{y_i},...,y_n]-[y_0,...,\hat{y_j},...,y_n])/(x_j-x_i) [on prend en général i=0 et j=n mais ça ne dépend pas de i et j]
 => [y_0,...,y_n]=[y_\sigma(0),...,y_\sigma(n)] pour une permutation sigma

- f[x,y]=(f(x)-f(y))/(x-y) et on généralise à n variables en itérant.
- f[x0,…,xn]=∑ lim x→xj f(xj)(x−xj)/∏(x−xk) = ∑ f(xj)/∏(xj−xk)

  Si q(ξ)=(ξ−x0)⋯(ξ−xn), f[x0,…,xn]=∑f(xj)/q′(xj).
En particulier if f is a polynomial function with arbitrary degree and it is decomposed by f(x)=p(x)+q(x)⋅d(x):
    p(ξ)/q(ξ)=(t→f(t)/(ξ−t))[x1,…,xn]
 si q(ξ)=(ξ−x1)⋅⋯⋅(ξ−xn)

Note: en passant à la limite f[x,...,x]=f^(n)(x)/n!, cf https://en.wikipedia.org/wiki/Hermite_interpolation
=> Par "associativité" on peut calculer f[x_0,..,x_0, x_1,...,x_1] en faisant de la différence divisée sur les f^(k)(x_i)/k!

Un argument similaire à Taylor généralisé donne la formule de Taylor des différences divisées:
https://en.wikipedia.org/wiki/Mean_value_theorem_%28divided_differences%29
 f[x_{0},\dots ,x_{n}]=\frac{f^{(n)}(\xi)}{n!}.

Formule de Taylor des différences divisées (p_n(x)=x^n):
f[x0,…,xn]=f(0)⋅p0[x0,…,xn]+f′(0)⋅p1[x0,…,xn]+f″(0)/2!⋅p2[x0,…,xn]+f‴(0)/3!⋅p3[x0,…,xn]+…
or p_j[x0,...,xn]=0 si j<n (car deg p_j<n); 
   p_n[x0,...,x_n]=1 
et p_{n+m}[x0,...,xn]=\sum_{a_1 <= a_2 <=... a_m} \prod x_a_j
et on peut les calculer via la relation
 t^{n}=(1-x_{0}\cdot t)\dots \cdot (1-x_{n}\cdot t)\cdot (p_{0}[x_{0},\dots ,x_{n}]+p_{1}[x_{0},\dots ,x_{n}]\cdot t+p_{2}[x_{0},\dots ,x_{n}]\cdot t^{2}+\dots ).

Représentation matricielle:
T_f[x_0,...,x_n]=(f[x0], f[x0,x1], ... f[x0,...,xn]
                      0, f[x1], ...    f[x1,...,xn]
                            ...        f[xn])
est un morphisme d'anneaux: T_fg=T_f T_g et T_{f+g}=T_f+T_g
grâce à la règle de Leibniz:
(f⋅g)[x0,…,xn]=f[x0]⋅g[x0,…,xn]+f[x0,x1]⋅g[x1,…,xn]+⋯+f[x0,…,xn]⋅g[xn]

En particulier si J=T_Id=\diag(x_i)+Matrice nilpotente d'ordre n canonique;
T_P=P(J)
Si les x_i sont égaux on retrouve l'évaluation d'une fonction f analytique
en un block de Jordan donné plus bas [Evaluation d'une fonction en une matrice]

T_f est diagonalisable: si 
U=(1 1/(x_1-x_0) 1/(x_2-x_0)(x_1-x_0)
   0 0           1/(x_2-x_1)
   0 0           0)
U \diag(f(x_i))=T_f*U. (cf https://en.wikipedia.org/wiki/Divided_differences#Matrix_form)

Décomposition des Fractions Rationelles
=======================================

https://en.wikipedia.org/wiki/Partial_fraction_decomposition

Si A est Euclidien (pour s), r=P/Q, Q=\prod Q_i^e_i
alors r=P_0 + \sum_{i,j \leq e_i} P_ij/Q_i^j
avec s(P_ij)<s(Q_i^j) [de manière unique].
[Typiquement A=K[X] et s=deg].

L'algorithme est le suivant:
- on réduit P mod Q (le quotient donne P_0)
- on fait du CRT pour obtenir les P_i
  On a explicitement: P_i= r Q_i^e_i mod Q_i^e_i
  Preuve: par récurrence avec Q=Q_1 Q_2 premiers entre eux;
    UQ_1+VQ_2=1; P=PU Q_1+PV Q_2
    P/Q=PU/Q_2 + PV/Q_1; avec V=Q_2^-1 mod Q_1, ie PV=P/Q_2=PQ_1/Q mod Q1
- on écrit P_i=\sum P_ij Q^j

Ex: pour une fraction rationelle (ou même analytique) sur C,
Q=\prod (X-a_i)^e_i
si on fait le développement de Laurent de r en a_i:
r=\sum c_ij (X-a_i)^j; alors les termes négatifs donnent les P_ij.
[En effet r-\sum Pij est alors holomorphe].
On a précisément: si r_i=(X-a_i)^e_i r; a_ij=r_i^(j)/j!

Si 1/Q=\sum P_i/(X-a_i)^e_i, alors Q_i=P_i \prod(X-a_j)^e_j est le polynôme qui
s'annule à l'ordre e_j sur les a_j et qui vaut 1 à l'ordre e_i sur a_i.
Comme 1=\sum Q_i, on a que Q_i est le projecteur de k[X]/Q sur
k[X]/(X-a_i)^e_i.

Calcul des coefficients: l'algo plus haut doit être le plus efficace; mais
à la main on a d'autres stratégie:
- pour avoir le coeff pour (X-a_i)^e_i il suffit de calculer r (X-a_i)^e_i
  et d'évaluer en a_i [et pour les autres coeffs en (X-a_i)^j il suffit de
  dériver assez de fois et d'évaluer en a_i, cf la série de Laurent].
  Une fois qu'on a de l'information, on peut retrancher ça à r et
  recommencer.
- on peut aussi tout mettre au même dénominateur puis résoudre le système
  linéarie issu de l'identification des degrés [voir même avoir des
  relations en évaluant en des points bien choisis, par exemple les a_i, le
  numérateur; voir même en dérivant une fois qu'on a trouvé des coeffs en
  évaluant en a_i pour obtenir les autres]
- dans R[X] pour les pols de la forme (uX+v)/(aX^2+bX+c) on peut évaluer
  Xr(X) en l'infini pour trouver u/v [ou plutôt la somme des coeffs de plus
  haut degré]

Evaluer une fonction en une matrice
===================================

https://en.wikipedia.org/wiki/Matrix_function

Si f est analytique, on peut évaluer f(M) en remplaçant dans la série
entière. Sur un block de Jordan, ça donne
[f(\lambda), f'(\lambda), f''(\lambda)/2, ... f^(n)(\lambda)/n!
          0, f(\lambda), f'(\lambda), ...     f^(n-1)(\lambda)/(n-1)!
             0, f(\lambda), 
              ...                             f(\lambda)]
Comme on le voit facilement avec le développement de Taylor de f en
X-\lambda. (Evidemment M-\lambda donne la forme Nilpotente du block de
Jordan!)

On peut aussi calculer f(M) via l'intégrale de Cauchy.

Applications: 
- pour projeter M sur l'espace carac en lambda il suffit de prendre le
  polynôme qui s'annule à l'ordre e_i en lambda_i et qui vaut 1 à l'ordre e
  en lambda [cf la forme explicite au dessus de f en un block de Jordan]

  En particulier, si on calcule la décomposition en fraction rationnelle de
  1/car(M)=\sum P_i/(X-\lambda_i)^n_i
  alors Q_i=P_i \Prod(X-\lambda_j)^n_j est le projecteur sur l'espace carac de
  lambda_i (cf la décomposition de 1/Q plus haut)
  et donc dans le décomp de Dunford M=S+N,
  S=\sum \lambda_i Q_i et N=\sum (1-\lambda_i) Q_i et 
  [grâce aux Q_i on peut supposer que M est sous forme de Jordan]

- calcul de l'exponentielle
=> Par interpolation:
   https://en.wikipedia.org/wiki/Matrix_exponential
   https://en.wikipedia.org/wiki/Frobenius_covariant
   https://en.wikipedia.org/wiki/Sylvester%27s_formula
Si f(z) est la série génératrice de l'exponentielle, P le pol car de M,
alors la décomposition en fraction rationelle plus haut nous donne Q tel
que (f(z)-Q)/P soit entière; ie f(M)=Q(M).
Ex si M est diagonale à racines distinces, Q est simplement le polynôme de
Lagrange qui envoit les \lambda_i en e^\lambda_i. Plus généralement si on a
une multiplicité e il faut prendre les pols d'interpolation à l'ordre e; cf
la série de Laurent explicite plus haut (ie le polynôme P tel que
P^(k)(\lambda)=f^(k)(\lambda) pour k<=e)

Interpolation d'une fraction rationnelle
=========================================

Aka padé approximation

Multivariate Padé:
- https://link.springer.com/content/pdf/10.1007%2F978-3-0348-7298-0.pdf
  Multivariate approximation theory IV
  Moller H.M.: Multivariate Rational Interpolation, p 249
- https://www.sciencedirect.com/science/article/pii/S037704270000337X
  Multivariate Padé approximation
