vim: ft=markdownlight fdm=expr

Topos
=====

[cf Logique/Topos pour les messages de David dans forum]

https://ncatlab.org/nlab/show/Leinster2010 An informal introduction to topos theory
Review of sketches of an elephant: https://www.cmu.edu/dietrich/philosophy/docs/tech-reports/159_Awodey.pdf
Review of Topos theory: https://projecteuclid.org/euclid.bams/1183544919

Topos
-----

* Topos: https://ncatlab.org/nlab/show/topos
Rappel: an elementary topos is a category which has finite limits, is cartesian closed, and has a subobject classifier. There are alternative ways to state the definition; for instance, has finite limits and has power objects.
=> finitely cocomplete.

$ From locally presentable categories to toposes

There is a canonical forgetful functor U:Topos that lands, by definition, in the sub-2-category of locally presentable categories and functors which preserve all limits / are right adjoints.
This 2-functor has a right 2-adjoint.

$ Limits and colimits

The 2-category Topos is not all that well-endowed with limits, but its slice categories are finitely complete as 2-categories, and ShTopos is closed under finite limits in Topos/SetTopos/Set. In particular, the terminal object in ShToposes is the topos Set≃Sh(*).

Proposition 2.1. All small (indexed) 2-colimits in ShTopos exists and are computed as (indexed) 2-limits in Cat of the underlying inverse image functors

Proposition 2.3. The 2-category Topos is an extensive category. Same for toposes bounded over a base.

Prop 2.4: the pullback in the (2,1)-category version of Topos is computed, roughly, by the pushout of their sites of definition

Remark 2.5. For localic toposes this reduces to the statement of localic reflection: the pullback of toposes is given by the of the underlying locales which in turn is the pushout of the corresponding frames.

* Topos classifiant: https://ncatlab.org/nlab/show/classifying+topos

* Topos are extensive: https://ncatlab.org/nlab/show/toposes+are+extensive
Every elementary topos is a finitary extensive category. In fact, more is true: if an elementary topos has coproducts indexed by any arity class κ, then it is κ-extensive. In particular, a cocomplete elementary topos is infinitary extensive.

* Boolean topos
https://ncatlab.org/nlab/show/Boolean+topos

- Every subobject has a complement (the general definition of Boolean category).
- Every subobject lattice is a Boolean algebra.
- The subobject classifier Ω is an internal Boolean algebra.
- The maps ⊤,⊥:1→Ω are a coproduct cone (so in particular, Ω≅1+1, and in fact this is enough, because the map [⊤,⊥]:1+1→Ω is always a monomorphism, and any monic endomorphism of Ω is an automorphism).

* In a topos, the contravariant powerset functor P:A -> Ω^A is right
adjoint to P^op, so is monadic and E^op is its category of algebras.
Sine E has all finite limits, E^op as a category of algebras too, so this
give a proof that a topos has finite colimits.

Points
------

* https://ncatlab.org/nlab/show/point+of+a+topos

Definition 1.3. A topos is said to have enough points if isomorphy can be tested stalkwise, i.e. if the inverse image functors from all of its points are jointly conservative.

- In presheaf toposes

Proposition 2.1. For C a small category, the points of the presheaf topos [C^op,Set] are the flat functors C→SetC \to Set:
there is an equivalence of categories Topos(Set,[C op,Set])→←FlatFunc(C,Set).

- In localic sheaf toposes
For the special case that E=Sh(X) is the category of sheaves on a category of open subsets Op(X) of a sober topological space X the notion of topos points comes from the ordinary notion of points of X.
For notice that
    - Set=Sh(*) is simply the topos of sheaves on a one-point space.
    - geometric morphisms f:Sh(Y)→Sh(X) between sheaf topoi are in a bijection with continuous functions of topological spaces f:Y→X; for this to hold X needs to be sober.
    The inverse image of a point is then the stalk.

- In sheaf toposes
The following characterization of points in sheaf toposes a special case of the general statements at morphism of sites.
Proposition 2.2. For C a site, there is an equivalence of categories
Topos(Set,Sh(C))≃Site(C,Set).
(Morphisms of sites C→Set are precisely the continuous flat functors.)

Proposition 2.3. If E is a Grothendieck topos with enough points (def. 1.3), there is a small set of points of E which are jointly conservative, and therefore a geometric morphism Set/X→E, for some set X, which is surjective.

- In classifying toposes
From the above it follows that if E is the classifying topos of a geometric theory T, then a point of E is the same as a model of T in Set.

- Of toposes with enough points
Proposition 2.5. If a sheaf topos E has enough points (def. 1.3) then
  - there exists a topological space X whose cohomology and homotopy theory is the intrinsic cohomology and intrinsic homotopy theory of the topos;
  - such that E is the category of equivariant objects in the sheaf topos Sh(X) with respect to some groupoid action on X.

The following classes of topos have enough points (def. 1.3).
  - every presheaf topos;
  - every coherent topos (due to the Deligne completeness theorem);
  - every Galois topos.

Over topos
----------

* https://ncatlab.org/nlab/show/over-topos

For 𝒯 a topos and X∈𝒯 any object the over category 𝒯/X – the slice topos or over-topos – is itself a topos: the “big little topos” incarnation of X. This fact is sometimes called the “Fundamental Theorem of Topos Theory”.
More generally, given a fibred product-preserving functor u:E→F between toposes, the comma category (id_F/u) is again a topos, called the Artin gluing.

Preuve: X×−:𝒯→𝒯 is a pullback preserving comonad, 𝒯/X est sa catégorie de
coalgèbre est donc un topos.

The subobject classifier of 𝒯/X is the projection Ω×X→X.

$ Étale geometric morphism
Proposition 3.1. For 𝒯 Grothendieck topos and X∈𝒯 any object, the canonical projection functor X_!:𝒯/X→𝒯 is part of an essential geometric morphism
(X_!⊣X^*⊣X_*):𝒯/X →X_*←X^*→X_! 𝒯.
Note: - The functor X^* is given by taking the product with X
      - in terms of the internal logic of 𝒯 the functor X_! is the existential quantifier ∃ and X_* is the universal quantifier ∀.

Definition 3.3. A geometric morphism ℰ→𝒯 of this form is called an etale geometric morphism.

$ Base change

Proposition 3.4. For ℰ a Grothendieck topos and f:X→Y a morphism in ℰ, there is an induced essential geometric morphism
(f_!⊣f^*⊣f_*):ℰ/X →f_*←f^*→f_! ℰ/Y
where f_! is given by postcomposition with f and f^* by pullback along X.

[voir aussi https://ncatlab.org/nlab/show/base+change
For f:X→Y a morphism in a category C with pullbacks, there is an induced functor f^*:C/Y→C/X of over-categories. This is the base change morphism. If C is a topos, then this refines to an essential geometric morphism
(f_!⊣f^*⊣f_*):C/X→C/Y où f_! correspond à il existe et f_* à pour tout:
∑_f⊣f^*⊣∏_f):C/X →f_*←f^*→f_! C/Y

Proof: That we have adjoint functors (f_!⊣f^*) follows directly from the universal property of the pullback. The fact that f^* has a further right adjoint is due to the fact that it preserves all small colimits by the fact that in a topos we have universal colimits[=stable by pullback] and then by the adjoint functor theorem theorem.

* https://ncatlab.org/nlab/show/pullback-stable+colimit
More generally, colimits are stable in any locally cartesian closed category, since in that case the pullback functors f^* all have right adjoints
]

$ Presheaf over-topos
Proposition 3.5. There is an equivalence of categories
e:PSh(C/c)→≃PSh(C)/Y(c).

Plus généralement:
Proposition 3.8. Let P:C^op→Set. Then there is an equivalence of categories
PSh(∫_C P)≃PSh(C)/P. [∫_C P est la catégorie des éléments de P]

$ Geometric morphisms by slicing
Proposition 3.9. For (f^*⊣f_*):𝒯→ℰ a geometric morphism of toposes and X∈ℰ any object, there is an induced geometric morphism between the slice-toposes
(f^*/X⊣f_*/X):𝒯/f^*X→ℰ/X,
where the inverse image f^*/X is the evident application of f^* to diagrams in ℰ.

$ Topos points
Observation 3.10. Let ℰ be a topos, X∈ℰ an object and
(e^*⊣e_*):Set→ℰ a point of ℰ. Then for every element x∈e^*(X) there is a point of the slice topos ℰ/X given by the composite
(e,x):Set →x_*←x^* Set/e^*(X) →e_*/X←e^*/X ℰ/X.
Here (e^*/X⊣e_*/X) is the slice geometric morphism of e over X discussed above and (x^*⊣x_*) is the étale geometric morphism discussed above induced from the morphism * →x e^*(X)

Hence the inverse image of (e,x) sends A→X to the fiber of e^*(A)→e^*(X) over x.

Corollary 3.11. If ℰ has enough points then so does the slice topos ℰ/X for every X∈ℰ.

Constructing topos
------------------

* https://ncatlab.org/nlab/show/topos+of+coalgebras+over+a+comonad
Proposition 2.1. Let ℰ be a topos. Then
  - if a comonad T:ℰ→ℰ is left exact, then the category of coalgebras TCoAlg(ℰ) is itself an (elementary) topos.
    Moreover,
      - the cofree/forgetful adjunction (U⊣F):ℰ →F←U TCoAlg(ℰ) is a geometric morphism.
    [Note: https://ncatlab.org/nlab/show/surjective+geometric+morphism
     these morphisms are exactly the surjective geometric morphisms]
      - If T is furthermore accessible and ℰ is a sheaf topos, then also TCoAlg(ℰ) is a sheaf topos.
      - Even if T is merely pullback-preserving, the category of coalgebras is a topos.
  - Therefore, if a monad T:ℰ→ℰ has a right adjoint, then the category of algebras TAlg(ℰ) is itself an (elementary) topos. (Because the right adjoint of a monad carries a comonad structure, evidently a left exact comonad, and there is a canonical equivalence between the category of algebras over the monad and the category of coalgebras over the comonad.)
  - If a monad on a topos is pullback-preserving and idempotent, then the category of algebras is a subtopos (hence the category of sheaves for some Lawvere-Tierney topology).

Exemple: For (f^*⊣f_*):ℰ→ℱ any geometric morphism, the induced comonad
f^*f_*:ℰ→ℰ is evidently left exact, hence (f^*f_*)CoAlg(ℰ) is a topos of
coalgebra.
-> Cf https://ncatlab.org/nlab/show/monadic+descent

* https://ncatlab.org/toddtrimble/published/Three+topos+theorems+in+one

  - Slice theorem: If E is a topos and X is an object, then E/X is a topos.
  - Lex comonad theorem: If G:E→E is a left exact comonad acting on a topos E, then the category of G-coalgebras is also a topos.

If the slice theorem is the one which passes to toposes of presheaves on internal discrete categories, then the lex comonad theorem is the one which, among other things, extends that further to toposes of presheaves on general internal categories.

  - Lex idempotent monad theorem: If J:E→E is a left exact idempotent monad acting on a topos E, then the category of J-algebras is also a topos.

This is the theorem which takes us from presheaves to sheaves. Here the monad J is the composite of taking the associated sheaf functor (which is left exact) followed by the forgetful functor from sheaves to presheaves; the J-algebras are the sheaves. The monad J is idempotent because the associated sheaf of a sheaf X is canonically isomorphic to X (alternatively, because the embedding of sheaves in presheaves is full and faithful). In fact, every such lex idempotent monad on a topos E arises in this way, by sheafifying with respect to a Lawvere-Tierney topology in E.

The first reduction combines the slice theorem and the lex comonad theorem into one. The idea is rather simple. Indeed, notice that the slice E/X is the category of coalgebras for the comonad −×X:E→E, where the comonad structure comes from the unique comonoid structure which exists on any object X:
δ:X→X×X ε:X→1

The comonad −×X isn’t left exact (it doesn’t preserve the terminal object), but it does preserve pullbacks.

Theorem 2.1. If G:E→E is a pullback-preserving comonad acting on a topos E, then the category of coalgebras E_G is also a topos.

Application: if C is an internal category in a topos E, there is a comonad
such that coalgebras of this comonad G:E→E are exactly internal presheaves on C, and theorem 1 shows that the category of presheaves is a topos.

Theorem 2: Let (G,δ) be a strict modal operator on a topos E. Then the category of G-structures E_G is also a topos.

Application: given an internal site (C,j) in E, a (strict) modal operator G:E→E such that the category of sheaves Sh(C,j) is equivalent to the category of G-structures

Note: un modal operator est G tel que on ait une application G->GG tel que
G ->  GG  soit un pullback, et il est strict si 1_G1=G1->GG1->G1.
|      |
GG -> GGG
Une G-structure c'est un objet X tel que X -> GX soit un pullback -> category E_G
                                         GX-> GGX
Rem: G-structures really are the same things as G-coalgebras or G-algebras, where G is either a pullback-preserving comonad or a lex idempotent monad, seen as a modal operator.

Note: if H is a modal operator on E_G, then we have a round trip operator
K: E -G> E_G -H-> E_G -U> E, and
Theorem 3: (K,λ) defines a modal operator on E, and E_K≃(E_G)_H. If the modal operators G and H are strict, then so is K.

Topos de Grothendieck
---------------------

Topos de Grothendieck: https://ncatlab.org/nlab/show/Grothendieck+topos
 Every Grothendieck topos is a locally presentable category,
 a total category and a cototal category [car il est (co)complet,
 (co)wellpowered et a un (co)generator: ].

### Caractérisations

* (Street) A category E is a Grothendieck topos iff it is lex total and the size of the set of isomorphism classes of objects is κ or less.
This result is in the spirit of saying “every Grothendieck topos is the category of sheaves with respect to the canonical topology on itself”.

* https://ncatlab.org/nlab/show/Grothendieck+topos#Giraud
Giraud's theorem characterises a Grothendieck topos as follows:
  - a locally small category with a small generating set,
  - with all finite limits,
  - with all small coproducts, which are disjoint, and pullback-stable,
  - where all congruences have effective quotient objects, which are also pullback-stable.
These conditions are equivalent to
  - a locally small infinitary pretopos (=infinitary extensive + exact) with a small generating set.

* https://ncatlab.org/nlab/show/sheaf+toposes+are+equivalently+the+left+exact+reflective+subcategories+of+presheaf+toposes

Proposition 1.1. Let (𝒞,τ) be a small site. Then the full subcategory inclusion i:Sh(𝒞,τ)↪PSh(𝒞) of its category of sheaves (Grothendieck topos) into its category of presheaves is a reflective subcategory inclusion
Sh(𝒞,τ)⊥↪i⟵LPSh(𝒞) such that the reflector L:PSh(𝒞)→Sh(𝒞) preserves finite limits (the reflector being sheafification).

Moreover, up to equivalence, every Grothendieck topos arises this way: Given a small category 𝒞 there is a bijection between
  - the equivalence classes of left exact reflective subcategories ℰ↪PSh(𝒞) of the category of presheaves
  - Grothendieck topologies τ on 𝒞 which is such that ℰ≃Sh(𝒞,τ)

Cf geometric embedding: une réflexion exacte dans un topos (=geometric
embedding) vient d'une
topologie \tau; sur les préfaisceaux les topologies viennent d'un site:
https://ncatlab.org/nlab/show/Lawvere-Tierney+topology
Proposition 3.2. For C a small category and E:=[C op,Set] its presheaf topos, Lawvere–Tierney topologies in E are equivalent to Grothendieck topologies on C.

Proposition 1.2. (accessible embedding is implied)
In the situation of prop. 1.1 it follows that the inclusion i:Sh(𝒞,τ)↪PSh(𝒞) is an accessible functor, hence an accessible reflective subcategory inclusion.
Pr: Sh(𝒞,τ) and PSh(𝒞) sont des topos de Grothendieck, donc loc.
présentables, donc les adjonctions sont accessibles (having a left adjoint
forces accessibility).

* https://ncatlab.org/nlab/show/bounded+geometric+morphism
  f: E->S est bounded ssi (<=>)
  - il existe un bound B tel que tout objet est un sous-quotient de f*IxB.
  - la fibration (E/f*)->S a une famille séparante
  [https://ncatlab.org/nlab/show/separator#fibered
  Definition 3.4. A separating family in a fibered category P:E→B is an object S∈E such that for every parallel pair f,g:A→B in E with f≠g and P(f)=P(g) there exist arrows c:X→S and h:X→A (constituting a span) such that c is P-cartesian, and fh≠gh; autrement dit S est localement séparant]

  Bounded geometric morphisms are stable under composition.

  Th: bounded toposes over 𝒮 are precisely the toposes of 𝒮-valued internal sheaves on internal sites in 𝒮.

### Sieves/Sites
TODO: site, sheaf, hypercover
* https://ncatlab.org/nlab/show/site
* https://ncatlab.org/nlab/show/sheaf
* https://ncatlab.org/nlab/show/hypercover
* https://ncatlab.org/nlab/show/sieve

* https://ncatlab.org/nlab/show/coverage
If {f_i:U_i→U} i∈I is a covering family and g:V→U is a morphism, then there exists a covering family {h_j:V_j→V} such that each composite gh_j factors through some f_i.

$ Sheaves:
For any collection of elements x_i∈X(U_i) such that, whenever g:V→U_i and h:V→U_j are such that f_i g = f_j h, we have X(g)(x_i)=X(h)(x_j), then there exists a unique x∈X(U) such that X(f_i)(x)=x_i for all i.

A site C is subcanonical if every representable functor C(−,c):C^op→Set is a sheaf If C is subcanonical, then its Yoneda embedding C→[C^op,Set] factors through Sh(C). If C is small, then Sh(C) is reflective in [C^op,Set] and a Grothendieck topos.

If C has pullbacks, by saturation we can assume that if f_i: U_i->U is a coverage and v: V->U, the pullbacks g* f_i: g*U_i->V is a coverage.
One can also impose the weaker condition that the pullbacks of covering families exist and are covering families, even if not all pullbacks exist in C. The saturation conditions below imply that on a category with pullbacks, every coverage is equivalent to one satisfying this stronger condition, which perhaps we may call a cartesian coverage.
If C has pullbacks, X is a sheaf <=> 
X(U)→∏_i∈I X(U_i) ⇉ ∏_j,k∈I X(U_j ×_U U_k).is an equalizer

