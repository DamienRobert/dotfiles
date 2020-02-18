vim: ft=markdownlight fdm=expr

Algèbres
========

Artinian, Noetheterien
----------------------

* https://en.wikipedia.org/wiki/Artinian_ring

- R left artinian => left noeth
  Attention: un module peut être left artinian sans être left noeth
  Attention: on peut avoir un anneau artinian à gauche mais pas à droite

- Modules sur un artinian:
Let M be a left module over a left Artinian ring. Then the following are
equivalent (Hopkins' theorem):
(i) M is finitely generated,
(ii) M has finite length (i.e., has composition series),
(iii) M is Noetherian,
(iv) M is Artinian.[3]

* https://en.wikipedia.org/wiki/Hopkins%E2%80%93Levitzki_theorem
If R is a semiprimary ring and M is an R module, the three module
conditions Noetherian, Artinian and "has a composition series" are
equivalent. Without the semiprimary condition, the only true implication is
that if M has a composition series, then M is both Noetherian and Artinian. 

Rappel: semiprimary=
 R/J(R) is semisimple and J(R) is a nilpotent ideal

Conséquences:
- Since right Artinian rings are semiprimary, a direct corollary of the theorem is: a right Artinian ring is also right Noetherian.
- If R is right Artinian, then R is left Artinian if and only if it is left Noetherian => si R right Artinian et simple, il est left Artinian.

Algèbres simples
----------------

* https://en.wikipedia.org/wiki/Simple_ring
Algèbre simple = pas d'idéaux bilatères non triviaux and the multiplication operation is not zero

* http://en.wikipedia.org/wiki/Artin%E2%80%93Wedderburn_theorem

Si A est simple *et artinienne*, A=M_n(D) (Wedderburn)

En fait, si R is a simple ring with a minimal left/right ideal, then R is semisimple (donc artinien).
Cf https://en.wikipedia.org/wiki/Semisimple_module#Semisimple_rings
[??? 0 est toujours un idéal minimal]

### Algèbres centrales simples

* http://en.wikipedia.org/wiki/Central_simple_algebra
= a finite-dimensional associative algebra A, which is simple, and for which the center is exactly K
Note: si A est de K-dim finie, elle est artinienne.

- A centrale simple sur K, alors A=M_n(S), S à division (Wedderburn).
- Automorphism of a central simple algebra is an inner automorphism (follows from Skolem–Noether theorem).

- dim_K S=m^2, deg_K(S):=m. dim_K A=n^2 m^2, deg_K(A):=nm.
- deg_K(S)=dim_K k où k=corps commutatif maximal inclus dans S
  => S \tens k = M_m(k) (ie k splitting field de S et A).
     A \tens k = M_{nm}(k).
  Rem: https://qchu.wordpress.com/2016/03/27/separable-algebras/
    A \tens_K A^{op} = M_N(K), où N = \dim_K A.

Indice A := Degree S := m.
Exposant A=Ordre(S) dans le groupe de Brauer.
Exposant A | Indice A (et ils ont même facteurs premiers)

- If S is a simple subalgebra of a central simple algebra A then dim_K S divides dim_K A.
- If D is a central division algebra over K for which the index has prime factorisation
    indice(D) = \prod_{i=1}^r p_i^{m_i}
  then D has a tensor product decomposition
     D = \otimes_{i=1}^r D_i
  where each component Di is a central division algebra of index p_i^{m_i},
  and the components are uniquely determined up to isomorphism.

### Skolem Noether

* http://en.wikipedia.org/wiki/Skolem%E2%80%93Noether_theorem
[ Deux morphismes f,g: A->B d'algèbres simples sont conjugués ]

Let A and B be simple rings, and let k be the centre of B.
Suppose further that the dimension of B over k is finite, i.e. that B is a
central simple algebra. Then given k-algebra homomorphisms
    f, g : A → B
there exists a unit b in B such that for all a in A[1][2]
    g(a) = b · f(a) · b^−1.
In particular, every automorphism of a central simple k-algebra is an inner
automorphism.

* Ex: http://en.wikipedia.org/wiki/Schur%27s_lemma
If M and N are two simple modules over a ring R, then any homomorphism f: M
→ N of R-modules is either invertible or zero. In particular, the
endomorphism ring of a simple module is a division ring.

Schur's lemma is frequently applied in the following particular case. Suppose that R is an algebra over the field C of complex numbers and M = N is a finite-dimensional simple module over R. Then Schur's lemma says that the endomorphism ring of the module M is a division ring; this division ring contains C in its center, is finite-dimensional over C and is therefore equal to C. Thus the endomorphism ring of the module M is "as small as possible".
ie si V G-irréd, End_G(V)=\C.

* Generalisation: A module is said to be strongly indecomposable if its endomorphism ring is a local ring. For the important class of modules of finite length, the following properties are equivalent (Lam 2001, §19):
  -  A module M is indecomposable;
  -  M is strongly indecomposable;
  -  Every endomorphism of M is either nilpotent or invertible.

Algèbres semi-simples
---------------------

Semi-simple = artinian + J(R)=0 où J=idéal de Jacobson
            = produit d'algèbres simples
            = \prod M_{n_i} (D_i)
Rappel: Algèbre simple = pas d'idéaux bilatères non triviaux
        => A=M_n(D) (Wedderburn)

* https://en.wikipedia.org/wiki/Semisimple_algebra

A semisimple algebra is an associative artinian algebra over a field which has trivial Jacobson radical
=> A = le produit de ses idéaux bilatères minimaux (qui sont des algèbres simples)

Si A algèbre de dim finie sur k, A semi-simple <=> pas d'idéaux (à gauche) nilpotents [en effet dans ce cas A est artinienne, donc J(R) est le plus grand idéal nilpotent]

[Voir aussi https://www.math.upenn.edu/~chai/602f06/math602f06.html]

* Jacobson and nilradical:
- si R noeth, nil radical = unique largest (left, right, or two-sided)
  nilpotent ideal of the ring = intersection des idéaux premiers
  [attention, contrairement au cas commutatif il peut être différent de
  l'ensemble des éléments nilpotents de R]
- J(R)=intersection des idéaux maximaux (à gauche ou à droite). Il contient
  le nilradical. Si R artinien, J(R) nilpotent, donc c'est le nil radical.

* http://en.wikipedia.org/wiki/Artin%E2%80%93Wedderburn_theorem

An (Artinian [en particulière une K-alg de dim finie]) semisimple ring R is
isomorphic to a product of finitely many ni-by-ni matrix rings over
division rings Di, for some integers ni, both of which are uniquely
determined up to permutation of the index i.

Simple: In particular, any simple left or right Artinian ring is isomorphic
to an n-by-n matrix ring over a division ring D, where both n and D are
uniquely determined.

It follows from the Jordan–Hölder theorem that, while the decomposition
into a direct sum of irreducible subrepresentations may not be unique, the
irreducible pieces have well-defined multiplicities. In particular, a
representation of a finite group over a field of characteristic zero is
determined up to isomorphism by its character.

* Semi simple <=> les modules sont semi simples
https://math.stackexchange.com/questions/2055190/why-r-is-semisimple-ring-iff-every-r-module-is-semisimple
<=>
- R is semisimple.
- Every left (or right) R-module M is a semisimple module.
- Every left (or right) R-module M is injective.
- Every short exact sequence of left (or right) R-modules splits.
- Every left (or right) R-module M is projective.
- R is semisimple as an R-module
- There is a faithfull semi-simple module (=R is semi-primitive) + R is left (or
  right) artinian

Jacobson radical
----------------

* https://en.wikipedia.org/wiki/Jacobson_radical
The Jacobson radical of a ring R is the ideal consisting of those elements in R that annihilate all simple right R-modules
[de manière équivalente J(R)={les annulateurs de tout les R-modules simples
à gauche donc J(R) est bilatère]
- J(R) equals the intersection of all maximal right ideals of the ring. It is also true that J(R) equals the intersection of all maximal left ideals within the ring.
- J(R) is the unique right ideal of R maximal with the property that every element is right quasiregular (ie 1-r inversible à droite pour tout r dans J(R))
- J(R) contains every nil ideal of R. If R is left or right Artinian, then J(R) is a nilpotent ideal.

Ex: Rings for which J(R) is {0} are called semiprimitive rings, or sometimes "Jacobson semisimple rings". The Jacobson radical of any field, any von Neumann regular ring and any left or right primitive ring is {0}. The Jacobson radical of the integers is {0}.

Nakayama: si M est un R-module de type fini, R(J).M=0 => M=0.

* https://www.jmilne.org/math/CourseNotes/LAG.pdf

Review of Jacobson radicals: R(A)=\cap maximal left ideal of A

2.16 The following conditions on an element x of A are equivalent:
(a) x lies in the radical R(A)
(b) 1-ax has a left inverse for all a
(c) xM=0 pour tous les A-modules simples

2.18: R(A) contient tous les nil-idéal à gauche de A (ie des idéaux
composés de nilpotents). Si A/k est de dimension finie, R(A)^N=0 pour N>>0.
(en fait A Artinien suffirait)

Nilradical
----------

https://en.wikipedia.org/wiki/Nil_ideal
https://en.wikipedia.org/wiki/Nilpotent_ideal
https://en.wikipedia.org/wiki/Levitzky%27s_theorem
Nilpotent ideal => Nil ideal (every n \in I is nilpotent)
                <= if A is (left)-noethérien (Levitzky)

Cas commutatif: nil rad=\intersection idéaux premiers=idéal des éléments
nilpotents. Le Nil rad est nilpotent si A est noeth.

For noncommutative rings, there are several analogues of the nilradical.
The lower nilradical (or Baer–McCoy radical, or prime radical) is the
analogue of the radical of the zero ideal and is defined as the
intersection of the prime ideals of the ring. The analogue of the set of
all nilpotent elements is the upper nilradical and is defined as the ideal
generated by all nil ideals of the ring, which is itself a nil ideal. The
set of all nilpotent elements itself need not be an ideal (or even a
subgroup), so the upper nilradical can be much smaller than this set. The
Levitzki radical is in between and is defined as the largest locally
nilpotent ideal. As in the commutative case, when the ring is artinian, the
Levitzki radical is nilpotent and so is the unique largest nilpotent ideal.
Indeed, if the ring is merely noetherian, then the lower, upper, and
Levitzki radical are nilpotent and coincide, allowing the nilradical of any
noetherian ring to be defined as the unique largest (left, right, or
two-sided) nilpotent ideal of the ring.

Cas des groupes
---------------

Ex: http://en.wikipedia.org/wiki/Maschke%27s_theorem
    Maschke's Theorem. Let G be a finite group and K a field whose characteristic does not divide the order of G. Then K[G], the group algebra of G, is semisimple.
    De manière équivalente les G-modules sont semi-simples.

http://en.wikipedia.org/wiki/Representation_theory_of_finite_groups
    Theorem. C[G] ≅ \sum_V \bar{V}\otimes_G V where the sum is taken over the inequivalent G-irreducible representations V.

Primitive and Semi-primitive
----------------------------

* https://en.wikipedia.org/wiki/Primitive_ideal
= annilator of a simple module => prime ideal

* https://en.wikipedia.org/wiki/Prime_ideal#Prime_ideals_for_noncommutative_rings
= If the product of ideals AB is contained in P, then at least one of A and B is contained in P.

* https://en.wikipedia.org/wiki/Prime_ring
= {0} is a prime ideal in the noncommutative sense

* https://en.wikipedia.org/wiki/Primitive_ring
= has a faithful simple module = {0} is a primitive ideal => Prime ring

- For a left Artinian ring, it is known that the conditions "left primitive", "right primitive", "prime", and "simple" are all equivalent, and in this case it is a semisimple ring isomorphic to a square matrix ring over a division ring. More generally, in any ring with a minimal one sided ideal, "left primitive"="right primitive"="prime".
- A commutative ring is left primitive if and only if it is a field.

* https://en.wikipedia.org/wiki/Semiprimitive_ring
= Jacobson radical=0 <=> has a faithful semisimple left module

- A ring is semiprimitive if and only if it is a subdirect product of left primitive rings.
- A commutative ring is semiprimitive if and only if it is a subdirect product of fields, (Lam 1995, p. 137).
- A left artinian ring is semiprimitive if and only if it is semisimple
  (since by definition semisimple = artinian + semiprimitive)

Séparabilité
------------

Cas commutatif: algèbre étale
* https://en.wikipedia.org/wiki/%C3%89tale_algebra

Let K be a field and let L be a K-algebra. Then L is called étale or separable if L ⊗_K Ω ≃ Ω^n as K-algebras, where Ω is an algebraically closed extension of K and n ≥ 0.

Equivalently, L is étale if it is isomorphic to a finite product of separable extensions of K. When these extensions are all of finite degree, L is said to be finite étale; in this case one can replace Ω with a finite separable extension of K in the definition above.

A third definition says that an étale algebra is a finite dimensional commutative algebra whose trace form (x,y) = Tr(xy) is non-degenerate.

* https://en.wikipedia.org/wiki/Separable_algebra

A ring homomorphism (of unital, but not necessarily commutative rings) K → A
is called separable (or a separable extension) if the multiplication map
    μ : A ⊗_K A → A , a ⊗ b ↦ a b
admits a section
    σ : A → A ⊗_K A by means of a homomorphism σ of A-A-bimodules.

Separable algebras over a field K can be classified as follows: they are
the same as finite products of matrix algebras over finite-dimensional
division algebras whose centers are finite-dimensional separable field
extensions of the field K. In particular: Every separable algebra is itself
finite-dimensional. If K is a perfect field --- for example a field of
characteristic zero, or a finite field, or an algebraically closed field
--- then every extension of K is separable so that separable K-algebras are
finite products of matrix algebras over finite-dimensional division
algebras over field K. In other words, if K is a perfect field, there is no
difference between a separable algebra over K and a finite-dimensional
semisimple algebra over K. It can be shown by a generalized theorem of
Maschke that an associative K-algebra A is separable if for every field
extension L / K, A ⊗_K L is semisimple.

* https://qchu.wordpress.com/2016/03/27/separable-algebras/

$ Définition
A k-algebra (non commutative), k a commutative ring

Definition-Theorem: The following conditions on A are all equivalent, and all define what it means for A to be a separable k-algebra:
  - A is projective as an (A, A)-bimodule (equivalently, as a left A \otimes_k A^{op}-module).
  - The multiplication map A \otimes_k A^{op} -> A, (a, b) -> ab has a section as an (A, A)-bimodule map.
  - A admits a separability idempotent: an element p \in A \otimes_k A^{op} such that m(p) = 1 and ap = pa for all a \in A (which implies that p^2 = p).

When k is a field, this condition turns out to be a natural strengthening of the condition that A is semisimple (cf plus haut, il faut que les corps centraux soient séparables). In general, loosely speaking, a separable k-algebra is like a “bundle of semisimple algebras” over Spec k.

$ Examples
- The matrix algebra M_n(k) is a separable k-algebra.
  p = \sum_i e_{ij} \otimes e_{ji} est un separability idempotent
- Maschke: If G is a finite group whose order |G| is invertible in k, then the group algebra k[G] is a separable k-algebra.
  p = 1/|G| \sum_g g \otimes g^{-1}

$ Caractérisations

Note: la séparabilité est stable par produit, produit tensoriel, changement
de base, quotient, équivalence de Morita, transitivité.

Theorem: The separable algebras over a field k are precisely the finite products of matrix algebras over finite-dimensional division algebras over k whose centers are separable extensions of k.

Over a perfect field, the last condition is automatic, so this just says that the separable algebras over k are precisely the finite-dimensional semisimple k-algebras.

(( Preuve: Séparabilité et semisimplicité quand k=corps

Lemma: If A \otimes_k A^{op} is semisimple, then A is separable over k.

Proof. A ring is semisimple iff every module over it is projective. So if A \otimes_k A^{op} is semisimple, then in particular A is a projective A \otimes_k A^{op}-module.

Corollary: If L is a finite separable extension of a field k (in the usual sense), then L is separable over k (in the above sense).

Lemma: If A is separable over a field k, then A is semisimple.

Donc, si k est un corps, A/k séparable <=> A \otimes_k A^{op} est semisimple.

De plus: If A is separable over a field k, then A is geometrically semisimple: A \otimes_k L is semisimple for every field extension k \to L.

Lemma: Let A, B be algebras over a field k. Then Z(A \otimes_k B) =~ Z(A) \otimes_k Z(B).

Lemma: If A is a separable algebra over a field k, then so is its center Z(A).

Theorem: Let L be a field extension of a field k. The following conditions are equivalent:
  - L is a finite separable extension of k (in the usual sense).
  - L is a separable k-algebra (in the above sense).
  - L is geometrically semisimple: L \otimes_k L' is semisimple for all field extensions k \to L'.
  - L \otimes_k \bar{k} is a finite product of copies of \bar{k}.

Exemple: si k=kbar, k(t) est semi-simple, mais n'est plus semi-simple après
changement de base sur k(t).

Corollary: If a division algebra D over a field k is separable over k, then D is finite-dimensional over k, and its center Z(D) is a finite separable extension of k (in the usual sense).

Theorem: Let A be a central simple algebra over a field L: that is, A is a finite-dimensional simple L-algebra with center L. Then A \otimes_L A^{op} =~ M_n(L), where n = \dim_L A.

Corollary: A central simple algebra over a field L is separable over L.

Corollary: A finite-dimensional division algebra D over a field k whose center Z(D) is a finite separable extension of k is separable over k.

Corollary: The separable algebras over a field k are precisely the finite products of matrix algebras over finite-dimensional division algebras over k whose centers are separable extensions of k.
))

Morita Equivalence
==================

* http://en.wikipedia.org/wiki/Morita_equivalence
= ont la même catégorie de modules

The ring of n-by-n matrices with elements in R, denoted Mn(R), is Morita-equivalent to R for any n > 0

For every right-exact functor F from the category of left-R modules to the
category of left-S modules that commutes with direct sums, a theorem of
homological algebra shows that there is a (S,R)-bimodule E such that the
functor {F}(-) is naturally isomorphic to the functor E
\otimes_R -. Since equivalences are by necessity exact and commute with
direct sums, this implies that R and S are Morita equivalent if and only if
there are bimodules RMS and SNR such that M \otimes_{S} N \cong R as (R,R)
bimodules and N \otimes_{R} M \cong S as (S,S) bimodules. Moreover, N and M
are related via an (S,R) bimodule isomorphism: N \cong
\operatorname{Hom}(M_S,S_S).

If F(-) is the equivalence functor from R-Mod to S-Mod, then the R module M
has any of the following properties if and only if the S module F(M) does:
injective, projective, flat, faithful, simple, semisimple, finitely
generated, finitely presented, Artinian, and Noetherian. Examples of
properties not necessarily preserved include being free, and being cyclic.

Many ring theoretic properties are stated in terms of their modules, and so these properties are preserved between Morita equivalent rings. Properties shared between equivalent rings are called Morita invariant properties. For example, a ring R is semisimple if and only if all of its modules are semisimple, and since semisimple modules are preserved under Morita equivalence, an equivalent ring S must also have all of its modules semisimple, and therefore be a semisimple ring itself.

Sometimes it is not immediately obvious why a property should be preserved. For example, using one standard definition of von Neumann regular ring (for all a in R, there exists x in R such that a = axa) it is not clear that an equivalent ring should also be von Neumann regular. However another formulation is: a ring is von Neumann regular if and only if all of its modules are flat. Since flatness is preserved across Morita equivalence, it is now clear that von Neumann regularity is Morita invariant.

The following properties are Morita invariant:
    simple, semisimple
    von Neumann regular
    right (or left) Noetherian, right (or left) Artinian
    right (or left) self-injective
    quasi-Frobenius
    prime, right (or left) primitive, semiprime, semiprimitive
    right (or left) (semi-)hereditary
    right (or left) nonsingular
    right (or left) coherent
    semiprimary, right (or left) perfect, semiperfect
    semilocal
Examples of properties which are not Morita invariant include commutative, local, reduced, domain, right (or left) Goldie, Frobenius, invariant basis number, and Dedekind finite.

Semi simple catagories
======================

https://www.jmilne.org/math/CourseNotes/LAG.pdf
* Preliminaries on semisimplicity, p. 46

In every k-linear abelian category whose objects have finite length (eg les
A-modules finis pour A une k-algèbre):

M=semi simple <=> M somme de modules simples <=> M somme directe de modules
simples <=> tout sous-module a un supplémentaire

En particulier M= \oplus m_i S_i où les S_i sont les composantes
isotypiques de M, ie S_i simple et non isomorphe à S_j.

Lemme 5.4 (Schur): Si V est un A-module simple de dim finie sur k=kbar,
End_A(V)=k.

DEFINITION 5.8  A k-algebra A is semisimple if every A-module is semisimple
PROPOSITION 5.9 <=>
(a) A is semisimple
(b) A is a product of simple k-algebras
(c) the Jacobson radical R(A) of A is trivial

Prop 5.9 et 5.10:
- Si A/k est une algèbre de centre C, A \tens_k K est une algèbre simple de
  centre K pour C \subset K
- Si A \tens_k K est semisimple, A est semisimple. Si A est semisimple, A
  \tens_k K est semisimple si K/k séparable.

ASIDE 5.12  A k-algebra A is separable if L \tens_k A is semisimple for all fields L containing k. The above arguments show that A is separable if and only if it is a product of simple k-algebras whosecentres are separable over k.

* Semisimple categories
Prop 5.13: Si M est un A-module de type fini comme End_A(M)-module. Alors M
semisimple <=> son anneau d'homothétie A_M = image de A dans End_Z(M) est semisimple

PROPOSITION 5.14 Let A be a k-linear abelian category such that End(X) is finite-dimensional over k for all objects X. Then A is semisimple if and only if End(X) is a semisimple k-algebra for all X.

=> on peut appliquer ça a la catégorie des représentations d'un groupe
algébrique ou d'une algèbre de Lie sur k.

Bourbaki
========

Bourbaki, Algèbre Ch VIII
[les modules sont supposés à gauche.
Attention, ici corps=corps non commutatif=algèbre à division. On précise lorsqu'on parle de corps commutatifs]

## $1 Modules artiniens et noethériens

- M noeth <=> tout sous-module de M est de type fini
- M de longueur finie <=> M artinien et noeth
- Le noyau et le quotient d'un module noeth/art est noeth/art; et
  réciproquement pour une suite exacte
  (de même pour la somme finie)

- A artinien => A noeth
- A noeth => (M de type fini <=> M noeth)
- A artinien => (M de type fini <=> M noeth <=> M artinien <=> M longueur finie)

Contremodule: c'est le module vu comme module sur End_A(M)
Lemme 4: si le contremodule est de type fini, A_m s'injecte dans M^m
Proposition 6: si M est un module noeth/art dont le contremodule est de
type fini, alors A_M (l'image de A dans End_A(M)) est noeth/art.
Corollaire: Si A est commutatif, M noeth => A_M noeth, M longueur finie => A_M art

Attention: 
- on peut avoir des modules noeth/art à gauche mais pas à droite,
ou des modules de longueur finie avec des longueurs à gauche et à droite
différentes
- on peut avoir M de type fini et artinien sur A mais pas de longueur finie
En effet, si M est artininen, alors A_M l'image de A dans End(M) est
artinien lorsque le contremodule est de type fini. Mais M peut ne pas être
de type fini sur son contremodule. Cependant si A est de type fini sur
Z(A), alors comme A_M contient Z(A), M est de type fini sur A_M dans ce
cas; et donc M est de longueur finie [autrement dit le Corollaire de la
prop 6 a juste besoin que A soit de type fini sur Z(A)]

Polynômes: A[X] (la version généralisée, cf $1.4) est noéthérien si A l'est.

Exo 2: si M est de longueur finie n, et R des endos nilpotents de M stable
par composition, il existe une suite de Jordan-Holder M=M_0... tel que
r(M_i) \subset M_{i+1}. En particulier r_1...r_n=0 pour tout r_i \in R

Exo 15: si M de type fini sur A, M noeth <=> (a_n M) est stationnaire pour
toute suite crossante d'idéaux a_n. De même M art ssi (a_n M) est
stationnaire pour toute suite décroissante.

Exo 24: A[G] est artinien (à gauche ou à droite) ssi A l'est et G est fini.
Exo 25: A[G] est noeth si A l'est et G a une suite de composition dont les
  quotients sont finis où monogènes (ie isomorphe à Z)

Exo 27: division euclidienne pour A[X] (anneau de poly généralisé) => les
idéaux sont monogènes, et Af est maximal ssi f est irréductible.

## $2 Structure des modules de longueur finie

A est local <=>
(i) l'ensemble R des éléments non inversibles est un idéal bilatère
(ii) R est stable par addition
(iii) A à un unique idéal (à gauche) max (qui est alors R)
(iv) Tout a \in A est quasi-régulier (ie a ou 1-a est inversible)
(v) Tout a \in A est quasi-régulier à gauche (ie a ou 1-a est inversible à gauche)
[a est quasi-régulier ssi 1-a est inversible donc je surcharge un peu la déf de quasi-régulier en demandant juste que soit a, soit 1-a soit inversible]

Décomposition de Weyr-Fitting: si u est un endo de M, N_p=Ker u^p et I_p=Im
u^p. Si (N_p) et (I_p) sont stationnaires, M=N_\infty \oplus I_\infty qui
sont stables par u, u et nilpotent sur N_\infty et un automorphisme sur
I_\infty

Cor [utilisant des versions plus détaillées de la décomposition]:
- si M noeth, u surjectif => u bijectif
- si M art, u injectif => u bijectif
- si M de longueur finie, u inj ou surj => u bij
- si A commutatif et M de type fini, u surj => u bij [par descente au cas
  noeth]

Cor: si A noeth, x inversible à gauche (ou à droite) => x inversible

Déf: M indécomposable <=> M \ne M_1 \oplus M_2
     M primordial <=> End(M) local
     M semi-primordial <=> M=\oplus M_i, M_i primordial
Prop 4:  primordial => indécomposable; indécomposable+long finie => primordial

Th 1 (Azuyama): Si M est semi-primordial, L primordial, alors pour toute décomposition M=\oplus M_i de M en sous-modules primordiaux, [M:L]:=#{i / M_i \iso L} est constant.
Corollaires: 
- Toutes décompositions de M sont isomorphes à permutation près.
- Si M,N,P sont semi-primordiaux, que M \oplus P \iso N \oplus P et que [P:L] est fini pour tout L primordial, alors M \iso N
  [Exo 15: Si M, N modules, P primordial, M \oplus P \iso N \oplus P alors M \iso N]
- Si M,N semi-primordiaux, M^d \iso N^d => M \iso N
- M = \sum_finie M_i, M_i primordiaux.
  N facteur direct de M. Alors il existe une sous-partie de J de I tel que M_J soit supplémentaire à N; de plus dans ce cas N \iso M_{I \ J} et N est semi-primordial
- Tout module projectif de type fini sur un anneau local est libre
  [Note l'hypothèse "de type fini" n'est pas nécessaire, cf Exo 18]

Th 2 (Krull-Remak-Schmidt)
Si M est de longueur finie, il existe une décomposition finie M=\sum M_i.
Les M_i sont indécomposables de longueur finies donc primordiaux, donc M est semi-primordial. Donc le Th 1 s'applique à M, et les décompositions primordiales sont les mêmes que les décompositions indécomposables.

Th 3: Soit A une K-alg (K corps), M et N des A-mod de longueur finie. Si K' est une K-alg commutative tel que M_K' \iso N_K' (en tant que A_K'-modules), alors M \iso N

Exo 4: si p et q sont deux projecteurs de M alors <=>
(i) pq=qp
(ii) q stabilise Im p et Ker p
(iii) Il existe une suite de projecteurs 2 à 2 orthogonaux (p1,p2,p3,p4) tels que p=p1+p2, q=p1+p3, 1=p1+p2+p3+p4. Cette suite est alors unique: p1=pq
Exo 5: des considérations sur les idempotents de A

Exo 6: Soit u,v \in A / uv=1 mais vu \ne 1. Alors u admet une infinité d'inverses à droite (en particulier si u admet un inverse à droite v, soit il en admet un unique et alors vu=1 et v est une inverse, soit il en admet une infinité).
Plus précisément: soit e_ij=v^{i-1}u^{j-1}-v^i u^j. Alors e_ij e_hk = \delta_jh e_ik, donc les e_ii sont des projecteurs, les A e_ii sont non nuls deux à deux isomorphes et en somme directe, et u(v+e_1i)=1 or v+e_1i \ne v+e_1j si i \ne j.
[En particulier, si A satisfait les conditions équivalentes de l'exo $1.7a, comme ne pas avoir de suite infinie d'idempotents orthogonaux e_i, si uv=1 alors vu=1]

Exo 10: Si G est un p-Sylow, A local, A/m de carac p, alors A[G] est local

Exo 12: K corps, E,F extensions de K, A=E \tens_K F
- Si E et F sont transcendantes, A n'est pas local
- Si E est algébrique, E_s et F_s la cloture séparable de K dans E et F, <=>
(i) A est local
(ii) E \tens_K F_s est intègre
(iii) E \tens_K F_s est un corps
(iv) E_s \tens_K F_s est un corps
Dans ce cas l'idéal max de A est l'ensemble des éléments nilpotents de A, et tout extension composée de E et F est isomorphe à A/m

Exo 17: soit M \in GL_n(A). Si A est local ou euclidien, il existe des matrices P et Q produit de matrices élémentaires telles que PMQ=\diag(1,...,\delta)
Si A est commutatif et (local ou euclidien), Sl_n(A) est engendré par les matrices élémentaires
Si A est local d'idéal max m, si M\in M_n(A) est inversible dans M_n(A/m) alors M est inversible.

Exo 19: si A est commutatif, M de type fini, u un automorphisme de M et N un sous-module de M stable par u. Alors u(N)=N.

## $3 Modules simples

Prop 1: si M est simple, M=A/m où m est l'annulateur de x \in M, m maximal.
Cor: Si A est local d'idéal max m, tout module simple est iso à A/m

Attention: si A n'est pas commutatif, A/m peut être isomorphe à A/m' même si m \ne m'

Prop 2: f:M->N non nul
- Si M simple, f est injectif
- Si N simple, f est surj
- Si M et N simples, f est bij
Cor (Lemme de Schur): si M simple, End_A(M) est un corps

Th 1: Si K corps commutatif alg clos, A K-alg, M A-mod simple, dim_K M finie (ou <#K).
Alors End_A(M)={\alpha_M, \alpha \in K}.
Cor: - si A est commutatif, M est de dim 1 sur K
     - Si K est un corps commutatif, et que M_L est un A_L mod-simple pour toute extension L de K, alors End_A(M)={\alpha_M, \alpha \in K}.

Prop 3: si M est un A-mod de type fini, tout sous-module est contenu dans un sous-module maximal.
Cor:
- Si N est maximal dans M, l'annulateur a du module simple M/N est bilatère et aM \subset N donc aM \ne M.
- Si B est une A-alg, A commutatif, M B-mod simple et A-mod de type fini, d'annulateur m sur A. Alors m est maximal dans A et M est un ev de dim finie sur A/m.

Prop 5: si A artinien à gauche et M fidèle, alors A est un sous-module de M^m, et si M a une suite de Jordan Holder, tout A-module simple est isomorphe à un des quotients M_i/M_{i+1}.

Ex: - M=A => un anneau artinien n'a qu'un nombre fini de modules simples
    - A K-alg (K corps), M de fim finie sur K, alors A artinien à gauche ($1 Prop 6) et les A-modules simples sont isomorphes à un des M_i/M_{i+1}

Exo 10: si K est un corps et G fini, K[G] est auto-injectif, ie (Exo 8) I->I^\orth est une bijection des idéaux à gauches sur les idéaux à droites.

## $4 Modules semi-simples

Th 1: M semi-simple <=> M somme directe de modules simples 
      <=> M somme de modules simples
      <=> Tout sous-module admet un supplémentaire
Plus précisément:
  si M = \somme M_i, M_i simple, et N est un sous-module, alors
  il existe J \subset I tel que M=N \oplus_{j \in J} M_j
  Si J_0 \subset I est tel que M=\oplus_{j \in J_0} M_j, alors
  N \iso \oplus_{j \in J_0 \ J} M_j et M/N \iso \oplus_{j \in J} M_j.

Cor 4: si M semi-simple, M simple <=> End_A(M) est un corps <=> M primordial

$4.2: \oplus Hom_A(M,N_i) -> Hom_A(M, \oplus N_i) est injectif, et bijectif quand M est de type fini.

$4.3: Si P est un (A,B)-bimodule (ie un A \tens B module), on a des adjonctions
I: B-mod -> A-mod: V \mapsto P \tens_B V
H: A-mod -> B-mod: M \mapsto Hom_A(P,M)
Hom_A(I(V),M)=Hom_B(V,H(M))
d'où une monade et une unité alpha: IH->Id et une counité beta: Id->HI

$4.4 et $4.5: Modules isotypiques
S A-mod simple, D=End^op(S); S est un (A,D)-bimodule

Prop 1: M est S-isotypique ssi
(i) M est somme directe de sous-modules isomorphes à S
(ii) M est somme de sous-modules isomorphes à S
(iii) Il existe un espace vectoriel à gauche V sur D /
      M \iso S \tens_D V

Th 2: I et H (fournis par S) réalisent une équivalence de catégorie des D-ev -> sur les A-modules S-isotypiques; en particulier alpha et beta sont des isomorphismes canoniques.
Ie si M est un A-mod S-isotypique, M= S \tens_D Hom_A(S,M) [avec H(M)=V=Hom_A(S,M)] et si V est un D-ev, V=Hom_A(S, S\tens_D V) [avec I(V)=M=S \tens_D V]

Corollaires: 
- Les sous-ev de V correspondent aux sous-modules de M
[Plus précisément, à N sous-module de M correspont le sous-espace de V=Hom_A(S,M) des applications dont l'image est contenu dans N, et à W sous-espace de V correspond N=\sum_{h \in W} h(S)]
- V de dim finie <=> M de longueur finie (et alors dim V=longueur M)
- Hom_D(V,V')=Hom_A(M,M'), en particulier End_D(V) \iso End_A(M)
- Si F est un ensemble d'endos de V, W sous-ev de V correspondant au sous-module N de M, W est stable par F <=> N est stable par F.
  En particulier, si B est un sous-anneau de End_A(M)^op=End_D(V)^op, V est un (D,B)-bimodule et M un (A,B)-bimodule. Les sous-(D,B)-bimodules d V correspondent aux sous-(A,B)-bimodules de M.

$4.6: Composantes isotypiques
S simple

Déf: M_S=Somme des sous-mod de M isomorphes à S = plus grand sous-module de M S-isotypique. Si N sous-module de M, N_S=N \cap M_S.
  
Déf: Socle(M)=somme des sous-modules simples = sommes des composantes isotypiques M_S. M semi-simple <=> M=Socle(M)

Prop 4: Si M semi-simple, M est somme directe de ses composantes isotypiques [il y a un nombre fini de composantes isotypiques si M est de type fini]. SI M=\sum N_i (N_i)-simples, alors M_S=\sum_{N_i \iso S} N_i. Si N sous-module, N_S=N \cap M_S et (M/N)_S=(N+M_S)/N.

Prop 5: Si f:M->N est un morphisme, f induit des morphismes M_S->N_S. Si M est semi-simple, Hom_A(M,N)=\prod_S Hom_A(M_S,N_S) (et de plus f surjectif <=> les f_S sont surjectifs)
Cor 1: M semi-simple, N sous-module de M. N admet un unique supplémentaire <=>
(i) Hom_A(M/N,N)=0
(ii) N est somme (directe) de composantes isotypiques de M

Prop 6: Si M semi-simple, Hom_A(M,S) est canoniquement isomorphe au D-dual de Hom_A(S,M)

$ 4.7: Description d'un module semi-simple

Prop 7: l'application canonique \sum_S S \tens D_S Hom_A(S,M) -> M
est End_A(M)-bijective sur le socle de M. M_S est l'image de S \tens D_S
Hom_A(S,M)

Les résultats des sections 4.4 et 4.5 sur les modules isotypiques s'étendent immédiatement aux modules semi-simples. On remplace V D-ev par une famille
V_S de D_S-ev (D_S=Hom_A(S,S)), S parcourant les A-modules simples.

$ 4.8: Multiplicités et longueurs dans les modules semi-simples

Prop 10: M semi-simple = \oplus_I M_i, M_i simple. <=>:
(i) M de longueur finie
(ii) M artinien
(iii) M noeth
(iv) M de type fini
(v) I est fini.
Dans ce cas la longeur de M est #I
Prop 11: La composante isotypique M_S est de longueur la dimension sur D_S de Hom_A(S,M) (et aussi le nombre de i \in I/ M_i \iso S).

Comme simple=>primordial, semi-simple=>semi-primordial donc tous les résultats de décomposition s'appliquent, et la multiplicité de S est donc simplement
longueur de M_S = dim_D_S Hom_A(S,M) [ou encore par dualité, si la multiplicité est finie, à dim_D_S Hom_A(M,S)].

Exo 1: M semi-simple <=> Ann(x)=intersection finie d'idéaux maximaux, pour tout x \in M
Exo 2: <=>
(i) M semi-simple de longueur finie
(ii) M noeth et tout sous-module max a un supplémentaire
(iii) M art et tout sous-module min (ie simple) a un supplémentaire

Exo 7: P sous-module de M est essentiel s'il intersecte (non trivialement)
tout sous-module de N. Si N est un sous-module, il existe un sous-module N
\subset P essentiel tel que N soit facteur direct de P. En particulier le
socle de M est l'intersection de ses sous-modules essentiels, et M est
semi-simple ssi le seul sous-module essentiel est M.
Exo 8: si A noeth à gauche,
- l'annulateur à gauche Ann x n'est pas essentiel
- x simplifiable à droite => Ax est essentiel
  En particulier x simplifiable à droite => x simplifiable
- si a est un idéal essentiel contenant un élément non nilpotent, a contient un élément simplifiable

## $5 Commutation

B sous-anneau de A, B' commutant [c'est un anneau], B'' bicommutant.
B \subset B'' et B'''=B'; Z(B)=B \cap B', et B' \cap B'' est le centre commun de B' et B''.
Si M est un A-module, B=A_M l'anneau des homothéties, alors
A_M'=End_A(M), A_M''=End_{A'_M}(M) (ie A_M'' est l'anneau d'endomorphismes du contre-module de M)

Déf: M est équilibré ssi A_M''=A_M
Dans ce cas Z(A_M)=Z(A_M')=A_M \cap A_M'

Ex: si A est vu comme un A-module à gauche, A'=A^op, et A''=A.
    Le bicommutant de M^(I) s'identifie avec le bicommutant de M

$5.2: Module générateur

Idéal trace t(M): idéal (bilatère) = \sum <x_i, x*_i>, ie l'image de M \tens M*
dans A via l'application canonique <x,x*>=x*(x)

M est générateur <=>
(i) tout A-sous-module N est engendré par l'image des applications A-linéaires de M dans N
(ii) pour tout A-sous-module N, il existe une application A-lin surjective M^I->N
(iii) Il existe une application A-lin surjective M^n->A
(iv) Il existe n tel que A soit facteur direct de M^n
(v) l'idéal t(M)=A
(vi) Il existe x_1,...,x_n \in M et x*_1,...,x*_n \in M* / \sum <x_i,x*_i>=1

Corollaires: 
- A générateur => A fidèle
- M libre => M générateur
- M semi-simple dont le contremodule est de type fini => M générateur

Lemme 1: si A commutatif, M de type fini, a idéal de A, <=>
(i) aM=M
(ii) Ann M + a =A
(iii) Il existe un élément a_0 \in a / am=m \forall m \in M
Prop 3: si A commutatif et P projectif, P est générateur sur A_P
[Utilise la caractérisation suivante des modules projectifs (cf Lemme 2):
P est projectif si (pour une / pour toute) famille génératrice x_i, il existe des formes linéaires x*_i tels que x=\sum_I <x_i, x*_i>x_i (la somme devant être à support finie)]

Théorème 2: un module générateur est équilibré
    
Ex:
- soit M le A-mod à droite A^n. Alors A_M=A, A_M'=M_n(A) (où l'on voit A^n comme un M_n(A)-module à gauche), et comme M est équilibré A_M''=A, ie les endomorphismes de A^n vu comme M_n(A)-module à gauche sont les x->xa
- P proj sur A commutatif => P équilibré
- M type fini sur A principal => M équilibré
[Application à K[X], K corps commutatif: si V K-ev, u, v \in End_K(V), alors
v est dans le bicommutant de u ssi v=P(u)]
- M semi-simple + contremodule de type fini => M équilibré

Corollaire:
- S_i familles de A-mod simples (2à2 non isomorphes), D_i=End_A(S)^op.
Si dim_D_i S_i est fini, alors A ->> \prod End_{D_i}(S_i)
- A alg sur K commutatif alg clos, S A-mod simple, dim_K S finie.
  Alors A->>End_K(S) (Théorème de Burnside)

$ 5.4 Contremodule d'un module semi-simple

M A-mod semi-simple, B=End_A(M), C bicommutant de M.
M = \sum V_S \tens D_S S est un iso de (A,B)-bimodule,
où V_S=Hom_A(S,M) est un (D_S,B)-bimodule, et B est canoniquement isomorphe à
\prod End_D_S(V_S).

Prop 5: vus comme B-modules, V_S est simple (de commutant D_S), S est
canoniquement isomorphe à Hom_B(V_S,M), ie
M = \sum V_S \tens D_S^op S est la description canonique du contremodule M, qui est semisimple
En particulier, S->V_S est une bijection du support de M sur le support de son contremodule, et la composante isotypique M_S est la composante isotypique de V_S pour son contremodule.

Prop 6: vu comme (A,B^op)-bimodule, M est semi-simple et les composantes simples de M sont les composantes isotypiques (de M en tant que A-mod) M_S

Prop 7: C est canoniquement isomorphe à \prod_D_S(S)
et M = \sum S \tens D_S V_S est un iso de (C,B^op)-bimodule, qui est l'iso canonique de M vu comme C-module semisimple. S est donc simple en tant que C-module, et End_C(S) reste égal à D_S; Hom_A(S,M)=Hom_C(S,M), End_A(M)=End_C(M), sous A-mod = sous C-mod.

Prop 8: Soit Z=Z(C)=Z(B)=B \cap C, et Z_S=Z(D_S).
Alors Z=\prod Z_S, M est isotypique ssi Z est un corps, l'élément z projettant Z sur Z_z projette M sur M_S. En particulier si M est de support fini, on a une bijecton entre les sous-ensembles du support, les idéaux de Z, et via a->aM les sous (A,B^op)-bimodules de M (la bijection réciproque associé à N l'idéal de Z des éléments z appliquant M dans N).

$ 5.5: Théorème de densité
Théorème 3 (Jacobson): M A-mod semisimple, c \in End_Z(M). c \in A_M'' ssi pour toute partie finie F, c|F coincide avec une homothétie de A. Autrement dit A_M'' est l'adhérence de A_M dans End_Z(M) munit de la topologie de la convergence simple pour la topologie discrète sur M.

$ 5.6: Application à la théorie des corps

L corps, E sous anneau de End_Z(L) contenant les L-homothéties, E=End_K(L) pour un certain corps K (x \in K si x commute à E). Si V est un sous-K-ev de L, et h: V->L est K-linéaire, alors h est la restriction d'un élément de E.

En particulier, si K=L^\Gamma où \Gamma est un sous-groupe d'automorphismes de L, V un sous-K-ev à droite de L de dim finie. Alors il existe g_1,...g_n \in \Gamma tels que toute application K-linéaire V->L est de la forme u=\sum a_i g_i, avec a_i \in L.
[Si L commutatif, ça montre Hom(K,L)=<g_i>, ie que L/K est galoisien de groupe de Galois \Gamma, ie c'est une version du Lemme d'Artin]

Exo 8: A principal; M générateur <=> M* \ne 0 <=> M a A comme facteur direct
Exo 9: V ev sur un corps D. A=End_D(V), V est un A-module.
  - V est projectif, de type fini, fidèle et équilibré
  - Hom_A(V,A) = V*:=Hom_D(V,D^op) canoniquement comme (D,A)-bimodules
  - V générateur <=> dim_D V finie
Exo 11: si P A-mod projectif de type fini
  - \tau(P)^2=\tau(P), \tau(P)P=P
  - \tau(P) \tens_A P -> P est un iso

Exo 17: K corps commutatif alg-clos, V de dim finie sur K, G sous-monoïde de Aut(V) / V soit un k[G]-mod simple. Le théorème de Burnside montre que si { Tr(g), g \in G} est fini, alors G est fini.
Exo 18: G est dit localement fini ssi tout sous-groupe de G finiment engendré est fini. Si H distingué dans G et H, G/H loc finis alors G aussi. En particulier si G résoluble a tout g d'ordre fini, G est loc fini.
- V K-ev, K corps commutatif, G sous-groupe de Aut(V) finiment engendré par des éléments d'ordres finis. Alors l'ordre des éléments de G est borné. Si G sous-groupe de Aut(V) dont tout élément est d'ordre fini, alors G est loc fini.

Exo 19: A=\oplus A_i, A_i isomorphes en tant que A-modules, ssi il existe des éléments e_ij / e_ij e_kl = \delta_jk e_il, et A_i=Ae_ii, avec 1=\sum e_ii.
Soit B=Z(e_ij), A=M_n(B) et B est l'anneau opposé du commutant de A_i.
- si M est un A-module, M=\oplus M_i comme B-modules, avec M_i=e_ii M. Les M_i sont deux à deux isomorphes, d'annulateur B \cap Ann_A(M). Réciproquement pour tout B-module N, M=\sum e_i1 N est un A-mod / M=\sum M_i avec N \iso M_i. Cet correspondance induit une bijection entre les B-sous-modules de M_1 et les sous-modules de M.
