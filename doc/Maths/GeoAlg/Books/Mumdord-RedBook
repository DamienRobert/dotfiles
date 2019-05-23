vim: ft=markdownlight fdm=expr

Variétés
========

[Note par variété Mumford entend variété irréductible. Je rajoute pas
toujours irréductible, des fois parce que ça marche sans, des fois parce
que j'ai la flemme...]

Morphismes
----------

f: X->Y est un morphisme de variété affines <=>
(i) Pour tout germe g \in O_f(x), gof \in O_x
(ii) Pour toute section g \in O_Y(U), gof \in O_X(f^-1 U)
(iii) Pour toute section globale g \in O_Y(Y), gof \in O_X(X)

Sous-variété fermée
-------------------

Si Y est un fermé d'une variété X, alors O_X induit un faisceau sur
O_Y via O_Y(V)={fonctions f:V->k/ pour tout x \in V, il existe un ouvert U
dans X contenant x tel que f soit la restriction à U\inter V de F \in
O_X(U)}

Produits
--------

Soit X et Y des variétés irréductibles affines d'anneaux R et S;
- XxY est une variété affine irréd d'anneau R \tens S
- Une base de XxY est donné par \sum f_i(x)g_i(y) \ne 0
- O_(x,y) est la localisation de O_x \tens O_y en l'idéal max m_x O_y+O_x m_y

Variété séparée
---------------

X est séparée ssi la diagonale \Delta est fermé dans XxX
Dans ce cas:
- \Delta est isomorphe à X
- si f:X->Y est un morphisme, le graphe de f: (id,f):X->XxY est fermé dans
  XxY, et isomorphe à X
- Si U et V sont des ouverts affines de X, alors
  U\inter V est isomorphe à UxV \inter \Delta, c'est une variété affine,
  sous variété fermée de UxV donnée par par la composition
  O_X(U) \tens O_X(V) -> O_X(U).O_X(V)

Critère local: X est séparée ssi x \ne y (x,y fermés) implique qu'il n'y a
pas d'anneau local dans k(X) dominant à la fois O_x et O_y
(un anneau local (A,m) est dominé par (B,n) si A \subset B et m \subset n
(ie m=A\inter n))

Birationalité
-------------

f: X->Y est un morphisme birational de variété séparées si f induit un iso
f: k(Y)->k(X) Dans ce cas, il existe un ouvert U non vide de Y tel que f
induit un iso f: f^-1(U) -> U.

Ex: Soit a,b deux isos a:K(X)->K et b:K(Y)->K; on en déduit un morphisme
  Spec K->X x Y, produit des morphismes qui envoit le point gén de K sur le
  point gén de X, resp Y.
  Soit t l'image de ce morphisme, et T sa cloture, via (a,b)* on a k(T)=K.

  On dit que T est le graphe de la correspondance birationnelle entre X et Y.
  Il existe donc U et V ouverts dans X et y tel que p_1^-1(U) soit isomorphe
  à U et pareil pour V; soit W_0=p_1^-1(U)\inter p_2^-1(V) et U_0, V_0
  l'image de W_0 via p_1, p_2. Alors p_1 et p_2 donnent des isomorphisme
  entre U_0, V_0 et W_0; W_0 est le graphe de l'iso entre U_0 et V_0.
  T est la cloture de W_0.

  Dans un recouvrement affine U_ixV_j, T\inter U_ixV_j est donné par la
  cloture de t dans cet ouvert. Soit f:Spec(K)->U_i x V_j donné via
  A_i \tens B_j -> k(X) \tens k(Y) -> K  (via a,b)
  t est donné par f^-1(0), donc sa cloture est Var(f^-1(0)), qui correspond
  à l'anneau affine a(A_i)b(B_j) \subset K.

Dimension
---------

Th:
- Si Z irréd est de codim r, Z est une composante de V(f_1,...,f_r);
inversement une telle composante est de codim <=r.
- dim O_Z,X=dim X-dim Z = le plus petit entier r tel que l'anneau maximal
  de O_Z,X = \sqrt(f_1,...,f_r).
- Version r=1: si U est ouvert, et Z une composante irréd du lieu
  d'annulation d'une section non nulle de U, dim Z=dim X-1.
  En particulier, V(g) est de pure codimension 1.
  Réciproquement, si Z est irréd de codim 1, pour tout ouvert U tel que
  Z\inter U \ne 0 et pour toute fonction f de U s'annulant sur Z, Z\inter U
  est une composante de f=0.
  De plus, si X est un UFD, tout Z de pure codim 1 est de la forme V(f).

Cas projectif
-------------
On a de plus que Z est non vide si codim Z<=dim X: f_i \in k[X_0,...,X_n]
- Toute composante de X \inter V(f_1,...,f_r) est de codim <=r, et si dim
X>=r X \inter V(f_1,...,f_r) est non nul
- Récip si Y est de codim r dans X, Y est une composante de X \inter
  V(f_1,...,f_r). Il existe de plus f_i / 0=X \inter V(f_1,...,f_{dim X+1})

Prop: si f: P_n -> P_m, alors l'image est un point ou est de dim n.

Fibres
------
Si f: X->Y est dominant, W \subset Y irréd, et Z une composante de f^-1(W)
dominant W, alors
dim Z >= dim W+dim fibre gén (=dim X-dim Y)
ou de manière équivalente: codim Z in X <= codim W in Y

Par platitude générique il existe un ouvert U tel que si W \inter U \ne
0 et Z une composante intersectant f^-1(U), on a dim Z=dim W+dim fibre gén

Cor:
- l'image est constructible, f envoit des constructibles sur des constructibles,
- e(x)={max dim Z/ Z est une composante de f^-1(f(x)) contenant x} est semi
  continu supérieurement; ie {e(x)>=n} est fermé.

Variétés complètes
------------------

P^n est complet.
La preuve utilise la description suivante d'un fermé Z de P^n x Y:
si g \in I(Z\inter U_i) pour un ouvert affine canonique U_i=P^n_X_i x Y, il
existe f tel que g=f(X_0/X_i, ..., X_n/X_i) avec f homogène de degré m
tel que f(X_0/X_j, ..., X_n/X_j) soit dans U_j pour tout j.

Autrement dit toute section locale sur U_i vient d'une section globale dans
O(m) pour m assez grand.

Variétés complexes
------------------

Strong topology: plus forte que la topo de Zariski, et continue pour les
morphismes de variétés, commute au produit et aux sous-espaces fermés, pour
A^1 c'est exactement la topology de k (quand k corps topologique).

Si k=C, le faisceau d'anneau algébrique est inclus dans le faisceau
analytique; il a les prop suivantes:
- tout morphisme algébrique est analytique, ie envoie une section
  holomorphe sur une section holomorphe
- le faisceau analytique sur un fermé Z \subset X est la restriction du
  faisceau analytique X
- si X=A^n, le faisceau analytique est simplement le faisceau des fonctions
  holomorphes sur C^n.

Th:
- Si U est un ouvert de la variété X, U est dense pour la topologie forte
- Si Z\subset X est constructible, la cloture pour la topo forte ou la topo
  de Zariski sont identiques
- X est complet ssi il est compact dans la topo forte

Lemme de Chow:
Soit X une variété complète sur un corps alg clos k. Alors il existe une
variété projective Y (\subset P^n) et un morphisme birationel surjectif
f: X->Y.
(Extension: If X is a scheme that is proper over a noetherian base S, then there exists a projective S-scheme X' and S-morphism f: X' \to X that induces f^{-1}(U) \simeq U for some open dense subset U. )

Schémas
=======

Schémas affines
--------------

- Si X_f contient X_g, f divise une puissance de g
- X_f \inter X_g=X_fg
- X=\union X_f_i ssi 1=(f_i), dans ce cas on a une partition de l'unité
  1=\sum g_i f_i

Schéma sur k-alg clos
---------------------

Si X est de type fini sur k, x est un point fermé ssi la composition
k->O_X,x->k(x) est surjective.

Corollaire:
- Si x est fermé dans un ouvert U, x est fermé dans X.
- Les points fermés sont denses dans tout fermé de X.

Corps de définition
-------------------
cf ./Proprietes_Geometriques

Schémas fermés
--------------
cf ./Immersions

Foncteur des points
-------------------

Soit F un foncteur Rings->Sets. Si F provient d'un schéma, alors il est
compatible avec la descente fidèlement plate:
Si B/A est fidèlement plat, alors
F(A)->F(B) => F(B \tens_A B) est exact (ie F(A) est le conoyau de la double
flêche).

Examples:
- Si X_0 est une variété sur k, X=X_0xkbar, X_0/k(kbar)=X/kbar(kbar)=Points
fermés de X.
- Si (R,m) est local, x\in X, alors les points X(R) tels que f(m)=x sont en
  bijections avec Hom(O_X|x, R).

## Application: condidition de Hausdorff

Soit f,g:T->Xn et t \in T. On dit que f(t)==g(t) si f(t)=g(t) et les
applications f*,g*:k(f(t))->k(t) sont égales, ou de manière équivalente
f o i=g o i où i est l'application canonique Spec(k(t))->T.

Ex: si T est réduite, f(t)==g(t) <=> f(t)=g(t)

Prop: L'ensemble {t/ f(t)==g(t)} est localement fermé. S'il est fermé pour
tout morphisme f,g; on dit que X est séparée; il suffit de le vérifier pour
XxX => X. (La version relative s'étend trivialement)

Th: Si X est un schéma séparé, alors pour tout ouvert affine U,V, U \inter
V est affine et O_X(U) \tens O_X(V) -> O_X(U \inter V) est surjectif.

Ex: - Un produit fibrés de schémas séparés est séparé
    - P^n_Z est séparé
    - Si X_1/S_1 et Y_1/S_1 sont fermés dans X/S et Y/S avec S_1->S et que
    tous ces schémas sont séparés, alors X_1 *_S_1 Y_1 est fermé dans X *_S Y.
(à partir de maintenant Mumford suppose les schémas séparés)

Morphismes finis et morphismes propres
--------------------------------------

Déf: f est propre s'il est de type fini et univ fermé
- Une immersion fermée est propre
- La composition de morphismes propres est propre
- Le pullback d'un morphisme propre est propre
- Si f:X->Y, g:Y->Z, g de type fini, f surjectif, gof propre, alors g
  propre.
- Si X variété, X/k propre <=> X/k complète.
- Un morphisme fini est propre

Th: P^n_Z -> Spec(Z) est propre.
Vient de: soit Z un fermé de P^n_R, g une fonction de I(Z \inter U_i) où
U_i est l'ouvert affine canonique pour X_i. Alors il existe G\in
R[X_0,...,X_n] homogène de degré r telle que G/X_i^r=g et G/X_j^r \in I(Z
\inter U_j) pour tout j.

Th: f:X->Y est propre ssi pour tout anneau de valuation R d'anneau de
fractions K et morphismes j:Spec R->Y, i:Spec K-> X qui fait commuter le
diagramme
Spec K -> X
Spec R  -> Y
il existe un morphisme Spec R->X.

Vient de: soit f:Z->Spec(R) (anneau de valuation) un morphisme surjectif
birationnel, avec Z réduit irréductible. Alors f est un isomorphisme.

Going-Down theorem of Cohen-Seideberg (cf $8 p.129):
Soit f:X->Y un morphisme fini / Y est irreductible et normal (ie les O_Y|y
sont des intègres, intègralement clos dans leur corps de fractions). On
suppose que pour tout x\in X, les éléments non nuls de O_Y|f(x) ne sont pas
des diviseurs de zéro de O_X|x (ie tous les points associés de O_X sont au
dessus du point générique de Y).
Alors il y a going-down: si f(x_1) \in \overline{y_0}, il existe x_0 \in
f^-1(y_0) avec x_1 \in \overline{x_0}.

## Les projections donnent des morphismes fermés:

Soit L \subset P^n_R un espace linéaire de codimension r donné par les
formes linéaires l_0,...,l_r, et \pi la projection
P^n_R - L -> P^r_R donnée par
\pi(U_i)\subset V_i et \pi*(Y_k/Y_i)=l_k/l_i.
Alors si Z est fermé dans P^r_R et disjoint de L, \pi induit un morphisme
fini Z->P^r_R.

De plus, si Z est irréductible de dimension r, on peut trouver L tel que
\pi: Z->P^r_R soit un morphisme fini et surjectif (Noether projectif).
(En fait j'ai l'impression que tout sous-espace linéaire L disjoint de Z et
maximal convient).

Specialisations
---------------

Si (R,m,L) est un anneau de valuation discrète de k (alg clos), on a une
application \rho: P^n(k)->P^n(L): si (a_0,...,a_n) est dans P^n(k), un
multiple \lambda les envoit tous dans R mais pas tous dans m, et on peut
prendre l'image dans R/m=L.

Th: Si Z est un sous-espace fermé de P^n_k, il existe un unique sous-espace
fermé W de P^n_L/ \rho(Z(k))=W(L):
i: P^n_k -> P^n_R <- P^n_L :j
     |       |p    |
     k   ->  R    <-   L
W est définie par W=P^n_L \inter cloture fermée de i(Z)
[Rem: k->R vient du point générique et L->R du point fermé; P^n_L->P^n_R
est une immersion fermée, donc on peut voir P^n_L comme un sous-schéma de
P^n_R. i est un homéomorphisme entre P^n_k et p^{-1}(point générique de R)]

Prop: 
- Si Z est irréd de dim r, W est équi r-dimensionel.
- Si Z est connexe (et fermé), W est connexe (connectedness theorem of
  Zariski)

W n'est défini que topologiquement pour l'instant. Pour le définir en tant
que schéma: supposons que Z soit donné par l'idéal homogène A.
Soit B=\pi(A \inter R[X_0,...,X_n]) où \pi est la projection R->L=R/m.
Alors W est le schéma défini par l'idéal homogène B dans P^n_L.

Prop: Il existe un unique schéma fermé Z_0 de P^n_R tel que
- pour tout x\in Z_0, O_Z_0|x est un R-module sans torsion
- Z=Z_0 x_{P^n_R} P^n_k = Z_0 x_{R} k
De plus W est la fibre spéciale, ie la fibre fermée de Z_0 via Spec L->Spec R.

Reformulation (cf Milne, CM, Lemme 6.8), dans la reformulation k est le
fibre spéciale et K la fibre générique:
pour toute sous-variété X fermée de P^n_K, sa cloture de Zariski XX dans
P^n_R satisfait XX \cap P^n_K=X (inside P^n_R) et XX est l'unique
sous-schéma plat de P^n_R avec cette propriété. De plus,
\rho(X(K^al))=XX(k^al).

Ex: soit D un anneau de Dedekind, k_0 son corps des fractions (non alg
clos), L_0 le
quotient D/m où m est un des idéaux maximaux.
Soit Z_0 fermé dans P^n_D. Alors si O_Z_0 est un faisceau de D-modules sans
torsion, Z=(Z_0)_{k_0} détermine Z_0 et donc Z_L_0:
  Z_k_0 -> Z_0   <- Z_L_0
P^n_k_0 -> P^n_D <- P^n_L_0
  k_0   -> D <-     L_0
[Preuve: on tensorise avec une cloture algébrique de k pour se ramener au
cas géométrique puis on descend:
En fait si k est la cloture algébrique de k_0 et R\subset k un anneau de
valuation dominant D_m, alors L=R/m est une cloture algébrique de L_0, et
le pullback donne
  Z_k -> Z     <- Z_L
P^n_k -> P^n_R <- P^n_L
  k   -> R     <-     L
Comme Z est sans-torsion sur R [Pr: si M/A est sans torsion, et B/A un
anneau de valuation, alors M \tens_A B est sans torsion sur B], Z_L est la
spécialisation de Z_k. Et donc Z_L_0 est simplement la L_0 structure sur
Z_L_0, tandis que Z_k_0 est juste la k_0 structure sur Z_k.]

Propriétés locales des schémas
==============================

Faisceaux quasi-cohérents
-------------------------

Déf: différentielles de Kähler.
Soit f:X->Y, \Omega_X/Y est le faisceau des différentielles relatives:
soit \Delta l'immersion fermée "diagonale": X->X x_Y X, Z=\Delta(X) est
définie par l'idéal quasi-cohérent Q. Alors Q/Q^2 est quasi-cohérent
au-dessus de X x_Y X, mais également au-dessus de O_{X x_Y X}/Q (=O_Z
étendu par 0); donc on peut le voir comme un O_Z module (car ses germes
sont 0 en dehors de Z). \Omega_X/Y est simplement le pull back de Q/Q^2 via
l'iso \Delta: X->Z.

Ex:
- Si X=Spec B, Y=Spec A, f:A->B, alors \Omega_B/A est défini par
  Hom_B(\Omega_B/A,M)={A-dérivations D:B->M} pour tout B-module M.

  \Omega_B/A est le quotient du module libre engendré par les symboles db par
  * d(b_1+b_2)=db_1 + db_2
  * d(b_1 b_2)=b_1 db_2 + b_2 db_1
  * d(f(a)) = 0

  Si I est le noyau de B \tens_A B->B, \Omega_B/A=I/I^2.
- \Omega_k[X_1,...,X_n]/k est libre sur dX_1, ...,dX_n et
  dg = \sum \delta g/\delta X_i . dX_i.
- Si A=k et B=k[X_1,...,X_n]/(f_1,...,f_m), \Omega_B/A et le quotient de
  \sum dX_i via les relations
  df_i = \sum \delta f_i/\delta X_j .dX_j = 0
- Si K corps, \Omega_K/k est l'espace des k-dérivations K->K.
  . En particulier, si K/k est séparable de type fini, c'est un module libre
   de rang n=tr.deg(K/k). Plus précisément, si f_1,...,f_n \in K, on a
    l'équivalence
    * (df_i) est une base de \Omega_K/k
    * Toutes les k-dérivations de K nulles sur les f_i sont nulles
    * f_i est une base de transcendance séparante de K/k
  . Si K = k(b=a^{1/p}) avec a\in k, k de car p, alors K/k est inséparable et
  \Omega_K/k est libre engendrée par db.
  . Si R/k est de type fini, \Omega_R/k=0 ssi R est une somme directe finie
  d'extensions de corps séparables /k.

Faisceaux cohérents
-------------------

Faisceaux localement libres de rang r <=> Vector bundle of rank r.

Nakayama: F cohérent sur X noeth, x\in X
(i) Si F|x \tens k(x)=0, alors il existe un ouvert U contenant x / F|U=0;
(ii) Si U est un ouvert contenant x et a_1,...,a_n des sections de F sur U
qui génèrent F|x \tens k(x), alors elles génèrent F|U_0 pour un ouvert
x\in U_0 \subset U.
(iii) e(x)=dim_k(x) (F|x \tens k(x)) est semi-continue sup; ie
{x/e(x)<=r} est ouvert, {x/e(x)>=r} est fermé.
De plus, si X réduit, alors F libre dans un ouvert contenant x <=> e est constante près de x.

Ex: si X irréductible noeth, O_X|x anneau de valuation discrète pour tout
x. Si F/X est cohérent, F=F_1 \somme F_2 avec F_1 loc libre et F_2 a pour
support un nombre fini de points fermés x_1,...,x_n, ie
F_2=\somme O_X|x_i / m_x_i^r_i

Cône tangent
------------

Définition: X/k de type fini sur k alg clos, x \in X point fermé. Le cône
tangent en x est Spec gr(O_X|x)

Interprétation: soit U un ouvert affine contenant x, et i:U->A^n une
immersion fermée envoyant x sur 0, i(U)=Spec k[X_1,...,X_n]/I. Si f est un
polynôme, lf(f) est la forme de degré dominant de f. Alors le cône tangent
est Spec k[X_1,...,X_n]/lf(I).

Example: si X=Var(f) \subset k[x,y] où f(x,y) est irréductible, f(0,0)=0.
lf(I)=lf(f)=\prod l_i^r_i où l_i forme linéaire; donc le cône tangent en
(0,0) est une union de lignes avec multiplicités.
- si f a un terme linéaire non nul: f=ax+by+f_2+f_3+termes plus haut degrés, le
  cône tangent est donné par ax+by=0, et l'origine est non singulière dans X.
- si f=f_2+f_3+termes de plus haut degré, avec f_2 produit de deux facteurs
  linéaires distincts, alors le cône tangent est donné par deux lignes avec
  mult 1; X a un "node" à l'origine.
- Si f_2=(ax+by)^2, alors le cône tangent est une ligne double; il y a
  plusieurs sous-cas suivant la puissance de t divisant f(bt,-at). Si
  f_3(b,-a) \ne 0, c'est divisible seulement par t^3, et on dit que X a une
  "cusp" à l'origine.

Example: si f(X_1,...,X_n) est un poly irréd / f(0,...,0)=0 et X=Var(f), le
cône tangent de X est généré par lf(f). Si lf(f) est linéaire, le cône
tangent est un hyperplan et on dit que X est non singulière à l'origine. Si
lf(f) est une forme quadratique non dégénérée, le cône tangent est un cône
quadratique et X a un double point ordinaire à l'origine.

Attention: lf((f_1,...,f_m)) peut être plus grand que (lf(f_1),...,lf(f_m)).

Prop: Si X est une variété de dimension r, le cône tangent de X en x est
purement de dimension r. En général, sup {dim Z, Z composante de X
contenant x}=sup {dim Z, Z composante du cône tangent de X en x}.

Blow-up
-------

Blow-up de 0 dans A^n: soit B_n la cloture dans A^n x P^{n-1} du graphe
\Gamma défini par le morphisme canonique A^n \ 0 -> P^{n-1}; soit q:B_n->A^n la
projection. Alors
- q est propre et birationnel
- q^-1(A^n \ 0) = \Gamma et q: \Gamma -> A^n \ 0 est un iso
- q^-1(0)=0 x P^{n-1} (le diviseur exceptionnel E_0)
Ie dans B_n on prend toutes les lignes passant par 0, et on les remplace
par leur union disjointe, ie pour chaque ligne on remplace l'origine par
une origine distincte.

Concrètement, B_n \inter (A^n x U_i) := B_n,i
  = Spec k[X_1,...,X_n,Y_1/Y_i,...,Y_n/Y_i]/(X_i Y_j/Y_j - X_j)
  = Spec k[X_i, X_1/X_i, ..., X_n/X_i] (en identifiant Y_j/Y_i avec X_j/X_i dans k(X_1,...,X_n)
B_n est donné par le recollement des B_n,i (qui sont iso à A^n) via
k[X_1,...,X_n] \subset k[X_i,X_1/X_i,...,X_n/X_i]; ie
(B_n,i)_{X_j/X_i}=Spec k[X_i,X_1/X_i,...,X_n/X_i,X_i/X_j]
                  Spec k[X_j,X_1/X_j,...,X_n/X_j,X_j/X_i]=(B_n,j)_{X_i/X_j}
Dans B_n,i, le diviseur exceptionnel E_0 est donné par Var(X_1,...,X_n), ie
E_0 \inter B_n,i=Spec k[X_1/X_i,...,X_n/X_i].

Th: Si x fermé dans X, le blow-up B_x(X) est un morphisme f:B_x(X)->X tel que
- f induit un iso B_x(X)-E ->X-{x} où E=f^-1(x) est le diviseur exceptionnel
- B_x(X) est séparé et f est propre
- pour tout y \in E, il y a un ouvert affine de y tel que l'idéal de
  E\inter Vdans \Gamma(V,O_B_x(X)) est égal à (f), pour un f non diviseur
  de 0.
- Si X est une variété de dim r>=1, B_x(X) est une variété de dim r, f est
  birationnelle et E est non vide et purement (r-1) dimensionnel.
  En général, si r=sup{dim Z, Z composante de X contenant x}>=1; alors
  * r=sup {dim Z, Z composante de B_x(X) rencontrant E}
  * r-1=sup {dim Z, Z composante de E}
- E est isomorphe au cône tangent projectivisé (ie la variété projective
  définie par lf(I), qui est un idéal homogène)

Concrètement, pour définir B_x(X) on prend U affine contenant x et i:U->A^n
immersion fermée / i(x)=0; i(U) définie par l'idéal I. B_x(X) est l'union
de X\{x} et de la cloture de q^-1 [i(U) \ 0] dans B_n. Plus précisément,
soit I_i* l'idéal de k[X_i,X_1/X_i,...,X_n/X_i] défini par les f / f*X_i^N
\in I pour N>>0. I_i* et I_j* induisent le même idéal dans B_n,i \inter
B_n,j, donc les I_i* définissent un idéal cohérent I*, et donc un fermé U*.
Alors B_x(X) est le recollement de U* et de X\{x} via leurs sous-ouverts
isomorphes U* \ (U* \inter E) et U \ {x} (isomorphes via la restriction de
la projection q de B_n)

Non singularité et différentielles
----------------------------------

Déf: soit X de type fini sur k alg clos, x point fermé. L'espace tangent
     T_x=hom_k(m_x/m_x^2,k).

Interprétation: Si U est un ouvert affine contenant x, et i une immersion
fermée de U dans A^n / U=Spec k[X_1,...,X_n]/I, T_x=Spec
k[X_1,...,X_n]/linear(I). Si I=(f_1,...,f_m), linear(I)=(linear(f_i))
linear(I) \subset lf(I) donc l'espace tangent contient le cône tangent, en
fait c'est l'espace linéaire engendré par le cône tangent.

Ex: Si X=Spec k[X_1,...,X_n]/(f_1,...,f_m), x=(a_1,...,a_n) alors
T_x est défini par les équations \sum \delta f_i/\delta X_j(a_1,...,a_n) X_j =0

Déf: x est non singulier dans X ssi cône tangent=espace tangent, ssi
l'application canonique Sym(m_x/m_x^2) -> gr(O_X|x) est un
isomorphisme.
Dans ce cas m_x^k/m_x^{k+1}=k-th symmetric power of m_x/m_x^2, ou de
manière équivalente si f(X_1,...,X_n) \in O_X|x[X_1,...,X_n] est homogène de
degré k et x_1,...,x_n \in m_x sont indépendants mod m_x^2, alors
f(x_1,...,x_n)\in m_x^{k+1} ssi tous les coefs de f sont dans m_x.

Prop: Si x est non singulier, O_X|x est intègre, et donc il existe un
voisinage ouvert de x irréductible. Plus précisément x est dans la cloture
d'un unique point associé de X, celui correspondant à (0) \subset O_X|x, et
si W est l'union des clotures des autres points associés, X\W est un ouvert
irréductible contenant x.
Donc x est non singulier => x n'appartient pas à deux composantes distinctes et
dim T_x = dim de la composante de x.

Prop: soit X une variété irréductible de dim n. Alors pour tous les points
fermés x, dim T_x >=n, avec dim T_x=n <=> x non singulier.

Cor: Si X=Spec k[X_1,...,X_n]/(f_1,...,f_m) de dimension N, alors pour tout
point fermé x=(a_1,...,a_n)
rank  \delta f_i/\delta X_j(a_1,...,a_n) X_j <= n-N,
avec égalité ssi x non singulier.

Cor: si X variété sur \C, x non singulier dans X ssi x non singulier dans
l'espace analytique correspondant à X.

Th: Soit X de type fini sur k, x point fermé. Alors l'espace tangent
T_x=hom_k(m_x/m_x^2,k) est isomorphe à
- L'espace des k-dérivations D: O_X|x -> k; ie
  D(fg)=f(x) Dg + g(x) Df.
- Hom_{O_X|x}(\Omega_X/k|x,k(x)) [=Hom_k(x)(\Omega_X/k(x),k(x)]
- Hom(k[\epsilon]/(\epsilon^2),X) d'image x.

Cor: Pour tout x\in X fermé, l'espace cotangent m_x/m_x^2 est isomorphe à
\Omega_X/k(x) = \Omega_X/k|x \tens_{O_X|x} k(x).
Cet isomorphisme envoie df (mod m_x \Omega_X/k|x) sur f-f(x) modulo m_x^2.
En particulier, l'espace cotangent en chaque x vient du faisceau cohérent
\Omega_X/k.

Soit d(x)=dim_{k(x)}(\Omega(x)). Par Nakayama, d(x) est semi continu
supérieurement. Si X est une variété de dim n,
d(point générique)=dim_k(X) (\Omega_k(X)/k)
                  =dim_k(X) (k-dérivations k(X)->k(X)
                  =n
Soit U={x/ d(x)=n}, alors U est l'ouvert dense maximal sur lequel
\Omega_X/k est localement libre. Si x fermé, d(x)=n <=> X non singulier;
donc pour x quelconque on définit x non singulier via d(x)=n <=> \Omega_X/k
loc libre autour de x.

Th: si X/k est une variété de dim n, l'ensemble des points non singuliers
est un ouvert dense de X sur lequel \Omega_X/k est un O_X-module localement
libre de rang n.

Ex: Si X est non-singulière, \Omega_X/k est loc libre, il correspond au
fibré cotangent.

Prop: X/k variété
- si X non singulier en x, Y non singulier en y, XxY non singulier en (x,y).
- Si x est non fermé, \Omega_X/k(x) a une filtration donnée par \Omega_0={
  espace des df, f \in m_x} avec
  * \Omega_0=m_x/m_x^2 via df = f mod m_x^2 pour f \in m_x
  * \Omega_X/k(x)/\Omega_0=\Omega_k(x)/k via df (mod \Omega_0) = dg où g
    est l'image de f \in O_X|x dans k(x).
  En particulier, x est non singulier ssi dim(m_x/m_x^2)=codim(x) ssi O_X|x
  est un anneau régulier.
Attention: sur un corps non parfait, non singularité != régularité.

Déf: soit f:X->Y schémas de type finis sur k, x point fermé de X, y=f(x).
Via f*:O_Y|y -> O_X|x on obtient m_y/m_y^2->m_x/m_x^2 d'où
df_x:T_x,X -> T_y,Y.
Inversement (x pas forcément fermé), on a \Omega_Y/k|y -> \Omega_X/k|x d'où
df*_x: \Omega_X(x)->\Omega_Y(y).
(Si x fermé, \Omega_X(x) et \Omega_Y(y) sont les duaux de T_x,X et T_y,Y,
et df*_x est la transposée de df_x).

Ex: soit Y un schéma fermé de X. Alors pour tout y\in Y, f*: O_X|x->O_Y|x
est une surjection de noyau I|x, d'où \Omega_Y(x) est le quotient de
\Omega_X(x) par \Sum_{f \in I|x) df k(x). Inversement, df_x donne une
injection T_x,Y -> T_x,X telle que l'image est orthogonale aux
différentielles df pour f \in I|x.

Ex: soit H une hypersurface de P^n. Comme P^n est non singulier et
\Omega_H(x) est un quotient de \Omega_P^n(x), on a:
- d_H(x)=n-1 si x non singulier dans H
- d_H(x)=n sinon.

Interprétation de T=k[\epsilon]/(\epsilon^2). T a un espace tangent de
dimension 1, dont le générateur canonique est donné par (\epsilon)->k,
\alpha \epsilon -> \alpha.
Si X=Spec k[X_1,...,X_n]/(f_1,...,f_m) et x=(0,...,0), alors T_x,A^n est
donné par l'ensemble des morphismes f:T->A^n d'image x; un tel morphisme est
déterminé par le n-uplet (\alpha_i) tel que f^*(X_i)=\alpha_i \epsilon.
T_x,X est le sous-espace de T_x,A^n tel que f se factorise à travers X, ie
f*(g_j)=0. Mais f*(h)=h(x)+\sum \alpha_j \delta h/\delta X_j (x) \epsilon;
donc f se factorise par X ssi \sum delta g_i/\delta X_j(x) \alpha_j=0; on
retrouve les équations définissant T_x,X dans T_x,A^n.

Rem: si X est non singulier, localement X est défini par le zéro de
fonctions dont les différentielles sont suffisamment indépendantes. En fait
si X \subset A^n est non singulier de dim N et si f_1,...,f_{n-N} sont des
fonctions s'annulant sur X et de différentielles indépendantes, alors
Var(f_i) est exactement X (plus des composantes disjointes de X).
En effet, d'après le th suivant Var(f_i) est de dimension N et contient X,
donc X est une composante irréd de Var(f_i).

Th: soit X une variété non singulière, Y \subset X schéma fermé et x\in Y.
Alors x est non singulier dans Y ss'il existe un ouvert affine U\subset X
et des sections f_1,...,f_k de R=O_X(U)/
- Y \inter U = Spec R/(f_1,...,f_k)
- df_1,...,df_k sont indépendantes dans \Omega_X/k(x).
Dans ce cas, dim Y=dim X-k.

Cor: soit X=Spec(R) une variété affine non singulière; f \in R / df(x) \in
\Omega_X(x) est non nulle pour tout x. Alors Y=R/(f) est un sous-schéma
fermé, union disjointe de sous-variétés non singulières de dim n-1.

Morphismes étales
-----------------

Dans une variété différentielle, le th des fonctions implicites dit que si
f_1,...,f_k sont des fonctions diff autour de x \in R^{n+k} avec
dét_{i,j <=k} \delta f_i/\delta X_j(x) \ne 0
alors la projection Var(f_i) -> R^n, (x_1,...,x_{n+k}) -> (x_{k+1},...,x_{n+k})
est localement un iso près de x.

Pour des variétés alg, ce n'est plus le cas, on dit que de tels morphismes
sont étales.

Déf: f:X->Y morphisme de type fini est étale si f est plat et les fibres
géométriques sont composées d'un nombre fini de points réduits. (cf $10)

Interprétation:
- Si X=Spec R[X_1,...,X_n]/(f_1,...,f_n) et Y=Spec R avec
dét \delta f_i/ \delta X_j(x) \ne 0 alors f est étale en x.
- Plus généralement, si f: X->Y est de type fini, il est étale en x ssi il
  y a un ouvert affine x\in U et un ouvert affine f(x) \in V tels que
  f(U)\subset V tel que f|U vient d'un morphisme du type précédent (ie U
  immersion ouverte dans R[X_1,...,X_n]/(f_1,...,f_n), V immersion ouverte
  dans R et dét \delta f_i/ \delta X_j(x) \ne 0).

Ex: X/k (k corps) est étale ssi X est l'union finie de points x_i=Spec(k_i)
avec k_i/k extension algébrique finie et séparable.

Prop:
- f est étale ssi \Omega_X/Y=0 [Update: Plus exactement \Omega_X/Y=0
  implique X->Y est unramified. Si f est de la forme canonique
  R[X_1,...,X_n]/(f_1,...,f_m), \Omega_X/Y=0 ssi rank de la Jacobienne est
  n. Dans ce cas f est non ramifié. Si m=n alors de plus f est plat, donc f
  est bien étale.]
- le pullback d'un morphisme étale est étale. En particulier les fibres
  d'un point y sont données par un nombre fini d'extensions alg
  finies séparables de k(y).
  (ou de manière équivalente les fibres géométriques sont données par un
  nombre fini de points réduits)
- Pour tout x \in X, on a m_x \subset O_X|x = f*(m_{f(x)}) O_X|x;
  et k(x) est fini séparable sur k(f(x)).
- Si X et Y sont des variétés/k, alors f est dominant, et k(X) est une
  extension finie et séparable de k(Y).

Pour un anneau local complet, étale = iso local:
Th: Soit f: X->Y un morphisme de type fini, Y local complet de point fermé
y. Soit x \in X / f(x)=y et k(y) \iso k(x). Alors f étale près de x => f
iso local près de x.

Vient du Lemme de Hensel: soit (O,m) un anneau local complet, f_1,...,f_n
\in O[X_1,...,X_n]. Soit (a_1,...,a_n) \in O une solution mod m,
f_i(a_1,...,a_n)=0; tel que de plus
det \delta f_i/\delta X_j (a_1,...,a_n) \ne 0.
Alors il existe (b_1,...,b_n) congru aux a_i mod m solution:
f_i(b_1,...,b_n)=0.

Th: Soit f:X->Y un morphisme de type fini de schémas noethériens; y=f(x) et
k(y) \iso k(x). Alors f est étale près de x ssi la complétion
\hat{f*|x}: ô|y -> ô|x est un iso.

Preuve: 
| L'application => vient de: si f:(A,m)->(B,n) morphisme local et
| g:(B,n)->(^A,^m) local tel que n=f(m)B alors ^f:^A->^B est un iso.
| 
| L'application <= vient de:
| on vérifie que f*(m_y)O_X|x = m_x. Comme k(x)/k(y) est séparable (en
| l'occurence par hypothèse k(x)=k(y)), on a
| \Omega_fibre(y)/y = 0 en x.
| Mais \Omega_fibre(y)/y|x = Omega_X/Y|x \tens_O_Y,y k(y)
| donc par Nakayma \Omega_X/Y)|x=0.
| Autrement dit, si Y=Spec R et qu'on plonge un ouvert x \in U de X dans
| A^n_R donné par un idéal I, comme 0=\Omega_X/Y|x = \sum dX_i / \sum_{f \in
| I} df; il existe n fonctions f_i dans I tels que \delta f_i/\delta X_j soit
| inversible. Si X* est le schéma défini par les X, on a X \subset X* et X*/Y
| est étale en x.
| Mumford conclut que l'égalité sur le complété implique que X=X* près de x;
| je me demande à quoi ressemble X* dans le cas général (ie on suppose juste
| la fibre réduite).

Cor: f:X->Y morphisme de variétés.
- f est étale ssi \hat{f*|x}: ô|f(x) -> ô|x est un iso pour tout x \in X.
Dans ce cas, df_x est un iso de T_x,X -> T_y,Y qui envoie le cône tangent
en x isomorphiquement sur le cône tangent en y.
En particulier, x est non singulier ssi y=f(x) l'est.
- Si X et Y sont des variétés sur \C, f est étale ssi le morphisme
  analytique induit est localement (pour la topologie complexe) un iso.
- Si X et Y sont des variétés de dim n non singulières alors
  f étale <=> pour tout y \in Y point fermé, la fibre est union finie de
  points réduits
  (ou de manière équivalente, pour tout x \in X fermé, m_x=f*(m_y) O|x)

Systèmes de paramètres uniformisants
------------------------------------

Dans une variété différentielle de dim n, il existe un recouvrement
d'ouverts isomorphes à R^n. Dans le cas algébrique, la version équivalente
est pour une variété non singulière V de trouver un recouvrement par des
ouverts U / il existe n fonctions f_1,...,f_n régulières sur U / le
morphisme induit U->A^n est étale.

Th: X/k (alg clos) variété de dim n non singulière, f_1,...,f_n sections
sur un ouvert U. Alors f_1,...f_n forment un syst de param unif si on a
une des conditions équivalentes:
- Le morphisme induit par f_1x...xf_n: U->A^n est étale
- Pour tout point fermé x \in U, df_i(x)=f_i-f_i(x) génère m_x/m_x^2
- Pour tout point fermé x \in U, l'application
  k[[T_1,...,T_n]]->ô|x envoyant T_i sur df_i(x) est un isomorphisme
- \Omega_X/k|U = \somme df_i O_X

Prop:
- Comme \Omega_X/k est loc libre de rang n, tout x \in X a un syst de
param unif pour un ouvert x \in U.
- f_1,...,f_n \in k(X) sont un syst de paramètre unif. pour un ouvert U ssi
  df_1,...,df_n génèrent \Omega_k(X)/k

Ex: X: y^2(1-x^2)=1 (car k \ne 2)
Omega_X/k=<dx,dy>/(2y(1-x^2)dy-2y^2xdx=0)
- On a dy=xy^3dx donc dx génère Omega_X/k, x param unif pour tout X et la
  projection sur l'axe des x est étale.
- dy génère \Omega seulement quand x \ne 0, et donc la projection sur l'axe
  des y est étale seulement sur X\{(0,1),(0,-1)}.

On peut généraliser le critère Jacobien, si f_i syst de param unif pour U
et g_1,...,g_n régulières sur U, alors
\delta g_i/\delta f_i = dét (a_ij) où dg_j=\sum a_ij df_i.

Prop: soit f:X->Y un morphisme de variétés non singulières de dim n,
y=f(x), f_1,...,f_n syst de parm unif près de x, g_1,...,g_n syst de param
unif près de y. Alors f est étale près de x ssi
\delta(f* g_i)/\delta f_i(x) \ne 0

Prop: Si X variété non singulière de dim n, f_1,...,f_n syst de param unif
pour un ouvert U. Alors il existe un ouvert V \subset UxU contenant la
diagonale \Delta(U) tel que l'idéal définissant le sous-schéma fermé
\Delta(U) \subset V soit engendré par f_i \tens 1 - 1 \tens f_i \in
\Gamma(UxU).

Cor: Si X variété non singulière de dim n, Y et Z fermés irréductibles de
X, alors toute composante W de Y \inter Z satisfait
dim W >= dim Y+dim Z-n
(ie codim W<=codim Y+codim Z)
Si de plus il y a égalité, on dit que Y et Z s'intersectent proprement.

Non singularité et anneaux factoriels
-------------------------------------

Th: Soit X une variété non singulière. Alors pour tout x, O_X|x est
factoriel. De manière équivalente: pour tout fermé irréductible Z de
codimension 1, il existe un recouvrement affine de X par des ouverts U_i et
des fonctions f_i \in O_X(U_i) telles que I(Z \inter U_i)=(f_i).

==
Pr: l'équivalence vient du fait qu'un anneau est factoriel ssi ses idéaux
minimaux sont principaux, or les idéaux minimaux de O_X|x correspondent aux
fermés irréductibles Z de codimension 1 contenant x.
O_X|x étant régulier (car x est non singulier), c'est un anneau factoriel
via la preuve cohomologique d'Auslander et Buchsbaum. Ici Mumford donne deux
preuves, une projective, l'autre utilisant les complétions.
Rem: si Z est non singulier, il est immédiat que Z est donné localement par
une fonction (prendre une fonction f telle que localement en x
\Omega_Z/k=\Omega_Y/k / df).

Preuve par complétion:
- R intègre noéthérien. R est factoriel ssi pour tout f,g \in R\{0},
  l'idéal (f:g) est principal.
- Si O est noéthérien local tel que ^O est factoriel, alors O est factoriel.
- Comme x est non singulier, ^O_X|x=k[[t_1,...,t_n]] est factoriel, donc
  O_X|x est factoriel.

Preuve par projections:

Th: Soit X une variété de dim n et x \in X un point non singulier.
Alors il existe un ouvert x \in U et une hypersurface irréductible H
\subset P^{n+1} tel que U soit isomorphe avec un ouvert de H.

|Pr: On remplace X par un ouvert affine contenant x, cet ouvert se plonge dans
|A^N, et en remplaçant X par la clôture de X dans P^N on peut supposer que X
|est une variété projective.
|On projette en dehors d'un sous-espace linéaire L bien choisi, en utilisant le
|lemme suivant:
|
|Lemme: Soit f: X->Y un morphisme fini de schémas noéth. Si f^-1(y) est un
|point réduit Spec k(y) alors il existe un ouvert y \in U tel que
|f^-1(U)->U soit une immersion fermée.
|
|On veut donc choisir L tel que la projection p associée vérifie
|1) {x}=p^-1 p(x) et 2) m_x,X = p*(m_p(x),H) O_X|x
|Mais p^-1 p(x) = Join(L,x) donc 1) signifie Join(L,x)\inter X={x}
|2) signifie dp_x: T_x,X -> T_p(x),P^{n+1} est injective.
|Autrement dit, T_x,X \subset P^{n+1} est disjoint de L.
|
|Lemme: soit S \subset P^N un fermé dans les composantes sont de dim <=k. Il
|existe un espace linéaire L d e dim N-k-1 disjoint de S.

