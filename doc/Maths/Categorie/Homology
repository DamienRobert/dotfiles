vim: ft=markdownlight fdm=expr

Complexes
=========

Rappels:
- si f: C_1 -> C_2 morphisme de complexe, f induit un morphisme H(f) sur
  l'homologie
- si f,g morphismes de deux complexes sont homotopes, alors les homologies H(f) et H(g) sont isomorphes. Donc si f est homotope à un iso, f est un quasi-iso.
- si on a une suite exacte de complexes on a une longue suite des
  homologies
- si f: A->B morphismes de complexes, le mapping cone donne une suite
  exacte 0-> B -> C(f) -> A -> 0, donc un triangle
  A->B->C(f) (qui induit une suite exacte longue sur l'homologie), donc si
  C(f) est acyclique, f est un quasi-iso.

  Notes sur le mapping cone: c'est le total complexe associé au double
  complexe A->B; si f est un iso C(f) est homotopiquement trivial.
  Si 0->A-a>B-b>C->0 est exact alors C est qis à C(a) et A qis à C(b) (à un
  degré près).

Résolution projective: si PX est une résolution projective de X, PY de Y,
alors Hom(X,Y) = Hom_K(C)(PX,PY) (ie les applications à homotopie près)

Preuve: cf Eisenbud A.3.13. Sinon vient du fait que D(C)=K(C)

Suites exactes courtes dans un complexe
---------------------------------------

A_1 -> A_2 -> A_3 -> A_4

Alors C_3=Ker (A_3 -> A_4) = Im (A_2 -> A_3) = Coker (A_1 -> A_2)
ie:
        C_2            C_4
    A_1    A_2     A_3    A_4
C_1            C_3           C_5

soit 0->C_2->A_2->C_3->0
     0->C_3->A_3->C_4->0...

Abelian category
================

Abelian categories
------------------

* https://ncatlab.org/nlab/show/additive+and+abelian+categories

* https://ncatlab.org/nlab/show/additive+category
Additive category = Ab-enriched category which admit finite coproducts.

Dans une catégorie additive, produit=coproduit (car c'est le cas dans AbGroup).
Réciproquement: https://ncatlab.org/nlab/show/biproduct
Biproduct= produit qui est aussi un coproduit.
A category C with all finite biproducts is called a semiadditive category.
A semiadditive category is automatically enriched over the monoidal category of commutative monoids
If additionally every morphism f:a→b has an inverse −f:a→b-f: a \to b, then C is an additive category.

* https://ncatlab.org/nlab/show/pre-abelian+category
A pre-abelian category is an additive category which also has kernels and cokernels. Equivalently, it is an Ab-enriched category with all finite limits and finite colimits.
On a une correspondance Galoisienne ker/coker entre les monos (sous-objets) et les épis. En particulier f est un noyau ssi k=ker(coker(f)).
On a toujours une factorisation A->coim f -> im f ->B.

* https://ncatlab.org/nlab/show/abelian+category
Catégorie abélienne: pre-abelian + coim f -> im f est un iso.
<=> pre-abelian + Every monomorphism is a kernel and every epimorphism is a cokernel.
Tierney: additive+exact category (au sens de Barr) <=> abelian
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.732.4603&rep=rep1&type=pdf

* https://en.wikipedia.org/wiki/Localizing_subcategory
Serre subcategory = stable by subobjects, quotient objects and extensions
                  = kernel of exact functors T : A → A / C
The Serre subcategory C is called localizing, if the quotient functor T : A → A / C  has a right adjoint S : A / C → A.

If A is a Grothendieck category and C  a localizing subcategory, then the quotient category A / C is again a Grothendieck category.
The Gabriel-Popescu theorem implies that every Grothendieck category is the quotient category of a module category Mod(R) (R a suitable ring) modulo a localizing subcategory.

https://en.wikipedia.org/wiki/Giraud_subcategory
= left exact reflective subcategory of a Grothendieck category
Let B be Giraud in the Grothendieck category A and i : B → A the inclusion functor.
  - B is again a Grothendieck category.
  - An object X in B is injective if and only if i(X) is injective in A .
  - The left adjoint a : A → B of i is exact.
  - Let C be a localizing subcategory of A. The section functor S : A / C → A is fully faithful and induces an equivalence between A / C and the Giraud subcategory B given by the C-closed objects in A.


Exact categories
----------------

Généralisation: Exact categories
https://www.sciencedirect.com/science/article/pii/S0723086909000395?via%3Dihub
[Embedding: 
- https://en.wikipedia.org/wiki/Mitchell%27s_embedding_theorem
if A is a small abelian category, then there exists a ring R (with 1, not necessarily commutative) and a full, faithful and exact functor F: A → R-Mod
- Quillen-Gabriel embedding theorem
For every small exact category in the sense of a pair (A,E), there is an embedding A↪B into an abelian category such that E is a class of all sequences which are (short) exact in B (et A est stable par extension dans B)].

Dans une catégorie abélienne, tous les monomorphismes sont des noyaux (ce
sont les noyaux de leurs conoyaux), et tous les épi des conoyaux.
De manière équivalente, coim est iso à im.
[ie tous les épi/mono sont effectifs]

Morphismes
----------

A -f-> B
- f=0 <=> Ker f = A <=> coim f = 0 <=> coker f=B <=> im f=0
- f mono <=> ker f = 0 <=> coim f = A
- f épi <=> coker f = 0 <=> im f = B

- Si f est un noyau, c'est le noyau de son conoyau, ie Im f = A.
- Si f est un conoyau, c'est le conoyau de son noyau, ie coim f = B
- f mono+épi <=> f iso

A -f-> B -g> C
- ker f --> ker gof --> A -> B -> C ->> coker gof ->> coker g
- A ->> coim f ->> coim gof
- g mono => Ker gof = Ker f <=> coim g = coim f
- f épi => coker gof = coker g <=> im gof = im g

Complétude
----------

https://ncatlab.org/nlab/show/additive+and+abelian+categories
  - Ab-enriched category: a category that is Ab-enriched;
  - pre-additive category: an Ab-enriched category that has a terminal object or initial object and therefore a zero object
  - pseudo-abelian category: a pre-additive category such that every idempotent has a kernel and cokernel
  - additive category: a pre-additive category that admits binary products or binary coproducts and therefore binary biproducts (equivalently, an Ab-enriched category with all finite products or coproducts);
  - pre-abelian category: an additive category that admits kernels and cokernels (equivalently, an Ab-enriched category with all finite limits and colimits);
  - abelian category: a pre-abelian category such that every monomorphism is a kernel and every epimorphism is a cokernel (and many other equivalent definitions).

Pre-abelian and abelian categories are sometimes called (AB1) and (AB2) categories, after the sequence of additional axioms on top of additive categories introduced by Grothendieck in Tohoku. AB1 and AB2 are self-dual axioms (AB1 is existence of kernels and cokernels, and AB2 requires that, for any f, the canonical morphism Coim f→Im f is an isomorphism). These continue in non-selfdual manner:
    AB3: an abelian category with all coproducts (hence with all colimits);
    AB4: an (AB3) category in which coproducts of monomorphisms are monic;
    AB5: an (AB3) category in which filtered colimits of exact sequences exist and are exact;
    AB6: an (AB3) category such that
        for every object A in C and any family B^j with j∈J of directed families B^j = B^j_i with i in I_j the intersections of subobjects over j commute with direct sums over j.
        Notice that this implies that inf for any family of subobjects exists.

The concepts (AB3–AB6) also have dual forms (AB3–AB6).
There are further refinements along these lines. In particular
    Grothendieck category: an (AB5) category with a generator.

Five lemma
----------

A -> B -> C -> D -> E

A'-> B'-> C'-> D'-> E'

Horizontalement exacts.

- Si B->>B', D->>D', E --> E', alors C ->> C'
- Si B-->B', D-->D', A ->> A', alors C --> C'
- Donc si B->B', D->D' iso, A->A' épi, E->E' épi, alors C -> C' iso

En particulier, si
0 -> B -> C -> D -> 0
0 -> B'-> C'-> D'-> 0
sont horizontalement exacts, et que B->B', D->D' iso, alors C->C' iso.

Nine lemma
----------

http://en.wikipedia.org/wiki/Nine_lemma
Si les 3 colonnes et les deux lignes du bas sont exactes, celle du haut l'est.
Si les 3 colonnes et les deux lignes du haut sont exactes, celle du bas l'est.

(C'est un cas particulier du Snake Lemma)

Snake lemma
-----------
     A -> B -> C -> 0
     a    b    c
0 -> D -> E -> F

Si les lignes sont exactes, on a une suite exacte
ker a -> ker b -> ker c -> coker a -> coker b -> coker c
(et si A-->B, ker a --> ker b, et si E->>F, coker b ->>coker c)

Catégorie de modules
====================

* https://ncatlab.org/nlab/show/Eilenberg-Watts+theorem
Given unital rings R and S and an R-S-bimodule N, the tensor product functor
(−)⊗_R N:Mod_R→Mod_S
between the categories of modules is right exact and preserves small coproducts.
Conversely, if F:Mod_R→Mod_S is right exact and preserves small coproducts, then it is naturally isomorphic to tensoring with a bimodule.
[N as a underlying right S-module is F(R)]

Remark 2.4. In the statement of the theorem we can replace “additive, right exact and preserves direct sum” by “additive and left adjoint”.

In fact both bimodules and intertwiners as well as functors and natural transformations form a category. In more detail the theorem is:
Theorem 2.5. For RR and SS two rings, the functor
R_Mod_S→≃Func_coc(Mod R,Mod S)
from the category of bimodules to that of colimit-preserving functors between their categories of modules is an equivalence of categories.

* https://ncatlab.org/nlab/show/Morita+context

* https://ncatlab.org/nlab/show/Morita+equivalence
Given rings R and S, the following properties are equivalent
  - The categories of left S-modules and left R-modules are equivalent;
  - The categories of right S-modules and right R-modules are equivalent;
  - There are bimodules R_M_S and S_N_R such that ⊗_R M and ⊗_S N form an adjoint equivalence between the category of right S- and the category of right R-modules;
  - The ring R is isomorphic to the endomorphism ring of a generator in the category of left (or right) S-modules;
  - The ring S is isomorphic to the endomorphism ring of a generator in the category of left (or right) R-modules.

* https://ncatlab.org/nlab/show/Freyd-Mitchell+embedding+theorem
Let C be an abelian category. If C has all small coproducts and has a compact projective generator P, then C≃R-Mod for some ring R=Hom_C(P,P).

Cf aussi Categorie#Completion

[Rappel: Compact object in an abelian category: https://ncatlab.org/nlab/show/compact+object
X is called compact (or finitely presented or finitely presentable or of finite presentation) if mapping out of it commutes with filtered colimits,
ie Hom_C(X, -) preserves filtered colimits.

This means that if any other object A is given as the colimit of a “suitably increasing” family of objects {A_i}, then every morphism X→A=lim_→ A_i
out of the compact object X into that colimit factors through one of the inclusions A_i→lim_→ A_i.]

A nice proof in:
https://amathew.wordpress.com/2012/08/01/serres-criterion-for-affineness-as-morita-theory/
G: X \mapsto Hom_A(P,X) a pour adjoint à droite F(Y)=Y \tens P
où \tens_P est l'unique foncteur qui préserve les colimites dans A et tel
que Z\tens P=P; en particulier pour Y de prés finie Z^m->Z^n->Y->0,
Y \tens P=coker(P^m->P^n). G is conservative because P is a generator, and G actually commutes with all colimits because P is compact and projective; donc en particulier G préserve les splits coeq, donc par Beck monadicity theorem GF est monadique, ie A=Mod(GF).
Since G preserves all colimits, GF is a colimit-preserving monad, et on
conclu via l'Observation: Associative rings are the same thing as colimit-preserving monads on the category of abelian groups.

Morita pour QCoh(X):
https://ncatlab.org/nlab/show/Gabriel-Rosenberg+theorem
an algebraic scheme can be reconstructed up to an isomorphism from the
abelian category of quasicoherent sheaves over that scheme.

Se généralise à des stacks mais dans ce cas il faut utiliser la structure
monoidale issu du produit tensoriel, cf https://arxiv.org/pdf/1310.5978.pdf
"Lurie has reconstructed an arbitrary geometric stack from its tensor category of quasi-coherent sheave"
J. Lurie, Tannaka Duality for Geometric Stacks , preprint, arXiv:math/0412266, 2005

Tor and Ext
===========

* Tor and Hom adjunction:
https://en.wikipedia.org/wiki/Tensor-hom_adjunction

X (A,B)-module, Y (B,C)-module, Z (C,D)-module, alors
Hom_C(X ⊗_B Y, Z) =~ Hom_B(X, Hom_C(Y,Z)) en tant que (D,A)-modules.

Corollaire:
- f: B->C, Y=C; Hom_C(X ⊗_B C, Z)=Hom_B(X, Z)
- f: C->B, Y=B; Hom_C(X, Z)=Hom_B(X, Hom_C(B,Z))

Th: Sur un anneau R (disons commutatif pour simplifier), on a une map:
    Hom(M,N)⊗Hom(P,Q) -> Hom(M⊗P, N⊗Q)
C'est un iso si M et P f.p. proj
             si P=R et M ou Q f.p. proj, ie Hom(M,N)⊗Q=Hom(M,N⊗Q)
             si Q=R et P proj, ie Hom(M,N)⊗P*=Hom(M⊗P,N), donc Hom(P,N)=N⊗P*

Dualité: Tor Ext 
----------------
https://link.springer.com/content/pdf/10.1007/BF01141091.pdf

Prop 3: Si G est un R-module à gauche de dim proj n (avec une résolution par des modules proj P_i de type fini),
et A un module à droite, on a une application γ^p:Ext^p(Ext^n(G,R),A)->Tor_{n-p}(A,G)

Plus généralement on a une suite spectrale
E_2^p,q:=Ext^p(Ext^{n-q}(G,R),A)=>Tor_{n-p-q}(A,G)

En particulier Hom(Ext^n(G,R)) =~ Tor_{n}(A,G) et γ^1 est un mono

Corollaire: A->Ext^p(Ext^n(G,R),A) sont les foncteurs dérivés à droite du
foncteur exact à gauche A->Tor_n(A,G)

Prop 4: On a γ^p are isos <=> Ext^q(G,R)=0 pour q \ne n.
                          <=> Tor_q(J,G)=0 pour q \ne n et tout J injective
        [Rem: Ext^n(G,R) \ne 0]. 

Prop 5: en applicant la formule de Kunneth à Hom(P^*,A)=A⊗P_*, on a
        Tor_1(A,G)=Hom(Ext^1(G,R),A)
        A⊗G=Hom(Hom(G,R),A)+Ext^1(Ext^1(G,R,A)

Si G comme plus haut (résolution projective de dim n par des modules de
type fini), ou si G arbitraire de dim proj n et R left coherent et A finiment
représentable. Alors Hom(P_*, A)=P^*⊗A.

Prop 6: On a une suite spectrale
E^2_p,q:=Tor_p(Ext^{n-q}(G,R),A)=>Ext^{n-p-q}(G,A)
Cor: On a γ^p:Ext^{n-p}(G,A)->Tor_p(Ext^n(G,R),A)
où γ_0 est un iso et γ_1 un épi.
Cor 2: A->Ext^n(G,A) est un foncteur exact à droite dont les foncteurs
dérivés à gauche sont donnés par les Tor_p(Ext^n(G,R),A), si G ou A
finiment représentable et R left cohérent.

Prop 7: γ_p sont des isos <=> Ext^q(G,R)=0 pour q \ne n.

Prop 8: si R est left hereditary, Ext^1(G,A) =~ Ext^1(G,R)⊗A
et on a une suite exacte
0->Hom(G,R)⊗A->Hom(G,A)->Tor_1(Ext^1(G,R),A)->0
qui split si R=Z ou G finiment représentable.

Cas général: si F right exact covariant additive functor, tel que
L_{n+1}F=0. Alors L_{n+h}F=0 et si P_* est une résolution proj de G, le
noyau Z_n de P_n -> P_{n-1} est acyclique (car L_k F(Z_n)=L_{n+k} G).
Ainsi on peut supposer que P_* est une résolution de G, avec P_i projectif
si i<n, P_n acyclique et P_{n+h}=0. Si J^* est une résolution injective de
G, P_*(J^*) une résolution du complexe J^* (comme pour G), alors en
considérant F(P_*(J^*)) on a
Th 1: On a une suite spectrale
E_2^pq = H^p(L_{n-q}F(J^*)) => L_{n-p-q} F(G), E_2^p0=R^p L_n F(G).
Corollaire: On a γ^p:R^pL_n F->L_{n-p} F, avec γ^0 iso et γ^1 mono.
γ^p isos <=> L_k F = 0 pour k <= n-1 sur les objets injectifs.

Par dualité, si F exact à gauche tel que R^{n+1}F=0, en considérant
F(J^*(P_*)) où P_* rés proj de G et J^* rés injective de P_*:
Th 1: On a une suite spectrale
E^2_pq = H_p(R^{n-q}F(P_*)) => R^{n-p-q} F(G), E^2_p0=L_p R^n F(G).
Corollaire: On a γ_p:R^{n-p} F-> L_p R^n F, avec γ^0 iso et γ^1 épi.
γ^p isos <=> R^k F = 0 pour k <= n-1 sur les objets projs.

Projective and flat modules
---------------------------

* https://en.wikipedia.org/wiki/Projective_module

P projectif <=> Hom(P,-) est exact <=> si N->>M, P->M se lifte à N
<=> toute suite exacte 0->A->B->P->0 est split <=> P est un direct summand
d'un module libre <=> P a une base duale:  x = ∑ f_i(x) a_i.

- Proj and flat
free => proj => flat => torsion-free
proj => free si R local ou PID or k[x1,...,xn]
flat => proj si R perfect ring
torsion-free => flat si R Dedekind

M is flat if and only if it is a direct limit of finitely-generated free modules.

Si M finitely related (en particulier si M de prés finie), proj <=> flat
Cf https://en.wikipedia.org/wiki/Finitely_generated_module#Finitely_presented,_finitely_related,_and_coherent_modules
A finitely generated projective module is finitely presented, and a finitely related flat module is projective.

- Over commutative rings
A projective module over a local ring is free. Thus a projective module is locally free.

For finitely presented modules M over a commutative ring R,
M flat <=> M proj <=> M loc free (au sens topologie de Zariski ou au sens
des stalks, ou même au sens des stalks en les points fermés)
Moreover, if R is a noetherian integral domain, then, by Nakayama's lemma, these conditions are equivalent to
 dim M ⊗_R k(p) est constant sur les premiers d R, ie M a rang constant.

* Terminologie

- hereditary = all submodules of projective modules over R are again projective. If this is required only for finitely generated submodules, it is called semihereditary.
- https://en.wikipedia.org/wiki/Finitely_generated_module
  finitely generated, finitely related, finitely presented = finitely generated+related (for the same morphism)
  coherent module: finitely generated whose finitely generated submodules are finitely presented (category of coherent modules is an abelian category)
  Si R noeths, finitely gen <=> finitely pres <=> coherent
  A finitely generated projective module is finitely presented, and a finitely related flat module is projective.
  (<=>) R is a right coherent ring.
        The module R is a coherent module.
        Every finitely presented right R module is coherent

NOTES ON TOR AND EXT
--------------------
https://www.math.uchicago.edu/~may/MISC/TorExt.pdf

$ 1. Basic homological algebra

Hom(L⊗M, N) =∼ Hom(L, Hom(M, N))
Hom(L, M)⊗N → Hom(L, M ⊗ N), and this is an isomorphism if either L or N is a finitely generated projective R-module.
Hom(L, M) ⊗ Hom(L′, M′) → Hom(L⊗L′, M⊗M′) which is an isomorphism if L and L ′ are finitely generated and projective or if L is finitely generated and projective and M = R.

* On peut définir un tens et un Hom de chain complexes:
(X⊗Y)_n = ∑_{i+j=n} X_i ⊗ Y_j, d = d ⊗ id + id ⊗ d
(où le produit est gradué en (-1)^mn: the sign is dictated by the general rule that whenever two entities to which degrees m and n can be assigned are permuted, the sign (−1)^mn should be inserted)

Et si X chain complex, Y cochain complex:
Hom(X, Y)^n = ×_q Hom(X_q , Y^{n − q}), (δf)(x) = d(f(x)) − (− 1)^n f(d(x))

Les égalités Hom et ⊗ plus haut restent vrai, en insérant les signes qui vont bien.

* Chain homotopy f=~g <=> chain map h : X⊗I →X′ such that h(x,[0]) = f(x) and h(x,[1])=g(x),
où I est l'intervalle:  0 -> I_1:=R[I] -> I_0:=R[0]+R[1] -> 0, et d[I]=[1]-[0]

Si f=~g:X->X', f*=~g*: Hom(X',M)->Hom(X,M).

Déf: H^∗(X; M) := H^∗(Hom(X, M)).
     H_∗(X; M) := H_∗(X⊗M) 
     X*=Hom(X,R)

$ 2. The universal coefficient and Kunneth theorems 

α : H_∗(X) ⊗ H_∗(Y) → H_∗ (X ⊗ Y)
où H_∗(X) ⊗ H_∗(Y) est gradué en \sum_{p+q=n} H_p(X)⊗H_q(Y)

Si R pid, M module a une résolution 0 → F1 → F0 → M → 0
(car le noyau de F0->>M est sans torsion, donc libre)
ce qui donne
0 → Tor^R_1(M,N) → F1 ⊗ N → F0 ⊗ N → M ⊗ N → 0
et Tor^R_i(M,N)=0 pour i>=2.
et pour les Ext, Ext_R^i(M,N)=0 pour i>=2, et
0 → Hom(M, N) −→ Hom(F0, N) → Hom(F1, N) → Ext_1^R(M, N) → 0


Th 2.1 Universal coeffs: si R pid, X flat chain complex,
0 → H_n(X)⊗M α→ H_n(X⊗M) β→ Tor^R_1(H_{n−1}(X), M) → 0
and the sequence splits (not naturally).

Corollary 2.3. If R is a field, then α: H_∗(X)⊗M → H_∗(X ; M) is a natural isomorphism.

Theorem 2.4 (Kunneth). R PID, X flat chain complex and Y any chain complex.
0 → ∑_{p+q=n} H_p(X)⊗H_q(Y) α→ H_n(X⊗Y) β→ ∑_{p+q=n−1} Tor^R_1(H_p(X), H_q(Y)) → 0
The sequence splits (not naturally).

Corollary 2.5. If R is a field, then
α: H_∗(X)⊗H_∗(Y) → H_∗(X⊗Y) is a natural isomorphism.

Theorem 2.6 (Universal coefficient). R PID, X free chain complex.
0 → Ext^1_R(H_{n−1}(X), M) β→ H_n(X; M) α→ Hom(H_n(X), M) → 0 .
The sequence split (not naturally)
Corollary 2.7. If R is a field
α : H^∗(X;M) → Hom(H_∗(X), M) is a natural isomorphism.

* Cup product:
Hom(X, M)⊗Hom(X′, M′) → Hom(X⊗X′, M⊗M′)
induit en prenant la cohomologie et la map
H^∗(Y)⊗H^∗(Y′) → H^∗(Y⊗Y′):
H^∗(X; M)⊗H^∗(X′; M′) → H^∗(X⊗X′; M⊗M′),
d'où si M=M'=A algèbre
H^∗(X; A) ⊗ H^∗(X′; A) → H^∗(X⊗X′; A).

$ 3. Torsion products
Si X->M->0 résolution proj de M,
   Y->N->0 résolution proj de N,
alors X ⊗_R M <- X ⊗_R Y -> Y ⊗_R N sont des isos (utiliser une suite
spectrale), donc on peut définir Tor(M,N) comme étant le H_* de n'importe
lequel de ces complexes, par ex Tor(M,N)=H_*(X ⊗_R Y)

* 3.3. Change of rings
f:R->S, g:M->P, h:N->Q; M right R module, P right S module, N left R
module, Q left S module, g,h compatible avec f.
Tor^f_∗(g, h): Tor^R_∗(M, N) → Tor^S_∗(P, Q)

Si M S-module f*M R-module (f^*=oubli) à un adjoint à gauche et à droite:
f_! M = M ⊗_R S and f_∗ M = Hom_R (S, M); ie
Hom_S(f_! M, P) ∼= Hom_R(M, f∗P)  and  Hom_R(f∗P, M) ∼= Hom_S(P, f_∗ M)

Proposition 3.8: Tor commute avec la localisation.

* 3.4. Pairings and products.
Dans la situation de $3.3 (sans le f), M⊗P est un right R⊗S-module
and N⊗Q is a left R⊗S-module.
Let X be an R-projective resolution of M and Y be a S-projective resolution of P. Then X⊗Y is an R⊗S-projective resolution of M⊗P.

(X ⊗_R N) ⊗ (Y ⊗_S Q) → (X⊗Y) ⊗_{R⊗S} (N⊗Q) induit
Tor^R_∗(M, N) ⊗ Tor^S_*(P, Q) → Tor^{R⊗S}_∗ (M⊗P, N⊗Q) 

Theorem 3.10.
If R is a commutative ring with augmentation ε: R → k, then
Tor^R_∗(k, k) is a graded commutative k-algebra.

En pratique, si X est une R-résolution proj de K,
X ⊗_R k is a DG k-algebra (up to homotopy), and its homology is Tor^R_∗(k, k) as a k-algebra

Theorem 3.11. Let R be the polynomial algebra k[x1,···, xn].  Then
Tor^R_∗(k, k) is the exterior algebra E[y1,···, yn], where deg(yi) = 1 

Theorem 3.12 (Serre).
Let R be a  (Noetherian) local ring of Krull dimension n.  If Tor^R_q(k, k) is zero for any q > n, then R is regular. 
If R is regular (so its graded algebra is k[x1,...,xn]), then Tor^R_q(M, N) = 0 for all R-modules M and N and all q > n and, as a k-algebra, 
Tor^R_∗(k, k) ∼= E[y1,···, yn]

$ 4. Ext groups

- M left R-mod, N right S-mod, P (R,S) bimodule.
  Hom_R(M,Hom_S(N, P))∼=Hom_S(N,Hom_R(M, P))

- M right R-mod, N (R,S) bimod, P left S-mod.
  Hom_S(M ⊗_R N, P)∼=Hom_R(M,HomS(N, P))

Cor: Si k est l'anneau commutatif de base, M left R-mod, P k-mod.
     Hom_k(M, P) ∼= Hom_R(M,Hom_k(R, P) [Pr: S=k, N=R]

Th 4.8: définition de Ext; Ext^n_R(M,N)=0 si M proj ou N injectif
Si X est une résolution projective de M, Y une résolution injective de N,
on a un iso Hom_R(X,N) -> Hom_R(X,Y) <- Hom_R(M,Y) et l'homologie de l'un
de ces complexes donne le Ext.

Change of rings:
Ext^∗_f(g, h): Ext^∗_R(M, N)→Ext^∗_S(P, Q)
où f:R->S, g:f*P->M, h:f_*N->Q, M,N R-mod, P,Q S-mod

Theorem 4.15. For n≥1, Ext^n(M, N) is naturally isomorphic to the Abelian group of equivalence classes of extensions of N by M of length n.
(cf $ 4.7.Equivalences of long extensions pour la définition exacte; pour
le Ext^1, on a 0->A->B->C->0 =~ 0->A'->B'->C'->0 si on a un diagramme
commutatif qui va bien avec A=A', C=C' et B->B' iso).

Yoneda product: Ext^n_R(N, P) ⊗ Ext^m_R(M, N)→ Ext^{m+n}_R(M, P)
en composant l'extension N-...->P avec celle M-...->N.
=> associative and unital system of pairings on the Ext groups.

Construction directe: le couplage
Hom_R(N, P)⊗Hom_R(M, N)→Hom_R(M, P) induit sur la résolution X->M->0 et
0->N->Y: Hom_R(N, Y)⊗Hom_R(X, N)→HomR(X, Y) d'où un couplage
Ext^n_R(N, P)⊗Ext^m_R(M, N)−→Ext^{m+n}_R(M, P)

On a aussi un couplage externe
Ext^m_R(M, N)⊗Ext^n_S(P, Q)−→Ext^{m+n}_{R⊗S}(M⊗P, N⊗Q)
qui vient de Hom_R(M, N)⊗Hom_S(P, Q)−→Hom_R⊗S(M⊗P, N⊗Q)
qui induit Hom_R(X, N)⊗Hom_S(Y, Q)−→Hom_{R⊗S}(X⊗Y, N⊗Q) (X->M->0, Y->P->0)

When R is an augmented k-algebra, like Tor*^_R(k,k), Ext^∗R(k, k) is also a graded k-algebra. If k is a field, Ext^∗_R(k, k) ∼= (Tor^R_∗(k, k))*, ie we have a bialgebra structure.

Note: if R commutative (resp Hopf algebra over k), Ext^∗_R(k, k) is an Hopf
algebra (resp commutative over k)

Foncteur dérivé
===============

Exemple du produit tensoriel:
----------------------------

\tens B est exact à droite.

Pour mesurer le défaut à gauche on résout M par une suite de projectifs, et
la cohomologie de cette chaine \tens B donne Tor^i(M,B).

(Rappel: P est projectif si Hom(P, -) est exact, comme c'est toujours exact
à gauche, ça veut dire que pour tout épi M ->> M', chaque Hom(P,M') se
relève en Hom(P,M))

Les résolutions projectives de M sont quasi isomorphes (et même isomorphes à
homotopie près).

Si 0 -> M' -> M -> M'' -> 0 est exact, on peut prendre pour résolution de
M la somme directe de la résolution de M' et M''. Donc via le snake lemma,
on a la suite longue de cohomologie.

M est dit flasque si les Tor^i(M,B) sont nuls; on peut remplacer la
résolution projective par une résolution flasque (à cause de la suite
longue de cohomologie).

Suite spectrale
---------------

* Références:
- https://en.wikipedia.org/wiki/Spectral_sequence
- http://math.stanford.edu/~vakil/0708-216/216ss.pdf SPECTRAL SEQUENCES: FRIEND OR FOE? RAVI VAKIL
- http://www.ams.org/notices/200601/fea-chow.pdf You could have invented spectral sequences.
- https://math.berkeley.edu/~hutching/teach/215b-2011/ss.pdf Introduction to spectral sequences
  Introduit les suites spectrales de complexes filtrant et étudie la
  Leray-Serre spectral sequence for homology
- http://www.math.uchicago.edu/~may/MISC/SpecSeqPrimer.pdf
  Extrait du livre de May: More Concise Algebraic Topology: Localization, Completion, and Model Categories
  http://www.math.uchicago.edu/~may/BOOKSMaster.html

Cf Eisenbud:
0) Si on a un couple exact A->A
                            v
                            E
   alors on a un couple dérivé où on remplace A par son image A' dans A et E
   par son homologie E', via d=\beta \beta.
   Alors E' est le terme E_1 de la suite spectrale; et on itère.
   (si on a de la graduation, on met A[1] quelque part).

   Plus exactement, \beta' envoie \alpha a sur la classe d'homologie de
   \beta a, et \gamma' est \gamma sur Ker d (gamma tue automatiquement \im d).

   On itère ainsi pour avoir ^r E= H^{r-1} E; on a alors
   ^{r+1}Z=\gamma^{-1}(im \alpha^r)
   ^{r+1}B=\beta(ker \alpha^r)
   \infty^E=\gamma^{-1}(\cap im \alpha^r)/\beta(\cup ker \alpha^r)

1) Si (F,d) est un module différentiel (dod=0) et \alpha: F->F est un
   monomorphisme, on a une suite exacte
   0->F->F->F/\alpha F->0
   d'où une suite longue de cohomologie qui donne un triangle exact, d'où
   une suite spectrale associée à E=H(F/\alpha F)

   ^{r+1}Z= Im H(F/\alpha^r F)->H(F/\alpha F), ie les éléments x de E représentés par un élément xtilde de F qui est un cycle module alpha^r
   ^{r+1}B= Im HF[\alpha^r], ie les éléments x de E représentés par un élément xtilde de F qui est un cycle et devient un bord modulo alpha^r.
   La différentielle d_r envoie une classe zbar sur \alpha^{-r} dz.

2) On a une suite spectrale pour les complexes filtrés.
   E_r^p,q => H^{p+q}(C)
   c'est à dire converge vers la partie filtrée G^p H^n := F^p H^n / F^{p+1} H^n où n=p+q
   Vient de l'exemple précédent où on prend CC=\oplus C^p; alpha: C^{p+1}
   -> C^p, et donc on a le couple exact
   H^{p+q}(F^{p+1} C)->H^{p+q}(F^p} C) et en bas on a E=H^{p+q}(G^p C)

   En effet,
   ^{r+1}Z^p={zbar \in 1^E^p | z \in C^p et dz \in G^{p+r+1}}
            =({z \in C^p | dz \in C^{p+r+1}}+C^{p+1}) / (dC^p+C^{p+1})
   ^{r+1}B^p={zbar \in 1^E^p | z \in C^p et z=dy où y \in G^{p-r}}
            =({G^p \cap dG^{p-r}}+C^{p+1}) / (dC^p+C^{p+1})
   \infty^E= \cap ({z \in C^p | dz \in C^{p+r}}+C^{p+1}) / \cup ({G^p \cap dG^{p-r}}+C^{p+1})
   tandis que
   G^p HC = ({z \in C^p | dz=0}+C^{p+1})/(C^p \cap dG + G^p+1)
   donc gr HC est un sous-quotient de \infty^E.

   Et la suite spectrale converge vers gr HC si on a équalité dans les
   numérateurs et dénominateurs (c'est le cas pour une filtration finie, ou
   une filtration m-stable)

