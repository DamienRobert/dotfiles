vim: ft=markdownlight fdm=expr

Rappel: si H ouvert dans G, H est fermé.

Définitions
===========

G groupe algébrique linéaire/k

* Borel
- Borel = a maximal Zariski closed and connected solvable algebraic subgroup.
        => classe de conjugaison unique sur kbar
- Parabolique = G/P est complet = P contient B

Autrement dit, sous-groupe de borel B = sous-groupe connexe résoluble maximal
Et si k=kbar:
- ils sont conjugués
- G/B est une variété projective
- N_G(B)=B
- G=\union gBg^-1
Prop (Borel): G connexe résoluble agit sur V propre => il existe un point fixe

* Tore
Rang: la dimension d'un tore max. Le k-rang est la dimension d'un k-tore
déployé max. anisotrope: k-rang=0

* Unipotent
- u est unipotent si (pour un ou tous) plongement linéaire u est une
  matrice unipotente.
- G est unipotent ssi tous ses éléments (G(kbar) sont unipotents ss'il existe un
  plongement linéaire de G dans U_n (le groupe unipotent de GL_n)
  (cf Lie-Kolchin)
- G est résoluble ssi G(kbar) est résoluble

* Structure de G connexe résoluble/kbar
- G est isomorphe à un sous-groupe de T_n (les matrices triangulaires sup)
  [Lie-Kolchin]
- \exist! G_u sous-groupe unipotent connexe distingué maximal
  (G_u= G \inter U_n \subset T_n)
- si T est un sous-tore maximal de G, G=G_u x| T
  ces tores sont conjugués par les éléments de G(kbar)

* Radicaux (k parfait?)
- R(G), le radical de G est l'unique sous-groupe connexe résoluble
  distingué maximal
- R_u(G), le radical unipotent de G est l'unique sous-groupe connexe
  unipotent distingué maximal
  R_u(G)=R(G)_u
- G semisimple ssi R(G_kbar)=0 (ex SL_n); G réductif si R_u(G_kbar)=0, ie si le
  radical sur kbar est un tore (ex GL_n)
- G réductif => G isogène à D(G)xR(G) où D(G) est le groupe dérivé et R(G)
  est un tore.

Classification
==============

Simply connected
----------------

* Définition de simply connected dans le cadre algébrique
- https://mathoverflow.net/questions/123009/simply-connected-simple-algebraic-groups
- https://mathoverflow.net/questions/19262/simply-connectedness-of-algebraic-group

G semi simple is
- simply connected = every central isogeny from a semisimple group to G is an isomorphism
- adjoint type = its center is trivia

Root datum
----------

* https://en.wikipedia.org/wiki/Root_datum

A root datum consists of a quadruple
    (X^∗, Φ, X_∗, Φ^∨)
where
-  X^*, X_* are dual free abelian groups (with respect to a perfect pairing ( , ))
- Φ is a finite subset of X^∗
  Φ^∨ is a finite subset of X_∗ (and in bijection with Φ via α -> α^∨)
- For each root α, (α , α^∨) = 2
- For each α, the map x ↦ x − (x ,α^∨)α induces an automorphism of the root datum.

If Φ does not contain 2α for any α ∈ Φ, then the root datum is called reduced.

A connected split reductive algebraic group over K is uniquely determined (up to isomorphism) by its root datum, which is always reduced.

* https://en.wikipedia.org/wiki/Root_system

* https://en.wikipedia.org/wiki/Dynkin_diagram
Classifie les systèmes de racines

The central classification is that a simple Lie algebra has a root system, to which is associated an (oriented) Dynkin diagram

* https://en.wikipedia.org/wiki/Satake_diagram
Dynkin diagrams classify complex semisimple Lie algebras. Real semisimple Lie algebras can be classified as real forms of complex semisimple Lie algebras, and these are classified by Satake diagrams, which are obtained from the Dynkin diagram by labeling some vertices black (filled), and connecting some other vertices in pairs by arrows, according to certain rules.

Chevalley theorem
-----------------

* Théorème de Chevalley:
https://en.wikipedia.org/wiki/Reductive_group

Les groupes algébriques réductifs sur kbar sont classifiés par leur systèmes de
racines (de Dynkin).
De plus on a un théorème d'existence sur k, donc la classification sur k
revient à étudier les formes et donc l'action du groupe de Galois sur les
systèmes de racines. Si G est split, on retombe sur les systèmes de racines
de Dynkin.

* https://www.jmilne.org/math/CourseNotes/RG.pdf
Cf Introduction

1) Les groupes de Lie semi-simples complexes (ou réels) sont algébriques.
La classification des groupes algébriques sur C est donc la même que celle
des groupes de Lie simple sur C, qui est la même que celle des algèbres de
Lie simples. On a donc A_n, B_n, C_n, D_n, E_6, E_7, E_8, F_4, G_2.
(en fait le système de racine est défini sur Z donc ils sont arithmétiques)

2) La classification reste la même pour un groupe algébrique simple sur un
corps alg. clos, quelque soit la caractéristique (Attention: ce n'est pas
le cas pour les algèbres de Lie simples!)

3) En fait la classification reste la même pour un schéma en groupe
réductif split quelconque.

Cas split
---------

* Plus de détails sur le cas split, cf
https://en.wikipedia.org/wiki/Reductive_group

Chevalley showed in 1958 that the reductive groups over any algebraically
closed field are classified up to isomorphism by root data.[13] In
particular, the semisimple groups over an algebraically closed field are
classified up to central isogenies by their Dynkin diagram, and the simple
groups correspond to the connected diagrams. Thus there are simple groups
of types An, Bn, Cn, Dn, E6, E7, E8, F4, G2. This result is essentially
identical to the classifications of compact Lie groups or complex
semisimple Lie algebras, by Wilhelm Killing and Élie Cartan in the 1880s
and 1890s. In particular, the dimensions, centers, and other properties of
the simple algebraic groups can be read from the list of simple Lie groups.
It is remarkable that the classification of reductive groups is independent
of the characteristic. For comparison, there are many more simple Lie
algebras in positive characteristic than in characteristic zero.

More generally, the classification of split reductive groups is the same
over any field.
- A semisimple group G over a field k is called simply connected if every
  central isogeny from a semisimple group to G is an isomorphism. (For G
  semisimple over the complex numbers, being simply connected in this sense
  is equivalent to G(C) being simply connected in the classical topology.)
  [ie G est le plus gros possible]
- Chevalley's classification gives that, over any field k, there is a
  unique simply connected split semisimple group G with a given Dynkin
  diagram, with simple groups corresponding to the connected diagrams. 
- At the other extreme, a semisimple group is of adjoint type if its center
  is trivial.
- The split semisimple groups over k with given Dynkin diagram are exactly
  the groups G/A, where G is the simply connected group and A is a
  k-subgroup scheme of the center of G.

* Schéma en groupe réductif split
A group scheme G over a scheme S is called reductive if the morphism G → S is smooth and affine, and every geometric fiber G_k¯ is reductive. Extending Chevalley's work, Michel Demazure and Grothendieck showed that split reductive group schemes over any nonempty scheme S are classified by root data.[16] This statement includes the existence of Chevalley groups as group schemes over Z, and it says that every split reductive group over a scheme S is isomorphic to the base change of a Chevalley group from Z to S.

* Groupe d'automorphismes
The outer automorphism group of a split reductive group G over a field k is isomorphic to the automorphism group of the root datum of G. Moreover, the automorphism group of G splits as a semidirect product:
    Aut(G) ≅ Out(G)⋉(G/Z)(k),
where Z is the center of G.

For a split semisimple simply connected group G over a field, the outer automorphism group of G has a simpler description: it is the automorphism group of the Dynkin diagram of G.
Cf https://en.wikipedia.org/wiki/Root_datum
A root datum contains slightly more information than the Dynkin diagram, because it also determines the center of the group.

