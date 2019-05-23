vim: ft=markdownlight fdm=expr

TODO
====

- ample line bundle et associé:
  https://stacks.math.columbia.edu/tag/01S5
  28.11 Affine morphisms
  https://stacks.math.columbia.edu/tag/01SJ
  28.12 Quasi-affine morphisms
  https://stacks.math.columbia.edu/tag/01VG
  28.35 Relatively ample sheaves
  https://stacks.math.columbia.edu/tag/01VL
  28.36 Very ample sheaves
  https://stacks.math.columbia.edu/tag/02NO
  28.37 Ample and very ample sheaves relative to finite type morphisms
  https://stacks.math.columbia.edu/tag/01VV
  28.38 Quasi-projective morphisms
  https://stacks.math.columbia.edu/tag/01W7
  28.41 Projective morphisms
  https://stacks.math.columbia.edu/tag/0B41
  36.42 Quasi-projective schemes

- algebraic space, cf les notes de Toen
  https://perso.math.univ-toulouse.fr/btoen/files/2015/02/cours2.pdf

  https://stacks.math.columbia.edu/tag/0021
  4.8 Fibre products and representability

  https://mathoverflow.net/questions/14486/precise-definition-of-a-scheme-key-question-how-to-define-an-open-subfunctor-w?rq=1

- https://mathoverflow.net/questions/234469/useful-non-trivial-general-theorems-about-morphisms-of-schemes

Functorial point of view
========================

https://ncatlab.org/nlab/show/functorial+geometry
et les références:
Grothendieck course at Buffalo: http://matematicas.unex.es/~navarro/res/ifag.pdf
Zhen Lin thesis: https://www.repository.cam.ac.uk/bitstream/handle/1810/256998/Low-2016-PhD.pdf?sequence=1&isAllowed=y

https://mathoverflow.net/questions/33070/functorial-point-of-view-for-formal-schemes

Séminaire lectures Grothendieckiennes: http://www.math.ens.fr/seminaire_G/

Faisceaux quasi-cohérents
=========================

Définition
----------

Soit X un schéma, F un faisceau de modules.

On dit que F est quasi-cohérent ssi pour tout ouvert affine U, F|U est
isomorphe au faisceau induit par un O_X(U) module M.

Th: F est quasi-cohérent équivaut à:
- il existe un recouvrement de X par des ouverts affines U_i tels que F|U_i
  soit isomorphe au faisceau induit par un module affine
- Pour tout V affine inclus dans U affine, l'application canonique
  F(U) \tens_O_X(U) O_X(V) -> F(V) est un isomorphisme
- F est un conoyau: O_X^n -> O_X^m -> F -> 0
  (n, m poeuvent être des ordinaux)

Cor: si F est induit par M sur un ouvert affine Spec(A), F|D_f=M_f, F|P=M_P

Ex: Si R anneau de valuation discrète, Spec R a un point fermé x_1 et un
point ouvert x_0. Un faisceau quasi-cohérent F est donné par
M_0=\Gamma(x_0,F) et M_1=\Gamma(X,F) avec M_0=M_1 \tens_R Frac(R).

Rem: Si Y est fermé dans X, F un O_Y module, alors F est O_Y-quasi-cohérent
ssi F étendu par 0 en X\Y est O_X-quasi-cohérent.

Th: Si X noéthérien, F est cohérent si pour tout ouvert affine U, F|U vient
d'un module fini M; il suffit de le vérifier pour un recouvrement ouvert.

Th: Si f:X->Y est qs, et F quasi-cohérent sur X, f_*(F) est quasi-cohérent
sur Y. Si de plus f est projectif(?) et F cohérent, f_*(F) est cohérent.

Pr: Mumford, RedBook III.$1, ou Hartshorne.

Faisceaux sur un espace affine
------------------------------

Th: Si X affine, le foncteur section globale induit une équivalence de
catégorie entre faisceau quasi-cohérent et O_X(X)-modules; de plus il est
exact (ainsi que son foncteur réciproque "faisceau associé").

Plus précisément: si 0->F'->F->F''->0 est exact, et si F'' est
quasi-coherent, alors 0->\Gamma(X,F')->\Gamma(X,F)->\Gamma(X,F'')->0 est
exact
(car les faisceaux quasi cohérents ont une cohomologie triviale sur un
espace affine).

On a l'adjonction
Hom_A(M,\Gamma(X,F)) = \Hom_{Spec A}(M~, F)
pour tout faisceau de module F (non forcément q.cohérent) sur Spec A.

Faisceaux sur un espace projectif
---------------------------------

Si M gradué sur S gradué, on a un foncteur ~ qui associe
M~ faisceau quasi-cohérent sur Proj S.
Réciproquement si S est généré par S_1, alors \Gamma_*(F)~ = F
où \Gamma_*(F)=\sommetens \Gamma(X,F(n))

Les foncteurs ~ et \Gamma_* induisent des équiv de catégorie entre les
O_X-modules cohérents et les S modules gradués finis à troncation près.

Rem: Si S=A[x_0,...,x_r], \Gamma_*(S~)=S
De plus I_1 et I_2 idéaux de S définissent le même sous-schéma fermé ss'ils
ont la même saturation; et si I est un O_X-idéal, \Gamma_*(I) est saturé,
d'où bijection entre sous-schémas fermés et idéaux saturés.
(la saturation de I est l'ensemble des s\in S tel que pour tout i, x_i^n s \in I pour n>>0)

Projectivité normale: si X est une sous-variété de P^n, on a
S(X)=k[X_0, ..., X_n]/I_X \subset Stilde(X)=\sum \Gamma(L^n)
on dit que X est proj normal si X est normal et S iso à Stilde.
Plus de détails:
https://math.stackexchange.com/questions/409222/projective-normality
https://amathew.wordpress.com/2013/05/23/projective-normality-and-independent-conditions/

Pullbacks et pushforwards
-------------------------

Si f: Spec B -> Spec A, alors
- f^* (M~)=(M \tens_A B)~
- f_* (N~) = (N vu comme A-module)~

Si \phi est un morphisme d'anneaux gradués S->T, ça induit un morphisme
U ouvert dans Y=Proj T -> X=Proj S;
- f^* (M~)=(M \tens_S T)~|U
- f_* (N~|U) = (N vu comme S-module)~
On particulier le pullback de O_X(n) est O_Y(n)|U et le pushforward de
O_Y(n)|U est (f_* O_U)(n)

Si f: Y->X, E loc libre sur X, alors
f_*(F \tens f^* E)=f_*(F) \tens E

Carrés commutatifs:
f: X->S; \pi: T->S, f_T le pullback X_T -> T, p: X_T -> X; F sur X
- G \tens_O_S f_* O_X \iso f_* f^* G
  si f affine (et G quasi-cohérent?)
- \pi^* f_* F \iso (f_T)_* p^* F˙
  si \pi plat et f séparée qc (ou X noeth)
- f_* F \tens_O_S G \iso F \tens_O_X f^* G
  si G loc libre,

Faisceaux cohérents
-------------------

Th (Serre)
Si X proj sur A noeth, F cohérent, alors
F(n) est engendré par un nombre fini de sections globales pour n>>0

Si f:X->Y morphisme projectif de schémas sur A Nagata (ex k-alg de type
fini), alors si F cohérent f_* F est cohérent.

Extension faisceaux cohérents
-----------------------------

1) Se donner un module de type fini sur le localisé revient à se
donner un Module cohérent sur un voisinage ouvert suffisamment petit (cf EGA
IV paragraphe 8).

ie: si M est de type fini sur A_P, il vient d'un module de type fini sur
A[1/f].

2) Maintenant, un module de type fini sur le localisé
A[S^-1] est le localisé d'un A-module de type fini. Deux démonstrations :

a- de manière générale, si X est un schéma noethérien, U un
ouvert, tout faisceau cohérent sur U peut se prolonger en un faisceau
*cohérent* sur X [cela doit se trouver dans Pierre Gabriel, _Des catégories
abéliennes_, Bull. Soc. Math. France 90 (1962) 323--448.]
(cf Hartshorne, exo 5.15)

b- si on choisit une présentation A[S^-1]^m -> A[S^-1]^n -> M -> 0 du
module, on voit que, quitte à les multiplier tous par un élément de S
convenable, on peut supposer que les coefficients de la matrice
(n,m) représentant le morphisme de gauche proviennent de A...

=> Au final, un module de type fini sur le localisé A_P provient d'un
module de type fini sur A.

(cf sciences.maths  Message 10835)

Rappels changement de base
---------------------------

- Si N B-Module, Hom_A(M,N)=Hom_B(M \tens_A B, N)
  En particulier si K B-alg, X(K)=X_B(K)
- Si B/A plat, M, N A-modules, M finiment présenté, alors
  Hom_A(M,N)\tens B = Hom_B(M \tens_A B, N \tens_A B)
- Restriction de Weil: adjoint au pullback (dans l'autre sens que le
  foncteur d'oubli)
  Res_L/k X(S)=X(S_L)

Nilpotents
==========

Th: Soit X un schéma, U ouvert, s une section sur U. On a l'équivalence de
(i) s est localement nilpotent
(ii) s(x)=0 pour tout x \in U
(iii) Ann s = U
(iv) Si U est qc: s est nilpotente

Pr: (ii)<=>(iii) est trival, (i)<=>(ii) vient de ce que pour un ouvert
affine, nilrad=intersection des premiers, (i)<=>(iv) pour U qc est trivial.

Th: 1) S'il existe un élément localement nilpotent s sur un ouvert U, il
existe une germe dans U tel que s soit nilpotent.
2) Réciproquement, s'il existe une un élément nilpotent d'une germe, ou une
section localement nilpotente sur un ouvert, alors il existe un élément
nilpotent en chaque ouvert affine contenant cet ouvert/cette germe.

Pr: 1) Si on a un élément nilpotent non nul, il existe une germe ou il est
toujours non nul, et toujours nilpotent.
2) Par définition des germes, un élément nilpotent d'une germe vient d'un
élément nilpotent d'un petit ouvert autour. Soit A un ouvert affine
contenant ce petit ouvert affine, que l'on peut supposer égale à A_f. On
a donc un élément nilpotent g/f^m dans A_f. Donc les f^k g sont non nuls
dans A (sinon g serait nul dans A_f); et comme (g/f^m)^k est nul pour k
assez grand, ça veut dire que f^k' g^k est nul pour k,k' assez grand,
donc gf est nilpotent. (Par le th précédent, ça se voit directement en
constatant que g est nul sur D(f), et que f étant nul sur Var(f), gf est
nul sur A, donc nilpotent).

Cor: Soit X un schéma. X réduit <=> il n'y a pas d'éléments localement
nilpotents sur un ouvert <=> l'anneau des sections en chaque ouvert est
réduit <=> chaque germe est réduite.
De plus X est réduit ss'il existe un recouvrement par des ouverts affines
réduits.

Cor (si je ne me plante pas):
soit N le préfaisceau des sections nilpotenents, R le préfaisceau quotient
R(U)=O_X(U)/N(U), ie le quotient réduit maximal.
Si X n'est pas noéth, N et R ne sont pas des faisceaux en gal. Soit N+ et
R+ les faisceaux associés. Alors N+ est le faisceau des sections localement
nilpotenentes, et R+ est le faisceau associé à X_réd. Comme le foncteur
faisceau associé est exact, on a toujours que R+=O_X/N+.

Kahler differentials
====================

https://en.wikipedia.org/wiki/Cotangent_sheaf
Let f : X → S and Δ: X → X ×S X the diagonal morphism. Then the image of Δ is locally closed; i.e., closed in some open subset W of X ×S X (the image is closed if and only if f is separated). Let I be the ideal sheaf of Δ(X) in W. One then puts: Ω_{X/S} = Δ∗(I/I^2)

Si S et R sont affines, on a
     Hom_S(Ω_{S/R}, M) ≅ Der_R(S,M).
Ω_{S/R}=I/I^2 où I est le noyau de S\otimes _{R}S \to S


    If S →T is a morphism of schemes, then
        f∗ Ω_{S/T} → Ω_{X/T} → Ω_{X/S} → 0.
    If Z is a closed subscheme of X with ideal sheaf I, then
        I / I^2 → Ω_{X/S} ⊗ O_Z → Ω_{Z/S} → 0.

Fibres (cf Mumford/RedBook)

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

Propriétés géométriques (points)
================================

Corps de définition
-------------------

On dit que X/kbar est défini sur k ssi X=X0 *_k kbar, avec X0 schéma sur k.

Ex: si X/kbar est une variété fermée de A^n, X est définie sur k ss'il
existe des équations f_i(X_1,...,X_n)=0 définissant X, où f_i \in
k[X_1,...,X_n]