$ Saturations (which don't change the prop of being a sheaf):
- Add {1_U} to the covering families
- If f_i: U_i->U is a covering family and g_ij: U_ij -> U_i is, then add
  f_i o g_ij: U_ij -> U
- If f_i: U_i->U is a covering family and g_j: V_j -> U is such that each
  f_i factors through a g_j, then add g_j as a covering family
- If f_i: U_i->U is a family, then the sieve it generates is {g: V->U} such
  that g factors through one f_i. X is a sheaf for f_i <=> it is a sheaf
  for the sieve it generates

$ Grothendieck pretopology or basis for a Grothendieck topology is commonly used for a coverage (often of the stronger sort requiring stability by pullbacks) that also satisfies
  - isomorphism cover: Every isomorphism is a covering family.
  - transitivity: If {f_i:U_i→U}_i∈I is a covering family and for each i, so is {h_ij:U_ij→U_i}_j∈J, then {f_i h_ij:U_ij→U}_i∈I,j∈U_i is also a covering family.
    The Grothendieck topology on C generated from a basis of covering families is that for which a sieve {S_i→U} is covering precisely if it contains a covering family of morphisms. Given any Grothendieck topology on C, there is a maximal basis which generates it
    Voir aussi: https://ncatlab.org/nlab/show/Grothendieck+pretopology

$ Grothendieck coverage (commonly called a Grothendieck topology) = a collection of sieves called covering sieves, satisfying the following pullback-stability and saturation conditions. (If R is a sieve on U and g:V→U is a morphism, we define g^*(R) to be the sieve on V consisting of all morphisms h into V such that ghh factors through some morphism in R.)
  - If R is a covering sieve on U and g:V→U is any morphism, then g^*(R) is a covering sieve on V.
  - For each U the sieve M_U consisting of all morphisms into U (the sieve generated by the singleton family {1_U}) is a covering sieve.
  - If R is a covering sieve on U and S is an arbitrary sieve on U such that for each f:V→U in R, f^*(S) is a covering sieve on V, then S is also a covering sieve on U.
One can then show that for every coverage, there is a unique Grothendieck coverage having the same sheaves. When C is small, then Grothendieck coverages on C are also in bijective correspondence with Lawvere-Tierney topologies on its presheaf topos [C^op,Set], and thus in bijection with subtoposes of [C^op,Set].

* Exemples:
https://ncatlab.org/nlab/show/coverage
https://ncatlab.org/nlab/show/Grothendieck+pretopology
https://ncatlab.org/nlab/show/Grothendieck+topology
  - Op(X) open subsets.
    A basis for the topology on X is a (subcanonical) coverage on X. (Closed under pullbacks = closed under intersections)
    Open covers = pretopology.
  - Grothendieck pretopologies on Top include:
    Local-section-admitting surjections
    Surjective open maps
    Surjective topological submersions
    Surjective local homeomorphisms
  - On the category Diff of manifolds: the pretopology of surjective submersions.
  - coverage of good open covers, on Diff
  - On any regular category there is a coverage, called the regular coverage, whose covering families are the singletons {f:V→U} where f is a regular epimorphism. It is subcanonical.
    If C is exact or has pullback-stable reflexive coequalizers, then its codomain fibration is a stack for this topology (the necessary and sufficient condition is that any pullback of a kernel pair is again a kernel pair).
  - On any coherent category there is a a coverage, called the coherent coverage, whose covering families are the finite families {f_i:U_i→U} the union of whose images is all of U. It is subcanonical. Likewise there is a geometric coverage on any infinitary-coherent category.
  - On any extensive category there is a coverage, called the extensive coverage, whose covering families are the inclusions into a (finite) coproduct. It is subcanonical. The coherent coverage on an extensive coherent category is generated by the union of the regular coverage and the extensive one (the topology is then superextensive).
    The codomain fibration of any extensive category is a stack for its extensive topology.
  - Any category has a canonical coverage, defined to be the largest subcanonical one. (Hence the name “subcanonical” = “contained in the canonical coverage.”) The covering sieves for the canonical coverage are precisely those which are universally effective-epimorphic, meaning that their target is their colimit and this colimit is preserved by pullback.
  - The canonical coverage on a Grothendieck topos coincides with its geometric coverage, and moreover every sheaf for this coverage is representable. That is, a Grothendieck topos is a (large) site which is equivalent to its own category of sheaves.

### Topologies

* https://ncatlab.org/nlab/show/canonical+topology
The canonical topology on a category C is the Grothendieck topology on C which is the largest subcanonical topology. More explicitly, a sieve R is a covering for the canonical topology iff every representable functor is a sheaf for every pullback of R. Such sieves are called universally effective-epimorphic.
Note: si C est déjà un topos de Grothendieck, alors C≃Sh_canonical(C)

* https://ncatlab.org/nlab/show/subcanonical+coverage
= all representable presheaves on this site are sheave

An alternate definition is that a Grothendieck coverage is subcanonical if and only if all of its covering sieves R↪C(−,U) are effective-epimorphic, meaning that the morphisms f:V→U in R form a colimit cone under the diagram consisting of all morphisms between them over U.

Proof: This is just a reformulation of the sheaf condition.

In fact, since the covering sieves in a subcanonical coverage must also satisfy pullback-stability, they must be not only effective-epimorphic but universally effective-epimorphic (meaning that any pullback of them is effective-epimorphic). It is then easy to see that the canonical coverage consists precisely of all the universally effective-epimorphic sieves.

Note also that if f:V→U is a single morphism having a kernel pair p,q:V×_UV⇉V, then the sieve generated by ff is effective-epimorphic iff f is the coequalizer of its kernel pair, and thus iff f is an effective epimorphism.

* https://ncatlab.org/nlab/show/trivial+topology
The Grothendieck topology on any category for which only the identity morphisms are covering is the trivial topology. Its sheaves are all the presheaves.

* https://ncatlab.org/nlab/show/regular+coverage
= each covering family has one element which is a regular epimorphism (on a regular category C).

- If C is exact or has pullback-stable reflexive coequalizers, then its codomain fibration is a stack for this topology (the necessary and sufficient condition is that any pullback of a kernel pair is again a kernel pair).
- For 𝒞_𝕋 the syntactic category of a regular theory, the regular coverage makes it the syntactic site, which is a site of defininition for the classifying topos of 𝕋.

* https://ncatlab.org/nlab/show/coherent+coverage
For C a coherent category, the coherent coverage on C is the coverage in which the covering families are generated by finite, jointly regular-epimorphic families.
= generated by single regular epimorphisms and by finite unions of subobjects

The coherent coverage is subcanonical.
  - If C is extensive, then its coherent topology is generated by the regular topology together with the extensive topology. (In fact, the coherent topology is superextensive.)
  - If C is a pretopos, then its self-indexing is a stack for its coherent topology. Exactness and extensivity are stronger than necessary, however; a pair of necessary and sufficient conditions for this to hold are that
      - If R⇉A is a kernel pair, then for any f:B→A, the pullback f^*R⇉B is also a kernel pair (this is equivalent to the codomain fibration [=self indexing] being a stack for the regular topology).
      - If A,B↣C are a pair of subobjects, then for any f:X→A and g:Y→B and any isomorphism f*(A∩B)≅g*(A∩B), the pushout
        f*(A∩B) → X
           ↓      ↓ 
           Y   →  Z
        exists and is also a pullback.

* https://ncatlab.org/nlab/show/superextensive+site
A superextensive site is a site whose covering families can be reduced to single covers combined with stable coproducts.

Let C be a finitely extensive category. A Grothendieck topology on C is (finitely) superextensive if it includes the (finitely) extensive topology (generated by families of injections into finite coproducts) and every covering family is generated by a finite one.

Likewise, if C is infinitary-extensive, a topology is infinitary-superextensive if it includes the infinitary-extensive topology (generated by families of injections into small coproducts) and every covering family is generated by a small one. (Of course, the last condition is vacuous if C is small.)

$ Relationship to singleton covers
The basic property of a superextensive site is that one can replace any (finite or small, as appropriate) covering family (j_i:U_i→B) with the single map ∐_i U_i→B. Covers (=single map covering) generate another Grothendieck topology (which is a “singleton pretopology”) T_cov.

Theorem 4.1. A superextensive Grothendieck topology T on an extensive category C is generated by the union of T_cov and the extensive topology T_ext.

$ Compatibility of sheafification
Theorem 4.2. Let C be a finitary superextensive site, and suppose that finite coproducts of covers in C are again covers. If X is a presheaf on C which is a T_ext-sheaf, then the T_cov-sheafification of X is also a T_ext-sheaf, and hence a T-sheaf.

Of course, there is an analogous result for infinitary superextensive sites. With a little more work we can also prove the same thing for stacks and stackification.

This result is especially interesting because sheaves and stacks for the extensive topology are easier to come by than those for some other topologies. For instance, if C is an extensive coherent category, then any internal category in C represents a functor C^op→Cat which is a stack for the extensive topology, but not usually for the coherent topology. However, the coherent topology is superextensive and its covers are precisely the regular epimorphisms, i.e. T_cov is the regular topology. Thus, the ** stackification of an internal category in C relative to the regular topology is still a stack for the extensive topology, and hence also for the coherent topology **.

Discussions:
- Appendix of https://arxiv.org/abs/1206.2764
  A characterization of categories of coherent sheaves of certain algebraic stacks, Daniel Schäppi
- https://nforum.ncatlab.org/discussion/3907/stacks-on-superextensive-sites/
- https://golem.ph.utexas.edu/category/2012/05/superextensive_sites.html

Applications:
- https://mathoverflow.net/questions/341511/reducing-the-stack-condition-descent-condition-over-an-fpqc-site-to-the-case-o

### Properties of sites
* https://ncatlab.org/nlab/show/concrete+sheaf
  https://ncatlab.org/nlab/show/concrete+site

$ On a concrete site
Definition. A concrete site is a site C with a terminal object * such that
  - the functor Hom C(*,−):C→Set is a faithful functor;
  - for every covering family {f_i:U_i→U} in C the morphism
    ∐_i Hom_C(*,f_i):∐_i Hom C(*,U_i)→Hom C(*,U) is surjective.

Definition. A presheaf X:C^op→Set on a concrete site is a concrete presheaf if for each U∈C the map X˜_U:X(U)→Hom_Set(Hom_C(*,U),X(*)) is injective.
A concrete sheaf is a presheaf that is both concrete and a sheaf.

$ In a local topos
Lemma. The category of sheaves on a concrete site is a local topos.

Definition. Let (Disc⊣Γ⊣Codisc):E ←Codisc →Γ ←Disc S
be a local geometric morphism. Since then by definition S ↪Codisc←Γ E is a subtopos the morphisms V=Γ^−1(isos(S))⊂Mor E that are inverted by Γ are the local isomorphisms with respect to which the objects of S are sheaves/V-local objects in E.
The concrete sheaves are the objects of E that are the V-separated objects.
So the concrete sheaves on C are precisely the separated objects for this Lawvere-Tierney topology on Sh(C) that corresponds to the subtopos Codisc:S↪Sh(C).
i.e. X concrete <=> the (Γ⊣coDisc)-counit X→coDisc ΓX is a monomorphism.

$ 3. Properties
Proposition. The category of concrete sheaves Conc_Γ(E) forms a reflective subcategory of E
S ↪Codisc←Γ Conc_Γ(E) ↪←Conc E which is a quasitopos.
The left adjoint Conc is concretization which sends a sheaf X to the image sheaf
ConcX:U↦Im(X(U)→Hom_Set(Hom_C(*,U),X(*))).

Notice that e_0≔(Γ⊣coDisc):𝒮 →coDisc←Γ ℰ is the canonical topos point of ℰ.
Observation. For every global element (x∈Γ(X)):*→X (for every X∈ℰ) there is a topos point of the form
(e_0,x):𝒮 →x_* ←x^* 𝒮/Γ(X) →coDisc/X ←Γ/X ℰ/X.

Observation. (relative concretization)
Let X∈ℰ be concrete. Then the image under the coDisc/X∘Γ/X-monad of any object (A→X)∈ℰ/X is an object (A˜→X) with A˜ being concrete.
This A˜ is the finest concrete sheaf structure on ΓA that extends ΓA→ΓX to a morphism of concrete sheaves.

* https://ncatlab.org/nlab/show/concrete+object

Proposition 2.1. For a local topos, write
H conc↪H_{conc} for its full subcategory of concrete objects.
Then there is a sequence of reflective subcategory-inclusions that factor the (Γ⊣coDisc)-adjunction as
Γ⊣coDisc: H ⟶ ↩ H_conc ⟶ ↩ Set

### Morphism of sites

* https://ncatlab.org/nlab/show/restriction+and+extension+of+sheaves

F: Y->X induit des morphismes de préfaisceaux:
F_*: PSh(X,A)→PSh(Y,A)		direct image
F^†:PSh(Y,A)→PSh(X,A)		left adjoint to direct image
F^‡:PSh(Y,A)→PSh(X,A)		right adjoint to direct image

Recall moreover that for f:X→Y any morphism of sites (so correspond to a functor F:=f^t:Y->X respecting coverage), the left adjoint to direct image followed by sheafification (−)¯\bar{(-)} is the inverse image map of sheaves: f^−1:Sh(Y,A)→Sh(X,A)

Now, if the morphism of sites happens to be restriction to a sub-site f:X→U with U∈PSh(X,A) with U carrying the induced topology, then
  - the direct image is called restriction of sheaves;
  - the right adjoint takes sheaves to sheaves and is called extension of sheaves.
Note: the induced topology on U correspond to the forgetful functor 
j^t_{U→X}:(Y_X/U)→X.

* https://ncatlab.org/nlab/show/morphism+of+sites
It is defined exactly so as to induce a geometric morphism between toposes of sheaves

f:C->D is a morphism of site if it is covering flat and preserve covering
families.

Note: If C has finite limits and all covering families in D are strong epic, then covering-flatness of f is equivalent to f preserving finite limits, i.e. being a left exact functor, or equivalently to being a representably flat functor.
In general representing flat => covering flat but not the converse.
[Plus de détails dans
 https://golem.ph.utexas.edu/category/2011/06/flat_functors_and_morphisms_of.html
 cf plus bas]

Example 3.1. If A and B are frames regarded as sites via their canonical coverages, then a morphism of sites A→B is equivalently a frame homomorphism, a function preserving finite meets and arbitrary joins.
Example 3.2: For C a site and U∈C, the comma category (C/U) inherits a topology from C, such that the forgetful functor (C/U)→C constitutes a morphism of sites.
Example 3.3. For C and D regular categories equipped with their regular coverages, a morphism of sites is the same as a regular functor, i.e. a functor preserving finite limits and covers.

Let f:(𝒞,J)→(𝒟,K) be a morphism of sites, with 𝒞 and 𝒟 small. Then precomposition with f defines a functor between categories of presheaves (−)∘f:PSh(𝒟)→PSh(𝒞)
which induce a geometric morphism (f^*⊣f_*):Sh(𝒟,K) →f_*←f^* Sh(𝒞,J)

Conversely:
Proposition 4.3. Let (𝒞,J) be a small site and let (𝒟,K) be a small-generated site. Then a geometric morphism
f:Sh(𝒟,K)→Sh(𝒞,J)
is induced by a morphism of sites (𝒟,K)←(𝒞,J):F precisely if the inverse image functor f^* respects the Yoneda embeddings, i.e. there is a functor F making the following diagram commute:
𝒟       ←F    𝒞 
↓ j_𝒟         ↓ j_𝒞 
Sh(𝒟,K) ←f^* Sh(𝒞,J).

Corollary 4.4. Let (𝒞,J) be a small site and let ℰ be any sheaf topos. Then we have an equivalence of categories
Topos(ℰ,Sh(𝒞,J))≃Site((𝒞,J),ℰ)
between the geometric morphisms from ℰ to Sh(𝒞,J) and the morphisms of sites from (𝒞,J) to the big site (ℰ,C) for C the canonical coverage on ℰ.

Topologies
----------

* https://ncatlab.org/nlab/show/Lawvere-Tierney+topology
A Lawvere–Tierney topology in E is (internally) a closure operator given by a left exact idempotent monad on the internal meet-semilattice Ω.
j:Ω→Ω satisfy:
- j true=true (‘if p is true, then p is locally true’)
- jj=j (‘p is locally locally true iff p is locally true’);
- j∘∧=∧∘(j×j) (‘p∧q is locally true iff p and q are each locally true’)
Note: j is equivalently a subobject J↪Ω

A Lawvere-Tierney topology is the same thing as an internal closure operator on the preorder Ω (aka, a Moore closure on the one-element set), which amounts to the same thing as a natural closure operator on subobjects:
Any subobject inclusion X↪Y in E, consider its characteristic morphism χ_X:Y→Ω. Then j∘χ_X is another morphism Y→Ω, which defines another subobject j_*(X) of Y, taken as the closure of our original subobject. The elements of j_*(X) are those elements of Y that are ‘locally’ in X

Proposition 2.6. A morphism j:Ω→Ω is a Lawvere-Tierney topology, precisely if the corresponding closure operator, satisfies for all X,Y∈E
- A⊂A¯
- A¯¯=A¯
- A∩B¯=A¯∩B¯

Def 2.7: A subobject U->X is dense if U¯=X.

Definition 2.8. An object F∈E is called a j-sheaf if it is a local object with respect to the dense monomorphisms.
This means that F is a j-sheaf if for every dense U↪X the induced morphism
Hom(X,F)→Hom(U,F) is an isomorphism. F is a j-separated presheaf if this morphism is itself a monomorphism.

$ Equivalence with Grothendieck topologies

j a Lawvere-Tierney topology <=> embedding Sh_j(E)↪E.
Proposition 3.2. For C a small category and E:=[C^op,Set] its presheaf topos, Lawvere–Tierney topologies in E are equivalent to Grothendieck topologies on C. (Indeed J give the set of covering sieves)

$ Relation to lex reflectors

Def 3.4: Given a reflector ♯:ℰ →L Sh_j(ℰ)↪ℰ, define for each object X∈ℰ a closure operator
by sending any monomorphism A↪X to c(A):=X x_#X #A.

Proposition 3.5. c_L commutes with pullback (change of base), so is a
universal closure operator.
Topology j: J=closure of 1↪Ω, ie 1↪J is the universal dense morphism,
  so j: Ω→ ♯Ω →{χ_♯true} Ω.

* https://ncatlab.org/nlab/show/sheafification

Recall from the discussion at sheaf that Sh_J(C) is by definition the full subcategory of PSh(C) on the local objects with respect to the morphisms
W={S({U_i}):=lim_→(∐_i,j j(U_i)×_j(U) j(U_j) => ∐_i j(U_i)) → j(U)| {U_i→U}_i∈I ∈J}

1. The localization proposition says that every full subcategory of a locally presentable category on the W-local objects for a small set W of morphisms is a reflective subcategory, given by the localization at these morphisms;
2. By Gabriel-Zisman's theorem every reflective subcategory is the localization at the collection of morphisms inverted by the left adjoint (which by the localization proposition is the saturation of the original set of morphisms).
3. If W satisfies the axioms of a calculus of fractions then, by the discussion there, this localization is equivalently given by the category PSh(C)[W^−1] whose objects are those of PSh(C) and whose morphisms are given by PSh(C)[W^−1](X,A)≃lim_→ X^ →^w X PSh_C(X^,A).

Notice that an object is a local object with respect to the above set of morphisms WW precisely if it is local with respect to the set of all small colimits (in the arrow category Arr(PSh(C)) of such morphims (since the hom-functor PSh_C(−,A) sends colimits in the first argument to limits, and a limit of isomorphisms is an isomorphism).
Let hence W¯ be the completion of A under forming small colimits in Arr(PSh(C)).
We claim that the morphisms in W¯\bar W form a calculus of fractions, and
Sh_j(C)=PSh_C[W¯^-1]

$ Construction.
L(X):U ↦ lim_{U^ →w j(U)} PSh_C(U^,X)
where the colimit on the right is over all w∈W¯.

Observation. By the definition of W¯, the morphisms U^→j(U) in W¯ are colimits of diagrams of covering sieves
U^≃lim_{→{K→U}} S({K_i}) → lim_→ {K→U} j(K).
This means (…) that the above colimit may be computed as two consecutive colimits of the form
lim_{→{S({U_i})→j(U)}} PSh C(S({U_i}),X).
One such application is called the plus construction.

Observation. A morphism S({U_i})→X out of a sieve into any presheaf is in components precisely a matching family of the presheaf Xon the covering {U_i→U}.

$ With values in models for finite-limit theories

Consider a type of structure T defined in terms of an essentially algebraic theory finite limits (such as groups, algebras, modules, etc.), then internal T-models are preserved by both direct images and inverse images of geometric morphisms. Therefore, the adjunction (L⊣i):Sh_J(C)→PSh(C) directly induces an adjunction between T-models in sheaves and presheaves. And since finite limits of sheaves and presheaves are computed pointwise, T-models in the category of (pre)sheaves are the same as (pre)sheaves of T-models-in-Set.

* https://ncatlab.org/nlab/show/plus+construction+on+presheaves
PSh(C) →(−)^+ SepPSh(C) →(−)^+ Sh(C)

Definition 2.1.
1. A^+:U↦colim_{(R→U)∈J(U)} A(R) where J(U) denotes the poset of J-covering sieves on U.
2. For U∈C^op we define A^+(U) to be an equivalence class of pairs (R,s) where R∈J(U) and s=(s_f∈A(domf)|f∈R) is a compatible family of elements of A relative to R, and (R,s)∼(R′,s′) iff there is a J-covering sieve R′′⊆R∩R′ on which the restrictions of s and s′ agree.
3. A+:U↦colim_(V↪U)∈W A(V) where W denotes the class W:=(f*)^−1 Core(Sh(C)_1) of those morphisms in PSh(C) which are sent to isomorphisms by the sheafification functor f^* and the colimit is taken over all dense monomorphisms only.

$ 4. Internal description

The plus construction can be described in the internal language of the presheaf topos PSh(C). For a presheaf A, seen as a set from the internal point of view, the separated presheaf A^+ is given by the internal expression
A^+={K⊆A|j(K is a singleton)}/∼
where ∼ is the equivalence relation given by K∼L if and only if j(K=L).

Morphismes
----------

Geometric morphisms:
- embedding: f_* fully faithfull
- surjective: f^* faithfull <=> f^* conservative
- connected: f^* fully faithfull => surjective
- essential: f^* has a left adjoint
- locally connected: S-indexed essential <=> essential + f^* cartesian closed
                     => open
- atomic: f^* is logical <=> f is open and E x_S E => E opens; => loc. connected
- étale: de la forme E/X->E <=> localic + atomic
- open: f^* is Heyting hence preserves first order logic. [Heyting category: coherent + on a ∀_p, right adjoint de p*; Heyting functor: coherent functor that preserves ∀_p]
- bounded: tout objet de E est un subquotient de Bxf*I.
           bounded over Set <=> Grothendieck topos
- localic: bounded with 1 for bound
- local: f connected + right adjoint f^! of f_*

Open, open surjection, atomic, locally connected, bounded, localic maps are stable by pullback.
[Note: for the bicategorical pullback to exist, we usually need to pullback
by a bounded morphism]

Si f o g est open et g surjection, f est open.
Si f o g est loc. connected/atomic et g open surjection, f est loc. connected/atomic.

### Flat functors and morphism of sites

* https://ncatlab.org/nlab/show/flat+functor
cf [flat functors] plus haut
Cf aussi https://golem.ph.utexas.edu/category/2011/06/flat_functors_and_morphisms_of.html qui contient aussi dans les commentaires des discussions très intéressantes sur la monade sheafication, et la logique interne:

Under what conditions on C and D can we say that F:C→D is covering flat if and only if it preserves finite limits?
=> it suffices for C to have finite limits and for covering families in D to be strong-epic.

- Morphisms of sites:
Therefore, if we were to define a morphism of sites F:C→D to
be a functor which is (1) covering flat and (2) cover-preserving, this
would be sufficient to induce a geometric morphism Sh(D)→Sh(C)
For instance, one nice thing is that the inclusion of any dense sub-site is always a morphism of sites in the new sense, though not necessarily in the classical one.

More importantly, this notion of “morphism of sites” now matches exactly the corresponding theory for classifying topoi. Recall that when E is a topos, geometric morphisms E→[C^op,Set] are equivalent to internally flat, or equivalently covering flat, functors C→E. If C is moreover itself a small site, then geometric morphisms E→Sh(C) are classically known to correspond to internally/covering flat functors which are also cover-preserving—in other words, morphisms of sites in the new sense, where E is equipped with its canonical topology. That means that modulo size issues (which I’ll address in my CT talk), the functor
  Sh(−):Site→Topos^op
(where Site is defined using the new notion of morphism of sites) is left adjoint to the forgetful functor 
  U:Topos^op→Site
which sends a topos to its underlying category equipped with its canonical topology, and a geometric morphism to its inverse image functor. But things are actually even better than that, because U is fully faithful: a functor between Grothendieck topoi is the inverse image functor of a geometric morphism precisely when it is a morphism of sites for the canonical topologies. In other words, the (2-) category of topoi is a reflective subcategory of the (2-)category of sites.

[Attention: si E est lui même de la forme Sh(D), un morphisme E->Sh(C) ne
vient pas forcément d'un morphisme de site C->D; par contre par la
discussion précédente ça vient d'un morphisme de site C->E muni de la
topologie canonique.]

- Morphisme de topos induit par un morphisme de sites:
A functor f:C→D induces two adjunctions between presheaf categories:
- Lan_f:Psh(C)⇄Psh(D):f^*
- f^*:Psh(D)⇄Psh(C):Ran_f
Of these, the second is always a geometric morphism Psh(C)→Psh(D) in the same direction as f, while the first is a geometric morphism Psh(D)→Psh(C) in the opposite direction to f precisely when Lan_f is left exact, i.e. when f is representably flat.
Now, given topologies on C and D, we can ask either of those two adjunctions to induce a geometric morphism between sheaf topoi. I claimed in my post that f is a morphism of sites, in the new sense I’m proposing (covering-flat and cover-preserving), if and only if (1) f^* maps Sh(D) into Sh(C) and (2) the composite Sh(C) →Lan_f Psh(D) →sheafify Sh(D) is left exact, so that the first adjunction becomes a geometric morphism Sh(D)→Sh(C). The point of the new definition, though, is that f need not be representably flat, so that there is no geometric morphism Psh(D)→Psh(C) at all.
(I should perhaps point out that for sites with finite limits, the new and old definitions of “morphism of sites” coincide, and all of these facts are well-known. Cf. for instance C2.3.8 of Sketches of an Elephant. The theorem that “toposes are a reflective subcategory of sites” is stated for finitely-complete sites in C2.3.9.)
On the other hand, asking the second adjunction to induce a geometric morphism Sh(C)→Sh(D) is a different sort of condition on f; Johnstone calls it being cover-reflecting. The theorem that this exactly classifies for which f you get a geometric morphism Sh(C)→Sh(D) is C2.3.18. Since f^* is always left exact, in this case there is no flatness condition on f required.

### Geometric morphism

* https://ncatlab.org/nlab/show/geometric+morphism
f_* et f^* adjoints tel que f^* est exact (pour les limites finies)

* https://ncatlab.org/nlab/show/geometric+embedding
<=>
 - the direct image functor f_* is full and faithful (so that F is a full subcategory of E);
 - the counit ϵ:f^*f_*→Id of the adjunction is an isomorphism
 - there is a Lawvere-Tierney topology on E and an equivalence of categories e:F≃Sh_j E

* https://ncatlab.org/nlab/show/surjective+geometric+morphism
A geometric morphism between toposes (f^*⊣f_*):ℰ→ℱ is surjective or a geometric surjection if it satisfies the following equivalent criteria:
  - its inverse image functor f^* is faithful (in contrast to the direct image being full and faithful as for a geometric embedding);
  - its inverse image functor f^* is conservative;
  - the components X→ f_* f^* X of the adjunction unit are monomorphisms, for all X∈ℱ
  - f^* induces a injective homomorphism of subobject lattices
    Sub(X)↪Sub(f^*X)
  - for all X∈ℱ; f^* reflects the order on subobjects;
  - (f^*⊣f_*) is a comonadic adjunction.

* https://ncatlab.org/nlab/show/%C3%A9tale+geometric+morphism
= local homéo dans Johnstone
Si T est un topos, X dans T, alors T/X est un topos. Un morphisme S->T est
étale si il est isomorphe à T/X->T.

- étale <=> localic+atomic [donc => essential, loc. connected]
- étale <=> essential + f_! conservative + 
  pour tout diagramme X -> Y <- f_! Z
  [f_! f^* X x_{f^* Y} Z, f_! Z; X, Y] est un pullback
  ie c'est comme la condition de Frobenius que l'on a pour un morphisme
  loc. connected: f_!(f^*(X)×Z) →~ X×f_!(Z), mais au dessus de toute fibre Y.

### Logical morphism

* https://ncatlab.org/nlab/show/logical+functor
Since all the elementary topos structure follows from having finite limits and power objects, it suffices to define a logical functor to preserve these, up to isomorphism

Proposition 3.3. For a logical functor F:ℰ→ℱ having a left adjoint L, the following are equivalent:
  - The induced functor L′:ℱ→ℰ/L1 is an equivalence of categories, i.e. the adjunction L⊣F can be identified with the pullback adjunction ℰ/B⇄ℰ for some B (namely L1).
  - L is conservative.
  - L is faithful.
  - L preserves equalizers.
  - L preserves pullbacks.
=> If a logical functor is right adjoint to a left exact functor, then it is an equivalence of categories.
=> A logical functor is the direct image of a geometric morphism precisely if it is an equivalence.

Déf: a geometric morphism with logical inverse image is called an atomic geometric morphism.
Corollary 3.6. Every atomic geometric morphism is an essential geometric morphism (en fait on a même atomic=>loc. connected).
The following is the main source of examples of atomic geometric morphisms.
Proposition 3.7. The inverse image of any base change geometric morphism, hence in particular of any etale geometric morphism, is a logical morphism.

### Localic and hyperconnected morphism

* https://ncatlab.org/nlab/show/localic+topos
In intrinsic terms, a topos is localic if it is generated under colimits by the subobjects of its terminal object 1.

In equivalent but extrinsic terms, a category is a localic topos if it is equivalent to the category of sheaves on a locale with respect to the topology of jointly epimorphic families.

LocTopos(S)≃(Topos/S)_loc≃Loc(S).

Note: https://ncatlab.org/nlab/show/locale
Proposition 4.14. The functor Sh(−):Locale→Topos has a left adjoint
L:Topos→Locale
given by sending a topos ℰ to the locale that is formally dual to the frame of subobjects of the terminal object of ℰ.

* http://zll22.user.srcf.net/dpmms/slides/2013-06-19-ToposesAsGroupoids.pdf
Si X, Y localic; [X,Y]=~[Sh(X), Sh(Y)]
Sh: X->Sh(X) is essentially surjective into the category of localic toposes
    it has a bicategorical left adjoint and both preserves and reflects bicategorical limits.
Proof. See Theorem 1.4.7 and Remark 1.4.8 in [Johnstone, 2002b, Part C]

* https://ncatlab.org/nlab/show/localic+geometric+morphism
A geometric morphism f:E→F between topoi is localic if every object of E is a subquotient of an object in the inverse image of f: of the form f*(x).
2. Examples
  - Any geometric morphism between localic topoi is localic.
  - Any geometric embedding is localic.
  - Any étale geometric morphism is localic. From the point of view of a base topos F, an étale geometric morphism F/A→F looks like the unique geometric morphism Sh(A)→Set attached to the topos of sheaves over the discrete locale A.
  - If g:C→D is a faithful functor between small categories, then the induced geometric morphism Set C→Set D is localic.
3. Properties
Proposition. A Grothendieck topos is a localic topos if and only if its unique global section geometric morphism to Set is a localic geometric morphism.

* https://ncatlab.org/nlab/show/hyperconnected+geometric+morphism
A geometric morphism is hyperconnected if it is (left) orthogonal to a localic geometric morphism.
Definition. A geometric morphism f:E→F between toposes is called hyperconnected if the inverse image functor f^*:F→E
  - is a full and faithful functor (donc hyperconnected => connected)
  - its image is closed under subquotients in E.
Hyperconnected <=> sa localic reflection est le point: Sh(*)=Set.

* https://ncatlab.org/nlab/show/%28hyperconnected%2C+localic%29+factorization+system

### Connectivity

* https://ncatlab.org/nlab/show/essential+geometric+morphism
Definition 2.1. Given a geometric morphism (f *⊣f *):E→F, it is an essential geometric morphism if the inverse image functor f^* has not only the right adjoint f_*, but also a left adjoint f_!
Let f^*⊣f_*:ℰ→ℱ a geometric morphism between Grothendieck toposes. Then f
is essential iff f^* preserves small limits iff f^* preserves small products.

* https://ncatlab.org/nlab/show/locally+connected+topos
Definition 2.1. An object A in a topos ℰ is called a connected object if the hom-functor ℰ(A,−) preserves finite coproducts.

Equivalently, an object A is connected if it is nonempty (noninitial) and cannot be expressed as a coproduct of two nonempty subobjects.

Definition 2.2. A Grothendieck topos ℰ is called a locally connected topos if every object A∈ℰ is a coproduct of connected objects {A_i}_i∈I, A=∐_i∈I A_i.

It follows that the index set I is unique up to isomorphism, and we write
π_0(A)=I.

This construction defines a functor Π_0:ℰ→Set: A↦π_0(A) which is left adjoint to the constant sheaf functor, the left adjoint part of the global section geometric morphism.
Thus, for a locally connected topos we have
(Π_0 ⊣ LConst ⊣ Γ): ℰ →^Γ ←^Const →^Π_0 Set. This is the connected component functor.

Proposition 2.3. A Grothendieck topos ℰ is locally connected precisely if the global section geometric morphism Γ:ℰ→Set is an essential geometric morphism (Π_0 ⊣ LConst ⊣ Γ):ℰ→Set.
[Preuve: en effet sur Set essential <=> loc connected car tout foncteur est
Set-indexed. Π_0(X)=∐_i∈I *, donc p* Π_0(X)=∐_i∈I A_i connected, et on
doit pouvoir en déduit que X aussi.]

Proposition 3.2. The (loc) constant sheaf-functor Δ:𝒮→ℰ is a cartesian closed functor precisely if ℰ is a locally connected topos.

* https://ncatlab.org/nlab/show/locally+connected+site
Let C be a small site; we say it is a locally connected site if all covering sieves of any object U∈C are connected, as full subcategories of the slice category C/U.
=> sheaf toposes over locally connected sites are locally connected toposes

Remark 3.1. If C is locally connected, then every constant presheaf on C is a sheaf.
Pr: The fact that all covering families are inhabited makes the constant presheaves be separated presheaves (see this example) and then the connectedness condition further makes them be sheaves.

On a Π_0(U)=* si U représentable, on en déduit pour X faisceau quelconque,
comme the left adjoint functor Π_0 commutes with the coend and the tensoring in the integrand: Π_0(X)=∫^U∈C X(U)⋅*= colim_{U→X} *.
We may think of this as computing the set of plot-connected components of X.

If C furthermore has a terminal object, then colimits along C^{op} preserve the terminal object, so that Sh(C) is moreover a connected topos.

* https://ncatlab.org/nlab/show/locally+connected+geometric+morphism
A geometric morphism (f^*⊣f_*):F⇆E  is locally connected if it satisfies the following equivalent conditions:
  - It is essential, i.e. f^* has a left adjoint f_!, and moreover f_! can be made into an E-indexed functor.
  - For every A∈E, the functor f^*:E/A→F/f^*A is cartesian closed.
  - f^* commutes with dependent products

If f is locally connected, then it makes sense to think of the left adjoint f_! as assigning to an object of F its “set of connected components” in E. In particular, if f is locally connected, then it is moreover connected if and only if f_! preserves the terminal object

Over the base topos E=Set every connected topos which is essential is automatically locally connected.

Let (𝒞,J) be a site and S be a sieve on the object U. S is called connected when S viewed as a full subcategory of 𝒞/U is connected. The site is called locally connected if every sieve is connected. For a bounded geometric morphism p:ℰ→𝒮 the following holds: p is locally connected iff there exists a locally connected internal site in 𝒮 such that ℰ≃Sh(𝒞,J)

f_! -| f^* est une strong adjunction: [f_!X,A]≃f_*[X,f^*A] ie par Frobenius: f_!(f^*(X)×A)→~ X×f_!(A)
Locally connected toposes are coreflective in Topos.

* https://ncatlab.org/nlab/show/connected+topos
A geometric morphism p:E→F is connected if its inverse image part p^* is full and faithful.

A Grothendieck topos E is connected if the unique geometric morphism
E→Set=Sh(*) is connected. If E is the topos of sheaves on a topological space X (or more generally a locale), then this is equivalent to the usual definition of connectedness for X.

$ Locally connected and connected

Proposition 2.1. If p:E→F is locally connected, then it is connected if and only if the left adjoint p_! of the inverse image functor (which exists, since p is locally connected) preserves the terminal object.

Exemple: https://ncatlab.org/nlab/show/connected+site
Let C be a locally connected site; we say it is a connected locally connected site if it is also has a terminal object => Sh(C) is a locally connected and connected topos.

[Voir aussi le même énoncé dans https://ncatlab.org/nlab/show/locally+connected+topos
Proposition 3.3. If Γ:E→Set is a locally connected topos, then it is also a connected topos — in that LConst is full and faithful — if and only if the left adjoint Π_0 of LConst preserves the terminal object.
Rappel: A topos E is called a connected topos if the left adjoint LConst:Set→E is a full and faithful functor.

Notice that for a connected and locally connected topos, the adjunction Set
↪←Π_0 E exhibits Set as a reflective subcategory of E. We may think then of
Set as being the localization of E at those morphisms that induce
isomorphisms of connected components.]

Proposition 3.1. Connected geometric morphisms are left orthogonal to etale geometric morphisms in the 2-category Topos.
Proposition 3.2. Any locally connected geometric morphism factors as a connected and locally connected geometric morphism followed by an etale one.
Preuve: f:E→S locally connected, factor as E→S/f_!(*)→S
=> on a un fact system (Connected, Etale) dans LCTopos.
=> The category of etale geometric morphisms over a base topos S, which is equivalent to S itself, is a reflective subcategory of the slice 2-category LCTopos/S. The reflector constructs “Π_0 of a locally connected topos.”

Proposition 4.2. Let Γ:ℰ→Set be a connected and locally connected topos and X∈ℰ a connected object, Π_0(X)≃*. Then the over-topos ℰ/X is also connected and locally connected.

* https://ncatlab.org/nlab/show/strongly+connected+topos
A strongly connected geometric morphism, which is locally connected such that f_! preserves all finite products => preserve * donc est connected.

https://ncatlab.org/nlab/show/strongly+connected+site
Let C be a locally connected site; we say it is a strongly connected site if it is also a cosifted category (ie colimit commutes with product) => Sh(C) est strongly connected.

* https://ncatlab.org/nlab/show/totally+connected+geometric+morphism
  a totally connected geometric morphism, which is locally connected such that p_! preserves all finite limits.

Totally connected sites
A small site C is called totally connected if
  - C is cofiltered, and
  - Every covering sieve in C is connected, when regarded as a subcategory of a slice category. (ie C est loc. connected)
    The second condition implies that all constant presheaves are sheaves, and hence that the left adjoint Colim:Psh(C)→Set of Const:Set→Psh(C) restricts to Sh(C) to give a left adjoint of LConst. Cofilteredness of C is exactly what is needed for left exactness of Colim:Psh(C)→Set, essentially by definition. Hence the topos of sheaves on any totally connected site is totally connected.
Conversely, one can show that any totally connected topos can be (but need not be) presented by some totally connected site.

### Atomic and Local topos

* https://ncatlab.org/nlab/show/atomic+geometric+morphism

A geometric morphism is called atomic if its inverse image f^* is a logical functor => locally connected.
Atomic + connected => hyperconnected
A localic geometric morphism is atomic precisely if it is an etale geometric morphism.

[Johnstone: f:E->S is atomic <=> f is open and E x_S E => E opens.]

- Barr, Atomic Topos: http://www.math.mcgill.ca/barr/papers/atom.top.pdf
  Theorem B: f:E->S is atomic <=> pour tout objet X de E, son lattice de sous-objets est isomorphe aux sous-objets d'un Lambda X de S. Dans ce cas Lambda défini en fait le foncteur f_!.

Plus exactement, le sub object lattice d'un objet X est
Hom(X, Ω_E)=Hom(1, Ω_E^X)=Γ(Ω_E^X) et on veut que ce soit isomorphe à Ω_B^ΛX.

* https://ncatlab.org/nlab/show/atomic+topos
=Global section is atomic => Boolean
Pr: Set est Boolean, f* est logical donc E est boolean.

Definition 2.2. A non-zero object A of a topos ℰ is an atom if its only subobjects are A and 0.

Theorem 2.3. Let ℰ be a Grothendieck topos. Then the following are equivalent:
  - ℰ is an atomic topos.
  - ℰ is the category of sheaves on an atomic site.
  - The subobject lattice of every object of ℰ is a complete atomic Boolean algebra.
  - ℰ has a small generating set of atoms.
  - Every object of ℰ can be written as a disjoint union of atoms.

ℰ atomic sur Set => ℰ boolean.
Réciproquement: If ℰ is a Boolean Grothendieck topos with enough points then ℰ is atomic.
[Attention que l'on peut avoir des topos atomiques sans points.
  Johnstone C3.5.2: E Grothendieck with enough points, E boolean <=> E->Set is atomic
  C3.5.3: Si E localic (ie E=Sh(X), X locale), E atomic <=> X discrete <=> Boolean et a assez de points;
  Par contre an atomic Set-topos which is not localic need not have enough points: D3.4.14 exemple of a connected atomic topos without a point.]

- Decomposition of atomic toposes
Atomic toposes decompose as disjoint unions of connected atomic toposes. Connected atomic toposes with a point are the classifying toposes of localic groups.

- Ex: A category of presheaves Set^𝒞^op is atomic precisely iff 𝒞 is a groupoid
- Dubuc: connected atomic topos is a connected, locally connected and boolean topos.
  Preuve: comme tout X se décompose en X_i connexes (car X loc. connexe),
  il faut montrer que X connexe => X atomique. Mais comme X booléen, s'il
  avait un sous objet Y, on aurait un complément, absurde.

- https://ncatlab.org/nlab/show/atomic+site
= the covering sieves S of J_at are exactly the inhabited sieves S≠∅
=> Sh(C, J_at) est atomique

- Cf la discussion de
https://golem.ph.utexas.edu/category/2018/10/topoi_of_gsets.html pour une
intuition sur les topos atomiques et les atomic geometric morphisms.

  Suppose f:E→S is atomic, so that f^*:S→E is logical. Then in particular, f^* preserves the subobject classifier, which means by adjunction that its left adjoint f_! preserves subobject lattices. In other words, the lattice of subobjects of A∈E coincides with the lattice of subobjects of f_!A∈S. Thus, from the perspective of S, a subobject of A is uniquely determined by which of the “atomic components” (elements of f_! A) that it contains: each of these is “uncuttable” and AA is just a collection of these.
  The paper of Barr and Diaconescu shows that atomicity of an arbitrary geometric morphism p:E→S is equivalent to saying that every object p_*(Ω^A) — the “subobject lattice of A∈E to the eyes of S” — is isomorphic to some power-object Ω^B in S, where in fact B=p_!(A). They don’t seem to state this explicitly, but surely such an isomorphism decomposes A as an S-indexed coproduct of “atoms” in the constructive sense, with B=p_!(A) as indexing object, and the existence of such decompositions should conversely imply atomicity.
  For any bounded atomic morphism p:E→S we can choose a site of definition for E consisting of objects A which are connected, i.e. satisfy p_!(A)≅1. In the case when p is atomic, connected objects of E are generally called atoms… an atom A has the property that… the map Sub_S(1)→Sub_E(A)… is biective.
  En particulier si E atomique au dessus de S=Set, un atomic component dans
  Set est {*}, donc un atomic object X dans E est un objet qui n'a que 0 et
  X comme sous-objet, et tout objet dans E est somme d'objets atomiques.

* https://ncatlab.org/nlab/show/local+geometric+morphism
f: geometric morphism +  right adjoint f^!:S→E +  (<=>)
  - The right adjoint f^! is an S-indexed functor.
  - f is connected, i.e. f^* is fully faithful.
  - The right adjoint f^! is fully faithful.
  - The right adjoint f^! is cartesian closed.

 A sheaf topos 𝒯 is a local topos if the global section geometric morphism 𝒯 →Γ←LConst Set has a further right adjoint CoDisc, making an adjoint triple (LConst⊣Γ⊣CoDisc):Set↪𝒯. (As just stated, it is automatic in the case over Set that this is furthermore a full and faithful functor.)

 Another way of stating this is that a Grothendieck topos is local if and only if the terminal object 1 is connected and projective (since this means precisely that Γ=hom(1,−) preserves colimits, and therefore has a right adjoint by virtue of an adjoint functor theorem)
 [Note: si un objet X a un right adjoint pour le foncteur hom interne [X,-],
 on dit qu'il a un amazing right adjoint: https://ncatlab.org/nlab/show/amazing+right+adjoint]

Remark: en général dans une catégorie extensive, on dit que X est connected as soon as hom(X,−) preserves binary coproducts, et tiny (ou small-projective) si hom(X,−) préserve les small colimits.

Note: a coproduct-preserving functor between toposes preserves coequalizers as soon as it preserves epimorphisms, since any coequalizer can be constructed as the quotient of an equivalence relation generated using images and countable coproducts and quotients of equivalence relations are effective. Thus, we can say that a Grothendieck topos is local iff hom(1,−) preserves binary coproducts and epis. Moreover, a cospan A→C←BA \to C \leftarrow B in a topos is a coproduct diagram iff A and BB are disjoint monos whose union is all of C; thus hom(1,−) preserves binary coproducts as soon as it preserves the initial object and binary unions. This leads to the following equivalent form of “locality” that makes sense even for elementary toposes:

Definition/Theorem 1.4. An elementary topos E is local if the terminal
object 1 is
  - nonempty: 1≇0
  - connected: 1=p∨q implies 1=p or 1=q and
  - projective: every epi U→1 admits a section t:1→U

Proposition 4.6. For ℰ a Grothendieck topos and X∈ℰ an object, the over topos ℰ/X is local if X is a tiny object.

* https://ncatlab.org/nlab/show/local+site
A site is called a local site if
  - it has a terminal object *;
  - the only covering family of * is the trivial cover.

* https://ncatlab.org/nlab/show/cohesive+site
* https://ncatlab.org/nlab/show/cohesive+topos

A topos ℰ over some base topos 𝒮, i.e. equipped with a geometric morphism (f^*⊣f_*):ℰ⟶f_*←f^* 𝒮 is cohesive if it is a strongly connected topos and a local topos.

Classifying topos
-----------------

Si E est un topos avec un natural number object, on peut construire
E[U] le topos classifiant des objets; U est l'objet générique
et V objet de F <=> map F->E[U].
La construction s'étend pour avoir un topos classifiant d'une géométrie
algébrique finie et finiment présentée.

Note: si on a un topos de Grothendieck comme base, par ex Set, on peut
enlever 'fini' pour la théorie.

Theorem (Object classifiers).
Let S be a topos with an NNO and let BTop_S be the 2-category of bounded S-toposes. Then, the forgetful functor BTop_S → Cat is bicategorically represented by a bounded S-topos S[O]; in particular, it must send bicategorical colimits in BTop_S to bicategorical limits in Cat.
Proof. See Example 3.2.9 in [Johnstone, 2002a, Part B].

* Diaconescu theorem

Si f: F->E est géométrique, C catégorie interne à E, alors
[F, E^C]_E =~ {internal presheaves on f*C which are flat}

* Coherent logic
https://ncatlab.org/nlab/show/coherent+logic
∧ (and), ∨ (or), ⊤ (true), ⊥ (false), ∃ (existential quantifier).
- Every finitary first-order theory is equivalent, over classical logic, to a coherent theory
- every coherent topos has enough points (Deligne). In particular, this applies to the classifying toposes of coherent theories. It follows that models in Set are sufficient to detect provability in coherent logic [en particulier on peut raisonner comme en logique booléenne avec le LEM].
- Coherent logic also satisfies a definability theorem: if a relation can be constructed in every Set-model of a coherent theory T, in a natural way, then that relation is named by some coherent formula in T
- It follows that if a morphism of coherent theories (i.e. an interpretation of one coherent theory in another) induces an equivalence of their categories of models in Set, then it is a Morita equivalence of theories (i.e. induces an equivalence of classifying toposes, hence an equivalence of categories of models in all Grothendieck toposes).
Attention: The category of models of a coherent theory (in Set) is always an accessible category (this is true more generally for models of any logical theory). However, it need not be finitely accessible (i.e. ω-accessible).

* https://ncatlab.org/nlab/show/coherent+topos
A coherent topos is a sheaf topos with a site of definition that is a coherent category with coherent coverage.
Theorem 2.1. Deligne completeness theorem
  Every coherent topos has enough points.
Examples: The classifying topos of a coherent theory is a coherent topos.

* https://ncatlab.org/nlab/show/classifying+topos

Exemple: si G groupe discret, G-Bund(X)=G-torsor in Sh(X)≃Topos(Sh(X),BG).
pour X espace topologique (ou localic)

$ 2. Definition
Every sheaf topos F is a completion S[T] of the syntactic category C_T of some geometric theory T: F≃S[T]
And structures of type T in E is what geometric morphisms E→F classify.

If C_T is the syntactic category of T, so that T-models are the same as geometric functors out of C_T, then this universal model can be identified with a certain geometric functor U:C_T→S[T].
Its universality property means that any geometric functor X:C_T→E factors essentially uniquely as X:C_T →U S[T] →f* E

More specifically, for any cartesian theory, regular theory or coherent theory 𝕋 (which in ascending order are special cases of each other and all of geometric theories), the corresponding syntactic category 𝒞_𝕋 comes equipped with the structure of a syntactic site (𝒞,𝕋,J) and the classifying topos for 𝕋 is the sheaf topos Sh(𝒞_𝕋,J).

$ 3. Background on the theory of theories
- Finite product theory = Lawrere theory = algebraic theory. 
  Classifying theory: C_fp[T] with finite products; models: product preserving functors C_fp[T]->E

- Finite limit theory = essentially algebraic theory = locally finitely presentable categories
  Classifying theory: C_fl[T] with finite limits; models: left-exact functors C_fp[T]->E

- Geometric theory
  Classifying theory: Grothendieck topos S[T]; models: geometric functors E->S[T]

Each type of theory may be considered a 22-theory, or doctrine. Furthermore, each type of theory can be promoted to a theory “further up the line”, by freely adding the missing structure to the classifying category. This can always be done purely formally, but in a few cases this promotion also has other, more explicit descriptions.

For instance, to go from a finite products theory T to the corresponding finite limits theory, we can take the opposite of the category of finitely presentable models of T in Set, thanks to Gabriel-Ulmer duality. Similarly, to go from a finite limits theory to the classifying topos of the corresponding geometric theory, we can take the category of presheaves on the classifying category of the finite limits theory.

$ 4.1 Geometric morphisms equivalent to morphisms of sites
Proposition 4.1. Let (𝒞,J) and (𝒟,K) be cartesian sites such that 𝒞 is a small category, 𝒟 is an essentially small category and the coverage K is subcanonical.
Then a geometric morphism of the corresponding sheaf toposes f:Sh(𝒟,K)→Sh(𝒞,J)
is induced by a morphism of sites (𝒟,K)←(𝒞,J)
precisely if the inverse image of f respects the Yoneda embeddings j as
𝒟       ←   𝒟
↓ j_𝒟       ↓ j_𝒞 
Sh(𝒟,K) ←f* Sh(𝒞,J).

Corollary 4.2. Let (𝒞,J) be a small cartesian site and let ℰ be any sheaf topos. Then we have an equivalence of categories
Topos(ℰ,Sh(𝒞,J))≃Site((𝒞,J),(ℰ,C))
between the geometric morphisms from ℰ to Sh(𝒞,J) and the morphisms of sites from (𝒞,J) to the big site (ℰ,C) for C the canonical coverage on ℰ.

Remark 4.3. This means that a sheaf topos Sh(𝒞,J) is the classifying topos for the theory of local algebras determined by the site (𝒞,J).

$ 5. Examples
- Object: The presheaf topos [FinSet, Set] on the opposite category of FinSet is the classifying topos for the theory of object, ie geometric morphism E->[FinSet,Set]= object of E
- Pointed objects: Similarly, the presheaf topos [FinSet*,Set] (where FinSet* is the category of finite pointed sets) classifies pointed object
- For groups: Si C(Gp) est la catégorie de Lawrere des groupes, alors les
  modèles dans Set est la catégorie des groupes, et on prend Cl(Gp) la
  sous-catégorie (small) des groupes finiment présentables. Alors Cl(Gp)
  est une extension de C(Gp) qui admet les limites finies; et le topos
  classifiant est sa catégorie de préfaisceaux.
- (inhabited) linear orders: The category of cosimplicial sets [Δ,Set] – hence the presheaf topos over the opposite category Δ^op of the simplex
  category – is the classifying topos for inhabited linear orders (ie x<y).
- Set^Δ^op, the category of simplicial sets, is the classifying topos for linear intervals =totally ordered set with distinct top and bottom elements
- The category of cyclic sets is the classifying topos for abstract circles 
- the classifying topos for local rings is the big Zariski topos of the scheme Spec(ℤ).
- For Spec R an affine scheme, the étale topos Sh(X_{et}) classifies “strict local R-algebras”. The points of this topos are strict Henselian R-algebras.

* For principal bundles:
Essentially every topos may be regarded as a classifying topos for certain torsors/principal bundles.
- Over bare groups:
For any (bare / discrete) group G, write BG for its delooping groupoid, the groupoid with a single object and G as its endomorphisms. The presheaf topos
GSet:=PSh(BG) is the classifying topos for G-torsors. Note: it is not hard
to describe a geometric theory whose models are G-torsors.
Th 5.2: There is a canonical geometric morphisms PSh(BG)→Sh(ℬG), where ℬG
is the classifying group in topological spaces. This is a weak homotopy equivalence of toposes, in that it induces isomorphisms on geometric homotopy groups of the terminal object.
- Over topological groups:
If G is a general topological group we have a simplicial topological space G^×•. The category Sh(G^×•) of sheaves on this simplicial space is a topos which classify G-principal bundles.
- For general localic groupoids: any Grothendieck topos can be thought of as a classifying topos for some localic groupoid
- For flat functors. As a special case of the above, any presheaf topos,
  i.e. any topos of the form Set^C^op, is the classifying topos for flat
  functors from C. This is Diaconescu's theorem. If CC has finite limits,
  then a flat functor C→E is the same as a functor that preserves finite
  limits.
- For geometric theories / cover-preserving flat functors on a site:
  Proposition 5.3. Every sheaf topos has a cartesian site (𝒞,J)
This Sh(𝒞,J) is the classifying topos for cover-preserving flat functors out of 𝒞. Every category of such functors is the category of models of some geometric theory, and for every geometric theory there is such a cartesian site.
- For local algebras
As a special case or rather re-interpretation of the above, let 𝒯 be any essentially algebraic theory and equip its syntactic category 𝒞_𝕋 with some coverage J. Then the sheaf topos Sh(𝒞_𝕋,J) is the classifying topos for local 𝕋-algebras:
for Sh(X) any sheaf topos a geometric morphism 𝒪:Sh(X)→Sh(𝒞_𝕋,J)
is a 𝕋-algebra in Sh(X), hence a sheaf of 𝕋-algebras over the site X; such that this sheaf of algebras is local as seen by the respective topologies.

* https://ncatlab.org/nlab/show/geometric+theory
- A geometric theory is a (possibly infinitary) first order theory whose models are preserved and reflected by geometric morphisms.
- A geometric theory is a (possibly infinitary) first order theory whose axioms can be written as sequents in context of formulae constructed from the connectives ⊤ (truth), ∧ (finite conjunction), ⊥ (falsity), ⋁ (possibly infinitary disjunction), and ∃ (existential quantification), as well as == (equality).
- A geometric theory is a syntactic description of a Grothendieck topos.

$ Logical definition
- Since ∧ and ⊤ are represented by intersections and identities (top elements), and == is represented by equalizer, these can be interpreted in any lex category. Theories involving only these are examples of cartesian theories.
- Since ∃ is represented by the image of a subobject, it can be interpreted in any regular category. Theories involving only ∧, ⊤, and ∃s are regular theories.
- Since ∨ and ⊥ are represented by union and bottom elements, these can be interpreted in any coherent category. Theories which add these to regular logic are called coherent theories.
- Finally, theories which also involve infinitary ⋁, which is again represented by an infinitary union, can be interpreted in infinitary coherent categories, aka geometric categories. These are geometric theories.

Axioms: φ ⊢_x ψ, ie ∀x.(φ⇒ψ)

$ Examples
- Any finitary algebraic theory is, in particular, a cartesian theory, and hence geometric. This includes monoids, groups, abelian groups, rings, commutative rings, etc.
- The theory of (strict) categories is not finitary-algebraic, but it is cartesian, and hence geometric; this generalises to (finitary) essentially algebraic theories.
- The theory of torsion-free abelian groups is also cartesian, being obtained from the theory of abelian groups by the addition of the sequents (n⋅x=0)⊢_x (x=0) for all n∈ℕ.
- The theory of local rings is a coherent theory
- The theory of fields is also coherent
- The theory of torsion abelian groups is geometric but not coherent
- The theory of a real number is geometric.
  The classifying topos of this theory is the topos of sheaves on the real numbers.
- The theory of a set isomorphic to ℕ is geometric
- The theory of flat diagrams over a small category 𝒞 is geometric.
  This theory is classified by the topos of presheaves over 𝒞
  It is commonly more useful to consider the theory of flat presheaves over 𝒞, in other words the flat diagrams over 𝒞^op}. (Elephant calls these torsors over 𝒞, generalizing the established terminology for groups.) This is because the representable presheaves are flat, and so Yoneda’s lemma transforms objects of 𝒞 covariantly into models of the theory. In fact, the models of the theory are the filtered colimits of representables. For example, a finitary algebraic theory is classified by the topos of covariant functors from the category of finitely presented algebras to Set.

$ In terms of sheaf topoi

Categories of each “logical” type can also be “completed” with respect to a suitable “exactness” property, without changing their internal logic. Any regular category has an completion into an exact category (see regular and exact completion), any coherent category has a completion into a pretopos, and any geometric category has a completion into an infinitary pretopos.

However, Giraud's theorem says that an infinitary pretopos having a generating set is precisely a Grothendieck topos. Moreover, a functor between Grothendieck topoi is geometric (preserves all the structure of a geometric category) iff it preserves finite limits and small colimits. By the adjoint functor theorem, this implies that it is the inverse image part of a geometric morphism, i.e. an adjunction f^*⊣f_* in which f^* (the “inverse image”) preserves finite limits.

Thus: Grothendieck topoi and inverse-image functors are in some sense the “natural home” for models of geometric theories.

In particular, we can apply the “exact completion” operation to the syntactic category G_T of a geometric theory to obtain an infinitary pretopos Set[T]. As long as the theory T was itself small, Set[T] will have a generating set, and therefore will be a Grothendieck topos. The universal property of the syntactic category, combined with that of the exact completion, implies that for any Grothendieck topos E, geometric morphisms E→Set[T] are equivalent to T-models in E. This topos Set[T] is called the classifying topos of T.

In the other direction, if C is any small site, we can write down a “geometric theory of cover-preserving flat functors C^op→Set.” By Diaconescu's theorem classifying geometric morphisms into sheaf topoi, it follows that Sh(C) is a classifying topos for this theory.

Barr's theorem says, that if a statement in geometric logic is deducible from a geometric theory using classical logic and the axiom of choice, then it is also
deducible from it in constructive mathematics.

* https://ncatlab.org/nlab/show/Barr%27s+theorem

Barr’s theorem was originally conjectured by William Lawvere as an infinitary generalization of the Deligne completeness theorem for coherent toposes which can be expressed as the existence of a surjection 𝒮/K→ℰ for a coherent topos ℰ with set of points K. General toposes ℰ may fail to have enough points but Michael Barr showed that a surjection from a suitable Boolean topos still exists.
As surjections permit the transfer of logical properties, Barr’s theorem has the following important consequence:
"If a statement in geometric logic is deducible from a geometric theory using classical logic and the axiom of choice, then it is also deducible from it in constructive mathematic"

Theorem 2.1. If ℰ is a Grothendieck topos, then there is a surjective geometric morphism ℱ→ℰ where ℱ satisfies the axiom of choice.

Deligne's completeness theorem says that a coherent Grothendieck topos has enough points in Set and this corresponds to the Gödel-Henkin completeness theorem for first-order theories. Similarly, Barr’s theorem can interpreted as saying that a Grothendieck topos has sufficient Boolean-valued points and is in turn closely related to Mansfield’s Boolean-valued completeness theorem for infinitary first-order theories.

=> Ainsi une théorie géométrique démontrable en logique classique est vraie
en logique booléenne.
=> Pour une théorie cohérente, comme every Grothendieck topos with enough points is equivalent to the classifying topos of a topological groupoid, on a un modèle universel topologique. On peut le construire explicitement, cf 'Moerdijk, Classyfing space for topos with enough points'.
 Conséquence: a finitary geometric theory 𝕋 has models in Set and the provability of a sequent in coherent logic relative to 𝕋 is equivalent to its validity in all set-theoretical models of 𝕋. En effet son topos classifiant est cohérent, et il a assez de points.

* Références:
https://www.oliviacaramello.com/Teaching/CambridgeToposTheoryCourseLectures21and22.pdf
Topos Theory, Lectures 21 and 22: Classifying toposes; Olivia Caramello

Let T be a first order theory, then there exists a Morleyisation T' of T
such that T' is a coherent theory and T'-Mod(Set)={T-mod(Set) with
elementary embeddings as morphisms}

- Properties of syntactic categories:
  if T is Horn/regular/coherent/first-order/geometric, C_T is
  cartesian/regular/coherent/Heyting/geometric

  We can then assign the regular/coherent/geometric topology on C_T
  (=1/finite/small families of regular épi)

  Fact: a cartesian functor C_T->D is regular/coherent/geometric (where D
  is regular/...) if and only if it sens the J_T-reg topology (resp. ...) to covering families.

  In particular T-mod(D) =~ Cart(C_T, D) for T horn, T-mod(D) =~ Reg(C_T,D)
  for T regular, resp. coherent, geometric.
  Corollary: for T reg/coh/geometric, Sh(C_T, J_T^reg/coh/...) classifies T.
  A Horn theory is classified by the presheaf [C_T^op, Set] (ie no topology)

  Duality: quotient of T corresponds to subtoposes of Set[T].

  Theorem: localic toposes = classifying toposes for propositional theories
  (ie geometric theory over a signature with no sorts)

  Theorem: for a Horn theory T, C_T^op =~ finitely presented T-models in Set,
  in particular Set[T]=~ [f.p. T-mod(Set), Set]

  Theorem: if T is of presheaf type, finitely presentable T-model <=>
  presented by a T-irreducible geometric formula.
  In particular, f.p. T-mod(Set)=subcategory of C_T of the T-irreductible
  formula. Fact: Set[T]=~ [f.p. T-mod(Set), Set]

* https://golem.ph.utexas.edu/category/2007/10/geometric_representation_theor_2.html#c012724
  Pour une discussion intéressante sur les topos classifiants et les catégories monoidales symmétriques

Algèbres dans un topos
----------------------

*https://ncatlab.org/nlab/show/locally+algebra-ed+topos

Let 𝒞_𝕋 be the syntactic category of an essentially algebraic theory 𝕋, hence any category with finite limits. Let J be a subcanonical coverage on 𝒞_𝕋.
Then the sheaf topos Sh(𝒞_𝕋,J) is the classifying topos for the geometric theory of 𝕋-local algebras. Indeed a geometric morphism corresponds to a functor
𝒪_X:𝒞_𝕋→ℰ such that
  - it preserves finite limits (and hence produces a 𝕋-algebra in ℰ;
  - it sends J-coverings to epimorphisms; which makes it a local 𝕋-algebra.

* https://ncatlab.org/nlab/show/locally+ringed+topos

A ringed topos (X,𝒪_X) with enough points (such as the sheaf topos over a topological space) is a locally ringed topos if all stalks 𝒪_X(x) are local rings.

This is a geometric theory:
(0=1)⊢false; x+y=1⊢∃_z (xz=1) ∨ ∃_z (yz=1)


Espace classifiant d'un groupoide continu
-----------------------------------------

* https://ncatlab.org/nlab/show/classifying+topos+of+a+localic+groupoid

Let N•𝒢:Δ^op→Locales be the simplicial object in locales given by the nerve of 𝒢. By applying the sheaf topos functor Sh:Locale→Topos to this, we obtain a simplicial topos Sh(N𝒢):[n]↦Sh(N_n𝒢). Let tr_2 Sh(N𝒢) be its 2-truncation, then the 2-colimit Sh(𝒢)≔lim⟶ n tr_2 Sh(N•𝒢) in the 2-category Topos is called the classifying topos of 𝒢.

Explicitely: For E∈Sh(𝒢_0) a sheaf on the topological space of its objects, say that a 𝒢_1-action on E is a continuous groupoid action of 𝒢• on the etale space Sp(E)→𝒢_00 over 𝒢_0 that corresponds to the sheaf E, hence for each morphisms f:x→y a continuous function ρ(f):Sp(E)_x→Sp(E)_y that satisfies the usual action property. These sheaves with 𝒢_1-action and with the evident homomorphisms between them form a category, and this is Sh(𝒢).

- Proposition (Joyal-Tierney 84)
For every Grothendieck topos ℰ there is a localic groupoid 𝒢 such that ℰ≃Sh(𝒢)

- Proposition (Moerdijk 88, theorem 5)
This construction extends to an equivalence of 2-categories between that of Grothendieck toposes Topos and a localization of that of localic groupoids.

- Proposition (Butz-Moerdijk 98) If ℰ has enough points, then there exists in fact a topological groupoid 𝒢 such that ℰ≃Sh(𝒢).

* Références:
https://math.stackexchange.com/questions/2791236/morita-equivalence-of-groupoids-and-classifying-topoi-correct-definition
https://mathoverflow.net/questions/84197/toposes-topoi-as-classifying-toposes-of-groupoids (the groupoid associated to the topos of presheaves on a monoid)
https://mathoverflow.net/questions/40452/who-first-came-up-with-the-idea-of-essential-morita-equivalence-of-internal-grou

Zhen Lin Low: http://zll22.user.srcf.net/dpmms/slides/2013-06-19-ToposesAsGroupoids.pdf

Internal logic
--------------

** Externalisation of an internal category

* https://ncatlab.org/nlab/show/small+fibration
A fibered category is a small fibration if it is equivalent to a fibered category which is obtained via a specific construction of the externalization of an internal category.
-> fibered category P:F→E, whose fiber over an object I (“index set”) in C is the small category C^I=hom_E(I,C) whose object part is C_0^I and morphism part is C_1^I; and the structure maps of C^I are obtained by postcomposing with structure maps of C.

* https://ncatlab.org/nlab/show/internal+site#externalization

Definition 3.1. Let 𝒞 be a small category and let ℰ:=[𝒞^op,Set] be its presheaf topos. Let 𝔻∈ℰ be an internal site. Regarded, by the Yoneda lemma, as a functor 𝔻:𝒞^op→Cat, this induces via the Grothendieck construction a fibered category which we denote 𝒞⋊𝔻→𝒞.

Example 3.2. Let G be a group (in Set, hence a discrete group) and let 𝒞:=BG be its delooping groupoid. Then
ℰ≃[BG,Set] is the topos of permutation representations of G. Let H∈ℰ be a group object. This is equivalently a group in Set equipped with a G-action. Its internal delooping gives the internal groupoid 𝔻:=ℬH in ℰ.
In this case we have that 𝒞⋊𝔻≃B(G⋊H) is the delooping groupoid of the semidirect product group of the G-action on H.

Proposition 3.4. We have an equivalence of categories
[𝔻^op,[𝒞^op,Set]]≃[(𝒞⋊𝔻)^op,Set] between the category of internal presheaves in ℰ over the internal category 𝔻, and external presheaves over the semidirect product site 𝒞⋊𝔻.

Proposition 3.6. Let ℰ=Sh_J(𝒞) be a sheaf topos and (𝔻,K) an internal site in ℰ. Then with def. 3.5 we have an equivalence of categories
Sh_K(𝔻)≃Sh_J⋊K(𝒞⋊𝔻) between internal sheaves in ℰ on 𝔻 and external sheaves on the semidirect product site J⋊K.
Moreover, the projection functor P:𝒞⋊𝔻 is cover-reflecting and induces a geometric morphism Γ:Sh_K(𝔻)→ℰ.

Stacks and topos
----------------

** Internal groupoids and stacks

* https://mathoverflow.net/questions/93948/link-between-internal-groupoids-and-stacks-on-a-topos
The 2-category of internal groupoids in Sh(C,J) is equivalent to the 2-category of sheaves of groupoids on (C,J). To see this, given a groupoid G in sheaves,the strict 2-functor C↦(G0(C)⇉G1(C)) is a sheaf of groupoids. So, there is a 2-functor
  F: Gpd(Sh(C,J)) → Sh_J(C,Gpd) → St(C,J)
which sends G↦a((G0(⋅)⇉G1(⋅)), where a is the stackification 2-functor.

I claim that a is essentially surjective. Indeed, by the Grothendieck construction, one can see easily that every stack is equivalent to a strict 2-functor from C^op into the 2-category Gpd of groupoids. Such a strict 2-functor, is the same as a functor into the 1-category of groupoids, which is the same as a groupoid object in presheaves (by the same argument). One can sheafify this into a sheaf of groupoids, and then apply F to it, and the result is equivalent to the starting stack.

The fact fact that stacks are equivalent to groupoids in sheaves up to "weak categorical equivalence" can be found in (I believe) in Bunge's Stack completions and Morita equivalence for categories in a topos, but can also be proven directly by examining F.

* https://ncatlab.org/nlab/show/internal+category#InATopos
If the ambient category is a topos, then with the right kind of notion of internal functor, the internal groupoids form the corresponding (2,1)-topos of groupoid-valued stacks and the internal categories form the corresponding 2-topos of category-valued stacks/2-sheaves.

* https://ncatlab.org/nlab/show/2-topos#InTermsOfInternalCategories
Given a 2-topos 𝒳, regard it is a 2-site by equipping it with its canonical topology.
A 2-sheaf 2-topos is “(n,r)-localic” if it has an (n,r)-site of definition.

Definition 2.1. Write Cat(𝒳) for the 2-category of internal categories in 𝒳, precisely: the 2-category of 2-congruences and internal anafunctors between them.

Theorem 2.2. For 𝒳 a 2-topos, there is an equivalence of 2-categories 𝒳≃Cat(𝒳).
- If 𝒳 is (2,1)-localic, with a (2,1)-site of definition C, then there is already an equivalence 𝒳≃Cat(Sh_(2,1)(C))
with the 2-category of categories internal to the underlying (2,1)-topos.
- If 𝒳 is 1-localic, with 1-site of definition, then there is even already an equivalence 𝒳≃Cat(Sh(C)) with the internal categories in the underlying sheaf topos.

Proof. By the 2-Giraud theorem, 𝒳 is an exact 2-category. With this, the first statement is this theorem at 2-congruence.
By the discussion at n-localic 2-topos, a 2-sheaf 2-topos has enough groupoids precisely if it has a (2,1)-site of definition, and has enough discretes precisely if it has a 1-site of definition. With this the second and third statement is this theorem at 2-congruence.  ▮

Remark 2.3. The noteworthy point about theorem 2.2 is that for an ambient context which is a (2,1)-localic (2,1)-topos, the straightforward morphisms of internal categories, hence the notion of internal functors, needs no further localization. This is in stark contrast to the situation for an ambient 1-category. The generalization of this phenomenon is discussed at category object in an (∞,1)-category.

* https://ncatlab.org/nlab/show/2-sheaf
Proposition 3.1. If C is a topos and E is a C-topos, then (the indexed category corresponding to) E is a 2-sheaf on C with respect to the canonical topology.
Moreover, over a 1-site the 2-topos of 2-sheaves ought to be equivalent to the (suitably defined) 2-category of internal categories in the underlying 1-topos.
Over a (2,1)-site the 2-topos of 2-sheaves ought to be equivalent to the 2-category of internal (infinity,1)-categories in the corresponding (2,1)-topos.

Référence: https://ac.els-cdn.com/0022404982901013/1-s2.0-0022404982901013-main.pdf?_tid=6e8c93d6-9efe-40fd-8dc1-8f5d686b7d42&acdnat=1552034787_b099e204251a81e827f57972decbf64a
TWO-DIMENSIONAL SHEAF THEORY, Ross STREET

* https://ncatlab.org/nlab/show/2-congruence
TODO: 2-congruence

Galois
------

* Références:
- Eduardo Dubuc, C. S. de la Vega, On the Galois theory of Grothendieck, Bol. Acad. Nac. Cienc. (Cordoba) 65 (2000) 111–136. arXiv:math.CT/0009145
- Marco Antònio Delgado Robalo, Galois theory towards dessins d’enfants, masters thesis, Lisboa 2009, pdf
- https://ncatlab.org/nlab/show/Galois+theory#GaloisInTopos
- https://ncatlab.org/nlab/show/Grothendieck's+Galois+theory

Let C be a category and F:C→Set a functor.
G0) The full subcategory of ∫_F C on the finite objects [X finite if F(X)
finite set] is cofinal.
G1) C has all finite limits
G2) C has an initial object, finite coproducts and quotients by finite groups
G3) Given f:x→z in C there is a factorisation x →e y →i z where e is a strict epimorphism and i is a mono. Also, y is assumed to be a direct summand of z.
G4) F preserves finite limits
G5) F preserves initial object, finite sums, quotients by finite group actions and sends strict epimorphisms to surjections
G6) F reflects isomorphisms