* Représentations:
For a split reductive group G over a field k, the irreducible
representations of G (as an algebraic group) are parametrized by the
dominant weights, which are defined as the intersection of the weight
lattice X(T) ≅ Z^n with a convex cone (a Weyl chamber) in R^n. In particular,
this parametrization is independent of the characteristic of k.

Cas non-split
-------------

* https://en.wikipedia.org/wiki/Reductive_group#Non-split_reductive_groups

- Every nondegenerate quadratic form q over a field k determines a reductive group G = SO(q). Here G is simple if q has dimension n at least 3, since G_k¯ is isomorphic to SO(n) over an algebraic closure k¯. The k-rank of G is equal to the Witt index of q (the maximum dimension of an isotropic subspace over k).[22] So the simple group G is split over k if and only if q has the maximum possible Witt index, ⌊n/2⌋
- Every central simple algebra A over k determines a reductive group G = SL(1,A), the kernel of the reduced norm on the group of units A* (as an algebraic group over k). The degree of A means the square root of the dimension of A as a k-vector space. Here G is simple if A has degree n at least 2, since G_k¯ is isomorphic to SL(n) over k¯ has index r (meaning that A is isomorphic to the matrix algebra Mn/r(D) for a division algebra D of degree r over k), then the k-rank of G is (n/r) − 1.[23] So the simple group G is split over k if and only if A is a matrix algebra over k.

As a result, the problem of classifying reductive groups over k essentially includes the problem of classifying all quadratic forms over k or all central simple algebras over k. These problems are easy for k algebraically closed, and they are understood for some other fields such as number fields, but for arbitrary fields there are many open questions.

A reductive group over a field k is called isotropic if it has k-rank greater than 0 (that is, if it contains a nontrivial split torus), and otherwise anisotropic. For a semisimple group G over a field k, the following conditions are equivalent:
  - G is isotropic (that is, G contains a copy of the multiplicative group Gm over k);
  - G contains a parabolic subgroup over k not equal to G;
  - G contains a copy of the additive group G_a over k.
For k perfect, it is also equivalent to say that G(k) contains a unipotent element other than 1.[24]

For a connected linear algebraic group G over a local field k of characteristic zero (such as the real numbers), the group G(k) is compact in the classical topology (based on the topology of k) if and only if G is reductive and anisotropic.[25] Example: the orthogonal group SO(p,q) over R has real rank min(p,q), and so it is anisotropic if and only if p or q is zero.[22]

A reductive group G over a field k is called quasi-split if it contains a Borel subgroup over k. A split reductive group is quasi-split. If G is quasi-split over k, then any two Borel subgroups of G are conjugate by some element of G(k).[26] Example: the orthogonal group SO(p,q) over R is split if and only if |p−q| ≤ 1, and it is quasi-split if and only if |p−q| ≤ 2.[22] 

Root datum for a split reductive group
--------------------------------------

* https://www.jmilne.org/math/CourseNotes/LAG.pdf, p. 146
Si (G,T) est split, la représentation adjointe induit une action de T sur
g. Comme T est split, g=\oplus g^a d'Eigenspace, où Ad(t) agit via un
caractère a de T.

g=h+ \oplus g^a où h=eigenspace 0=Lie(T), et les autres sont des
eigenspaces non nuls, le a correspondant est *une racine* de T.
ie une racine de T c'est un caractère α tel que Ad_t(x)=α(t)x.

- Groupe de Weyl de (G,T)
Si T est un tore, N_G(T)°=C_G(T)°
(Par 1.13 (RIGIDITY) Every action of an algebraic group G on a group H of multiplicative type is trivial on the identity component of G; donc N_G(T)° agit trivialement sur T donc est dans le centre).

Si (G,T) est un groupe réductif split, le groupe de Weyl W(G,T) est N_G(T)(k)/C_G(T)(k). Si k infini, T(k) est dense dans T, donc W(G,T)=N_G(k)(T(k))/C_G(k)(T(k)).

Lemma 5.5: W(G,T) stabilise R dans X*(T), où R=racines de T.

Prop 5.6:
- pour toute racine a, il existe U_a =~ G_a dans G tel que
  t.u_a(x).t^{-1}=u_a(a(t)x)
- si T_a=Ker(a)°, G_a=C_G(T_a), alors W(G_a,T) contient exactement un
  élément s_a qui agit sur X*(T) via s_a(x)=x-(x,a^v)a où a^v \in X_*(T)
  et (a, a^v)=2.
- G_a=<T, U_a, U_{-a}>.
Th 5.8: on a un root datum.

Lien avec les groupes de Lie
============================
[cf LieGroup pour plus de détail]

Définition d'un groupe de Lie réductif
---------------------------------------

* Cas réel
https://en.wikipedia.org/wiki/Reductive_group#Real_reductive_groups

A real reductive group is a Lie group G such that there is a linear
algebraic group L over R whose identity component (in the Zariski topology)
is reductive, and a homomorphism G → L(R) whose kernel is finite and whose
image is open in L(R) (in the classical topology). It is also standard to
assume that the image of the adjoint representation Ad(G) is contained in
Int(g_C) = Ad(L^0(C)) (which is automatic for G connected).

In particular, every connected semisimple Lie group (meaning that its Lie algebra is semisimple) is reductive.

Attention: même pour les groupes algébriques, algèbre de Lie réductive =/>
groupe de Lie réductif (contre exemple: G=G_a)

Groupes de Lie algébriques
--------------------------

* Résumé

- Il y a des algèbres de Lie (sur R ou C) non algébriques.
  Même si g est algébrique, elle peut avoir plus de représentations que G.

- Les algèbres de Lie réelles (ou complexes) semi-simples sont algébriques,
  donc un groupe de Lie réel semi-simple est algébrique *à quotient près*
  (attention, le quotient peut être non fini pour un groupe de Lie réel
  semi-simple, eg le revêtement universel de Sl_2(R), car le π_1=Z).

  Le groupe métaplectique est semi-simple mais pas linéaire, donc pas
  algébrique.

- Les groupes de Lie complexes semi-simples sont algébriques.
  cf Intro de https://www.jmilne.org/math/CourseNotes/RG.pdf
  ou https://en.wikipedia.org/wiki/Complex_Lie_group

  En fait les groupes de Lie complexes *réductifs* sont algébriques, 
  avec la même catégorie de représentations, cf
  https://www.jmilne.org/math/CourseNotes/LAG.pdf

  Un groupe de Lie réel réductif a un plus gros quotient algébrique, qui a
  la même catégorie de représentations.

  Attention: si G est un groupe algébrique simplement connexe, G(R) peut ne
  pas être simplement connexe, ex Sl_2/R est simplement connexe, mais pas
  Sl_2(R).

  Et G peut être connexe, mais G(R) pas connexe:
  https://mathoverflow.net/questions/107577/are-certain-simple-lie-groups-linear-algebraic-groups
  Par exemple PSL_2 est un groupe algébrique connexe, mais PSL_2(R) =~ PGL(2, R)
  n'est pas connexe. En particulier, PSL(2, R) n'est pas égal aux R-points
  d'un groupe algébrique.
  [G almost simple connected with trivial center est-il de la forme G_alg(R)? 
  For many purposes, to have G as a Zariski dense, open (for the ordinary
  topology) subgroup of finite index in the group of real points of some
  algebraic groups, is enough: you can invoke Zariski topology, etc.
  Otherwise if G is connected for the ordinary topology, it indeed admits a
  finite covering, that consists of the real points of the simply connected
  covering (in the algebraic sense) of the corresponding algebraic group. –
  YCor]

- un groupe compact réel (pas forcément connexe) est algébrique, cf
  [LieGroup] ou plus bas: on a même une équivalence de catégorie avec les
  R-anisotropic reductive R-groups whose connected components have R-points
  G->G(R) qui préserve les composantes connexes et la notion de semi-simplicité.

