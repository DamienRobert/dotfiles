vim: ft=markdownlight fdm=expr

Méthode de Newton
==================

cf [NumberTheory/LocalRings] pour les polygones de Newton

* https://en.wikipedia.org/wiki/Householder%27s_method
     x_{n+1} = x_n + d (1/f)^(d−1)(x_n)/(1/f)^(d)(x_n)
  Householder's method of order 1 is just Newton's method

* En p-adique:
f(x_0)=0 mod p, ie = a p.

1) Si on a x0 mod p tel que f(x0)=0 mod p et f'(x_0) de valuation e:
  f'(x0)=u p^e, f''(x_0)/2=v.
  On pose X_1=x0, X_2=x0+x1p
  f(x0+x1p)=f(x0)+f'(x0)x1p +f''(x0)/2 x1^2 p^2 + O(p^3)
            =ap + p^{e+1}u x1 + vp^2 x_1^2 + O(p^3)
  Donc pas de solutions si e>0, sauf si a=0 mod p, dans ce cas on divise
  par p^2 et on a une équation de type (a1+vx_1^2=0) où (a1+ux1+vx_1^2=0)
  à résoudre, pour trouver X_2 mod p^2 tel que f(X_2)=0 mod p^3.
  [Et f'(X_2) est de valuation 1 si 1<e et x_1 \ne 0.]

2) Plus généralement, si on a X_n mod p^n, f'(X_n) de valuation e, et e>=n, et par exemple f(X_n)=0 mod p^{2n-1}.
   On pose Y_n=X_n + p^n Z_n,
   f(Y_n)=f(X_n)+f'(X_n) p^n Z_n + f''(X_n)/2 p^{2n} Z_n^2 +O(p^{3n})
   donc f(X_{n+1})=f(X_n) mod p^{2n}. On veut donc nécessairement f(X_n)=0 mod p^{2n}, on cherche f(Y_n)=0 mod p^{3n} et on se ramène à résoudre une équation de degré 2 en Z_n mod p^n.
   -> On a alors X_{2n}:=Y_n mod p^{2n}, f(X_{2n})=0 mod p^{3n}
   [f'(Y_n)=f'(X_n)+f''(X_n) p^{n} Z_n est de valuation n si e>n et x_n \ne 0 (et >=e si e=n).]
   -> On peut aussi juste chercher Z_n mod p, ie Z_n=x_n, on trouve
   X_{n+1}:=Y_n mod p^{n+1}, f(X_{n+1})=0 mod p^{2n+1}
   Dans les bons cas (cf 2bis) f'(X_{n+1}) va être de valuation n, donc on pourra faire du Newton, cf 3) (ça inclus cas limite e=n).

3) Si on a X_n mod p^n, f'(X_n) de valuation e, e<n, et f(X_n)=0 mod p^{n+e}.
   On regarde Y_n=X_n + p^n Z_n
   f(X_n+Z_n p^n)=f(X_n)+f'(X_n) Z_n p^n + O(p^2n)
   donc f(Y_n)=f(X_n) mod p^{n+e}, et on cherche f(Y_n)=0 mod p^{2n}
   donc on divise par p^{n+e} et on se ramène à a+u*Z_n=0 mod p^{n-e}
   On obtient ainsi Z_n mod p^{n-e}, X_{2n-e}:=Y_n mod p^{2n-e} tel que f(X_{2n-e})=0 mod p^{2n}, de plus f'(Y_n)=f'(X_n).

  Le cas limite est n=e+1: on a X_{e+1} mod p^{e+1} / f(X_{e+1})=0 mod p^{2e+1}
  On trouve X_{e+2} mod p^{e+2} / f(X_{e+2})=0 mod p^{2e+2}
            X_{e+4} mod p^{e+4} / f(X_{e+4})=0 mod p^{2e+4}
            X_{e+8} mod p^{e+8} / f(X_{e+8})=0 mod p^{2e+8}...
  En fait en changeant d'indices: on part de X_{e+m} mod p^{e+m} tel que
  f(X_{e+m})=0 mod p^{2e+m} (m>1) et on obtient X_{e+2m} mod p^{e+2m} tel que
  f(X_{e+2m})=0 mod p^{2e+2m}.

  Le Newton est bien défini: X_{e+2m}=X_{e+m} - f(X_{e+m})/f'(X_{e+m})
  le terme tout à droite étant de valuation 2e+m-e=e+m on a bien
  X_{e+2m}=X_{e+m} mod p^{e+m}.


