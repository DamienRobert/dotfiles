vim: ft=markdownlight fdm=expr

* http://en.wikipedia.org/wiki/Lie_group

Lie theorems
============

Groupe de Lie réel (ou complexe) simplement connexe <=> algèbre de Lie de dim finie:

The equivalence between the category of simply connected real Lie groups and finite-dimensional real Lie algebras is called usually (in the literature of the second half of 20th century) Cartan's or Cartan-Lie theorem.

* https://en.wikipedia.org/wiki/Lie_group%E2%80%93Lie_algebra_correspondence
- Lie's third theorem: Every finite-dimensional real Lie algebra is the Lie algebra of some simply connected Lie group.[8]
- The homomorphisms theorem: If ϕ:Lie(G) → Lie(H) is a Lie algebra homomorphism and if G is simply connected, then there exists a (unique) Lie group homomorphism f : G → H such that ϕ = df.
- The subgroups–subalgebras theorem: If G is a Lie group and h is a Lie subalgebra of Lie(G), then there is a unique connected Lie subgroup (not necessarily closed) H of G with Lie algebra h.

* Autres corps de ca r0: https://math.stackexchange.com/questions/2152095/complex-lie-algebra-implies-complex-lie-group

Every finite-dim Lie algebra is Lie algebra of a Lie group over the given field, unique up to local isomorphism. (Actually, in the non-Archimedean setting, two Lie groups are locally isomorphic iff they have isomorphic compact open subgroups)

Corollaire: For every complex finite dimensional Lie algebra g exist one and only one connected and simply connected complex Lie group G such as g=Lie(G).

* Preuve du théorème 3: https://mathoverflow.net/questions/7523/is-every-finite-dimensional-lie-algebra-the-lie-algebra-of-a-closed-linear-lie-g?rq=1

Par le théorème d'Ado, g algèbre de Lie est une sous-algèbre de matrice (en
carac 0). Si k=R ou C, on peut prendre l'exponentielle pour avoir G \subset
Gl(V) qui a pour algèbre de Lie g. En travaillant un peu plus on peut même
construire G fermé dans un GL(V) tel que Lie G = g.

* https://mathoverflow.net/questions/6079/classification-of-compact-lie-groups/16269#16269
First, here's a rough outline of how the classification works:
  - Prove that if G and H are simply connected and have the same Lie algebra, then G and H are isomorphic as Lie groups.
  - Prove that if G is any Lie group, its universal cover G~ inherits a natural Lie group structure for which G = G~/Z where Z⊆Z(G~).

Groupes de Lie réels et complexes
=================================

Cas complexe
------------

* https://en.wikipedia.org/wiki/Complex_Lie_group
- A complex semisimple Lie group is an algebraic group.
  => il est linéaire

Plus de détails: https://mathoverflow.net/questions/107577/are-certain-simple-lie-groups-linear-algebraic-groups
Root data are in fact defined over Z: a complex semisimple group has not
only an underlying algebraic, but even an arithmetic structure). For a
more direct explanation, see Theorem 6.3 in the book "Lie Groups and Lie
Algebras III" by Onischik-Vinberg: any connected complex Lie group
satisfying G=[G,G] and admitting a faithful linear representation (which
for semisimple groups is automatic), has a unique underlying complex
algebraic structure.
For real Lie groups this is not quite true, as noted above.

- Un groupe de Lie compact connexe complexe est un tore.
[Preuve: on montre qu'il est abélien (ça utilise qu'une fonction
holomorphe sur un compact est constante) et on regarde son revêtement
universel π:V->X qui est abélien, donc un espace vectoriel, et Ker π=Λ
car X compact.]

Cas réel
--------

* si G abélien, 1 → π_1(G) → G~ → G → 1.
  et aussi par exp: g / Γ =~ G (l'image de g par exp étant surjective
  dans le cas abélien)

* Cas compact
- Un groupe de Lie compact réel est linéaire, de plus il est égal à
l'exponentiel de son algèbre de Lie.
Cf https://mathoverflow.net/questions/64195/when-is-a-finite-dimensional-real-or-complex-lie-group-not-a-matrix-group?rq=1