- en utilisant le théorème d'Ado une algèbre de Lie g est linéaire, et sur
  R ou C on peut prendre l'exponentielle (et avec la bonne version d'Ado)
  voir qu'on peut construire un groupe de Lie G fermé dans Gl_V qui a g
  pour algèbre de Lie.

* Une algèbre de Lie n'est pas forcément algébrique (ie algèbre de Lie d'un
groupe algébrique).
Cf Milne, 1.25 pour une exemple en carac 0 (donc en particulier) pour R ou C
d'une algèbre de Lie résoluble g de dimension 5 telle que pour toute
représentation ρ il existe un élément x tel que ρ(x)_nil our ρ(x)_ss n'est
pas dans ρ(g); en particulier g n'est pas algébrique.

* Critère pour qu'une algèbre de Lie soit algébrique
https://mathoverflow.net/questions/124/is-every-finite-dimensional-lie-algebra-the-lie-algebra-of-an-algebraic-group

C'est vrai si g est semi-simple, en carac 0:
A very nice fact over fields k of char. 0: for any linear algebraic k-group G and Lie k-subalgebra h in g = Lie(G), [h,h] = Lie(G') for a (unique) connected closed k-subgroup G′ in G. In particular, if h is a semisimple Lie k-subalgebra of g (so h = [h,h]) then it is the Lie algebra of a connected closed k-subgroup of G. See 7.9 in Borel's book on linear algebraic groups (and 7.7 for a nec/sufficient condition in general, in char. 0). So as always, it's the commutative/solvable stuff that creates all the headaches. – BCnrd May 5

Plus généralement, ad(g) in End(g) is algebraic (ie Lie algebra of an algebraic subgroup of Gl(g)) <=> g to be the Lie algebra of some algebraic G.
If a Lie subalgebra of gl(V) is the Lie algebra of an algebraic group, then it contains the semisimple and nilpotent factors of any element.

Wikipedia
---------

* https://en.wikipedia.org/wiki/Linear_algebraic_group#Lie_groups

There are several reasons why a Lie group may not have the structure of a linear algebraic group over R.
- A Lie group with an infinite group of components G/G° cannot be realized as a linear algebraic group.
- An algebraic group G over R may be connected as an algebraic group while the Lie group G(R) is not connected, and likewise for simply connected groups. For example, the algebraic group SL(2) is simply connected over any field, whereas the Lie group SL(2,R) has fundamental group isomorphic to the integers Z. The double cover H of SL(2,R), known as the metaplectic group, is a Lie group that cannot be viewed as a linear algebraic group over R. More strongly, H has no faithful finite-dimensional representation.
- Anatoly Maltsev showed that every simply connected nilpotent Lie group can be viewed as a unipotent algebraic group G over R in a unique way.[27] (As a variety, G is isomorphic to affine space of some dimension over R.) By contrast, there are simply connected solvable Lie groups that cannot be viewed as real algebraic groups. For example, the universal cover H of the semidirect product S1 ⋉ R2 has center isomorphic to Z, which is not a linear algebraic group, and so H cannot be viewed as a linear algebraic group over R.

Milne
-----

* https://www.jmilne.org/math/CourseNotes/LAG.pdf
(Carac 0)
 
$ 4 Semisimple algebraic groups p. 134
For any semisimple Lie algebra g, Rep(G)=Rep(g) for some semisimple algebraic group G with Lie algebra g, ie g algébrique.

$ III Lie groups p. 157
* A real (resp.  complex) linear Lie group is said to be reductive if every real (resp. complex) representation is semisimple

* Foncteur groupe algébrique -> groupe de Lie

THEOREM 2.1 There is a canonical functor L from the category of real (resp.  complex) algebraic groups to real (resp. complex) Lie groups, which respects Lie algebras and takes GLn to GLn(R) (resp. GLn(C)) with its natural structure as a Lie group. It is faithful on connected algebraic groups (all algebraic groups in the complex case).

Proof:
(a) Choose an embedding G -> GLn. ThenG(k) is a closed subgroup of GLn(C), and it is known that every such subgroup has a unique structure of a Lie group (it is real or complex according to whether its tangent space at the neutral element is a real or complex Lie algebra). See Hall 2003, 2.33.
(b) For k=R (or C), there is a canonical functor from the category of nonsingular real (or complex) algebraic varieties to the category of smooth (resp. complex) manifolds(Shafarevich 1994, I, 2.3, and VII, 1), which clearly takes algebraic groups to Lie groups

* Obstructions
2.2 In the real case, the functor is not faithful on non connected algebraic groups. (ex: μ_3(R)=1)

2.3 The functor is not full.
For example, e^z: C->C* is a homomorphism of Lie groups not arising from a homomorphism of algebraic groups Ga -> Gm.For another example, consider the quotient map of algebraic groups SL3 -> PSL3.  It is not an isomorphism of algebraic groups because its kernel is μ_3, but it does give anisomorphism SL3(R)->PSL3(R) of Lie groups. The inverse of this isomorphism is not algebraic.

2.5 Not all Lie groups have a faithful representation.
For example π_1(SL2(R))=Z, and its universal covering space G has a natural structureof a Lie group.  Every representation of G factors through its quotient SL2(R).

2.6 Even when a Lie group has a faithful representation, it need not be of the form L(G) for any algebraic group G. Consider, for example, GL_2(R)+

[note: on a aussi des contre exemples sur C en prenant une algèbre de Lie
non algébrique, on peut construire un sous groupe fermé de Gl_n(C) qui a
cette algèbre de Lie, mais il est non algébrique]

2.7 Let G be an algebraic group over C. Then the Lie group G(C) may have many more representations than G

* Cas réductif complexe

Theorem: reductive complex algebraic group G =~ reductive complex Lie group G(C)
         is an equivalence of category; and their catagories of
         representations are equivalent.

More generally, Th 2.9, si G de Lie complexe et linéaire, (<=>)
- Rep_G(C) est algébrique (comme catégorie Tannakienne)
- G est algébrique (et avec la même catégorie de représentation)
- G est un produit semi-direct d'un groupe réductif et de N(G), son
  "representation radical" (qui pour G linéaire est égal au radical de son
  groupe dérivé.)

* Cas réductif réel
G de Lie réel est dit algébrique si G°=H(R)° pour H algébrique
(°=composante connexe).

Th 2.13: si G de Lie réductif réel, il existe T(G) algébrique qui a la même
catégorie de représentations et tel que T(G)(R) est le plus gros quotient
algébrique de G (et =G si G a une représentation fidèle, ie est linéaire)

- Cas compact réel:
Th 2.14: si G groupe de Lie compact connexe réel, G=T(G)(R) pour T(G)
semi-simple avec la même catégorie de représentation, et tel que pour tout
G' réductif complexe, Hom_C(T(G), G')=Hom_R(G, G'(C)) (ie T=G x_R C comme
groupe alg)

Cf aussi wikipedia: https://en.wikipedia.org/wiki/Reductive_group#Other_characterizations_of_reductive_groups
Every compact connected Lie group has a complexification, which is a complex reductive algebraic group. In fact, this construction gives a one-to-one correspondence between compact connected Lie groups and complex reductive groups, up to isomorphism. For a compact Lie group K with complexification G, the inclusion from K into the complex reductive group G(C) is a homotopy equivalence, with respect to the classical topology on G(C). For example, the inclusion from the unitary group U(n) to GL(n,C) is a homotopy equivalence.

Tannaka
-------

https://mathoverflow.net/questions/21415/what-algebraic-group-does-tannaka-krein-reconstruct-when-fed-the-category-of-mod?rq=1

Groupes de Lie réels compacts
-----------------------------
= groupes réductifs R-anisotropes avec un point réel dans chaque composante
connexe