2bis) Retour sur résoudre l'équation de degré 2 en Z_n. On peut faire du
Newton, mais en fait on peut aussi juste regarder x_n (ie chercher X_{n+1})
et après faire du Newton sur l'équation originale.
Si l'on pose a=f(X_n)/p^{2n}, u=f'(X_n)/p^e (=> u inversible mod p) et v=f''(x_n)/2), X_{n+1}=X_n+p^n x_n et on cherche f(X_{n+1})=0 mod p^{2n+1}, on a:
  a+u p^{e-n} x_n + v x_n^2 mod p
  Si la solution x_n existe, on a f'(X_{n+1})=f'(X_n)+f''(X_n)p^n x_n=up^e+2v p^n x_n.
On a deux cas:
- soit f(X_n)=0 mod p^{2n} exactement. On a alors a \ne 0, donc si une
  solution existe, x_n \ne 0 mod p.
  - Si v=0, une solution n'est possible que si e=n, et alors f'(X_{n+1})
    reste de valuation e, et on a gagné (ie faire du Newton ensuite).
  - Si v \ne 0, on a deux solutions potentielles. 
    - Si e>n, f'(X_{n+1}) est de valuation n<e, et on a gagné (les deux
      solutions se liftent).
    - Si e=n, f'(X_{n+1}) est de valuation e (et on a gagné), sauf si u+2v
      x_n=0, ie si x_n est une solution double de a+ux_n+v x_n^2=0, ie si
      le discriminant u^2-4va=0 mod p.
- sinon, a=0 mod p.
  - Si e>n, et v!=0, x_n=0 est une solution double, X_{n+1}=X_n et f'(X_{n+1})
    est de valuation e. On ne pourra continuer que si a=0 mod p^2, ie
    f(X_n)=0 mod p^{2n+2}. (Si v=0 tout le monde est solution).
  - Si e=n, on a toujours x_n=0 comme solution, mais on a aussi si v!=0 la
    solution x_n=-u/v. Comme x_n n'est pas double, f'(X_n) est de valuation
    e. donc on a gagné.
-> En résumé, si n<e alors et v!=0, alors soit f(X_n) est de valuation p^2n et on trouve deux X_{n+1} tels que f'(X_{n+1}) de valuation n, soit f(X_n) est de valuation supérieure et pour continuer il faut f(X_n) de valuation p^{2n+2}; on prend X_{n+1}=X_n.
Si n=e, alors on a 1 ou 2 solutions (suivant que v=0 ou pas), et on a gagné
sauf si on a une solution double.

Base de Groebner
================

* Ref: thèse de Bardet - Etude des systèmes algébriques surdéterminés
     thèse de Pierre-Jean

Notations: m polynômes en n variables de degrés d_i; d=max(d_i)

Complexité dans le pire cas: 2^2^O(n)