Prop: Inversement, si x \in X variété, x \in Z fermé de codimension 1 / x
non singulier dans Z et tel que I(Z)|x est principal dans O_X|x, alors x
est non singulier dans X.

Lemme (Nagata): Soit R un anneau intègre noeth, x \in R premier.
Si R[1/x] est factoriel, R est factoriel.

Variétés normales et normalisation
----------------------------------

Déf: X variété. x \in X est normal si O_X|x est intégralement clos dans
k(X). X est normal si tous les points sont normaux.

Ex:
- x non singulier => factoriel => x normal
- Si X normal, U ouvert affine, alors O_X(U) int clos dans k(X)
[Pr: si U=Spec(R), R=\intersection R_p, p idéaux premiers donc R est
l'intersection d'anneaux int clos donc R est int clos]

Th: R noeth intègre. Alors
R int clos <=> (i) R = \intersection R_p, p premiers minimaux
             + (ii) R_p est un anneau de valuation discrète pour tout p
             premier minimal

Cor: si X normale, Z sous-variété de codim 1 et de point générique z, alors
O_X|z est un anneau de valuation discrète, et la valuation ord_Z(f) donne
la multiplicité du zéro ou du pôle de f en Z.

Cor: Si X est de dim 1, X non singulier <=> X factoriel <=> X normal.