- https://mathoverflow.net/questions/6079/classification-of-compact-lie-groups/16269#16269

  Theorem (Chevalley) The category of compact Lie groups is equivalent to the category of R-anisotropic reductive R-groups whose connected components have R-points, and if G is such an R-group then G^0(R)=G(R)^0. The R-group G is semisimple if and only if G(R) has finite center, and in such cases G^0 is simply connected in the sense of algebraic groups if and only if G(R)^0 is simply connected in the sense of topology.

Voir aussi https://www.jmilne.org/math/CourseNotes/LAG.pdf p. 161: Compact topological groups

* Le post complet de BCnrd:
Compact Lie groups may not be connected, and the question did not assume
connectedness whereas all of the other answers did. If G is a linear
algebraic group over R then G(R) has finite component group which may be
non-trivial even when G is connected in the sense of the Zariski topology,
such as G=GLn; see end of Borel's book on linear algebraic groups for a
proof. And orthogonal groups for non-degenerate real quadratic forms of
various signatures are very useful, but (in their incarnation as linear
algebraic groups over R) are even disconnected for the Zariski topology. So
there is good reason to be interested in real Lie groups with nontrivial
but finite component group (e.g., finite groups!) And in Hochschild's book
"Structure of Lie Groups" he proves that the theory of maximal compact
subgroups "works" in the case of finite component groups too: they're all
conjugate and meet every component.

This is all setup for what I really wanted to say, which is that there is
an awesome result, largely due to Chevalley, which beautifully "explains"
the essentially algebraic nature of the category of compact Lie groups
(without connectedness hypotheses). This concerns the functor G⇝G(R) from
linear algebraic groups over R to real Lie groups with finite component
group. To appreciate the result, we need some preliminary observations, as
follows. If G(R) is to be compact then of course G cannot contain as an
R-subgroup either Ga or Gm. In particular, G has to be reductive (maybe
disconnected) since R has characteristic 0. [Side remark: for reductive
groups over any field k whatsoever, if there is a Ga as a k-subgroup then
there must be a Gm as a k-subgroup; i.e., it is k-isotropic. See Corollary
C.2.9 in "Pseudo-reductive groups" for a generalization.] It is a general
fact (over any local field k at all, whether archimedean or not) that a
reductive k-group has compact group of k-points if and only if it contains
no Gm as a k-subgroup (i.e., is k-anisotropic). Also, if G is disconnected
then it can happen that some connected components of G have no R-point
(e.g., kernel of det3 on GLn for any n), but the union of those components
which do contain an R-point is an open R-subgroup which is "all" one could
hope to ever recover from G(R). So we may as well focus attention on those
G for which each connected component of G does have an R-point.

OK, so now we can state Chevalley's result. The preceding remarks show that formation of real points (as a Lie group) is a functor from the category of R
-anisotropic reductive R-groups to the category of compact real Lie groups. (Beware it is not obvious if G(R) is also connected for such a G that is connected.) Chevalley proved that this is an equivalence of categories. More specifically, given a compact real Lie group K, he showed how to use the representation theory of K to functorially construct a linear algebraic R-group Kalg whose Lie group of R-points is naturally isomorphic to K (so Kalg must be reductive and R-anisotropic, for reasons noted above). The construction shows also that every connected component of Kalg has an R-point, and clearly Kalg is connected if K is connected. That much is proved in the book by Brocker and tom Dieck. Using some input from the algebraic side (especially the fact that a semisimple Lie subalgebra of the Lie algebra of a linear algebraic group over a field k of characteristic 0 is the Lie algebra of a unique connected closed k-subgroup which moreover is semisimple, so over R these "exponentiate" to closed R-subgroups), one can show that it really inverts the functor of R-points on the full subcategory of R-anisotropic reductive R-groups whose connected components all have R-points.

To summarize, incorporating topological aspects:

Theorem (Chevalley) The category of compact Lie groups is equivalent to the
category of R-anisotropic reductive R-groups whose connected components
have R-points, and if G is such an R-group then G0(R)=G(R)0. The R-group G
is semisimple if and only if G(R) has finite center, and in such cases G0
is simply connected in the sense of algebraic groups if and only if G(R)0
is simply connected in the sense of topology.

Remark: The anisotropicity hypothesis is crucial. For example, if n>1 is
odd then SLn→PGLn is a degree-n isogeny of R-groups (so not an isomorphism)
which induces an isomorphism on R-points.

For any G as in the Theorem, one can show that G(C) contains G(R) as a
maximal compact subgroup, and that this is a "complexification" of G(R) in
the sense of being initial among complex Lie groups equipped with a
homomorphism from G(R). Using this and passing to the connected case, one
shows that every R-split connected reductive R-group admits a unique
"R-anisotropic form" (usually called "compact form"), and this
correspondence is also functorial if we keep track of a choice of suitable
maximal torus. But the algebraic theory provides an equivalence between the
category of pairs (G,T) consistng of split connected reductive groups G
equipped with a choice of split maximal torus T over any field, with
isogenies as morphisms, and the category of root data with (a suitable
notion of) "isogenies" as morphisms. This recovers exactly the
classification of compact connected Lie groups (equipped with a maximal
torus) in terms of root data as was mentioned in the other answers.

Of course, this is a much longer route to the punchline, and I am not
recommending it as a good way to learn the classification of compact Lie
groups in terms of root data (though it would not be circular to do so).
But there is something remarkable about the direct link between compact Lie
groups and algebraic groups (allowing disconnectedness as well, and no
specified maximal torus), not defined by going through the crutch of root
data and Lie algebras. Historically the case of compact groups was a very
important guide for Borel and Tits and others when developing the structure
theory for connected reductive groups, and the above result "explains" a
posteriori why this case was such an excellent guide to the general case.

Algèbres de Lie
===============

* https://mathoverflow.net/questions/6079/classification-of-compact-lie-groups/16269#16269

A semisimple Lie subalgebra of the Lie algebra of a linear algebraic group over a field k of characteristic 0 is the Lie algebra of a unique connected closed k-subgroup which moreover is semisimple.

* https://mathoverflow.net/questions/145284/algebraic-groups-in-characteristic-p

For semisimple (connected and simply connected) G, if the Lie algebras of two such groups are isomorphic over an algebraically closed field of prime characteristic, then the groups are isomorphic as algebraic groups

Caractéristique 0
-----------------

* https://www.jmilne.org/math/CourseNotes/LAG.pdf
II Algebraic groups, p. 105

- G -> Lie(G) from connected algebraic groups to Lie algebras is
  faithful,but it is far from being surjective on objects or morphism.
- for  a  connected algebraic group G and its Lie algebra g, the functor Rep(G)->Rep(g) is fully faithful (en carac 0), and so G can be recovered from g as the Tannaka dual of a tensor subcategory of Rep(g)