- https://en.wikipedia.org/wiki/Lie_group%E2%80%93Lie_algebra_correspondence
  Let G be a connected Lie group with finite center. Then the following are equivalent.
  - G is compact.
  - (Weyl) The simply connected covering G~ of G is compact.
  - The adjoint group Int  g is compact.
  - There exists an embedding G ↪ O(n,R) as a closed subgroup.
  - The Killing form on g is negative definite.
  - For each X in g, ad(X) is diagonalizable and has zero or purely imaginary eigenvalues.
  - There exists an invariant inner product on g.

- https://en.wikipedia.org/wiki/Compact_group#Compact_Lie_groups
  Theorem: Every connected compact Lie group is the quotient by a finite central subgroup of a product of simply connected compact Lie groups and a torus.

  The classification of compact, simply connected Lie groups is the same as the classification of complex semisimple Lie algebras. Indeed, if K is a simply connected compact Lie group, then the complexification of the Lie algebra of K is semisimple. Conversely, every complex semisimple Lie algebra has a compact real form isomorphic to the Lie algebra of a compact, simply connected Lie group.

  Every compact, connected, simply-connected Lie group K is a product of compact, connected, simply-connected simple Lie groups Ki each of which is isomorphic to exactly one of the following:
  - The compact symplectic group Sp(n), n ≥ 1
  - The special unitary group SU(n), n ≥ 3
  - The spin group Spin(n), n ≥ 7
    or one of the five exceptional groups G2, F4, E6, E7, and E8.

  => Si K compact il est semi simple, donc s'il est simplement connexe il est produit de groupes simples compacts (s'il n'est pas simplement connexe, est-ce qu'il est produit de groupes simples à isogénie près? Comme il y a le tore qui peut se rajouter ce n'est pas clair, mais en fait K est algébrique semi-simple, cf [GroupesAlg] donc c'est bien le cas.).

- https://mathoverflow.net/questions/6079/classification-of-compact-lie-groups/16269#16269
  Theorem (Chevalley) The category of compact Lie groups is equivalent to the category of R-anisotropic reductive R-groups whose connected components have R-points, and if G is such an R-group then G^0(R)=G(R)^0. The R-group G is semisimple if and only if G(R) has finite center, and in such cases G^0 is simply connected in the sense of algebraic groups if and only if G(R)^0 is simply connected in the sense of topology.
Voir aussi https://www.jmilne.org/math/CourseNotes/LAG.pdf p. 161: Compact topological groups

Classification des algèbres et groupes de Lie
=============================================

Root system
-----------

* https://en.wikipedia.org/wiki/Root_system

Let E be a finite-dimensional Euclidean vector space, with the standard Euclidean inner product denoted by ( ⋅ , ⋅ ). A root system Φ in E is a finite set of non-zero vectors (called roots) that satisfy the following conditions:[2][3]
  - The roots span E.
  - The only scalar multiples of a root α ∈ Φ are α itself and −α
  - For every root α ∈ Φ, the set Φ  is closed under reflection through the hyperplane perpendicular to α.
  - (Integrality) If α and β are roots in Φ, then the projection of β onto the line through α is an integer or half-integer multiple of α.
An equivalent way of writing conditions 3 and 4 is as follows:
    For any two roots α , β ∈ Φ the set Φ contains the element σ_α(β):=β−2(α,β)/(α,α)α.
    For any two roots α , β ∈ Φ, the number ⟨β,α⟩ := 2(α,β)/(α,α) is an integer.

The group of isometries of E generated by reflections through hyperplanes associated to the roots of Φ is called the Weyl group of Φ

If g is a complex semisimple Lie algebra and h is a Cartan subalgebra [=maximal commutative subalgebra of g and if ad_H is diagonalizable for each H ∈ h), we can construct a root system as follows. We say that α∈h∗ is a root of g relative to h if α ≠ 0 and there exists some X ≠ 0 ∈ g such that
    [H , X] = α(H)X for all H ∈ h

* https://www.jmilne.org/math/CourseNotes/LAG.pdf p. 66
Définit un root system dans un espace vectoriel, et montre qu'on a toujours
l'Existence of an inner product:
- R fini dans V F-ev (et ne contient pas 0)
- pour tout α dans R, on a une réflection s_α qui stabilise R
- pour tout α, β dans R, s_α(β)-β est un multiple entier de α
Autrement dit s_α est donné par s_α(x)=x-<x, α^v>α, avec <α, α^v>=2 et <R,
α^v> \in Z.
On peut regarder le lattice engendré par R, les poids sont donnés par
le lattice dual de R^v: P={x \in V, <x, α^v> \in Z pour tout α \in R}

