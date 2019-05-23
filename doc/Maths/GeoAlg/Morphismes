vim: ft=markdownlight fdm=expr

Type de morphismes
==================

f:X->Y

- Quasi-separated = diagonal map is qc (X->Spec Z qs coincide avec la notion habituelle de qs, ie l'intersections de deux ouverts qc est qc)
- Separated = diagonal map is a closed immersion => affine diagonal
- Propre = separated, of finite type, and universally closed
- integral = locally B/A anneau intégral ie tout élément de B est entier sur A
- fini = locally B/A anneau fini. Integral + locally of finite type => fini.
- immersion = locally closed immersion = open o closed
  Note https://stacks.math.columbia.edu/tag/03DQ,
  Si X est réduit, une immersion s'écrit aussi X -open> Xbar -closed> Y

Plus de détails sur les morphismes qc qs: http://therisingsea.org/notes/ConcentratedSchemes.pdf

Cohomologie
===========

https://stacks.math.columbia.edu/tag/02O5
Let S be a locally Noetherian scheme. Let f:X→S be a proper morphism. Let F be a coherent OX-module. Then R^i f_∗ F is a coherent OS-module for all i≥0

Anneaux locaux
==============

Si f:(A,m) -> (B,n) morphisme d'anneaux locaux, on dit qu'il est local si
f(m) \subset n <=> f^-1(n)=m
Dans ce cas f induit un morphisme sur les corps résiduels:
f: k(m) -> k(n)
On dit que f est un morphisme local.

Morphismes
==========

phi: Y->X induit par f:A->B

Par définition, f est local sur les germes, ie il induit un morphisme
f: k(phi(y)) -> k(y)

Intuitivement, à une section s de X, phi^*(s) est la section s o phi.

Topologie:
---------
- Var(I+J)=Var(I) \inter Var(J)
- Var(IJ)=Var(I \inter J)=Var(I) \union Var(J)
- Var(\inter I_i)= Adhérence(Union(Var(I_i)))
  Ainsi, p_i est dense ssi \inter p_i=Nilradical

Si D_f est un ouvert fondamental, on a
\intersection finie D_f_i = D_\prod f_i

Comme phi est continu, on a
adhérence(phi(\adhérence A)) = adhérence phi(A).
En particulier, si x est le point générique d'un fermé A, phi(x) est le
point générique du fermé adhérence phi(A).
Si les points fermés sont denses dans A, phi(x) est le point générique de
l'adhérence des phi(y), y fermé dans A.

Algèbre:
-------
- f^-1 f(I) contient I, donc f f^-1 f (I)=I
- f f^-1 (J) inclus dans J, donc f^-1 f f^-1 (J)=J

Préimage:
--------
-phi^-1 (Var I)=Var(f(I))
-phi^-1 (D_u)=D_f(u)

Image:
-----
- Adhérence(phi(Var J)) = Var(f^-1 J)

Donc f injectif => phi dominant <=> f^-1(0) inclus dans le nilradical de A
<=> f^-1(Nilrad B)=Nilrad A.
Dans ce cas si les premiers minimaux de B sont q_1, q_n, ceux de A sont
p_1, p_n avec p_i=phi(q_i)

Fibre:
-----
Il existe q dans la fibre de p <=> f^-1(f(p))=p.
[[ De plus (si p est dans l'image), alors si q est min dans S/pS ou max dans
S_p, il appartient à S_p/pS donc s'envoit sur p. !!This looks false!!]]

Preuve: - f^-1(f(p)) contient p et est inclus dans f^-1(q)=p

Produits d'idéaux
-----------------
- f^-1(I_1 \inter I_2)=f^-1(I_1) \inter f^-1(I_2)
Et donc phi(F_1 \union F_2)=phi(F_1) \union phi(F_2)

En revanche ça ne marche pas pour le produit, même si B/A est fidèlement
plat; ex: R[X]\subset C[X], I1=(X-i), I2=(X+i), f^-1(I1I2)=(X^2+1),
f^-1(I1)f^-1(I2)=(X^2+1)^2

- f(I1I2)=f(I1)f(I2)
Pr: les deux idéaux sont générés par f(i1)f(i2) où i1,i2 parcourt les
générateurs de I1,I2.

Donc f(I1) \inter f(I2) \supset f(I1 \inter I2) (= si B/A plat)
Mais le Nilrad est toujours égal. (ie: phi^-1(F1 \union F2)=phi^-1(F1)
\union phi^-1(F2))

Propriétés locales des morphismes
=================================

f: X->Y morphisme de schéma.

Déf:
- f quasicompact ssi la préimage d'un affine est qc (ie est union finie
  d'affines)
- f quasiséparé ssi la préimage d'un affine est quasiséparé
  (X noéthérien => f qcqs)
- f est affine ssi la préimage d'un affine est affine
- f est fini ssi la préimage d'un affine A est un affine B fini sur A
- f est entier ssi la préimage d'un affine A est un affine B entier sur A
- f est localement de type fini ssi pour tout affine B contenu dans la préimage
  d'un affine A, alors B est de type fini sur A
- f est de type fini ssi f est loc de type fini et f est qc, i.e. pour tout
  ouvert affine A, f^-1(Spec A) peut-être recouvert par un nombre fini de
  schémas affines de types finis sur A.
- f est loc de présentation finie ssi pour tout affine B contenu dans la
  préimage d'un affine A, B est une algèbre de présentation finie sur A.
- f est de présentation finie ssi elle est loc de présentation finie et qc
  *et* qs. I.e. pour tout ouvert affine A, f^-1(Spec A) peut-être recouvert
  par un nombre fini de schémas affines de présentations finies sur A et
  d'intersection deux à deux qc.

Prop:
- toutes ces propriétés se composent (ie f et g qc => gof qc, ...)
- f fini <=> f entier et de type fini.
- Une immersion ouverte dans X est loc de type fini (en fait elle est même
  loc de présentation finie), et si X loc noéthérien alors l'immersion est
  de type fini (car tout sous-espace de X est rétrocompact).
  Si f est loc de type fini et Y loc noeth, X est loc noeth. Si f est de
  type fini et Y noeth, X est noeth.

Th: On dit que la prop P est affine local sur la cible si il existe un
recouvrement ouvert de Y par des Y_i affine tels que f^-1(Y_i)->Y_i a P =>
f a P.
Alors les props suivantes sont affines locales sur la cible
- f qc
- f qs
- f affine
- f fini
- f entier
- f loc de type fini, f de type fini
- f loc de prés fini, f de prés fini
- f est un isomorphisme
- f est une immersion ouverte
- f est une immersion fermée

Rem: Si Y=Spec B est affine, alors f: X->Y est loc de type/prés fini ss'il
existe un recouvrement affine de X par des A_i de types/prés finis sur B.
Et donc dans le cas général, f est loc de type/prés fini ss'il existe un
recouvrement de Y par des affines B_i tels que f^-1(B_i) est recouvert par
des ouverts affines A_j de type/prés finis sur B_i.
*Attention* Il existe des variétés quasi-affines (et donc de type finis)
dont l'anneau des sections globales n'est pas de type finis.

Application: Si Z est un fermé de Spec A localement définit par une
équation, alors son complémentaire est affine.
Pr: sur un ouvert affine Spec B assez petit, Z est défini par f, donc son
complémentaire est B_f est affine. Mais être affine est cible local, donc
le complémentaire de Z est affine.

Rem: pour f iso/immersion ouvert, les propriétés sont locales sur la cible (ie ça marche pour tout recouvrement, même non affine).

Présentation finie
------------------

Th ("Si f est loc de prés finie, une prop vraie sur une germe s'étend en un
ouvert"):
f est loc de présentation fini ssi pour tout système projectifs de
Y-schémas affines S_i, on a
lim ind Hom(S_i,X)=Hom_Y( lim_proj S_i, X).

Rem: on utilise la construction suivante: si f:X -> Spec B est de
présentation finie, alors f est le pull back d'un morphisme de présentation
finie g: X'->Spec Z[x_1, ..., x_N]/I pour N assez grand.
De plus si F est quasicohérent de présentation finie sur X, on peut trouver
g tel que F soit le pullback de F' finiment présenté sur X' (bien sûr comme
X' est noéthérien, il suffit d'avoir g de type fini et F' cohérent).

Cor: si on a un morphisme d'une germe O_Z,z dans X de présentation finie, alors ce morphisme s'étend en un ouvert de Z.

Th: Soit f: X->Y dominant de type fini, génériquement fini entre schémas
intègres. Alors il y a un ouvert dense V \subset Y tel que f^-1(V)->V est
fini.

Pr: découle du Th précédent si f loc de prés finie, sinon voir Hartshorne
exo 3.7.

Going down et going up
======================

Définitions (A->B):
- Going up: si p \subset p' dans A, et il existe q au dessus de p dans B,
alors il existe q' au dessus de p' dans B. Autrement dit, si p se
spécialise en p', et q est dans la préimage de p, q se spécialise en q' au
dessus de p.

- Going down: si p \subset p' dans A, et il existe q' au dessus de p' dans B,
alors il existe q au dessus de p dans B. Autrement dit, si p' se générise
en p, et q' est dans la préimage de p', q' se générise en q au dessus de p.

Examples:
- Si B/A plat, going down.
- Si B/A entier, going up. (Ex: B/A fini, B=A/I)
  De plus, si A int clos, B intègre, going down.

Caractérisation: Going down <=> pour tout p dans Spec A, pour tout q
minimal au dessus de pA, q \inter A = p
Rem: p \in Im Spec B -> Spec A <=> Phi^{-1}(Phi(p) B)=p

Topologie
---------

Going up <=> Spec B -> Spec A fermé

Spec B -> Spec A ouverte => Going down.
Réciproquement si B/A de présentation de type fini, Going down => Ouverte

Preuve: si E \subset Spec A est constructible, E stable par spécialisation
=> E fermé. E stable par générisation => E ouvert.
On conclut par Chevalley:
http://mathoverflow.net/questions/80707/chevalleys-theorem-on-constructible-sets
    Theorem (EGA IV, 1.8.4.) Let f:X→Y be a finitely presented morphism of
    schemes (any morphism between varieties over a field is of this type).
    Then the image of any constructible subset of X under f is a
    constructible subset of Y.

Submersions
-----------

phi: Y->X est submersif si phi est surj et X a une topologie quotient de X
(ie F fermé ssi phi^{-1}F fermé).
Si phi: Spec B -> Spec A, avec A noéthérien, phi surjectif, going down
=> phi est submersif.

ex: B/A fidèlement plat, ou A \subset B, B intègre entier sur A, A intègralement clos

Théorème des fibres sur les anneaux locaux:
------------------------------------------

A -> B noethérien, q s'envoie sur p.
Alors codim q (=dim B_q) <= codim p (=dim A_p) + dim fibre spéciale (=B_q/pB_q)
Si going down, il y a égalité.

Réciproque: (A,B locaux noeth)
Si A régulier, B Cohen-Macauley et dim B = dim A + dim fibre spéciale,
alors B/A plat
Application: X,Y k-schémas irré, f:Y -> X /
- X régulier
- Y Cohen-Macauley
- f envoie les points fermés de Y sur les points fermés de X (ex: f propre)
- pour tout x \in X point fermé, f^-1(x) est de dimension dim Y - dim X
Alors f est plat.

Prop:
Si A -> B noéthérien, p_1 se spécialise en p_2
Si going-up, la dimension fibre en p_2 est plus grande que la fibre en p_1
Si going-down + B caténaire, la dimension de la fibre en p_1 est plus
grande que la fibre en p_2

Localisés
---------

Si p \subset R -> S. Supposons
(i) il y a un unique q \subset S au-dessus de p
(ii) Soit - Il y a going up
          - Going down et il y a au plus un premier dans S au dessus de
            chaque premier de R
Alors S_p = S_q

Morphismes Affines
==================
Cf https://stacks.math.columbia.edu/tag/01S5 28.11 Affine morphisms
   https://stacks.math.columbia.edu/tag/01SJ 28.12 Quasi-affine morphisms
   https://stacks.math.columbia.edu/tag/0EKF Proj and Spec

Yoneda
------

Si Y=Spec B, alors Hom(X,Y)=Hom(B, \Gamma(X)) = Hom(Spec Gamma X, Y).

(ça marche pour X schéma ou même espace localement annelé)
I.e. le foncteur Spec est un adjoint à droite du foncteur sections globales
Γ:(loc ringed space)→(rings)^op.

Dans l'autre sens:
Hom(Y,X)=X(Y)=X(B) (=Hom(A,B) si X=Spec A) est le foncteur des points
(qui pour un anneau B représente l'ensemble des éléments de B satisfaisant
les "équations" de X)

Localisation des sections globales
----------------------------------
(Hartshorne, Lemme 5.14)

L fibré inversible sur X schéma, f \in \Gamma(X,L), X_f l'ensemble des
points tels que f ne s'annule pas en x (ie f_x \not \in m_x L_x), F
faisceau quasi-cohérent sur X.
(i) Si X quasi-compact et s \in \Gamma(X,F) est une section globale de
restriction 0 sur X_f, alors il existe n tel que f^n s=0 (où f^n s est une
section de L^n \tens F).
(ii) Si de plus X est recouvert par des affines U_i tels que L restreint à
U_i soit libre, et U_i \inter U_j quasi-compact. Etant donné une section t
\in Gamma(X_f,F), il existe n tel que f^n t \in Gamma(X_f, L^n \tens F)
s'étend en une section globale.

Exemple: avec L=O_X, si l'hypothèse de (ii) est vérifiée (quasi compacité
de X et des intersections d'un recouvrement affine, par exemple X affine!),
alors \Gamma(X_f,O_X_f) = \Gamma(X,O_X)_f

On en déduit le théorème:
Si X est qcqs et f \in Gamma(X,O_X), alors la flêche \Gamma(X,O_X)_f ->
\Gamma(X_f,O_X) est un isomorphisme.

Critère d'affinité
------------------

X est affine ss'il existe des sections globales f_1, ..., f_n qui engendrent l'idéal unité et telles que X_f_i soit affine.

Chevalley: [critère pour qu'un morphisme entier soit affine]
cf Raynaud, un critère d'effectivité de descente, Prop 3.1:
f:X->Y morphisme entier surjectif, et X affine.
Alors si Y normal intègre ou Y noéthérien, Y est affine.

https://ncatlab.org/nlab/show/Serre%27s+criterion+of+affineness
If f:X→Y is a quasicompact morphism of algebraic schemes and X is separated, then f is affine iff it is cohomologically affine, that is, the direct image functor f_* is exact.

Cf https://amathew.wordpress.com/2012/08/01/serres-criterion-for-affineness-as-morita-theory/
Let X be a quasi-compact, separated scheme. Then a criterion of Serre asserts that X is affine if and only if H^i(X, F) =0 , i > 0
for all quasi-coherent sheaves F on X: that is, affine schemes are characterized by the vanishing of the higher cohomology of all quasi-coherent sheaves. The purpose of this post is to explain an interpretation of Serre’s theorem (or rather, the “if” direction) in terms of category theory. Namely, the idea is that if X satisfies the cohomological vanishing condition, then the functor
\Gamma: \QCoh(X) \to Mod(\Gamma(X,O_X))
from the category of quasi-coherent sheaves on X to the category of modules over \Gamma(X, O_X), turns out to be a symmetric monoidal equivalence for formal reasons. A version of Tannakian formalism now shows that X is itself isomorphic to Spec \Gamma(X, O_X): that is, the category QCoh(X) together with its symmetric monoidal structure recovers X.

Morphisme affine
----------------

Un morphisme est affine ssi la réciproque d'un affine est affine ou encore
s'il existe un recouvrement affine de la cible dont les réciproques sont
affines.
Un morphisme affine est séparé et qc.

ex: un morphisme fini est affine

Th (global spec):
  Soit Y un schéma et A un faisceau quasi-cohérent de O_Y algèbres.
  On peut définir un morphisme affine f: Spec A -> Y tel que A=f_* O_Spec A.
  Concrètement, si V \subset Y est affine, f^-1(V)=Spec A(V).
  Réciproquement, si f: X->Y est affine, X=Spec f_* O_X.

Th: si f:X->Y est affine, X=Spec A, alors il y a équivalence de catégorie
entre les modules quasi-cohérents sur X et les A-modules quasi cohérents sur
Y.

Th: Soit a:X->S, b:Y->S un morphisme affine. Alors
    Hom_S(X,Y)=Hom_O_S(b_* O_Y, a_* O_X)

Pr: Localement, si U ouvert affine de S, V=b^-1(U) est affine dans Y, et si
W=a^-1(U) on sait que Hom(W,V)=Hom(\Gamma(V),\Gamma(W)). Il suffit ensuite
de recoller.

* Global Spec
f:Y->X, S une O_X-algèbre.
Alors (à vérifier!) f^* Spec S = Spec f^* S.

Morphismes Projectifs
=====================

https://stacks.math.columbia.edu/tag/01S5 28.11 Affine morphisms
https://stacks.math.columbia.edu/tag/01VG 28.35 Relatively ample sheaves
https://stacks.math.columbia.edu/tag/01VL 28.36 Very ample sheaves
https://stacks.math.columbia.edu/tag/02NO 28.37 Ample and very ample sheaves relative to finite type morphisms
https://stacks.math.columbia.edu/tag/01VV 28.38 Quasi-projective morphisms
https://stacks.math.columbia.edu/tag/01W7 28.41 Projective morphisms
https://stacks.math.columbia.edu/tag/0B41 36.42 Quasi-projective schemes

La construction Proj
--------------------

Si S est un A-anneau gradué, et f est homogène, alors
U=Proj S \ V(f) est ensemblistement l'ensemble des premiers homogènes
de S[1/f] ne contenant pas f (et donc l'idéal irrélevent S_+)
Cet ensemble est en bijection avec Spec S[1/f]_0
On munit U de la structure de schéma Spec S[1/f]_0

Les sous-schémas affines engendrés par les f_i recouvrent Proj S ssi
S_+=Radical(f_i)

Proj S est isomorphe à Proj S^(d) où S^(d) = \sommetens_n S_{dn)

Global Proj
-----------

f:Y->X, S une O_X-algèbre graduée.

Alors (à vérifier!) f^* Proj S = Proj f^* S.

Rappel: si E est cohérent sur X, P(E)=Proj(Sym(E)).
Ex: si S est engendrée par S_1, alors Proj S -> P(S_1) est une immersion
fermée.

Pullback
--------

- f^* Proj S = Proj f^* S; en particulier
  f^* P(E) = P(f^* E)
(à vérifier!)

Morphismes dans l'espace projectif
----------------------------------

Hom_X(Y,P(E)) = { épimorphismes f^* E -> L, L inversible sur Y }/{isomorphisms}

En effet, on a le diagramme commutatif suivant

P(L) -> P(f^* E)  --> P(E)
   \     |             |
    \    v             v
         Y        -->  X
Or si L est inversible, P(L) \iso Y

(Remarque: le fibré vectoriel associé à L est V(L)=Spec(S(L)) et P(L) est
le quotient projectif de V(L). En général, L localement libre de dim n+1
n'implique pas P(L) \iso P^n, mais c'est vrai pour n=1 car tout se recolle)

Morphismes homogènes d'anneaux
------------------------------

A et B anneaux homogènes de type finis engendrés en degré 1.
f: A -> B morphisme homogène, induit un morphisme
phi: U -> Proj A où U est l'ouvert de Proj B complémentaire de
V+(f(A+)B).

phi est défini partout ssi B/A est fini.

En effet, si phi déf partout, \sqrt(f(A+)B)=B+ par Nullstellensatz.
Par Noeth, il existe n / B+^n \subset f(A+)B.
On en déduit:
- B_n=B_1^n \subset \sum_{i<n} f(A_i)B_{n-i}
  B_{n+1}=B_n B_1 \subset \sum f(A_{i+1}) B_{n-i}
  B_m \subset \sum f(A_{i+m-n}) B_{n-i}
Donc B \subset f(A)B_0 + ...+ f(A) B_{n-1}
B est entier sur A, ie phi est fini.

Géométriquement, si on a un morphisme de var proj Y->X de la forme
précédente, on peut le voir comme il existe L très ample sur Y
tel qu'on ait un morphisme phi^*(O_X(1)) -> L. Si le morphisme est déf
partout, alors L est engendré par les sections globales de phi^*(O_X(1))
et on peut montrer que phi est fini.

Réciproquement, si phi: Y=Proj B -> X=Proj A est fini
phi^*(O_X(1)) est ample, donc phi^*(O_X(1))^d=\phi^*(O_X(d)) est très
ample, et phi est induit par un morphisme
\Gamma_*(O_X(d))=A[d] -> \Gamma_*(phi^*(O_X(d)))

Fibrés amples
-------------

- Si L, M inversibles sur X, générés par leurs sections globales
  L très ample => L \tens M très ample
- Si X noeth, L ample et (M ample ou généré par sections globales) => 
  L \tens M ample

Si f:X->Y est qcqs, L ample sur X <=> L|y ample sur O_Y,y pour tout y

Amplitude, quasi-affine, quasi-projectif
========================================

Fibré ample
-----------

https://stacks.math.columbia.edu/tag/01PR:
Definition 27.26.1. Let X be a scheme. Let L be an invertible OX-module. We say L is ample if
  - X is quasi-compact, and
  - for every x∈X there exists an n≥1 and s∈Γ(X,L⊗n) such that x∈Xs and Xs is affine.

Proposition 27.26.13. Let X be a quasi-compact scheme. Let L be an invertible sheaf on X. Set S=Γ∗(X,L). The following are equivalent:
 1) L is ample,
 2) the open sets Xs, with s∈S+ homogeneous, cover X and the associated morphism X→Proj(S) is an open immersion,
 3) the open sets Xs, with s∈S+ homogeneous, form a basis for the topology of X,
 4) the open sets Xs, with s∈S+ homogeneous, which are affine form a basis for the topology of X,
 5) for every quasi-coherent sheaf F on X the sum of the images of the canonical maps Γ(X,F⊗OXL⊗n)⊗ZL⊗−n⟶F with n≥1 equals F,
 6) same property as (5) with F ranging over all quasi-coherent sheaves of ideals,
 7) X is quasi-separated and for every quasi-coherent sheaf F of finite type on X there exists an integer n0 such that F⊗OXL⊗n is globally generated for all n≥n0,
 8) X is quasi-separated and for every quasi-coherent sheaf F of finite type on X there exist integers n>0, k≥0 such that F is a quotient of a direct sum of k copies of L⊗−n, and
 9) same as in (8) with F ranging over all sheaves of ideals of finite type on X.