3) Si on a un complexe double C_ij, on a deux graduations sur le complexe total
   Tot C_n = \oplus_{i+j=n} C_ij, celle en i et celle en j
   donc deux suites spectrales, dont la première est
        I^Ep,q^1 = H_q^II(C_p,∙), ie d_1: C_p,q -> C_p,q-1
        I^Ep,q^2 = H_p^I(H_q^II (C∙,∙)), ie d_2: H^II_q(C_p,.)->H^II_q(C_{p+1},.)
   et qui convergent en p (resp. en q) vers H^{p+q}(Tot C) (attention: en
   général pour des graduations différentes).
   (convergence si on est dans le premier quadrant pour l'homologie ou le
   troisième pour la cohomologie)

### Suites courtes

https://en.wikipedia.org/wiki/Five-term_exact_sequence
    0 → H^0(A) → E_1^0,0 → E_1^0,1.
    0 → E_2^1,0 → H^1(A) → E_2^0,1 → E_2^2,0 → H^2(A).
    0 → E_2^1,0 → H^1(A) → E_2^0,1 → E_2^2,0 → Ker(H^2(A) → E_2^0,2) → E_2^1,1 → E_2^3,0.

Exemple:
  The inflation-restriction exact sequence
    0 → H^1(G/N, A^N) → H^1(G, A) → H 1(N, A)^{G/N} → H^2(G/N, A^N) →H^2(G, A)
  in group cohomology arises as the five-term exact sequence associated
  to the Lyndon–Hochschild–Serre spectral sequence
    H^p(G/N, H^q(N, A)) ⇒ H^{p+q}(G, A)


