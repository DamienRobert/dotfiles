vim: ft=markdownlight fdm=expr

Normalisation de Noether
========================

Cas d'un corps:
https://stacks.math.columbia.edu/tag/00OY
Let k be a field. Let S=k[x1,…,xn]/I for some ideal I. If I≠(1), there exist r≥0, and y1,…,yr∈k[x1,…,xn] such that (a) the map k[y1,…,yr]→S is injective, and (b) the map k[y1,…,yr]→S is finite. In this case the integer r is the dimension of S.

Généralisation:
https://stacks.math.columbia.edu/tag/00QE (ou EGA IV.13.3.1.1)
Let R→S be a finite type ring map. Let q⊂S be a prime. Suppose that
dim_q(S/R)=n (dim_q(S/R) est la dimension de la fibre contenant q). There
exists a g∈S, g∉q such that S_g is quasi-finite over a polynomial algebra
R[t1,…,tn]. 

Si de plus f est équidimensionel en x de card n, alors le morphisme
quasi-fini U->Y[T1,...,Tn] déduit est dominant (et réciproquement).
Cf EGA IV.13.3.1

Interprétation géométrique: https://mathoverflow.net/questions/42276/noethers-normalization-lemma-over-a-ring-a

- The geometric interpretation of Noether's normalization lemma is that any
  affine algebraic variety has a finite surjective morphism to the affine
  space A^d_k of dimension d=dimX. 

- When k is an integral domain, and X dominates Spec(k), the finite
  surjective morphism of the generic fiber of X to A^d_K, where K=Frac(k)
  extends to a finite surjective morphism X_V→A^d_V for some dense open
  subset V of Spec(k). This is the geometric interpretation of the
  statement in M. Hochster's note in Harry Gindi's post.
  http://www.math.lsa.umich.edu/~hochster/615W10/supNoeth.pdf