The functor F is called the fibre functor, and the pair (C,F) is sometimes called a Galois category.
It follows from the axioms that F is a pro-representable functor. The automorphism group of the pro-object P representing F is (should be. I’m not familiar enough with pro-objects) a profinite group π. This acts on F(X)=[P,−] by precomposition (talking out of my depth here – it’s getting a bit vague) and so F lifts to a functor to π−Set, and Grothendieck’s result is that this functor is an equivalence of categories.
There are several modifications one can make the above. In the case that C is the category of covering spaces of a nice enough space, the functor F is representable by the universal covering space, and so there is a ‘representable’ version of the above, not needing to utilise profinite groups. One can also consider just the connected-objects version, and end up with an equivalence to the category of transitive π-sets.

- https://ncatlab.org/nlab/show/fundamental+group+of+a+topos

Résumé: Groupoids, Stacks and Galois
------------------------------------

### Stacks

Déf: si S est une catégorie régulière, une fibration A/S est un stack si
pour tout f:J->>I, A^I =~ Des(f).
Reformulation: f induit une équivalence faible entre les catégories internes 
J_f = J x_I J => J et I, et A/S stack si le foncteur induit A^f: A^I ->
A^J_f est une équivalence.

Exemple: si S, S' régulières, F:S->S' un foncteur exact, et S' finitely
complete exact, alors S'/S est un stack (S-indexée par I->S'/F(I))