### Exemples

* https://pbelmans.ncag.info/notes/spectral-sequences-examples.pdf

- Grothendieck spectral: E^p,q_2=R^pG(R^qF(A))⇒R^{p+q}(G◦F)(A)
- The Cech to derived functor: E^p,q_2=ˇH^p(U,H^q(X,F))⇒H^{p+q}(X,F)
- Leray: E^p,q_2=H^p(Y, R^qf∗(F))⇒H^{p+q}(X,F)
- Base change for Tor and Ext spectral sequence
  E^2_p,q=Tor^B_p(Tor^A_q(M,B),N)⇒Tor^A_{p+q}(M,N)
  E_2^p,q=Ext_B^p(M,Ext_A^q(B,N))⇒Ext_A^{p+q}(M,N)
- Hodge-to-de Rham spectral sequence
  E^p,q_1=H^q(X,Ω^p_X/C)⇒H^{p+q}_dR(X/C)
  degenerates at the E1 page if X compact Kahler manifold.
  E^p,q_1=H^q(X,Ω^p_X/k)⇒H^{p+q}_dR(X/k)
- Ext spectral sequence
  E^p,q_2=Ext^p_X(H^−q(F•),G•)⇒Ext^{p+q}_X(F•,G•)
 

* https://en.wikipedia.org/wiki/Grothendieck_spectral_sequence
 E_2^{p,q}=(R^p G ∘ R^q F )(A) ⟹ R^{p+q}(G∘F)(A).
 The exact sequence of low degrees reads
    0 → R1G(FA) → R1(GF)(A) → G(R1F(A)) → R2G(FA) → R2(GF)(A).