Prop: On dit que X est non singulier en codimension 1 ssi S \subset X l'ens
des points singuliers, alors codim_X(S)>=2.
- Non singulier en codim 1 <=> O_X|x anneau de valuation discrète pour p de
  codimension 1.
- si X est normal, X est non singulier en codim 1.
- Si X est une hypersurface de A^n, alors X non singulier en codim 1 <=> X
  normal.

Résumé: X non singulier en codim 1 <= X normale <= X factorielle <= X non
singulière.

Déf: si X est une variété et L une extension finie de k(X), la
normalisation de X dans L est la variété Y avec L=k(Y) et un morphisme
surjectif fini f:Y->X tel que f*:k(X)->k(Y) est l'inclusion k(X)->L.
(Y existe toujours et est unique à isomorphisme près.)

Prop: Si X est une variété, {x | x est normal dans X} est ouvert.

Th: La normalisation d'une variété projective est projective.

Th: Si K/k est de degré de transcendance 1, il existe un unique modèle
complet non singulier C/k tel que k(C)=K. C est une courbe projective.

Prop: Si X est une variété projective normale de dim n, X est la
normalisation d'une hypersurface H \subset P^{n+1}.

Zariski's main theorem
----------------------

Branches d'une varité:
soit X une variété complexe, x \in X un point fermé, S \subset X le lieu
singulier, x \in U un ouvert régulier et petit pour la topologie complexe.
U \ U\inter S = V_1 \union ... \union V_n (composantes)
Les branches de X en x sont les clotures des V_i.