Th: A fibration A/S is a stack iff for every weak equivalence functor F:B->C in S, A^F: A^C->A^B is an equivalence of fibration.
Corollaire: si F:A->B est une weak equivalence et B est un stack, alors B
est la stack complétion.

* Si S est un topos, alors:
- Si A/S est une fibration localement small, sa stack complétion est donnée par
Yoneda: A -> préfaisceaux loc. représentables dans S^A°
Def: an object I-indexed X of (S^A°)^I is locally representable if there exists
f:K->>I and x \in A^K tel que Yon^K(x)=~f*X.

- Si G est un groupe ou un groupoïde dans S, alors sa stack complétion est donnée par les right-G-torsors dans S. En effet, S^G° =~ BG, et les G-torseurs
correspondent aux éléments localement représentables.
Si S a la ASC (un groupoid G a une internal stack complétion Gtilde), alors
Hom_S(Gtilde, Htilde) =~ Top_S(BG, BH).

* Si f:E->S est un topos, Pointess_S(E) est un stack pour la topologie
canonique de S. Pointess_S(E)^I={morphismes loc. connexes S/I->E au dessus
de S}.
- Tout point essentiel f:S/I->E est indexed-représentable: il
existe X dans E/f*I tel que f*: E->S/I est donné par
f*(Y)=Hom_{E/f*I}(X->f*I, Y x f*I -> f*I).
- Si C est une catégorie interne de S, sa stack complétion donnée par Yoneda
plus haut se reformule comme les points de Pointess_S(S^C°) qui sont
localement représentables.

