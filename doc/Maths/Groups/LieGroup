vim: ft=markdownlight fdm=expr
http://en.wikipedia.org/wiki/Lie_group

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
http://en.wikipedia.org/wiki/Adjoint_representation

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

https://en.wikipedia.org/wiki/Lie%E2%80%93Kolchin_theorem
 If G is a connected and solvable linear algebraic group defined over an algebraically closed field and
    \rho: G \to GL(V)
a representation on a nonzero finite-dimensional vector space V, then there is a one-dimensional linear subspace L of V such that
    \rho(G)(L) = L. 
Par récurrence l'image de G est inclus (à conjugaison près) dans les
matrices triangulaires supérieures.

[Généralisation: https://en.wikipedia.org/wiki/Borel_fixed-point_theorem
If G is a connected, solvable, algebraic group acting regularly on a
non-empty, complete algebraic variety V over an algebraically closed field
k, then there is a G fixed-point of V.]

Version sur les algèbres de Lie
-------------------------------
Lie's theorem states that if V is a finite dimensional vector space over an algebraically closed field of characteristic 0, then for any solvable Lie algebra of endomorphisms of V there is a vector that is an eigenvector for every element of the Lie algebra.
Applying this result repeatedly shows that there is a basis for V such that all elements of the Lie algebra are represented by upper triangular matrices. This is a generalization of the result of Frobenius that commuting matrices are simultaneously upper triangularizable, as commuting matrices form an abelian Lie algebra, which is a fortiori solvable.

Unipotent (Kolchin)
---------
http://groupprops.subwiki.org/wiki/Kolchin%27s_theorem

If a linear algebraic group is unipotent (i.e., every element is unipotent) then we can choose a basis for the vector space in which the whole group becomes a subgroup of the group of upper triangular matrices (with 1s on the diagonal).
[ie G est nilpotent en tant que groupe <=> ces éléments sont unipotents
dans une représentation fidèle]

Version algèbre de Lie: https://en.wikipedia.org/wiki/Engel%27s_theorem
A finite-dimensional Lie algebra L is nilpotent if and only if every element of L is ad-nilpotent.
The key lemma in the proof of Engel's theorem is the following fact about Lie algebras of linear operators on finite dimensional vector spaces which is useful in its own right:
Let L be a Lie subalgebra of L(V). Then L consists of nilpotent operators if and only if there is a sequence
    V_0 \subsetneq V_1 \subsetneq \cdots \subsetneq V_n\ 
of subspaces of V such that V_0 = 0, V_n = V and
    \mathbf{L} \, V_{i+1} \subseteq V_i, \quad \forall i \leq n-1.\ 
Thus Lie algebras of nilpotent operators are simultaneously strictly upper-triangulizable.

Résumé: G \subset GL(V).
- L composé de matrices nilpotentes <=> L nilpotent <=> L conjuguée \subset
  aux matrices triangulaires supérieures strictes
- G unipotent <=> G conjugué \subset aux matrices triangulaire avec des 1
  sur la diagonale
- L/G résoluble <=> L/G conjugué \subset matrices triangulaire
Rem: L résoluble => D(G) nilpotent

Semi-simplicité
===============

https://en.wikipedia.org/wiki/Semisimple_Lie_algebra

TFAE:
- g is semisimple
- the Killing form, κ(x,y) = tr(ad(x)ad(y)), is non-degenerate,
- g has no non-zero abelian ideals,
- g has no non-zero solvable ideals,
- The radical (maximal solvable ideal) of g is zero.

Critère de Cartan des algèbres de Lie
-------------------------------------
https://webusers.imj-prg.fr/~patrick.polo/M2/IntroLie07-sem2.pdf

Forme de Killing:
K(x,y)=Tr(ad(x)ad(y))

Th (Elie Cartan): (g alg de Lie de dim finie)
   K(g, D(g))=0 <=> g résoluble (et donc D(g) nilpotent)