Algébriquement, si f:Y->X est un morphisme birationnel et quasi-fini, alors
si f^-1(x)={x_1,...,x_n} et pour un ouvert x \in U complexe suffisamment
petit on a f^-1(U)=U_1 \union ... \union U_n, avec U_i un voisinage de x_i.
Alors \adhérence f(U_i) est une union de branches de x, autrement dit on
partitionne les branches de X en x en n parties, chaque partie venant d'une
des branches de Y en un x_i.

Si f:Y->X est la normalisation de X, S le lieu singulier de X et
S'=f^-1(S), f induit un iso Y \ S' ->X \ S. Donc U \ U\inter S est
homéomorphe à l'union disjointe des U_i \ U_i \inter S'. Le Main Theorem de
Zariski dit que si Y est normal, Y n'a qu'une seule branche en chaque
point. Par ce qui précède, les branches de X en x sont donc en bijection
avec la préimage de x dans la normalisation.

Th (Zariski's main theorem)
1) Forme originelle:
   Soit X/k une variété normale et f:Y->X un morphisme birationnel
   quasi-fini. Alors f est une immersion ouverte (ie f induit un iso avec un
   ouvert de X).
[Rem: si de plus f propre, alors f est un iso.]
2) Forme topologique:
   Soit X une variété complexe normale, x \in X un point fermé, S le lieu
   singulier. Alors il existe une base U_j de voisinages complexes de x
   telle que U_j \ U_j \inter S et connexe, pour tout j.
   (ie X a une seule branche en x)