Plus exactement tel qu'on ait le diagramme:
φ: S/I -> S^C°
   S/K -> S/C0
où K->>I et K->C0 rendent X->Delta I loc représentable.
Ainsi un point S-essentiel est loc représentable si il vient d'un tel
diagramme, où S/K->S/C0->S^C° se voit comme un point représentable.

- De plus dans ce cas Pointess_S(S^C°) =~ S-atomic points de S^C°
  = locally the retract of representables
  et la Karoubian completion de C est donnée par les retract of representables dans S^C°,
  et donc Pointess_S(S^C°) est la stack complétion de la Karoubian completion de C.
- Donc si G est un groupoïde (discret) dans S, sa stack complétion est
  Pointess_S(BG) = Point_S(BG) =~ G-torsors =~ LocRep(S^G°) [Rappel: S^G° =~ BG]

### Locales:

Déf: f:X->Y est étale si on a un recouvrement ouvert de X par des U_i tels que
f:U_i->f(U_i) est un iso; c'est équivalent à f et Δ_f: X->X x_Y X sont
ouverts. Sh(X) =~ espaces étales sur X.

* Localic reflection:
Si f:F->E, on a une adjonction f_! -| f^# entre les espaces internes à F et
les espaces internes à E; O(f_! Y)=f_* OY.
Par la hyperconnected localic-factorisation, on a une réflexion de f vers
un morphisme localic Sh(X)->E où X est une locale interne à E. Cette
réflexion est stable par pullback et produit, et préserve et reflète les
limites.