Preuve: on prend une résolution injective I de X, on a un complexe F(I) et
l'on prend une résolution de Cartan Eilenberg injective II de F(I),
R(GoF)(I)=RG F(I)==G(Tot II)=Tot(G(II)), d'où la suite spectrale qui vient
de la suite spectrale double de complexes.

* https://en.wikipedia.org/wiki/Leray_spectral_sequence
Cas particulier avec F=f_* et G=\Gamma
 H^p(Y,R^q f_*F) => H^{p+q}(X, F)

* https://en.wikipedia.org/wiki/Hyperhomology
There are two hypercohomology spectral sequences; one with E2 term H^i(R^jF(C))
and the other with E1 term R^jF(C^i) and E2 term R^jF(H^i(C))
both converging to the hypercohomology
    H^{i+j}(C)

\delta-foncteur
---------------

Pour l'homologie, si F est exact à gauche et A (catégorie abélienne) a
assez d'injectif, je peux définir H^iF(A) comme l'homologie d'une
résolution injective de A. On peut remplacer la résolution injective par
une résolution acyclique.
Cf aussi:
https://math.stackexchange.com/questions/2554614/right-derived-functor-and-f-acyclic-objects
https://math.stackexchange.com/questions/2764592/why-is-the-full-subcategory-of-flabby-sheaves-f-injective