Cartan subalgebra=nilpotent subalgebra equal to its own normaliser
Existent toujours, toute algèbre de Lie est somme de ses algèbres de
Cartan, et si ad_g(a) est semisimple on a une algèbre de Cartan qui
contient a. Elles sont toutes conjuguées (sur kbar). Les algèbres de Cartan
split d'une algèbre semisimple g sont conjuguées sur k.

Si g semi simple, une algèbre de Cartan h est commutative, tous les
éléments de h sont semisimples, h est égale à son centralisateur

On a un root système associé à une algèbre de Cartan split, 
g = h + \sum_{α \in R} g^α, α caractère sur h, g^α={x \in g, ad(h)(x)=α(h)x}

Classification des algèbres de Lie semi-simples
-----------------------------------------------

* http://www.madore.org/~david/weblog/d.2015-04-24.2292.liegroups.html#d.2015-04-24.2292.briques-elementaires

- Une algèbre de Lie quelconque	est extension (quelconque)	de toutes les briques (=algèbres de Lie simples et abélienne de dimension 1).
- Une algèbre de Lie semisimple	est extension, automatiquement produit,	d'algèbres de Lie simples.
- Une algèbre de Lie abélienne	est produit	de [copies de] l'algèbre de Lie abélienne de dimension 1.
- Une algèbre de Lie réductive	est produit	de toutes les briques (=algèbres de Lie simples et abélienne de dimension 1).
- Une algèbre de Lie résoluble	est extension (quelconque)	de [copies de] l'algèbre de Lie abélienne de dimension 1.

* Classification des algèbres de Lie complexes:
A_n, B_n, C_n, D_n, E_6, E_7, E_8, F_4, G_2.
= classification des groupes de Lie complexe
Sl(n+1, C); Spin(2r+1, C)/SO(2r+1,C); Sp(r, C); Spin(2r, C)/SO(2r, C)

* Cas réel
=> on regarde les formes réelles des algèbres de Lie ou groupes de Lie
complexe
Attention: il y a des groupes de Lie réels qui n'ont pas de complexifié,
donc ça marche seulement à isogénie près.

Les deux formes qui existent toujours sont la forme compacte et la forme
déployée.
Par exemple, le groupe spécial linéaire complexe SL(n,ℂ) a pour forme compacte le groupe spécial unitaire SU(n) (ça ne saute pas aux yeux que si on complexifie son algèbre de Lie on obtient celle de SL(n,ℂ)), tandis que sa forme déployée est SL(n,ℝ)

Groupes de Lie complexes et espaces reimannien symétriques
----------------------------------------------------------

* les groupes de Lie simples complexes eux-mêmes, qui peuvent être considérés comme des groupes de Lie simples réels si on oublie leur structure complexe
=> Résultat:
  - SL(r+1,ℂ) ou l'une de ses formes réelles, à savoir le groupe spécial linéaire réel SL(r+1,ℝ), le groupe spécial linéaire quaternionique SL(½(r+1),ℍ) (si r est impair) ou le groupe spécial unitaire de signature quelconque SU(s,r+1−s) pour 0 ≤ s ≤ ½(r+1) [lorsque s=0, la forme compacte SU(0,r+1) s'écrit simplement SU(r+1)],
  - Spin(2r+1,ℂ) ou l'une de ses formes réelles, à savoir le groupe spin de signature quelconque Spin(s,2r+1−s) pour 0 ≤ s ≤ r [lorsque s=0, la forme compacte Spin(0,2r+1) s'écrit simplement Spin(2r+1)],
  - Sp(r,ℂ) ou l'une de ses formes réelles, à savoir le groupe symplectique (déployé) réel Sp(r,ℝ) ou le groupe unitaire quaternionique (=symplectique) de signature quelconque Sp(s,r−s) pour 0 ≤ s ≤ ½r [lorsque s=0, la forme compacte Sp(0,r) s'écrit simplement Sp(r)],
  - Spin(2r,ℂ) ou l'une de ses formes réelles, à savoir le groupe spin de signature quelconque Spin(s,2r−s) pour 0 ≤ s ≤ r [lorsque s=0, la forme compacte Spin(0,2r) s'écrit simplement Spin(2r)], ou le groupe qui-n'a-pas-de-nom-standard, Spin*(2r).