### Groupoides localic:

Rappel des définitions: un groupoid est donné par G_1=>G_0 avec d0 et d1
les domain/codomain map, une unit map s:G0->G1 et une multiplication
m: G_1 x_G0 G_1 -> G_1. L'existence d'un inverse i:G1->G1 peut s'écrire
comme le fait que (m,\pi_2) et (\pi_1, m): G1 x_G0 G1 -> G1 x_G0 G1
sont des isomorphismes au dessus de G1.

* Si G est un groupoid localic continu, on peut construire BG comme
1) la colimite du topos simplicial Sh(NG)=N Sh(G);
  ou encore comme le topos de descente donné par la colimite
  Sh(G_1 x_G0 G_1) ≡> Sh(G_1) => Sh(G_0) ->> BG
  du simplexe tronqué.
  Note: Sh(G_0)->BG est une surjection ouverte si G est ouvert, donc BG est
  aussi BGhat où Ghat est le groupoid associé à ce morphisme de descente
  [=étale complétion de G].

2) l'espace des G-actions étales (si G ouvert) ie les faisceaux munis d'une
  G-action.
  A G-space est un espace p:E->G0 muni d'une action E x_G0 G1 -> E qui
  satisfait les conditions usuelles;
  En logique interne: pour tout h:z->y et g:y->x dans G1, et e \in
  p^{-1}(x), alors p(e.g)=y, e.s(x)=e, (e.g).h=e.(goh).
  BG: G-space p:E->G0 où p étale.

* Stabilité: Si p:F->E, et G groupoide continu dans E, B(F,p^# G)=F x_E B(E,G)

  Corollaire (Localisation): Si E est un G-space, E x_G0 G1 => E définit un groupoide E_G, et
  G-space/E =~ E_G-space, et la bijection est stable par pullback.
  En se restreignant aux espaces étales: BG/E =~ B E_G, bijection stable
  par pullback.

* Equivalences:
- (Etale complete groupoid, weak equiv^{-1})->(Top, isomorphic class of geom morphism) est une équivalence de 1-catégorie.
- The bicategory of continuous groupoids and complete flat bispaces is equivalent to the dual of the bicategory of toposes and geometric morphisms.

* Classification: si G groupoid localic ouvert continu, BG classifie les Ghat principal bundle, où Ghat est sa complétion étale.

Si on note + les morphismes qui respectent le "bag of points" Sh(G0)->G, alors
Hom(G,H) =~ Top[BH, BG]+ (G, H groupoides ouvert, G étale complète). (le []
signifie que l'on considère Top comme une 2-1 catégorie ici).

### Stacks and topos

Pour la topologie des surjections ouvertes de la catégorie Space des espaces (localic)
  - Space indexée sur elle-même est un stack
  - SPoints(E)={Sh(X)->E où X spatial}=Space/E est un stack pour un topos E.

Si G est un groupoid ouvert,
  - Si E est un topos, SPoints(E)^G =~ Top(BG,E)
  - la catégorie Space^G° des right G-space [=G-bundle] (ie T->X, où T est muni
    d'une G-action à droite compatible avec la projection vers X) est un
    stack
  - La stack complétion de [G] (externalisation de G) est donné par les
    G-torseurs (ie les G-bundle principaux) qui sont exactement les
    éléments localement représentables dans Space^G°.
  - [Ghat] =~ SPoints(BG)+ [où on voit un espace X comme un groupoid trivial]
    où Ghat est la complétion étale de G.
  - Tor(Ghat) =~ SPoints(BG) (car ce sont deux stack complétions de [Ghat])
    d'où Tor(X, Ghat)=~Top(Sh(X), BG),
    et donc Tor(Ghat)^H=Top[BH, BG] où Tor(Ghat)^H est la catégorie des
    H-Ghat bispaces.

Theorem C (Bunge 1990): For an étale complète groupoid G which is not empty
and connected, LocRep(S^G°)=~Tors(G)=~Points(S^G°).

### Descente:

- Si E. est un topos simplicial alors sa colimite est un topos équivalent
  aux données de descente Des(E.) le cocone de descente universel:
  Concrètement Des(E_.) est la catégorie des objets (X,f) de E_0, avec f un
  isomorphisme d_1*(X) =~ d_2*(X) tel que s*(f)=Id et d_0*(f) o
  d_2*(f)=d_1*(f), autrement dit c'est la colimite E_2 ≡> E_1 => E_0 -> Desc(E).

- Localisation lemma: si (X,f) \in Des(E_.), alors Desc(E_./(X,f))=Desc(E_.)/(X,f).

* Joyal-Tierney: 
  1) un morphisme ouvert surjectif est de descente effective
  2) tout topos E admet une map T->E connected loc. connected (donc open surjectif) depuis un espace (localic).
  3) Si f:T->E est de descente effective, E=BG où G est le groupoid T x_E T => T
     Si T localic et f ouverte surjective, G est un groupoid localic ouvert étale complete. Si f connected loc. connected, G l'est aussi, et si E->S est ouvert on peut prendre G0 ouvert.

### Galois

G progroupe strict <=> G groupe localic prodiscret (<=> the open normal subgroups form a neighboorhood of e:1->G.)
BG =~ lim_proj BG_i.

Soit E loc. connected au-dessus de S.
Si U->>1, dans le pushout
  E/U -> E
  S/e!_U -> GG_U
π_U:E->GG_U identifie π_U^-1 GG_U comme les objets loc. constants U-splits
de E. 
GG_U est donc un topos Galoisien atomic simplement connexe; GG_U=BG_U
où G_U étale complète discrete et p_U:S/e_!U ->GG_U s'identifie avec le bag
of points S[G0:=e_! U]->G_U. Explicitement on peut construire
G_U comme le groupoide des points, le localic groupoid des points, ou
encore Aut(p_U).

Si K est un groupe, Hom(G_U, K) =~ Top_S(BG_U, BK)+ =~ Tors(E,K)^U={les U-splits K-torsors dans E}
d'où H^1(E,K)^U = π_0(Hom(G_U, K)).

La limite filtrante des GG_U donne un topos ∏^c_1(E) égal aux objets loc.
constants de E. On a E->∏^c_1(E) connected locally connected, et ∏^c_1(E)
est un topos Galoisien. Il est représenté par un groupoid localic
prodiscrete π^c_1(E)
qui représente H^1(E,-) avec coefficient dans des groupes discrets (qui
sont des stacks).

Si G est prodiscret, [E, BG] =~  [∏^c_1, BG] =~ [π^1_E, G].

Theorem 4.10 (Bunge): E/S loc. connected bounded, S has ASC. (<=>)
- E/S est Galois (ie les objets galoisiens donnent un site de définition de E)
- E =~ \Pi_1^c(E)
- E est générée par les loc. constant covers (ie les objets loc constants forment un site de définition, en fait on aura même que tout objet est union d'objets loc constants)
- E=BG pour G prodiscrete localic groupoid.

(En particulier un topos Galoisien a toujours assez de points si G0 discrete.
Cf Moerdijk: E/S Galois pointed connected 
<=> E pointed connected loc. connected généré par les loc. trivial covers
<=> E=BG pour un groupe localic G prodiscrete)

Corollaire 4.11: E/S loc. connected bounded. (<=>)
- E/S loc simply connected et Galois
- E =~ \Pi_1^c(E) et E loc simply connected
- E=E_lc la sous catégorie des loc. constant objects
- E=BG pour G discrete localic groupoid.

* Multigalois
Definition 4.2.1. A Multigalois topos is a locally connected topos generated by its Galois objects, or, equivalently, it is a sum of Galois topoi.

Theorem 4.2.2 (discrete case) (<=>)
2. E is a locally simply-connected (Galois) Multigalois topos.
3. E is (connected) atomic with enough essential points.
4. The canonical geometric morphism μ:B(G)→E is an equivalence, where G is the (connected) discrete groupoid of points G = Points(E).
5. E is the classifying topos of any (connected) discrete groupoid

Theorem 4.2.3 (pointed prodiscrete case). (<=>)
1. E has enough points and it is (connected) generated by its locally constant objects.
2. E has enough points and it is a (Galois) Multigalois topos.
3. E is (connected) atomic with enough proessential points.
4. The canonical geometric morphism B(G) -μ→ E is an equivalence, where G is the (connected) localic groupoid of points G = lPoints(E), which in this case has prodiscrete “hom-spaces”.
5. E is the classifying topos of any (connected) localic groupoid with discrete space of objects and prodiscrete “hom-spaces”.

Theorem 4.2.4 (unpointed prodiscrete case). (<=>)
1. E is (connected) generated by its locally constant objects.
2. E is a (Galois) Multigalois topos.
4. The canonical geometric morphism B(G) μ−→ E is an equivalence, where G is the (connected) localic groupoid of phantom points G = phPoints(E), which is prodiscrete (by definition).
5. E is the classifying topos of any (connected) prodiscrete localic groupoid

Theorem 4.2.5 (pointed localic case). (<=>)
3. E is (connected) atomic with enough points.
4. The canonical geometric morphism B(G) μ−→ E is an equivalence, where G is the (connected) localic groupoid of points G = lPoints(E).
5. E is the classifying topos of any (connected) localic groupoid with discrete space of object.

### Fundamental path groupoid

Si E/S bounded, on a une notion de path fundamental group topos ∏_1^p(E),
défini comme la colimitte du diagramme de descente E^Δ ≡> E^I => E où I est
l'intervalle unité et Δ le 2-simplexe.

Si L est loc constant, il a le unique path lifting, donc ∏_1^p(E)/φ*(L) =~ ∏_1^p(E/L).

Si E locally connected, on a un morphisme ∏_1^p(E)->∏_1^c(E) (au-dessous de E).
C'est une équivalence si E est S-Galoisien.

Th: Si E loc connected et loc simply path connected, alors on a une équivalence ∏_1^p(E)->∏_1^c(E) 

Note: loc simply path connected =
i) loc simply connected (ce qui implique que si A est le cover universel, ∏_1^c(E/A)=S/e_!A; note que E/A -> E se voit comme le cover universel)
ii) on a l'équivalence \Pi_1^p(E/A)=S/e_!A.

Prop: E est locally path simply connected si E a un système générateur d'objets
connectés C_i tels que E/C_i p.s.c., ie E^Δ2 -> E^δΔ2 est une surjection
stable.

Faisceaux
=========

* Références sur les 6 opérations:
- https://ncatlab.org/nlab/show/six+operations
- http://www.math.purdue.edu/~lipman/Duality.pdf
  NOTES ON DERIVED FUNCTORS AND GROTHENDIECK DUALITY Joseph Lipman
- https://faculty.math.illinois.edu/K-theory/0573/FormalFeb16.pdf
  ISOMORPHISMS BETWEEN LEFT AND RIGHT ADJOINTS, H.FAUSK,P. HU, AND J.P. MAY
- https://www.math.uchicago.edu/~may/PAPERS/AddJan01.pdf
  THE ADDITIVITY OF TRACES IN TRIANGULATED CATEGORIES, J. P. MAY

* https://ncatlab.org/nlab/show/Frobenius+reciprocity
 In category theory, Frobenius reciprocity is a condition on a pair of adjoint functors f_!⊣f^*. If both categories are cartesian closed, then the adjunction is said to satisfy Frobenius reciprocity if the right adjoint f^*:Y→X is a cartesian closed functor: f*(B^A)=~f*(B)^f*(A)

 By the calculus of mates, this condition is equivalent to asking that the canonical “projection” morphism f_!(C×f^*A)→(f_!C)×A