Les H^iF forment un delta foncteur universel:
- une suite exacte 0->A->B->C->0 donne une suite exacte longue, en
  particulier H^iF(C)->H^{i+1}F(C)
- ce morphisme de connection commute avec les morphismes de suite exacte
- universel veut dire que si j'ai un autre delta foncteur T, il
  suffit de se donner une transformation naturelle H^0F -> T^0
  pour avoir une transformation naturelle sur tous les i: H^iF -> T^i

Th (Grothendieck, Tohoku Prop 2.2.1)
Si T est un delta-foncteur, tel que T^i est effaçable pour tout i>0
(ie pour tout A il existe un mono m:A->M tel que T^i(m)=0)
alors T est universel; et la réciproque est vraie si tout objet A admet un
effacement injectif.

[Pour la définition d'un effacement injectif voir
https://math.stackexchange.com/questions/44382/meaning-of-efface-in-effaceable-functor-and-injective-effacement
I est injectif <=> id: I->I est un effacement injectif, et tout
monomorphisme A->I est un effacement injectif, donc en particulier la
réciproque est vraie si on a assez d'injectif]

| Plus généralement, on peut définir un foncteur dérivé quand (cf
| math.stackexchange plus haut, ou la partie sur les foncteurs dérivés plus
| bas):
| Suppose C is an abelian (or more generally an exact) category and assume that F:C→D is a functor to an abelian category D.
| 
| Theorem. If there exists a full subcategory A of C 
| such that
| 1) A is closed under extensions: if 0→A′→C→A′′→0 is exact in C then C is an object of A.
| 2) The restriction of F to A is exact.
| 3) For every object of C there exists a monomorphism C→A with A in A.
| 4) For every short exact sequence 0→A′→C→C′′ with A′ in A there exists a commutative diagram
|    0→A′→C→C′′→0
|      ∥  ↓ ↓
|    0→A′→A→A′′→0
| where the second row is exact and A,A′′ are in A.
| => Then F admits a right derived functor.
| 
| Notes:
| 1) The technical condition 4. is satisfied in presence of 3. if A is supposed to be closed under quotients in C. That is: Whenever 0→A′→A→C→0 is short exact then C is an object of A.
| 2) No left exactness of F on C is imposed: this is only needed to guarantee that R0F=F. In general, R0F is the best left exact approximation to F. In highbrow terms: R0 can be seen as reflection of the inclusion of the left exact functors into all additive functors.
| 3) The right derived functors of F can be computed by choosing for each C an A-resolution — which exists due to the effaceability conditions 2 and 3.
| 4) The objects of A are called F-acyclic or adapted to F if A satisfies the hypotheses of the theorem.
| 
| Final remarks (coming back to effaceability):
| 1) The above theorem admits a partial converse: if F admits a right derived
| functor, the category A(F) of F -acyclic objects (a notion I don't want to
| define in full generality here), satisfies conditions 1., 2. and 4. above.
| The effaceability of the higher right derived functors is thus seen as the
| part missing from a complete characterization of derived functors.
| 
| 2) The usefulness of injective effacements is of course that injective
| objects are F -acyclic for every additive functor. This is because short
| exact sequences of injectives split, by definition of injectivity. In
| particular, every functor on an abelian category with enough injectives can
| be derived (not only left exact ones).
| 
| Proof: The conditions ensure (1.) that A is an exact category (thus D(A)
| is defined following Neeman) (2.) the restriction of F trivially descends
| to D(A) and that the natural functor D+(A)→D+(C) is fully faithful (4.) and
| essentially surjective (3.) and thus an equivalence. The total derived
| functor R+F is then defined by inverting this equivalence and composing
| with the restriction.


