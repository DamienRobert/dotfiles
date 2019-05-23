vim: ft=markdownlight fdm=expr

Groupe Linéaire
===============
H compact dans Gl(E) est conjugé à O(n)

- Par la théorie générale de groupes de Lie
https://en.wikipedia.org/wiki/Maximal_compact_subgroup
The Cartan-Iwasawa-Malcev theorem asserts that every connected Lie group (and indeed every connected locally compact group) admits maximal compact subgroups and that they are all conjugate to one another. For a semisimple Lie group uniqueness is a consequence of the Cartan fixed point theorem

Par l'existence de la mesure de Haar:
http://math.stackexchange.com/questions/97142/compact-subgroups-of-the-general-linear-group

- Par l'existence de l'ellipsoide E de John inclus dans K convexe:
si H stabilise un corps convexe K, H est conjugué à un sous-groupe de O(n)
(en fait Aut(K) conjugué à O(n)).
si K est stabilisé par u, alors E est stable par u (car H compact => dét
u=1, donc u(E) \subset K a même volume donc par unicité est égal à E);
or stabiliser une ellipsoïde revient par conjugaison à stabiliser la boule
unité, ie être dans O(n). Maintenant si H compact on pose K=Union
g(B(0,1)).

- Par une version de Kakutani: si H compact dans GA(E) laissant invariant K
compact convexe non vide alors il y a un point fixe commun.
http://agreg-maths.univ-rennes1.fr/documentation/docs/ssgrpecompact.pdf
http://dyna.maths.free.fr/docs/lecons/developpement_algebre_219.pdf

Convexes
========

Ellipsoide
----------

Sandrine CARUSO Ellipsoïde de John-Lœwner
Théorème. Soit K un compact d’intérieur non vide de Rn. Il existe un unique ellipsoïde de volume minimal contenant K.

https://en.wikipedia.org/wiki/John_ellipsoid
In mathematics, the John ellipsoid or Löwner-John ellipsoid E(K) associated to a convex body K in n-dimensional Euclidean space Rn is the ellipsoid of maximal n-dimensional volume contained within K.

Propriétés Elementaires
-----------------------

https://fr.wikipedia.org/wiki/Ensemble_convexe#Les_th.C3.A9or.C3.A8mes_de_Radon.2C_Helly_et_Carath.C3.A9odory
Considérons un ensemble A = {a1,…,a_{d+2}} de d + 2 points dans un espace affine de dimension d. Delta_i le simplexe formé de l'enveloppe convexe des d+1 points a_j, j \ne i.
Théorème (Helly) — Il existe un point commun aux d + 2 simplexes Δi.
Théorème (Carathéodory) — Les d + 2 simplexes Δi recouvrent tout le polytope enveloppe convexe de A.

=> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Helly
Théorème — On considère X_{1},X_{2},\dots ,X_{n} une famille finie de n connvexes de R^d (où on suppose que n ≥ d + 1). On suppose que, pour tout choix de d + 1 convexes ils se rencontrent. Il existe alors un point qui appartient à tous les X_i.

=> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Carath%C3%A9odory_(g%C3%A9om%C3%A9trie)
Théorème — Dans un espace affine de dimension n, l'enveloppe convexe d'un sous-ensemble A est l'ensemble des barycentres à coefficients positifs ou nuls de familles de n+1 points de A.
=> l'enveloppe convexe de K compact est compact

https://fr.wikipedia.org/wiki/Points_et_parties_remarquables_de_la_fronti%C3%A8re_d%27un_convexe

https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Krein-Milman
Minkowski:
Théorème — Tout convexe compact d'un espace affine de dimension finie est enveloppe convexe de l'ensemble de ses points extrémaux.

Généralisation par Krein-Milman à un EVT:
Théorème — Tout convexe compact d'un espace localement convexe séparé est l'enveloppe convexe-fermée de l'ensemble de ses points extrémaux.

https://fr.wikipedia.org/wiki/Adh%C3%A9rence,_int%C3%A9rieur_et_fronti%C3%A8re_d%27un_convexe

Dans un evt, l'adhérence et l'intérieur relatif d'un convexe est convexe.

Proposition — En dimension finie, l'intérieur relatif d'un convexe C non vide n'est pas vide, et a la même dimension que C.

Proposition — Un convexe compact (non vide et non réduit à un point) est l'enveloppe convexe de sa frontière relative (et a fortiori de sa frontière)
[Par Krein-Milman on peut même se restreindre aux points extrémaux]

Dans un evt si C d'intérieur non vide, alors
int(ad(C))=int(C) et ad(int(C))=ad(C); int(C), ad(C) et C ont même
frontière.

Jauge
-----

https://fr.wikipedia.org/wiki/Jauge_(g%C3%A9om%C3%A9trie)
    p(x)= inf { λ > 0 ∣ x ∈ λ C }