Quasi-affine
------------

https://stacks.math.columbia.edu/tag/01P5
- A scheme X is called quasi-affine if it is quasi-compact and isomorphic to an open subscheme of an affine scheme; iff X⟶Spec(Γ(X,OX)) is a quasi-compact open immersion; iff O_X est ample (https://stacks.math.columbia.edu/tag/01QD)
Note: comme Spec(A)=Proj(A[T]), quasi-affine => quasi-projectif.

Fibrés amples relatifs
----------------------

https://stacks.math.columbia.edu/tag/01VG
* Let f:X→S be a quasi-compact morphism of schemes. Let L be an invertible sheaf on X. The following are equivalent:
  - The invertible sheaf L is f-ample. [ie f est qc et localement sur S L|f−1(V) est ample]
  - There exists an open covering S=⋃Vi such that each L|f−1(Vi) is ample relative to f−1(Vi)→Vi.
  - There exists an affine open covering S=⋃Vi such that each L|f−1(Vi) is ample.
  - There exists a quasi-coherent graded OS-algebra A and a map of graded OX-algebras ψ:f∗A→⨁d≥0L⊗d such that U(ψ)=X and
    rL,ψ:X⟶Proj−−−−S(A)
    is an open immersion (see Constructions, Lemma 26.19.1 for notation).
  - The morphism f is quasi-separated and part (4) above holds with A=f∗(⨁d≥0L⊗d) and ψ the adjunction mapping.
  - Same as (4) but just requiring rL,ψ to be an immersion.

* Let f:X→S be a morphism of schemes. Then f is quasi-affine if and only if OX is f-relatively ample.

Fibré très ample
----------------

https://stacks.math.columbia.edu/tag/01VL

Definition 28.36.1. Let f:X→S be a morphism of schemes. Let L be an invertible OX-module. We say L is relatively very ample or more precisely f-relatively very ample, or very ample on X/S, or f-very ample if there exist a quasi-coherent OS-module E and an immersion i:X→P(E) over S such that L≅i∗OP(E)(1).

f qc + L relatively very ample => relatively ample

https://stacks.math.columbia.edu/tag/02NO
Lemma 28.37.5. Let f:X→S be a morphism of schemes. Let L be an invertible OX-module. Assume S quasi-compact and f of finite type. The following are equivalent
  - L is f-ample,
  - L^⊗d is f-very ample for some d≥1,
  - L^⊗d is f-very ample for all d≫1.

Lemma 28.37.7. Let f:X→S be a morphism of schemes. Let L be an invertible sheaf on X. Assume f is of finite type. The following are equivalent:
  - L is f-relatively ample, and
  -  there exist an open covering S=⋃Vj, for each j an integers dj≥1, nj≥0, and immersions i_j:Xj=f^−1(Vj)=Vj ×_S X ⟶ P^nj_Vj
    over Vj such that L^{⊗d_j}|Xj ≅i∗_j O_P^nj_Vj(1)
(et L relativement très ample si on peut prendre les d_j=1)

En effet, dans le cas très ample, si de plus S est affine, on a j=1, ie
an immersion i:X→PnS over S such that L≅i∗O_P^n_S(1).
En fait si S affine (et toujours f de type fini), ample <=> relativement ample, cf https://stacks.math.columbia.edu/tag/01VT

Quasi-projectif
---------------

https://stacks.math.columbia.edu/tag/01VV
Definition 28.38.1. Let f:X→S be a morphism of schemes.
   - We say f is quasi-projective if f is of finite type and there exists an f-relatively ample invertible OX-module.
   - We say f is H-quasi-projective if there exists a quasi-compact immersion X→PnS over S for some n.1
   - We say f is locally quasi-projective if there exists an open covering S=⋃Vj such that each f−1(Vj)→Vj is quasi-projective.

Note: H-quasi-projectif => quasi-projectif, loc quasi-proj <=> loc
H-quasi-proj

Projectif
---------
https://stacks.math.columbia.edu/tag/01W7


Morphismes Propres
==================

Compatification de Nagata
-------------------------

http://math.stanford.edu/~conrad/papers/nagatafinal.pdf

Th 4.1: f:X->S séparé de type fini, S qcqs, se factorise en une immersion
ouverte X->Xbar où Xbar->S est propre.

Le th ne suppose pas que X ou S soient Noeth. On se ramène au cas
de présentation finie puis au cas Noéthérien grâce aux:
1)  [TT, Thm. C.9]: si S est qcqs, S est limite projectives de schémas S_i
de type fini sur Z où les morphismes de transitions sont affines. Si X -> S est
de plus de présentation finie, alors il existe un i et un X_i0->S_i0 séparé
de type fini tel que X=X_i0 x_S S_i0.
2) Th 4.3: si f:X->S, S qcqs, f qs de type fini, alors il existe une immersion
fermée X->X' au-dessus de S tel que f':X'->S soit de présentation finie. Si
f est séparée, on peut prendre f' séparée. Si f finie, on peut prendre f'
finie (Th A.1)