Catégorie dérivée
=================

https://mathoverflow.net/questions/39508/a-down-to-earth-introduction-to-the-uses-of-derived-categories

Référence: - https://webusers.imj-prg.fr/~bernhard.keller/publ/dcu.pdf
           Derived categories and their uses
           - Stacks project

https://en.wikipedia.org/wiki/Hyperhomology
https://en.wikipedia.org/wiki/Derived_category
- The basic object is the category Kom(A) of chain complexes 
- Pass to the homotopy category of chain complexes K(A) by identifying morphisms which are chain homotopic.
- Pass to the derived category D(A) by localizing at the set of
  quasi-isomorphisms. Morphisms in the derived category may be explicitly
  described as roofs X ← X' → Y, where X' → X is a quasi-isomorphism and X'
  → Y is any morphism of chain complexes.

Note: si A a assez d'injectif, on a une équivalence de catégorie
   D+(A)→ K+(Inj(A))

En fait si I est une résolution d'un objet X par des injectifs, alors le
complexe I est quasi-isomorphe au complexe (avec un seul objet) X. Plus
généralement, étant donné un complexe C, on peut toujours trouver (si on a
assez d'injectif) un complexe I qui lui est quasi-isomorphe. Le foncteur
dérivé RF est simplement le complexe F(I). L'homologie de ce foncteur
dérivé redonne RF^i pour un objet X, et donne l'hyperhomologie pour un
complexe C.

Catégorie triangulée
--------------------

D est une catégorie additive, on a un shift [n]: C->C[n] (comme le shift
d'un complexe), un triangle X,Y,Z est donné par trois morphismes
X->Y, Y->Z, Z->X[1].

On a des triangles distingués (stables par iso) (penser à Z comme Y/X) tels
que:
- X,X,0 est distingué
- f:X->Y se complète en un triangle
- X,Y,Z,f,g,h est distingué ssi Y,Z,X[1],g,h,-f[1] est distingué
- si on a deux triangles X,Y,Z et X',Y',Z', un morphisme de X->X' et Y->Y'
  se complète en Z->Z'
- si on a X,Y,Q1 et Y,Z,Q3, alors on a Q1,Q2,Q3 tel qu'on ait les
  morphismes X,Y,Q1->X,Z,Q2 et X,Z,Q1->Y,Z,Q3
  [Q1 est Y/X, Q2=Z/X et Q3=Z/Y, Q1,Q2,Q3 distingué dit que
  (Z/X)/(Y/X)=~(Z/Y); et les deux morphismes correspondent à Y/X->Z/X et
  Z/X->Z/Y].

Note: le signe dans la rotation permet de voir que quand on prend la longue
suite X->Y->Z->X[1]->Y[1]->Z[1]...
       f  g  h    -f[1]  -g[1]
alors 4 termes consécutifs donnent un triangle distingué.

Un foncteur homologie est un foncteur H=T->A (A catégorie abélienne) exact,
ie H(X)->H(Y)->H(Z) est exact. On note H^n=Ho[n], en appliquant H à la
suite triangulée longue on alors une suite longue longue H^i -> ... dans A.

Un delta-foncteur de A vers T est un foncteur qui associe
(fonctoriellement) un triangle distingué à une suite exacte.
En particulier par ce qui précède, un foncteur homologique composé à un
delta foncteur est un delta-foncteur au sens des catégories abéliennes.

The homotopy category
---------------------

Soit A une catégorie additive.
La catégorie C(A) des complexes n'est pas triangulaire, mais K(A), celle des
complexes à homotopie près l'est.

- Si C est un complexe, on peut le remplacer dans K(A) par un complexe D où
chaque D_i -> D_{i+1} est une injection split.
- Si f:C->D est un morphisme de complexe, on peut remplacer D par D' où
f:C->D' est une injection split, ie C->D'->E' est une suite exacte split;
dans ce cas on a un triangle C->D'->E'->C[1]; et il est isomorphe dans K(A) au
triangle donné par le mapping cone C->D->C(f)->C[1].

K(A) est alors une catégorie triangulaire (donné par les suites exactes
splits). Cependant Complexe(A)->K(A)
n'est pas un delta-foncteur; donc on localise K(A) en les quasi-iso pour
avoir la catégorie dérivée D(A) [*ici on suppose A abélien*], et
Complexe(A)->D(A) est un delta-foncteur.

Exemple: H:K(A)->A est homologique.

En effet si 0->A->B->C->0 est une suite exacte de complexe, f:A->B alors C
est quasi-ismorphe à C(f), donc on peut voir A->B->C comme un triangle
distingué dans D(A)

Foncteur dérivé
---------------

### Foncteur dérivé dans les catégories triangulées

Si F:D->D' est un foncteur exact de catégorie triangulé, S un ensemble de
morphisme, on se demande s'il passe à S^{-1}D. On appliquera à D=K(A) et
S=quasi-isomorphisme pour définir le foncteur dérivé.

On dit que RF(X) est défini en X si s:X->X' \in S \mapsto F(X') est
essentiellement constant.
La catégorie E des objets où RF(X) est bien défini est a "strictly full
triangulated subcategory of D", RF:E->D' est exact, si s \in S a une source
ou but dans E e alors s est un morphisme de E et RF(s) est un iso, S_E^{-1}
E -> S^{-1} D est exact fidèlement plein (et E est saturée si D'
Karoubian), et RF: S_E{-1} E->D' est exact.

Déf: X calcule RF si RF est défini en X et F(X)->RF(X) est un iso.

Prop: si I est un ensemble d'objet tel que pour tout X, il existe s:X->X'
avec X'\in I, s \in S et pour tout s \in S \cap I, F(s) est un iso, alors
RF est défini partout et X' \in I calcule RF, et donc RF(X)=F(X') avec les
notations précédentes.