is an isomorphism for each A in Y and C in X. (Fait sens comme "Frobenius repricocity" dans une catégorie non cartésienne close)

Proposition 1.1. In a Wirthmüller context, the projection formula/Frobenius reciprocity holds as a natural equivalence π¯:f_!(f^*(B)⊗A) ⟶≃ B⊗f_!A

* https://en.wikipedia.org/wiki/Image_functors_for_sheaves
inverse image f^∗ ⇆ direct image f_∗ 
direct image with compact support (R)f_! ⇆ exceptional inverse image (R)f^!

- Verdier duality gives another link between them: morally speaking, it exchanges "∗" and "!", eg direct image is dual to the direct image with compact support

- Base change. Given continuous maps f: X → Z and g: Y → Z which induce morphisms f¯ : X ×_Z Y → Y and g¯ : X ×_Z Y → X, there exists a canonical isomorphism Rf¯_∗ Rg¯^! ≅ Rf^! Rg_∗.

- Localisation:
In the particular situation of a closed subspace i: Z ⊂ X and the complementary open subset j: U ⊂ X, the situation simplifies insofar that for j^∗=j^! and i_!=i_∗ and for any sheaf F on X, one gets exact sequences
    0 → j_!j^∗ F → F → i_∗i^∗ F → 0
Its Verdier dual reads
    i_∗Ri^! F → F → Rj_∗j^∗ F → i_∗Ri^! F[1],
a distinguished triangle in the derived category of sheaves on X.

The adjointness relations read in this case
    i^∗ ⇆ i_∗ = i_! ⇆ i^!
and j_! ⇆ j^! = j^∗ ⇆ j_∗

* https://en.wikipedia.org/wiki/Direct_image_with_compact_support
f:X→Y, f_!: Sh(X)→Sh(Y)
f_!(F)(U) := {s ∈ F(f^−1(U)) : f|supp(s):supp(s)→U is proper},

If f is proper, then f_! equals f_∗. In general, f_!(F) is only a subsheaf of
f_∗(F).

Note: si j: X->Y est une immersion ouverte, j_! est l'extension par zéro,
 ie (j_!F)(U) as the set of those sections s∈F(U∩V) such that locally s=0 or U⊆V
 ie le stalk (j_!F)_x = F_x si x ∈ X, et 0 sinon; cf https://math.stackexchange.com/questions/2768645/proper-direct-image-and-extension-by-zero

* https://en.wikipedia.org/wiki/Exceptional_inverse_image_functor
    If f: X → Y is an immersion of a locally closed subspace (or f quasi finite, eg étale), then it is possible to define f^!(F) := f^∗ G where G is the subsheaf of F of which the sections on some open subset U of Y are the sections s ∈ F(U) whose support is contained in X. The functor f^! is left exact, and right adjoint to f_!.
    Si f open immersion, f^!=f^*

* https://en.wikipedia.org/wiki/Verdier_duality
 f:X->Y continu RHom(Rf_! F, G) ≅ Rf_∗ RHom(F, f^!G) dans D(faisceaux)

 Si f:X->pt, on définit w_X=f^!(pt), et on a une dualité
 dual(F)=RHom(F, w_X) qui satisfait double-dual=dual (pour les faisceaux
 dont la comologie est constructible), et
 dual(Rf_!(F))=Rf_*(dual F)

* https://ncatlab.org/nlab/show/Wirthm%C3%BCller+context
A Wirthmüller context is a pair of two symmetric closed monoidal categories (𝒳,⊗_X,1_X), (𝒴,⊗_Y,1_Y) which are connected by an adjoint triple of functors such that the middle one is a closed monoidal functor.
This is the variant/special case of the yoga of six operations consisting of two adjoint pairs (f_!⊣f^!) and (f^*⊣f_*) and the tensor product/internal hom adjunctions ((−)⊗B⊣[B,−]), specialized to the case that f^!≃f^*.

* https://ncatlab.org/nlab/show/Grothendieck+context
Le cas f_!≃f_*.

Fibrations et stacks
====================

## Over categories

* https://ncatlab.org/nlab/show/over+category
PSh(C/c)≃PSh(C)/Y(c).

Let (L⊣R):D →R ←L C be a pair of adjoint functors, where the category C has all pullbacks.
Then for every object X∈C there is induced a pair of adjoint functors between the slice categories D/LX ⊣ C/X

A colimit in an over category is computed as a limit in the underlying category.
ie l'incusion reflète les colimites.

For 𝒞 a category, X:𝒟⟶𝒞 a diagram, 𝒞/X the comma category (the over-category if 𝒟 is the point) and F:K→𝒞 a diagram in the comma category, then the limit lim_← F in 𝒞/X coincides with the limit lim_← F/X in 𝒞.

Pullbacks: cf https://ncatlab.org/nlab/show/conservative+functor
Proposition 2.1. Let 𝒞 be a category with pullbacks. Given any morphism f:X⟶Y in 𝒞 write f^*:𝒞/Y⟶𝒞/X
for the functor of pullback along ff between slice categories (base change). If strong epimorphisms in 𝒞 are preserved by pullback, then the following are equivalent:
  - f is a strong epimorphism;
  - f^* is conservative.

## Fibrations

* https://ncatlab.org/nlab/show/discrete+fibration
= préfaisceau

* https://ncatlab.org/nlab/show/Grothendieck+fibration
= 2-préfaisceau, ie Fib(B)↔≃[B^op,Cat]:∫
cf https://ncatlab.org/nlab/show/Grothendieck+construction

* https://golem.ph.utexas.edu/category/2011/11/discreteness_concreteness_fibr.html

U:C→S forgetfull; we say that C has discrete objects if U has a fully faithful left adjoint, and codiscrete objects if U has a fully faithful right adjoint. By abstract nonsense, if U has both adjoints, then one is fully faithful if and only if the other is so.

Theorem 1: Suppose C has a terminal object preserved by U. If U is a fibration, then C has codiscrete objects.
Theorem 2: Suppose C has pullbacks preserved by U. If C has codiscrete objects, then U is a fibration.
Thus, if C has finite limits preserved by U, then it has codiscrete objects if and only if it is a fibration.
  
Def: the scone (short for Sierpinski cone) of C over S = the comma category of Id_S over U.
Theorem 3: If C has a terminal object preserved by U, then U′:scn S(C)→S has a fully faithful right adjoint, which takes a∈S to (a,1,!:a→U(1)). Thus scn_S(C) has codiscrete objects.
Theorem 3 is a corollary of Theorem 1, because U′ is always a fibration.

In fact, U′ is the free fibration generated by U: the category of fibrations over S is 2-monadic over Cat/S, and U↦U′ is the 2-monad with unit i_*.
This 2-monad is colax-idempotent, so that U is itself a fibration if and only if i_* has a right adjoint i^! that commutes with U and U′. Therefore, from theorems 1 and 2, we conclude:
  - If C has a terminal object preserved by U and i_* has a right adjoint over S, then C has codiscrete objects. This is easy to see directly by composition of adjoints, since U=U′∘i_* and U′ always has a right adjoint.
  - If C has pullbacks preserved by U and codiscrete objects, then i_* has a right adjoint over S. The adjoint is defined by the pullback
    i^!x → G(a) 
     ↓      ↓ 
     x →  GU(x)
Thus, if we restrict to the category of lex categories and lex functors over S, then we can also regard U′ as the free category-with-codiscrete-objects generated by U.

Dually, of course, we can consider the “co-scone” which is the free opfibration and the free category-with-discrete-objects. However, we also have the following nice fact.

Theorem 4: If U has a left adjoint, then so does U′, which is fully faithful if the left adjoint of U is so. Thus if C has discrete objects, so does scn_S(C).

This means that there must be a distributive law relating the scone and the co-scone, enabling us to talk about joint algebras for the two monads. These joint algebras are, of course, functors into SS which are both fibrations and opfibrations, or equivalently (in the lex and colex case) those having both discrete and codiscrete objects.

Let’s bring it all together by recalling two important examples. Firstly, suppose that C and S are toposes and U is the direct image part of a geometric morphism (thus it has a left-exact left adjoint). Then by Theorem 4, U′ also has a left adjoint, which inherits left-exactness; thus U′ is also the direct image part of a geometric morphism. Finally, i_* always has a left-exact left adjoint i^*, so the morphism i:C→scn_S(C) lives in Topos/STopos/S.

In this case, having codiscrete objects (which then implies also having discrete ones) is called being a local S-topos. The fact that scn_S(C) is the free local S-topos on C appears in C3.6.5 of Sketches of an Elephant. Theorem 2 implies that for any local S-topos, the “global sections” morphism U:C→S is a fibration and opfibration, a useful thing to know. Note that in this case U is not generally faithful.

Secondly, let S=Set and C=Loc be the category of locales, with U the “set of points” functor (also not faithful). Then scn_S(C) is the category of topological systems defined in Steve Vickers’ book Topology via Logic. These are “midway” between topological spaces and locales, having both a frame of opens and a set of points, neither of which is necessarily determined by the other.

There is also a way to recover the usual category of topological spaces. If U:C→S has codiscrete objects, we say that x∈C is concrete if x→GU(x) is a monomorphism. This is equivalent to saying that U is faithful on morphisms with codomain xx. Dually, if C has discrete objects, we say x is co-concrete (“ncrete”?) if FU(x)→x is an epimorphism. This is equivalent to saying that U is faithful on morphisms with domain x. Restricting to the concrete or co-concrete objects are two dual ways to force U to become faithful.

In the case of local toposes, it is often the concrete objects which we are interested in. When C is the category of sheaves on a concrete site, then the concrete objects are precisely the concrete sheaves, which form a quasitopos.

On the other hand, in a category of the form scn_S(C), an object (a,x,a→U(x)) is concrete just when x is subterminal. Thus, in this case (such as the category of topological systems), there are very few concrete objects. However, if C has discrete objects, then (a,x,a→U(x)) is co-concrete just when the adjunct map F(a)→x is an epimorphism. Hence the co-concrete topological systems are precisely the topological spaces.

* https://ncatlab.org/nlab/show/bifibration
=both a Grothendieck fibration as well as an opfibration.
Therefore every morphism f:b_1→b_2 in a bifibration has both a push-forward f_*:E_b1→E_b2 as well as a pullback f^*:E_b2→E_b1.

## Codomain fibration
* https://ncatlab.org/nlab/show/codomain+fibration 
= sends each morphism (c_1 →f c_2)∈[I,C] to its codomain c_2.

This functor is always an opfibration. It corresponds under the Grothendieck construction to the pseudofunctor C/(−):C→Cat
that sends each object c∈C to the overcategory C/c.

If C has all pullbacks, then the functor is in addition a fibration, hence a bifibration

$ Direct image operation
The direct image along f:c_1→c_2 yields f_!:C/c_1→C/c_2
of overcategories obained by postcomposition with f.

$ Inverse image operation
If C has all pullbacks, then the functor is in addition a fibration, hence
a bifibration. Traditionally, though, its fibered aspect is emphasised (and
it even motivates the notion of cartesianess for categories over
categories). A right adjoint u_* of u^* exists for every morphism u
in C iff C is a locally cartesian closed category.
(ie the slice categories C/x are all cartesian closed, ie have internal hom)

The inverse image along f:c_1→c_2 yields f*:C/c_2→C/c_1
of overcategories obained by pullback.
=> Adjointness of direct and inverse image f_!⊣f^*

Since the codomain fibration cod:[I,C]→C is a bifibration when C has all pullbacks, there is a notion of monadic descent in this case.

## Descent

* Références:
- http://web.science.mq.edu.au/~street/Descent.pdf
  Descent Theory, Ross Street (1998)
- https://arxiv.org/pdf/math/0303175.pdf
  Categorical and combinatorial aspects of descent theory, Ross Street (2003)
  Talk: http://web.science.mq.edu.au/~street/2003ICIAM.pdf

### Descente monadique

* https://ncatlab.org/nlab/show/monadic+descent
Monadic descent is a way to encode descent of fibered categories (equivalently, by the Grothendieck construction, of pseudofunctors [=weak 2-functor]) that have the special property that they are bifibrations. This allows to use algebraic tools, notably monads and related structures from universal algebra:
[Attention: dans l'intro ils regardent si pour f^* -| f_* et a->b
si 'l'oubli' f_* est monadique pour la monade f_* f^* sur b, ie on regarde
de la 'codescente'. La descente habituelle d'un truc sur a en un truc sur b
et plutôt de regarder si f^* est comonadique pour la comonad f^* f_*.]