Cor A.2 (th de Chevalley): si f:X->Y est finie surjective, X affine => Y
affine. En particulier si X_red est affine, X aussi.

Morphismes Plats
================
Réf: Matsumura et Eisenbud

* Geometric intuition for flatness
http://mathoverflow.net/questions/75317/flatness-in-complex-analytic-geometry
http://mathoverflow.net/questions/6789/why-are-flat-morphisms-flat

Local criteria for flatness
---------------------------
[Rappel: le lieu de flatness est ouvert]

http://mathoverflow.net/questions/99266/on-the-geometric-interpretation-of-the-local-criterion-for-flatness

Version forte: If B→C is a morphism of local noetherian rings both local and flat over the local noetherian ring (A,𝔪), then B→C is flat if and only if the fiber B/𝔪B→C/𝔪C is flat. 

If f:X→Y is a morphism of finite type S-schemes (S being noetherian), and if X,Y are flat, then f is flat if and only if each of the maps fs:Xs→Ys are flat.

Version usuelle: Let ϕ:(A,m)→(B,m′) be a local morphism of local Noetherian rings, and M a finitely generated B-module. If x∈m is a non zero-divisor on M then M is flat over A iff M/xM is flat over A/xA.

Version Tor^1: https://en.wikipedia.org/wiki/Flat_module
    Let R be a local noetherian ring, S a local noetherian R-algebra with m_R S \subset m_S, and M a finitely generated S-module. Then M is flat over R if and only if Tor_1^R(M, R/m_R) = 0. 

Corollaire (cf Matsumura):
Si (B,n) est local et contient un corps k, soit x_1,...,x_n une suite
B-régulière de n. Alors A=k[x_1,...x_n] \subset B est isomorphe à une algèbre
de polynômes et B/A plat.

Fidèle platitude (Stack Project)
----------------

f: A->B, M B-module
- M fidèlement plat sur A => f^{-1}_* (Supp M)=Spec A
- Si M/B fini; M/A plat et f^{-1}_* (Supp M)=Spec A <=> M fidèlement plat sur A

Application:si phi: Y->X est plat, Y est fidèlement plat sur phi(Y).

ex: dans un morphisme local (=morphisme d'anneaux locaux, qui envoie
l'idéal max sur l'idéal max), plat <=> fidèlement plat

Flatness and Hilbert polynomial
-------------------------------

http://mathoverflow.net/questions/16465/flatness-over-non-reduced-schemes
~/Papiers/Maths/GeoAlg/MIT18_726s09_lec20_hilbpoly.pdf