* Espaces Riemannien symétriques:
Un espace riemannien symétrique, c'est un « espace » (variété riemannienne
connexe) dans lequel on peut faire une symétrie par rapport à n'importe
quel point. (Ceci implique donc un grand niveau de symétrie, justement :
pour commencer, l'espace est « homogène » au sens intuitif où « tous les
points se valent » — n'importe quel point peut être amené en n'importe quel
autre point par une isométrie. Il n'est pas vrai que l'espace soit
forcément « homogène et isotrope » — j'ai parlé des ces choses-là dans mon
entrée sur les octonions — "homogène et isotrope" signifiant intuitivement
que « tous les points et toutes les directions se valent » et signifie
techniquement que n'importe quel couple de points peut être amené en
n'importe quel autre à la même distance par une isométrie ; mais il y a une
condition du même genre de cette dernière qui vaut pour les espaces
riemanniens symétriques en remplaçant la "distance" par une sorte de
généralisation prenant la forme de r nombres réels où r est le « rang » de
l'espace symétrique ; et les espaces homogènes et isotropes sont exactement
— même si ce n'est pas du tout évident — les espaces riemanniens
symétriques de rang 1 et les espaces euclidiens.)

Comme les groupes de Lie, les espaces riemanniens symétriques s'analysent
au moyen d'objets « simples », qui ici s'appellent plutôt irréductibles,
mais cette fois-ci la décomposition est plus simple puisqu'il s'agit
simplement d'un produit. Et si on met de côté les espaces euclidiens, les
espaces riemanniens symétriques simples/irréductibles sont classifiés
exactement comme les groupes de Lie simples réels qui ne sont pas compacts.
Plus précisément, à chaque classe d'isogénie de groupes de Lie simples
réels non compacts G (i.e., à chaque algèbre de Lie simple réelle non
compacte 𝔤) est associé un espace riemannien symétrique dit "de type
non-compact" (il serait plus parlant de dire "hyperbolique", mais bon, la
terminologie est ce qu'elle est) et — à isogénie près — un espace
riemannien symétrique dit "de type compact". Le premier est l'espace
homogène G/K où K est le sous-groupe compact maximal de G, et le second est
(à des isogénies près) l'espace homogène G*/K où G* est la forme compacte
associée à G (et K est toujours le sous-groupe compact maximal de G). Ces
espaces sont dits duaux l'un de l'autre.

Exemple: au groupe de Lie simple réel Sp(n,ℝ) (de sous-groupe compact maximal U(n)) sont associés :
  - comme espace riemannien symétrique de type non-compact le « demi-espace de Siegel » Sp(n,ℝ)/U(n) des matrices n×n symétriques complexes dont la partie imaginaire est définie positive,
  - et comme espace riemannien symétrique de type compact [i.e., comme dual du précédent] l'espace Sp(n)/U(n) des sous-espaces totalement complexes de dimension n de ℍn (il y avoir une façon de le décrire avec des matrices de façon analogue au précédent, mais je ne sais pas exactement comment) ;

Liste des groupes de Lie réels simples
--------------------------------------

* https://en.wikipedia.org/wiki/List_of_simple_Lie_groups
= at a Lie group is simple if it is connected, non-abelian, and every closed connected normal subgroup is either the identity or the whole group

In this article the connected simple Lie groups with trivial center are listed. Once these are known, the ones with non-trivial center are easy to list as follows. Any simple Lie group with trivial center has a universal cover, whose center is the fundamental group of the simple Lie group. The corresponding simple Lie groups with non-trivial center can be obtained as quotients of this universal cover by a subgroup of the center.