Th: pour tout corps K il exist un syst de n poly en n variables de degré D
tel que la base de Groebner (pour tout ordre admissible) contienne un poly
de degré D^2^n.
(Rem de Pierre-Jean: c'est le cas pour un système affine; si on a un
système homogène de n poly en n variables de dim 0, on est intersection
complète donc on a une suite régulière donc on est en borne de Macauley
pour grevlex et même l'ordre lexico est au pire en D^n).

Cas des systèmes de dimension 0
-------------------------------

Si le système n'admet qu'un nombre fini de solutions, la complexité est de
d^O(n^2) où d est le degré maximum d'un élément de l'idéal (pour mettre en
groebner lexicographique).
[Référence: http://homepages.math.uic.edu/~jan/mcs563/lec10.pdf
Grobner Basis Conversion, Theorem 5.1]

Prop: Le système est de dim 0 ssi pour tout x_i il existe dans la base de
Grobner un polynôme dont le terme de tête soit une puissance de x_i.

Prop 1.3.5: Si F est un système affine, F_h le système homogéne, G_h une base de
Grobner de F_h, alors l'affinisé de G_h est une base de Grobner de F.

Attention: G_h n'est pas forcément de même dimension que F_h, c'est parce
que l'idéal homogène n'est pas forcément engendré par l'homogénéisé d'un
système de générateur (il faut saturer l'idéal, ie regarder ce qui se passe
à l'infini).

Méthode de Macauley: (I homogène) représenter l'idéal I_d en exprimant les
t*f_i tels que t*f_i soit de degré d sur la base de S_d. (C'est la
généralisation de la matrice de Sylvester à plusieurs polynômes).
Le résultant est le ppcm des déterminants de la matrice de Macauley en degré
d=\sum (deg f_i-1)+1. (Pour des polynômes génériques F_i)

Prop 1.4.3: Si les F_i sont génériques, le résultant R est homogène, irréductible, de
degré deg F_1 deg F_2 ... deg F_n /deg F_j en les coefficients de F_j. Il existe une solution non triviale de F_i=0 ssi R=0.

Algo de Lazard: partir de la matrice de Macauley en degré d, et faire du
Gauss, on retrouve une base de Grobner jusqu'au degré d. En particulier, en
partant de la matrice pour d=d_max, on retrouve la base de Grobner; pour un
coût de N^\omega si N est la taille de la matrice de Macauley.

FGLM
----

Si un idéal à D solutions, FGLM se fait en O(nD^3).
(Update: cf Gaudry-Faugère-... O(nD^w))

Fonction de Hilbert
-------------------

Soit HF la fonction de Hilbert associé à k[x_0,...,x_n]/I; HF est égale à
un polynôme pour n>=l'indice de régularité H(I).

La série de Hilbert HS=\sum HF(n) z^n = P(z)/(1-z)^d où d=dim I et P(1) \ne
0 est le degré de la variété I.

Th [dim 0?]: l'indice de régularité majore le degré max d'un élément d'une
base de Groebner pour un ordre quelconque gradué par le degré.

Rem: si le système est de dim 0, l'indice de rég est le plus petit entier
tel que HF(n)=0.

Soit G la série de Hilbert associé à des polynômes génériques (on fixe les
degrés d_i ici). Alors pour tout idéal (avec les même d_i), on a HS>=G; on
conjecture que G=\prod (1-z^d_i)/(1-z)^n. Si m<=n on peut prouver que c'est
vrai (prendre une suite régulière).

Spaenlehauer, Corollary 1.66:
If I ⊂ K[X] is a 0-dimensional homogeneous ideal, then i_reg (I) = deg(HS
K[X]/I)+ 1. Moreover, for any monomial ordering i_reg (I) bounds the
degree of all polynomial in a minimal homogeneous Grobner basis of I.

Suite régulière
---------------

Si I=(f_1,...,f_m) est un idéal de codim h, il existe un changement de
variable linéaire (en drapeau)
g_1=f_1; g_2=f_2+?f_3+?f_4; g_3=f_3+?f_4+?f_5; ...
g_{h+1}=f_{h+1}; ...
Tel que I=(g_1,...,g_m), et (g_1,...,g_h) soit régulière;
(de plus c'est vrai pour tout coefficients ? sauf un nombre fini)

Pr: k[x_0,...,x_n] est de Cohen-Macauley.

Th: Si f_1,...,f_m est une suite rég de poly homogènes;
1) l'idéal I est de dim n-m
(et inversement si l'idéal I est de dim n-m alors on est "intersection
complète" dans l'anneau régulier k[x_0,...,x_n] donc les f_i forment une
suite régulière)
2) La série de Hilbert est \prod_i=1^m (1-z^d_i)  / (1-z)^n
(inversement si I a une telle série de Hilbert les f_i sont une suite rég)
3) Une permutation des f_i reste régulière
4) L'indice de régularité est la borne de Macauley
  d=\sum (deg f_i-1)+1.