Th: Soit T un schéma loc noéth, connexe et réduit; X un schéma projectif
sur T; F un faisceau cohérent sur X. Alors F est plat sur T ssi
t->HilberPoly(F|t) est constant. (En général F plat => HilbertPoly
constant, mais on n'a pas la réciproque si T non réduit par ex).

Cor: Si T intègre loc noeth, alors si X/T est plat les fibres sont
équidimensionelles de dim n, la dimension de la fibre générique. Si n=0,
alors le degré de chaque fibre est égal à d, le degré de la fibre
générique.

Autre référence (avec un contreexemple pour the converse if S is not reduced):
http://math.stackexchange.com/questions/564680/flatness-hilbert-polynomial-and-reduced-schemes
Let f:X→S be a projective morphism of schemes and F a coherent OX-module. We have that if F is S-flat then the Hilbert polynomial P(Fs) is locally costant as a function of s∈S. (Huybrechts_D., Lehn_M., The_Geometry_of_Moduli_Spaces_of_Sheaves, Second_Edition, Cambridge_Mathematical_Library, 2010, proposition 2.1.2). The converse is true if S is reduced.

Modules Projectifs
------------------

Modules projectifs de type finis, idéaux fractionnaires inversibles

https://en.wikipedia.org/wiki/Projective_module

- Projectif = facteur direct d'un module libre
- Projectif => plat
- over a local ring, every projective module is free
- free => projective => flat => torsion-free
       <= (local ring or pid)
                     <= (perfect ring)
                             <= (dedekind)

Projective modules over commutative rings have nice properties.
- The localization of a projective module is a projective module over the localized ring. A projective module over a local ring is free. Thus a projective module is locally free (in the sense that its localization at every prime ideal is free over the corresponding localization of the ring).
- The converse is true for finitely generated modules over Noetherian rings: a finitely generated module over a commutative noetherian ring is locally free if and only if it is projective.

For finitely presented modules M over a commutative ring R (in particular if M is a finitely generated R-module and R is noetherian), the following are equivalent.
- M is flat.
- M is projective.
- M_\mathfrak{m} is free as R_\mathfrak{m}-module for every maximal ideal \mathfrak{m} of R.
- M_\mathfrak{p} is free as R_\mathfrak{p}-module for every prime ideal \mathfrak{p} of R.
- There exist f_1,\ldots,f_n \in R generating the unit ideal such that M[f_i^{-1}] is free as R[f_i^{-1}]-module for each i.
- \widetilde{M} is a locally free sheaf on \operatorname{Spec}R.

Moreover, if R is a noetherian integral domain, then, by Nakayama's lemma, these conditions are equivalent to
- The dimension of the k(\mathfrak{p})–vector space M \otimes_R k(\mathfrak{p}) is the same for all prime ideals \mathfrak{p} of R. That is to say, M has constant rank.
[plus généralement si R noeth réduit, pour M de type fini, projectif <=> rang des fibres est continu, cf plus bas]

Quillen-Suslin: if A pid, M projective over A[X_1,...,X_n] iff A is free

Ex [cf aussi GeoAlg/Divisors_PicardGroup]:
- http://math.stackexchange.com/questions/132154/ideal-as-a-projective-module
  If R is a domain, then a nonzero ideal I is projective iff it is invertible.
  If R is a UFD, then a nonzero ideal I is projective iff it is principal.
  All ideals are projective <=> R is Dedekind
- http://math.stackexchange.com/questions/162679/a-characterization-of-invertible-fractional-ideals-of-an-integral-domain
  Let A be an integral domain, K its field of fractions. Let M be a fractional ideal of A. M finitely generated is invertible if and only if MA_P is a principal fractional ideal of A_P for every maximal ideal P of A.
[Proof:
Reminder A non zero fractional ideal is invertible if and only if it is projective , and then it has rank one.
a) If M is invertible it is projective and non-zero. Hence MP is also non-zero and projective of rank one over AP, hence free of rank one because AP is local and thus a principal fractional ideal for AP.
b) Here I assume that M is finitely generated over A.
If MP is principal fractional it certainly is free of rank one, hence projective of rank one .
Since this is true for all maximal P , the module M is (non-zero) projective: this is where I use that M is finitely generated .
Hence M is an invertible fractional ideal of A, according to the Reminder.
]

Flatness vs Projective
----------------------

M proj => M projectif sur les germes
       <= (si M de prés finie) [Rem: M proj + fini => prés finie]
M proj sur A local <=> M libre (même si M non de type fini)

M plat <=> M plat sur les germes (même si M non de type fini)
M plat sur A local <= M libre
                    => (si M de prés fini)

On retrouve si M de prés fini, M proj <=> M plat

Continuité des fibres
---------------------

forum.maths.avancees:1343:
> Soit M un module de type fini sur un anneau noéthérien. Je suppose que le
> rang des fibres M_p/pM_p est constant.
> Est-ce que M est un module projectif?

C'est faux. Pour des raisons évidentes, il faut au moins supposer que
l'anneau est réduit. Il me semble que cette question avait déjà été posée
récemment, j'ai la flemme de retrouver. Alors, comme c'est trivial, je le
refais : par EGA 4 §8, on peut supposer que l'anneau A est local. Soit r
l'entier tel que M tenseur k(p) soit de dimension r pour tout idéal
premier p. Par Nakayama, on trouve un morphisme surjectif f:A^r -> M ; pour
tout idéal premier p de A, la flèche induite k(p)^r -> M tenseur k(p) est
surjective, mais comme M tenseur k(p) est de dimension r, c'est aussi
injectif ; cela implique que le noyau de f est contenu dans p^r ; ceci
est vrai pour tout idéal premier, l'intersection des idéaux premiers de A
est le nilradical, qui est nul, l'intersection des p^r est donc 0, f est
injective.

Rebelote sur forum.maths:12323:
> M est projectif <=> il est localement libre (au sens libre sur des
> ouverts affines assez petits, pas au sens libre sur les germes [bien que ce
> soit aussi vrai]), en particulier, le rang r est continu.
> Il me semble qu'on a la réciproque, cad (quitte à se ramener à une
> composante connexe) que si r est constant, alors M est projectif.

Il faut faire des hypothèses supplémentaires. Si A n'est pas réduit, on
peut prendre M=A/Nilradical, ce n'est pas un A-module projectif.
Maintenant, supposons A réduit. Avec Nakayama et les sorites sur les
modules de présentation finie (EGA 4 §8), quitte à passer aux ouverts
d'un recouvrement, on peut supposer que l'on a un morphisme surjectif
A^r -> M tel que les flèches induites après tensorisation avec k(p) soient
bijectives pour tout idéal premier p. Notons K le noyau de A^r -> M ;
dire que A^r tenseur k(p) -> (A^r/K) tenseur k(p) est injectif, cela
revient à demander que K tenseur k(p) -> A^r tenseur k(p) soit nul, si je
ne m'abuse, cela signifie que K est contenu dans (p)^r. On applique cela
à tous les idéaux premiers pour dire que K est contenu dans
l'intersection des (p)^r, c'est-à-dire (Nilradical)^r qui est nul par
hypothèse, cela montre que K=0, M est donc libre de rang r.

[Rappel: Continuité des fibres = flatness pour un morphisme projectif (sur un schéma réduit), cf Hilbert Polynomial]

Corollaire de la platitude générique (cf Polo, Chapitre 4, Section 13.6)
------------------------------------------------------------------------

Soit X une variété algébrique irréductibre sur k alg clos, A=k[X] et
K=k(X) [je crois que tout ce qui suit se généralise à A intègre noeth, en
remplaçant les dim par les longueurs]

1) Si M A-module fini, il existe f \in A\{0} tel que M_f soit libre de rang
   r sur A_f
2) Pour tout x \in X, dim_k M(x) >= r. Il y a égalité ssi M_x est libre, et
   le lieu des tels x est ouvert.

Pr: platitude générique + semi-continuité des fibres

Corollaire: Si f: M->N morphismes de modules finis
1) Si f_K est injective, le lieu des x tels que M_x et N_x soient libres,
   et f(x) injective est un ouvert non vide
2) Si N_x est libre et f(x) injective, alors M_x est libre et f_K est
   injective

Pr: Considérons la suite exacte 0->K->M->N->C->0. 
  1) Si f_K est injective, dim_K C_K=n-m
  Si M_x et N_x sont libres (ça forme un ouvert), alors si C_x est libre la
  suite exacte est scindée donc K_x=0 [car K(x)=0] et f(x) est injective.
  Or C_x est libre exactement quand C(x) est de dim n-m, ie exactement
  quand f(x) est injective (Car C(x) reste le coker) [du coup on n'a pas
  besoin de la première étape].
  2) Si N_x est libre et f(x) injective, alors n=dim N(x)=dim M(x)+dim C(x)
     >= m + (n-r), où r=dim_K C_K. D'où égalité, r=m, M_x et C_x sont
     libres et donc f_K (et f_x) injective

Rem: pour la surjectivité c'est plus simple:
1) Si f_K est surjective, f_x est surjective sur un ouvert (car C_K nul
   implique C_x nul sur un ouvert), or f_x surjective <=> f(x) surjective
   par Nakayam
2) Réciproquement si f(x) est surjective, f_x l'est et donc f_K qui est un
   localisé l'est

Immersions
==========

Attention, en geoalg une immersion c'est ce qu'on appelle plongement en
géodiff, et réciproquement. Cf
http://mathoverflow.net/questions/48527/why-open-immersion-rather-than-open-embedding

Immersions ouvertes
-------------------

f: X->Y immersion ouverte ssi f induit un homéo sur un ouvert U de Y et X est isomorphe au schéma sur U.

Les immersions ouvertes sont stables par changement de base.
Être une immersion ouverte est une propriété affine locale sur la cible.