3) Forme série entière:
   Soit X/k une variété normale et x \in X un point normal (pas
   nécessairement fermé). La completion ^O_X|x est intègre, intégralement
   clos dans son corps de fraction.
4) Forme de Grothendieck:
   Soit f:Y->X un morphisme quasi-fini de variétés sur k.
   Alors il existe une immersion ouvert Y \subset Y' dans une variété Y'
   telle que f se prolonge en un morphisme fini g:Y'->X.
[Rem: Stack Project 33.31.7: Si f:Y->X est quasi fini, alors il existe un
ouvert U de X tel que f^-1(U)->U soit fini]
5) Théoreme de connexité:
   Soit X/k une variété, x \in X un point fermé normal.
   Soit f:Y->X un morphisme birationnel propre. Alors f^-1(x) est connexe
   (pour la topo de Zariski).

Cor: Un morphisme bijectif birationnel entre variétés normales et un
isomorphisme.

Si X est factorielle, on a une version plus forte de 1):
Prop: soit X une variété factorielle de dim n, et f:Y->X un morphisme
birationnel. Alors il existe un ouvert non vide U \subset X tel que
1) f: f^-1(U) -> U est un iso
2) Si E_1,...,E_k sont les composantes de Y \ f^-1(U) alors
dim E_i = n-1 et dim \adhérence f(E_i) <= n-2.
(Les blowup sont un exemple typique)

