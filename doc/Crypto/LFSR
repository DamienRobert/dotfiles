vim: ft=markdownlight fdm=expr

Réf: Handbook of finite fields
==============================

Polynômes associés aux LFSR
---------------------------

Déf: s_{n+k}=\sum_{i=0}^{k-1} a_i s_{n+k-i} dans F_q

Ultimement périodique de période p<=q^k-1.
Périodique si a_0 \ne 0.

Polynôme charactéristique: f(x)=x^k-\sum_{i=0}^{k-1} a_i x^i
Polynôme de connection: f*(x)=x^k f(1/x)=pol réciproque de f(x)

S_n=(s_n, s_{n+1}, ..., s_{n+k-1})
S_{n+1}=t_C(f) S_n où C(f) est la matrice compagnon de f.
Or t_C(f) équivalente à C(f), donc à un changement de base près S_n est
simplement X^n S_0 mod f.

\sigma=(s_0, s_1, ...), T l'opérateur shift
I(\sigma) l'idéal annulateur, ie g \in I <=> g(T)(\sigma)=0, donc f(T) \in I(\sigma)
I(\sigma) est engendré par le polynôme minimal m de \sigma, ie le polynôme
charactéristique de plus petit degré engendrant \sigma.
Lemme: f(T) est le polynôme minimal ssi S_0, ..., S_{k-1} sont linéairement
indépendants sur F_q.

Théorème: la période de \sigma est l'ordre de m(X) (ie l'ordre multiplicatif de X modulo m), et sa prépériode la multiplicité de m en 0. En particulier le LFSR est périodique ssi m_0 \ne 0.

Théorème: s_n = t_n + \sum_{i=1}^h \sum_{j=0}^{e_i-1} \binom(n+j,j) \beta_i,j \alpha_i^n
où \alpha_i racine de f(X) de multiplicité e_i; \beta_i,j \in F (le
splitting field de f(X)) et t_n=0 pour n>=e_0, la multiplicité de f(X) en 0.
[Preuve: Jordan]

Corollaire: si f est irréductible sur F_q, il existe \beta dans F=\F_q[\alpha]
où \alpha racine de f tel que s_n=Tr_{F/F_q} (\beta \alpha^n)

Séries formelles
----------------

Théorème: si S(f) est l'espace des \sigma satisfaisant une relation de
récurrence linéaire pour f (ie f(T)\sigma=0), alors
- S(f) est un F_q-ev de dim deg f, invariant par T
- réciproquement un sev de dim finie de F_q^\infty invariant par T est de
  la forme S(g)
- S(f_1) \cap S(f_2)=S(f_1 \gcd f_2)
- S(f_1) + S(f_2)=S(f_1 \lcm f_2)

Théorème: \sigma vient d'un LFSR ssi le déterminant de Hankel bxb D^n(b)=(dét s_{n+i+j}) est nul pour n assez grand (et le plus petit b est la période k)
Théorème: Berlekamp-Massey (=Euclide étendue=Fractions continues) retrouve
le polynôme minimal de degré k à partir de 2k éléments de \sigma

Théorème: 
- \sigma est un LFSR d'ordre $k$ avec pol de connection c ssi
  \sum s_n x^n = g(x)/c(x) avec deg g < k
- \sigma est un LFSR avec pol minimal m ssi
  \sum s_n/x^{n+1}=g(x)/m(x) avec g premier à m

Réf: Algebraic Shift Register Sequence
======================================

Série de Laurent
----------------

* Série de Laurent en x:
Th 5.2.3, (a_n) est une séquence linéaire récurrente de rang d
ssi \sum a_n x^n=f/g \in R[[x]], avec deg g=d, g(0) inversible
De plus (a_n) est éventuellement périodique ssi g divise x^N-1; c'est
toujours le cas quand R est fini

Si g=g0+g1 x + ... + gd x^d alors \sum g_i a_{n-i}=0,
ie g est le pol de connection et g* le pol carac.
(par contre les coefficients de f sont un peu plus délicats à définir, cf
plus bas).

* Série de Laurent en 1/x:
f(x)/g(x)=\sum a_n x^{-n} quand deg f <= deg g
et les a_n satisfont une suite récurrente linéaire de pol de connection g*
et de pol caract g.