- In general, such a morphism can not exist because it would imply that the
  fibers of X→Spec(k) all have the same dimension.
  Suppose that this condition is satisfied: the fibers of X→Spec(k) all
  have the same dimension d. Then I think that a reasonable statement
  (Noether's normalization lemma over a ring k) would be: there exists a
  quasi-finite and surjective morphism X→A^d_k. If k is noetherian, then by
  Zariski's Main Theorem, this implies that X is an open subscheme of
  scheme which is finite surjective over A^d_k. In general one can not expect
  better result than quasi-finite (consider the case d=0).
  The above "reasonable statement" should be easy to prove when k is a
  local ring. 

  Note: EGA IV.13.3.1 montre que c'est vrai quitte à localiser X autour de x
  (x étant équidimensionnel), mais le commentaire mathoverflow de Al-Amrani
  montre que c'est faux en général si on ne localise pas.

Anneaux
=======

Systèmes de paramètres
----------------------

Si I=(x_1,...,x_m) alors codim I <=m (et même si P minimal sur I, codim P<=m);
réciproquement, si P premier de codim m, alors il existe x_1,...,x_m tel
que P soit minimal sur I=(x_1,...,x_m)

Séquences régulières
--------------------
{x_1,...,x_m} \subset I idéal strict de R est régulière si
x_i est non diviseur de zéro sur R/(x_1,...,x_{i-1})

depth(I)=longueur d'une (=de toutes) séquence régulière maximale

Prop: Si R local et depth I=(x_1,...,x_m)=m, alors x_1,...,x_m est
régulière.

Th: depth(I)<=codim(I)
    (et même <= tout chaine maximale qui va d'un premier minimal au dessus
    de I à un idéal associé)
Cor: si depth I=(x_1,...,x_m)=m, alors codim I=m

Si (R,m) local, {x_1,...,x_n} \subset m, alors
dim R/(x_1,...,x_n)>=dim R - n
Si x_i régulière, il y a égalité.

Déf: (R,m) régulier si dim R = dim m/m^2.

Prop: (R,m) régulier => R intégral, et donc si R de dim d et (x1,...,xd)
générateurs de m, les x_i forment une séquence régulière.

Corollaire: (R,m) régulier ssi depth(m)=dim R = codim m; et dans ce cas toute
base de m/m^2 est une séquence régulière de longueur dim R.

Intersection complète
---------------------

S est intersection complète si S=R/I où R est régulier et I engendré par
une séquence régulière. S est alors Cohen-Macauley.

Prop: Si S est intersection complète, alors pour toute surjection R->>S avec R
régulier, le noyau I est engendré par une séquence régulière.

Ex:
- les variétés lisses sont localement intersection complètes
(car localement ce sont des anneaux réguliers; si on les plonge dans un
espace vectoriel affine, l'idéal de définition est localement engendré par
un suite régulière par ce qui précède)

Si I=(x_1,...,x_n) alors depth I<=codim I<=n.
Si R est Cohen-Macauley, alors depth I=codim I et s'il
y a égalité codim I=n, alors x_1,...,x_n est régulière.

Ex: Si S est factoriel, idéal de codimension 1=idéal principal, donc
toutes les hypersurfaces sont engendrées par un élément.

Dimensions
----------

Th de la fibre: (R,m)->(S,n) morphisme local
dim S<=dim S/mS+ dim R; avec égalité si going down (ex: S/R plat)

Rem: On a toujours codim_S mS <= codim_R m (regarder les systèmes de
paramètres), ce qui donne l'interprétation géométrique ci-après pour les
variétés. *Attention*: codim_S mS n'est pas égal à dim S_m!

Th d'altitude de Nagata:
R \subset T anneau intègres, T/R de type fini.
Alors dim T_p <= dim R_p + dim fibre générique.
Si R univ caténaire et p est dans l'image de Spec T, on a égalité, et même
pour tout Q maximal dans la préimage de p:
dim T_Q=dim R_p + dim fibre générique

Si Q premier dans T au-dessus de p, on a toujours
dim T_Q+dim T_P/QT_P <= dim R_p + dim fibre générique
(car le terme de gauche est <= dim T_P).
Mais si R est univ caténaire, on a égalité.

Rem: dim fibre générique=deg tr_R(T)
     dim T_P/QT_P = deg tr_{R/P}(T/Q)

Passage à un idéal max:
----------------------

Si Q \subset R est un premier minimal et les idéaux maximaux sont denses,
alors par prime avoidance il existe P dans R maximal tel que le seul idéal
minimal de R_P soit Q_P.

Interprétation géométrique
--------------------------

Soit f:Y->X un morphisme de schémas, W \subset X irréductible, Z une
composante irréductible de f^-1(W) dominant W.
Alors dim Z >= dim W + dim fibre générique (=dim Y-dim X)
            (= si f(Z) rencontre un certain ouvert, par platitude générique)

Joujou avec les fibres
----------------------
(cf plus bas où ce passage est mieux expliqué)

S/R de types finis, R univ caténaire, Sp/pSp non vide.

1) Q idéal max de Sp/pSp, on a (th de la fibre):
dim S_Q/pS_Q >= dim S_Q - dim R_p (= si plat)

Or dim S_Q-dim R_p= dim fibre générique (th d'altitude)
Donc dim S_Q/p S_Q>= dim fibre générique (= si plat)
(rem: ça se voit aussi via la semi continuité supérieure de dim f^-1 o f)

Si de plus les points fermés sont denses, Q_0 premier minimal de S_p/pS_p,
par la prop précédente il existe Q max, dim S_p/Q_0 S_p = dim S_Q/pS_Q
Donc dim S_p/Q_0 S_p >= dim fibre générique (= si plat, on retrouve que
toutes les composantes des fibres sont de dim la dim générique pour un
morphisme plat)

2) de plus, dans l'extension R/pR - S/Q_0 S, on a
dim S/Q_0 S = dim R/pR+ dim fibre générique de cette extension (pour une variété
ou une ext CM)
     = dim S_p/Q_0S_p + dim R/pR
D'où dim S/Q_0 S = dim R/pR + dim S_p/Q_0 S_p
                 >= dimfibre générique + dim R/pR (= si plat)