Proposition — La jauge est sous-linéaire, et est par conséquent une fonction convexe.
Proposition — Soit C un convexe fermé contenant 0 dans un espace de dimension finie. Alors C est borné si et seulement si sa jauge ne prend pas la valeur 0 hors de l'origine.

Séparation des convexes
-----------------------

https://fr.wikipedia.org/wiki/S%C3%A9paration_des_convexes
Rem: H fermé séparant A et B <=> le forme linéaire continue f associée
vérifie sup x∈A f(x) <= inf y∈B f(y). Si l'égalité est stricte on dit que H
sépare strictement (c'est plus fort que dire que A et B n'intersectent pas
H). Séparer A et B revient à séparer A-B de 0.

A et B deux convexes non vides et disjoints de E.
- E de dim finie => il existe un hyperplan séparant A et B.
  (strictement si A et B fermés?)
- E normé + A ouvert => il existe un hyperplan fermé séparant A et B.
- E normé, A fermé, B compact => il existe un hyperplan fermé séparant strictement A et B.

[Preuve: 
1) https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_projection_sur_un_convexe_ferm%C3%A9
  On veut séparer C=A-B de x; pour y\in C on note T_y les applications
  linéaires de norme 1 séparant y de x. T_y est un fermé dans le compact
  sphère des formes linéaires de dim 1; donc pour montrer que \cap T_y est
  non nul il suffit de le vérifier pour une intersection finie. Si D partie
  finie de C, soit K l'enveloppe convexe de D, K est fermé et ne contient
  pas x, on peut donc appliquer 3), cqfd.
2) Appliquer Hahn-Banach géométrique à A-B qui est un convexe ouvert.
   On peut même choisir H contenant L sous-eva séparant A et B par HB
   géométrique
3) d=d(A,B) est atteinte; on sépare A+B(0,d/3) et B+B(0,d/3) qui sont
   ouverts, ça donne une séparation stricte de A et B.

   Si E hilbertien on peut aussi appliquer 
   https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_projection_sur_un_convexe_ferm%C3%A9
   qui montre que si E hilbertien + A-B convexe fermé => il existe un hyperplan fermé séparant strictement A et B: prendre f(y)=(x-P_C(x),y) pour séparer x de C=A-B. Or si A fermé et B compact, A-B est fermé.
]