La preuve de 3) => 1) utilise le lemme suivant:
Lemme:
- si O est un anneau local, dim O=dim ^O
- si (O,m) est un anneau local complet, M un O-module tel que
  * \intersection m^n M=(0)
  * M/mM est fini sur O/m
  Alors M est fini sur O.

Morphismes plats et lisses
--------------------------

Rappels sur la platitude:
1) La platitude se conserve par pullback: si M/R est plat et S est une
   R-algèbre, alors M \tens_R S/S est plat
2) M/R est plat ssi chaque localisé M_P/R_P est plat
2') Si M est un S-module, S une R-algèbre via i:R->S, alors
    M/R plat ssi M_P/R_{i^-1(P)} est plat pour tout idéal premier P de S.
3) Si M/R plat avec R local et (M de présentation finie ou R artinien),
   alors M est libre.
4) Si R intègre, M/R plat => M sans torsion. Plus généralement les non
   diviseurs de 0 de R sont non diviseurs de 0 dans M. Réciproquement, si R
   est un anneau de valuation (ou un anneau de Dedekind), M/R est plat ssi
   M est sans torsion.
5) M S-module, S R-algèbre. Soit f \in S tel que la multiplication par f
   dans M/mM soit injective pour tout idéal maximal m de R.
   Alors M plat sur R => M/fM plat sur R.