a) Si g semi-simple, Rep(g) vient de G, semisimple affine group and simply connected, with g=Lie(G). + one can identify the subcategories of Rep(g) corresponding to a quotient of G by a finite subgroup (ie the other semisimples G with Lie algebra g)
b) Si g est commutative, Rep(g) a une sous-catégorie tensorielle de
représentations semisimples, et une autre où les éléments de g agissent
comme des éléments nilpotents. En effet, g=Lie(Tore)=Lie(G_a^m).
Réaliser g comme Lie(G=Tore split) revient à choisir un réseau dans g,
Rep(G) = la sous-catégorie des reps. semisimples de g dont les caractères
sont entiers sur le réseau.
c) Si g est nilpotente, on peut regarder Rep^nil(g) où les éléments
agissent comme des nilpotents. Alors il existe un groupe affine unipotent G
tel que Rep(G)=Rep(g)^nil et Lie(G)=g.
d) On peut combiner a) et b): si (G,T) est un groupe réductif split,
l'action de T induit g=t + \oplus g^a, où g^a est un eigenspace indexé par
les roots de T (= les caractères nul tels que g^a non nul).
D'une racine a, on en déduit Rep(G)->Rep(g)->Rep(s_a)=~Rep(Sl_2) où s_a =~ sl_2
d'où un morphisme S_a=~Sl_2 -> G. Si on voit a comme une racine de S_a,
alors sa coracine a^\vee peut être vue comme un élément de X_*(T).
On obtient alors un système de root datum dans X*(T), et on conclut avec
le théorème du point fixe de Borel.
e) On peut combiner a) et c), si g est une algèbre de Lie et n son plus
grand idéal nilpotent, on peut considérer Rep^nil(g)=représentation telle
que les éléments de n soient nilpotents. Le théorème d'Ado montre qu'on a
de telles représentations fidèles. Si k alg clos, on obtient ainsi une
correspondance bijective entre les (classes d'iso) d'algèbres de Lie et de
groupe algébriques connexes avec un centre unipotent. [Mais cf plus bas,
attention que Rep(G(g)) est beaucoup plus petit que Rep^nil(g) en général]

- Cas réel semisimple
the Tannaka dual of a semisimple Lie algebra is the simply connected semisim-ple algebraic group with Lie algebra g hold for any field of car 0, so over R.

* General reductive groups (p. 150)

The reductive Lie algebras are exactly those that admit a faithful
semisimple representation (I, 6.4). Let g be a reductive Lie group, and let
r be its radical. Recall (I, 6.14) that a representation of g is semisimple
if and only if ρ(r) is semisimple. It follows from(I, 6.15) that the
category of semisimple representations Rep^ss(g) of g is a tannakian
subcategory of Rep(g). Choose a lattice Λ in r, and let Rep^0(g) denote the
subcategory of Rep^ss(g) consisting of the representations such that the
eigenvalues on r are integers. Then Rep^0(g)=Rep(G) with G a reductive
algebraic group that is “maximal” among those with Lie algebrag and
X_*(Z(G))=Λ; the remaining such algebraic groups with these correspond to
certain subcategories of Rep^0(g). The reductive algebraic groups that
arise in this way from reductive Lie algebras are those whose connected
centre is a split torus. In particular, the reductive algebraic groups that
arise from split reductive Lie algebras are exactly the split reductive
groups. By endowing Λ with an action of the absolute Galois group of k, we can
obtain all reductive algebraic groups over k.

$ 6    Algebraic groups with unipotent centre p. 151
a) the category of nilpotent Lie algebras over k is isomorphic to the category of unipotent algebraic groups over k (via G->Lie(G)); en particulier une algèbre de Lie nilpotente est algébrique.

b) si g est algébrique sur k=kbar de car 0, il existe un groupe connexe de
centre unipotent G=G(g) tel que g=Lie(G). Si g=~g', tout iso est la dérivée
d'un iso G(g)=~G(g'). Donc G(g) est unique à iso près, Aut(G)=Aut(g) et on
obtient ainsi une correspondance entre les algèbres de Lie algébriques et
les groupes connexes de centre unipotent.

c) Si n est une algèbre de Lie nilpotente, on a Rep^nil(n) la
sous-catégorie des reps où ρ(n) est composé d'endos nilpotent = Rep(U) pour
U groupe affine unipotent / Lie(U)=n.
We get an equiv-alence between the category of nilpotent Lie algebras and
the category of unipotent algebraic groups (on l'avait pas en a) ?? Cf Exo 6.7, c'est une preuve tannakienne de a).  Note that, for every representationr of a unipotent algebraic group, there exists a basis
for V such that ρ factors through Un; hence dρ factors through un, which shows
that dρ does lie in Rep^nil(n)

On the other hand, we can also consider the category of semisimple
representations of n.  This also is tannakian (I, 6.17), and the associated
affine group is pro-reductive but not algebraic. To get an algebraic group
with Lie algebran, it is necessary to choose a basis for n as a k-vector
space.

d) Rep^nil(g) où l'action du plus gros idéal nilpotent est donné par des
endos nilpotent. Alors on a un groupe affine G / Rep(G)=Rep^nil(g) mais il
peut être très gros.

e) Cependant si k alg clos, on peut regarder Rep(G(g)) où G(g) vient de b).
Alors Rep(G(g)) est plus petit que Rep^nil(g), 

* Unipotent algebraic groups and nilpotent Lie algebras

Over any field k of characteristic zero, the functor Lie is an equivalence from the category of unipotent algebraic groups over k to the category of nilpotent Lie algebras over k.

Caractéristique p
-----------------

* https://mathoverflow.net/questions/145284/algebraic-groups-in-characteristic-p?noredirect=1&lq=1

1) In the setting of (real or complex) Lie groups, it's always essential to focus on connected groups, since by definition the Lie algebra only depends on the identity component of the group. Moreover, the classical correspondence between Lie groups and their Lie algebras isn't quite bijective: semisimple groups with the same root system have isomorphic Lie algebras even though the groups may vary through an isogeny class from simply connected to adjoint type. Apart from such qualifications, the exponential and logarithm maps allow one to pass back and forth between the analytic and the algebraic theories pretty effectively.

2) In the 1950s Chevalley extended the work on linear algebraic groups begun by Kolchin and Borel, imitating the Lie algebra correspondence to some extent. Here the Lie algebra is geometrically the tangent space to the group at the identity, so again one wants to consider mainly the connected groups (equivalent to being irreducible in the Zariski topology). Over an algebraically closed field of characteristic 0, there is even a partial substitute for analytic methods in his use of formal exponential power series. But obviously this has its limits, and in prime characteristic it breaks down badly. Even in characteristic 0, the Jordan-Chevalley decomposition in the group allows one to distinguish the additive and multiplicative groups (as algebraic groups) but not their Lie algebras.

3) For the crucial study (including classification) of semisimple groups, Chevalley abandoned the Lie algebra but was still able to imitate almost exactly the Cartan-Killing classification by root data. Here again it's essential to focus on simply connected groups, since isogenous groups often have isomorphic Lie algebras (though in characteristic p that's not always true).

4) For semisimple (connected and simply connected) G, the question asked amounts to this: If the Lie algebras of two such groups are isomorphic over an algebraically closed field of prime characteristic, are the groups isomorphic as algebraic groups? To this the answer turns out to be YES, but it seems to require case-by-case study using the Chevalley classification. For some p, the Lie algebra of a simple G is not simple, which complicates matters. Probably the most thorough study was done by G.M.D. Hogeweij in his Utrecht thesis: see his papers in Indag. Math. 44 (1982).

5) The books by Chevalley, Demazure-Gabriel, and myself all contain various details about the characteristic 0 correspondence for algebraic groups and their Lie algebras, which concerns mainly centers, centralizers, etc. But examples show clearly how much breaks down in characteristic p . So one always has to be cautious.

If you focus on the "good" Lie groups, namely the connected semisimple ones, then the classification in the compact case or the complex-analytic case is achieved by means of the Lie algebra just up to isogeny (the precise ambiguity implicit in the "essentially" in your question), and the Lie algebras that arise are the semisimple ones over R with negative-definite Killing form in the compact case and the semisimple complex Lie algebras in the complex-analytic case. Both cases are classified by root systems, thanks to Cartan, Killing, et al.

But one can do so much better: the root datum, an integral refinement of the root system introduced by Demazure in SGA3 for algebraic-group purposes, classifies such analytic groups in both cases up to isomorphism (no isogeny ambiguity). And building on ideas of Chevalley, Borel, Tits, et al., this works algebraically over any field: the "split" connected semisimple linear algebraic groups over any field whatsoever (or even any commutative ring, with appropriate definitions) are classified up to isomorphism by root data which are "semisimple" (i.e., roots span the rationalization of the character lattice). This tells one much much more than can be achieved by formal groups (which cannot detect the underlying algebraicity, though are certainly useful tools, albeit more often in the commutative case where Lie theory and root systems are largely useless).