Corollaire (théorème d'Eidelheit) — Dans un espace normé, tout convexe fermé est l'intersection des demi-espaces fermés qui le contiennent.

Corollaire — Dans un espace affine de dimension finie, soit C un convexe fermé et x_0 un point de la frontière de C. Il existe au moins un hyperplan d'appui de C en x_0.

Dimension infinie
=================

E R-ev; H hyperplan => H fermé ou dense.
f forme linéaire associée: f continue <=> H fermé

https://en.wikipedia.org/wiki/Dual_space
En prenant une base indicée par A, on a toujours E=(k^A)_0 (les fonctions
A->k à support fini); et Edual=k^A.

Passage au quotient d'une norme:
si E normé et H \subset E est fermé alors inf_{y\in H} ||x-y||=d(x,H) est une
norme sur E/H. (Pareil pour une distance; et pour un evt séparé le
quotient reste séparé si H fermé). Si H non fermé les éléments de Hbar\H
sont de norme 0 donc on a une semi-norme.

Hahn-Banach
-----------

https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem
https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Hahn-Banach

Théorème [forme analytique] — Soient V un espace vectoriel réel et p une fonction convexe de V dans R. Soient G un sous-espace vectoriel de V et f une forme linéaire sur G qui vérifie en tout point x de G la condition de majoration f(x)≤p(x).
Alors il existe un prolongement linéaire g de f sur V vérifiant encore la condition g(x)≤p(x) en tout point x de V.

[Preuve: en codim 1 on prolonge explicitement; par récurrence on prolonge
en codim finie; et plus généralement via une transduction infinie avec le
Lemme de Zorn]

Théorème [forme géométrique] — Dans un espace vectoriel topologique E, soient C un convexe ouvert non vide et L un sous-espace affine, disjoint de C.
Il existe alors un hyperplan affine contenant L, et disjoint de C donc fermé.

[Preuve: appliquer la version analytique à la jauge de C. Plus généralement
dans un R-ev quelconque (ie sans topologie) ça marche si tout translaté de
C qui contient 0 est absorbant]

Corollaire — Soit E un espace normé, G un sous-espace de E et f une forme linéaire continue sur G. On peut alors prolonger f en une forme linéaire continue sur E, de même norme que f.
[Preuve: on applique HB à p(x)=||f||.||x||]

Espaces de fonctions
--------------------

https://en.wikipedia.org/wiki/Compact-open_topology
https://en.wikipedia.org/wiki/Dual_norm

forum.maths:20655 <k6791k$47h$1@clipper.ens.fr>
  Dès que K est un espace compact dénombrable, l'espace dual de C(K),
  l'esace des fonctions continues sur K, qui est l'espace des mesures sur
  K, est isométrique à l¹.
  La classification des espaces C(K) pour K compact dénombrable est bien
  connue, deux tels espaces C(K) et C(L) sont isométriques si et seulement
  si K et L sont homéomorphes, ce n'est pas difficile à montrer. Deux tels
  espaces C(K) et C(L) sont isomorphes si les rangs de Cantor-Bendixson
  vérifient des inégalités du type rg(K)<rg(L)^omega (et réciproquement),
  c'est un résultat plus difficile. C'est expliqué mieux ici
http://mathoverflow.net/questions/1380/isomorphisms-of-banach-spaces

Banach
======

- https://en.wikipedia.org/wiki/Open_mapping_theorem_(functional_analysis)
  [Banach Schauder]
  If a continuous linear operator between Banach spaces is surjective then it is an open map
-> Si A:X->Y (banach) linéaire bijective continue, A^{-1} est continue
-> If A : X → Y is a linear operator between the Banach spaces X and Y, and
   if for every sequence (xn) in X with xn → 0 and Axn → y it follows that
   y = 0, then A is continuous (the closed graph theorem)

https://en.wikipedia.org/wiki/Uniform_boundedness_principle
Banach Steinhaus:
For a family of continuous linear operators (and thus bounded operators) whose domain is a Banach space, pointwise boundedness is equivalent to uniform boundedness in operator norm.

Corollary. If a sequence of bounded operators (Tn) converges pointwise, that is, the limit of {Tn(x)} exists for all x in X, then these pointwise limits define a bounded operator T.
Note it is not claimed above that Tn converges to T in operator norm, i.e. uniformly on bounded sets. (However, since {Tn} is bounded in operator norm, and the limit operator T is continuous, a standard "3-ε" estimate shows that Tn converges to T uniformly on compact sets.)

Corollary. Any weakly bounded subset S in a normed space Y is bounded.
Ex: si y->(x|y) borné dans H hilbértien, alors x est borné.

Generalisation:
The least restrictive setting for the uniform boundedness principle is a barrelled space where the following generalized version of the theorem holds (Bourbaki 1987, Theorem III.2.1):
Theorem. Given a barrelled space X and a locally convex space Y, then any family of pointwise bounded continuous linear mappings from X to Y is equicontinuous (even uniformly equicontinuous).
Alternatively, the statement also holds whenever X is a Baire space and Y is a locally convex space (Shtern 2001).

Hilbert
=======

- https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_projection_sur_un_convexe_ferm%C3%A9
  https://en.wikipedia.org/wiki/Hilbert_projection_theorem
  Si C convexe complet dans E préhilbertien, on peut projeter sur C:
    (1)\forall y\in C |x-P_{C}(x)| \leq |x-y|
 <=>(2)\forall y\in C <x-P_{C}(x),y-P_{C}(x)> \leq 0
 P_C(x) est unique; P_C est idempotente, 1-Lipschitzienne, monotone.

-> Séparation des convexes (cf l'article Wikipedia et plus bas).
-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_du_suppl%C3%A9mentaire_orthogonal_d%27un_ferm%C3%A9_dans_un_espace_de_Hilbert
   Si F est complet dans E (ex E=H hilbertien et F fermé), alors E=F \oplus F^perp. Note: F^perp est fermé, donc dans un espace Hilbertien on a toujours
   H=F^perp \oplus F^perp^perp; on a donc F=F^perp^perp ssi F est fermé.

-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_repr%C3%A9sentation_de_Riesz_(Fr%C3%A9chet-Riesz)
   Si f forme linéaire continue dans H hilbertien,
   il existe un unique y dans H tel que pour tout x de H on ait f(x) = ⟨y, x⟩.
-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Lax-Milgram
   H hilber, L forme linéaire continue, a bilinéaire continue coercive.
   Sous ces conditions, il existe un unique u de K tel que
    (1)a(u,v)=L(v)
    Si de plus la forme bilinéaire a est symétrique, alors u est l'unique élément de H qui minimise la fonctionnelle J: H→R J(v)=1/2 a(v,v)−L(v)
-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Stampacchia
   Pareil que pour Lax Milgram et K convexe fermé.
   Sous ces conditions, il existe un unique u de K tel que
    (1)\forall \ v\in K\quad a(u,v-u)\geq L(v-u)
    Si de plus la forme bilinéaire a est symétrique, alors
    u minimise la fonctionnelle I(v)=a(v,v)/2-L(v) sur K.