6) Si O est un anneau local, sa complétion ^O est plate sur O.

Déf: f:X->Y morphisme, F O_X-module quasi cohérent. F est plat sur O_Y ssi
F|x est plat sur O_Y|f(x) pour tout x \in X. f est plat si O_X est plat sur
O_Y.

Transposition géométrique:
1*) Soit f':X'->Y' le pullback de f:X->Y. F O_X-module quasi-cohérent plat
sur O_Y, alors le pullback F' est plat sur O_Y'.
En particulier, si f est plat f' est plat.
2*) f: Spec S -> Spec R, F=module quasi cohérent associé à M. F est plat
sur O_Spec R ssi M est plat sur R.
3*) X schéma noeth, F cohérent sur O_X. Alors F est plat sur O_X ssi F est
localement libre.
4*) Soit f: X-> Y un morphisme. Supposons Y intègre (ie irréd + réduit).
F O_X-module quasi-cohérent plat sur O_Y. Alors
pour tout x \in X, F|x est sans-torsion sur O_Y|f(x).
Si X est noéthérien, ça veut dire que tous les points associés de F sont
au-dessus du point générique de Y.
Réciproquement, si c'est le cas et les germes O_Y|y sont des anneaux de
valuations (ex Y courbe non singulière ou anneau de Dedeking), alors F est
plat sur O_Y.