Structure
=========

* https://en.wikipedia.org/wiki/Algebraic_group
* http://math.stanford.edu/~conrad/mordellsem/
  - L11: Néron models
  - L12: semi-stable reduction for curves
  - L13: semi-stable reduction for abelian varieties

- Une K forme de G est un groupe H/k tel que G \iso H sur K.
  {K-formes de G} <=> H^1(Gal(K/k),Aut(G_K))

- Tores: une kbar-forme de G_m^d (=tore déployé)
  {tores/k}_iso <=> (catégorie) {Gal(kbar/k)-modules libres de rang fini}/iso^op
  via T->\chi(T) (=caractères sur kbar)

Décomposition des groupes algébriques
-------------------------------------

G groupe algébrique
- G° sa composante connexe est normale, G/G° est fini
- Chevalley: G connexe a G_1 affine distingué tel que G/G_1 = A var ab
- G affine connexe est linéaire, et a un plus grand sous-groupe distingué
  résoluble R(G). G/R(G) est semi-simple.
- G affine connexe résoluble a un plus grand sous-groupe unipotent
  distingué R(G)_u et G/R(G)_u est un tore

* SOME ASPECTS OF THE STRUCTURE AND REPRESENTATION THEORY OF ALGEBRAIC GROUPS
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
product of multiple copies of K×), and G_3 is unipotent, meaning it is
a closed subgroup of the group of unipotent matrices of some dimension
(matrices equal to the identity plus a nilpotent matrix, or equivalently
matrices that in some basis are upper triangles with ones along the
diagonal).

The decomposition is in some sense unique, and we can characterize various
types of groups (e.g. unipotent groups, tori, semisimple groups) as groups
such that their other components are trivial. Furthermore, the structure
greatly influences the representations. For example, a finite-dimensional
representations of a semisimple algebraic group decomposes uniquely as a
direct sum of irreducible representations, and all representations of
unipotent groups consist entirely of unipotent transformations.

Theorem 2.9 (Jordan-Chevalley Decomposition). Let G be a (linear) algebraic group. Then for any g ∈ G, there exists g_s, g_u ∈ G such that g=g_s g_u = g_u g_s , ρ(g_s) is semsimple, and ρ(g_u) is unipotent (\rho représentation fidèle).
Furthermore, these are preserved under morphisms G→G'.
(et donc pour toute représentation g_s est semi-simple et g_u unipotent)

Chevalley's structure theorem
-----------------------------

Chevalley's structure theorem: k corps parfait, G/k groupe lisse connecté
\Exists! H affine normal tel que G/H soit propre, ie une variété abélienne A:
1->H->G->A->0.
A et H sont fonctoriels en G. (On note aussi H=G^aff).

H étant affine, il est linéaire.

Rappel: si G n'est pas connexe, la composante connexe G0 est normale et
G/G0 est fini (car G de type fini).

Groupes linéaires commutatifs
-----------------------------

Th: (Structure of commutative linear algebraic groups)
Let k be a perfect field and G a smooth connected affine commutative
k-group.  There exists a decomposition G = T × U of G as a product of
smooth closed k-subgroups, where U is unipotent and T is a torus.
T et U sont fonctoriels en G, et commute avec une extension du corps de
base.
[cf L11, Th. 5.2.6, L13 Prop 2.16]

Tore: si T tore de rang r, X(T_ks):=Hom_ks(T_ks, G_m)=Z^r, et T->X(T_ks) est
une anti-équivalence de catégorie entre les k-tores et les Gal(k)-réseaux.

Solvable
--------

* https://en.wikipedia.org/wiki/Lie%E2%80%93Kolchin_theorem

Every irreducible finite-dimensional representation of a connected and
solvable linear algebraic group G/kbar has dimension one.

Sometimes the theorem is also referred to as the Lie–Kolchin
triangularization theorem because by induction it implies that with respect
to a suitable basis of V the image ρ(G) has a triangular shape; in other
words, the image group ρ(G) is conjugate in GL(n,K) (where n = dim V) to a
subgroup of the group T of upper triangular matrices, the standard Borel
subgroup of GL(n,K): the image is simultaneously triangularizable.

The theorem applies in particular to a Borel subgroup of a semisimple
linear algebraic group G.

* https://en.wikipedia.org/wiki/Borel_fixed-point_theorem

- If G is a connected, solvable, linear algebraic group acting regularly on a non-empty, complete algebraic variety V over an algebraically closed field k, then there is a G fixed-point of V
- If G is a connected, k-split solvable algebraic group acting regularly on a complete variety V having a k-rational point, then there is a G fixed-point of V

Borel
-----
* https://en.wikipedia.org/wiki/Borel_subgroup
= a maximal Zariski closed and connected solvable algebraic subgroup.

=> For groups realized over algebraically closed fields, there is a single conjugacy class of Borel subgroups.

Exemple: dans Gl_n, the subgroup of invertible upper triangular matrices is a Borel subgroup.

* Parabolic.
Subgroups between a Borel subgroup B and the ambient group G are called parabolic subgroups. Parabolic subgroups P are also characterized, among algebraic subgroups, by the condition that G/P is a complete variety. Working over algebraically closed fields, the Borel subgroups turn out to be the minimal parabolic subgroups in this sense. Thus B is a Borel subgroup when the homogeneous space G/B is a complete variety which is "as large as possible".

Plus généralement, sur k non alg clos:
For a closed subgroup scheme H of G, the quotient space G/H is a smooth quasi-projective scheme over k. Parabolique = G/H est propre = G/H projectif.
Sur kbar, Parabolique = Contient un Borel.

* https://en.wikipedia.org/wiki/Linear_algebraic_group#Borel_subgroups
Sur k, Borel = B tel que B_kbar est un Borel de G_kbar.
G peut ne pas avoir de k-Borel, s'il en a on dit qu'il est quasi-split.

Maximal torus
-------------

* https://en.wikipedia.org/wiki/Maximal_torus

Let G be a compact, connected Lie group and let g be the Lie algebra of G. The first main result is the torus theorem, which may be formulated as follows:[2]
    Torus theorem: If T is one fixed maximal torus in G, then every element of G is conjugate to an element of T.
  - All maximal tori in G are conjugate.[3]
  - All maximal tori have the same dimension, known as the rank of G.
  - A maximal torus in G is a maximal abelian subgroup, but the converse need not hold.[4]
  - The maximal tori in G are exactly the Lie subgroups corresponding to the maximal abelian subalgebras of g (cf. Cartan subalgebra)
  - Every element of G lies in some maximal torus; thus, the exponential map for G is surjective.
  - If G has dimension n and rank r then n − r is even.

Weyl group: W(T, G) := N_G(T) / C_G(T).

* https://en.wikipedia.org/wiki/Linear_algebraic_group#Tori
Every point of a torus over a field k is semisimple. Conversely, if G is a connected linear algebraic group such that every element of G(k¯) is semisimple, then G is a torus.[10] 

For a linear algebraic group G over a general field k, one cannot expect all maximal tori in G over k to be conjugate by elements of G(k). For example, both the multiplicative group Gm and the circle group T above occur as maximal tori in SL(2) over R. However, it is always true that any two maximal split tori in G over k (meaning split tori in G that are not contained in a bigger split torus) are conjugate by some element of G(k).[11] As a result, it makes sense to define the k-rank or split rank of a group G over k as the dimension of any maximal split torus in G over k.

For any maximal torus T in a linear algebraic group G over a field k, Grothendieck showed that T_k¯ is a maximal torus in G_k¯. It follows that any two maximal tori in G over a field k have the same dimension, although they need not be isomorphic.

Unipotent
---------

Groupe unipotent: U unipotent si la décomposition en séries de U_kbar a des
quotients isomorphes à G_a <=> U(kbar) \subset Gl_n matrices unipotentes