Lemme important: si X_1 et X_2 sont deux ouverts affines de X, et x \in X_1
\inter X_2, alors il existe un ouvert affine x \in U \subset X_1 \inter X_2
tel que U soit un ouvert affine canonique (ie le localisé d'une fonction)
pour X_1 et pour X_2.
[Pr: prendre un ouvert canonique U_1 de X_1 inclus dans X_1 \inter X_2, et
un ouvert canonique U_2 de X_2 inclus dans U_1; U_2 est défini par une
section g de X_2 et U_2 et le lieu de non annulation de g; donc U_2 est
aussi le lieu de non annulation de g|U_1 donc U_2=(U_1)_g est canonique
pour X_1. En fait si f définit U_1, alors g=g'/f^n sur U_1 pour une
fonction g' définie sur X_1. Cf FOAG~5.3.1]

http://mathoverflow.net/questions/20782/ring-theoretic-characterization-of-open-affines

Theorem 2: Spec(A)→Spec(R) is an open immersion if and only if R→A is flat,
of finite presentation and an epimorphism in the category of rings.

 Theoreme général sur les immersions ouvertes
 -------------------------------------------

More generally, in EGA IV, 17.9.1 it is proven that a morphism of schemes
is an open immersion if and only if it is flat, a (categorical)
monomorphism and locally of finite presentation [of algebra].

Preuve:
  Un morphisme plat localement de presentation finie est ouvert, cf
  Matsumura, commutative algebra, theorem 8 du chapitre 2. Cf aussi EGA, ou
  il y a en plus un exemple de morphisme plat qui n'est pas ouvert (et qui
  n'est donc pas de presentation finie).

  Si f: Y->X est plat localement de presentation finie, son image Y'=f(Y) est
  ouvert dans X donc, et f: Y->Y' est fidelement plat (un morphisme
  fidelement plat est un morphisme plat surjectif). Comme l'a remarque Joel,
  si en plus f est un monomorphisme, f est un isomorphisme (ce qui se voit
  facilement par descente fidelement plate, ou encore parce qu'un morphisme
  fidèlement plat est un épi effectif, et les épi effectifs qui sont des
  monos sont des isos).

Voir aussi: stacks.math.columbia.edu/download/etale.pdf
Theorem 14.1.
Let f : X → Y be a morphism of schemes. The following are equivalent:
(1) f is an open immersion,
(2) f is radicial and etale, and
(3) f is a flat monomorphism, locally of finite presentation.
[Cf aussi plus bas pour le critère d'avoir un monomorphisme]

Cas particulier:
Theorem 1: Let R be an integral domain with field of fractions K, and R→A a
homomorphism. Then Spec(A)→Spec(R) is an open immersion if and only if A=0
or R→K factors through R→A (i.e. A is birational over R) and A is flat and
of finite type over R.

Theorem 3: There is the following characterisation. I don't think it's too
tautological. Let T⊆A be the set of f such that the induced map
A[f−1]→B[f−1] is an isomorphism. Then Spec(B)→Spec(A) is an open immersion
if and only if the image of T in B generates the unit ideal.
Cf aussi:
https://mathoverflow.net/questions/230528/flat-locally-of-finite-presentation-monomorphism-open-immersion

Immersion fermée
----------------

f: X->Y est une immersion fermée ssi f est un homéo sur un fermé Z de Y et
O_Y -> f_* O_X est surjectif.
(Rem: dans ce contexte, f_* O_X est simplement l'extension de O_X par 0 à
tout Y).

Les immersions fermées sont stables par changement de base.

Rem: contrairement au cas des immersions ouvertes, il peut y avoir
différentes immersions fermées pour le même fermé Z.

ex: Il y a bijection entre les sous-schémas fermés de P^n_k et les idéaux
homogènes I de k[X_0,...,X_n] tels que I:(X_0,...,X_n)=I.

Th: soit f est une immersion fermée, et Q le module (idéal) quasi-cohérent
donné par le noyau de O_Y dans f_* O_X. Alors f est affine; plus précisément:
pour tout ouvert affine Spec A de Y,
X \inter Spec A est isomorphe à Spec(A/I) où I=Q(Spec A) est le noyau de
l'application (surjective) A-> Gamma(Spec A \inter X, f_* O_X).
Comme Q est quasi cohérent, on a de plus Q(A_f)=QA_f, et Q(A_P)=QA_P
En particulier, on a bijection entre les idéaux quasi-cohérents et les
immersions fermées.
[Autrement dit, si X \subset Y est fermé, et U=Spec A un ouvert affine de Y, U
\inter X est un ouvert affine de X de la forme Spec A/I où I est le noyau
de la restriction]

Th (être une immersion fermée est une propriété affine locale sur la cible):
f est une immersion fermée ssi on a une des conditions suivantes:
(i) Pour tout ouvert affine V de Y, U=f^-1(V) est affine et l'application
O_Y(V)->O_X(U) est surjective
(ii) Il y a un recouvrement affine de X par des V_i tels que
U_i=f^-1(V_i) est affine et l'application O_Y(V_i)->O_X(U_i) est surjective

Rem: Si Q est un O_X idéal, alors Y={y \in X, 1 \not in Q_y} est fermé dans
X, ie Y est le support de O_X/Q. (Y,O_X/Q) est un sous-schéma fermé ssi Q
est quasi-cohérent ssi
pour tout y\in X il y a un ouvert autour U et des sections s_i \in Q(U)
telles que Q|x=\sum res(s_i) O_X|x pour tout x dans U.

Prop: Si X est fermé dans Y, il existe une plus petite structure de schéma
Xréd sur X telle que Xréd se factorise par toute immersion fermée ayant
image X.
- Xréd est l'unique schéma fermé réduit de support X.
- Xréd est définie en recollant la construction suivante: si Y est fermé et X
correspond à un idéal I, Xréd=Spec(A/Radical(I))
(Remarque: U->Radical(O_X(U))=fonctions nilpotentes sur U, n'est pas un
faisceau si X n'est pas Noethérien, le faisceau associé est le faisceau des
fonctions localement nilpotentes. Par contre d'après Eisenbud et Harris, le
faisceau quotient associé est U->O_X(U)/Radical pour tout ouvert U, même
pas forcément affine.)
- Si X0 est un schéma fermé de support X, définit par un idéal I0, alors
  l'idéal Iréd définissant Xréd est Radical(I0)
  (ie pour tout ouvert affine, on prend le radical des sections de I0 sur
  cet ouvert)

Si f:X->Y est un morphisme, on appelle l'image schématique de f le schéma
fermé Z tel que f se factorise par Z, et si f se factorise par un schéma
fermé Z', alors Z->X se factorise par Z' également. Si X est réduit, Z est
simplement le schéma réduit sur la cloture de f(X).

Si Z est un sous-schéma localement fermé, sa cloture Zbar est le plus petit
schéma fermé contenant Z. Concrêtement, si Z est fermé dans l'ouvert U,
l'idéal de Zbar est donné par les fonctions régulières dont la restriction
à U s'annule sur Z.

Morphismes radiciels, étales, non ramifiés, lisses
==================================================

http://en.wikipedia.org/wiki/Radicial_morphism
  In algebraic geometry, a morphism of schemes
      f: X → Y
  is called radicial or universally injective, if, for every field K the
  induced map X(K) → Y(K) is injective. (EGA I, (3.5.4)) This is a
  generalization of the notion of a purely inseparable extension of fields
  (sometimes called a radicial extension, which should not be confused with a
  radical extension.)
  It suffices to check this for K algebraically closed.

  This is equivalent to the following condition: f is injective on the topological spaces and for every point x in X, the extension of the residue fields
      k(f(x)) ⊂ k(x)
  is radicial, i.e. purely inseparable.

  It is also equivalent to every base change of f being injective on the
  underlying topological spaces. (Thus the term universally injective.)

http://mathoverflow.net/questions/46058/whats-the-intuition-between-formal-smoothness-etaleness-and-unramifiedness
(Rappel: étale=flat+unramified = smooth of dim 0
formally smooth/étale/unramified + loc of finite presentation=smooth/étale/unramified where finite pres = finite pres of algebra, ex: https://math.stackexchange.com/questions/706058/formally-smooth-vs-smooth
formally unramified <=> Kahler sheaf differentials \Omega_X/Y=0

Cf comments by BCrn, ZMT => formally etale implies Zariski-locally looks like open in Spec((R[t]/(f))[1/f′])→ Spec(R) for some monic f∈R[t] and hence flat by inspection, formally smooth implies Zariski-locally etale over an affine space, and formally unramified implies "etale-locally" a closed immersion
cf http://en.wikipedia.org/wiki/Formally_unramified
)

Intuition sur les morphismes non ramifiés: https://ayoucis.wordpress.com/2014/04/06/unramified-morphisms/
https://faculty.missouri.edu/~edidind/EquivariantAlgebraicGeometry/RyanRicheySmoothGroups.pdf
- Smooth: analogues of submersions between manifolds (the induced derivative map on tangent vectors is surjective at every point) + flatness
- Unramified: analogues of immersions in differential geom-
etry (the induced derivative map is injective on tangent vectors)
- Etale: analogue  of  local  diffeomorphisms, which is equivalent (by the inverse function theorem) to the induced morphism on tangent spaces being an isomorphism

Smooth => Regular: https://mathoverflow.net/questions/207595/when-a-smooth-algebra-is-regular
Un exemple ou régulier n'implique pas smooth quand le corps n'est pas
parfait:
https://mathoverflow.net/questions/12688/nonsingular-normal-schemes
=> l=k[t]/P(t), P inséparable, H la courbe y^2=P(t) est régulière mais pas
lisse, car sur kbar P a des racines multiples.

https://stacks.math.columbia.edu/tag/01V4
Lemma 28.32.3. Let f:X→S be a morphism of schemes. If f is flat, locally of finite presentation, and all fibres Xs are smooth, then f is smooth. 

Monomorphismes et Epimorphismes
===============================

Monomorphismes
--------------

http://mathoverflow.net/questions/56591/what-are-the-monomorphisms-in-the-category-of-schemes

In EGA IV, 17.2.6 the following characterization of monomorphisms is given:
  Let f:X→Y be a morphism locally of finite type. Then the following conditions are equivalent:
  a) f is a monomorphism.
  b) f is radicial and formally unramified.
  c) For every y∈Y, the fiber f−1(y) is either empty or isomorphic to Spec(k(y)).

Also note that (due to the adjunction) a morphism between affine schemes is
a monomorphism (in the category of schemes) if and only if the associated
homomorphism of rings is an epimorphism (in the category of rings) and the
latter ones can be characterized in many ways. See, for example, this
Samuel seminar and this MO discussion. Monomorphisms of noetherian schemes
are treated in detail in Exposé 7 by Daniel Ferrand.

Further examples:

1) Immersions are monomorphisms; this follows from the universal property
of a closed resp. open immersion.
2) A morphism X→Y is a monomorphism if and only if the diagonal X→X×YX is
an isomorphism. In particular, every monomorphism is separated.
3) In EGA IV, 18.12.6 it is shown that proper monomorphisms are exactly the
   closed immersions.

Monomorphismes affines
----------------------
http://mathoverflow.net/questions/109/what-do-epimorphisms-of-commutative-rings-look-like

No, not every epimorphism of rings is a composition of localizations and
surjections.
An epimorphism of commutative rings is the same thing as a monomorphism of
affine schemes. Monomorphisms are not only embeddings, e.g., any
localization is an epimorphism and the corresponding morphism of schemes is
not a locally closed embedding.

Example: Let C be the nodal affine cubic and let X be its normalization.
Pick any point x above the node. Then X\{x}->C is a monomorphism (see
Proposition below). The corresponding homomorphism of rings is injective
but not a localization.

Remark: A flat epimorphism A->B is a localization if A is normal and
Q-factorial. This is a result by D. Lazard and P. Samuel. [cf. Lazard
"Autour de la platitude" (IV, Prop 4.5)]

Remark: There was a seminar on epimorphisms of rings directed by P. Samuel in 1967-68.
-> http://www.numdam.org/numdam-bin/feuilleter?id=SAC_1967-1968__2_

Monomorphisme plat
------------------

Rappel: si f est un mono plat loc de prés fini alors c'est une immersion
ouverte.

 Généralisations:
 ---------------

/home/dams/Papiers/Maths/GeoAlg/mono_plats.pdf
(Raynaud, un critère d'effectivité de descente)

Theorem: f est un mono plat ssi f est injectif et pour tout x \in X
O_Y,f(x) -> O_X,x est une bijection.

Si f:X->Y est mono plat qc (il n'est pas forcément ouvert car non loc pres
finie). Alors f induit toujours un iso de X sur f(X) (où f(X) est munie de
la structure annelée induite par Y).
- De plus f(X) est inclus dans un ouvert U tel que f:X->U soit affine.
- f est une immersion ouverte dans Z=Spec f_*(X) (qui est donc affine
  au-dessus de Y).
- Y\U= cloture de h(Z\X) où h est le morphisme Z->Y.
(Si je ne me trompe pas dans le cas f ouvert on a U=f(X)=X)

/home/dams/Papiers/Maths/GeoAlg/monos_platsaffines.pdf
DANIEL LAZARD Autour de la platitude

Prop IV.2.5: Si A anneau, il y a bijection entre les épimorphismes plats
d'anneaux A->B et les parties de Spec A qui munies du faisceau induit sont
affines. Ces parties sont stables par générisation.
(et donc ouvertes si elles sont loc de prés finie, et on retrouve qu'un
mono plat loc de prés fini est ouvert)

Il montre ensuite:
* si A est noéth, K(A) (l'anneau des fractions totales)
est le plus grand anneau tel que A->K(A) soit un épi plat injectif,
ie si A->X est un épi plat injectif, alors X \subset K(A).
* si f:A->B est plat, K(f):K(A)->K(B) est plat,
si f inj alors K(f) est inj, si f épi plat inj alors K(f) est un iso.
* f:A->B est un épi plat ssi B \subset K(f(A))

Epimorphismes
-------------

(sciences.maths.avancees         Message  2478)

f: X->Y est épi ssi l'image schématique de f est Y.

Ex: si X->Y est surjectif (au niveau des points-au-sens-idéaux-premiers)
  et que Y est réduit, alors X->Y est un épimorphisme de schémas.

Ex: si f: X->Y est fidèlement plat, alors c'est un épi effectif universel.
Autrement dit dans la catégorie des anneaux, c'est un mono effectif, donc
si f: B->A est de plus épi (cf une localisation) c'est un iso.

 Attention:
 ---------

Si les morphismes surjectifs (au niveau des
points-au-sens-idéaux-premiers) sont stables par changement de base, les
épimorphismes de schémas, eux, _ne le sont pas en général_ (ou, si on
veut, il existe des épimorphismes qui ne sont pas des épimorphismes
universels).

Cette dernière affirmation fait que la notion d'image schématique ne
peut pas se comporter de façon agréable par changement de base.

L'exemple standard d'un épimorphisme dans la catégorie des schémas qui
n'est pas universel, c'est X = la réunion Spec(k[x]×k[y]) de deux
droites et Y = deux droites qui se coupent Spec(k[x,y]/(xy)) avec X->Y
le morphisme évident (qui identifie les origines des deux droites).
C'est bien un épimorphisme de schémas, mais si on coupe les deux
droites transversalement, c'est-à-dire qu'on tire par Z->Y donné par
k[x,y]/(xy) -> k[h]/(h²) qui envoie x et y tous deux sur h, alors on
obtient le morphisme qui envoie deux points réduits Spec(k²) sur un
point épaissi Z=Spec(k[h]/(h²)), et c'est certes surjectif au niveau
des points-au-sens-idéaux-premiers mais ce n'est pas un épimorphisme.
Donc si la notion d'« image schématique » fait que X->Y a pour image
Y, en revanche, en tirant par Z->Y l'image devient Z^red qui est plus
petit que Z : c'est peu plaisant, comme notion.

Je ne connais pas de caractérisation des épimorphismes universels de
schémas : être fidèlement plat ou bien admettre une rétraction sont
des conditions suffisantes - mais j'ai l'impression qu'un éclatement
(disons du plan affine à l'origine) est un épimorphisme universel,
auquel cas il montre que la disjonction de ces deux conditions n'est
pas nécessaire pour être un épimorphisme universel.

http://mathoverflow.net/questions/56564/what-are-the-epimorphisms-in-the-category-of-schemes

It is easy to see that a morphism f:X→Y such that the underlying map |f| is
surjective and the homomorphism f#:O_Y→f∗ O_X is injective, is an epimorphism.
But there are other examples, too.

La réponse contient la preuve du fait suivant:
X is non-initial and every morphism from a non-initial object to X is an
epimorphism <=> X est le spectre d'un corps
(que ce soit dans la catégorie des schémas affines ou des schémas)

Morphismes universellement ouverts
==================================

Th: Critère de Chevalley pour les morphismes universellement ouverts
f:X->Y loc de type fini, y \in Y, x un point max de la fibre X_y. Supposons
y géométriquement unibranche (c'est le cas si O_Y,y est int. clos par ZMT).
Alors (<=>)
i) f est universellement ouvert en x
ii) si Y0 est l'unique composante irréductible de Y contenant y et de point
générique \eta, il existe Z irréductible dans X dominant Y0 et contenant x
tel que dim(Z_y)=dim(Z_eta) (Z/Y0 est donc équidimensionnelle en x car les
dimensions des fibres sont >= dim générique)
iii) (Si Y loc Noth) f est ouvert en x.

Zariski main theorem
====================

Références:
http://en.wikipedia.org/wiki/Zariski%27s_connectedness_theorem
https://en.wikipedia.org/wiki/Zariski%27s_main_theorem (Special case of Zariski's connectedness theorem when the two varieties are biration)
https://en.wikipedia.org/wiki/Stein_factorization
Cf aussi RedBook pour les liens entre les versions du ZMT.
See http://mathoverflow.net/questions/78696/is-there-an-intuitive-reason-for-zariskis-main-theorem for an intuitive geometric meaning.

Stein factorisation:
Soit f: X -> Y un morphisme propre (Y loc. noeth). Alors f se factorise
X->Y'->Y où g:Y'->Y est fini et f':X->Y' est un O-morphism (propre),
ie f'_*O_X = O_Y'. Et donc par ZMT, les fibres de f' sont connexes.

Pr: Y′ = Spec_S f_∗ O_Y. De plus Y' est la normalisation de Y dans X.
Cf https://stacks.math.columbia.edu/tag/03GX pour une extension au cas non
loc. noeth; la seule conclusion qui change est que Y'->Y n'est plus fini
mais entier.

Réciproque (cf maths.avancees:766)
EGA III.7.8.8: Si Y schéma localement noethérien, f:X->Y un morphisme
propre et plat / \Gamma(X_y, O_X_y)=k(y). Alors il existe un
voisinage ouvert U de y tel que l'homomorphisme canonique O_Y|U \to
f_*(O_X)|U soit bijectif. En particulier, si f est plat, projectif, de
présentation finie, à fibres géométriques intègres, f est un O-morphisme
universel. Cf aussi maths.avancees:792 qui dit que si f:X->Y (Y noeth
réduit) est propre surjectif à fibres géométriques réduites et connexes, alors 
f est un O-morphisme.
[Donc on a pas besoin de f plat, mais on a quand même:
À tout hasard, je rappelle aussi que si f:X->S est un morphisme dont
toutes les fibres ont la même dimension, avec S régulier et X
Cohen-Macaulay, alors f est automatiquement plat (EGA IV.6.1.5).]

Thm (Grothendieck's form of ZMT):
Si f:X->Y est un morphisme propre (X,Y loc noeth), f':X->Y' le morphisme
O-connexe associé, g:Y'->Y le morphisme fini, alors
1) - L'image réciproque d'un point de Y' est connexe (non vide car f', et
     aussi f, est surjective).
   - Donc le nombre de composantes connexes de f^{-1}(y) est le cardinal de
     la fibre g^{-1}(y).
   - En particulier si X et Y variétés, f:X->Y morphisme propre surjectif,
     k(Y) sep clos dans k(X) (par ex f birational), alors si y est un point
     normal, l'image réciproque de y est connexe.
     [Pr: O_Y,y=O_Y',y' car Y' est fini sur Y mais k(Y) est sép clos dans
     k(X)=k(Y') et donc l'image réciproque de y est connexe.]
2) - X_0={points isolés dans leurs fibres} est ouvert (topologiquement)
   - f'|X_0 est une immersion ouverte
     Donc si X_0 est non vide, et X et Y sont irréductibles,
     dim X=dim X_0=dim Y'=dim Y et donc si X irréd k(X)=k(X_0)=k(Y') fini
     sur k(Y).