3) dim S/pS c'est le max des dim des composantes de f^-1(pbar)=Q_0 \union
... Q_i
dim S_p/pS_p c'est le max des composantes de f^-1(p), ie c'est le max des
dimensions des fibres génériques des composantes précédentes

Si R et S sont des variétés, dim S/Q_i=dim R/pR + dim fibre générique en
Q_i (=dim S_p/Q_i Sp)
Donc  dim S/pS=dim S_p/pS_p + dim R/pR

Rappel: si f:Y->X, la fonction n(y)=dim f^-1(f(y)) est semi-cont
supérieurement.
ie: y/n(y)>=d est fermé
ie: si q se spécialise en p, n(p)>=n(q)

Examples
--------

1) Projection de l'hyperbole: la fibre gén est de dim 0, mais la fibre en 0
   est vide (le th de dim ne s'applique que si la fibre est non vide).
   C'est plat.

2) (x,y)->(xy,y). Dim fibre générique: 0, mais en (0,0) on a une droite:
   saut de dimension. Ce n'est pas plat.

3) Un exemple ou le going down fails:
soit X un plan que l'on replie sur lui même entre deux droites A et B.
Soit W une courbe dans X, qui intersecte A en Z0 et B en Z'0.
Soit Z le point Z'0 mis sur A, et Z' le point Z0 mis sur B.
Alors f^-1(f(W)) a pour composantes W, Z et Z' (dim 1, 0, 0)
Aucune composante contenant Z ne s'envoit dans f(W) de manière dense, donc
pas de going down, donc ce n'est pas plat (ce qui se voit aussi car les
composantes ne sont pas équidimensionnelles)

4) Si je combine 2) et 3), en repliant la droite verticale passant par 1 sur (0,0), on a que f^-1(0,0)=Oy \union 1.
Les composantes irréd sont de dim != 1.


5) Si P est un idéal premier (pas forcément maximal) dans un anneau local R,
et R->S est locale, alors si R est régulier on a codim PS <= codim P, mais
ce n'est plus vrai dans le cas général. Ex (Exo 10.6 - Eisenbud):
R=k[x,y,z,t]/(xs-yt), S=R/(x,y), P=(s,t) \subset R.
codim P = 1 mais codim PS=2.
(two planes in 4-space meeting in a point lie on the cone over a quadric
surface)

Variétés
========

Systèmes de paramètres
----------------------
Si Y est une composante irréductible de Var(f_1,...,f_r), alors codim Y<=r.

Inversement, si X est une variété affine, et codim Y=r, alors il existe
- Une chaine Y=Y_r \subset ... \subset Y_1 avec codim Y_i=i
- (f_1,...,f_r) tel que Y_i est une composante irréd de Var(f_1,...,f_i),
  et toutes les composantes irréd sont de codim i
Pr: cf www.nd.edu/~sevens/fibdim.pdf

Normalité
---------

Si f:X->Y est fini, Y normal, W \subset Y fermé, alors pour toute
composante Z de f^-1(W), f(Z)=W et dim(Z)=dim(W)
[Pr: dans ce cas on a le going down]

Prop: - Si X est une variété normale, X*k^n est normale, X_a est normale.
- Si X est une variété affine, il existe un localisé X_f normal.

Th: Soit f:X->Y un morphisme dominant de variétés, r=dim X-dim Y.
Il existe un ouvert normal V de Y tel que si U=f^-1(Y), alors il existe un
morphisme de U dans k^r tel que U->V*k^r soit fini et dominant (donc
surjectif).
[Pr: cf www.nd.edu/~sevens/fibdim.pdf, c'est un cas particulier de la
normalisation de Noether]

Dimension des fibres
--------------------

(Hartshorne exo 3.22 et 3.20)
cf aussi http://math.stanford.edu/~conrad/145Page/handouts/fiberdim.pdf

Soit f: X->Y un morphisme dominant de variétés (=schémas intègres de type
finis) sur un corps k.
Soit V \subset Y un fermé irréductible contenu dans l'adhérence de f(X) (ie
son point générique v appartient à f(X)), et U une composante irréductible de
f^-1(V) qui domine V (ie v \in f(U)). Alors
- codim(U,X) <= codim(V,Y)
- si e=dim X-dim Y = dim fibre générique
  dim(U)>=e+dim V
  En particulier, pour tout y \in f(X), les composantes irréd de la fibre
  X_y sont de dim >=e.