5) Presque toute suite est régulière: l'ensemble des suites de pol de deg
   d_i qui sont régulières est un ouvert non vide de Zariski.

Cas générique:
Si le système est de dim 0 *homogène*
alors pour l'ordre grevlex, et pour presque tout changement de variable
linéaire; le degré maximum des polynômes intervenant dans la base de
Grobner est donné par la borne de Macauley \sum_i=1^m (deg f_i-1)+1; et le
calcul de la base de Groebner est polynômial en d^n.
[Pr de Pierre-Jean: via une combinaison linéaire aléatoire, les codim
premiers polynômes sont réguliers donc on a la borne de Macauley. Les
autres polynômes n'augmentent pas l'indice de régularité car ils diminuent
le nombre de solutions]

Attention: en dim>0 il existe des suites régulières où le degré maximal
peut être d^n (en fait ça dépend si l'ordre grevlex choisit met les
variables en position de Noether).

De manière plus précise:
Th 1.8.2 (et discussion après; dim >=0):
Si les variables x_1, ..., x_n mettent les f_i en position de Noether,
alors le degré maximum est la borne de Macauley (ie il n'y a pas besoin de
faire un changement linéaire de variable quand on est en pos de Noether)
(Interprétation Grobner de la position de noether: pour l'ordre grevlex, et
pour tout i, il existe n_i tel que x_i^n_i \in LeadingTerms(I))

Point de vu de Pierre-Jean:
- on peut prendre une combinaison linéaire des polynômes pour que les c
  premiers soient réguliers (c=codim)
- en dimension 0 on a la borne de Macauley; et les équations rajoutées ne
  sont pas embettantes car elles ne forment pas des points immergés
- en dimension >0, même si on a une suite régulière il faut qu'elle soit en
  position de Noether pour que ça se passe bien (ie un changement aléatoire
  des coordonées, ie une transformation projective linéaire).
  Les équations rajoutées après peuvent être embêtantes à cause des points
  immergés.

Plus précisément, le nombre de poly de degré d de la base de Groebner est
majoré par g(d) qui donne la série génératrice:
z^d_m \prod_i<m (1-z^d_i) / (1-z)^{m-1}, qui est un poly de degré la borne
de Macauley
[Cf Bardet, Th 3.4.1]

Cas des systèmes surdéterminés
------------------------------

Une suite est semi-régulière ssi sa série de Hilbert est
\prod_i=1^m (1-z^d_i)  / (1-z)^n
et le degré max d'un élément de la base de Gröbner est le premier d tel que
le coefficient a_d de la série de Hilbert est =0.
(En particulier une suite est régulière <=> semi-règ + m<=n)

Asysmptotiquement, pour une suite semi-régulière à n+k éléments, quand n
tend vers l'infini, k>0, on a d_max=(\sum (d_i-1))/2, soit un facteur 2 sur
la borne de Macauley.

(Autres déf:
- ce sont les suites pour lesquelles F5 n'a pas de réduction à 0
- si f_i est diviseur de 0 dans S/(f_1,...,f_{i-1}); 0=g_i f_i et deg(g_i
f_i)<H(I) alors g_i=0. L'intérprétation est que si m>n il y a forcément un
diviseur de 0; mais dans ce cas on veut qu'il soit plus grand que l'indice
de régularité)

Calcul des solutions
--------------------