- The Lie algebra of a simple Lie group is a simple Lie algebra. This is a one-to-one correspondence between connected simple Lie groups with trivial center and simple Lie algebras of dimension greater than 1

  Over the complex numbers the semisimple Lie algebras are classified by
  their Dynkin diagrams, of types "ABCDEFG". If L is a real simple Lie
  algebra, its complexification is a simple complex Lie algebra, unless L
  is already the complexification of a Lie algebra, in which case the
  complexification of L is a product of two copies of L. This reduces the
  problem of classifying the real simple Lie algebras to that of finding
  all the real forms of each complex simple Lie algebra (i.e., real Lie
  algebras whose complexification is the given complex Lie algebra). There
  are always at least 2 such forms: a split form and a compact form, and
  there are usually a few others. The different real forms correspond to
  the classes of automorphisms of order at most 2 of the complex Lie
  algebra.

- Symmetric spaces are classified as follows.

First, the universal cover of a symmetric space is still symmetric, so we can reduce to the case of simply connected symmetric spaces. (For example, the universal cover of a real projective plane is a sphere.)

Second, the product of symmetric spaces is symmetric, so we may as well just classify the irreducible simply connected ones (where irreducible means they cannot be written as a product of smaller symmetric spaces).

The irreducible simply connected symmetric spaces are the real line, and exactly two symmetric spaces corresponding to each non-compact simple Lie group G, one compact and one non-compact. The non-compact one is a cover of the quotient of G by a maximal compact subgroup H, and the compact one is a cover of the quotient of the compact form of G by the same subgroup H. This duality between compact and non-compact symmetric spaces is a generalization of the well known duality between spherical and hyperbolic geometry.

- A symmetric space with a compatible complex structure is called Hermitian. The compact simply connected irreducible Hermitian symmetric spaces fall into 4 infinite families with 2 exceptional ones left over, and each has a non-compact dual. In addition the complex plane is also a Hermitian symmetric space; this gives the complete list of irreducible Hermitian symmetric spaces.

Application exponentielle
=========================

t->exp(t.v) est l'unique application de C dans G qui envoit le vecteur
tangent (en 0) unité de C sur v dans le groupe de Lie GG.
Ie v donne un champ de vecteur (invariant à gauche sur G), et exp(v) est le
chemin suivant ce champ de vecteur au temps 1.
- exp(t.(sv))=exp(ts.v)
- exp est un difféomorphisme local en 0
- si f: G->H est un morphisme, exp(t.f_*(v))=f(ext(t.v))

Lie Bracket
===========


- Vector fields on any smooth manifold M can be thought of as derivations X of the ring of smooth functions on the manifold, and therefore form a Lie algebra under the Lie bracket [X, Y] = XY − YX, because the Lie bracket of any two derivations is a derivation.
- If G is any group acting smoothly on the manifold M, then it acts on the vector fields, and the vector space of vector fields fixed by the group is closed under the Lie bracket and therefore also forms a Lie algebra.
- We apply this construction to the case when the manifold M is the underlying space of a Lie group G, with G acting on G = M by left translations Lg(h) = gh. This shows that the space of left invariant vector fields (vector fields satisfying Lg*Xh = Xgh for every h in G, where Lg* denotes the differential of Lg) on a Lie group is a Lie algebra under the Lie bracket of vector fields.
- Any tangent vector at the identity of a Lie group can be extended to a left invariant vector field by left translating the tangent vector to other points of the manifold. Specifically, the left invariant extension of an element v of the tangent space at the identity is the vector field defined by v^g = Lg*v. This identifies the tangent space TeG at the identity with the space of left invariant vector fields, and therefore makes the tangent space at the identity into a Lie algebra, called the Lie algebra of G, usually denoted by a Fraktur \mathfrak{g}. Thus the Lie bracket on \mathfrak{g} is given explicitly by [v, w] = [v^, w^]e.

This Lie algebra \mathfrak{g} is finite-dimensional and it has the same dimension as the manifold G. The Lie algebra of G determines G up to "local isomorphism", where two Lie groups are called locally isomorphic if they look the same near the identity element. Problems about Lie groups are often solved by first solving the corresponding problem for the Lie algebras, and the result for groups then usually follows easily. For example, simple Lie groups are usually classified by first classifying the corresponding Lie algebras.

We could also define a Lie algebra structure on Te using right invariant vector fields instead of left invariant vector fields. This leads to the same Lie algebra, because the inverse map on G can be used to identify left invariant vector fields with right invariant vector fields, and acts as −1 on the tangent space Te.

The Lie algebra structure on Te can also be described as follows: the commutator operation
    (x, y) → xyx^−1y^−1