- par platitude générique, il existe un ouvert U de X tel que pour tout y
  fermé \in f(U), dim U_y=e.
- Pour tout n, soit E_n l'ensemble des points x \in X tels que X_f(x) a une
  composante irréductible contenant x de dim >=n.
  Alors les E_n sont fermés, E_e=X, E_n n'est pas dense si n>e.
  ie: la dimension des fibres est semi-continue sup à la source
- Pour tout n, soit D_n les points y\in Y tels que X_y soit de dim n. Alors
  les D_n sont constructibles et D_e contient un ouvert dense de Y.
  ie: si f est fermée, la dimension des fibres est semi-continue sup à la
  cible

Rappels: si X est une variété sur k, on a
(i) dim X=dim O_P pour tout P fermé
(ii) dim X=tr deg k(X)/k
(iii) Si Y fermé dans X, codim(Y,X)=inf {dim O_P,X, P \in Y}
(iv) Si Y fermé dans X, dim Y+codim(Y,X)=dim X
(v) Si U ouvert non vide de X, dim U= dim X
(vi) Si k'/k extension, les composantes irréd de X*k' sont de dim dim X.

Rem: Soit R un anneau de valuation discrète contenant son corps résiduel k.
Alors Spec R[t] ne vérifie pas (i), (iv) et (v).

Schémas
=======

Platitude et équidimension
--------------------------

si f:X->S est un morphisme dont
toutes les fibres ont la même dimension, avec S régulier et X
Cohen-Macaulay, alors f est automatiquement plat (EGA IV.6.1.5)


Dimension des fibres
--------------------

* Theorem (cf FOAG, Chapitre 11.4)

Soit f: X->Y un morphisme de prés finie de schémas, y=f(x).
- Alors codim_X x <= codim_Y y  + codim_fibre(y) x
Si f a le going-down (ex: plat) il y a égalité.
[Pr: utiliser les systèmes de paramètres]
- Les dimensions des fibres est semi-continue à la source
- Il existe un ouvert U de Y tel que les fibres en U sont
  équidimensionelles de dim dim X-dim Y (=dim fibre générique [TODO: is
  dim X - dim Y always the dim of the generic fiber?? This looks wrong]).
[Pr: f de prés fini est localement le pull back d'un morphisme de type
finis entre Z-anneaux de types finis, le pullback préserve les dimensions,
donc on se ramène au cas loc noeth de type fini sur un anneau excellent.]
- Cf Topologie: f envoie un loc constructible sur un loc constructible.

* Theorem (stack projects, 25.28.2)
Soit f:X->Y un morphisme de schéma de type fini, F cohérent sur X, Y
réduit. Alors il existe un ouvert dense V de Y tel que le pullback de f à
U=f^-1(V) soit plat de présentation finie, et F|U soit plat de présentation
finie.

* Theorem (stack project, sections 25.29-30)
Soit f:X->Y un morphisme de schéma loc de type fini. y=f(x)
- dim_x X_y = dim O_Xy,x + trdeg_k(y) k(x)
[Pr: dim+codim = dim globale sur une variété, or la fibre ici est de type
fini sur k(y)]