Lemme: on a une application canonique R(GoF) -> RG o RF' où F': D->S'^{-1}D' est la composition de F avec le localisé D'->S'^{-1}D'.

### Application à la catégorie homotopique

Attention:
Pour les foncteurs dérivées, ici on fait de l'homologie donc on regarde des
complexes bornés à gauche, donc mes K(A), D(A) devraient être des K^+(A)
D^+(A). Dans Stack projects ils montrent que des résultats s'étendent au
vrai K(A); par exemple si C est un complexe dont l'homologie est nulle pour
i<<0, alors il est quasi-isomorphe à un complexe nul pour i<<0.

On applique ça à F:A->B foncteur additif entre catégories abéliennes,
F induit un foncteur exact F:K(A)->K(B). On dit que X est RF-acyclique si
X[0] calcule RF pour S=quasi-iso (X[0] est le complexe concentré à X en 0)

Si RF es défini partout, alors on a RF: A -> D(B) défini comme la
composition de (cf Lemme 13.7.6)
A->Comp(A), X->X[0] qui est exact
Comp(A)->D(A) qui est un delta-foncteur
RF: D(A)->D(B) qui est exact
Et les RF^i viennent de la composition avec le shift et H^0: D(B)->B qui
est un foncteur homologique. (H^0 passe à la localisation K(A)->D(A), cf
lemme 13.11.2).
Comme H^0: K(A)->A est homologique, ie si A->B->C est un triangle
distingué, H^0(A)->H^0(B)->H^0(C) est exact; on en tire une suite longue
d'homologie, donc les RF^i sont des delta-foncteur (universels si tout X
est inclus dans un RF-acyclique).