* Point de vue polynomial (cf section 6.3): 
Ici q est le pol de connection, et on peut supposer q_0=-1.
On pose F(x)=\sum_n=0^{k-1} (\sum_i=0^n q_i a_{n-i}) x^n
Matriciellement: (f_0,...f_k-1)=(q_0 ... 0; q_1 q_0 ...; q_2 q_1 q_0 ...) (a_0 ... a_k-1).
Plus généralement on définit F_n(x) à partir de (a_n, ..., a_{n+k-1}).

Alors F_n(x) - x F_{n+1}(x)=a_n q(x) (1)
ie F_{n+1}=F_n(x) x^{-1} modulo q
et S=F/q dans R[[x]]. [Pr: F_n/q=a_n+x F_{n+1}/q]

En particulier, si on pose F_{n+1}=F x^{-n} mod q, on a
a_n= (F_n(x) - x F_{n+1}(x))/q
et bien sûr F_n/q=\sum_{i>=n} a_i X^i

Et de plus, si q_0=-1 on a par (1):
a_i = -x^{-i} f mod q mod x (cf la Proposition 6.6.1)

Dualité entre 0 et l'infini
---------------------------

[Remarque perso: dualité de v_0 et v_infini pour le dév en X, resp 1/X:

Pour développer f/g en série de Laurent, on fait la division euclidienne de
f par g, donc on peut supposer deg f < deg g, ie v_infini f/g>0, et alors
les coeffs sont donnés par la multiplication par X^{-1} mod g: 
a_n = [(f X^{-n} mod g) - (X (f X^{-n-1} mod g)]/g. (*)

Plus précisément, cf http://math.univ-lyon1.fr/~cretin/OralAlgebre/hankel.pdf
f=g Q_n + X^{n+1} R_n avec Q_n, R_n de deg <= n et
c_{n+1}=R_n(0)/g(0), Q_{n+1}=Q_n+c_{n+1}X^{n+1}, R_{n+1}=(R_n-c_{n+1}g)/X
et donc f/g=Q_n mod X^{n+1}

Et si de plus g_0=-1, alors a_n = - f X^{-n} mod g mod X.

Via un changement de variable Y=1/X, f/g = \sum a_i X^i
on a Y f*(Y)/g*(Y)= \sum a_i Y^{-i}
où g*(Y)=Y^k g(1/Y) est le pol réciproque de g et
f*(Y)= Y^{k-1} f(1/Y) (et v_0(f)>0 car deg f < deg g)

Autrement dit quand on développe f/g en 1/X, alors on peut faire une div
euclidienne par rapport à v_0, ie on peut supposer v_0 f/g >0 ie
f=Xf' et alors les coeffs sont donnés par le même genre de formule que (*)
avec les $f* X^n mod g*$ puisque si 
$f_n=f X^{-n} mod g$ alors $f_n*(y)= Y^n f*(Y) mod g*$.

Et si de plus g est unitaire, alors 
a_n = coeff de plus haut degré de f' X^n mod g
]

Retour au LFSR, de F_{n+1}=F_n(x) x^{-1} modulo q
par passage au pol réciproque on a donc bien: 
F_{n+1}*(y)=F_n*(y) y mod q* où F_n*=y^{k-1} F_n(1/y).
IE si p=q* est le pol car, p=\sum p_i X^i, on a concrètement
F*=\sum_n \sum_{j=n}^k p_j a_{j-n} X^n.
De plus si p est unitaire, on peut voir a_n comme le coeff de plus haut
degré de F_n*.

Formes linéaires
----------------
Cf Section 6.6

Si q est un polynôme dans R[x], u une racine inversible de q dans R, alors
a, au^{-1}, au^{-2}, ... est récurrente de pol de connection q pour tout a
dans R.

Donc si P est le pol caractéristique, ie le pol réciproque du pol
de connection, et u une racine inversible, alors
au^n est récurrente.

Si a,u dans \Fq on obtient une suite dans F_p en prenant une appli
linéaire T, par exemple la trace ou un coeff constant de la rep mod q ou P;
ce qui donne un changement de base explicite pour laquelle notre suite
récurrente linéaire devienne "compagnon".

Attention à la subtilité suivante: si \alpha est une racine de P(X), alors
(\beta, \beta \alpha, \beta \alpha^2, ...) est une suite récurrente
linéaire de pol carac P(T). Cependant si on voit par exemple ces éléments
dans R=F_p[X]/P(X), ie comme des pols de degré <k, ie des vecteurs B_n
alors les B_n (et en particulier les F_n*) ne sont pas issues d'une suite
récurrente linéaire A_n.

Et inversement on n'a pas A_{n+1} = X A_n mod P, on a besoin du
changement de variable $A_n <=> B_n$ pour passer de l'un à l'autre.

Sur B_n on a la relation suivante: on note \beta=\sum \beta_i X^i, donc
\alpha \beta mod P = -p0 \beta_L-1 + X (\beta_0 - p1 \beta_L-1) +
     X^2 (\beta_1 - p_2 \beta_L-1)
ie on peut représenter ça par un "LFSR" où toutes les cases sont changées à
chaque step; c'est donc les équations satisfaites par les coeffs de F_n*.

Pour obtenir une suite a_n récurrente linéaire pour P sur F_p, on peut
prendre une forme linéaire T:R->F_p. Alors a_n=T(\beta \alpha^n) est une
suite récurrente linéaire, 
(Ou si on travaille dans R*=F_p[X]/P*(X) si on préfère le polynôme de
connection, on prend a_n=T(\beta \alpha^-n))

Réciproquement, si (a_n) \in F_p est une suite récurrente linéaire, alors
elle est de la forme a_n=T(\beta \alpha^n) si
x->(T(x), T(x \alpha), ... T(x \alpha^k-1)) est surjective, ie
si les formes linéaires sont libres, ie si T(x \sum a_i \alpha^i)=0 pour
tout x implique a_i=0. C'est en particulier le cas si f(xy) est une forme
bilinéaire non dégénérée, par exemple T=Tr. [Si P irréductible, f(xy) est
non dégénéré dès que f n'est pas nulle].
Ca donne une forme du changement de variable voulu; (a_0, ... a_k-1) ne
représente pas le pol \sum a_i X^i mais le pol \beta tel que a_i=Tr(\beta
\alpha^i). [Pour plus de détails, cf Prop 6.6.5]

Exemples:
- la trace => il existe A_i/ a_n=\sum_i=1^k A_i \alpha_i^{n}
- un coeff constant, par exemple a_n= coeff de plus haut degré de F_n*
  (si P unitaire)
- suite de Fibonnacci: a_{n+2}=a_{n+1}+a_n, on a pour pol de connection
  q(x)=-1+x+x^2; on peut voir a_n=x \times x^{-n} mod q mod x
  (ie coeff constant de F_n)
  ou encore a_n=A [(-1 + \sqrt{5})/2]^n + B [(-1 - \sqrt{5})/2]^n
  avec A=1/\sqrt{5} et B=-A c'est à dire a_n=Tr(A \alpha^{-n}).

Résumé
======

Soit (a_n) suite récurrente linéaire de pol carac P de deg k:
a_{n+k}=\sum_{i=0}^{k-1} p_i a_{n+i} et P(x)=x^k-\sum_{i=0}^{k-1} p_i x^i.
On a P(T)(a_n)=0 où T=shift.

A_n=(a_n, a_{n+1}, ..., a_{n+k-1}) suite vectorielle de dim k associée, on a
A_{n+1}=t_C(P) A_n.

Donc à changement de base prêt [A_n=>F_n*=\sum_n \sum_{j=n}^k p_j a_{j-n} X^n]
la dynamique est la multiplication par X modulo P: F*_{n+1}=C(p) F*_n
ie F*_{n+1}(X)=XF*_n(X) mod P ou encore F_{n+1}(X)=F_n(X)/X mod P*
où P* est le pol de connection (ie le pol réciproque de P) et F_n(X) est le pol réciproque de F_n*.
[où on note A_n(X)=\sum a_{n+i} X^i]

Séries formelles: on a XF*/P=\sum a_n X^{-n} ou encore F/P*=\sum a_n X^n
(Et si P est unitaire, a_n est le coeff constant de F X^{-n} mod P*, et
a_n le terme de plus haut degré de F*X^n mod P)
[à des signes prêts].

On peut voir F*_n comme étant $\beta \alpha^n$ pour un $\alpha$ racine de P
(beta correspondant à F_0, \alpha à X mod P), et F_n comme étant $\beta'
\alpha^{-n}$.

Il faut faire attention que si $a_n$ est une suite récurrente linéaire pour
$P$, les $A_n$, vus naïvement dans $F_q^k$ ne forment pas une suite
récurrente linéaire, il faut prendre une autre représentation, comme celle
qui donne les $F*_n$ (qui correspond alors à F*_0 * X^n mod P).

Suites récurrentes linéaires
============================

Si u_{n+2}=a u_{n+1} + b u_{n}, on a donc
(u_{n+2}; u_{n+1}) = (a b; 0 1) (u_{n+1}; u_{n})
(u_{n+1}; u_{n+2}) = (1 0; b a) (u_{n}; u_{n+1})
et C(X^2-aX-B)=(0 b; 1 a)

Plus généralement, à une suite récurrente 
a_{n+k}= \sum p_i a_{n+k-i} de pol linéaire P=\sum p_i X^i, on associe
A_n=(a_n, ..., a_{n+k-1}) et
A_{n+1}=t_C(P) A_n.
Et (a_n) -> (a_0, ... a_k-1) est un iso, ie on a un ev de dim k.

Note: pour calculer A_n, on peut faire de l'exponentiation rapide sur
t_C(P)^n, mais il vaut mieux réduire X^n mod le poly carac puis calculer
l'évaluation en t_C(P); on gagne un facteur constant.

De plus, si U est la matrice d'équivalence entre t_C(p) et C(p), A_n est
donnée par U(X^n*A'_0 mod P) où A'_0=U^{-1)(A_0).
[où X^n signifie C(p)^n, ie via cette identification, on a k[X]/P(X) =~ k[C(p)]]

Comme a_n=f(A_n) où f est la forme linéaire "1er coeff", on en déduit qu'il
existe une forme linéaire g telle que a_n=g(X^n mod P) (concrètement
g=f(U(A'_0)).
[Plus abstraitement: comme 1, X, ..., X^{k-1} forme une base, car X est un
vecteur cyclique de C(p), on définit g par g(X^i)=a_i, et on a bien
g(X^n)=a_n. Plus généralement, si M est une matrice sur V de pol carac P, 
g une forme linéaire sur V, alors a_n=f(M^nv) est une suite récurrente
linéaire, et toute telle suite s'obtient en variant f si v est cyclique
pour M. Exemple: M=t_C(p) et v=(1 0 0 ...0), ie de la suite récurrente
linéaire commençant par 0 ... 0 1 on peut obtenir toutes les autres via des
combinaisons de ses coefficients].

Dualement, si on fixe une forme linéaire g, telle que g soit cyclique pour
t_C(P), alors il existe un vecteur initial A tel que a_n=g(X^n * A mod P).
[en effet, g(X^i .), i<k, forme une base, et on définit A de telle sorte
que g(X^i A)=a_i.]

Forme de Jordan: si P a pour racine lambda_i avec multiplicité n_i, alors
C(p)^n ~ [\lambda_i^n, n \lambda_i^{n-1} , n(n-1)/2 \lambda_i^{n-2}, ...
          0, \lambda_i^n, n \lambda_i^{n-1}, ... 
              ...                             \lambda_i^n]
On peut donc comme dans la discussion précédente,
prendre M=block de jordan, il est cyclique pour v=(0 ... 1),
on en déduit que si \lambda \ne 0, on a des formes linéaires du type
n^i \lambda^n; et si \lambda=0 comme M est nilpotente on retrouve que les
premiers termes de la suite ne contribuent pas ensuite.

Donc au final, si P=X^k+p_1 X^{k-1} + ... + p_k, on peut supposer p_k \ne
0, et donc on voit qu'on peut prendre pour base des formes linéaires sur
k[X]/P(X) X -> \lambda_i, n \lambda_i, ..., n^{n_i} \lambda_i, ... donc a_n
= \sum \alpha_ij n^j \lambda_i^n.