Soit f_i homogène de degré d pour simplifier. Quitte à faire un changement
de variable, on peut supposer que les n premiers sont réguliers (et en
position de Noether) donc on raisonne là-dessus (une fois qu'on a les
solutions pour f_1,...,f_n, il suffit de sélectionner parmi celles qui
vérifient aussi f_{n+1}...=0).
Ce système a un degré <=d^n.

La borne de Macauley est nd-n+1.
On calcule donc la matrice de Macauley en degré D=nd-n+1; c'est (n+D-1;D).
Bornons hyper salement la taille par (nd)^n/n!<=(nd)^n et on obtient une
borne en (nd)^{wn} pour grevlex, puis du FGLM par nd^{3n} (update:
n d^{wn}); pour au final un coût pour Lex en (nd)^{3n} (update: (nd)^{wn})

De manière plus précise (cf Pierre-Jean):
on a un idéal homogène engendré par m éléments f_i de degrés d_i; d=d_max.
Quitte à faire une combinaison aléatoire, on a une suite réguliere des n
premiers éléments, et la borne de Macauley est donc de nd-n+1. On peut donc
calculer la matrice de Macauley en cette borne pour les m polynomes (en
pratique donc on a pas besoin de vraiment faire la combinaison linéaire car
on mettra cette matrice en forme échelon).
Rappel: une matrice AxB de rang r se met en forme échelon en
O(ABr^{w-2}). Donc on a un coût en m*Polynôme(n^d).

Plus de détails dans la thèse de Lakschman pour une intersection complète: on a le O(d^n)
Raffiné dans la thèse d'Amir Ashemi (étudiant de Lazard-Giusti) en O(d_0^n)
où d_0 est la moyenne arithmétique des d_i. On est pas encore à la borne de
Bézout des \prod d_i, ie de la moyenne géométrique à la puissance n.