Cor: si f:X->Y est un morphisme plat de variétés. Alors
- f est dominante
- Toutes les fibres sont de dim la dim générique.
Si f:X->Y est un morphisme de variété, il existe un ouvert U non vide de Y /
f^-1(U)->U est plat.

Intuitivement, plat = les fibres sont "continues".
Or si f est continue sur U dense dans X, il existe au plus une seule
extension continue de f à X. L'analogue pour plat est:

Prop: Soit g: Z->Spec R un morphisme, X_1,X_2 deux sous-schémas de Z. Si
(1) il existe f \in R non diviseur de 0 / X_1=X_2 sur Spec R_f
(2) g|X_i -> Spec R sont plats
Alors X_1=X_2.

Ex: le chapitre "Spécialisation" montre que si R est un anneau de
valuation, donné X' \subset g^-1(Spec R_f) il existe un unique schéma fermé
X \subset Z contenant X' est plat sur R. Autrement dit dans ce cas on a
existence en plus de l'unicité.

Prop: Soit f_1:X_1 -> Y et f_2:X_2->Y et g:X_1->X_2 immersion fermée
faisant commuter le diagramme, X_2 noeth. Alors si f_1 est plat et que pour
un x \in X_1 les fibres géométriques de f_1 et f_2 au-dessus de f(x) sont
égales (autour d'un point géométrique x' au-dessus de x); alors X_1=X_2
autour de x.

Ex: une famille d'hypersurfaces est plate.

Prop: Soit f:X->Y un morphisme fini, Y noeth. Alors f est plat ssi f_*(O_X)
est localement libre sur O_Y. Si de plus Y est intègre, f est plat ssi
dim_k(y) (f_*(O_X) \tens_O_Y|y k(y)) est constante.

Rem: soit f:X->Y un morphisme fini, Y intègre noeth. Soit Y_0 \subset Y le
lieu où f_*(O_X) est localement libre. f: f^-1(Y_0)->Y_0 est plat.
Pour y \in Y_0, il existe un voisinage U=Spec Rde y tel que f soit de la forme
Spec S->Spec R, avec S/R libre. Le discriminant de S/R est
dét(Tr(a_i a_j)) pour une base a_i de S/R.
On note d(y) le discriminant de la k(y)-algèbre finie "fibre spécialisée en
y": f_*(O_X)|y \tens k(y).
d(y) \ne 0 ssi la fibre f^-1(y) est union fini d'extensions séparables de k(y)
Ceci défini un ouvert Y_1 \subset Y_0, où les fibres géométriques sont
réduites.
On dit que Y\Y_1 est le "branch locus" de f, et y \in Y\Y_1 sont les points
de ramification.
Y_1 est le plus grand ouvert tel que f: f^-1(Y_1)->Y_1 soit étale.

Déf: f morphisme lisse de dimension relative k (si k=0 ce sont les
morphismes étales):
- Si X=Spec R[X_1,...,X_{n+k}]/(f_1,...,f_n) et Y=Spec R avec
rang \delta f_i/ \delta X_j(x) = n alors f est lisse de dim relative k en x.
- Plus généralement, si f: X->Y est de type fini, il est lisse de dim
  relative k en x ssi il
  y a un ouvert affine x\in U et un ouvert affine f(x) \in V tels que
  f(U)\subset V et f|U vient d'un morphisme du type précédent (ie U
  immersion ouverte dans R[X_1,...,X_n]/(f_1,...,f_n), V immersion ouverte
  dans R).

Th: Soit f:X->Y un morphisme de type fini. f est lisse de dim relative k
ssi f est plat et les fibres géométriques sont des unions disjointes de
variétés non singulières de dim k.

Ex: si f:X->Y est un morphisme birationnel plat de variétés, f est une
immersion ouverte.