* https://en.wikipedia.org/wiki/Unipotent
- x unipotent <=> la translation r_x est localement unipotente vue comme
endomorphisme de k[G]

- An affine algebraic group is called unipotent if all its elements are unipotent. Any unipotent algebraic group is isomorphic to a closed subgroup of the group of upper triangular matrices with diagonal entries 1, and conversely any such subgroup is unipotent.

- Over the real numbers (or more generally any field of characteristic 0) the exponential map takes any nilpotent square matrix to a unipotent matrix. Moreover, if U is a commutative unipotent group, the exponential map induces an isomorphism from the Lie algebra of U to U itself.

- If a unipotent group acts on an affine variety, all its orbits are closed, and if it acts linearly on a finite-dimensional vector space then it has a non-zero fixed vector. In fact, the latter property characterizes unipotent groups.

- Any element g of a linear algebraic group over a perfect field can be
written uniquely as the product g = gu gs of commuting unipotent and
semisimple elements gu and gs.
- Jordan decomposition for groups: any commutative linear algebraic group over a perfect field is the product of a unipotent group and a semisimple group.

* Unipotent radical:
  The unipotent radical of an algebraic group G is the set of unipotent elements in the radical of G. It is a connected unipotent normal subgroup of G, and contains all other such subgroups. A group is called reductive if its unipotent radical is trivial. If G is reductive then its radical is a torus.

* https://en.wikipedia.org/wiki/Jordan%E2%80%93Chevalley_decomposition

k corps parfait, x endomorphisme d'un espace vectoriel de dim fini
    x = x_ss + x_nilpo, x_ss et x_n commutent et sont des pols en x.
    x = x_ss x x_unipo si x inversible, x_ss et x_u pols en x.

Split
-----

* https://en.wikipedia.org/wiki/Quasi-split_group

In mathematics, a quasi-split group over a field is a reductive group with a Borel subgroup defined over the field. Simply connected quasi-split groups over a field correspond to actions of the absolute Galois group on a Dynkin diagram.

All split groups (those with a split maximal torus) are quasi-split. These correspond to quasi-split groups where the action of the Galois group on the Dynkin diagram is trivial.

Groupe réductif
===============

Radical=maximal normal connexe résoluble sous-groupe
Radical=0 <=> semi simple.

Radical unipotent: maximal normal connexe unipotent = les éléments unipotents du radical.
Radical unipotent=0 <=> reductif.

Si G/k, on dit qu'il est semi-simple/réductif si G_kbar l'est, mais si k
est parfait les définitions plus haut marchent encore.

Radical et radical unipotent
----------------------------

* https://en.wikipedia.org/wiki/Radical_of_an_algebraic_group

Radical of an algebraic group is the identity component of its maximal normal solvable subgroup.

An algebraic group is called semisimple if its radical is trivial, i.e., consists of the identity element only. The group SL_n(K) is semi simple.

The subgroup of unipotent elements in the radical is called the unipotent radical, it serves to define reductive groups.

* https://en.wikipedia.org/wiki/Unipotent#Unipotent_radical

The unipotent radical of an algebraic group G is the set of unipotent elements in the radical of G. It is a connected unipotent normal subgroup of G, and contains all other such subgroups. A group is called reductive if its unipotent radical is trivial. If G is reductive then its radical is a torus.

Définitions
-----------

* https://en.wikipedia.org/wiki/Reductive_group

A connected linear algebraic group G over a perfect field is reductive if it has a representation with finite kernel which is a direct sum of irreducible representations.

* Cas k alg clos
- A connected linear algebraic group G over an algebraically closed field
  is called semisimple if every smooth connected solvable normal subgroup
  of G is trivial. 
- More generally, a connected linear algebraic group G over an
  algebraically closed field is called reductive if every smooth connected
  unipotent normal subgroup of G is trivial
- A linear algebraic group G over a field k is called simple (or k-simple)
  if it is semisimple, nontrivial, and every smooth connected normal
  subgroup of G over k is trivial or equal to G
  Note: a simple algebraic group may have nontrivial center (although the
  center must be finite)

* Décomposition
A central isogeny of reductive groups is a surjective homomorphism with
kernel a finite central subgroup scheme. Every reductive group over a field
admits a central isogeny from the product of a torus and some simple
groups.

Note: si G semi-simple, on a une isogénie centrale vers un produit de
groupes simples.

* Cas k quelconque
On dit que G/k est réductif/semi-simple si G_kbar l'est.
Exemple: un tore est réductif.

* Cas k parfait:
a linear algebraic group G over k is reductive if and only if every smooth connected unipotent normal k-subgroup of G is trivial (ie le radical unipotent est nul).