on G × G sends (e, e) to e, so its derivative yields a bilinear operation on TeG. This bilinear operation is actually the zero map, but the second derivative, under the proper identification of tangent spaces, yields an operation that satisfies the axioms of a Lie bracket, and it is equal to twice the one defined through left-invariant vector fields.

Adjoint Representation
======================
* http://en.wikipedia.org/wiki/Adjoint_representation

L'action par conjugaison donne un morphisme G->Aut(G)
On a Phi_g(h)=g h g^-1

Ad_g est la différentielle de Phi_g, on a donc un morphisme G->Aut(GG).
La différentielle de Ad donne un morphisme
ad: GG -> Der(GG)
(où une dérivation satisfait D([a,b])=[a,D(b)]+[D(a),b])
On a ad_x(y)=[x,y]

Ex: If G is a matrix Lie group (i.e. a closed subgroup of GL(n,C)), then its Lie algebra is an algebra of n×n matrices with the commutator for a Lie bracket (i.e. a subalgebra of \mathfrak{gl}_n(\mathbf C)). In this case, the adjoint map is given by Ad_g(x) = gxg^−1.

Autour de Lie Kolchin
=====================

Cas des groupes de Lie résolubles (Lie-Kolchin)
-----------------------------------------------

* https://en.wikipedia.org/wiki/Lie%E2%80%93Kolchin_theorem
If G is a connected and solvable linear algebraic group defined over an algebraically closed field and
    \rho: G \to GL(V)
a representation on a nonzero finite-dimensional vector space V, then there is a one-dimensional linear subspace L of V such that
    \rho(G)(L) = L.
Par récurrence l'image de G est inclus (à conjugaison près) dans les
matrices triangulaires supérieures.

[Note: pour G groupe de Lie connexe complexe ou réel linéaire, il me semble
que ça marche aussi en considérant l'exponentielle de son algèbre de Lie]

* Généralisation: https://en.wikipedia.org/wiki/Borel_fixed-point_theorem

If G is a connected, solvable, algebraic group acting regularly on a
non-empty, complete algebraic variety V over an algebraically closed field
k, then there is a G fixed-point of V.

Version sur les algèbres de Lie (Lie)
-------------------------------------

* Lie's theorem states that if V is a finite dimensional vector space over an algebraically closed field of characteristic 0, then for any solvable Lie algebra of endomorphisms of V there is a vector that is an eigenvector for every element of the Lie algebra.
Applying this result repeatedly shows that there is a basis for V such that all elements of the Lie algebra are represented by upper triangular matrices. This is a generalization of the result of Frobenius that commuting matrices are simultaneously upper triangularizable, as commuting matrices form an abelian Lie algebra, which is a fortiori solvable.

* Cf aussi https://www.jmilne.org/math/CourseNotes/LAG.pdf
Si ρ: L -> gl_V est une représentation et g est résoluble (k corps alg clos
de car 0), alors ρ(g) est dans les matrices triangulaires supérieures.

Corollaire 3.11:
a) ρ(g) est nilpotent si g \in [G,G]
b) For all x \in g and y \in [G,G], Tr_V(ρ(x) ρ(y))=0

Conséquences: - les L-modules simples sont de dimension 1.
              - [L, L] est nilpotent


* Critère de Cartan des algèbres de Lie résolubles
https://webusers.imj-prg.fr/~patrick.polo/M2/IntroLie07-sem2.pdf
https://www.jmilne.org/math/CourseNotes/LAG.pdf

Forme de Killing: K(x,y)=Tr(ad(x)ad(y))

Th (Elie Cartan): (g alg de Lie de dim finie)
   K(g, g)=0 => K(g, D(g))=0 <=> g résoluble (et donc D(g) nilpotent)

Cartan’s criterion says that a Lie algebra is solvable if the trace form of some faithful representation is zero.
(On peut se ramener à la représentation ad qui n'est pas forcément fidèle
en remarquant que g résoluble <=> ad(g) est résoluble)

Unipotent / Nilpotent (Kolchin / Engel)
---------------------------------------
* http://groupprops.subwiki.org/wiki/Kolchin%27s_theorem