### Acyclicité

Prop: si I est un ensemble d'objet tel que
(i) tout X est un sous-objet d'un X' dans I
(ii) pour toute suite exacte 0->P->Q->R->0 avec P,Q \in I, alors R \in I
(ie I stable par quotient) et 0->F(P)->F(Q)->F(R)->0 est exact, 
alors RF est défini partout et les objets de I sont acycliques pour RF.
[De plus (i) => pour tout complexe C il existe un quasi-isomorphisme C->C'
qui est injectif en tout degré, avec C'_n dans I]

Déf: si RF est défini partout, on note R^iF=H^i o RF; on a:
- R^0F est exact à gauche, et F->R^0F est un iso ssi F est exact à gauche.
- A est RF-acyclique ssi F(A)->R^0F(A) est un iso et R^iF(A)=0 pour i>0.
- si 0->A->B->C->0 est exact, et A,C RF-acycliques, ou A,B RF-acycliques, ou B,C
  RF-acycliques et F(B)->F(C) surjectif; alors le troisième est RF-acyclique et
  0->F(A)->F(B)->F(C)->0 est exact.
- Les R^iF sont des \delta-foncteur et si tout objet X est inclus dans un
  RF-acyclique, alors R^iF est un \delta-foncteur universel.
- si C est un complexe d'RF-acyclique, alors F(C)->RF(C) est un iso, ie C
  calcule RF.

Th: si tout objet de A est inclus dans un RF-acyclique, alors RF est défini
partout, RF:D(A)->D(B) est exact, et un complexe d'RF-acyclique calcule RF, et
tout complexe est quasi-isomorphe à un tel complexe.
[Rem: quelque part être défini sur les objets suffit à être défini sur tous
les complexes dans K(A)]

Rem: si F est exact, tout objet est RF-acyclique, F=RF sur les complexes, et
RF^i=0. (En effet, F préserve l'acyclicité d'un complexe, donc via le
mapping cone les quasiisomorphismes).

On peut généraliser la proposition ainsi: cf dcu.pdf $12
Si BB \subset AA is a fully exact subcategory (fully = clos par extension)
Définissons les conditions:
C1) pour tout A il y a une suite exacte A->B->A'
C2) pour toute suite exacte B->A->A', on a une morphisme de cette suite
vers une suite exacte B->B'->B''.
Th: C1 => tout complexe dans AA est qis a un complexe dans BB, en
          particulier D(B)->D(A) est essentiellement surjectif
    C2 => K(B) est cofinale dans K(A) par rapport aux qis, en particulier
          D(B)->D(A) est pleinement fidèle.
Rem: si on a C1 + stabilité par quotient on a C2.

Application, cf $15:
- si BB vérifie (C2) et F|BB est exact, alors les objets de BB sont
  RF-acycliques.
  [note: apparemment en regardant la prop dans stack project, avec la
  condition C1+stabilité par quotient (ce qui implique C2), ils n'ont pas
  besoin de supposer BB stable par extension]
- réciproquement la catégorie des RF-acycliques est fully exacte, vérifie
  (C2) et F est exact dessus
- si F a assez de RF-acycliques (ie d'inclusion X-> acyclique), alors F est
  définie partout, et on peut définir RF(Complexe) par F(Complexe acyclique
  qui lui est quasi-isomorphe).

### Résolution injective

Déf: une résolution injective d'un complexe C est un quasi-iso C->I où I_n
est injectif. Si C=X[0], ça redonne la résolution injective 0->X->I_1 ->...
classique. Ca existe toujours si A a assez d'injectif.

Lemme 13.20.1: si I est un complexe d'injectif, I calcule RF relativement
aux quasi-iso pour tout fonteur exact K(A)->K(B); I est RF-acyclique pour
tout foncteur additif A->B.

Prop 13.23.1: si A a assez d'injectif, K(I)->D(A) est une équivalence de
catégorie triangulée.
De plus on a un (unique) foncteur de j:K(A)->K(I) tel que j induit un
quasi-isomorphisme C->j(C) et qui commute avec D(A). j est exact et s'écrit
j=j' o Q où Q est la localisation K(A)->D(A) et j':D(A)->K(I) vient de
l'équivalence de catégorie.
On a alors RF=Foj.

Section 13.21: Cartan-Eilenberg resolution
(si C est un complexe, on veut obtenir j(C) un complexe d'injectif
quasi-isomorphe à C. F(j(C)) est alors RF(C), et l'homologie de F(j(C))
donne donc l'hyperhomologie de C. On peut prendre une résolution I^.. de
Cartan-Eilenberg de C, Tot(I) sera alors qis à C).

Si A a assez d'injectif, C un complexe, une résolution de Cartan-Eilenberg
est un double complexe d'injectif I tel qu'on ait
- une résolution de chaque C_i par des injectifs
- une résolution du noyau, image, homologie par le noyau/image/homologie
  correspondante sur les I.
Alors C->le total complexe de I est un quasi-iso, donc
RF(C)=F(Tot(I)), et si on regarde les deux suites spectrales associées (qui
convergent vers H*(RF(C)) on a E_1^p,q=R^qF(C^p) et E'_2^p,q=R^pF(H^q(C)).

### Applications

Lemme 13.22.1: F:A->B, G:B->C, A, B ont assez d'injectif.
R(Gof) =~ RG o RF <=> F(I) est RG-acyclique pour tout injectif I de A.
On a alors la suite spectrale de Grothendieck qui converge vers R*(GoF)(X)
et vérifie E_2^p,q=R^pG(R^q(F(X)).

Déf 13.27.1: Ext^i_A(X,Y)=Hom_D(A)(X,Y[i]).

https://webusers.imj-prg.fr/~bernhard.keller/publ/dcu.pdf
Si F et G sont des R-faisceaux sur X, Y (de dim cohomologie finis), on a
RGamma(X,F) \Ltens_R RGamma(Y,G) = RGamma(X x Y, F \Ltens_R G).
RGamma(X,F) \Ltens_R S = RGamma(X, F \Ltens_R S).

Cohomologie et hypercohomologie:
si A->C_1->C_2->... est une résolution, alors le complexe A est qis au
complexe C, donc RF(A)=RF(C), ie la cohomologie de A est l'hypercohomologie
de C. Si de plus les éléments de C sont acycliques, alors l'homologie de
F(C) donne RF^i(A). [En effet, un complexe d'acyclique calcule RF].

Application: pour une variété diff, une résolution du faisceau constant R
est donné par les faisceaux des différentielles Omega^i, à cause du Lemme
de Poincarré (localement toute forme diff est exacte). De plus les Omega^i
sont acycliques car flasque car on a des partitions de l'unité), donc la
cohomologie de De Rham (vue comme homologie des différentielles globales)
calcule la cohomologie du faisceau constant.