Et la même définition que pour k alg clos marche pour G semi simple, ie le
radical est nul. C'est parce que le radical commute au changement de base
étale (en tout cas c'est vrai pour une extension de corps séparable).

* Cas caractéristique 0
For a reductive group G over a field of characteristic zero, all
representations of G (as an algebraic group) are completely reducible, that
is, they are direct sums of irreducible representations.

Caractéristique 0
-----------------

* https://www.jmilne.org/math/CourseNotes/LAG.pdf

* Cas semi simple
PROPOSITION 4.1 A connected  algebraic  group G is  semisimple  if  and  only  if  its  Lie algebra is semisimple.

4.2  The similar statement is false with “reductive” for “semisimple”.  For example, both Gm and Ga have Lie algebra k,  which is reductive,  but only Gm is reductive.   The Lie algebra of a reductive group G is reductive (because G=ZG.DG), and every reductive Lie  algebra  is  the  Lie  algebra  of  a  reductive  algebraic  group,  but  the  Lie  algebra  of  an algebraic group can be reductive without the group being reductive.
4.3  In car p: The Lie algebra of a semisimple (even simple) algebraic group need not be semisimple. For example, in characteristic 2, SL2 is simple but its Lie algebra sl2 is not semisimple

Corollaire 4.4: Lie (R(G)) =  R(Lie(G))

Déf: G almost simple = non commutative and has no proper normal subgroups
except for finite ones.
     G almost direct product de ses sous-groupes G_i: G_1 x ... x G_n->G est surjectif de noyau fini (=> les G_i commutent entre eux et sont distingués dans G)

Th 4.5: G semi-simple => G almost product G_1x...G_r de ses sous-groupes
alg normaux connexes minimaux. Si H sous-groupe alg connexe normal de G, H
est le produit des G_i qu'il contient, et est centralisé par les autres
G_j.
Cor: G alg semi simple <=> almost product of almost simple alg groups
     G semi simple => n'a pas de quotient commutatifs non triviaux

Cor 4.15: critère pour une algèbre de Lie d'être algébrique: c'est le cas
ssi g = g_R(V) pour une algèbre de représentation de g. Si g est
semisimple, g est algébrique.

Prop 4.20: G -> Lie(G) a un adjoint à gauche g->G(g) (G(g) groupe affine
algébrique) donné par Tannaka: Hom(g, Lie(H))=Hom(G(g), H)

Th 4.22: si g semisimple,
- g=Lie(G(g))
- G(g) is semisimple
- si g =~ Lie(H), alors le morphisme G(g)->H correspondant est une isogénie
  G(g) -> H°. (ie G est simplement connexe)
- Z(G(g)) est donné par X*(Z)=P/Q où P=weight lattices de g et Q=root lattices

Split semisimple algebraic groups

Th 4.26: si (g, h) est une algèbre de Lie semi-simple split, on peut
construire de manière canonique T(h) un tore maximal split dans G(g).

Lemme 4.27: si G semisimple, T tore, (<=>)
- T maximal
- T_kbar maximal dans G_kbar
- T=C_G(T)°
- t is a cartan subalgebra of g
[https://en.wikipedia.org/wiki/Cartan_subalgebra]

Th 4.29: les tores T split maximaux sont conjugués dans G(k)

On peut donc en déduire la classification des groupes alg semisimples
split à partir de celle des algèbres de Lie, cf p.144.
$5 Reductive group p.146: lire la classification des groupes réductifs
juste à partir du Th 4.22.

Split et quasi-split
--------------------

Rappel:
- split group = split maximal torus over k (ie the maximal torus is G_m^n)
- quasi-split group over a field is a reductive group with a Borel subgroup defined over the field.

- Split => Quasi-split:
  https://math.stackexchange.com/questions/3046718/why-is-split-algebraic-group-quasi-split

Theorem(Borel, Borel-Tits???): Let G be a reductive group over a field k. Then, G is quasi-split if and only if for any maximal split torus S in G one has that C_G(S) is a maximal torus in G.

Structure d'un groupe réductif
------------------------------

* https://en.wikipedia.org/wiki/Linear_algebraic_group#Semisimple_and_reductive_groups

A connected linear algebraic group G over an algebraically closed field is
called semisimple if every smooth connected solvable normal subgroup of G
is trivial. More generally, a connected linear algebraic group G over an
algebraically closed field is called reductive if every smooth connected
unipotent normal subgroup of G is trivial.[19] (Some authors do not require
reductive groups to be connected.) A semisimple group is reductive.

A group G over an arbitrary field k is called semisimple or reductive if G
k¯ is semisimple or reductive. For example, the group SL(n) of n × n
matrices with determinant 1 over any field k is semisimple, whereas a
nontrivial torus is reductive but not semisimple. Likewise, GL(n) is
reductive but not semisimple (because its center Gm is a nontrivial smooth
connected solvable normal subgroup).

Every connected linear algebraic group G over a perfect field k is (in a unique way) an extension of a reductive group R by a smooth connected unipotent group U, called the unipotent radical of G:
    1 → U → G → R → 1.

If k has characteristic zero, then one has the more precise Levi decomposition: every connected linear algebraic group G over k is a semidirect product R ⋉ U.

Every reductive group over a field is the quotient by a finite central subgroup scheme of the product of a torus and some simple groups. For example,
    GL(n)≅(Gm×SL(n))/μn.
For an arbitrary field k, a reductive group G is called split if it contains a split maximal torus over k (that is, a split torus in G which remains maximal over an algebraic closure of k). For example, GL(n) is a split reductive group over any field k.

* https://en.wikipedia.org/wiki/Linear_algebraic_group#Representation_theory
Representation theory:
dans la decomposition
    1 → U → G → R → 1.
every irreducible representation of G factors through R.

En particulier U n'a que des représentations triviales.

[Note: pour une algèbre de Lie, les représentations se factorisent à
travers le radical nilpotent, mais il faut faire attention qu'il peut être
plus petit que le plus grand idéal nilpotent. Par exemple l'algèbre de Lie
commutative est nilpotente mais son radical nilpotent est nul, donc elle
est réductive. IL faut penser que ça peut être l'algèbre de Lie d'un tore
(qui est réductif), ou de G_a^m (qui est unipotent dans Gl)]

Chevalley showed that the irreducible representations of a split reductive group over a field k are finite-dimensional, and they are indexed by dominant weights.[25] This is the same as what happens in the representation theory of compact connected Lie groups, or the finite-dimensional representation theory of complex semisimple Lie algebras. For k of characteristic zero, all these theories are essentially equivalent. In particular, every representation of a reductive group G over a field of characteristic zero is a direct sum of irreducible representations, and if G is split, the characters of the irreducible representations are given by the Weyl character formula. The Borel–Weil theorem gives a geometric construction of the irreducible representations of a reductive group G in characteristic zero, as spaces of sections of line bundles over the flag manifold G/B.

The representation theory of reductive groups (other than tori) over a field of positive characteristic p is less well understood. In this situation, a representation need not be a direct sum of irreducible representations.

* Actions
Part of the theory of group actions is geometric invariant theory, which aims to construct a quotient variety X/G, describing the set of orbits of a linear algebraic group G on X as an algebraic variety. Various complications arise. For example, if X is an affine variety, then one can try to construct X/G as Spec of the ring of invariants O(X)^G. However, Masayoshi Nagata showed that the ring of invariants need not be finitely generated as a k-algebra (and so Spec of the ring is a scheme but not a variety), a negative answer to Hilbert's 14th problem. In the positive direction, the ring of invariants is finitely generated if G is reductive, by Haboush's theorem, proved in characteristic zero by Hilbert and Nagata.

Geometric invariant theory involves further subtleties when a reductive group G acts on a projective variety X. In particular, the theory defines open subsets of "stable" and "semistable" points in X, with the quotient morphism only defined on the set of semistable points.

Torseurs
--------

* https://en.wikipedia.org/wiki/Reductive_group#Torsors_and_the_Hasse_principle

A torsor for an affine group scheme G over a field k means an affine scheme
X over k with an action of G such that X_kbar is isomorphic to G_kbar. A
torsor can also be viewed as a principal G-bundle over k with respect to
the fppf topology on k, or the étale topology if G is smooth over k. The
pointed set of isomorphism classes of G-torsors over k is called H1(k,G),
in the language of Galois cohomology.

Torsors arise whenever one seeks to classify forms of a given algebraic
object Y over a field k, meaning objects X over k which become isomorphic
to Y over the algebraic closure of k. Namely, such forms (up to
isomorphism) are in one-to-one correspondence with the set H1(k,Aut(Y)).
For example, (nondegenerate) quadratic forms of dimension n over k are
classified by H1(k,O(n)), and central simple algebras of degree n over k
are classified by H1(k,PGL(n)). Also, k-forms of a given algebraic group G
(sometimes called "twists" of G) are classified by H1(k,Aut(G)). These
problems motivate the systematic study of G-torsors, especially for
reductive groups G.

Th: for a connected linear algebraic group G over a perfect field of cohomological dimension at most 1, H^1(k,G) = 1
Exemple: k corps fini => every reductive group over a finite field is quasi-split.

Conjecture: c'est vrai aussi en dimension cohomologique = 2 pour un groupe
G simply-connected semi-simple. Prouvé pour a totally imaginary number
field.

- Principe local-global (k corps de nombre):
for a simply connected semisimple group G over k,
H^1(k,G) =~ \prod _{v} H^1(k_v,G) 
[si G adjoint plutôt que simply connected, l'application est une injection.
 For G = PGL(n), this amounts to the Albert–Brauer–Hasse–Noether theorem, saying that a central simple algebra over a number field is determined by its local invariants.]
Moreover, the pointed set H1(kv,G) is trivial for every nonarchimidean
local field kv, and so only the real places of k matter.

* https://en.wikipedia.org/wiki/Lang%27s_theorem
In algebraic geometry, Lang's theorem, introduced by Serge Lang, states: if G is a connected smooth algebraic group over a finite field F_q, then, writing σ : G → G , x ↦ x^q for the Frobenius, the morphism of varieties
    G → G , x ↦ x^{−1} σ(x)
is surjective. Note that the kernel of this map is precisely G(F_q)

The theorem implies that H^1(F_q, G)=H_ét^1(Spec F⁡_, G) vanishes and,
consequently, any G-bundle on Spec F_q is isomorphic to the trivial one.
Also, the theorem plays a basic role in the theory of finite groups of Lie
type.

It is not necessary that G is affine. Thus, the theorem also applies to abelian varieties (e.g., elliptic curves.) In fact, this application was Lang's initial motivation.

Actions
=======

* https://www-fourier.ujf-grenoble.fr/~mbrion/lin_rev.pdf
  Linearization of algebraic group actions, Michel Brion

Theorem. Let X be a normal variety equipped with an action of a connected linear algebraic group G.  Then each point of X admits an open G-stable neighborhood, equivariantly isomorphic to a G-stable subvariety of some projective space on which G acts linearly.
(et donc si X n'a pas de courbes rationnelle, l'action de G est triviale)