- Si x se spécialise en x', alors
  . dim_x (X_y) <= dim_x' (X_y)
  . trdeg_k(y) k(x) > trdeg_k(y) k(x')
  . dim O_Xy,x < dim O_Xy,x'

- Si de plus f est dominant, Y loc noeth, X et Y intègres, alors
  dim O_X,x <= dim O_Y,y + tr deg_K(Y) K(X) - tr deg_k(y) k(x)
  Il y a égalité si Y est universellement caténaire

  En particulier, dim(X)<=dim(Y)+dim fibre générique, avec égalité si f
  fermée.

Fiber dimension is upper semi-continuous
----------------------------------------

https://mathoverflow.net/questions/193/when-is-fiber-dimension-upper-semi-continuous
Th (EGA IV 13.1.3): : Let f: X→Y be a morphism of schemes, locally of finite type. Then x↦dim_x(X_f(x))
is upper semi-continuous.

Corollary (Chevalley's upper semi-continuous theorem, EGA IV 13.1.5): Let
f:X→Y be proper, then: y↦dim(X_y) is upper semi-continuous.

- Si f est fini (surjectif), le degré des fibres est aussi semi-continu
supérieurement, cf https://mathoverflow.net/questions/76102/upper-semicontinuity-of-multiplicities-for-finite-morphisms-between-varieties par ex pour une réf.
- Si de plus Y est normal, le *cardinal* de f^{-1}(y) est au plus
  [k(X):k(Y)]_s (et il existe un ouvert de Y tel qu'on ait égalité), cf
  https://math.stackexchange.com/questions/719962/morphisms-between-schemes-such-that-every-point-in-the-codomain-has-at-most-n
  ou [Zariski_Main_Theorem#Dieudonné]
- Comme Y contient toujours un ouvert normal, on a: if Y is any integral
  scheme, f is of finite type, and the extension K(X)/K(Y) is of degree n,
  there exists a dense open subset U of Y such that f is finite, 
  f^−1(y) is of degree $n$ (and if k(X)/k(Y) is separable: contains n
  points) for all y∈U. 
Preuve: cf https://math.stackexchange.com/questions/341281/number-of-points-in-the-fibre-and-the-degree-of-field-extension
X->Y est quasi fini sur la fibre générique, donc quasi-fini sur un
ouvert de Y' de Y. Par ZMT, X est ouvert dans Z fini sur Y', l'image de Z\X
est donc fermée dans Y', donc son complément Y'' ouvert et donc X est finie
sur Y'', on prend un ouvert Y''' normal et on applique le résultat
précédent.

Eisenbud: theorème d'altitude de Nagata et platitude des fibres spéciales
-------------------------------------------------------------------------
Soit f:X->Y un morphisme dominant de schéma intègres loc de type fini loc noeth. y=f(x)

Th:
- dim OX_x <= dim OY_y + dim fibre générique.
  Si Y universellement caténaire et x maximal dans la fibre, il y a égalité.
  * En particulier, dim OX_y <= dim OY_y + dim fibre générique si X_y est non vide
    Si Y universellement caténaire, il y a égalité.
  * En particulier, dim X <= dim Y + dim fibre générique.
    Si les points fermés de Y sont denses et Y Cohen-Macauley (ex: Y
    variété), alors dim X=dim Y + dim fibre générique
    [Pr: car il existe un point max de Y avec une préimage non vide]
- dim OX_x <= dim OY_y + dim fibre spéciale (=dim OX_x/yOX_x=dim Ofibre(y)_x)
  (ie codim_X x <= codim_Y y  + codim_fibre(y) x)
  Si X->Y est plat, il y a égalité.
  (Rem: si x est maximal dans la fibre, alors par semi continuité
  supérieure on a toujours que dim fibre spéciale = dim de la composante en x
  de la fibre en y >= dim fibre générique.
  Si X/Y plat, on retrouve que les composantes des
  fibres sont toutes de dimension=dim fibre générique (=dim X-dim Y si X,Y
  variétés))

Cor:
- dim Var(x)<=dim Var(y)+dim Var(x dans la fibre en y) (=dim OX_y/xOX_y)
  [Pr: Appliquer le Th à Var(x)->Var(y)]
  Si Y Cohen-Macauley+points fermés dense il y a égalité.
  Dans ce cas, en raisonnant sur les composantes de la fibre, on a aussi
  dim Adhérence fibre =dim Var(y)+dim fibre
  (ie dim OX/yOX = dim OY/yOY + dim OX_y/y OX_y)
- Dans le cas de variétés, dim OX_x=dim X-dim Var(x).
  D'où via dim OX_x <= dim OY_y + dim Ofibre(y)_x on tire
  dim Var(x)>=dim X-dim Y+dim Var(y)-codim de x dans la fibre
            >=dim Var(y) + dim fibre générique - codim de x dans la fibre en y
            (= si plat)