Th: Si f: X->Y (noeths) est séparé de type fini, alors par le th de
compatification de Nagata, f est une immersion ouverte dans X' propre sur
Y, donc on peut aussi appliquer le 2) du th précédent, cf FOAG Section
29.6.
En particulier, un morphisme quasi-fini est une composée d'une
immersion ouverte et d'un morphisme fini: si f:X->Y est un morphisme
séparé, quasi-fini, de présentation finie (et Y qc), alors f se factorise
comme immersion ouverte et morphisme fini.

Cor (Chevalley): f: X->Y (noeths) quasi-fini propre est fini.

Th: The Noetherian conditions in Theorem 29.6.1 can be relaxed (see
[Gr-EGA, IV3 .8.12.6] or [GW, Thm. 12.73]): if π : X → Y is a separated
morphism of finite type, and Y is quasicompact and quasiseparated, then the
set of points X0 isolated in their fiber is open in X, and for every
quasicompact open subset U of X0 , there is a factorization
such that β:Y'->Y is finite, γ|U is a quasicompact open embedding, and γ^−1
(γ(U)) = U.

Résumé: si f:X->Y (noeths) séparé de type fini, X0={points isolés dans
leurs fibres} est ouvert et on a une factorisation X0->Y'->Y où
X->Y: immersion ouverte et Y'->Y: morphisme fini.
- En particulier si f est quasi-fini, X=X0 ie X ouvert de Y'.
- Si de plus f est birationnelle et Y normal (et X intègre), Y'=Y, ie X->Y est une immersion ouverte.
- Si de plus f est une bij, c'est un iso.
=> si f birationnelle + f propre: préimage d'un point normal de Y est connexe
       (+séparée)     + f quasi-fini, Y normal: f immersion ouverte
                      + f bijectif, Y normal: f iso

Pr: k(Y')=k(X)=k(Y) car f birationnelle. Si Y normal, Y' extension finie de
Y est donc égale à Y.

Lien avec la normalisation
--------------------------

Soit f:X->Y un morphisme (séparé de type fini) quasi-fini, dominant de variétés
intègres (noeth.) ftilde: Xtilde->Ytilde le morphisme de normalisation
(Xtilde=cloture intégrale de X dans k(X)).
La factorisation de Stein donne:
Xtilde ouvert Ytilde' -fini-> Ytilde
  |           |               |
  X    ouvert Y'      -fini-> Y
- On vérifie que Ytilde' est la cloture intégrale de Ytilde (donc de Y) dans
k(X) (cf la remarque sur le Th 1 dans Dieudonné)
- De plus Ytilde'->Ytilde est fini sur Ytilde normal, donc est ouvert (car on
a le going up).
- Si de plus Y est normal et f bijectif (ou plus généralement si les fibres
  sont de même cardinal, par exemple f plat [TODO plat implique fibre même
  degré, mais pas forcément même cardinal; on doit quand même pouvoir
  conclure en disant que f plat => f universellement ouvert, et f
  universellement ouvert sur Y unibranche => f équidimensionnel, cf EGA
  IV.14.4.1)
  => f fini, Xtilde=Ytilde' et [K(X):K(Y)]_s=card des fibres
  [cf Dieudonné plus bas]

Dieudonné
---------

Dieudonné: Cours de géométrie algébrique, Chapitre 5, Points normaux et
normalisation [pour des variétés sur un corps alg clos]:
(J. Dieudonné, Cours de géométrie algébrique, tome 2, P.U.F., 1974; $5.3, Prop 5; $5.4 Cor 4, p. 134)

- Préliminaires:

Prop 3 [normalisation]: Si A intègre, X=Spec(A) est normale (ie les anneaux
locaux sont normaux) ssi A est int clos. 
Cor: Si X irréductible, son normalisé est birationnel à X, donc X contient
un ouvert normal.

Prop 4 [Version de Going-Down]: Si u:X->Y fini surjectif (X irréd, Y irréd
normale), pour tout x et W composante irréd contenant u(x), il existe une
composante irréductible x \in W' de u^{-1}(W) dominant W.
Cor: Si u:X->Y est dominant (X,Y irréd), il existe un ouvert V de Y (qui
est une variété normale), telle que le même résultat s'applique à
u^{-1}(V)->V.

Prop 5+Cor: Définition de la cloture normale d'une variété irréductible X dans une extension algébrique; si X est complète/proj, Y aussi.

Prop 6 [version de la platitude générique]: 
si u:X->Y est fini surjectif, (X,Y irréd, Y normale)
- le card de u^{-1}(y) est au plus [k(X):k(Y)]_s
- il existe un ouvert V de Y tel que u^{-1}(V) soit isomorphe à la normalisée de V dans k(X) et le card des fibres de V est [k(X):k(Y)]_s]
[Attention: en général la cloture normale n'est pas plate, donc il ne
suffit pas d'avoir que u^{-1}(V) soit isomorphe à la normalisée pour avoir
des fibres de même cardinal. De plus Dieudonné compte le nombre de points
sans la multiplicité, donc même la platitude n'est pas suffisant pour avoir
des fibres de card constantes]

- Section 5.4: théorème principal de Zariski.

Th 1: X, Y irréductibles, u: X->Y dominant. Si x est isolé dans la fibre
u^{-1}(u(x)) alors dim X=dim Y et localement en x et u(x), u se factorise
comme u: x \in U->V'->u(x) \in V, u=immersion ouverte \circ morphisme fini (donc surjectif). Si X est normale, on peut prendre V=Y et V'=normalisée de Y dans k(X).

[Rem: On sait même qu'on a la version plus forte du ZMT suivante:
Th: Si f: X->Y (noeths) est séparé de type fini, X_0 les points isolés dans
leur fibre, alors X_0 est une immersion ouverte dans Y', Y'->Y fini,
et de plus k(X) est fini sur k(Y) si X_0 non vide.
Dans le cadre de variétés, si X normal et irréd, Y irréd, on peut prendre
Y'=normalisé de Y dans k(X): En effet: soit Z la cloture normale de Y dans
k(X), comme Y'->Y est fini et k(Y')=k(X), on a un morphisme g:Z->Y' fini.
g^{-1}(X)->X est alors birationnel surjectif sur X normal, ie un iso, donc
on a une immersion ouverte de X dans Z]

Cor 1: Sous les mêmes hypothèses, on a <=>
(i) X est normale et tout x \in X est isolé dans sa fibre
(ii) k(X) est une ext finie de k(Y) et u:X->Y'->Y où Y' est la normalisée
de Y dans k(X), et X->Y' est une immersion ouverte. De plus il existe une
sous-variété normale V ouverte de Y telle que les fibres u^{-1}(v) sont de
cardinal [k(X):k(Y)]_s. [En effet pour le dernier point, cf le cor de la
Prop 3 et la Prop 6]
En particulier si de plus X est complète, alors Y est complète et X=Y'.

[Preuve: (ii)=>(i) est triviale, et (i)=>(ii) vient de ZMT]

Cor 2: Si X irréd, Y irréd normale, u birationnelle tel que tout point x de
X soit isolé dans sa fibre. Alors u est une immersion ouverte de X sur Y
(et donc X est normale). Si X est complète u est un iso.

[Preuve: trivial par le strong ZMT. Dieudonné applique le Cor 1 à Xtilde, la
normalisation de X pour montrer que Xtilde est isomorphe à un ouvert de Y,
donc X=Xtilde.]

Attention: même si X et Y sont normales et u birationnel, u peut ne pas
être quasi-fini, Dieudonné donne l'exemple du cône x1x3-(x1^2+x2^2)=0 qui
est une variété normale.

Cor 3: si X et Y irréd normales, u^{-1}(y) est fini de card n indépendant de
y \in Y, alors X est isomorphe à la normalisée Y' de Y dans k(X) et donc u
est fini.