Let 𝒞 be a category and 𝒞_(−) a bifibration over it. For f:X⟶Y a morphism in 𝒞 write
(f_!⊣f^*⊣f_*):𝒞_X⟶f_*⟵f^*⟶f_!𝒞_Y
for the corresponding base change adjoint triple and write
(T_f⊣J_f)≔(f^*f_!⊣f^*f_*) for the induced adjoint pair of a monad T and a comonad J on 𝒞_X (et on a aussi une paire (f_! f^* -| f_* f^*) d'une comonade adjointe à une monade sur 𝒞_Y).

Canonical morphism on descent data: 𝒞_Y⟶Desc_𝒞(f).
The morphism f is called (with respect to the given bifibration 𝒞_(−))
  - a descent morphism if this comparison map is a full and faithful functor;
  - an efective descent morphism if the comparison map is an equivalence of categories.

Now the Bénabou-Roubaud theorem states that if 𝒞_(−) satisfies the Beck-Chevalley condition, then descent data is equivalent to the structure of an algebra over a monad for T_f (equivalently a coalgebra for J_f), hence is the Eilenberg-Moore category for these (co-)monads
Desc_𝒞(f)≃EM(T_f).
Therefore when 𝒞_(−) satisfies the BC condition, then a morphism f is effective descent precisely if f^*:𝒞_Y→𝒞_X is monadic, and is descent precisely if f^* is of descent type.

$ Descent for the codomain fibration
Let 𝒞 be a locally Cartesian closed category with coequalizers (e.g. a topos). Then effective descent morphisms for the codomain fibration are precisely the regular epimorphisms.

Hence for f:X⟶Y and (f_!⊣f^*⊣f_*):𝒞/X⟶𝒞/Y the induced base change adjoint triple, then 𝒞 /Y is equivalent to the Eilenberg-Moore category of algebras over f^*f_! (equivalently: of coalgebras of f^*f_*) precisely if f is an effective epimorphism. (Use conservative pullback along epimorphisms in the monadicity theorem.)

=> a “geometric” descent datum:
  - a morphism P→X
  - equipped with a transition function between its two pullbacks to double X ×Y X
  - which satisfies on X ×_Y X×_Y X the usual cocycle condition.
This is worked out in details in $ Motivation: failure of push-forward for principal bundles

* Detailled exemples of descent:
- https://ncatlab.org/nlab/show/monadic+descent#ForCodomainFibs
- https://ncatlab.org/nlab/show/monadic+descent#AlongPrincipalBundle
- $ Monadic descent of modules
  There is a bifibration Mod→Rings from the category of modules over any ring, mapping each module to the ring that it is a module over. This models, dually, an algebraic version of vector bundles over affine schemes.
  Comonadic descent for this bifibration (equivalently monadic descent for its formal dual, Mod^op→Rings^op is the same as descent for a Sweedler coring
  https://ncatlab.org/nlab/show/Sweedler+coring

* Référence:
- https://hal.archives-ouvertes.fr/hal-01254637
  The Bénabou-Roubaud monadic descent theorem via string diagrams
- George Janelidze, Walter Tholen, Facets of Descent I, Applied Categorical Structures 1994, Volume 2, Issue 3, pp 245-281
  George Janelidze, Walter Tholen, Facets of Descent II, Applied Categorical Structures September 1997, Volume 5, Issue 3, pp 229-248

### Functor of descent type

* https://ncatlab.org/nlab/show/functor+of+descent+type
A functor is of descent type if it satisfies “half” of the condition to be monadic.

A functor U:B→A is of descent type if
  - it has a left adjoint F:A→B, and
  - for all b∈B the canonical fork FUFUb⇉FUb→b is a coequalizer.
    (equivalently the adjunction counit is a regular epi, cf Z.L. Low, Prop 1.5.2)

The second condition is equivalent to asking that the comparison functor B→A^UF from B to the Eilenberg-Moore category of the monad UF is fully faithful.

$ 3. Examples

By monadic descent, a morphism f in the base of a fibration is a descent morphism if and only if f^* is of descent type. This is presumably the origin of the terminology; ff is an effective descent morphism when f^* is monadic.

### Monad of descent type

* http://www.tac.mta.ca/tac/volumes/16/1/16-01.pdf
MONADS OF EFFECTIVE DESCENT TYPE AND COMONADICITY
BACHUKI MESABLISHVILI
We show, for an arbitrary adjunction F-|U:B→A with B Cauchy complete, that the functor F is comonadic if and only if the monad T on A inducedby the adjunction is of effective descent type, meaning that the free T-algebra functor F^T:A→A^T is comonadic.
=> application on descent theorem for noncommutative ring

* (Effective) descent type monads
https://math.stackexchange.com/questions/1139403/cokleisli-category-of-the-induced-comonad-of-a-monad

Given a monad, it induces a comonad on its Eilenberg-Moore category. We can then take the coKleisli category of this comonad. Can we say anything interesting about this?

Let C be a category, let T be a monad on C, let D=C^T be the category of T-algebras, let G be the induced comonad on D, and let E be the Kleisli category associated with G.
By the universal property of the Kleisli category, we have the following commutative diagram,
D ====== D
↓H       ↓U
E   -R>  C
where H:D→E is the cofree G-coalgebra functor and U:D→C is the forgetful functor.

The functor R:E→C is fully faithful. (This is a general fact about comonads
and their Kleisli categories.) Indeed, writing V:E→D for the forgetful
functor and F:C→D for the free T-algebra functor, we have
E(HA,HB)≅D(VHA,B)=D(FUA,B)≅C(UA,UB)
which is essentially how the functor R:E→C is defined in the first place.
So we deduce that E is equivalent to the full subcategory of C spanned by
the image of U:D→C.

Things are more interesting if you instead look at the category of G
-coalgebras. In that case, we get a commutative diagram of the form below,
CF -L>  D_G
↓F       ↓
D  ===== D
where the right vertical arrow is the forgetful functor. The functor L:C→D_G does not necessarily have any good properties. If L is fully faithful, then we say T is of descent type; and if L is an equivalence of categories, then we say T is of effective descent type. For an example of this, look at the case where C is the category of (left) R-modules for some ring R and T is the monad for (left) S-modules for some faithfully flat R-algebra S.

### Intuitions for the link between monads and descent

* https://mathoverflow.net/questions/225391/why-are-monadicity-and-descent-related

If you're talking about a morphism of rings ϕ:A→B there is a functor −⊗A B:ModA→ModB. Then you can ask the question: Can I recover the category ModA from ModB? This question is answered by knowing whether or not −⊗A B is comonadic. In particular, this tells us that ModA is equivalent to the category of ϕ∗∘(−⊗AB)-comodules in ModB. It takes a little bit of work, but as an exercise for really understanding descent, it may be useful to prove that in this case, the category of comodules for this comonad is equivalent to the category of B ⊗A B-comodules, where B ⊗A B is a B-coring with comultiplication
B ⊗A B ≅ B ⊗A A ⊗A B → B ⊗A B ⊗A B ≅ B ⊗A B ⊗B B ⊗A B.

This object is also sometimes called the descent coring, and for reasons that will hopefully become clear in the next paragraph, its comodules are often referred to as descent data.

A B ⊗A B-comodule structure on a B-module N is the same thing as a "cocycle condition" satisfying isomorphism M ⊗A B ≅ M ⊗B B ⊗A B →∼ B⊗A B ⊗B M ≅ B ⊗A M.

Geometrically: the descent data (as defined above for modules) for a sheaf F on Spec(B) is an isomorphism between the two ways of pulling back F to Spec(B) ×_Spec(A) Spec(B).
This, as you may recall, is precisely the way that we typically state "gluing" conditions. In other words, if a sheaf supports such an isomorphism, it lives in the coequalizer (in categories, so necessarily the coequalizer computed as a 2-colimit) of the diagram
QC{Spec(B)} ⇇ QC{Spec(B) ×_Spec(A) Spec(B)} ⇚ QC{Spec(B) ×_Spec(A) Spec(B) ×_Spec(A) Spec(B).}

* https://mathoverflow.net/questions/225391/why-are-monadicity-and-descent-related, Qiaochu Yuan
Mmonads are categorified idempotents.

The point of idempotents (acting on, say, a module) is to pick out nice subobjects: subobjects that are so nice that they are simultaneously subobjects and quotient objects (say, direct summands of modules) in a compatible way. More formally, every idempotent m:X→X wants to become a pair of a map f:X→Y and a map g:Y→X such that g∘f=m and f∘g=idY. Similarly, the point of monads is to pick out nice categories which simultaneously map into and out of a category in a compatible way (via an adjunction). More formally, every monad M:C→C wants to become a pair of a functor F:C→D and a functor G:D→C such that F and G are adjoint and G∘F≅M.

This analogy is quite robust: for example, the analogue of taking the fixed points of an idempotent is taking the category of algebras of a monad. And the analogue of an adjunction being monadic is a submodule being a direct summand. 

Here's a simple toy model. Let f:X→Y be a map of sets and let Sh(X) be, for concreteness, the functor assigning a set X the category of sheaves of sets on X, which just means the category of assignments, to each x∈X, of a set Ax.

f should be descent iff it is surjective; indeed the comonad encodes a bunch of isomorphisms Ax≅Ax′.

The decategorified version of this story is that a real-valued function A:X→R descends to a function Y→R iff Ax=Ax′ for all x,x′ such that f(x)=f(x′). Moreover, if f has finite fibers, we can pick out which functions these are as the fixed points of the idempotent m(A)_x=1/|f−1(f(x)) |∑_{f(x′)=f(x)} Ax′
acting on the vector space of functions X→R.

A more interesting case to work out is the case that f:X→X/G is a Galois
cover with Galois group G. In this case descent will say that Sh(X/G) is
the category of homotopy fixed points Sh(X)G for the action of G on Sh(X),
and the way in which the comonad f^∗f_∗ encodes this fact is a
categorification of the fact that if G is a finite group acting on a vector
space V (over a field of suitable characteristic), the subspace VG of fixed
points is a direct summand picked out by the idempotent 1/|G|∑_{g∈G} g. This is
a geometric form of Galois descent.

More details in https://qchu.wordpress.com/2015/12/15/monads-are-idempotents/

* Descente fidèlement plate, cf Z.L. Low $ Descent and base change
Si f: X -> Y, on a l'adjonction f^* -| f_* sur Mod_X et Mod_Y. On veut
savoir quand un module M sur X vient du pullback de M' sur Y, et
reconstituer M'.
Plus généralement, si F -| U: D->C, on veut savoir si un objet M de D est
de la forme FX et reconstituer X. Alors M doit avoir une structure de
comodule, et X->UFX=>UFUFX doit être un équalisateur.
Autrement dit, si F:C->D est de codescent type, C est une sous-catégorie de
D_G. Et donc si M=FX, M'=FX', la donnée de comodules sur M et M' induites
donne une équivalence Hom_comodule(M,M')=Hom(X,X'). Si F est de codescente
effective, tout comodule est de la forme FX.

## Stack

* https://ncatlab.org/nlab/show/stack
= (2,1)-faisceau.

- https://arxiv.org/abs/math/0212266
Introduction to the language of stacks and gerbes
Ieke Moerdijk (University of Utrecht)

## Presentable stacks

* Differentiable stacks
  https://www.uni-due.de/~hm0002/stacks.pdf
  SOME NOTES ON DIFFERENTIABLE STACKS J. Heinloth

* Orbifolds:
- I. Moerdijk, Orbifolds as groupoids, an introduction.
- I. Moerdijk and J. Mrcun, Introduction to foliations and Lie groupoids.

https://arxiv.org/pdf/0806.4160.pdf
Orbifolds as stacks?
Eugene Lerman
    The first goal of this survey paper is to argue that if orbifolds are groupoids, then the collection of orbifolds and their maps has to be thought of as a 2-category. Compare this with the classical definition of Satake and Thurston of orbifolds as a 1-category of sets with extra structure and/or with the "modern" definition of orbifolds as proper etale Lie groupoids up to Morita equivalence.
    The second goal is to describe two complementary ways of thinking of orbifolds as a 2-category:
    1. the weak 2-category of foliation Lie groupoids, bibundles and equivariant maps between bibundles and
    2. the strict 2-category of Deligne-Mumford stacks over the category of smooth manifolds.

[intéressant car ça permet de bien comprendre les groupoides dans le cas
des manifold, et la Morita equivalence en terme de bibundle, de pourquoi on
a besoin de voir les groupoides comme une 2-catégorie et pas juste une
1-catégorie où on inverse les weak equivalence; ça permet de mieux voir ce
qui se passe dans le cadre général des topos; et aussi le lien avec les stacks.]

Locales and Heyting algebras
============================

## Lattices

Rappel: join semi-lattice = poset où tout couple a un suprémum (<=> tout
ensemble fini a un supremum).
lattice = join and meet semi-lattice.

complete lattice = partially ordered set in which all subsets have both a
supremum (join) and an infimum (meet). (Note: il suffit d'avoir tous les
supremum, car dans ce cas l'infinum c'est le supremum de tous les éléments
plus petits), et pour ça il suffit d'avoir le suprémum direct + les
suprémum finis).

## Heyting

https://en.wikipedia.org/wiki/Heyting_algebra

A Heyting algebra is a bounded lattice (with join and meet operations written ∨ and ∧ and with least element 0 and greatest element 1) equipped with a binary operation a → b of implication such that c ∧ a ≤ b is equivalent to c ≤ a → b.

<=> A Heyting algebra H is a bounded lattice that has all exponential objects,
ie a->b est l'adjoint de a^b.

<=> f_a(x):= a ^ x a un adjoint de Galois g_a(x)=a->x.

On peut encore voir  →, ∧ and ∨, ⊥=0 and ⊤=1 dans H comme satisfaisant les
axiomes de la logique intuitionniste.

Exemple: Every Boolean algebra is a Heyting algebra when a → b is defined
as usual as ¬a ∨ b.

Pour une algèbre de Heyting, on peut définir ¬a := a→0
- Réguliers: x est régulier, si x=¬y ou de manière équivalente x=¬¬x (car ¬¬¬=¬).
- Compléments: Elements x and y of a Heyting algebra H are called complements to each other if x∧y = 0 and x∨y = 1. If it exists, any such y is unique and must in fact be equal to ¬x. We call an element x complemented if it admits a complement. It is true that if x is complemented, then so is ¬x, and then x and ¬x are complements to each other. However, confusingly, even if x is not complemented, ¬x may nonetheless have a complement (not equal to x). In any Heyting algebra, the elements 0 and 1 are complements to each other. For instance, it is possible that ¬x is 0 for every x different from 0, and 1 if x = 0, in which case 0 and 1 are the only regular elements.
Any complemented element of a Heyting algebra is regular, though the converse is not true in general. In particular, 0 and 1 are always regular.

Prop: H est booléenne <=> tous les x sont réguliers <=> tous les x sont complémentés.
Le sous-ensemble de H des x réguliers (resp complémentés) forment une
algébre booléenne (sauf que pour H_rég il faut faire attention que x ∨reg y = ¬(¬x ∧ ¬y)).

Complétude:
    - The formula F is provably true in intuitionist propositional calculus.
<=> - The identity F ( a 1 , a 2 , … , a n ) = 1 is true for any Heyting algebra H and any elements a 1 , a 2 , … , a n ∈ H.
Note: pour la logique classique, il suffit de vérifier la formule dans
l'algèbre de Boole canonique {0,1}.

## Algèbre de Heyting complète

https://en.wikipedia.org/wiki/Complete_Heyting_algebra
Consider a partially ordered set (P, ≤) that is a complete lattice. Then P is a complete Heyting algebra if any of the following equivalent conditions hold:
    1) P is a Heyting algebra, i.e. the operation ( x ∧ − ) has a right adjoint (also called the lower adjoint of a (monotone) Galois connection), for each element x of P.
    2) For all elements x of P and all subsets S of P, the following infinite distributivity law holds: x ∧ ⋁ s ∈ S s = ⋁ s ∈ S ( x ∧ s ) .
    3) P is a distributive lattice, i.e., for all x, y and z in P, we have
    x ∧ ( y ∨ z ) = ( x ∧ y ) ∨ ( x ∧ z ) and the meet operations ( x ∧ − ) are Scott continuous for all x in P (i.e., preserve the suprema of directed sets) .

Exemple: The system of all open sets of a given topological space ordered by inclusion is a complete Heyting algebra.

https://en.wikipedia.org/wiki/Pointless_topology

Une complete Heyting algebra c'est aussi une frame. Cependant dans Frame,
les morphismes sont (necessarily monotone) functions that preserve finite meets and arbitrary joins. Mais pour être un morphisme d'algèbre de Heyting complète, il faut aussi préserver =>. Locale c'est la catégorie duale de Frame.

## Stone duality

* https://ncatlab.org/nlab/show/Stone+duality

A Stone space is by definition a totally disconnected compact Hausdorff
topological space.
The category of Stone spaces is dual to the category of Boolean algebras. The Boolean algebra corresponding to a Stone space consists of its clopen sets.

$ Stone spaces and profinite sets

Note that a finite Stone space is necessarily discrete, and these correspond to the finite Boolean algebras, i.e. FinSet≃FinStoneTop≃FinBool^op. However, since Boolean algebras form a locally finitely presentable category, we have Bool≃Ind(FinBool)≃Pro(FinSet)^op. In consequence, StoneTop≃Pro(FinSet): i.e. Stone spaces are equivalent to profinite sets, in this context then often called profinite spaces.

One way of explaining this classical Stone duality is hence via the following sequence of equivalences of categories
Bool≃Ind(FinBool)≃Ind(FinSet^op)≃Pro(FinSet)^op=StoneTop^op

- https://ncatlab.org/nlab/show/atomic+Boolean+algebra
  a is an atom in A if a is minimal among non-trivial (non-bottom) elements of AA. That is, given any b∈A such that b≤a, either b=0 or b=a.
  A atomic si tout élément b=⋁_I a_i pour des atomes a_i.
  https://ncatlab.org/nlab/show/complete+Boolean+algebra
  complete atomic Boolean algebras are (up to isomorphism) precisely power sets.

* https://en.wikipedia.org/wiki/Stone_duality
On a un foncteur O:Top=>Locale, qui à f:X->Y associe les préimages sur les
ouverts. Ce foncteur a un adjoint S:Locale=>Top définit ainsi:
S(A)=spectrum A, les points sont les applications P(*)->A, si a \in A on
définit U_a comme l'ensemble des points p, tel que p* P(*)->A satisfait p*(a)={*}, ce qui donne un morphisme A->P(S(A)), et donc à f:A->B on associe S(f)(p)=fop.

Cette adjonction donne une équivalence de catégorie entre les espaces topos
sobres et les locales spatiales. X est sobre ssi X->S(O(X)) est bijectif,
et A est spatiale ssi A->O(S(A)) est injectif (c'est toujours surjectif),
ie if not a ≤ b, then there is a point p in pt(A) such that p(a) = 1 and p(b) = 0.

Rappel: sober space = every irreducible closed subset of X is the closure of exactly one point of X; T2 (Hausdorff) => Sober => T0. Exemple: the underlying topological space of any scheme is a sober space, et les sober space de la forme Spec(A), A anneau commutatif sont appelés spectral space.

Cas particulier:
- The category CohSp of coherent sober spaces (and coherent maps) is
equivalent to the category CohLoc of coherent (or spectral) locales (and
coherent maps). The significance of this result stems from the fact that CohLoc in turn is dual to the category DLat of distributive lattices. Hence, DLat is dual to CohSp – one obtains Stone's representation theorem for distributive lattices
[Distributive lattice: join and meet distribute over each other.
 Coherent space: the collection of compact open subsets of X is closed under finite intersections and form a basis for the topology of X.
]
- When restricting further to coherent sober spaces that are Hausdorff, one obtains the category Stone of so-called Stone spaces. On the side of DLat, the restriction yields the subcategory Bool of Boolean algebras. Thus one obtains Stone's representation theorem for Boolean algebras.
[Rappel: A Boolean algebra is a complemented distributive lattice, où
équivalently on a ¬, ∧ and ∨, ⊥ and ⊤ avec les bons axiomes]
 => A concrete Boolean algebra or field of sets is any nonempty set of
 subsets of a given set X closed under the set operations of union,
 intersection, and complement relative to X, et Stone's rep theorem =>
 toute algèbre booléenne est concrète.

* https://en.wikipedia.org/wiki/Stone%27s_representation_theorem_for_Boolean_algebras
Each Boolean algebra B has an associated topological space, denoted here S(B), called its Stone space. The points in S(B) are the ultrafilters on B, or equivalently the homomorphisms from B to the two-element Boolean algebra. The topology on S(B) is generated by a (closed) basis consisting of all sets of the form
    { x ∈ S ( B ) ∣ b ∈ x } ,
where b is an element of B. This is the topology of pointwise convergence of nets of homomorphisms into the two-element Boolean algebra.

For every Boolean algebra B, S(B) is a compact totally disconnected Hausdorff space; such spaces are called Stone spaces (also profinite spaces). Conversely, given any topological space X, the collection of subsets of X that are clopen (both closed and open) is a Boolean algebra.

Stone's representation theorem states that every Boolean algebra B is isomorphic to the algebra of clopen subsets of its Stone space S(B). The isomorphism sends an element b∈B to the set of all ultrafilters that contain b.

* https://en.wikipedia.org/wiki/Spectral_space
Let X be a topological space and let K∘(X) be the set of all compact open subsets of X. Then X is said to be spectral if it satisfies all of the following conditions:
    X is compact and T0.
    K∘(X) is a basis of open subsets of X.
    K∘(X) is closed under finite intersections.
    X is sober, i.e. every nonempty irreducible closed subset of X has a (necessarily unique) generic point.
[ie X coherent sober space et compact]

Equivalent descriptions
Let X be a topological space. Each of the following properties are equivalent to the property of X being spectral:
  - X is homeomorphic to a projective limit of finite T0-spaces.
  - X is homeomorphic to the spectrum of a bounded distributive lattice L. In this case, L is isomorphic (as a bounded lattice) to the lattice K∘(X) (this is called Stone representation of distributive lattices).
  - X is homeomorphic to the spectrum of a commutative ring.
  - X is the topological space determined by a Priestley space.
X is a T0 space whose frame of open sets is coherent (and every coherent frame comes from a unique spectral space in this way. [Hum ça me semble faux, on va plutôt obtenir les bounded coherent frame comme ça]).

* https://mathoverflow.net/questions/194333/what-would-be-an-infinity-groupoid-analogue-of-the-duality-between-sets-and-comp/194354#194354

Let S denote the ∞-category of spaces. For any ∞-topos X, there is an essentially unique geometric morphism π∗:S→X. The ∞-topos X has the form S/A if and only if the geometric morphism π∗ is etale.
The construction A↦S/A gives a fully faithful embedding from the ∞-category of spaces to the ∞-category of ∞-topoi.

To get a closer analogue of Stone duality, note that the ∞-category of ∞-topoi admits small limits. Consequently, the functor A↦S/A extends formally to a functor F from Pro-spaces to ∞-topoi which commutes with filtered inverse limits. This functor F is not fully faithful, but it is fully faithful when restricted to profinite spaces (that is, Pro-spaces which can be represented by filtered diagrams of spaces which have only finitely many homotopy groups, each of which is required to be finite). You therefore get an embedding θ: { Profinite spaces } ↪ { ∞-topoi } which is a better analogue of Stone duality. In fact, it generalizes Stone duality: the RHS contains the ordinary category of sober topological spaces as a full subcategory, the LHS contains the ordinary category profinite sets as a full subcategory, and on the latter subcategory θ restricts to the usual fully faithful embedding { Profinite sets } ≃ { Stone Spaces } ↪ {sober topological spaces}.