If a linear algebraic group is unipotent (i.e., every element is unipotent) then we can choose a basis for the vector space in which the whole group becomes a subgroup of the group of upper triangular matrices (with 1s on the diagonal).
[?? ie G est nilpotent en tant que groupe <=> ces éléments sont unipotents
dans une représentation fidèle]

[Note: pour G groupe de Lie connexe complexe ou réel linéaire, il me semble
que ça marche aussi en considérant l'exponentielle de son algèbre de Lie]

* Version algèbre de Lie: https://en.wikipedia.org/wiki/Engel%27s_theorem

A finite-dimensional Lie algebra L is nilpotent if and only if every element of L is ad-nilpotent.

The key lemma in the proof of Engel's theorem is the following fact about Lie algebras of linear operators on finite dimensional vector spaces which is useful in its own right:

Let L be a Lie subalgebra of L(V). Then L consists of nilpotent operators if and only if there is a sequence
    V_0 \subsetneq V_1 \subsetneq \cdots \subsetneq V_n
of subspaces of V such that V_0 = 0, V_n = V and
    L V_{i+1} \subset V_i

Thus Lie algebras of nilpotent operators are simultaneously strictly upper-triangulizable, et donc L est nilpotente.

* Cf aussi https://www.jmilne.org/math/CourseNotes/LAG.pdf
Valable en toute caractéristique, et toute représentation ρ:L->gl(V) telle
que ρ(g) est nilpotent pour tout g \in L.

Attention: si L nilpotente, ça n'implique pas ρ(L) composé de nilpotents
même pour ρ fidèle. Ce qui est vrai c'est que L nilpotente <=> ad(x): g->g
est nilpotente pour tout x.

Le théorème d'Ado dit qu'une algèbre de Lie a toujours une représentation
fidèle (ie on peut la voir comme un sous-groupe de matrice), en toute
caractéristique 
https://en.wikipedia.org/wiki/Ado%27s_theorem

En car 0, on peut même trouver une représentation fidèle telle que ρ(plus
grand idéal nilpotent) soit composé de nilpotents, cf
https://www.jmilne.org/math/CourseNotes/LAG.pdf Ado's theorem.

Résumé
------

G \subset GL(V), en carac 0 sur kbar
- L composé de matrices nilpotentes <=> L nilpotent <=> L conjuguée \subset
  aux matrices triangulaires supérieures strictes
- G unipotent <=> G conjugué \subset aux matrices triangulaire avec des 1
  sur la diagonale
- L ou G résoluble sur C <=> L ou G conjugué \subset matrices triangulaire
Rem: L résoluble => D(G) nilpotent

En toute caractéristique:
- G groupe affine connexe résoluble sur kbar <=> G sous-groupe du groupe
  de Borel de Gl_n des matrices triangulaires supérieures
- L algèbre de Lie résoluble en car 0 sur kbar <=> elle est donnée par des
  matrices triangulaires supérieures
- G groupe affine unipotent (ie tout élément est unipotent, vu par
  exemple dans Gl_n) <=> G sous-groupe du groupe unipotent de Gl_n
- Si L algèbre de Lie nilpotente <=> tout élément de L est ad-nilpotent <=>
  ad(L) est donnée par des matrices triangulaires supérieures strictes

Semi-simplicité
===============

Groupes de Lie réductifs
------------------------

Par équivalence de catégorie entre les groupes de Lie réel (ou complexe)
simplement connexe et algèbre de Lie de dim finie, ils ont les mêmes
représentations. Or une algèbre de Lie réductive a des représentations
semi-simples (en carac 0), donc un groupe de Lie (simplement connexe)
réductif (au sens son algèbre de Lie est réductive; attention ici je
n'emploie pas le sens standard) et donc un produit direct de groupes de Lie
simple et d'un groupe abélien (qui est donc dans le centre).

En général une algèbre de Lie est de la forme semi simple \semidirect
résoluble, donc un groupe de Lie (simplement connexe) aussi.

Algèbres de Lie
---------------

* https://en.wikipedia.org/wiki/Semisimple_Lie_algebra

TFAE:
- g is semisimple
- the Killing form, κ(x,y) = tr(ad(x)ad(y)), is non-degenerate,
- g has no non-zero abelian ideals,
- g has no non-zero solvable ideals,
- The radical (maximal solvable ideal) of g is zero.

Algèbres de Lie (Milne)
-----------------------

* https://www.jmilne.org/math/CourseNotes/LAG.pdf

Toute algèbre de Lie L a un plus grand idéal nilpotent
ainsi qu'un plus grand idéal résoluble: son radical.

Lie algebra semi-simple <=> son seul idéal commutatif est {0}
                        <=> son radical est {0}
                        <=> elle n'a pas d'idéal résoluble
Si g semisimple, ad(g) est une représentation fidèle

Exemple: g/r(g) est semi-simple.

Si g est semi-simple, g = \prod g_i où les g_i sont les idéaux minimaux non
nuls de g_i.

* Nilpotency ideals and the largest nilpotent ideal

Si on a une représentation ρ, un idéal nilpotent pour ρ est un idéal a de g
tel que ρ(x) est nilpotent pour tout x dans l'idéal.
De manière équivalente, aM=0 pour tout quotient simple M de V, ou encore
ρ(a) \subset R(A) où A est l'algèbre engendrée par ρ(a).

{x / xM=0 pour tout quotient simple de V} est le plus grand ρ-idéal
nilpotent.

PROPOSITION 2.23 The nilpotent ideals of g are exactly the nilpotency ideals of g with respect to the adjoint representation
=> Every  Lie  algebra  has  a  largest  nilpotent  ideal,  containing  all  othernilpotent ideals.

* Semi simplicité
Lie algebra semi-simple <=> son seul idéal commutatif est {0}
                        <=> son radical est {0}
                        <=> elle n'a pas d'idéal résoluble

Si g a une représentation fidèle, la forme Trace induite est non dégénérée.

THEOREM 4.13 (Cartan criterion).  A nonzero Lie algebra g is semisimple if and only if its Killing form (=la forme trace de ad) is nondegenerate

- Dérivations:
THEOREM 4.22 Every derivation of a semisimple Lie algebra g is inner; therefore the map ad:g->Der(g) is an isomorphism.
(donc g est linéaire)

- Weyl’s theorem: the finite-dimensional representations of a semisimple Lie algebra in characteristic zero are semisimple.
  + g semi-simple <=> ad(g) est semisimple.

- Jordan decompositions in semisimple Lie algebras:
Prop 5.26: If g is semisimple, then it contains the semisimple and nilpotent parts of each of its elements

THEOREM 5.28 Every element of a semisimple Lie algebra g has a unique Jordan decomposition; moreover, x=x_s+x_n is a Jordan decomposition of x if ρ(.) is one for a faithful representation.

ASIDE 5.30  A Lie algebra is said to be algebraic if it is the Lie algebra of an algebraic group (see Chapter II). Proposition 5.26 automatically holds for algebraic Lie subalgebras of glV.  The result may be regarded as the first step in the proof that all semisimple Lie algebras are algebraic.

* Réductive Lie algebra:
A Lie algebra g is said to be reductive if its radical equals its centre.
<=> [g, rad(g)]=0

Nilpotent radical = noyau des représentations simples de g.
Le nilpotent radical = Dg \cap radical = [g, radical]; il est donc nilpotent.

g semi-simple <=> toute représentation est semi-simple
g réductive <=> ad_g est semi simple (comme représentation) 
            <=> g=semi-simple x commutatif <=> g=D(g) x Z(g) <=> rad(g)=Z(g)
            <=> nilpotent rad = 0
            <=> g a une représentation fidèle semi-simple

La décomposition g=ss x ab est unique et donnée par g=D(g) x Z(g)

On a radical >= orthogonal de la forme de Killing >= plus grand idéal
nilpotent >= nilpotent radical.
Donc (je pense): g réductive <=> rad(g)=z(g)
[en effet g=D(g)xZ(g) donc g réductive => rad(g)=z(g) et dans l'autre sens,
si rad(g)=z(g) il n'y a pas d'éléments nilpotents (??)]

Th 6.14: une représentation ρ d'une algèbre de Lie est semisimple (<=>)
- ρ(g) est réductive et son centre est composé d'endos ss
- ρ(rad g) est composé d'endos ss
- ρ(rad g) est semi simple

* Levi decomposition:
Si r = radical(g), une algèbre de Lévi de g est donnée par s telle que
g=r \oplus s, on a alors g= r \semidirect s décomposition en résoluble
\semidirect semisimple.