[Pr: X étant ouverte dans Y' et Y'->Y étant fini, u(Y'\X) est fermé, et
donc V=Y\u(Y'\X) est ouvert et u^{-1}(V)=X. Donc la fibre générique est de
cardinal n. Si y\in Y'\X, u^{-1}(u(y)) a pour cardinal n+1, ce qui
contredit la proposition 6]

Cor 4: Si X irréd, Y irréd normale, u bijectif, alors
- k(X)/k(Y) est radiciel, et si X' est la normalisée de X, X'->X->Y est
  bicontinu et bijectif (et X' est la normalisée de Y dans k(X))
[En particulier si X est normal, X s'identifie à la normalisée de O(Y) dans k(X), ie f:X->Y est fini et f est donc une bijection radicielle finie, Cf Polo, Chapitre 5, Th 15.14]
- Y complet => X complet
- X affine => Y affine

[Pr: comme u bijectif, k(X)/k(Y) est radiciel, et par la prop 6 v:X'->X->Y
est injectif, donc bijectif (car u est bijectif), donc par le Cor 3, v est
finie, donc fermée, donc bicontinue et X' est la normalisée de Y dans k(X).
On en déduit que si Y est complet, X' aussi, donc X aussi.
X affine => Y affine est plus dur.]

Cor 5: si X irréd, Y irréd normale, u dominant, et x isolé dans sa fibre,
alors l'image par u de tout voisinage de x dans X est un voisinage de u(x)
dans Y. En particulier si tous les points sont isolés dans leur fibres, u
est ouverte.

[Pr: on décompose en X->Y'->Y, X étant ouvert dans Y'. Comme Y'->Y est fini
et Y int. clos, par le going up c'est ouvert aussi. Dieudonné se ramène au
cas X normal et fait la même preuve.]

Prop 7 (Chevalley): si X irréd, Y irréd normale, u dominant, et x tel que
les composantes irréductibes contenant x dans sa fibre u^{-1}(u(x)) soient
toutes de dimension r=dim X-dim Y. Alors l'image par u de tout voisinage de
x dans X est un voisinage de u(x) dans Y. En particulier si les composantes
irréductibes des fibres (non vides) sont toutes de dim r, u est ouverte.

Pr: en effet on se ramène à X->Y*k^r (quitte à localiser). Attention, il y
a un manque dans la preuve de Dieudonné, il est très important de supposer
x équidimensionel comme il fait pour avoir que X->Y*k^r reste dominant. Cf
[Dimension]

Prop 8 (Chevalley): X,Y irréds, u dominant, f \in k[X]. Si f est constante
sur chacune des fibres, alors f \in k(X) est radiciel sur k(Y).

### Résumé [en utilisant les théorèmes de Zariski dus à Grothendieck plus forts sur les schémas]

Cor1: le dernier point sur le cardinal des fibres est vrai plus généralement par platitude générique [sauf qu'on comptant les multiplicités c'est [k(X):k(Y)] et non [k(X):k(Y)]_s]

Soit u:X->Y (X,Y irréd) tel que X_0=X.
Alors il existe Y' / X ouvert dans Y'->Y fini
On passe aux normalisés dans les corps de fractions:
utilde: Xtilde->Ytilde [todo: trouver une propriété universelle des
normalisés montrant que Xtilde->X->Y se factorise par Ytilde], on a
Xtilde_0=Xtilde [car Xtilde->X est fini]. Ici on peut prendre
Ytilde'=cloture de Ytilde (et donc de Y) dans k(X). On a le diagramme:

Xtilde ouvert Ytilde' -fini-> Ytilde
  |           |               |
  X    ouvert Y'      -fini-> Y
Comme k(Y')=k(X), et que Y'->Y est fini, on a un morphisme fini Ytilde'->Y'.

On a alors Cor2: si Y est normal et u birationnel, Ytilde'=Ytilde=Y'=Y et X est une immersion ouverte dans Y (et donc Xtilde=X)
Cor3: si le card des fibres de Xtilde->Ytilde est constant, Xtilde=Ytilde'
[Utiliser la prop 6. Et en fait la même preuve montre que si Y=Ytilde, ie
Y normal, et que le card des fibres de X->Y est constant, alors X=Y', ie
X->Y est fini, et du coup Xtilde la cloture normale de X est aussi la
cloture de Y, ie Xtilde=Ytilde']
Cor4: si u est bijectif et Y normal, alors utilde est bijectif
(trivialement surjectif, injectif via la prop 6), donc Xtilde=Ytilde' (et via la
prop 6 [k(X):k(Y)]_s=1 ie l'extension est radicielle)
Cor5: si u dominant, Y irréd normale, x \in X_0, alors l'image par u de tout voisinage de x dans X est un voisinage de u(x) dans Y.
[on peut travailler localement, il suffit de montrer que Xtilde->Ytilde=Y
est ouvert, et ça vient du going up pour les extensions normales.]

Résumé
======

Let f : X → Y be a morphism of schemes.

Monomorphismes:
  a) f is a monomorphism.
  b) f is radicial and formally unramified.
  c) For every y∈Y, the fiber f^−1(y) is either empty or isomorphic to Spec(k(y)).
[formally unramified+loc finite pres=unramified
 radicial=universally injective ie X(K) → Y(K) is injective
          ie f is injective on the topological spaces and for every point x in X, the extension of the residue fields k(f(x)) ⊂ k(x) is radicial, i.e. purely inseparable.]

Immersion ouverte:
(1) f is an open immersion,
(2) f is radicial and etale, [étale=plat+unramified]
(3) f is a flat monomorphism, locally of finite presentation.

Immersion fermée
(1) f is a closed immersion,
(2) f is a proper monomorphism
(3) f is proper, unramified, radicial.

Pr: https://mathoverflow.net/questions/45578/is-a-proper-monomorphism-of-schemes-necessarily-a-closed-immersion

Morphisme fini
(1) f est fini
(2) f est affine et propre
(3) f est propre et quasi-fini

Pr:  cf FOAG Th. 29.6.2 dans le cas f loc. de présentation finie (utilise
le ZMT), généralisé par Deligne au cas général, cf https://en.wikipedia.org/wiki/Finite_morphism


Quasi-affine: immersion ouverte -> affine
              si f:X->Y, f quasi-affine <=> O_X est f-ample
Quasi-projectif: immersion ouverte -> projectif

# Descent
https://math.stackexchange.com/questions/187058/why-should-faithfully-flat-descent-preserve-so-many-properties

https://stacks.math.columbia.edu/tag/03O6

Definition 54.16.1. Let U={ti:Ti→T}i∈I be a family of morphisms of schemes with fixed target. A descent datum for quasi-coherent sheaves with respect to U is a family (Fi,φij)i,j∈I where
  - for all i, Fi is a quasi-coherent sheaf on Ti, and
  - for all i,j∈I the map φij:pr∗0Fi≅pr∗1Fj is an isomorphism on Ti×TTj such that the diagrams
  - pr∗0Fi -pr∗01φij-> pr∗1Fj 
     \ pr∗02φik pr∗12φjk /
            pr∗2Fk 
    commute on Ti×TTj×TTk.

This descent datum is called effective if there exist a quasi-coherent sheaf F over T and OTi-module isomorphisms φi:t∗iF≅Fi satisfying the cocycle condition, namely φij=pr∗1(φj)∘pr∗0(φi)−1.

Theorem 54.16.2. If V={Ti→T}i∈I is an fpqc covering, then all descent data for quasi-coherent sheaves with respect to V are effective.

In other words, the fibered category of quasi-coherent sheaves is a stack on the fpqc site.

Proof: Descent of modules. 
If A→B is a ring map, we consider the complex (B/A)∙:B→B⊗AB→B⊗AB⊗AB→…
Lemma 54.16.3. If A→B is faithfully flat, then the complex (B/A)∙ is exact in positive degrees, and H^0((B/A)∙)=A.

Definition 54.16.5. Let A→B be a ring map and N a B-module. A descent datum for N with respect to A→B is an isomorphism φ:N ⊗_A B ≅ B ⊗_A N of B⊗_A B-modules such that the diagram of B⊗AB⊗AB-modules
N⊗_AB⊗_AB -φ01> B⊗_AN⊗_ABφ12
  φ02 \            / φ12
         B⊗_AB⊗_AN
commutes where φ01=φ⊗idB and similarly for φ12 and φ02.

Proposition 34.3.9. Let R→A be a faithfully flat ring map. Then
  - any descent datum on modules with respect to R→A is effective,
  - the functor M↦(A⊗RM,can) from R-modules to the category of descent data is an equivalence, and
  - the inverse functor is given by (N,φ)↦H0(s(N∙)).

# Propriétés utiles

https://mathoverflow.net/questions/234469/useful-non-trivial-general-theorems-about-morphisms-of-schemes

- Zariski's Main Theorem: Let Y be quasi-compact, separated and f:X→Y be separated, quasi-finite, finitely presented. Then there is a factorization X→Z→Y where the first map is an open immersion and the second is finite. Mnemonic: (quasi-finite) ∼ (finite) ∘ (open immersion)

- Nagata's compactification theorem: Let S be qcqs and f:X→S be separated, finite type. Then X densely embeds into a proper S-scheme.Mnemonic: non-horrible schemes have compactifications

- Temkin's factorization theorem: Let Y be qcqs and f:X→Y be separated, quasi-compact. Then there's a factorization X→Z→Y with the first being affine and the second proper. Mnemonic: (separated + quasicompact) = (proper) ∘ (affine).

- Chow's lemma: Let S be noetherian and f:X→S separated finite type. Then there exists a projective, surjective S-morphism X¯→X which is an isomorphism on a dense subset and where X¯→S is quasi-projective. Moreover X is proper iff X¯ is projective, and if X is reduced X¯ can be chosen to be so as well. Mnemonic: reasonable schemes have quasi-projective "replacements" and proper schemes have projective "replacements".
  Cf https://stacks.math.columbia.edu/tag/0200
  Cf aussi http://math.stanford.edu/~conrad/papers/nagatafinal.pdf Cor 2.6
  où on suppose juste S qcqs et où on montre qu'on peut prendre U n'importe
  quel ouvert qc dense de X quasi-projectif sur S:
  q: X¯->X est construit comme étant un U-blowup, ie q est projectif,
  surjectif, q^{-1}(U) \iso U et U-> X¯ est quasi-compact; et X¯ est
  quasi-projectif, ie on a X¯->Xbar une immersion ouverte dense avec
  Xbar->S projectif.

- Stein factorization to the list: (proper) = (integral) ∘ (proper with connected geometric fibers)
  http://stacks.math.columbia.edu/tag/03GX

- Open immersion = étale + monic (EGA IV4, 17.9.1+epsilon) = flat monic lfp

- integral morphism = affine + universally closed (EGA IV4, 18.12.8, https://stacks.math.columbia.edu/tag/01WG Lemma 28.42.7)
- closed immersion = proper monomorphism (EGA IV4, 18.12.6)
- qcqs = relatively affine over finite type Z-scheme (Thomason-Trobaugh, Theorem C.9)
- relative ampleness for a proper fp map is fibral (EGA IV3, 9.6.5)
- lfp map is unramifed iff etale-locally a closed immersion (EGA IV4, 17.7.1, 18.8.3), 
- qc separated map is immersion iff monic + Mochizuki's valuative criterion (Ch. I, sec. 2.4 of his book on p-adic Teichmuller theory in noetherian case).
- Finitely presented flat map is finite iff quasi-finite & separated with locally constant fiber rank (II, 1.19 Deligne-Rapoport in noetherian case)
- lfp = commutes with "expected" limits (EGA IV3 , 8.14.2)
- valuative criterion for flatness over a reduced base (EGA IV3, 11.8.1 in noetherian case with dvr's, 4.2.10 in Part I of Raynaud-Gruson in general)
- universal schematic dominance/density is fibral under "expected" flatness hypotheses (EGA IV3, 11.10.9, 11.10.10), 
- any flat lfp cover admits a section over a locally quasi-finite & flat lfp cover (EGA IV4, 17.16.2).
- Smooth/étale morphisms can be lifted (Zariski-locally on the source) along closed immersions (EGA IV_4, 18.1.1). – AAK Mar 25 '16 at 16:48
- I like Zariski-Nagata purity theorem: Let f:X→Y
be a dominant and quasi-finite morphism between integral schemes. Suppose that X is normal and Y is regular and locally noetherian, and let Z be the set of points of X where f is not étale. Then either X=Z or Z is of pure codimension 1. (See SGA1, Exposé X, Théorème 3.1) Mnemonic: "the ramification locus of quasi-finite dominant morphisms is a divisor if the base is smooth" 

- f: X->Y is smooth iff locally on X it is of the form U -étale-> A^d_Y -> Y.