Rajouter des équations affecte juste par un facteur linéaire (car on
rajoute des lignes à la matrices de Macauley). D'après la thèse de Bardet
si on rajoute une équation (et qu'on est semi-régulier) on peut même
gagner un facteur 2 sur la borne de Macauley. Par contre par rapport au
degré de l'idéal on perd beaucoup car rajouter des équations peut beaucoup
baisser le degré par rapport à la borne de Bézout.

Example: calcul d'une base de Grobner lexico pour A[l] en thêta:
n^g variables, O(n^g) équations de degré 2, O(n^g) équations de degré l^2;
système final de degré l^{2g}.
On est polynômial en O(l^{2O(n^g)}).

Résultants et sous-résultants
=============================

http://en.wikipedia.org/wiki/Resultant
http://en.wikipedia.org/wiki/Subresultant#Subresultants

The i-th subresultant polynomial Si(P ,Q) of two polynomials P and Q is a polynomial of degree at most i whose coefficients are polynomial functions of the coefficients of P and Q, and the i-th principal subresultant coefficient si(P ,Q) is the coefficient of degree i of Si(P, Q). They have the property that the GCD of P and Q has a degree d if and only if
    s_0(P,Q)=\cdots=s_{d-1}(P,Q) =0 \ , s_d(P,Q)\neq 0.
In this case, Sd(P ,Q) is a GCD of P and Q and
    S_0(P,Q)=\cdots=S_{d-1}(P,Q) =0.
Every coefficient of the subresultant polynomials is defined as the determinant of a submatrix of the Sylvester matrix of P and Q. This implies that that subresultants "specialize" well.

## Technical definition

Let P=p_0+p_1 X+\cdots +p_m X^m,\quad Q=q_0+q_1 X+\cdots +q_n X^n.
be two univariate polynomials with coefficients in a field K. Let us denote by \mathcal{P}_i the K vector space of dimension i the polynomials of degree less than i. For non negative integer i such that i≤m and i≤n, let
    \varphi_i:\mathcal{P}_{n-i} \times \mathcal{P}_{m-i} \rightarrow \mathcal{P}_{m+n-i}
be the linear map such that
    \varphi_i(A,B)=AP+BQ.
The resultant of P and Q is the determinant of the Sylvester matrix, which is the (square) matrix of \varphi_0 on the bases of the powers of X. Similarly, the i-subresultant polynomial is defined in term of determinants of submatrices of the matrix of \varphi_i.

phi_0 est de rang m+n-deg(pgcd(P,Q)), en particulier phi_0 inversible <=>
résultant non nul <=> pgcd de degré 0.
Si le pgcd est de deg i, alors \phi_i est le premier \phi_j inversible.

Avec des preuves/généralisations ici:
- http://atlas.mat.ub.es/personals/dandrea/jan31.pdf
  Resultants and Subresultants: Univariate vs. Multivariate Case, Carlos D'Andrea
- http://domino.mpi-inf.mpg.de/intranet/ag1/ag1publ.nsf/20a0a8aecef76f33c12569e30040d63d/c3a69ddfe0bcbf83c1256fb3004bb90f/$FILE/subresultant.pdf
  An Elementary Approach to Subresultants Theory, Mohammed El Kahou
- http://www.math.jussieu.fr/~chardin/publications/textes/07.MultSub.pdf
  Multivariate Subresultants, Marc Chardin
- http://www.eecs.berkeley.edu/Pubs/TechRpts/1988/CSD-88-440.pdf
  Generalized Characteristic Polynomials, John Canny
- http://arxiv.org/pdf/1307.5330.pdf
  On Computing the Elimination Ideal Using Resultants with Applications to Gröbner Bases, Matteo Gallet, Hamid Rahkooy, Zafeirakis Zafeirakopoulos
- http://web.cs.miami.edu/home/strac/root_methods/papers/auz.pdf
  An Elimination Algorithm for the Computation of All Zeros of a System of Multiv ariate P olynomial Equations W. Auzinger, H. J. Stetter
+ Les pages web de Laurent Busé
http://www-sop.inria.fr/members/Laurent.Buse/supervisionteaching.html
et de Marc Chardin
http://www.math.jussieu.fr/~chardin/textes-pdf.html

Cf aussi le livre Modern Computer Algebra

Cox: Using algebraic geometry
=============================

## Préliminaires (p.70)

(4.5) Theorem. Let I C \C[X_i] be zero-dimensional,
m_f the multiplication by f on C[X_i]/I. Alors les valeurs propres de m_f
sont les valeurs de f sur les points V(I).

Ex: la multiplication de f sur C[X]/g donne le résultant via le déterminant
(à a_0^n près), et le pol car est \prod(X-f(\beta_i)) [pas vérifié]; donc
en général le pol car de m_f ça doit être les prod(X-f(i))_i \in V(I) [pas
vérifié]

## Résultant

· (Integer Polynomial) Res(f, g) is an integer polynomial in the coefficients
of f and g.
· (Common Factor) Res(f, g) == 0 if and only if f and g have a nontrivial
common factor in k [x] .
· (Elimination) There are polynomials A, B in k[x] such that A f + B g =
Res(f, g). The coefficients of A and B are integer polynomials in the
coefficients of f and g.

Ex: if f,g \in k[x, y], Res(f,g,x)=Af+Bg \in k[y] donc le résultant est
dans l'idéal d'élimination (f, g) n k[y], en particulier s'annule sur les
racines communes.

## Calculs

If f = a_0 x^l + . . . + a_l, g = b_0 x^m + . . . + b_l:
Res(f,g) = a_0^m b_0^l \prod (alpha_i-beta_i)
         = a_0^m \prod g(alpha_i)
         = (-1)^lm b_0^l \prod f(beta_i)
Res(f,g)=a_0^m dét(multiplication par g dans k[x]/f)

Res(f,g)=dét(Af+Bg: k[x]_{m-1}*k[x]_{l-1} -> k[x]_{l+m-1}

Rem: si g=g' de deg m'<m, Res_{l,m}(f,g)=a_^0^{m-m'} Res_{l,m'}(f,g')
     Res(f,b_0)=b_0^l,
     Res(f,g) = (-l)^lm Res(g,f);

If g = q f + r Euclidian division:
  Res(f, g) == a_0^{m-deg(r)} Res(f, r).

## Résultant homogène

(1.7) Proposition.
a. Res(F,G) est un polynôme homogène en les coeffs
b. Over the field of complex numbers, Res(F, G)=0 iff the
equations F == G == 0 have a non trivial solution (x, y).
(ie il y a des solutions dans P^1(C))

Pr: soit on n'a pas de perte de degré et on est dans le cas affine, sinon
il faut plus analyser.

## Résultant multivarié

(2.3) Theorem. If we fix positive degrees d_0, ... d_n , then there is a
unique polynomial Res \in Z[Ui] which has the following properties:
a. If F_0, ... , F_n \in C[x_0,..., x_n] are homogeneous of degrees d_0,  d_n ,
then the equations (2.1) have a nontrivial solution over \C if and only if
Res(Fo, ... , Fn) = 0.
b. Res (x_0^d_0 , ... , x_n^d_n) = 1.
c. Res is irreducible, even when regarded as a polynomial in C[Ui].

(3.1) Theorem. For a fixed j between 0 and n, Res is homogeneous in
the variables Uj,a (|a|=d_j), of degree d_0x ...x d_{j-1}xd_{j+1}x...xd_n.
(In the special case when F_i all have the same total degree d > 0,
the resultant Res_{d,...,d} has degree d^n in the coefficients of each F_i , and its total degree is (n + 1) d^n.)

- f_i(x_0,. . . , x_{n-1}) = F_i(X_0, . . . , X{n-1}, 1).
- F0_i(X_0,. . . , X_{n-1}) = F0_i(X_0, . . . , X{n-1}, 0).
(3.4) Theorem. If Res(F0_i) \ne 0, then the quotient ring
A = \C[x_i]/(f_0, ..., f_{n-1}) has dimension d_0x...xd_{n-1} as a vector space
over \C and Res(F_i) = Res(F0_i)^d_n x det(mult_{f_n} : A -> A).

Intersection de courbes
=======================

* Le résultant de f(x,y) et g(x,y) selon y est le polynôme R(x) dont les
racines sont
- les projetés des points d'intersection de f et g sur l'axe des x
- les x_0 tels que x=x_0 est une asymptote (verticale) commune à f et g
  (car si on écrit f(x)=a_0(x) y^d+... et g(x)=b_0(x) y^e+...
  alors on a une asymptote commune quand a_0(x_0)=b_0(x_0)=0 et le
  résultant est bien nul.)

* Point de vue homogène [Laurent Buzé, Section 2.1]:
  si F(x,y,z) et G(x,y,z) sont tels que (0:1:0) [les asymptotes verticales]
  n'est pas dans V_F \cup V_G, alors a_0(x,z) et b_0(x,z) sont constantes,
  et R(F,G,y) donne exactement la projection des points d'intersection de
  V_F \cap V_G.
  En général on a vu que le résultant donnait bien la projection des points
  d'intersection (X:Y:Z)->(X:Z) (y compris à l'infini, c'est à dire que
  (X:Y:0), est racine commune si une droite de pente Y/X est asymptote à F
  et une autre à G, et (X:Y:0) se projete sur la point à l'infini (1:0) de
  P^1. Pour le point à l'infini (0:1:0) des asymptotes verticales, la
  projection n'est pas bien définie, mais on a vu qu'on obtient les x_0
  tels que x=x0 est une asymptote verticale commune, autrement dit on
  obtient le projeté des points communs dans l'éclaté en (0:1:0).

* Si f et g sont des polynômes formels sur A[X] où A=\Z[a_0,...,b_0,...],
alors l'idéal (f,g) \cap A est irréductible engendré par R(f,g).
[cf Laurent Buse, Section 4.2]