Th: Soit p: X->X0 la projection.
- p est surjective, fermée et ouverte
- Pour tout x \in X0, p^-1(x) est une orbite finie de Gal(k/k0)
  Si x est fermé, il y a bijection entre p^-1(x) et les
  k-plongements de k(x) dans kbar.
Pr: Mumford, RedBook, $4 Th1.

Conjugaisons
------------

Soit \sigma un automorphisme de kbar/k, on note \sigma_X la conjugation
induite sur X par (1 * \phi) où \phi: \Spec kbar -> \Spec kbar est induite
par \sigma^{-1}.

Ex: si X0=Spec k[X_1,...,X_n]/(f_1,...,f_m) et x \in X est le point fermé (x_1,...,x_n), alors \sigma_X(x)=(\sigma(x_1),...,\sigma(x_n)).
Plus généralement, si X0 (donc X est affine), \sigma_X([P]) correspond à
l'idéal (1 \tens \sigma)P dans X.

Si f est une fonction sur X, on a par définition (\sigma_X^*
f)(\sigma_X(x))=\sigma_X^* (f(x)) (où sigma_X^* est induite sur la fibre).

Th: Si X0 est de type fini sur k alors, en notant p:X->X0 la projection
(i) Pour tout ouvert U de X0, l'application canonique
O_X0(U) \tens_k kbar -> O_X(p^-1(U))
est un isomorphisme
(ii) Si f \in O_X0(U), alors pour tout point fermé x de p^-1(U) on a
f(\sigma_X(x))=\sigma(f(x)) [#]
(iii) Inversement, si k parfait et X réduit, O_X0(U) est l'ensemble des
sections O_X(p^-1(U)) satisfaisant [#]

Pr: Mumford, RedBook $4, Th 2.
  Pour (i), il suffit de se ramener aux ouverts affines.
  Pour (ii), comme X/kbar est de type fini, les points fermés ont pour corps
  résiduel kbar, et \sigma_X induit \sigma sur les corps résiduels. Or f est
  rationel => \sigma_X^* f = f pour tout \sigma, ce qui implique que
  f(\sigma(x))=\sigma(f(x))
  Pour (iii), si f(\sigma(x))=\sigma(f(x)) pour tout x, alors f0=f-\sigma_X^*
  f a pour valeur 0 en tout x fermé. Comme X est réduit, f0 qui s'annule en
  tout point fermé s'annule partout (car les points fermés sont denses sur
  kbar), donc f est stable par chaque \sigma_X^*. Mais comme k est parfait, k
  est l'ensemble des invariants de \Gal(kbar/k), donc f est k-rationelle.

Cor: Se donner X0/k est équivalent à se donner
(i) X/kbar
(ii) l'action de Gal(kbar/k) par conjugaison sur X
(X0 en tant qu'espace topologique sera le quotient de X par Gal(kbar/k)
(iii) Un sous faisceau de O_X défini sur les k-ouverts (ie les ouverts de X
stables par l'action de Galois): le faisceau des fonctions rationnelles
(ce faisceau induisant le faisceau sur X0)

Rem: - Si X est réduit et k parfait, il suffit d'avoir (i) et (ii)
- Si x \in X0 est un point fermé, il y a bijection entre p^-1(x) et les
  k-plongements de k(x) dans kbar.

Extension des scalaires
-----------------------

Soit X un schéma de type fini sur k.

On dit que X est géométriquement irréductible si X*kbar est irréductible.
C'est équivalent à X*K est irréductible pour toute extension K/k, et il
suffit de le vérifier pour K=cloture séparable de k.

On dit que X est géométriquement réduit si X*kbar est réduit.
C'est équivalent à X*K est réduit pour toute extension K/k, et il
suffit de le vérifier pour K=cloture parfaite de k.

Th:
(i) X est géométriquement réduit ssi k(X)/k est séparé
(ii) X est géométriquement irréductible ssi k est alg clos dans k(X) ssi
k(X) \inter kbar = k.

Pr: Mumford, $4 Prop 4, ou Maths/Galois/produit_tensoriel

Propriétés locales
==================

Topologies
----------

* Espaces classifiants:
- https://arxiv.org/abs/0902.1130
Grothendieck topologies from unique factorisation systems
Mathieu Anel (2009)

     This work presents a way to associate a Grothendieck site structure to a category endowed with a unique factorisation system of its arrows. In particular this recovers the Zariski and Etale topologies and others related to Voevodsky's cd-structures. As unique factorisation systems are also frequent outside algebraic geometry, a construction applies to some new contexts, where it is related with known structures defined otherwise. The paper details algebraic geometrical situations and sketches only the other contexts.

=> this also give the classifying property of the little/big topos of the
zariksi/étale topology:

Small Zariski: localisation of A; Etale: strict henselisation of A; Nisnevich: ind-etale henselian local A-algebra
Big Zariski: local A-algebras; Etale: strict henselian local A-algebras; Nisnevich: henselian local A-algebra

- Voir aussi:
https://mathoverflow.net/questions/20622/construction-of-the-petit-zariski-topos-out-of-the-gros-topos-of-a-scheme/21154#21154

=> Over an affine scheme Spec A, The big topo E classifies local rings in topoi while the small topos X classifies local rings that are localisations of A, so X is the subtopos of those objects Y of E such that A^1 restricted to Y is a localisation of A.

Qui cite la thèse de M. Hakim IV.5 qui donne une construction fonctorielle
du petit topos étale en fonction du petit topos de Zariski comme adjoint à
gauche [attention, Hakim écrit ses flèches dans l'autre sens, donc parle
d'adjoint à droite] du foncteur d'inclusion Topos annelé en anneaux
strictement locaux -> Topos (loc) annelé; et construit également le petit
topo de Zariski comme l'adjoint à gauche du foncteur d'inclusion Topos loc
annelé -> Topos annelé: Zariski(E,A)=(Spec A, O_A).

- Ce théorème (la topologie de Zarsiki classifie les anneaux locaux et la topologie étale classifie les anneaux henséliens strict) est repris dans 
https://link.springer.com/chapter/10.1007%2FBFb0061844
https://sci-hub.tw/10.1007/BFb0061844
Generic Galois theory of local rings, G.C. Wraith
qui donne une théorie de Galois des anneaux locaux en terme de leur strict
Hensélisation, et qui explique que l'intéret d'être Hensélien strict plutôt
que Hensélien est que la première notion est géométrique.

* Big and small topos
- https://golem.ph.utexas.edu/category/2009/01/petit_topos_gros_topos.html

$ Denis-Charles Cisinski:

To express further the differences between the petit and the gros topos of X, we can notice that the Yoneda embedding gives a fully faithful functor from Sch/X to the category of sheaves on the gros topos. In particular, X is completely determined by its gros topos; however, the scheme X is not determined by its petit topos: the petit topos only determines the underlying topological space of X. To determine X, you need to know its petit topos as well as its sheaf of rings O_X. And the data of this sheaf of rings is a kind of disguised link to a gros topos! Indeed, let us consider first the case where X=Spec(Z). Then the gros Zariski topos of Spec(Z) is the classifying topos for local rings: given a topos T, a sheaf of local rings on T (I mean by this a sheaf of rings O which is locally a local ring, i.e., in the case where the topos has enough points, for any point x of the topos T, the ring O_x is a local ring) is the same thing as a (geometric) morphism of topoi from T to the big Zariski topos of Spec(Z). The universal local ring is the Zariski sheaf represented by the affine line on Sch/Spec(Z).

The data of the sheaf of rings O XO_X thus gives you the relation of X with all the schemes of finite presentation over Spec(Z). As any ring is a filtered colimit of rings of finite presentation, you can understand from this all the sets Hom(X,Y) for any scheme Y, hence recover X completely by the Yoneda Lemma (this is why the definitions of schemes as locally ringed spaces or as sheaves on the gros topos lead to equivalent notions after all).

There is a systematic ‘toposic’ way to recover the gros Zariski topos of a scheme X from the category Sch/X and from the petits topoi of schemes (locally) of finite presentation over X. Indeed, we have a (pseudo-)functor
(−)_Zar:Sch/X→Topoi
which associates to a scheme Y over X its petit topos Y_Zar. Then the gros topos of X can be described as the lax 2-colimit of this pseudo-functor. In particular, the canonical morphisms of topoi from Y_Zar to the gros Zariski topos of X form the universal ‘lax cocone’.

$ James:
There are actually three functors relating the big and small toposes. More precisely, there is a topos map from the big topos to the small topos, and this map has a section f. Then not only does f^* have a right adjoint f_* but it also has a left adjoint f_!

$ Mike Schumlan, For topological spaces:
Somewhere in between, we can consider sheaves on LH/X, where LH is the category of topological spaces and local homeomorphisms. It turns out that LH/X is actually equivalent to the petit topos of X, and therefore so is the category of sheaves on it; so this just reconstructs the petit topos.

- https://mathoverflow.net/questions/20622/construction-of-the-petit-zariski-topos-out-of-the-gros-topos-of-a-scheme/21154#21154
The gros étale topos for S is just ((Shv(Aff_ét)↓S). We can construct from it the petit étale topos by considering Shv(ét↓S), where (ét↓S) is the subcategory of the gros étale topos consisting of étale morphisms A→S where A is affine. This site is equipped with the induced topology.

Now for the ring object. For the petit topos, we let OS be defined simply
the sheaf sending any affine scheme to its corresponding ring (exercise:
Show that this is a sheaf). This defines a ring object in the category of
sheaves on the small site (exercise: Prove this. (Hint: Think of the
definition of a group object and recall that the Yoneda embedding is
full.)). For the large topos, we just let it be the base change of the
affine line. It's not hard to show that they agree on étale morphisms A→S
for A affine.

Propriété affine locale
-----------------------

Th: Soit P une propriété sur des ouverts affines. On suppose que
(i) Si Spec A a P, les ouverts distingués aussi.
(ii) Si Spec A a un recouvrement fini par des ouverts distingués A_i
(ie A_i=A_f_i avec 1=(f_1, ..., f_n)) alors si les A_i ont P, A aussi.
Alors si X a un recouvrement par des ouverts affines qui ont P, tout ouvert
affine de X a P.

Vient de la
Prop: Soit Spec A et Spec B des ouverts affines d'un schéma X.
Alors l'intersection est l'union d'ouverts affines distingués à la fois
dans A et dans B.

Preuve: il suffit de montrer que tout x dans l'intersection est inclus dans
un ouvert distingué de A et B. Soit A_f un ouvert distingué inclus dans
l'intersection et contenant x, et B_g inclus dans A_f et contenant toujours
x. Alors la section g de Spec B se restreint en une section g' sur Spec
A_f, et il est facile de voir que Spec B_g est isomorphe à Spec (A_f)_g'.
Mais si g'=g''/f^n, Spec(A_f)_g'=Spec(A_fg'') donc est bien distingué dans
A.

Propriétés locales de schémas
-----------------------------

Déf:
- X est réduit ssi tout ouvert affine est réduit
- X est intègre ssi tout ouvert affine est intègre
- X est loc noeth ssi tout ouvert affine est noethérien
  X est noeth ssi X est loc noeth et qc.

Prop (sections et germes):
- X réduit <=> toutes les germes sont réduites <=> les sections
de chaque ouvert (pas forcément affine) sont réduites.
- X intègre <=> X est réduit et irréductible <=> les sections de chaque
  ouvert (pas forcément affines) sont intègres => les germes sont intègres.
  Attention: les germes intègres implique seulement X union disjoint de
  schémas intègres.
- X irréductible <=> chaque ouvert affine U est irréductible
  (ie O_X(U) a un unique idéal premier minimal, ou encore le Nilradical de
  O_X(U) est premier) => Les fibres sont irréductibles.
  Attention: les germes irréductibles implique seulement X union disjoint de
  schémas irréductibles.

Th (propriétés définies localement)
- X est réduit ss'il existe un recouvrement par des affines Spec A_i,
  avec A_i réduit
- X est loc noeth ss'il existe un recouvrement par des affines Spec A_i,
  avec A_i noethérien
- X noeth <=>  il existe un recouvrement ouvert fini avec les A_i noeth.
- X irréductible/intègres ssi X est connexe et il existe un recouvrement
  par des ouverts affines irréductibles/intègres.
Rem: en particulier, si A est réduit/noéth, alors Spec A est réduit/noeth
en tant que schéma. C'est clair que les ouverts distingués de Spec A sont
réduites/noeth, mais c'est moins clair pour les ouverts affines non
distingués!

*Attention*: X noéthérien n'implique pas que l'anneau des sections de chaque
ouvert soit noéthérien, de même pour X de type fini.

Propriétés locales pour les topologies
--------------------------------------

Cf Stacks $34.12.
Si P est locale pour Zariski, et que P passe de S à S' pour un morphisme
affine S'->S dans la topologie \tau, et que P passe de S' à S pour un
morphisme affine surject S'->S dans la topologie \tau, alors P est locale à
\tau.

- local pour fppf: S loc noeth, S Jacobson, quasi-compact open a un nombre
  fini de composantes irréductibles
- local pour syntomic: S loc noeth et S_k, S Cohen-Macauley
- local pour smooth: S réduit, S normal, S loc noeth et R_k, S régulier, S
  nagata.

On dit qu'une propriété P de morphisme est locale en le but/la base, si f: X-> Y a
P <=> pour tout cover Y_i de Y, f: X_i=X x_Y Y_i -> Y_i a P.
(En particulier si P est local, P est stable par pullback dans la
topologie).

Note: pour f:X->Y, il existe un plus grand ouvert W(f)\subset Y tel que
X_W(f)->W(f) a P, cf Lemme 34.19.3.

Prop: si P est locale (en la base) pour Zariski, préservé par pullback dans
la topologie, et descend pour un morphisme affine surjectif S'->S dans la
topologie, alors P est locale (en la base) pour la topologie tau.
[rem: pour \tau syntomic, smooth ou étale on peut même supposer que S'->S
est standard]

- base local pour fpqc: f-qc, f-qs,
  f universally-closed/open/submersive/injective/homeo, f separated, f
  surjective, f loc of finite type/presentation, f finite
  type/presentation, f proper, f flat, f open/closed immersion, f iso, f affine,
  f quasi-affine, f quasi-compact immersion, f integral, f finite, f loc
  quasi-finite, f quasi-finie , f loc of finite type of rel dim d, f
  syntomic, f smooth, f unramifed, f G-unramified, f étale, f finite loc
  free, f finite loc free of deg d, f monomorphism.
- base local pour fppf: f immersion

On dit que P est locale en la source, si f: X->Y a P <=> pour tout cover
X_i de X, f:X_i->Y a P.
Note: il y a toujours un plus grand ouvert W(f) de X tel que W(f)->Y a P.

Prop: si P est locale en la source et la base pour Zariski, préservée par
précomposition X'->X dans la topologie, et descend pour un morphisme
surjectif X'->X de schémas affines dans la topologie (pour f:X->Y affine),
alors f est locale en la topologie tau.

Note: f est foobar-local en la source pour la foobar-topologie pour la foobar topologie (sauf pour fpqc, f est flat est local en la source, mais pas f qc).
- locale en la source pour fpqc: f flat
- locale en la source pour fppf: f loc of finite pres, f loc of finite type,
  f open, f universellement open
- locale en la source pour étale: f loc quasi-finite, f unramified, f
  G-unramified

Embedded Primes
===============
Ce sont ceux qui interviennent dans la décomposition primaire d'un module.

Modules de longueur finies
--------------------------

- M est de longueur finie de longueur n => toute chaine maximale est de
longueur n.
- M longueur finie <=> M artinien et Noetherien
=> M est isomorphe à \sum M_P, et M=M_P si P^k anhilie M

R est artinien <=>
(i) R est noetherien de dimension 0 (ie tout idéal premier est max)
(ii) R est de longueur fini comme R-module
=> R a un nb fini d'idéaux max, R iso à \prod_fini R_P

Si R noetherien, M finiment engendré, alors M artinien <=>
(i) M de longueur finie
(ii) \prod_fini P_i annhilie M
(iii) R/ann(M) est artinien (ie tous les premiers contenant ann(M) sont max)

Cor: * avec les mêmes hypothèses M_P est de longueur finie <=> P minimal sur ann(M)
     * Si I est un idéal de R, on a les équivalences
  (i) P est minimal sur I
  (ii) R_P/I_P est artinien
  (iii) On a P_P^n \subset I_P pour n assez grand

Premiers associés
-----------------

* M finiment engendré sur R noetherien *

Ass M c'est les idéaux premiers annulant un élément de M.

Th:  - Ass M est fini, contient tous les idéaux premiers minimaux sur ann(M)
     - L'union des premiers dans ass M = {0} union {les zéros diviseurs sur M}
     - Ass M commute à la localisation

Cor: si I est un idéal, soit I contient un non diviseur sur M, soit I
      annilhie un élément de M (par prime avoidance), en fait dans ce
      dernier cas I est même inclus dans un assassin.

Prop: M' \subset M est nul ssi M'_P = 0 pour tout P dans Ass M

Prop:
- Ass (M' \somme M'')= Ass M' \union Ass M''
- Si 0->M'->M->M''->0, Ass M' \subset Ass M \subset Ass M' \union Ass M''
-  M a une filtration 0 \subset M_1 \subset ... \subset M
   ou M_{i+1}/M_i \iso R/P_i (les assasins apparaissent dans les P_i, mais
   il peut y en avoir d'autres!)

Prop: M is P-coprimaire (ie Ass(M)={P}) <=>
(i) P est minimal sur ann M et M -> M_P est une injection (ie les éléments
non dans P ne sont pas des diviseurs de zéros sur M)
(ii) P^k annule M pour k assez grand et M->M_P est une injection.

Application: si P est minimal sur ann(M), alors le noyau M' de M->M_P est
P-primaire (ie M/M' est P-coprimaire). On dit que M' est la composante
P-primaire.

Th: si M' sous-module, M' = intersection finie de modules P_i-primaires
i) Tout ass(M/M') apparait dans les P_i
ii) Si l'intersection est irredondante, les P_i sont exactement ass(M/M')
iii) Si l'intersection est minimale, chaque assassin apparait exactement
une fois. De plus si P_i est minimal sur ann(M/M'), M_i est la composante
P_i primaire de 0 dans M/M'

Th: Si I idéal, H^0_I(M) = (0:_M I^\infty) (=les éléments annulés par une
puissance de I).
Notons Ass(M) = A \union B où A sont les assasins dans le fermé engendré par I, et B les assassins dans l'ensemble ouvert complément de I.
Soit (0) = \intersection M_i la décomposition primaire de 0 dans M
i) H^0_I(M) = \intersection M_i où P_i est dans B
ii) H^0_I(M) est uniquement caractérisé par Ass(H^0_I(M))=A et Ass(M/H^0_I(M))=B

De plus, si U est un ensemble stable par multiplication tel que B soit
l'ensemble des assassins ne rencontrant pas U (ie B=assassins dans l'ouvert
défini par U), on a H^0_I(M)=Ker M->M[U^-1]
Pour tout U il existe I tel que B soit l'ensemble des assassins ne
rencontrant pas U, et réciproquement pour tout I, il existe f dans I tel
que A soit l'ensemble des assassins contenant f (de manière équivalente,
B est l'ensemble des ass dans l'ouvert associé à f). En particulier les noyaux
des localisations correspondent aux H^0_I(M) (qui d'ailleurs ne dépendent
que du radical de I)

Interprétation faisceautique
----------------------------

Bon maintenant, dans le cadre affine d'avant, si I = ann M, l'ensemble B
est nul (tout assassin contient ann M), donc on a bien M est nul en dehors
de son support. Si P est un premier minimal au-dessus de ann M, le noyau de
M -> M_P est exactement la composante P-primaire de M car P est le seul
assassin de M inclus dans P.
Plus généralement, le noyau M' de la restriction M -> M|U où U est un
ouvert, et quelque chose qui ne dépend que des Assassins qui sont dans U:
les assassins de M/M' c'est l'ensemble B (plus haut). Comme M/M' a tout ses
assassins dans U, la restriction y est injective. Inversement M' a tous ses
assassins en dehors de U, donc la restriction donne le module nul.

Longueur en un premier
----------------------

Si P premier, sa multiplicité dans M est par définition la longueur de
(0:P^\infity) dans M_P, qui est égal à \inter M_i,P pour P_i ne contenant
pas P, qui est égal à H^0_P(M)_P.
En effet, H^0_P(M) a pour assassins les premiers contenant P, donc si on
localise en P alors soit
- P n'est pas un assassin, donc P n'est pas diviseur de 0 dans M_P, donc H^0_P(M)_P=0 et la multiplicité est 0
- soit l'unique assassin de H^0_P(M)_P est P, donc il est bien de longueur
finie, et par définition c'est le plus grand sous-module de longueur finie
de M_P.

Idéaux et diviseurs de zéro
---------------------------
Toujours mêmes hypothèses.

Si I idéal, Ker(I) c'est l'ensemble des éléments m de M tels que i.m=0 pour
tout i \in I. Ker(I) est non vide ssi I ne contient pas de non diviseur de
0 (cf plus haut), d'où l'équivalence Ker(I) est non vide ssi I est inclus
dans un assassin. Ex: Ker(ann M)=M.

Si I et J sont premiers entre eux, Ker(I) \inter Ker(J) est vide (car si x
est dans l'intersection, il est annihilé par I et J donc la somme).
On fait on a l'équivalence: Ker(I) \inter Ker(J) = \vide ssi I+J n'est pas
inclus dans un assassin (car Ker(I)\inter Ker(J) c'est Ker(I+J))

Résumé
------

- Ass M est fini, contient tous les idéaux premiers minimaux sur ann(M)
- L'union des premiers dans ass M = {0} union {les zéros diviseurs sur M}
- Ass commute à la localisation, donc si U est un ouvert de Spec A, Ass M|U = les assassins dans U = les premiers P dans U tel que P soit un assassin de la fibre M|P.

De plus, le noyau de M -> M|U est donné par M' dont les assassins sont
exactements ceux de M dans \Spec A \ U; et donc ceux de M/M' sont dans U
(comme ceux de sa localisation injective M/M'|U = M|U).

Si I est l'idéal premier correspondant à U, M' est donné par H^0_I(M)=(0:
I^\infinity). Si 0= \inter M_i est une décomposition primaire minimale, M'
= \inter M_i pour les P_i dans U.

Pr: En effet, dans M' 0=\inter (M_i \inter M') avec les P_i dans I, alors
que dans (M/M')|U, 0=\inter M_i avec les P_i dans U.

Annulateur et support d'un module quasi-cohérent
------------------------------------------------

Soit M un module quasi cohérent sur un schéma X, s une section globale de M.
Le support de s est l'ensemble des x tels que s_x \ne 0. On a s_x=0 ssi s
est nul sur un ouvert autour de x, donc le support de s est fermé.

Var(s), c'est l'ensemble des points où s(x)=0; X_s est son complémentaire,
c'est donc un ouvert.
Remarque: si s(x) \ne 0, alors s_x \ne 0. Donc le support de s contient
X_s.

Le support de M c'est l'ensemble des x / le germe M_x est non nul, si M est
cohérent c'est un fermé (et par Nakayama c'est aussi les x / M(x) est non
nul); sur un ouvert affine c'est Var(ann M). En général, la clotûre du
support de M est encore Var(ann M).

Lemme: Si x se spécialise en y, alors s(y) \ne 0 => s(x) \ne 0 et s|x \ne 0
=> s|y \ne 0. Contraposée: s(x)=0 => s(y)=0 et s|y=0 => s|x=0.

Ex: Si x n'appartient pas au support de s, alors s|x=0 donc s(x)=0 donc s(y)=0 pour tout x->y.

Th: Soit X=Spec A, s \in A, alors
-X_s = Spec A[1/s] est l'ouvert complémentaire de Var(s)
-Support(s)=Var(0:s) contient X_s
-Si I=(0:s^\infty), alors I est le noyau de A->A_s, et est caractérisé
ensemblistement par l'ensemble des points x tels que s|x ne soit pas
nilpotente. En particulier, la clôture de X_s est donnée par Var(I), on en
déduit que Rac(I)=intersection des idéaux premiers ne contenant pas s=I +
préimage de Nilpotent(A_s).

En résumé: Var(s)={x | s(x)=0} est le complémentaire de X_s={x| s(x) \ne 0).
X_s ouvert \subset cloture X_s = Var{intersection idéaux premiers ne
contenant pas s} = Var(0:s^\infty)={x | s|x n'est pas nilpotente}
\subset Var(0:s)={x | s|x \ne 0}=Support de s.

En passant au complémentaire: Var(s)={x | s(x)=0} est fermé, son intérieur
est donné par le {x | s|x nilpotente} (en effet sur un ouvert U \subset
Var(s), s(x)=0 donc s est localement nilpotente sur U), qui contient le
complémentaire du support: {x | s|x =0}

Cas de plusieurs sections:
- \intersection X_s_i= X_{\prod s_i} donc on se ramène au cas d'une section.
- Y=\union X_s_i est le complémentaire de Var(s_i) qui est l'intersection
  des Var(s_i). Y={x | s_i(x) \ne 0 pour un i}. La clôture de Y est donné
  par (0:I^\infty) où I=(s_i); \overline Y=\union \overline X_s_i={x | il
  existe i / s_i|x non nilpotent}.

Assassins des modules cohérents
-------------------------------

Soit X un schéma noethérien, M un module cohérent sur X.

Déf: les assassins de X sont les points génériques des composantes des
supports d'une section de M sur un ouvert.

Th:
- Il y a un nombre fini d'assassins (associated primes); pour chaque
  assassin x il existe une section m tel qu'il soit exactement l'annulateur
  de cet élément (dans la germe en x ou sur un petit ouvert contenant x).
- f \in O_X est un diviseur de M ssi f(x)=0 pour un assassin x de M
- les assassins se localisent aux ouverts et même aux germes
- les points génériques de l'annulateur de M sont des assassins de M.
(Réciproquement, si s est une section de O_X dont le support ne contient
aucun de ces points génériques, alors s(x)=0 pour tout x, donc s
nilpotente. En particulier, si X est réduit, les seuls assassins de O_X
sont les points génériques.)
- L'application \Gamma(U,M)->\prod_{assassins dans U} M_p est une injection
  (En particulier, si une section m est nulle sur un ouvert U contenant tous les
  assassins, alors m est nulle)

Prop: - si m est une section de M, Supp m est la cloture des assassins x de M tels que m|x \ne 0.
- Les point x tels que O_X,x est non réduit est la cloture des assassins x
  de O_X tels que O_X,x non réduit.

Déf: une fonction est rationelle sur X <=> c'est une section de O_X sur un
ouvert contenant tous les assassins. K(X)=lim inductive \Gamma(U) pour U
contenant tous les assassins = anneau des fractions totales.
- K(X) est inclus dans le produit \prod_{x assassin} O_X,x
  Si X est réduit, K(X)=\prod_{x assassin} O_X,x et les O_X,x sont des
  corps.

Attention, si KK(X)=lim inductive \Gamma(U) pour U ouvert dense,
où l'on identifie deux sections de U et V qui coincident sur un ouvert
dense dans U \inter V (Eisenbud-Harris Ex I.21), alors il me semble que
KK(X)=\prod_{x générique} O_X,x, mais O_X ne s'injecte pas forcément dans
KK(X).
Concrêtement, ça se traduit par le fait que si U est un ouvert dense (ie il
contient tous les points génériques) mais qu'il existe un point immergé non
dans U, alors la cloture de U n'est pas égale à X. Ex: si X affine, la
cloture d'un ouvert U quelconque est donnée par l'idéal des fonctions
régulières dont l'intersection avec U est nulle, ie par l'intersection des
composantes primaires dont U contient le point associé, ie par l'idéal
(0:I^\infity) où I est l'idéal définissant le fermé complémentaire de U.

Assassins et morphismes
-----------------------

Prop: Si f: Y->X, alors f(Ass Y)=Assassins du O_X modules f_*(O_Y).

Rem: Si M est un faisceau cohérent sur X, un diviseur de 0 de M est déjà un
diviseur de 0 dans X équivaut à Ass M \subset Ass X (par prime avoidance).
En particulier, si f: Y->X est plat, f(Ass Y) \subset Ass X.

Ex: si f:Y->X avec X intègre, alors les Ass(Y) sont au dessus du point
générique de X équivaut à pour tout y\in Y, les éléments non nuls de
O_X|f(y) ne sont pas des diviseurs de zéro de O_Y|y.

Diviseurs
=========

Riemann Roch
------------

l(D)=dim {f/ (f)+D >=0}; ll(D)=l(D)-1 = dim projective
ll(D)=deg(D)-g + i(D) où i(D)=l(K-D) est l'indice de spécialité

- deg(K)=2g-2, l(K)=g, ll(K)=g-1
- Si deg(D)>=2g-1, ll(D)=deg(D)-g
- si Deg(D)=0, l(D)=0, sauf si D~0 où l(0)=1 [L(0)={constantes}]

Exemples:
- Si C: F(x,y)=0 est une courbe lisse plane de genre g, les g différentielles
régulières sont données par $x^i dx / (∂F/∂y)$
- Par ex si C est hyperelliptique, les différentielles régulières sont
  dx/y, xdx/y, ... x^g dx/y
  De plus, si \alpha_i sont les (2g+1) ou (2g+2) points de Weierstrass, on
  a respectivement
  K=\sum alpha_i - 3 (\infinity)
  K=\sum alpha_i - 2 (\infinity_+ + \infinity_-)

Invertibles modules (Eisenbud)
------------------------------

Th 11.6:
- I invertible iff I* \tens I \to R is an iso
- If M is invertible, it is isomorphic to a fractional ideal of R.
  An invertible fractional ideal I contains a nonzerodivisor of R
- If I,J are invertible fractional, I \tens J \iso IJ and I^{-1} \iso I*
  (where I^{-1}={s \in K(R) | sI \subset R}}
- If I \subset K(R) is a R-submodule, I is invertible iff I^{-1}I=R.

I est de pure codimension 1 si les premiers associés de I sont de
codimension 1 (ie sont tous génériques)

Th 11.8: R Noeth domain, R_P est factoriel pour tout P maximal
(i) I invertible <=> I pure codimension 1
(ii) Un idéal invertible I \subset K(R) s'écrit de manière unique comme un
produit d'idéaux premiers de codim 1.

Th 11.10: On a un morphisme des diviseurs de Cartier vers les diviseurs de Weil:
\phi(I) = \sum_{P codim 1 prime} length(R_P/I_P).P \in Div(R)

(Rem: si R est de dim 1, length R/I = \sum_{P codim 1 prime containing I}
length(R_P/I_P) donc l'application I->length R/I respecte la structure de
groupe des diviseurs de Cartier)

Prop 11.11:
- Si R est noeth et *normal* alors les applications
Cartier(R)->Div(R) et Pic(R)->Chow(R) sont injectives.
- Si R est localement factoriel, alors Cartier(R)->Div(R) et
  Pic(R)->Chow(R) sont bijectives.
En général on a pas surjection (s'il existe des premiers de codim 1 non
inversibles), ni injection

Pour l'injection dans le cas normal, on utilise:
si R anneau réduit noeth, x \in K(R) appartient à R si x \in R_P pour tout
premier P associé à un non diviseur de 0 dans R.

Cf aussi:
http://mathoverflow.net/questions/12260/when-does-the-group-of-invertible-ideal-quotients-the-free-abelian-group-on-th/

* Remarque:
Tout module inversible est (isomorphe à un) idéal fractionnaire si Ass(X)
est inclus dans un ouvert affine
cf Remarks on the existence of Cartier divisors (Stefan Schroer)

Anneaux normaux, factoriels
---------------------------

R régulier local => factoriel
(R régulier local de dim 1 <=> valuation discrète <=> principal+local)

* Factorialité
R est factoriel ssi tout idéal de codim 1 est principal
                ssi tout idéal premier minimal au-dessus d'un principal est principal
                ssi Cl(R)=0 (dans le cas où on peut définir correctement le groupe de classe de Weil, par exemple R anneau de Krull)
[ http://en.wikipedia.org/wiki/Krull_ring
Let A be an integral domain and let P be the set of all prime ideals of A of codim one, that is, the set of all prime ideals properly containing no nonzero prime ideal. Then A is a Krull ring if
    A_{\mathfrak{p}} is a discrete valuation ring for all \mathfrak{p} \in P ,
    A is the intersection of these discrete valuation rings (considered as subrings of the quotient field of A ).
    Any nonzero element of A is contained in only a finite number of codim 1 prime ideals.
    Ex: A integrally closed noeth domain]

* Normalité:
- R domain est normal ssi pour chaque P premier associé à un idéal principal,
P_P est principal
- En général R est un produit d'anneaux normals si on a les critères
  R1 (régulairté en codim <=1, ie la localisation en un premier de codim 1
  est à valuation discrète et en codim 0 un corps)
  et S2 (un idéal premier associé à un non diviseur de zéro est de codim 1,
  un idéal premier associé à 0 est de codim 0)
Rappel: R0+S1=> réduit
De manière équivalente: S1="Si P est de codim >=1, depth R_P >=1"
                        S2="Si P est de codim >=2, depth R_P >=2"

* Critère Jacobien
Th 18.15: soit R=k[x_1,...,x_r][U^-1]/I le localisé d'un anneau affine sur
un corps parfait k. I=(f_1,...,f_n) a codimension c.
Soit J l'idéal engendré par les mineurs cxc de la matrice Jacobienne
(\delta f_i/\delta x_j) modulo I. Supposons que R soit Cohen-Macauley.
(i) R réduit ssi J a codim >=1 dans R
(ii) R est un produit d'anneaux intègres si (i) et de plus R_P est intègre pour
tout premier P de codim <=1
(iii) R est un produit d'anneaux intègres normaux si J a codim >=2 dans R.

Cartier divisors
----------------
[cf Schroer, Remarks on the existence of Cartier divisors]

Soit T \subset X un sous-ensemble fini contenant Ass(X).

Th 3.3: Un fibré en droite L est représentable par un diviseur de Cartier
L(D) avec D à support disjoint de T si et seulement si L|T est trivial dans
Pic(T).

Cor: Si Ass(X) est inclus dans un ouvert affine U, alors Div(X)->Pic(X) est
surjectif.
Pr: si T est dans un ouvert affine U=Spec(A), T est inclus dans Spec(S^{-1}A) 
où S est le complément de l'union des p \subset A correspondant aux points
de T. S^{-1}A est semi-local, donc son groupe de Picard s'annule, donc L
est représentable par un D à support disjoint de T.

Brill Noether
-------------

https://www.birs.ca/workshops/2014/14w5133/files/Osserman-reference.pdf
Brill-Noether theory, Joe Harris

https://web.stanford.edu/~tonyfeng/Brill_Noether1.pdf
BRILL-NOETHER THEORY, TONY FENG

Courbes
=======

Réf: Lectures on rational points on curves, Poonen

k corps parfait
{variétés intègres sur k, appli birationelle} ~ {k-algèbres de type fini}^op

Remark 1.4.7: X/k irréd, X geom irréd <=> k(X) \cap kbar = k

Remark 1.7.6: X/k smooth => X/k reduced
              smoothness is preserved by base change

Section 2.1: {curves integral, appli birat } ~ {k-alg de deg transcendance 1}
               ~ {curves smooth projective integral, dominant morphisms}
            car toute courbe intègre a un unique modèle lisse projectif intègre.
            [attention si k(C) \cap kbar \ne k la courbe n'est pas geom intègre]

Remarque: si C courbe lisse projective géom intègre, alors C est uniquement
déterminée par C_kbar (équiv de catégorie): les points de C = les classes
sous Galois de C_kbar(kbar)=C(kbar). En effet C=C_kbar/Gal.

Ex: R[x] a un point réel X^2+1 (penser valuation) = orbite {i,-i}

C courbe lisse geom irréd.
C(k)=C(kbar)^G [mais Spec C=orbites de C(kbar)+point générique=valuations de k(C)]
Div(C)=Div(C_kbar)^G
Pic(C)=Pic(C_kbar)^G (si C(k) n'est pas vide), cf [diviseurs_rationels]
Si f \in kbar(C_kbar), Div f invariant par Galois, alors f \in k(C).
[Preuve: H^1(G,kbar[C]^*)=H^1(G,kbar*) car C projective = 0 par Hilbert
90.]

Groupes algébriques
===================

G groupe algébrique /k

- Th de Chevalley: Il existe une unique suite exacte
  1->H->G->A->1
  avec H affine (ie linéaire) et A propre (ie variété abélienne)

- Une K forme de G est un groupe H/k tel que G \iso H sur K.
  {K-formes de G} <=> H^1(Gal(K/k),Aut(G_K))

- Tore: une kbar-forme de G_m^d (=tore déployé)
  {tores/k}_iso <=> (catégorie) {Gal(kbar/k)-modules libres de rang fini}/iso^op
  via T->\chi(T) (=caractères sur kbar)

Groupes linéaires
-----------------

- u est unipotent si (pour un ou tous) plongement linéaire u est une
  matrice unipotente.
- G est unipotent ssi tous ses éléments (G(kbar) sont unipotents ss'il existe un
  plongement linéaire de G dans U_n (le groupe unipotent de GL_n)
- G est résoluble ssi G(kbar) est résoluble

Structure: G connexe résoluble/kbar
- G est isomorphe à un sous-groupe de T_n (les matrices triangulaires sup)
  [Lie-Kolchin]
- \exist! G_u sous-groupe unipotent connexe distingué maximal
  (G_u= G \inter U_n \subset T_n)
- si T est un sous-tore maximal de G, G=G_u x| T
  ces tores sont conjugués par les éléments de G(kbar)

G gpe alg/k
- R(G), le radical de G est l'unique sous-groupe connexe résoluble
  distingué maximal
- R_u(G), le radical unipotent de G est l'unique sous-groupe connexe
  unipotent distingué maximal
  R_u(G)=R(G)_u
- G semisimple ssi R(G_kbar)=0 (ex SL_n); G réductif si R_u(G_kbar)=0, ie si le
  radical sur kbar est un tore (ex GL_n)
- G réductif => G isogène à D(G)xR(G) où D(G) (le groupe dérivé) est un
  tore.

Sous-groupe de borel B: sous-groupe connexe résoluble maximal
- ils sont conjugués
- G/B est une variété projective
- N_G(B)=B
- G=\union gBg^-1
Prop (Borel): G connexe résoluble agit sur V propre => il existe un point fixe

Rang: la dimension d'un tore max. Le k-rang est la dimension d'un k-tore
déployé max. anisotrope: k-rang=0

Théorème de Chevalley:
les groupes algébriques sur kbar sont classifiés par leur systèmes de
racines
De plus on a un théorème d'existence sur k, donc la classification sur k
revient à étudier les formes et donc l'action du groupe de Galois sur les
systèmes de racines.

Décomposition des groupes algébriques
-------------------------------------

SOME ASPECTS OF THE STRUCTURE AND REPRESENTATION THEORY OF ALGEBRAIC GROUPS
DAVID CORWIN

Algebraic groups have a relatively well-behaved decomposition. First, note
that a disconnected (equivalently reducible) algebraic group has a normal
subgroup which is the irreducible component of the identity, and the
quotient is finite. Any connected algebraic group G has a normal subgroup
G_1 such that G/G_1 is projective as a variety (hence called an abelian
variety), and G_1 is affine as a variety. Next, G_1 has a normal subgroup
G_2 such that G_1/G_2 is semisimple (in other words, it is a direct product
of simple groups up to isogeny), and G_2 is solvable. Next, G_2 has a
normal subgroup G 3 such that G_2/G_3 is a torus (isomorphic to a direct
product of multiple copies of K × ), and G_3 is unipotent, meaning it is
a closed subgroup of the group of unipotent matrices of some dimension
(matrices equal to the identity plus a nilpotent matrix, or equivalently
matrices that in some basis are upper triangles with ones along the
diagonal).

The decomposition is in some sense unique, and we can characterize various
types of groups (e.g. unipotent groups, tori, semisimple groups) as groups
such that their other components are trivial. Furthermore, the structure
greatly influences the representations. For example, a finite- dimensional
representations of a semisimple algebraic group decomposes uniquely as a
direct sum of irreducible representations, and all representations of
unipotent groups consist entirely of unipotent transformations.

Theorem 2.9 (Jordan-Chevalley Decomposition). Let G be a (linear) algebraic group. Then for any g ∈ G, there exists g_s, g_u ∈ G such that g=g_s g_u = g_u g_s , ρ(g_s) is semsimple, and ρ(g_u) is unipotent (\rho représentation fidèle).
Furthermore, these are preserved under morphisms G→G'.
(et donc pour toute représentation g_s est semi-simple et g_u unipotent)

Cohomologies
============

Types de cohomologies
---------------------

* https://en.wikipedia.org/wiki/Monsky%E2%80%93Washnitzer_cohomology
Defined for non-singular affine varieties over fields of positive characteristic p. Lift the variety to characteristic 0, and then take a suitable subalgebra of the algebraic de Rham cohomology of Grothendieck (1966)

* https://en.wikipedia.org/wiki/K%C3%A4hler_differential#de_Rham_cohomology
 = hypercohomology of the de Rham complex

* https://en.wikipedia.org/wiki/Crystalline_cohomology

  Crystalline cohomology is a Weil cohomology theory for schemes X over a
  base field k. Its values Hn(X/W) are modules over the ring W of Witt
  vectors over k.

  Crystalline cohomology only works well for smooth proper schemes. Rigid
  cohomology extends it to more general schemes.
  
  Motivation: One idea for defining a Weil cohomology theory of a variety X
  over a field k of characteristic p is to 'lift' it to a variety X* over
  the ring of Witt vectors of k (that gives back X on reduction mod p),
  then take the de Rham cohomology of this lift. The problem is that it is
  not at all obvious that this cohomology is independent of the choice of
  lifting.
  
  The idea of crystalline cohomology in characteristic 0 is to find a
  direct definition of a cohomology theory as the cohomology of constant
  sheaves on a suitable site
      Inf(X)
  over X, called the infinitesimal site and then show it is the same as the
  de Rham cohomology of any lift.
  
  The site Inf(X) is a category whose objects can be thought of as some
  sort of generalization of the conventional open sets of X. In
  characteristic 0 its objects are infinitesimal thickenings U→T of Zariski
  open subsets U of X. This means that U is the closed subscheme of a
  scheme T defined by a nilpotent sheaf of ideals on T; for example,
  Spec(k)→ Spec(k[x]/(x2)).
  
  Grothendieck showed that for smooth schemes X over C, the cohomology of
  the sheaf OX on Inf(X) is the same as the usual (smooth or algebraic) de
  Rham cohomology.

* https://en.wikipedia.org/wiki/Rigid_cohomology
 It extends crystalline cohomology to schemes that need not be proper or smooth, and extends Monsky–Washnitzer cohomology to non-affine varieties.

https://mathoverflow.net/questions/11648/current-status-of-crystalline-cohomology
https://mathoverflow.net/questions/47950/comparison-of-de-rham-cohomology-and-etale-cohomology

* https://ncatlab.org/nlab/show/syntomic+cohomology
Syntomic cohomology is the abelian sheaf cohomology of the syntomic site of a scheme. It is a pp-adic analogue of Deligne-Beilinson cohomology.
It is closely related to the crystalline cohomology of that scheme. It may be regarded as a pp-adic absolute Hodge cohomology.

Dualité
-------

* Références sur la dualité de Grothendieck
- https://www.springer.com/fr/book/9783540411345
  Grothendieck Duality and Base Change
  Authors: Conrad, Brian
  + Cf appendix B: lien entre la dualité sur une courbe
  et la dualité sur l'espace tangent de sa Jacobienne.
- https://www.springer.com/gp/book/9783540854197
  Foundations of Grothendieck Duality for Diagrams of Schemes
  Authors: Lipman, Joseph, Hashimoto, Mitsuyasu 
  + contient des notes sur les catégories dérivées
  Cours + Slides sur le livre: https://www.math.purdue.edu/~lipman/Spain/

* Dualité de Grothendieck, Conrad Th 4.3.1:
  Rf_* RHom°_X(F°,G°) -> RHom°_Y(Rf_* F°, Rf_* G°) induit
  un morphisme de dualité
  Rf_* RHom°_X(F°,f^#G°) -> RHom°_Y(Rf_* F°, G°) 
  qui est un iso quand f:X->Y proper CM morphism with pure relative
  dimension and Y loc. noetherian.

* Serre duality: https://en.wikipedia.org/wiki/Serre_duality

* Rappel sur intersection complète:
regular/smooth => loc. complete intersection => Cohen-Macauley.

Cf https://mathoverflow.net/questions/27197/local-complete-intersections-which-are-not-complete-intersections
   https://math.stackexchange.com/questions/726937/what-does-it-mean-geometrically-for-a-variety-to-be-locally-a-complete-intersect
   https://stacks.math.columbia.edu/tag/00S8 10.133 Local complete intersections

Ex: a reduced curve is l.c.i.
     Cf https://warwick.ac.uk/fac/sci/maths/people/staff/fbouyer/ag4nt/ag_for_nt_10.pdf Curves over a field are l.c.i except if they have an embedded point

* http://math.uchicago.edu/~may/REU2013/REUPapers/Fung.pdf
SERRE DUALITY AND APPLICATIONS, JUN HOU FUNG

Theorem 2.1 (Serre duality for P^n_k). Let k be a field and P=P^n_k be projective n-space over k. Let ω_P be the sheaf O_P(−n−1) and let F be a coherent sheaf. Then for 0≤r≤n, the Yoneda pairing H^r(P,F)×Ext^{n−r}_P(F,ω_P)→H^n(P,ω_P)=k is perfect

Definition 2.25.Let X be a proper scheme of dimension r over a field k. A dualizing sheaf for X is a coherent sheaf ω◦_X on X together with a trace morphismt: H^r(X,ω◦_X)→k such that for all coherent sheaves F on X, the natural pairing Hom(F,ω◦_X)×H^r(X,F)→H^r(X,ω◦X) followed by t induces an isomorphism y0(F):Hom(F,ω◦_X)→H^r(X,F)^∗.

It exists for any proper scheme. For a projective scheme of dimension r in P^n_k: ω◦_X=Ext^{n−r}_P(O_X,ω_P).

Theorem 2.31 (Duality for a projective scheme)
There is a natural map: y_i(F): Ext^{r−i}_X(F,ω◦_X)→H^i(X,F)

Theorem 2.34. Let P be an S-scheme and X a closed subscheme with sheaf
of ideals I, with relative dimensions n and r respectively.
(a) If X is regularly immersed in P and F is a quasicoherent OX-module, thenthere exists an isomorphism φ:Ext^{n−r}_P(O_X,F)∼→ Hom_X(∧^r(I/I^2),F/IF).
(b) If X and P are smooth over S, then the canonical sheaf ω_X/S is isomorphic to Ext^{n−r}_P(O_X,ω_P/S). In
particular, if P is the k-scheme P^n_k, then the canonical sheaf ω_X is isomorphic to Ext^{n−r}_P(O_X,ω_P)=ω◦_X, the dualizing sheaf.

Theorem 2.35. Let k be a field, P=P^n_k, and ω_P=O^P(−n−1) the dualizing sheaf for P. Let X be a closed subscheme of dimension r, ω_X=Ext^{n−r}_P(O_X,ω_P) the dualizing sheaf for X, and F a coherent OX-module. Then for all s≤r,
the following are equivalent.
(i) The map Ext^{r−i}_X(F,ω_X)→H^i(X,F)^∗ is an isomorphism for all r−s≤i≤r.
(ii) H^i(X,O_X(−m)) = 0 for large m and r−s≤i<r.
(iii) Ext^{n−i}_P(O_X,ω_P) = 0 for r−s≤i<r.

Corollary 2.36. Suppose the same conditions from the theorem above hold.
Then (a) Hom_X(F,ω_X)∼→ H^r(X,F)^∗ is always an isomorphism.
 (b) The map Ext^{r−i}_X(F,ω_X)→H^i(X,F)^∗ is an isomorphism for all i iff X is Cohen-Macaulay

[Preuves:
Theorem 2.2: Si X affine noth. scheme, F qc, H^i(X,F)=0 pour tout i>0 [et c'est connu que ça caractérise les schémas affines]

Theorem 2.3: (Grothendieck vanishing) X noeth topological space, F sheaf of abelian groups, H^i(X,F)=0 for i>dim X.

Theorem 2.4: Si S=A[x0,...,xn], A noeth ring, P=Proj S=P_A^n.
Alors \Gamma_*(O_P):=\sum H^0(P, O_P(m))=~ S, H^n(P, O_P(-n-1))=A et
H^i(P, O_P(m))=0 pour 0<i<n

Theorem 2.9 (Serre): si X projectif au dessus de A, F coherent, alors pour
m assez grand F(m) est généré par un nombre fini de sections globales.
Cor 2.11 (Serre finiteness and vanishing): les modules H^i(X,F) sont de type fini sur A; et H^i(X, F(l))=0 pour tout l>=l0 et i>0.

Theorem 2.10 (Yoneda/Cartier pairing): si C, D catégories abéliennes, C a
assez d'injectifs, F:C->D additif exact à gauche. Alors on a un couplage
\delta-fonctoriel R^p F(A) x Ext_C^q(A,B) -> R^{p+q} F(B)

De la suite spectrale H^p(X,Ext^q_X(F,G)) ⇒ Ext^{p+q}_X(F,G) on en déduit
Corollary 2.22. If F is locally free of finite type, Ext^p_X(F,G)=∼=H^p(X,G⊗F^∨), where F^∨=Hom_X(F,O_X).

Proposition 2.24. Let i:X→P be a closed immersion of ringed spaces, E,F two O_X-modules, and G an O_P-module. Suppose E is locally free of finite type. Then there exist a spectral sequence Ext^p_X(F,Ext^q_P(E,G))⇒ Ext^{p+q}_P(E⊗F,G)
]

* Voir aussi https://rigtriv.wordpress.com/2008/05/29/serre-duality/
Si X=P^n, on a un pairing (i) hom(F,w)xH^n(X,F)->H^n(X,w)=k, et même
(ii) un iso Ext^i(F,w)->H^{n-i}(X,F)' où Ext^i(F,G)=H^i(X, Hom(F,G))
En général on dit que w_X est dualisant si on a (i), alors on a une
application comme dans (ii), qui est un iso si X suffisamment gentil [CM
cf plus haut], et dans ce cas si F est loc. libre alors
H^i(X,F)=~H^{n-i}(X, F^∨ ⊗ w_X)'

* Sur wikipedia on une construction explicite https://en.wikipedia.org/wiki/Serre_duality:
Si X équidimensionel projectif de codim r, w_X°=Ext^r_P^m(O_X, w_P^m) donne
Ext^i(F,w_X°)->H^{n-i}(X,F)*
et si X est loc. intersection complète, cette application est un iso, et on
a explicitement w_X°=w_P^m ⊗ Λ^r(I/I^2) où I est l'idéal de déf de X.

Ainsi si I=(f1, ..., fr) de degrés d_i, on a I/I^2=~O_X(-d_1)+O_X(-d_2)+...
donc Λ^r(I/I^2)=O_X(d_1+...+d_r) d'où comme w_P^m=O(-m-1)
w_X°=O_X(d_1+...+d_r-m-1).
For example, the dualizing sheaf of a plane curve of degree d is given by O_X(d−3).
This is a special case of the proof of the adjunction formula:

* https://en.wikipedia.org/wiki/Adjunction_formula
Let X be a smooth algebraic variety or smooth complex manifold and Y be a smooth subvariety of X, if ideal sheaf I. The conormal exact sequence 0->I/I^2->i*Ω_X->Ω_Y->0 gives
     ω_Y = i∗ω_X ⊗ det(I/I^2)^∨

- The particular case of a smooth divisor
Suppose that D is a smooth divisor on X. Its normal bundle extends to a line bundle O(D) on X, and the ideal sheaf of D corresponds to its dual O(−D) . The conormal bundle I/I^2 is i∗O(−D), which, combined with the formula above, gives
    ω_D = i∗(ω_X⊗O(D)).
In terms of canonical classes, this says that
    K_D = (K_X+D)|D.

- Applications to curves: The genus-degree formula for plane curves can be deduced from the adjunction formula

* https://mathoverflow.net/questions/215463/serre-duality-over-a-non-algebraically-closed-field
Ext^i(F,ω)→H^{n−i}(X,F)^∨
The proof [that this is an isomorphism] works verbatim for any projective Cohen-Macaulay scheme of pure dimension n over any field.

A proof via specializing Grothendieck duality. It is probably useful for people to see this worked out. Say f:X→Spec k is the structural map and its proper and X is just a scheme of finite type over k, say F is a coherent sheaf on X (for simplicity). Then Grothendieck duality says that
Rf_∗ RHom_{O_X}(F,f^!k)≃RHom_k(Rf_∗F,k).

- Analyzing the Left side
If X is Cohen-Macaulay, then f_!k is a canonical module on X with a shift (locally by the dimension, note that Cohen-Macaulay means it is locally equidimensional). => = Ext^i(F,ω_X)
- Analyzing the right side
  RHomk(∙,k) is just the derived functor of k-vector space duality
  => (H^{d−i}(X,F))^∨

* https://mathoverflow.net/questions/58559/dualizing-sheaf-of-a-nodal-curve
I'm trying to understand the dualizing sheaf ωC on a nodal curve C, in particular why is H^1(C,ω_C)=k, where k is the algebraically closed ground field. I know this sheaf is defined as the push-forward of the sheaf of rational differentials on the normalization C~ of C with at most simple poles at the points lying over the nodal points of C and such that the sum of residues at the two points lying over the node will be zero.

If C~ is the normalization, with two points x and y being identified under the map π:C~→C to the node z of C, then we have an exact sequence
0→Ω^1_C~→Ω^1_C~(x+y)→kx⊕ky→0,
where kx and ky are the skyscraper sheaves at the points x and y. Pushing forward (which is exact because the map π is finite, and so in particular affine) we get an exact sequence
0→π∗Ω^1_C~→π∗Ω^1_C~(x+y)→k⊕2z→0.
In conclusion, we have an exact sequence 0→π∗Ω^1_C~→ω_C→kz→0.
Now taking cohomology (and recalling that H^i(C,π∗F)=Hi(C~,F) for a coherent sheaf on C~), we obtain
0→H0(C~,Ω1C~)→H0(C,ωC)→H0(C,kz)→H1(C~,Ω1C~)→H1(C,ωC)→0.
(The point here being that H1 of a skyscraper sheaf such as kz vanishes.)
I claim that in this exact sequence the map H1(C~,Ω1C~)→H1(C,ωC)
is an isomorphism, and hence that the latter is one-dimensional, since the former is.
Indeed the map H0(C,ωC)→H0(C,kZ)=k is surjective: the residue theorem guarantees the existence of sections of H0(C,ωC) which have non-zero residues at x and y when pulled back to C~

* https://math.stackexchange.com/questions/42818/line-bundles-on-singular-curves

Let X˜ be the normalization of X, and let x0 and x1 be the two points of X˜ lying above the node x.

If L˜ is a line bundle on X˜ and ϕ is an element of Isom(L˜x0,L˜x1), then you can make a line bundle L on X by identifying the fibres L˜x0 and L˜x1 via ϕ.
Thus line bundles on X are the same as pairs (L˜,ϕ) where L˜ is a line bundle on X˜ and ϕ is an isomorphism between L˜x0 and L˜x1.
The Gm-action is just the action on ϕ given by scaling.

If x is a separating node, then the situation is different: the normalization is not connected, it has two pieces, say X0 and X1, each with a unique point x0 and x1 lying over x.
 Again, this identification is only determined up to scaling by an element of Gm, but if we choose two different identifications, which say differ by a scaling factor of λ, we nevertheless get the same line bundle on X, the reason being that we can apply the automorphism 1×λ to the line bundle L0∐L1 on X0∐X1 (i.e. the automorphism which is 1 on the first factor and multiplication by λ on the second factor), and this will take the first identification to the second.

* https://web.northeastern.edu/castravet/MATH518/victor.pdf
Picard Groups of Affine Curves
Victor I. Piercey

Proposition 3.20. Let X′ be a nonsingular curve embedded in projective space P^n. Let Z={p1,...,pk}⊂X′ be a finite subset of the points of X and let U=X′\Z. Then there is an exact sequence: Z^k→Cl(X′)→Cl(U)→0

- 4.1  Projective Modules over Fiber Product
Si A=A1 x_S A2, (tel que A1->>S surjectif),
alors se donner un module M sur A revient à se donner M_i
sur A_i tels qu'on ait un iso M_1 \tens_A1 S = M_2 \tens_A2 S
(en effet sur les schémas on a Spec A=Spec A1 \cup_S Spec A2).
Si de plus les Mi sont projectifs de type fini, M aussi (et on les obtient
tous comme ça; on peut reconstruire Mi comme étant M tens_A Ai si M
projectif).

Proposition 4.14. The Picard group Pic(A) embeds into K0(A)as the group of units
[K0(A)=K-theory, ie modules projectifs finis / [P]+[Q]=[P \oplus Q]]

Theorem 4.15: on a une suite exacte
0 -> A× -> A×1⊕A×2 -> S× -∂> Pic(A) -δ> Pic(A1)⊕Pic(A2)
où δM=(Ai ⊗_A M)

- 4.2  The Conductor Square

On applique ça au 'conductor square': A1 be the normalization of A,
c le conducteur de A=l'annulateur du A-module A1/A donc on a un produit
fibré
A   -> A1
A/c -> A1/c
d'où la suite exacte:
0 → A× → A×1⊕(A/c)× → (A1/c)× →Pic(A) → Pic(A1)⊕Pic(A/c)

- 4.3  The Cusp and the Node
Pour une cusp (en genre 0, ie la dégénération d'une courbe elliptique)
Proposition 4.23. Pic(A) =k+
et pour un noeud
Proposition 4.26. Pic(B)=k×.

The geometric story for the node can be described intuitively.  Think of the elements of the Picard group as line bundles.  The normalization of B corresponds to an affine, non-singular rational curve Y1≈A^1_k=Spec(k[t]). Since Pic(Y1)is trivial, the only line bundle over Y1 is the trivial line bundle Y1×k.The map from B to B1 corresponds to a map from the corresponding curve Y to Y1 that separates the node on X into two distinct points p1,p2 on Y1. Every line bundle over Y corresponds to some identification of the fibers through p1 and p2 of the trivial line bundle over Y1. There is a one-to-one correspondence between the possible identifications of the fibers and the transition maps in a local trivialization. The transition maps are in a one-to-one correspondence with maps from the trivializing open neighborhood of the node into the general linear group over k with rank one. This is precisely k×. In other words, every transition map is given by multiplication by some unit u∈k×, hence Pic(Y)∼=k×.

Limites projectives de schémas
==============================

Référence: Ega IV.8
I filtrant, A_i système inductif d'anneaux, A sa limite inductive.
Si X_a est un schéma sur A_a, on peut considérer X_j=X_a x_{A_a} A_j
et X=X_a x_{A_a} A. Alors X est la limite projective des X_j.
Essentiellement, quand on est de présentation finie, X a une propriété (P)
équivaut à X_a a la propriété (P) pour tout $a$ assez grand; et de même
pour les propriétés des morphismes ou des O_X modules. De plus se donner un
A schéma X de présentation finie sur A <=> se donner un A_i schéma de X_i
de présentation finie, pour i assez grand; et alors X=X_i x_{A_i} A. De
même pour les O_X modules de présentation finie, leurs morphismes, les
morphismes de A-schémas de présentation finie, etc.

Exemples:
- U_i voisinages affines décroissant d'un point y \in Y; la limite
  inductive des O(U_i) est l'anneau local O_y.
  En particulier, Y intègre et y=point générique, se donner un schéma de
  prés finie sur K=k(Y) <=> se donner un schéma de prés finie sur un ouvert
  assez petit de Y.
  Ici les morphismes de transitions U_i -> U_j sont plats (ce sont des
  immersions ouvertes)
- Cas A_i des corps, A=lim A_i est donc un corps. Eg si K/k est une
  extension de corps, on peut voir K comme la limite inductive d'extensions
  de type fini de k.
  Ici les morphismes de transitions sont fidèlement plats.
- Pour des propriétés locales en Y, on peut considérer une section affine A,
  A est alors un anneau quelconque, mais peut-être vu comme limite
  inductive de Z-algèbres de type finis.
  Ainsi on peut souvent (quand on est de prés finie) se ramener au cas
  Noethérien.

Prop (8.3.8):  (S limite projective des S_i [EGA montre que la limite S
projectif de schémas affines S_i sur une base S_0 existe, et que O_S est la
limite inductive des O_S_i, et topologiquement S est la lim proj des S_i.
Si X_i0->S_i0, on déf X_i=X_i0 x S_i0 S_i, alors la lim proj des X_i est X.])
- S->S_i est dominant/surjectif ssi S_j->S_i dominant/surjectif pour tout j>=i
- si les S_j->S_i sont (fidèlement) plats pour i, j assez grands, S->S_i
  est (fidèlement) plat
- si S->S_i est surjectif pour i assez grand, alors S->S_i est
  (universellement) ouvert ssi S_j->S_i est (universellemnt) ouvert pour
  tout j>=i.

Th (8.3.11): si un des S_i est qcqs, alors il y a bijection entre
l'ensemble des parties (resp. les parties constructibles, resp. les parties
constructibles ouvertes, resp. les parties constructibles fermées, resp.
les parties constructibles loc. fermées) sur X et les limites ind de ces
parties sur les X_i. Ainsi, si Z est constructible dans X et vient de la limite
des Z_i, alors Z est ouverte (resp fermée, resp loc fermée) si Z_i est
ouvert (resp...) pour un $i$.

Prop 8.4.1: si un des S_i est qcqs, si S est noeth, alors S_i irréductible
pour i assez grand => S irréd, et S_i connexe pour i assez grand => S
connexe. Si de plus S_i->S_j est dominant (ou un homéo sur un sous-espace),
alors {composantes irréd de S} =~ {composantes irrés de S_i} via Z->
\overline{u_i(Z)}; et de même pour les composantes connexes.

Prop 8.7.1: si les S_i sont réduits, S est réduit.

Th 8.5.2: si S_0 est *qcqs*, un O_S-module quasi-cohérent F de *présentation
finie* vient d'un F_i (de prés. finie) sur S_i. De plus, si F=lim proj F_i
(F_i quasi cohérent prés finie), G=lim proj G_i (G_i quasi cohérent), alors
Hom(F,G)=lim ind Hom(F_i, G_i). Et f:F->G est un iso ssi un des f_i est un
iso (et donc F et G sont isomorphes si F_i est isomorphe à G_i pour un i).
En appliquant à F=O_S, on a \Gamma(O_S)=lim ind \Gamma(O_S_i).
Les propriétés suivantes sont vraies sur F si elle est vraie pour un F_i:
- F loc libre
- F->G->H->0 exacte
- F->G surjectif
- 0->F->G->H->0 exacte (si les S_i->S_j sont plats!)
- F->G injectif (si les S_i->S_j sont plats!)

Prop 8.6.3: si S_0 est *qcqs* il y a bijection entre les sous-schémas de
prés finies de S et les lim inductives de tels sous-schémas sur les S_i;
idem pour ceux qui sont de plus ouverts/fermés.

# Galois theory of schemes

Références:
- SGA1
- Lenstra: https://websites.math.leidenuniv.nl/algebra/GSchemes.pdf
- http://www.math.toronto.edu/~jacobt/Lecture7.pdf
  Des exemples de groupes étales fondamentaux

# Deformation

- https://en.wikipedia.org/wiki/Kodaira%E2%80%93Spencer_map
The Kodaira–Spencer map is[1]
    δ : T_0 S → H^1(X,TX)
where
    XX → S is a smooth proper map between complex spaces[2] (i.e., a deformation of the special fiber X=XX_0
    δ is the connecting homomorphism obtained by taking a long exact cohomology sequence of the surjection T XX|X → T_0 S ⊗ O_X
The basic fact is: there is a natural bijection between isomorphisms classes of Xx → S = Spec(C[t]/t^2) and H^1(X,TX)

- https://math.stackexchange.com/questions/1322093/why-does-infinitesimal-lifting-imply-triviality-of-infinitesimal-deformations/1322196#1322196
Let X be an affine nonsingular scheme of finite type over some algebraically closed field k. Let D=k[ϵ]/(ϵ^2), and let X′ be an infinitesimal deformation of X over D (ie, the X′ is flat over D, and the reduced fiber is X).
Then X' is trivial: X′=X ×_k D.
(Note that the proof works also if we replace D by any local Artin k-algebra)

Voir aussi:
- http://math.stanford.edu/~conrad/vigregroup/vigre05/gm.pdf
  THE θ OPERATOR by Nick Ramsey
- Yves André, On the Kodaira-Spencer map of abelian schemes
  https://arxiv.org/abs/1606.03691
- Le cours: https://math.berkeley.edu/~robin/math274root.pdf
  Math274, Lectures on Deformation Theory Robin Hartshorne

# GAGA

* Kodaira embedding theorem:
Let X be a compact Kähler manifold, and L a holomorphic line bundle on X. Then L is positive line bundle if and only if there is a holomorphic embedding ϕ : X → P of X into some projective space such that ϕ∗OP(1) = L^⊗m for some m>0.

https://en.wikipedia.org/wiki/Positive_form#Positive_line_bundles
In algebraic geometry, positive (1,1)-forms arise as curvature forms of ample line bundles (also known as positive line bundles). Let L be a holomorphic Hermitian line bundle on a complex manifold,
    ∂¯ : L ↦ L ⊗ Λ^0,1(M)
its complex structure operator. Then L is equipped with a unique connection preserving the Hermitian structure and satisfying
    ∇^0,1=∂¯ 
This connection is called the Chern connection.
The curvature Θ of a Chern connection is always a purely imaginary (1,1)-form. A line bundle L is called positive if
    iΘ
is a positive definite (1,1)-form. The Kodaira embedding theorem claims that a positive line bundle is ample, and conversely, any ample line bundle admits a Hermitian metric with iΘ positive.

Plus de détails ici:
https://johncarlosbaez.wordpress.com/2018/12/26/geometric-quantization-part-2/
Suppose we have a compact complex manifold M equipped with a holomorphic complex line bundle L \to M. Given any hermitian metric on L, this bundle has a unique connection D called the Chern connection with the properties sketched in my article. The curvature of this connection is a (1,1)-form; let’s call it \Theta.
We say L is positive if there exist a hermitian metric on it such that
  \omega = \frac{i}{2\pi} \Theta}
is the imaginary part of a Kähler structure on M. This is equivalent to demanding that
  \omega(v, Jv) > 0
for every nonzero tangent vector v.

The Kodaira embedding theorem says that if L is positive then M can be embedded as a submanifold of CP^n for some sufficiently large n in such a way that for some sufficiently large k, L^{\otimes k} is isomorphic to the pullback of the dual of the tautological line bundle over CP^n.
We can go further using Chow’s theorem: M actually embeds as a projective variety in CP^n.

We can say all this a bit differently if we start with a compact Kähler manifold M. Then the imaginary part of the Kähler structure is a (1,1)-form \omega. We say \omega is integral if it represents an integral element of deRham cohomology.
If \omega is integral we say the Kähler structure on M is a Hodge metric and call M a Hodge manifold. In this case we can find a hermitian holomorphic line bundle L over M whose Chern connection has curvature \Theta with
  \frac{i}{2\pi} \Theta = \omega

And so, in this case M can be embedded as a projective variety in CP^n for some sufficiently large n in such a way that for some sufficiently large k, L^{\otimes k} is isomorphic to the pullback of the dual of the tautological line bundle.

# Analytic spaces

* https://en.wikipedia.org/wiki/Rigid_analytic_space
The basic rigid analytic object is the n-dimensional unit polydisc, whose ring of functions is the Tate algebra T_n, made of power series in n variables whose coefficients approach zero in some complete nonarchimedean field k. 
An affinoid algebra is a k-Banach algebra that is isomorphic to a quotient of the Tate algebra by an ideal.
A rigid analytic space over k is a pair (X , O X) describing a locally ringed G-topologized space with a sheaf of k-algebras, such that there is a covering by open subspaces isomorphic to affinoids.

Raynaud: the category of quasi-compact quasi-separated rigid spaces over k is
equivalent to the localization of the category of quasi-compact admissible
formal schemes over R with respect to admissible formal blow-ups. Here, a
formal scheme is admissible if it is coverable by formal spectra of
topologically finitely presented R algebras whose local rings are R-flat.

Vladimir Berkovich reformulated much of the theory of rigid analytic spaces
in the late 1980s, using a generalization of the notion of Gelfand spectrum
for commutative unital C*-algebras. The Berkovich spectrum of a Banach
k-algebra A is the set of multiplicative semi-norms on A that are bounded
with respect to the given norm on k, and it has a topology induced by
evaluating these semi-norms on elements of A.

* https://en.wikipedia.org/wiki/Berkovich_space

* https://en.wikipedia.org/wiki/Perfectoid_space 
Perfectoid spaces are adic [=rigid analytic space] spaces of special kind,
which occur in the study of problems of "mixed characteristic", such as local
fields of characteristic zero which have residue fields of characteristic prime
p. 

A perfectoid field is a complete topological field K whose topology is
induced by a nondiscrete valuation of rank 1, such that the Frobenius
endomorphism Φ is surjective on K°/p where K° denotes the ring of
power-bounded elements.

The tilting equivalence is a theorem that the tilting functor (-)♭ induces
an equivalence of categories between perfectoid spaces over K and
perfectoid spaces over K♭ [which is of carac p]
Almost purity theorem:
Let K be a perfectoid field.
- If X → Y is a finite étale morphism of adic spaces over K and Y is
perfectoid, then X also is perfectoid;
- A morphism X → Y of perfectoid spaces over K is finite étale if and only if
the tilt X♭ → Y♭ is finite étale over K♭.

# Stacks and algebraic spaces

Algegraic space
---------------

* https://www.math.columbia.edu/~dejong/wordpress/?p=260
Given an algebraic space X we obtain a ringed topos (Sh(X_{etale}), O_X) of sheaves on the small etale site of X endowed with the structure sheaf. This is a locally ringed topos (as in SGA4, Expose IV, Exercise 13.9). Moreover, a morphism X —> Y of algebraic spaces induces a morphism of ringed topoi in the same direction. In fact it is a morphism of locally ringed topoi (see reference above for definition). In fact I think that
  Mor(X, Y) —> Mor( (Sh(X_{etale}), O_X), (Sh(Y_{etale}), O_Y) )
is a bijection, i.e., the category of algebraic spaces is a full subcategory of the category of locally ringed topoi. This is sooooo cool!

Voir aussi https://www.math.columbia.edu/~dejong/wordpress/?p=322 pour les
DM stack.

* https://en.wikipedia.org/wiki/Algebraic_space
An algebraic space X comprises a scheme U and a closed subscheme R ⊂ U × U satisfying the following two conditions:
    1. R is an equivalence relation as a subset of U × U
    2. The projections pi: R → U onto each factor are étale maps.
Rem: One can assume that R and U are affine.

* Algebraic spaces as sheaves

An algebraic space X can be defined as a sheaf of sets
    XX : ( Sch / S )_et^op→Sets 
such that
    - There is a surjective etale morphism X → XX
    - the diagonal morphism Δ XX / S : XX → XX × XX is representable. 
      This is equivalent to the property that given any schemes Y , Z and morphisms h_Y , h_Z →XX, their fiber-product of sheaves h_Y × XX h_Z is representable by a scheme over S.
      [cf https://stacks.math.columbia.edu/tag/0021 4.8 Fibre products and representability]

* Références:
https://ncatlab.org/nlab/show/algebraic+space
https://mathoverflow.net/questions/3194/what-are-the-benefits-of-using-algebraic-spaces-over-schemes
https://mathoverflow.net/questions/292728/clarifying-an-interpretation-of-algebraic-spaces
https://mathoverflow.net/questions/11226/commutative-rings-to-algebraic-spaces-in-one-jump
  The T-V approach just means this: an algebraic space with affine diagonal is the same as a sheaf X on Aff which is covered by affines U_i such that each U_ij := U_i \times_X U_j is affine and etale over U_i and U_j. A general algebraic space is the same except that you only require that each U_ij is an algebraic space with affine diagonal (instead of being affine).

* https://stacks.math.columbia.edu/tag/04KL
Fully Faithfull Embedding of algebraic spaces into locally ringed topoi
X->(X_ét, O_X).

## Stacks

* https://en.wikipedia.org/wiki/Stack_(mathematics)
An algebraic stack or Artin stack is a stack in groupoids X over the etale site such that the diagonal map of X is representable and there exists a smooth surjection from (the stack associated to) a scheme to X. A morphism Y → X of stacks is representable if, for every morphism S → X from (the stack associated to) a scheme to X, the fiber product Y ×X S is isomorphic to (the stack associated to) an algebraic space.

The motivation behind the representability of the diagonal is the following: the diagonal morphism Δ : XX → XX × XX is representable if and only if for any pair of morphisms of algebraic spaces X , Y → XX their fiber product X ×_XX Y is representable.

A Deligne–Mumford stack is an algebraic stack X such that there is an étale surjection from a scheme to X. Roughly speaking, Deligne–Mumford stacks can be thought of as algebraic stacks whose objects have no infinitesimal automorphisms.

* https://www.math.columbia.edu/~dejong/wordpress/?p=346
DM stacks as locally ringed topoi
Suppose that (Sh(C), O) is a locally ringed topos. When is this the small etale topos of a DM stack? I think the condition is just that it is “locally isomorphic to the small etale topos of a scheme”.

Preuve: The condition means there exists a sheaf F in Sh(C) such that the localization (Sh(C)/F, O_F) is isomorphic to (Sh(U_{etale}), O_U) as a locally ringed topos. Consider the product sheaf FxF and think of it as a sheaf over F via one of the projections. Via the isomorphism Sh(C)/F = Sh(U_{etale}) we can think of FxF as an etale sheaf on U. Since every sheaf  on U_{etale} is representable by an algebraic space over U we conclude that (Sh(C)/FxF, O_{FxF}) is isomorphic to (Sh(R_{etale}), O_R) for some algebraic space R. By the fully faithfulness discussed in previous posts we obtain two morphisms s, t : R —> U. Moreover, we can do the same trick with FxFxF and obtain a composition morphism R x_U R —> R (this will require a bit of work relating fibre products of etale morphisms of algebraic spaces to what happens on the side of small etale topoi, but I’m not worried). Hence (U, R, s, t, c) will be an etale groupoid algebraic space. The final step is to show that the DM-stack X = [U/R] has an associated locally ringed small etale topos (X_{etale}, O_X) which is equivalent to the locally ringed topos we started out with.

* Références:
- https://golem.ph.utexas.edu/category/2009/06/algebraic_geometry_for_categor.html
- https://perso.math.univ-toulouse.fr/btoen/videos-lecture-notes-etc/
  Bertrand Toën, A master course on algebraic stacks (Toulouse 2005)
- https://maths-people.anu.edu.au/~alperj/papers/stacks-guide.pdf
  A  GUIDE  TO  THE  LITERATURE  ON  ALGEBRAIC  STACKS, JAROD ALPER
  Disponible ici aussi: https://stacks.math.columbia.edu/tag/03B0
- https://math.berkeley.edu/~molsson/qcohrevised.pdf
  SHEAVES ON ARTIN STACKS, MARTIN OLSSON
  We develop a theory of quasi–coherent and constructible sheaves on algebraic stacks correcting a mistake in the recent book of Laumon and Moret-Bailly.
- http://www.maths.mic.ul.ie/hoffmann/allahabad.pdf
  The moduli stack of vector bundles on a curve
  (Quick exemple of a moduli problem represented by a stack)
- https://arxiv.org/pdf/alg-geom/9609014.pdf
  Algebraic (geometric) n-stacks Carlos Simpson

Algebraic stacks are a class of geometric/presentable class:
https://ncatlab.org/nlab/show/geometric+stack
https://mathoverflow.net/questions/27399/when-is-a-stack-not-geometric
Cf aussi Pronk, Etendues

## Bootstrap et Critère d'Artin

### Laumont-Laurent-Morret-Bailly:
- Cas d'un espace algébrique:

Note: un espace algébrique est un faisceau our la topologie fppf.
Si g:X->Y est un morphisme ffpf d'espaces algébrique, alors g est de
descente effective, ie "les espaces algébriques forment un S-champ fppf".

Corollaire (10.4). Soient X. une S-relation d'équivalence fppf (9.2) et X
le S-faisceau fppf quotient. (ie X1=>X0 et X=X0/X1).
On suppose que X_0 et X_1 sont des S-espaces
algébriques, que les morphismes de S-espaces algébriques pr_i o \delta sont
plats et localement de présentation finie, et que le morphisme de S-espaces
algébriques \delta est quasi-compact. Alors X est un S-espace algébrique.

Note: l'hypothèse qc vient du fait que dans le livre ils supposent leur
espace/champs algébriques qs, ie la diagonale est qc en plus d'être
représentable (et dans le cas d'un champ la diagonale est séparée).

COROLLAIRE (10.4.1). - Soit \pi: X->Y un morphisme de S-faisceaux fppf.
On suppose que :
(i) X est un S-espace algébrique
(ii) \pi est représentable, fidèlement plat et localement de présentation finie
(iii) (pr1 , pr2) : X x_Y X -> X x_S X (qui est un morphisme d'espaces
algébriques d'après (i) et (ii)) est quasi-compact.
Alors Y est un S-espace algébrique.

- Cas d'un champs:

Note: un champ algébrique X est un champ fppf, et si la diagonale est quasi
affine c'est même un champ fpqc.

Corollaire (10.5): si on a un diagramme 2-cartésien de champs fppf
X0 -> X où X0->X, Y0->Y sont des épis (fppf) et que F0:X0->Y0 est représentable
Y0 -> Y alors F:X->Y aussi.

COROLLAIRE (10.6). — Soient X. un S-faisceau fppf en groupoïdes et
X le S-champ fppf associé (cf. (9.5)). On suppose que X_0 et X_1
sont des S-espaces algébriques, que les morphismes de S-espaces algébriques
a et b de X_1 dans X_0 sont plats et localement de présentation finie, et que le
morphisme de S-espaces algébriques \delta = (a, b) : X0 -> X0 x_S X0 est séparé
et quasi-compact. Alors X est un S-champ algébrique.

Quotients:
(10.13) Soient X un S-espace algébrique, Y X un morphisme de S-espaces
algébriques et G un X-espace algébrique en groupes que l'on suppose séparé,
plat et de présentation finie sur X, opérant à droite sur le X-espace algébrique
Y.
PROPOSITION (10.13.1). - Le S-champ [Y/G /X] défini en (2.4.2) et (3.4.2)
est un S-champ algébrique. En particulier, le S-champ B(G/X) de loc. cit.
est un S-champ algébrique.

Remarque (10.13.2) : Si, de plus, on suppose G lisse sur X, le 1-morphisme
canonique Y -> [Y/G/X] est une présentation et pour que [Y/G/X] soit lisse
sur S il faut et il suffit que Y le soit.

- Caractérisation
  Th 8.1: Un champ algébrique est de Deligne-Mumford ssi la diagonale est non
  ramifiée (ie loc de type fini et formellement non ramifiée)

  COROLLAIRE (8.1.1). - Soit X un S-champ algébrique, et soit D le 1-morphisme diagonal. Les conditions suivantes sont équivalentes :
(i) X est représentable (ie est un espace algébrique) ;
(ii) X est un S-espace (ie vient d'un faisceau);
(iii) pour tout U \in ob(Aff/S) et tout x \in ob(X_U), on a Aut(x)={Id};
(iv) D est un monomorphisme de S-champs.
[En effet, plus généralement un groupoide X vient d'un préfaisceau ssi X_U
est une catégorie discrète pour tout U, ssi D est un monomorphisme, donc on
a équivalence de (ii)-(iii)-(iv). Réciproquement, on a que X est un champ
de Deligne-Mumford par le théorème + un S-espace alors la présentation
étale de X comme champ est aussi une présentation étale de X comme
faisceau, ie X est un espace algébrique].

### Stacks project

* Algebraic spaces
https://stacks.math.columbia.edu/tag/025X
Definition 57.6.1. Let S be a scheme contained in Schfppf. An algebraic
space over S is a presheaf F:(Sch/S)^opp_fppf⟶Sets with the following properties
 (i)  The presheaf F is a sheaf.
 (ii) The diagonal morphism F→F×F is representable.
 (iii) There exists a scheme U∈Ob((Sch/S)fppf) and a map h_U→F which is surjective, and étale.
[Note: https://stacks.math.columbia.edu/tag/076L montre qu'il suffit que (i) soit vraie pour la topologie étale]

Note: we only require the diagonal map for F to be representable, whereas in
[Kn] it is required that it also be quasi-compact. If F=h_U for some scheme
U over S this corresponds to the condition that U be quasi-separated.

- "Bootstrap": https://stacks.math.columbia.edu/tag/04S6
Theorem 72.10.1. Let S be a scheme. Let F:(Sch/S)^opp_fppf→Sets be a functor. Any one of the following conditions implies that F is an algebraic space:
  - F=U/R where (U,R,s,t,c) is a groupoid in algebraic spaces over S such that s,t are flat and locally of finite presentation, and j=(t,s):R→U×SU is an equivalence relation,
  - F=U/R where (U,R,s,t,c) is a groupoid scheme over S such that s,t are flat and locally of finite presentation, and j=(t,s):R→U×S U is an equivalence relation,
  - F is a sheaf and there exists an algebraic space U and a morphism U→F which is representable by algebraic spaces, surjective, flat and locally of finite presentation,
  - F is a sheaf and there exists a scheme U and a morphism U→F which is representable (by algebraic spaces or schemes), surjective, flat and locally of finite presentation,
  - F is a sheaf, ΔF is representable by algebraic spaces, and there exists an algebraic space U and a morphism U→F which is surjective, flat, and locally of finite presentation, or
  - F is a sheaf, ΔF is representable, and there exists a scheme U and a morphism U→F which is surjective, flat, and locally of finite presentation.

Preuve: 
(iii) => (vi) vient de https://stacks.math.columbia.edu/tag/046K
qui montre que U->F is representable by algebraic spaces, surjective, flat and locally of finite presentation => ΔF is representable (by schemes). 
  Preuve: comme U est algébrique, il existe un schéma U'->U étale
  surjectif; qui est donc en particulier representable, surjective, flat and locally of finite presentation, donc on peut remplacer U par un schéma; alors
  Ux_F U est un esp algébrique et U x_F U -> U x_S U is a monomorphism which is locally of finite type, hence a separated and locally quasi-finite morphism
  et on en déduit que ΔF est représentable.
(v) => (i) On pose R=U×F U; on montre que F=U/R est un espace algébrique,
et de plus U→F is surjective, flat, and locally of finite presentation (cf Lemma 72.11.6)

Applications: https://stacks.math.columbia.edu/tag/04SJ
- A sheaf which is fppf locally an algebraic space is an algebraic space.
- Any fppf descent datum for algebraic spaces is effective.
- Lemma 72.11.5 si on a un groupoid quotient stack [U/R] d'espaces algébriques,
  alors for any scheme T over S and objects x,y of [U/R] over T the sheaf
  Isom(x,y) on (Sch/T)fppf is an algebraic space. 
- Lemma 72.11.7. Let S be a scheme. Let X→B be a morphism of algebraic spaces
  over S. Let G be a group algebraic space over B and let a:G×BX→X be an action
  of G on X over B. If
   - a is a free action, and
   - G→B is flat and locally of finite presentation,
  then X/G (see Groupoids in Spaces, Definition 70.18.1) is an algebraic
  space and X→X/G is surjective, flat, and locally of finite presentation.
- Lemma 72.11.8. On peut se donner un G-torseur localement si on a les cocycle condition.

* Algebraic stacks

https://stacks.math.columbia.edu/tag/026O
Definition 86.12.1. Let S be a base scheme contained in Sch_fppf. An
algebraic stack over S is a category p:X→(Sch/S)_fppf over (Sch/S)_fppf with the following properties:
  (i) The category X is a stack in groupoids over (Sch/S)fppf.
  (ii) The diagonal Δ:X→X×X is representable by algebraic spaces.
  (iii) There exists a scheme U∈Ob((Sch/S)fppf) and a 1-morphism (Sch/U)fppf→X which is surjective and smooth1.
[Note: https://stacks.math.columbia.edu/tag/076U montre qu'il suffit que (i) soit vraie pour la topologie étale]

- https://stacks.math.columbia.edu/tag/06DB 89.16 Bootstrapping algebraic stacks

Theorem 89.16.1. Let S be a scheme. Let F:X→Y be a 1-morphism of stacks in groupoids over (Sch/S)fppf. If
  - X is representable by an algebraic space, and
  - F is representable by algebraic spaces, surjective, flat and locally of finite presentation,
then Y is an algebraic stack

- Quotient stacks:

Theorem 89.17.2. Let S be a scheme contained in Sch_fppf. Let (U,R,s,t,c) be a groupoid in algebraic spaces over S. Assume s,t are flat and locally of finite presentation. Then the quotient stack [U/R] is an algebraic stack over S.

Lemma 89.18.3. [Slogan] Let S be a scheme and let B be an algebraic space over
S. Let G be a group algebraic space over B. Endow B with the trivial action of
G. Then the quotient stack [B/G] is an algebraic stack if and only if G is flat
and locally of finite presentation over B. 

Ainsi le stack [U/R] n'est pas forcément algébrique si le groupoïde (U,R)
n'est pas fppf (ça inclu  le cas lisse). Par contre en général [U/R] a
toujours sa diagonale représentable par des espaces algébriques, cf
https://stacks.math.columbia.edu/tag/04TJ Lemme 86.17.1.

Later we will see that the quotient stack of a smooth S-space by a group
algebraic space G is smooth, even when G is not smooth (Morphisms of
Stacks, Lemma 93.32.7). 

Motifs
======

https://ncatlab.org/nlab/show/Standard+Conjectures+on+Algebraic+Cycles

https://mathoverflow.net/questions/176122/progress-on-the-standard-conjectures-on-algebraic-cycles

https://arxiv.org/pdf/1402.2155.pdf
FORGOTTEN MOTIVES:THE VARIETIES OF SCIENTIFIC EXPERIENCE Yuri I. Manin

http://www.normalesup.org/~zoghaib/math/dea.pdf
Théorie homotopique de Morel-Voevodsky et applications; Sam Zoghaib

http://tomlr.free.fr/Math%E9matiques/Andre,%20Y%20-%20Une%20Introduction%20aux%20Motifs%20%28SMF%202004%29.pdf
Livre d'Yves André: une introduction aux motifs (purs, mixtes, périodes)
