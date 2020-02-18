vim: ft=markdownlight fdm=expr

Références
==========

! Introductions:
- https://arxiv.org/abs/math/9802029 Categorification, John C. Baez, James Dolan
- https://arxiv.org/abs/0903.0340 Physics, Topology, Logic and Computation: A Rosetta Stone, John C. Baez, Mike Stay
- https://arxiv.org/pdf/1803.05316.pdf Seven Sketches in Compositionality: An Invitation to Applied Category Theory, Brendan Fong, David I. Spivak
- https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/
  -> Nice illustration of ends: https://bartoszmilewski.com/2017/03/29/ends-and-coends/

! Higher categories
- https://arxiv.org/abs/math/0608420
  Lectures on n-Categories and Cohomology, John C. Baez, Michael Shulman
       The goal of these talks was to explain how cohomology and other tools of algebraic topology are seen through the lens of n-category theory. Special topics include nonabelian cohomology, Postnikov towers, the theory of "n-stuff", and n-categories for n = -1 and -2. The talks were very informal, and so are these notes. A lengthy appendix clarifies certain puzzles and ventures into deeper waters such as higher topos theory. For readers who want more details, we include an annotated bibliography.

- http://www.tac.mta.ca/tac/reprints/articles/10/tr10.pdf
  BASIC CONCEPTS OF ENRICHED CATEGORY THEORY G.M. KELLY, F.A.A
- https://arxiv.org/abs/math/0305049
  Higher Operads, Higher Categories, Tom Leinster
    Higher-dimensional category theory is the study of n-categories, operads, braided monoidal categories, and other such exotic structures. It draws its inspiration from areas as diverse as topology, quantum algebra, mathematical physics, logic, and theoretical computer science. This is the first book on the subject and lays its foundations.
    Many examples are given throughout. There is also an introductory chapter motivating the subject for topologists.

! Site web:
- https://ncatlab.org/nlab/show/Todd+Trimble
  https://ncatlab.org/toddtrimble/published/HomePage
- https://ncatlab.org/nlab/show/Urs+Schreiber
- https://ncatlab.org/nlab/show/Mike+Shulman
  https://home.sandiego.edu/~shulman/papers/index.html

! Papiers:
* Logique
- https://arxiv.org/pdf/0810.1279.pdf
  SET THEORY FOR CATEGORY THEORY, MICHAEL A. SHULMAN
* Monads:
- https://www.irif.fr/~mellies/mpri/mpri-ens/articles/hyland-power-lawvere-theories-and-monads.pdf
  The Category Theoretic Understanding of Universal Algebra: Lawvere Theories and Monads
- http://www.tac.mta.ca/tac/volumes/28/13/28-13abs.html
  Codensity and the ultrafilter monad, Tom Leinster
  https://golem.ph.utexas.edu/category/2012/09/where_do_ultrafilters_come_fro.html
* Flêches
- http://home.sandiego.edu/~shulman/papers/generators.pdf
  GENERATORS AND COLIMIT CLOSURES, MICHAEL A. SHULMAN
- G. M. KELLY A survey of totality for enriched and ordinary categories Kelly_Survey_totality.djvu (cf Total Category)
  Kelly_Classes_Morphisms_Closed_Under_Limits_JKMS-23-1-1-18.pdf
  Kelly_Conservative_Functors_JKMS-23-1-19-33.pdf
  Kelly_monomorphisms_epimorphisms_and_pullbacks.pdf
  Kelly_Descent_Functors.pdf
  Kelly_unified_treatment_of_transfinite_constructions_for_free_algebras_free_monoids_colimits_associated_sheaves_and_so_on.pdf
  (cf https://ncatlab.org/nlab/show/transfinite+construction+of+free+algebras pour un résumé => they can all be reduced to the case of free algebras for well-pointed endofunctors.)
* Types de catégories
- http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.732.4603&rep=rep1&type=pdf
  Michael Barr, Exact Categories
- http://www.tac.mta.ca/tac/volumes/27/7/27-07.pdf
  EXACT COMPLETIONS AND SMALL SHEAVES MICHAEL SHULMAN
- http://www.tac.mta.ca/tac/volumes/10/16/10-16abs.html, Simultaneously Reflective And Coreflective Subcategories of Presheaves, Robert El Bashir and Jiri Velebil 
- https://pdfs.semanticscholar.org/9ded/893391c4cbe24f74e46bcb6f326826e04049.pdf
  A classification of accessible categories
  Jiˇrı Adamek, Francis Borceux, Stephen Lack, Jiˇrı Rosicky
  (Généralisation de la notion d'accessible de lambda-filtered colimits a des D-filtered colimits pour une catégorie D).

! Books:
- https://projecteuclid.org/download/pdf_1/euclid.bams/1183657056
  Accessible categories: The foundations  of categorical model  theory, by  Michael  Makkai  and  Robert  Paré. Review
- https://www.oliviacaramello.com/Talks/TheoryToposTheoreticBridgesFiveYearsLaterCaramello.pdf
  Book: Theories, Sites, Toposes
- http://www.math.jhu.edu/~eriehl/context.pdf
  Category Theory in Context Emily Riehl
  With a very nice appendix 'Epilogue: Theorems in Category Theory' which
  state the central theorems
- http://www.math.jhu.edu/~eriehl/cathtpy.pdf
  Categorical homotopy theory, Emily Riehl
- http://www.math.jhu.edu/~eriehl/elements.pdf
  Elements of ∞-Category Theory, Emily Riehl and Dominic Verity

Exemples de catégories
======================

Catégories flêches
------------------

https://ncatlab.org/nlab/show/comma+category
Si f:C->E, g:D->E sont deux foncteurs, on peut définir la catégorie
f/g où les objets sont des flêches f(x)->g(y)
et les flêches sont des flêches x->x', y->y' faisant commuter le diagramme
f(x) -> g(y)
 |       |
f(x')->g(y')

On a des foncteurs d'oublis évident de f/g vers C et D (f(x)->g(y) \mapsto
x ou y), et une transformation naturelle évidente
f/g - (oubli) -> C - f -> E
           =>
f/g - (oubli) -> D - g -> E

f/g est le pullback de E^I->ExE où I={->} par fxg : CxD->ExE.

Exemples:
- If f and g are both the identity functor of a category C, then (f/g) is the category C^2 of arrows in C.
- If f is the identity functor of C and g is the inclusion 1→C of an object c∈C, then (f/g) is the slice category C/c.
- Likewise if g is the identity and f is the inclusion of c, then (f/g) is the coslice category c/C.

A natural transformation τ:F→G with F,G:C→D may be regarded as a functor T:C→(F/G) with T(c)=(c,c,τ c) and T(f)=(f,f). Conversely, any such functor T such that the two projections from (F/G) back to C are both left inverses for T yields a corresponding natural transformation.

F et G sont adjoints ssi F/Id \iso Id/G au dessus de CxD.

Catégorie topologique
---------------------
https://ncatlab.org/nlab/show/topological+concrete+category
A topological category is a concrete category with nice features matching the ability to form weak and strong topologies in Top.

Catégorie of elements
---------------------

* https://ncatlab.org/nlab/show/category+of+elements

Foncteurs
=========

Propriétés de base
------------------

Si F est fidèle, il reflète les monos.
Si F est pleinement fidèle, il est conservatif.

* https://ncatlab.org/nlab/show/functor+category

* https://ncatlab.org/nlab/show/conservative+functor

A functor F:C→D is conservative if it is “isomorphism-reflecting”
Si F est conservatif, C a les éqs et F les préserve, alors F est faithful.

Ex: Let C be a category with pullbacks. Given any morphism f:X⟶Y, write
f *:C/Y->C/X for the functor of pullback along f between slice categories (base change). If strong epimorphisms in C are preserved by pullback, then the following are equivalent:
  - f is a strong epimorphism;
  - f* is conservative.

* https://ncatlab.org/nlab/show/preserved+limit
If J:I→C is a diagram and x is its limit in C, then we may naïvely say that this limit is preserved by a functor F:C→D if F(x) is the limit of the composite diagram I →J C →F D. However, it is not enough to state this at the level of objects; we also need to impose some coherence conditions, preserving the entire universal cone. Furthermore, we can use a trick involving the Yoneda embedding to get a meaningful condition even if J has no limit in C at all.

* https://ncatlab.org/nlab/show/reflected+limit
A functor is said to reflect limits (colimits) of a given shape if a cone (cocone) is (co-)limiting whenever its image under F is.

* Creating limits: https://ncatlab.org/nlab/show/created+limit
Let F:C→D be a functor and J:I→C a diagram, and suppose that the composite F∘J has a limit. We say that F creates this limit if J has a limit, and F both preserves and reflects limits of J.
A monadic functor creates all limits that exist in its codomain, and all colimits that exist in its codomain and are preserved by the corresponding monad (or, equivalently, by the monadic functor itself).

Type de foncteurs
-----------------

* https://ncatlab.org/nlab/show/cartesian+functor

* https://ncatlab.org/nlab/show/regular+functor
preserve finite limits and regular epimorphisms

* https://ncatlab.org/nlab/show/coherent+functor
=regular functor + preserve finite unions

* https://ncatlab.org/nlab/show/monoidal+functor
lax/strong monoidal functor: Morphism of monoidal categories

* https://ncatlab.org/nlab/show/anafunctor
An anafunctor F:C→D is a generalized functor.

* https://ncatlab.org/nlab/show/final+functor
A functor F:C→D is final (often called cofinal), if we can restrict diagrams on D to diagrams on C along F without changing their colimit.

* https://ncatlab.org/nlab/show/concrete+category
Foncteur fidèle de C dans Set.

Theorem 4.4. A finitely complete category is concretizable, i.e., admits a faithful functor to Set, if and only if it is well-powered with respect to regular subobjects.

Accessible functor
------------------
* https://ncatlab.org/nlab/show/accessible+functor
 κ-accessible functor (for κ a regular cardinal) if C and D are both κ-accessible categories and F preserves κ-filtered colimits

Cf Borceux, Vol 2, Th 5.5.7
F a rank (=accessible) si F preserve des alpha-filtered colimits pour un certain ordinal

F: A accessible -> Set est accessible ssi F est une small-colimite de foncteurs représentables;
F: A->B accessibles est accessible ssi Hom_B(x, F.) est accessible pour tout
x dans B; un tel F satisfait la solution set condition.

Cf aussi https://ncatlab.org/nlab/show/accessible+category

Proposition 3.6. (adjoint functors)
Every accessible functor satisfies the solution set condition, and every left or right adjoint between accessible categories is accessible. Therefore, the adjoint functor theorem takes an especially pleasing form for accessible categories: a functor is a left (resp. right) adjoint iff it is accessible and preserves all small colimits (resp. limits).

Solid and topological functor
-----------------------------

* https://ncatlab.org/nlab/show/solid+functor
=semi-topological

Let U:A→X be a faithful functor. A U-structured sink is a sink in X of the form (Ua_i →^f_i x). Note that the indexing family i∈I need not be a set, it can be a proper class. A semi-final lift of such a U-structured sink consists of a morphism x →g Ub in X such that
  - Every composite g∘f_i:Ua_i→Ub is in the image of U.
  - g is initial with this property
U is called solid if every U-structured sink has a semi-final lift

Examples
  - Any topological functor is solid. Indeed, a functor U is topological just when it has final lifts for all U-structured sinks, where a final lift is a semi-final lift for which g is an isomorphism.
  - Any monadic functor into SetSet is solid.
  - A fully faithful functor is solid if and only if it has a left adjoint.
  - If U:A→X is faithful and has a left adjoint, and moreover A is cocomplete and well-copowered, then U is solid.
  - For C a cofibrantly generated model category with monic generating cofibrations, the forgetful functor from algebraic fibrant objects to C is solid

U solid => U has a left adjoint, A a les colimites de X (en semi-liftant
une colimite dans X), X cocomplet ou X total => A aussi.

[Preuve: Tholen https://www.cambridge.org/core/journals/bulletin-of-the-australian-mathematical-society/article/note-on-total-categories/93A6C31D6B0376AE30237095915138EC
It is shown that, for a semi-topological(=solid) functor T: A → X, the category A is total, that is, the Yoneda embedding of A has a left adjoint, if X is total. In particular, monadic categories over Set (possibly without rank) are total, and full reflective subcategories of total categories are total.
La preuve utilise le fait que T:A->X est semi-topologique si T est la
restriction d'un foncteur topologique B->X où A est réflective dans B.]

* https://ncatlab.org/nlab/show/topological+concrete+category
U:C→D tel que pour toute U-source X->U(S_i) il existe un initial lift T/ U(T)=X.
U est automatiquement faithfull; et U est topologique ssi U^op l'est, donc
il existe aussi un final lift T de X pour tout U-sink U(S_i)->X.
[This is a categorification of the theorem that any complete semilattice is a complete lattice.]

Ex: U:Top->Set est topologique.

Properties
 - If C is topological over D, then so is any full retract of C, as long as the functors involved live in Cat/DCat/D.
 - In particular, a reflective or coreflective subcategory of C is topological, as long as the reflectors or coreflectors become identity morphisms in D.
 - The forgetful functor U:C→D is not only faithful but also (for different reasons) essentially surjective. Thus it is never full (except in the trivial case where U is an equivalence, of course).
 - If D is complete or cocomplete, then so is C.
 - If D is total or cototal, then so is C; see solid functor.
 - If D is mono-complete or epi-cocomplete, then so is C.
 - If D is well-powered or co-well-powered, then so is C.
 - If D has a factorization structure for sinks (E,M), then C has one (E′,M′), where M′ is the collection of morphisms in C lying over M-morphisms in D, and E′ the collection of final sinks in C lying over E-sinks in D. This generalizes the lifting of orthogonal factorization systems along Grothendieck fibrations.
 - If D is concrete, then so is C. More generally, if D has a generator, then C is concrete over D.
 - In particular, if D is Set, then C is a concrete category that is complete, cocomplete, well powered, and well copowered.

Functors:
A functor F:C→C′ between topological concrete categories C/D, C′/D with the same base category D preserves initial lifts iff it is right adjoint. It preserves final lifts iff it is left adjoint.

More generally: If a functor F:C→C′ between topological concrete categories C/D, C′/D′ with different base categories lying over a functor F_0:D→D′. If F is right (left) adjoint, then F_0 is right (left) adjoint and F preserves initial (final) lifts. A partial converse holds: If F_0 is right (left) adjoint to G_0 and F preserves initial (final) lifts, then there is functor G lying over G_0 so that F is right (left) adjoint to G.

Flat functor
------------

* https://ncatlab.org/nlab/show/flat+functor
=correct notion of left exact if C is not finitely complete.

* Definition 2.1. A functor C→Set is (Set)flat if the opposite of its category of elements, el(C)^{op}, is a filtered category.

Proposition 2.3. When C is small, a functor F:C→Set Set-valued flat if and only if its Yoneda extension [C^op,Set]→Set preserves finite limits.
Corollary 2.4. If F:C→Set is flat, then it preserves all finite limits that exist in C. Conversely, if C has finite limits and FF preserves them, then it is flat.

* Definition 2.5. A functor F:C→E is (representably) flat if for each object e∈E, the opposite comma category (e/F)^op is a filtered category.
Since (e/F) is equivalent to the category of elements of the composite C →^F E→^E(e,−) Set, this is equivalent to saying that E(e,F−):C→Set is Set-valued flat for every e∈E. Hence, this notion of flatness may be called representably flat.
Proposition 2.6. A functor F:C→E between small categories is representably flat if and only if the operation Lan_F:[C^op,Set]→[E^op,Set] of left Kan extension preserves finite limits.

Corollary 2.7. If F:C→E is representably flat, then it preserves all finite limits that exist in C. Conversely, if C has finite limits and FF preserves them, then it is representably flat.

Corollary 2.8. If C has finite limits, then a functor C→Set is representably flat if and only if it is Set-valued flat, if and only if it preserves finite limits. However, if C lacks finite limits, then representable flatness of C→SetC\to Set can be stronger than Set-valued flatness.

* Definition 2.9. Let E be a cocomplete topos (for instance a Grothendieck topos). A functor F:C→E is (internally) flat if the statement “F is Set-valued flat, def. 2.1.” is true in the internal logic of E.
Explicitly, this means that for any finite diagram D:I→C, the family of factorizations through lim(F∘D) of the F-images of all cones over D in C is epimorphic in E.

Example 2.11. If E has enough points, then FF is internally flat precisely if for all stalks x^*:E→Set the composite x^*∘F is Set-valued flat.

Proposition 2.12. When C is small, a functor F:C→E is internally flat if and only if its Yoneda extension [C^op,Set]→E preserves finite limits.

Corollary 2.13. If F:C→E is internally flat, then it preserves all finite limits that exist in C. Conversely, if C has finite limits and FF preserves them, then it is internally flat.

* Definition 2.14. Let E be any site. A functor F:C→E is flat if for any finite diagram D:I→C and any cone T over F∘D in E with vertex uu, the sieve
{h:v→u|Th factors through the F-image of some cone over D}
is a covering sieve of u in E.

This subsumes the other three definitions as follows:
  - If E=Set with its canonical topology, then covering-flatness reduces to Set-valued flatness, def. 2.1.
  - More generally, if E is a cocomplete topos with its canonical topology, then covering-flatness reduces to internal flatness, def. 2.9.
  - On the other hand, if E has a trivial topology, then covering-flatness reduces to representable flatness, def. 2.5.

Proposition 2.15. If C is a small category and E is a small-generated site, then a functor F:C→E is covering-flat if and only if its extension [C^op,Set]→Sh(E) preserves finite limits.

Corollary 2.16. If F:C→E is covering-flat, where E has finite limits and all covering families in E are extremal-epic, then F preserves all finite limits that exist in C. Conversely, if C has finite limits and FF preserves them, then it is covering-flat.

* Category of flat functors

For A a category the full subcategory
FlatFunc(A op,Set)⊂Func(A op,Set)
of the category of presheaves on A (which is the free cocompletion of A) on the flat functors is the free cocompletion under filtered colimits. When regarded in this way, flat functors are also known as ind-objects.

(Diaconescu’s theorem)
There is an equivalence of categories Topos(ℰ,PSh(C))≃FlatFunc(C,ℰ)
PSh(C) is the classifying topos for internally flat functors out of C.
This equivalence takes f:ℰ→PSh(C) to the composite C→PSh(C)→f*ℰ

Kan extension
-------------

https://ncatlab.org/nlab/show/Kan+extension
The Kan extension of a functor F:C→D with respect to a functor C->C', is if
it exists,  a kind of best approximation to the problem of finding a functor C′→D which makes the diagram commute.

Global Kan extensions
si p: C->C', on note p^*: [C',D]->[C,D] le pullback.
Left Kan extension: adjoint à gauche p_!
Right Kan extension: adjoint à gauche p_*

Ex: If C′=* is the terminal category, then
  - the left Kan extension operation forms the colimit of a functor;
  - the right Kan extension operation forms the limit of a functor.

Même si un adjoint n'existe pas globalement, on a une notion d'existence
locale, qui donne le Kan extension pour un foncteur p:C->C' particulier:
Lan_p F:=p_! F: C'->D est muni d'une transformation naturelle universelle F => p^* p_! F.

Construction:
If D admits small colimits, the left Kan extension of a functor exists and is pointwise given by the colimit (Lan_p F)(c′)≃lim_→ ((p/Δ_c′)→C→F D)
où p/Δ_c′est la arrow category p(c)->c', ie (p/Δ_c′)≃elements(C′(p(−),c′)).
(c'est la même construction que l'on fait pour yoneda relatif)

Autrement dit Lan_p est donné par la colimite avec poids:
(Lan_p F)(c′)≔colim C′(p(−),c′)F.
ou encore par le coend:
Lan_p F: c'↦∫^{c∈C} hom(p(c),c')⋅F(c).

Attention: Non-pointwise Kan extensions can exist even when D does not admit very many limits (mais on a vu que si D est cocomplète, l'extension de Kan à gauche est pointwise).

Prop: si on prend p:C->C^hat donné par Yoneda, on note Lan_F=Lan_y F.
- the left Kan extension along F takes representable presheaves C(c,−):C→𝒱 to their image under F: Lan_F C(c,−)≃D(F(c),−) for all c∈C.
- if F is a full and faithful functor then F*(Lan_F H)≃H and in fact the (Lan_F⊣F *)-unit of an adjunction is a natural isomorphism Id≃F*∘Lan_F
whence it follows (by this property of adjoint functors) that Lan_F:[C,𝒱]→[D,𝒱] is itself a full and faithful functor.

Application: si X est un topos et C un site, on a
Top(X,Sh(C)) \subset [Sh(C), X] via f^*
d'où par précomposition avec C->Psh(C) (yoneda) -> Sh(C) (sheafication) un
foncteur Top(X,Sh(C)) -> [C,X].
Ce foncteur est pleinement fidèle et son image essentiel consiste en les
foncteurs f: C->X exacts à gauche qui préservent les covers, ie si U_i->V
est un cover dans C, \coprod f(U_i) -> f(V) est un épi effectif dans X.
En allant dans l'autre sens: left exact functors into toposes have left exact left Kan extension along the Yoneda embedding (Yoneda extension) and that this is the inverse image of a geometric morphism of sheaf toposes if the original functor preserves covers.

end/coend
---------

* https://mathoverflow.net/questions/78471/intuition-for-coends
  https://golem.ph.utexas.edu/category/2014/01/ends.html

* https://ncatlab.org/nlab/show/end
An end is a special kind of limit over a functor of the form F:C^op×C→D (sometimes called a bifunctor).

If we think of such a functor in the sense of profunctors as encoding a
left and right action on the object ∏_c∈C F(c,c) then the end of the
functor picks out the universal subobject on which the left and right
action coincides. Dually, the coend of F is the universal quotient of 
∐_c∈C F(c,c) that forces the two actions of F on that object to be equal.

A classical example of an end is the V-object of natural transformations between V-enriched functors in enriched category theory. Perhaps the most common way in which ends and coends arise is through homs and tensor products of (generalized) modules, and their close cousins, weighted limits and weighted colimits. These concepts are fundamental in enriched category theory.

In ordinary category theory, an end of F in X is an object e of X equipped with a universal extranatural transformation from e to F:
π_c: ∫_{c:C} F(c,c) → F(c,c)
Universal property: given any extranatural transformation with components
θ_c:x→F(c,c) there exists a unique map f:x→e such that θ_c=π_c f

coend: ι_c:F(c,c)→∫^{c:C} F(c,c)

Note: e->F extranatural si pour c->c', alors e->F(c,c)  ->  F(c,c') = commute
                                              ->F(c',c')->  F(c,c')

$ In enriched category theory
Let V be a symmetric closed monoidal category, and let C be a V-enriched category. Let F:C^op⊗C→V a V-enriched functor; we have a covariant and a contravariant action: F(c,d)⊗C(d,e)→F(c,e); F(d,e)⊗C(c,d)→F(c,e).
In detail, the covariant action is the adjunct of the morphism
(F(c,−):C(d,e)→[F(c,d),F(c,e)])∈Hom V(C(d,e),[F(c,d),F(c,e)])
under the Hom-adjunction
Hom_V(C(d,e),[F(c,d),F(c,e)])≃Hom_V(C(d,e)⊗F(c,d),F(c,e))

A V-extranatural transformation θ:v→•F: we have a commutative diagram
v⊗C(c,d)→F(c,c)⊗C(c,d)→F(c,d)
v⊗C(c,d)→F(d,d)⊗C(c,d)→F(c,d)
End: universal extranatural: π:∫_c:C F(c,c)→•F

If X is any V-enriched category and F:C^op⊗C→X is a V-enriched functor, then the end of F in X is, if it exists, an object ∫_c:C F(c,c) of X that represents the functor ∫_c:C X(−,F(c,c)).

$ As a limit
A limit is an equaliser:
∏_c∈Obj(C) F(c) => ∏_c1,c2∈Obj(C) [C(c1,c2),F(c1)]
so the end is the equaliser
∫_c∈C F(c,c) ⟶∏_c∈Obj(C) F(c,c) => ∏_c1,c2∈Obj(C) [C(c1,c2),F(c1,c2)]

The coend of F is the coequalizer ∐_c1,c2 C(c2,c1)⊗F(c1,c2)⇉∐_c F(c,c)→∫_c F(c,c)
c'est à dire si V=Set: ∐_{c′→c′} F(c,c′)⟶⟶ ∐_{c∈C} F(c,c)

Et pareil pour le end: ∏_{c1→c2} F(c1)≃∏_c1,c2 F(c1)^C(c1,c2),
and we write [C(c1,c2),F(c1)]:=F(c1)^C(c1,c2); ie le end est l'éq
∏_c F(c,c) => ∏_c1→c2 F(c1,c2)

$ End as a weighted limit
∫_c∈C F(c,c)={Hom_C,F}≔=lim^{Hom_C} F with weight Hom_C:C^op×C→V

$ Set-enriched coends as ordinary colimits
Let the enriching category be Set. We describe a special way in this case to express ends/coends that give weighted limits/colimits in terms of ordinary (co)limits over categories of elements.
Consider
    C a Set-enriched category/locally small category tensored over Set;
    D be a small category;
    F:D→C a functor;
    W:D^op→Set another functor;
    elW→D^op the category of elements of W

Proposition 3.1. We have a natural isomorphism in C
∫^{d∈D} W(d)⋅F(d)≃lim_→((elW)^op → D →^F C)
between the coend as indicated and the colimit over the opposite of the category of elements of W

Note: C est tensored sur Set si C(k⊙x,y)≅Set(k,C(x,y)) pour k dans Set et x
dans C; par ex si C a les coproduits: k⊙x= \coprod_{i∈k} x

Example 3.3. If W=D(−,e) is a representable functor, then (elW)^op=D/e. This has a terminal object e→e. Therefore lim_→(D/e→D→^F C)≃F(e).
Since this is natural in e, the above proposition asserts a natural isomorphism
F(−)≃∫^k∈D D(k,−)⋅F(k).
This statement is sometimes called the co-Yoneda lemma.

=> Any continuous functor preserves ends, and any cocontinuous functor preserves coends
In particular, for functors F:D^op×D→C, we have the isomorphisms
C(∫^x F(x,x) , c) ≅∫_x C(F(x,x),c); C(c, ∫_x F(x,x)) ≅ ∫^x C(c,F(x,x))

$ Fubini
Ordinary limits commute with each other, if both limits exist separately. The analogous statement does hold for ends and coends. Since there it looks like the commutativity of two integrals, it is called the Fubini theorem for ends:
∫_{(A,B)∈𝒜⊗ℬ} T(A,B,A,B) ≃ ∫_{A∈𝒜} ∫_{B∈ℬ} T(A,B,A,B) ≃ ∫_{B∈𝒜} ∫_{A∈ℬ} T(A,B,A,B) where T:(𝒜⊗ℬ)^op⊗(𝒜⊗ℬ)→𝒱

Exemple: 
- natural transformation: [C,D](F,G)=∫_{c∈C} D(F(c),G(c)).
- Kan extension: LanF:b↦∫_c∈C hom(p(c),b)⋅F(c)
- geometric realization is the left Kan extension of a functor F:C→D along the Yoneda embedding Y:C→[C^op,V]
The “geometric realization” of an object X∈[C^op,V] with respect to FF is then the coend |X|:=∫_c∈C F(c)⋅hom(Y(c),X)≃∫_c∈C F(c)⋅X(c)
- tensor product: If S:C^op→D and T:C→D are functors, their tensor product is the coend S ⊗_C T=∫_c S(c)⊗T(c) where the tensor product on the right hand side refers to some monoidal structure on D.

Application: prouver le coyoneda lemma
https://ncatlab.org/nlab/show/co-Yoneda+lemma "every presheaf is a colimit
of representables": F(c)≃∫^{c′∈C} C(c,c′)×F(c′).
Set(∫^c′∈C C(c,c′)×F(c′),y) ≃∫_c′∈C Set(C(c,c′)×F(c′),y) ≃∫_c′∈C Set(C(c,c′),Set(F(c′),y)) ≃ [C,Set](C(c,−),Set(F(−),y)) ≃ Set(F(c),y).

Limites
=======

* https://ncatlab.org/nlab/show/limit

Limites élémentaires et exactitude
----------------------------------

Terminal object: 1
Initial object: ∅ (\emptyset)
Strict initial object: toute application x→∅ est un iso.
Zero object: 0 = initial+final

Note: C a un initial/final object <=> le foncteur C->{*}, la catégorie terminale
a un adjoint à gauche (reps. à droite)
An object I in a category C is initial iff I is the limit of the identity functor Id_C.

Le pullback A x_C B est l'équalisateur de AxB => C; l'équalisateur de f,g
:A=>B est le pullback A x_{BxB} B; cf https://math.stackexchange.com/questions/1184111/equalizers-by-pullbacks-and-products
En particulier, on déduit que AxB x_{CxC} C =~ A x_C B, et même que
A x_S B x_{C x_S C} C =~ A x_C B.

La composée de monos/épis est un mono/épi
Soit f:A->B, g:C->D; si gof est un mono, f est un mono; si gof est un épi,
g est un épi.
Un foncteur fidèle reflète les monos et les épis.

lim lim = lim
Le pullback d'un mono est un mono, plus généralement si A_i -> B_i est un
mono, lim A_i -> lim B_i est un mono.
Si X=lim A_i, alors la source X->{A_i} est un mono extrémal.

Terminologie: exact à gauche = commute aux limites *finies*
Continu = commute aux petites limites, cf https://ncatlab.org/nlab/show/continuous+functor
Complet = à toute les *petites* limites

Weight
------

* https://ncatlab.org/nlab/show/weighted+limit
A weighted limit over a functor
F:K→C with respect to a weight or indexing type functor W:K→V
is, if it exists, the object lim^W F∈C which represents the functor (in c∈C)
[K,V](W,C(c,F(−))):C^op→V
In particular, if C=V itself, then we get the direct formula
lim^W F≃[K,V](W,F).

On retrouve une limite normale avec des cones quand W:K->{*} \subset Set.

* https://ncatlab.org/nlab/show/weighted+colimit

Split, reflexive limits
-----------------------

* https://ncatlab.org/nlab/show/split+coequalizer
A split coequalizer is a fork (ie ef=eg) together with morphisms s:C→B and t:B→A such that es=1_C, se=gt, and ft=1_B. This is equivalent to saying that the morphism (f,e):g→e(f,e) has a section in the arrow category of C.
C'est un coéq absolu (stable par tout foncteur).

Exemple: if e:B→C is a split epimorphism, with a splitting s:C→B, then e is a split coequalizer of B⇉_1^{se} B, the morphism t being the identity. Moreover, e is also the split coequalizer of its kernel pair if it exists.


* https://ncatlab.org/nlab/show/reflexive+coequalizer
A reflexive pair is a parallel pair f,g:A⇉B having a common section, i.e. a map s:B→A such that f∘s=g∘s=1_B. A reflexive coequalizer is a coequalizer of a reflexive pair.

* https://ncatlab.org/nlab/show/retract
id:A→ section i B→ retraction r A; id=ri

=> r is a split epimorphism and i is a split monomorphism. The entire situation is said to be a splitting of the idempotent $ir$.
Accordingly, a split monomorphism is a morphism that has a retraction; a split epimorphism (=has a section) is a morphism that is a retraction.

Pullbacks
---------

Pullbacks: https://arxiv.org/pdf/1311.2974.pdf
The Other Pullback Lemma
A->B->C
X->Y->Z
Si les petits carrés sont des pullbacks, le grand aussi.
Si le grand et le carré droit sont des pullbacks, le gauche aussi.
Si le grand et le carré gauche sont des pullbacks, et X->Y est un strong
(ou extremal) épi stable par pullback, alors le carré droit aussi.

Commutativite limites colimites
-------------------------------

* https://ncatlab.org/nlab/show/commutativity+of+limits+and+colimits
- Filtered colimits commute with finite limits
- Sifted: colimits commute with finite products
  sifted categories = the diagonal functor C→C×C is a final functor
  https://ncatlab.org/nlab/show/sifted+category
  Example 3.5. categories with finite products are cosifted, ie les limites
  inductives indexées par C^op commutent avec le produit
- Taking orbits under the action of a finite group commutes with cofiltered limits
- Coproducts commute with connected limits

* https://ncatlab.org/nlab/show/distributivity+of+limits+over+colimits
- distributivity of finite products over arbitrary coproducts
- More generally, finite products distribute over arbitrary colimits in any cartesian closed category, such as Set.

* https://ncatlab.org/nlab/show/pullback-stable+colimit
- Colimits are (pullback) stable in any locally cartesian closed category, since in that case the pullback functors f^* all have right adjoints.
Conversely, if C is cocomplete with all stable colimits, and the adjoint functor theorem applies to all its slice categories, then it is locally cartesian closed.
- Colimits are also stable any regular infinitary extensive category, so in
  Grothendieck toposes

Injectif/Projectif
------------------

Injective: https://ncatlab.org/nlab/show/injective+object
An object I in C is J-injective if all diagrams of the form
X->I, j: X->Z admit an extension Z->I.
If J is the class of all monomorphisms, we speak merely of an injective object.
Ones says that a category C has enough injectives if every object admits a monomorphism into an injective object.
Remark 1.7. If C is a locally small category then I is J-injective precisely if the hom-functor Hom C(−,I):C^op→Set takes morphisms in J to epimorphisms in Set.

Dans une catégorie abélienne:
For C an abelian category the class J of monomorphisms is the same as the class of morphisms f:A→B such that 0→A→f B is exact, so I injective <=>
the hom-functor Hom C(−,I):C^op→Set is exact.

Limites et colimites
--------------------

For a functor F:C×D→E, there is a canonical morphism colim_C lim_D F → lim_D colim_C F.

In Set, filtered colimits commute with finite limits. In fact, C is a filtered category if and only if C-colimits commute with finite limits in Set.
More generally, filtered colimits commute with L-finite limits.
By the above remarks, it follows that filtered colimits commute with finite limits in any Grothendieck topos.

https://ncatlab.org/nlab/show/L-finite+category
(<=>)
- The terminal object of [C,Set] is (ω-)compact.
- C-limits commute with filtered colimits in Set.
- C has an initial finitely generated subcategory.
- C admits an initial functor from a finite category.1
- C-limits lie in the saturation of the class of finite limits.

Ind and pro-objects
-------------------

* https://ncatlab.org/nlab/show/ind-object
Let Ind(𝒞)⊂PSh(𝒞) be the full subcategory of the presheaf category PSh(𝒞)=[𝒞 op,Set] on those functors/presheaves which are filtered colimits of representables, i.e. those for which X≃colim_d∈D Y(α(d)) for D some filtered category.

Remark 2.2. The functors 𝒞 op→Set belonging to Ind(𝒞) under this definition — those which are filtered colimits of representables — have an equivalent characterization as the flat functors: those which “would preserve all finite colimits if 𝒞\mathcal{C} had them”. In particular, if 𝒞 has finite colimits, then Ind(𝒞) consists exactly of the finitely cocontinuous presheaves.

Proposition 4.1. If 𝒞 is a locally small category then so is Ind(𝒞).

Proposition 4.2. Ind(𝒞) admits small filtered colimits and the defining inclusion Ind(𝒞)↪PSh(𝒞) commutes with these colimits.

Morphisms between ind-objects are represented by natural transformation of the filtered diagrams that represent them, possibly up to restricting these diagrams first along a final functor.

Proposition 4.5. The canonical inclusion y:𝒞↪Ind(𝒞) (factoring the Yoneda embedding) is right exact.

Proposition 4.6. Let 𝒞 have all finite limits or all small limits. Then also Ind(𝒞) has all finite or small limits, respectively, and the canonical functor y:𝒞⟶Ind(𝒞) preserves these, respectively.

Proposition 4.7. If 𝒞 has cokernels, then so does Ind(𝒞)
If 𝒞 has finite colimit coproducts, then Ind(𝒞) has small coproducts.
If 𝒞 has all finite colimits, then Ind(𝒞) has all small colimits.

- Recognition of Ind-objects

Proposition 4.8. A functor F:𝒞 op→Set Set is in Ind(𝒞) (i.e. is a filtered colimit of representables) precisely if the comma category (Y,F) (with Y the Yoneda embedding) is filtered and cofinally small.

Proposition 4.9. If 𝒞 admits finite colimits, then Ind(𝒞) is the full subcategory of the presheaf category PSh(𝒞) consisting of those functors F:𝒞 op→Set such that F is left exact and the comma category (Y,F) (with Y the Yoneda embedding) is cofinally small.

- Functoriality

Ind-cocompletion is functorial – in fact an underlying 2-functor of a lax-idempotent 2-monad (KZ-monad).

Proposition 4.12. Let 𝒞 be a category which has all small filtered colimits. Then the canonical functor 𝒞⟶Ind(𝒞) defines a reflective subcategory, i.e. it is a fully faithful functor with a left adjoint L 𝒞 ⊥⟶⟵L Ind(𝒞)
which takes formal filtered colimits to actual filtered colimits in 𝒞: L:lim⟶ f_α ↦ lim⟶ α

If 𝒞 is a category such that
  - every object of 𝒞 is a filtered colimit of compact objects;
  - 𝒞 has all small filtered colimits
Then 𝒞 is equivalent to Ind(𝒞_cpt)

- Applications
    One important use of categories of ind-objects is in abelian sheaf-theory: for every small abelian category 𝒞 the category ind-𝒞 is a Grothendieck category and hence a good coefficient object for abelian sheaf cohomology.
Cf https://ncatlab.org/nlab/show/Grothendieck+category

* https://ncatlab.org/nlab/show/pro-object
A pro-object of a category C is a “formal cofiltered limit” of objects of C.
The category of pro-objects in 𝒞 is the opposite category of that of ind-objects in the opposite catgegory of 𝒞.

- Via filtered limits of presheaves

Another, equivalent, definition is to let pro-C be the full subcategory of the opposite functor category/presheaf category [C,Set]^op determined by those functors which are cofiltered limits of representables.
This is reasonable since the copresheaf category [C,Set]^op is the free completion of C, so pro-C is the “free completion of CC under cofiltered limits.”

=> on dit aussi que ce sont les prorepresentable functor
https://ncatlab.org/nlab/show/prorepresentable+functor
These functors are ‘exactly’ the left exact functors, (at least with a caveat on size)

Yoneda
======

Yoneda
------

Yoneda embedding: h^A = Hom(A,-).
Alors Nat(h^A,F) ≅ F(A).

Pr: en effet, pour tout élément x de F(A), il existe un unique morphisme
naturel qui envoit id∈Hom(A,A) sur x: pour tout f:A->X \Phi_X(f) = (Ff)x.

Reformulation: on a un foncteur de la catégorie des foncteurs vers Set;
à un foncteur F on associe A->F(A).
Yoneda montre que ce foncteur est représentable par h^A, ie on a exactment
F(A)=Morphismes dans la catégorie des foncteurs de h^A vers F.

Si C est une catégorie, je note Chat la catégorie des préfaisceaux de C,
y:C->Chat le plongement de Yoneda. Comme Set a les limites et colimites,
Chat aussi (que l'on calcule point par point).

De plus presque par définition, Yoneda préserve les limites:
lim C_i existe ssi lim y(C_i) est représentable.
De même: f: A-> B est un mono ssi y(A)->y(B) est un mono.

Yoneda enrichi
--------------

* https://ncatlab.org/nlab/show/enriched+Yoneda+lemma
Let V be a (locally small) closed symmetric monoidal category, so that V is enriched in itself via its internal hom.

- Weak form: α:hom C(c,−)→F is in natural bijection with the set of elements of F(c), where F:C→V is a V-enriched functor.

Set of elements of F = the set of morphisms I→F(c), obtained by composition:
I →1_c hom C(c,c) →αc F(c)

- Strong form:
Now suppose that V is in addition (small-)complete (has all small limits). Then, given a small V-enriched category C and V-enriched functors F,G:C→V, one may construct the object of V-natural transformations as an enriched end:
V^C(F,G)=∫_c V(F(c),G(c))
(which may in turn be expressed as an ordinary limit in V). This is the hom-object in the enriched functor category.

A strong form of the enriched Yoneda lemma specifies a V-natural isomorphism
V^C(hom C(c,−),F)≅F(c).

This implies the weak form by applying the functor hom(I,−):V→Set

Co-Yoneda lemma
--------------

* https://ncatlab.org/nlab/show/category+of+elements
Given a functor P:C→Set, the category of elements el(P) (or ∫_𝒞 P) is the
corresponding discrete fibration:
- It is the category whose objects are pairs (c,x) where cc is an object in C and x is an element in P(c) and morphisms (c,x)→(c′,x′) are morphisms u:c→c′ such that P(u)(x)=x′.
- It is the pullback along P of the universal Set-bundle: U: Set_* -> Set
  where U is the forgetful functor from pointed sets to sets.
- it is the comma category (*/P)
- its opposite is the comma category (Y/P), where Y is the Yoneda embedding
- It is the (strict) oplax colimit of the composite C→P Set →disc Cat; see Grothendieck construction.

Theorem 3.2. The functor el:Set^C→Cat has a right adjoint (which is maybe a more direct way to see that it is cocontinuous).

Exemples for representable presheaves: ∫_𝒞 Y(C)≃𝒞/C
Since PSh(∫_𝒞 P)≃PSh(𝒞)/P in general for presheaves P:𝒞^op→Set, we get
PSh(𝒞)/Y(C)≃PSh(𝒞/C).

* https://ncatlab.org/nlab/show/co-Yoneda+lemma

The (enriched) Yoneda lemma [𝒞^op,V](𝒞(−,c),F)≃F(c) can be restated as
∫_c′∈𝒞 V(𝒞(c′,c),F(c′))≃F(c).

Under abstract duality an end turns into a coend, so a co-Yoneda lemma ought to be a similarly fundamental expression for F(c) in terms of a coend.

Proposition 2.2. Every presheaf F is a colimit of representables, in that
F(c)≃∫_c′∈C 𝒞(c,c′)⊗F(c′)
hence F(−)≃∫_c′∈𝒞 Y(c′)⊗F(c′)
where Y denotes the Yoneda embedding. In module-language, using the tensor product of functors, this reads F(c)≃𝒞(c,−)⊗_𝒞 F.

Yet another way to state this is as a colimit over the comma category (Y,F), for Y the Yoneda embedding: F≃colim_{(U→F)∈(Y,F)} Y(U).
=> ie F est colimite de représentables au dessus de F: x:U->F
  que l'on peut aussi voir comme la catégorie des éléments de F: x \in F(U)

Note the similarity with the dirac distribution:
For X a topological space, f:X→ℝ a continuous function and δ(−,x 0) denoting the Dirac distribution, then ∫_x∈X δ(x,x_0)f(x)=f(x_0)

MacLane version:
For D a category, K:D→Set, let (*↓K) be the comma category of elements x∈Kd, let Π:(*↓K)→D be the projection (x∈Kd)↦d and let for each a∈D the functor Δa:(*↓K)→D be the diagonal functor sending everything to the constant value a.
The co-Yoneda lemma in the sense of Kan/MacLane is the statement that there is a natural isomorphism of functor categories
[D,Set](K,D(a,−))≅[(*↓K),D](Δ_a,Π).

Yoneda relatif
--------------

* https://ncatlab.org/nlab/show/Yoneda+extension
  https://ncatlab.org/nlab/show/free+cocompletion

Si F: C->D, on a un pullback F*: Dhat->Chat, d'où un yoneda relatif
y_F=F* o y: D->Chat via un pullback, qui s'appelle aussi le nerf.

Notes:
- y_F o F=y : C->Chat ssi F est pleinement fidèle.
- y_F est pleinement fidèle ssi F est dense, ie tout d dans D est le
      colimite de C /_F d -> C -> D.
      cf https://mathoverflow.net/questions/85068/subcategories-which-still-give-a-yoneda-embedding
         https://ncatlab.org/nlab/show/dense+subcategory
         https://ncatlab.org/nlab/show/dense+functor

Théorème: Si D est cocomplète, y_F: D->Chat a un adjoint (à gauche) F˜:Chat->D.
Pr: En effet, si L est dans Chat, on peut définir la catégorie PL des éléments
de L, si x∈L(A) on peut voir x comme un morphisme y(A)->L, donc PL est
aussi la catégorie (opposée) y(C)/L.
On a par le co-Yoneda lemma (cf plus haut): L=colim(PL->C->Chat). 
Si L=y_F(d), on peut alors définir son adjoint comme colim(PL->C->D) (dans ce cadre PL sont les morphismes Fc->d).

=> The Yoneda extension F˜ exhibits the presheaf category PSh(C) as the free cocompletion of C.

Note: il s'agit d'un cas particulier d'extension de Kan:
The Yoneda extension of a functor F:C→D is a universal extension (the left
Kan extension) along the Yoneda embedding Y:C→[C^op,Set] of its domain
category to a functor
F˜ = Lan_Y F : [C^op,Set]→D
F˜(A) ≃ colim_{(Y(U)→A)∈(Y,A)} F(U).

Often it is of interest to Yoneda extend not F:C→D itself, but the composition Y∘F:C→[D^op,Set] to get a functor entirely between presheaf categories
F^≔Y∘F˜:[C^op,Set]→[D^op,Set].
This is in fact a left adjoint to the restriction functor F^*:[D^op,Set]→[C^op,Set] which maps H↦H∘F.
F^(A)(V) ≃ colim_{(Y(U)→A)∈(Y,A)} Hom_D(V,F(U))

* https://ncatlab.org/nlab/show/nerve+and+realization
F: C->D induit D  →N  [C^op,V],
                  ←|−|  (si D cocomplet)
N (que j'appelle y_F) behaves like a nerve operation, son adjoint à gauche
|−| behaves like geometric realization.
|X|≃∫^c∈C F(c)⋅X_c.

Exemples: 
- Topological realization of simplicial sets; the cosimplicial topological space Δ_Top:Δ→Top
The corresponding realization is what is traditionally called geometric realization of simplicial sets.
The corresponding nerve is the singular simplicial complex functor, producing the fundamental ∞-groupoid of a topological space.
- Nerve and realization of categories
- Dold–Kan correspondence
The Dold-Kan correspondence is the nerve/realization adjunction for the homology functor
Δ_C•:Δ→Ch_+
to the category of chain complexes of abelian groups, which sends the standard n-simplex to its homology chain complex, more precisely to its normalized Moore complex.
- Higher Lie integration / smooth Sullivan construction
- Simplicial models for (∞,1)-categories

### Monad with arities

* https://ncatlab.org/nlab/show/monad+with+arities
A monad with arities is a monad that admits a generalized nerve construction. This allows us to view its algebras as presheaves-with-properties in a canonical way. This generalized nerve construction also generalizes the construction of the syntactic category of a Lawvere theory.

I. If 𝒜 is dense in 𝒞 and if T is a monad with arities 𝒜 on 𝒞, then 𝒞^T has a dense subcategory Θ_T given by the free T-algebras on objects of 𝒜.
(A monad (T,μ,η) on 𝒞 is said to have arities 𝒜 if ν_𝒜∘T,
où ν_𝒜:𝒞 →[𝒜^op,Set] is the nerve functor, sends canonical 𝒜-cocones to colimiting cocones).
This means that the nerve functor ν_Θ_T:𝒞^T→[Θ_T^op,Set] is full and faithfull
This allows us to view T-algebras as presheaves (on Θ_T) with a certain property.

II. Let j:𝒜→Θ_T be the restricted free algebra functor. A presheaf P:Θ_T^op→Set is in the essential image of ν_Θ if and only if the restriction along j,
P∘j:A^op→Set is in the essential image of ν_A.

Proof: the adjunction j_!:[𝒜 op,Set]⇄[Θ T op,Set]:j^* given by restriction and left Kan extension. The assumption that T has arities 𝒜 can be reformulated to say that the nerve ν_𝒜:𝒞→[𝒜 op,Set] is a strong monad morphism from T to j^* j_!, i.e. there is a coherent isomorphism ν_𝒜T≅j^*j_!ν 𝒜. Since ν_𝒜 is fully faithful, this means that if we identify 𝒞 with the image of ν_𝒜, then the monad T gets identified with j^* j_!. But the adjunction j_!⊣j^* is also monadic (since j is bijective on objects), so the category of T-algebras gets identified with the full subcategory of j^* j_!-algebras, i.e. presheaves on Θ_T\Theta_T, whose underlying presheaf on 𝒜 is in the image of ν_𝒜. This is exactly the two statements of the nerve theorem.

* https://golem.ph.utexas.edu/category/2008/01/mark_weber_on_nerves_of_catego.html
[Note: this is the version before 'monads with arities' described above from
https://arxiv.org/abs/1101.3064
Monads with arities and their associated theories
Clemens Berger, Paul-André Melliès, Mark Weber 
which simplify the settings. -> TODO 'monad with arities']

Let T be a nice monad on a nice category. Then there are a canonically-defined small full subcategory Δ_T such that the induced ‘nerve’ functor Alg(T)→[Δ_T^op,Set] is full and faithful. Its essential image consists of the presheaves on Δ_T preserving certain limits.
The ordinary nerve construction comes from taking T to be the free category monad on the category of directed graphs.

$ Ordinary nerves
As usual, Δ denotes a skeletal category of nonempty finite totally ordered sets.
Since ordered sets can be regarded as special categories, and order-preserving maps are then just functors, you can view Δ as a full subcategory of Cat. The inclusion Δ→Cat induces a functor
N: Cat → [Δ^op,Set] C ↦ Hom(−,C), called the nerve functor.
The first excellent property of the nerve functor is that it is full and faithful. (In the jargon, Δ is a dense subcategory of Cat.)
The second excellent property of the nerve functor is that there is an intrinsic description of its essential image. In fact, there are many such descriptions, and you probably know a couple (e.g. via Segal conditions, or unique filling of inner horns). So you could define a category as a simplicial set conforming to one of these descriptions, and a functor as a map between such simplicial sets.

In details: a simplicial set X is the nerve of a category if and only if for each k,n1,…,nk∈ℕ, the colimit
[n1] +_[0] [n2] +[0]⋯+[0] [nk]=[n1+⋯+nk] in Δ is turned by X into a limit in Set. (Here +_[0] means pushout over [0].) In other words, for all k and n_i, the canonical map
X_{n1+⋯+nk}→Xn1 ×_X0 Xn2 ×_X0⋯×_X0 Xnk is an isomorphism. This is one of the well-known Segal-type characterizations of nerves of categories.

Attention: Why Δ? One answer might be that Δ is the free monoidal category on a monoid. But that’s just wrong: Δ, as defined above and in most of the literature, does not include the empty set, whereas this free monoidal category D is a skeleton of the category of finite, possibly empty, totally ordered sets. Had you been shooting for D, you’d have hit it — but presheaves on D are not the same as simplicial sets.

$ Generalized nerves
The category ℰ of directed graphs is a presheaf on the small category E=(0=>1)
Now, the free category monad T can be described as follows: for a directed graph X, (T(X))_0 = Hom([0],X), (T(X))_1 = ∑_n∈ℕ Hom([n],X).
Here [n] means the directed graph •→•→⋯→• with n arrows; the free category on it is the ordered set also called [n]. The summation means coproduct.

The category ℰ is ‘nice’ if it is a presheaf category [E^op,Set] monad T=(T,η,μ)is ‘nice’ if
  - For each e∈E, the functor (T(−)) is a coproduct of representables:
    T(X)_e= ∑_i∈I(e) Hom(W_e,i,X)
    (<=> T preserves connected limits <=> ℰ→ℰ/T(1) has a right adjoint)
  - The unit η and multiplication μ are cartesian natural transformations (that is, the naturality squares are not only commutative but pullbacks). 
Write F:[E^op,Set]→Alg(T) for the free T-algebra functor. Then Δ_T is the full subcategory of Alg(T) consisting of the algebras F(W_e,i), for e∈E and i∈I(e).

$ Examples
- M-sets  Let’s begin with a simple one. Fix a monoid M. The category of sets is certainly ‘nice’, as is the free left M-set monad M×− on Set. If you work it out, you’ll see that Δ_T=M^op, so that a T-simplicial set (presheaf on Δ_T) is a functor M→Set. The limit-preservation condition is vacuous, so we recover the basic observation that the category of left M-sets is the functor category [M,Set].
- Strict n-categories
- Weak n-categories
- Multicategories

$ Commentaires:
Consider the following three conditions on a functor U:ℰ→Set:
  - U has a left adjoint
  - U is representable
  - U preserves limits.
Various implications hold in complete generality, but let’s assume for convenience that ℰ satisfies the hypotheses of the Special Adjoint Functor Theorem. (E.g. ℰ might be a presheaf category [E^op,Set] for some small E.) Then the three conditions are equivalent.
Under the same hypotheses on ℰ, the following are equivalent:
  - the induced functor ℰ→Set/U(1) has a left adjoint
  - U is a coproduct of representables
  - U preserves connected limits.

Profoncteurs
------------

- https://ncatlab.org/nlab/show/profunctor
A profunctor from C to D is a functor of the form H_F:D^op×C→Set.
A basic fact is that for A a cocomplete category, colimit-preserving functors from presheaves on some small category C to A are canonically equivalent to functors from C to A: we have an equivalence of functor categories
Cocont(PSh(C),A)≃Func(C,A).
This may be thought of as a consequence of the co-Yoneda lemma (and hence, of course, of the Yoneda lemma) which says that every presheaf is a colimit over representables, i.e. over objects in the image of the Yoneda embedding Y:C→PSh(C). This immediately implies that a colimit-preserving functor on PSh(C) is already determined by its restriction along Y to C.
Now, profunctors D^op⊗C→V are adjunct to functors C→[D^op,V]≃PSh(D). Hence by the above, profunctors are equivalent to colimit-preserving functors
PSh(C)→PSh(D).
Indeed, there is an equivalence of bicategories between V-Prof and the 2-category of categories and colimit-preserving functors and natural transformations between their presheaf categories.

Générateurs et densité
----------------------

* https://ncatlab.org/nlab/show/dense+functor
A functor i:S→C is dense if the corresponding restricted Yoneda embedding C→[S^op, Set] is fully faithful.

* https://ncatlab.org/nlab/show/separator

Definition 3.2. A family S=(S_a) of objects of a category 𝒞 is a separating family or a generating family if: for every pair of parallel morphisms f,g: X→Y, if f∘e=g∘e for every e:S_a→X sourced in the family, then f=g.

Assuming that 𝒞 is locally small category, we have equivalently that S is a separator(=generator) if the hom functors Hom(S_a,−):𝒞→Set are jointly faithful; donc sous-catégorie dense => générateur.

Strengthened separators:
If C is locally small and has all small coproducts, then a set (S_a)  is a separating set if and only if, for every X∈C, the canonical morphism ε_X:∐_{a:A,f:S_a→X} S_a⟶X is an epimorphism.
- extremal/strong/regular separator: this is an extremal/strong/regular epi
=> extremal generator <=> C(S i,−):C→Set are jointly faithful and conservative.
- If C is balanced, then every separator is extremal.
- If C has pullbacks, then every extremal separator is strong.
- If C is regular, then every strong separator is regular.
- Every dense separator is an extremal separator, and it is also strong and regular whenever those words make sense, i.e. C is locally small and has small coproducts. 
  If C furthermore has pullbacks and the coproducts are pullback-stable, then every regular separator is dense

* https://ncatlab.org/nlab/show/cogenerator
A cogenerator in a category C is an object S such that the functor h_S=C(−,S):C^op→Set is faithful, ie si f,g:X->Y sont deux morphismes tel que la composition avec tout morphisme Y->S est une équalité, alors f=g.
Note: on a la notion de générateurs, et de famille de (co)générateurs [cogénérateurs: pour toute flêche Y->S_i...], cf https://ncatlab.org/nlab/show/separator

Example: In Set, the set of truth values is a cogenerator. More generally, in any well-pointed topos, the subobject classifier is a cogenerator.
Proposition 2.1. Every topos with a small set of generators (e.g., a well-pointed topos, or a Grothendieck topos), and that has products of objects indexed over sets no larger in cardinality than the generating set, admits an injective cogenerator.

* GENERATORS  AND  COLIMIT  CLOSURES MICHAEL A. SHULMAN
  http://home.sandiego.edu/~shulman/papers/generators.pdf

C cocomplete and finitely complete; then
dense ⇒ colimit-dense ⇒ colimit-generator ⇒ strong generator ⇒ generator
If C is cocomplete, finitely complete, and extremally well-copowered, then any strong generator is a colimit-generator.

Définitions: pour une catégorie C
(i) G is a generator. 
(ii)  The restricted Yoneda embedding A→ [G , Set] is faithful.
(iii) The restricted Yoneda embedding A→ [G op , Set] is faithful.
(iv)  For all X , the map ε_X : ∐_{Q → X} Q → X is epic

(i) G strong generator
(ii) if m is a monic such that every Q → Y with Q ∈ G factors through m , then m
is an isomorphism
(iii) A→ Set^G is conservative.
(iii) A→ [ G^op , Set ]  is conservative.
(iv) ε_X : ∐_{Q → X} Q → X is extremal epic for all X .

G is a colimit-dense generator if every object of A is a colimit of objects of G in some way.

G is a colimit-generator (this is a nonstandard term) if A is the colimit-closure of G , i.e. the only subcategory of A containing G and closed under colimits is A itself 

2-Yoneda lemma
--------------

* https://ncatlab.org/nlab/show/Yoneda+lemma+for+bicategories
For any bicategory C, any object x∈C, and any pseudofunctor F:C^op→Cat, there is an equivalence of categories
[C^op,Cat](C(−,x),F)≃F(x)
which is pseudonatural in x and F, and which is given by evaluation at 1_x, i.e. α:C(−,x)→F maps to α_x(1_x).

In particular, the Yoneda lemma for bicategories implies that there is a Yoneda embedding for bicategories C→[C^op,Cat] which is 2-fully-faithful, i.e. an equivalence on hom-categories. Therefore, C is equivalent to a sub-bicategory of [C^op,Cat]. Since Cat is a strict 2-category, it follows that C is equivalent to a strict 2-category, which is one form of the coherence theorem for bicategories.

* https://stacks.math.columbia.edu/tag/004B

Lemma 4.40.1 (2-Yoneda lemma). Let S→C be fibred in groupoids. Let U∈Ob(C). The functor
[Cat/C](C/U,S)⟶SU given by G↦G(id_U) is an equivalence.

https://stacks.math.columbia.edu/tag/04SS
86.5 The 2-Yoneda lemma for algebraic stacks

Adjonctions
===========

Définition
----------

Une adjonction est un couple de foncteurs adjoints F et G:
Θ_AB: Hom(FA,B) \iso Hom(A,GB).

En particulier, on a un morphisme η qui a A associe 1_FA ∈ Hom(FA,FA)
-> Hom(A,GFA), donc η_A est une map A -> GFA. Et on Θ_AB(h) =
(Gh)η_A [Pr: A->GFA -(Gh)-> GB]

Donc une manière  de voir ça est que η_A est la flêche universelle de A
vers un objet de la forme GB, ie si f est une flêche de A -> GB, il existe
une unique g:FA->B telle que
A -f-> GB
|   /
v  / Gg
GFA
Autrement dit FA est l'objet initial de la catégorie A/G.

D'où une autre définition possible:
si ε est la counité: ε: FGB-> B, on a
F -Fη-> FGF -ε F-> F = 1_F et
G -ηG-> GFG -G ε-> G = 1_G (inversement, η et ε satisfaisant ces propriétés donnent une adjonction)

En terme de préfaisceaux: si F:C->D, on a un foncteur y_F: D-> Chat
(Chat=préfaisceaux sur C) qui à d associe c->Hom(F(c),d).
y_F est simplement la composition de y: D->Dhat avec le pullback L*:Dhat->Chat.
Si y_F(d) est représentable par un élément G(d) dans C pour tout d, alors G
est automatiquement un adjoint à droite de C (c'est à dire que l'adjonction
est automatiquement naturelle).

https://ncatlab.org/nlab/show/triangle+identities
The triangle identities or zigzag identities are identities characterized by the unit and counit of an adjunction, such as a pair of adjoint functors. These identities define, equivalently, the nature of adjunction.

Propriétés
----------

* Monades induite et équivalence de catégorie:

- https://en.wikipedia.org/wiki/Monad_(category_theory)#Algebras_for_a_monad
An adjunction ( F , G , η , ε ) between two categories C and D (where F : C → D is left adjoint to G : D → C and η and ε are respectively the unit and the counit) always defines a monad ( G F , η , G ε F ).

- https://ncatlab.org/nlab/show/fixed+point+of+an+adjunction
Any pair of adjoint functors restricts to an equivalence of categories on subcategories. These subcategories are sometimes known as the center of the adjunction, their objects are sometimes known as the fixed points of the adjunction.
The equivalences of categories that arise from fixed points of adjunctions this way are often known as dualities. Examples include Pontrjagin duality, Gelfand duality, Stone duality, and the Isbell duality between commutative rings and affine schemes.

Note: un point fixe de l'adjonction est tel que l'unité (resp. la counité)
est un isomorphisme.

* Propriétés pour une paire F/G ou L/R d'ajoints:
- L'adjoint G est unique (à 2-iso près)
- G préserve les limites et F préserve les colimites.
- R is faithful precisely if the component of the counit over every object x is an epimorphism LRx→x
- R is full precisely if the component of the counit over every object x is a split monomorphism LRx→x
- L is faithful precisely if the component of the unit over every object x is a monomorphism x↪RLx
- L is full precisely if the component of the unit over every object x is a split epimorphism x→RLx
- R is full and faithful (exhibits a reflective subcategory) precisely if the counit is a natural isomorphism ϵ:L∘R→≃Id D
  En fait, si L∘R≃Id alors ϵ est un iso.
- L is full and faithful (exhibits a coreflective subcategory) precisely if the unit is a natural isomorphism η:Id C→≃R∘L
- The following are equivalent:
    L and R are both full and faithful;
    L is an equivalence;
    R is an equivalence.
- La restriction des sous-catégories où ε et η sont des isos induit une
  équivalence de catégorie.

* Conservatif
http://icms.kaist.ac.kr/mathnet/thesis_file/JKMS-23-1-19-33.pdf
"SOME REMARKS ON CONSERVATIVE FUNCTORS WITH LEFT ADJOINT"
[Conservative = reflète les isos, ie R(f) iso <=> f iso]

ε_x: LR x->x est un strong épi <=> R reflète les strongs épi => R est
conservatif => ε est extrémal, et la réciproque est vraie dans de bonnes catégories, par ex si C a (StrongEpi, Mono) factorisation, ou si C a les pullbacks et pushouts, ou si C a pullbacks+equs:

Prop:
(i) ε strong épi
(ii) R conservatif
(iii) ε est extrémal
Alors (i)=>(ii)=>(iii) et (iii)=>(i) si C a (StrEpi, Mono) factorisation,
OU si C a pullbacks+equalisers OU si C a pullbacks et pushouts

Th: Si R est conservatif, alors ε est un familial strong épi si
a) C a pullbacks+pushouts
b) C a non empty finite limits + arbitrary intersection of mono
c) C a les coeqs + arbitrary cointersection of strong epi
d) C a all small limits (et dans ce cas ε est small familial strong)
et dans ce cas R réflète toutes les limites (toutes les small limites pour le cas d)

De plus, cf la section "adjoint triangle theorem for conservative
functors", si RP a un adjoint à gauche, P en a un dès que
(i) ε_R est familial strong et C a les coeqs+arbitrary cointersections of strong épis
(ii) ε_R est small familial strong et C weakly cowellpowered [=small set of strong subobjects]+ (coeqs + arbitrary cointersections of strong épis OR (StrEpi, Mono) fact + small products)

* https://ncatlab.org/nlab/show/mate
Given a 2-category K, adjoint pairs (η,ϵ):f⊣u:b→a and (η′,ϵ′):f′⊣u′:b′→a′, and 1-cells x:a→a′ and y:b→b′, there is a bijection
K(a,b′)(f′x,yf)≅K(b,a′)(xu,u′y)

* https://ncatlab.org/nlab/show/Beck-Chevalley+condition

Given a commutative square of functors [f*, g*, h*, k*] in which 
f* and h* have left adjoints f_! and h_!,
then the natural isomorphism that makes the square commute k*f*→h*g*
has a mate h_!k*→g*f_! defined as the composite
h_!k*→h_!k*f*f_!≅h_!h*g*f_!→g*f_!.
We say the original square satisfies the Beck–Chevalley condition if this mate is an isomorphism.
More generally, it is clear that for this to make sense, we only need a transformation k*f*→h*g*; it doesn’t need to be an isomorphism. We also use the term Beck–Chevalley condition in this case.

$ For bifibrations
A bifibration X→B where B has pullbacks satisfies the Chevalley condition iff for every commuting square
  →ψ ′ 
↓ φ ′ ↓ φ
  →ψ 
in X over a pullback square in the base B where φ cartesian (ie the universal lift of the arrow on B, cf https://ncatlab.org/nlab/show/Cartesian+morphism) and ψ is cocartesian it holds that φ′ is cartesian iff ψ′ is cocartesian. Actually, it suffices to postulate one direction because the other one follows.

$ 3. In logic / type theory
 D →h C 
k↓    ↓g
 A →f B
In terms of this the Beck-Chevalley condition says that if the above diagram is a pullback, then substitution commutes with existential quantification
∑_k h*ϕ →≃ f* ∑_g ϕ.

Existence
---------
* https://ncatlab.org/nlab/show/adjoint+functor+theorem

A functor R: D ⟶ C has a left adjoint L iff
  - R preserves all limits that exist in D
  - for each object c∈C, the limit of the canonical functor out of the comma category of c/R->C existe, cette limite étant L(c)

En particulier, si D a toute les limites (grandes et petites), et que R
préserve les limites, R a un adjoint L. Mais une petite catégorie complète
est un poset, cf https://ncatlab.org/nlab/show/adjoint+functor+theorem,
donc en fait il faut supposer des conditions de taille sur D et R en
général.
Par exemples: si R préserve toutes les limites  et
- D is complete and locally small, and G satisfies the solution set condition.
  (= the comma categories (c↓R) all admit small weakly initial families of objects.)
  (General adjoint functor theorem)
  [https://ncatlab.org/nlab/show/solution+set+condition
  Here is the connection with the adjoint functor theorem: when small products exist in those comma categories, this is equivalent to saying that they all admit weakly initial objects. When small equalizers exist in those comma categories also, this is equivalent to saying that they all admit initial objects, and this is equivalent to R being a right adjoint.]
- D is complete, locally small well-powered, and has a small cogenerating set, and C is locally small.
  (Special adjoint functor theorem)
- D is locally small and cototal, and C is locally small.
Dans les deux premiers cas il suffit que R préserve toutes les small
limites.

Inversement, un foncteur qui préserve toutes les colimites L: C->D a un adjoint à droite si
- C cocomplet, locally small well-copowered with a small generating set, D
  locally small
  [en particulier: C locally presentable]
- C locally small et total, D locally small

Borceux: a functor between accessible categories is a left (resp. right) adjoint iff it is accessible and preserves all small colimits (resp. limits).

Theorem 2.2. Let F:C→D be a functor between locally presentable categories. Then
  - F has a right adjoint if and only if it preserves all small colimits (car C est totale).
  - F has a left adjoint if and only if it is an accessible functor and preserves all small limits.

Proposition 3.2. Every sheaf topos is a total category and a cototal category.
Corollary 3.3. Let F:C→D be a functor between sheaf toposes. Then
  - F has a right adjoint precisely if it preserves all small colimits;
  - F has a left adjoint precisely if it preserves all small limits.

Note: en particulier si F: E->Set est un foncteur continu d'un topos de
Grothendieck vers set, alors il a un adjoint à gauche G, et comme 1 est
initial, F=G(1) est représentable!
Cf https://mathoverflow.net/questions/234361/is-a-left-exact-limit-preserving-functor-ab-to-ab-necessarily-representable
pour une situation similaire pour Ab.

Lifting
-------

* https://ncatlab.org/nlab/show/adjoint+lifting+theorem
Q: A -> B    U:A->C, V:B->D
   |    |
R: C -> D
Si U et V sont monadiques, et A a les coeq des paires reflectives, alors si
R a un adjoint à gauche L, Q aussi.
Si de plus R=Id, Q est monadique.

Adjoint triangle theorem:
* https://ncatlab.org/nlab/show/adjoint+triangle+theorem
Suppose that U:B→C is a functor which has a left adjoint F:C→B with the property that the diagram
  FUFU ⇉_{ϵFU}^{FUϵ} FU →^ϵ 1_B
is a pointwise coequalizer (i.e. U is of descent type). Suppose that A is a category with coequalizers of reflexive pairs; then a functor R:A→B has a left adjoint if and only if the composite UR does.

Remark 2.2. The hypotheses on U are satisfied whenever it is monadic.
Remark 2.3. In fact, it suffices to assume that each counit ϵ:FUb→b is a regular epimorphism, rather than it is the coequalizer of a specific given pair of maps.

Note: The adjoint lifting theorem is a corollary of the adjoint triangle theorem.

Idempotent adjunction
---------------------

https://ncatlab.org/nlab/show/idempotent+adjunction

Donne des conditions équivalentes au fait que the monad induced by the
adjunction is idempotent; en particulier F et G se factorisent en F_1, F_2,
G_1, G_2: C->E->D where F_2 and G_1 are fully faithful, i.e. F_1⊣G_1 is a reflection and F_2⊢G_2 is a coreflection; autrement dit E est une sous-catégorie réflective de E, et coréflective de D.

Definition 1.1. Let F:C⇄D:G be an adjunction with unit η and counit ε. Then the following conditions are equivalent:
  - Fη is a natural isomorphism.
  - εF is a natural isomorphism.
  - GεF is a natural isomorphism — i.e. the monad induced by the adjunction is idempotent.
  - GFη=ηGF
  - GFηG=ηGFG
  - Gε is a natural isomorphism.
  - ηG is a natural isomorphism.
  - FηG is a natural isomorphism — i.e. the comonad induced by the adjunction is idempotent.
  - FGε=εFG
  - FGεF=εFGF

For an idempotent adjunction as in def. 1.1, the functors F and G restrict to an equivalence of categories between the full images of F and of G (which are, respectively, a coreflective subcategory of D and a reflective subcategory of C, both equivalent to the E).

If an idempotent adjunction is monadic, then (up to equivalence) it consists of the inclusion and reflection of a reflective subcategory (i.e. the algebras for an idempotent monad).

Note:
- si G (resp. F) est pleinement fidèle, alors F-|G est idempotent et on a E=D (resp E=C) [avec les notation plus haut], ie D reflective dans C (resp. C coreflective dans C)
- si F-|G est idempotent en particulier Coalg(FG) and Alg(GF) are equivalent (à la catégorie E), cf https://mathoverflow.net/questions/36766/adjunctions-algebras-of-the-induced-monad-vs-coalgebras-of-the-induced-comonad
  qui rajoute:
  One interesting situation where there is an equivalence between a category of coalgebras and a category of algebras is where a monad has a right adjoint. One may then exhibit a canonical comonad structure on this right adjoint, such that its category of coalgebras is canonically equivalent to the category of algebras of the original monad. This comes up in topos theory, for example, where for a category of presheaves Set^C^op, the evident forgetful functor Set^C^op→Set^Ob(C) is both monadic and comonadic.

Adjoint triple
--------------

* https://ncatlab.org/nlab/show/adjoint+triple
(F⊣G⊣H):C⟶D

An adjoint triple (F⊣G⊣H) is equivalently an adjoint pair in the 2-category whose morphisms are adjoint pairs in the original 2-category, hence an adjunction of adjunctions (F⊣G)⊣(G⊣H).

Every adjoint triple (F⊣G⊣H):C→D
gives rise to an adjoint pair (GF⊣GH):C→C
consisting of a monad GF left adjoint to the comonad GH on C;
as well as an adjoint pair (FG⊣HG):D→D.

Proposition 2.3. For an adjoint triple F⊣G⊣H we have that F is fully faithful precisely if H is fully faithful.

=> https://ncatlab.org/nlab/show/adjoint+modality
In (Lawvere 94) an adjoint cylinder is defined to be an adjoint triple such that the outer two adjoints are full and faithful functors. This means equivalently that the induced adjoint pair on the codomain of these inclusions consists of an idempotent monad and comonad (adjoint monads)

Exemple: For instance, if G:D→C is a topological concrete category, then it has both a left and right adjoint which are fully faithful.

Proposition 2.6. For an adjoint triple F⊣G⊣H, the adjunction F⊣G is an idempotent adjunction if and only if the adjunction G⊣H is so.

Exemple:
Given any ring homomorphism f^∘:R→SS (in commutative case dual to an affine morphism f:SpecS→SpecR of affine schemes), there is an adjoint triple f^!⊣f_*⊣f^* where f^*: RMod→ SMod is an extension of scalars, f_*: SMod→ RMod the restriction of scalars and f^!:M↦Hom_R(_R S, _R M) its right adjoint. This triple is affine in the above sense.

* https://ncatlab.org/nlab/show/adjoint+monad
Given a monad T=(T,μ T,η T) which has a right adjoint G, automatically G is a part of a comonad G=(G,δ G,ϵ G) where δ_G and ϵ_G are in some sense dual to μ_T and η_T. Thus there is a bijective correspondence between monads having a right adjoint and comonads having a left adjoint 

Pr:
- If T⊣G then T^k⊣G^k
- Given two adjunctions S⊣T and S′⊣T′ where S,S′:B→A, then there is a bijection between the natural transformations ϕ:S′⇒S and natural transformations ψ:T⇒T qui font commuter le diagramme issu des adjonctions.

Note:
- https://mathoverflow.net/questions/36766/adjunctions-algebras-of-the-induced-monad-vs-coalgebras-of-the-induced-comonad
There is a fairly large class where the canonical comparison functor Coalg(FU)→Alg(UF) is an equivalence, namely when either U is fully faithful or F is fully faithful

One interesting situation where there is an equivalence between a category of coalgebras and a category of algebras is where a monad has a right adjoint. One may then exhibit a canonical comonad structure on this right adjoint, such that its category of coalgebras is canonically equivalent to the category of algebras of the original monad. This comes up in topos theory, for example, where for a category of presheaves SetCop, the evident forgetful functor Set^Cop→Set^Ob(C) is both monadic and comonadic.

* https://ncatlab.org/nlab/show/adjoint+quadruple
Every adjoint quadruple (f_!⊣f^*⊣f_*⊣f^!):C←f !→f *←f *→f !D
induces an adjoint triple on C (f^*f_!⊣f^*f_*⊣f^!f_*):C→C
(hence a monad left adjoint to a comonad left adjoint to a monad) and an adjoint triple (f_!f^*⊣f_*f^*⊣f_*f^!):D→D on D.
Since moreover every adjoint triple (F⊣G⊣H) induces an adjoint pair (GF⊣GH) and an adjoint pair (FG⊣HG) the adjoint quadruple above induces four adjoint pairs.

Exemples
--------

* Topological dualities

- https://en.wikipedia.org/wiki/Pontryagin_duality
The Pontryagin duality theorem:
There is a canonical isomorphism G ≅ G^^  between any locally compact abelian group G and its double dual.
=> Fourier transform pour la mesure de Haar

- https://en.wikipedia.org/wiki/Tannaka%E2%80%93Krein_duality
Tannaka's theorem provides a way to reconstruct the compact group G from its category of representations Π(G):
let F: Π(G) → Vect_C be the forgetful functor from finite-dimensional complex representations of G to complex finite-dimensional vector spaces, and let
T(G) the group of all tensor-preserving, self-conjugate natural transformations of F. Then the map G → T(G), x -> multiplication by x on each representation, is an isomorphism.

Krein's theorem answers the following question: which categories can arise as a dual object to a compact group?

- Gelfand–Naimark theorem states that an arbitrary C*-algebra A is isometrically *-isomorphic to a C*-algebra of bounded operators on a Hilbert space.

- Gelfand duality: https://ncatlab.org/nlab/show/Gelfand+duality
the functor C(−,C) from  topological spaces to the  dual  category of (involutive) C-algebras  which is left adjoint to the Gelfand spectrum Hom(−, C). This adjunction restricts to an equivalence of categories between compact Hausdorff spaces and the  dual category of unital commutative C∗-algebras, et induit une équivalence entre les espaces Hausdorff loc. compact [que l'on peut identifier via le point à l'infini aux espaces de Hausdorff pointés] et les C*-algèbres commutatives non unitales. [En effet, l'unitation donne une équivalence de catégorie entre C*Alg sans unités et C* Alg/C, et le dual de C* Alg/C est */Top_copt.]

* Isbell duality

https://ncatlab.org/nlab/show/Isbell+duality

- Definition

Let 𝒱 be a good enriching category (a cosmos, i.e. a complete and cocomplete closed symmetric monoidal category).
Let 𝒞 be a small 𝒱-enriched category.
Write [𝒞^op,𝒱] and [𝒞,𝒱] for the enriched functor categories.

Proposition 2.1. There is a V-adjunction
(𝒪⊣Spec):[C,𝒱]^op →Spec ←𝒪 [C^op,𝒱]
where 𝒪(X):c↦[C^op,𝒱](X,𝒱(−,c)) and Spec(A):c↦[C,𝒱]^op(𝒱(c,−),A).

All representables are Isbell self-dual: O Spec(V(c,-))=V(c,-)
                                         Spec O(V(-,c))=V(-,c)

Choose any class L of limits in CC and write [C,𝒱]_×⊂[C,𝒱] for the full subcategory consisting of those functors preserving these limits.
Proposition 3.1. The (𝒪⊣Spec)-adjunction does descend to this inclusion, in that we have an adjunction
(𝒪⊣Spec):[C,𝒱]_×^op →Spec←𝒪 [C^op,𝒱]
Proof: the hom functor preserve all limits, so in particular L limits.

- Dualities for function T-Algebras on presheaves

Let C:=T be the syntactic category of a 𝒱-enriched Lawvere theory, that is a 𝒱-category with finite products such that all objects are generated under products from a single object 1.

Then write TAlg:=[C,𝒱]_× for category of product-preserving functors: the category of T-algebras. This comes with the canonical forgetful functor
U_T:TAlg→𝒱:A↦A(1)
Write F_T:T^op↪TAlg for the Yoneda embedding.

Definition 4.1. Call 𝔸_T:=Spec(F_T(1))∈[C^op,𝒱] the T-line object.

Observation 4.2. For all X∈[C^op,𝒱] we have
𝒪(X)≃[C^op,𝒱](X,Spec(F_T(−))). In particular U_T(𝒪(X))≃[C^op,𝒱](X,𝔸_T).

Plus généralement, si T ⊂ C ⊂ TAlg^op, then the original construction of 𝒪⊣Spec no longer makes sense, but that in terms of the line object still does

Proposition 4.3. Set Spec A: B ↦ TAlg(A,B) and 𝒪(X):k↦[C^op,𝒱](X,Spec(F T(k))).
Then we still have an adjunction (𝒪⊣Spec): TAlg_op →Spec←𝒪 [C^op,𝒱].

Voir aussi https://mathoverflow.net/questions/84641/theme-of-isbell-duality

* https://ncatlab.org/nlab/show/Isbell+envelope

Definition 1.1. Let 𝒯 be an essentially small category. Then the Isbell envelope of 𝒯, written E(𝒯), is defined as follows. An object is a triple X=(P,F,c) where
  - P is a contravariant functor 𝒯→Set (a presheaf),
  - F is a covariant functor 𝒯→Set (a copresheaf),
  - c:P×F→𝒯(−,−) is a natural transformation of bifunctors 𝒯^op×𝒯→Set.

Proposition 1.2. There is a (“double/twosided Yoneda”) embedding of 𝒯 as a full subcategory of E(𝒯) via T↦(𝒯(−,T),𝒯(T,−),∘)

Identifying 𝒯 with its image, there are natural isomorphisms
𝒯^g(T,X)≅P_X(T), 𝒯^g(X,T)≅F_X(T)

$ 2. Profunctors
The Isbell envelope of a category can be viewed as a category of profunctors. In short, the Isbell envelope of 𝒯 consists of the lax factorisations of Hom through 1.
En effet, un profoncteur A->B est un foncteur AxB^op->Set, un foncteur covariant F:A->Set peut se voir comme un profoncteur A->1, et un foncteur contravariant B->Set comme un profoncteur G:1->B. La composition nous donne le profoncteur FxG:AxB^op->Set.
An object in the Isbell envelope of 𝒯 produces a profunctor 𝒯→𝒯 which factors through 1. There is an obvious profunctor 𝒯→𝒯 given by the Hom-bifunctor.
This is the identity for profunctor composition.
Thus an object in the Isbell envelope of 𝒯 corresponds to an object in the subcategory of the slice category of profunctors over Hom of those objects which factor through 1.
In other words, a lax factorisation of Hom through 1.
This characterization relates directly to a definition of Cauchy
completion: the Cauchy completion as a subcategory of the Isbell envelope, that factorizes through both the free completion and free cocompletion.

$ 5. Isbell Duality

Definition 5.1. An object X of E(𝒯)is said to be P-saturated if the obvious natural transformations P_X(T)→NatTrans(F_X,𝒯(T,−)) 
are isomorphisms.
It is said to be F-saturated if the obvious natural transformations
F_X(T)→NatTrans(P_X,𝒯(−,T)) are isomorphisms.
It is said to satisfy Isbell duality if it is both P and F-saturated. 

Theorem 5.6. Let 𝒯 be an essentially small category admitting a constant separator. Then for an object X of E(𝒯), the following hold:
  - If X is P-saturated then it is P-concrete,
  - If X is F-saturated then it is F-concrete,
  - If X satisfies Isbell duality then it is concrete.

### Codensity monad

* http://www.tac.mta.ca/tac/volumes/28/13/28-13abs.html

Codensity and the ultrafilter monad, Tom Leinster
The codensity monad of the inclusion of (finite sets) into (sets) is the ultrafilter monad; the algebra is the category of compact Hausdorff spaces.
The codensity monad of the inclusion of (finite-dimensional vector spaces) into (vector spaces) is double dualization.
The codensity monad of the inclusion of (finite families of sets) into
(families of sets) is the ultraproduct monad.

- Density:
si F: A->B (A small, B cocomplete), on a une adjonction
Hom(F,-): B -> [A^op, Set] : \tens_F   où \tens_F -| Hom(F,-)
qui induit une comonade sur B: la comonade densité.
F dense <=> the right adjoint Hom(F,-): B->[A^op, Set] is full and faithfull
<=> la comonade densité est triviale (ie the counit is an isomorphism).

Exemples:
- F: \Delta -> Top, [n]->\Delta^n le n-simplexe
  Then Hom(F,−) sends a topological space to its singular simplicial set, and −⊗F sends a simplicial set to its geometric realization.
- Let X be a topological space, with poset O(X) of open subsets. Define
  F:O(X)→Top/X by F(W) = (W↪X). This induces an adjunction between
  presheaves on X and spaces over X, and, like any adjunction, it restricts
  canonically to an equivalence between full subcategories. Here, these are
  the categories of sheaves on X and  ́etale bundles over X. The induced
  monad on the category of presheaves is sheafification

- Codensity:
G: B->A, B essentially small et A complète.
On a une adjonction:
Hom(-,G): A -> [B^op, Set] : Hom(-,G), qui induit une monade T^G sur A: la
codensity monad.
G codense := Hom(-,G): A->[B^op, Set] is full and faithfull <=> T^G=Id

* https://ncatlab.org/nlab/show/codensity+monad
The codensity monad of a functor G can be thought of as the monad induced by G and its left adjoint, even when no such adjoint exists:
The codensity monad 𝕋^G is a generalization of this monad to functors G:ℬ→𝒜 merely admitting a right Kan extension Ran_G G of G along itself, with both monads coinciding in case G:ℬ→𝒜 is a right adjoint.

* https://golem.ph.utexas.edu/category/2012/09/where_do_monads_come_from.html
A functor G:B→A may or may not have a codensity monad. If it does, it’s a monad on A, and I’ll call it T^G. In the event that G has a left adjoint, F, the codensity monad does exist, and it’s simply GF.

1. The slickest definition: the codensity monad of G is the right Kan extension of G along itself. (This may or may not exist.) The monad structure comes from the universal property of Kan extensions.
2. Slightly more explicitly, the codensity monad T^G can be defined as an end: for A∈A: T^G(A)=∫_B [A(A,GB),GB].
Here [A(A,GB),GB] is a power in A: that is, it’s the product of lots of copies of the object GB, one for each element of the set A(A,GB). The end might or might not exist.
3. If you’re not comfortable with ends, maybe you’ll prefer the same formula expressed as a limit. Let A∈A. Let A/G be the comma category whose objects are maps f:A→GB (or more exactly, pairs (B,f) where B∈B and f∈A(A,GB)). There’s a functor A/G→A sending this object to GB, and T^G(A) is defined to be its limit (if it exists).
4. Here’s a fourth and final way to say it. For this, let’s assume that B is small and A has small limits. Then, à la Kan, the functor G induces an adjunction
Hom(−,G): A →⟵ [B,Set]^op : Hom(−,G)
where I’m calling both functors Hom(−,G), though they’re not the same. The left adjoint Hom(−,G):A→[B,Set]^op is defined by (Hom(A,G))(B)=A(A,GB). I’ll skip the description of the right adjoint — see the paper if you want to know. Of course, the right adjoint is determined by the fact that it’s a right adjoint: explicitly, Hom_A(A,Hom(Y,G))≅Hom_[B,Set](Y,Hom(A,G))
whenever A∈A and Y∈[B,Set]. Anyway, being an adjunction, it induces a monad, and this is the codensity monad of G.

Theorem: given any monad S on A, there’s a natural one-to-one correspondence between:
  - maps of monads S→T^G, and
  - functors B→Alg(S) over A.
So the process of constructing codensity monads is adjoint to the process of constructing the category of algebras for a monad.

Reformulation: (CAT/A)_mndc ⊆ (CAT/A)_CM (monadic functors inside those that have a codensity monad).
The theorem now is that it’s a reflective subcategory. That is, the inclusion functor (CAT/A)_mndc↪(CAT/A)_CM has a left adjoint. The adjoint takes a functor G:B→A and turns it into the forgetful functor Alg(T^G)→A.

In other words, the canonical way to force a functor to be monadic is to first take its codensity monad, then form the corresponding monadic functor.

Exemples:
- the codensity monad of the functor 1→A that picks out the single object A is the endomorphism monad End(A); it sends an object X of A to the power [A(X,A),A].
An SS-algebra structure on A amounts to a monad map S→End(A).
- the codensity monad of G:Field↪Ring is T^G(A)=∏_p∈Spec(A) Frac(A/p)
  On the geometric side, Spec(T^G(A)) is the Stone–ˇCech compactification of the discrete space Spec(A).

- Plus de détails dans le papier:
  T^G est le terminal object de la catégorie K(G)={S: A->A tel que SG=>G},
  par définition comme une right Kan extension de G le long de lui-même.

  The category K(G) is monoidal under composition.  Being the terminal object of amonoidal category, (TG,κ_G) has a unique monoid structure.  This gives T^G the structure of a monad, the codensity monad of G.

  5.2 Lemma: si G:B->A est une inclusion, S une monade sur A qui se
  restreint à l'identité sur B, a:S->T^G une transformation naturelle. (<=>)
  - a est une map de monoïdes dans K(G)
  - a:S->T^G est une map de monades
  - a o \eta^S=\eta^G. [autrement dit pour être une map de monades, il
    suffit de respecter l'unité, ça respectera automatiquement la
    multiplication!]

  Corollaire: T^G est la monade terminale sur A qui se restreint à
  l'identité sur B.

* https://golem.ph.utexas.edu/category/2012/09/where_do_ultrafilters_come_fro.html

Definition  Let X be a set. An ultrafilter on X is a set Ω of subsets such that whenever X is expressed as a disjoint union of three subsets, exactly one belongs to Ω. Equivalently: whenever X is expressed as a disjoint union of a finite number of subsets, exactly one belongs to Ω.

Theorem  The codensity monad of the inclusion FinSet↪Set is isomorphic to the ultrafilter monad.

Theorem  Let B be a full subcategory of FinSet containing at least one set with at least 3 elements. Then the codensity monad of the inclusion B↪Set is isomorphic to the ultrafilter monad.

Theorem  Let B be a finite set with at least three elements. Then for any set X, the set of End(B)-equivariant maps [X,B]→B is canonically isomorphic to the set of ultrafilters on X.

- D'autres résultats dans le papier:
1.7. Theorem.[B ̈orger] The ultrafilter endofunctor U is terminal among all endofunctors of Set that preserve finite coproducts.

1.8. Corollary.[B ̈orger] The ultrafilter endofunctor U has a unique monad structure. With this structure, it is terminal among all finite-coproduct-preserving monads on Set.

There is also a topological description of the ultrafilter monad.
As shown by Manes [33], it is the monad induced by the forgetful functor
CptHff→Setand its left adjoint. In particular, the Stone–ˇCech
compactification of a discrete space is the set of ultrafilters on it

* https://golem.ph.utexas.edu/category/2012/09/where_do_linearly_compact_vect.html

Theorem  The algebras for the ultrafilter monad are the compact Hausdorff spaces.

Theorem  The codensity monad of FDVect↪Vect is the double dualization monad.
Theorem  The algebras for the codensity monad of FDVect↪Vect are the linearly compact vector spaces.

A linearly compact vector space over a field k is a topological vector space over k such that:
  - the topology is linear: the open affine subspaces form a basis for the topology
  - any family of closed affine subspaces with the finite intersection property has nonempty intersection
  - the topology is Hausdorff.
Note: a finite-dimensional vector space can be made into a linearly compact vector space in one and only one way: by giving it the discrete topology. This is like the fact that a finite set can be made into a compact Hausdorff space in one and only one way — again, by giving it the discrete topology.

In summary, we have the following table of analogues:
sets                        vector spaces
finite sets                 finite-dimensional vector spaces
ultrafilters                elements of the double dual
compact Hausdorff spaces    linearly compact vector spaces

* https://mathoverflow.net/questions/104777/what-are-the-algebras-for-the-double-dualization-monad/104845#104845

(−)∗:Vect^op→Vect is monadic so the algebra for the ** monad is Vect^op. 
- Par la discussion plus haut, Vect^op=linearly compact vector spaces.
- Vect is the Ind-completion (or Ind-cocompletion) of the category of finite-dimensional vector spaces, and therefore Vect^op as the Pro-completion of the opposite category, which is again Vect_fd.
[Dans les commentaires: This extends even further to a duality between coalgebras and pseudocompact algebras (inverse limits of finite dimensional algebras).]

Note: the category of algebras for the double powerset monad on Set is Set^op. This is illuminated by the fact that Set^op is equivalent to the category of complete atomic Boolean algebras.

- https://mathoverflow.net/questions/11261/is-the-ultraproduct-concept-fundamentally-category-theoretic/13455
Let Fam(E) be the category in which an object is a set X together with a family (Sx)x∈X of objects Sx of E.
The ultraproduct construction gives a functor Fam(E)→Fam(E):(∏_U S)_{ultrafilters U on X}. In fact, it gives not just a functor but a monad on Fam(E), the ultraproduct monad for E.
Theorem: The codensity monad of the inclusion functor FinFam(E)↪Fam(E) is the ultraproduct monad for E.

Plus de détails dans le papier:
Ultraproducts can also be understood sheaf-theoretically (as in 2.6.2 of [38]).  A family (Sx)x∈X of sets amounts to a sheaf S on the discrete space X, with stalks Sx. The unit map η_X:X→U(X) embeds the discrete space X into its Stone–ˇCech compactification, and pushing forward gives a sheaf (η_X)_∗ S onU(X). The stalk of this sheaf over U is exactly the ultraproduct ∏_U S.

8.7 Corollary. The category of algebras for the codensity monad of FinFam(Set)↪Fam(Set) is  equivalent  to CHSheaf,  the  category  of  sheaves  on  compact  Hausdorff spaces.

Localisation
============

## Définition

https://ncatlab.org/nlab/show/localization

A localization of C by W (or “at W”) is a category C[W^−1] and a functor Q:C→C[W^−1] such that
- for all w∈W, Q(w) is an isomorphism;
- for any category A and any functor F:C→A such that F(w) is an isomorphism for all w∈W, there exists a functor F_W:C[W^−1]→A and a natural isomorphism F≃F_W∘Q
- the map between functor categories (−)∘Q:Funct(C[W^−1],A)→Funct(C,A) is full and faithful for every category A.

A weak equivalence W c'est quand W est une sous-catégorie de C, qui
contient les iso, et satisfait la 2-out-of-3: si 2 de {g,f,gof} est dans W,
le troisième aussi.
(Souvent on considère les localisations en de tels W)

## Calculus of fractions

https://ncatlab.org/nlab/show/calculus+of+fractions
- W is a wide subcategory of C (that is, W contains all identities and is closed under composition).
- si w: x->z est dans W, et f: y->z, on peut tirer en arrière pour avoir
  w': x'->y dans W, f':x'->x qui fait commuter le diagramme (right Ore
  condition)
  [ie v^{-1} o f = f' o v'^{-1}]
- si w∈W coéqualise f,g, alors il existe w'∈W qui équalise f,g.
  (right canceability) [ie si w f=w g alors f w'=g w']

=> il suffit d'inverser les w∈W à droite: f v^{-1} est la classe
d'équivalence a <- v - a' - f -> b; et f v^{-1} = g w^{-1} quand il existe
s, t tels que vos = tow dans W et f s^{-1} v^{-1}=g t^{-1} w^{-1}
(on peut supposer que W est saturé donc que s, t sont dans W).
Pour composer en utilise la condition de Ore: f v^{-1} g w^{-1}=f g' v'^{-1} w^{-1}.
I.E. on utilise des spans plutôt que des zig-zags pour construire la
localisation.

Prop: the localization functor Q:C→C[W^−1] is left exact, and therefore preserves all finite limits existing in C.

Note: on peut supposer W saturé par la 2-out-of-3:
https://ncatlab.org/nlab/show/two-out-of-three
ou même la 2-out-of-6:
https://ncatlab.org/nlab/show/two-out-of-six+property
Note that the 2-out-of-3 property includes closure under composition, and the 2-out-of-6 property together with containment of all identities implies containment of all isomorphisms.
In the presence of either sort of calculus of fractions, the 2-out-of-6 property is equivalent to saturation of W, i.e. that any morphism in C which becomes an isomorphism in C[W^−1] is already in W.

Catégorie reflective
--------------------

* https://ncatlab.org/nlab/show/reflective+subcategory
Given any pair of adjoint functors (Q^*⊣Q_*):B⟶A the following are equivalent:
  - The right adjoint Q_* is fully faithful. (In this case B is equivalent to its essential image in A under Q_*, a full reflective subcategory of A.)
  - The counit ε:Q^*Q_*→1_B of the adjunction is a natural isomorphism of functors.
  - The monad (Q_*Q^*,Q_*εQ^*,η) associated with the adjunction is idempotent, the right adjoint Q_* is conservative, and the left adjoint Q^* is essentially surjective on objects.
  - If S is the set of morphisms s in A such that Q^*(s) is an isomorphism in B, then Q^*:A→B realizes B as the (nonstrict) localization of A with respect to S

Any reflective subcategory is recovered as the Eilenberg-Moore category of algebras over its associated idempotent monad.
A reflective subcategory is always closed under limits which exist in the ambient category (because the full inclusion is monadic, as noted above), and inherits colimits from the larger category by application of the reflector.
Donc en particulier, si A est complète (cocomplète) alors B aussi.

If the reflector (which as a left adjoint always preserves all colimits) in addition preserves finite limits, then the embedding is called exact. If the categories are toposes then such embeddings are called geometric embeddings.
In particular, every sheaf topos is an exact reflective subcategory of a category of presheaves Sh(C)↪←sheafify PSh(C). The reflector in that case is the sheafification functor.

Theorem 3.1. If X is a reflective subcategory of a cartesian closed category, then it is an exponential ideal if and only if its reflector D→C preserves finite product. [cf https://ncatlab.org/nlab/show/exponential+ideal]

Catégorie réflexive et coréflexive dans les préfaisceaux
--------------------------------------------------------

Theorem 4.5. A subcategory of a category of presheaves [A^{op}, Set] which is both reflective and coreflective is itself a category of presheaves [B^{op}, Set], and the inclusion is induced by a functor A→B.

* Plus généralement, les auteurs de http://www.tac.mta.ca/tac/volumes/10/16/10-16abs.html, Simultaneously Reflective And Coreflective Subcategories of Presheaves, Robert El Bashir and Jiri Velebil 
prouvent le résultat dans une catégorie V-enrichie, V symmetric monoidal
closed complete and cocomplete. 

Exemple: V=Ab => toute sous-catégorie pleine de Ab=[Z^op,Ab] qui est
réflexive et coréflexive et de la forme [R^op, Ab], où R est une
Ab-catégorie avec un objet, ie un anneau.

De plus, si un foncteur P:A->B induit par restriction un morphisme
pleinement fidèle y_P: [B^op,V]->[A^op,V]; P est dit connected.

Le foncteur restriction y_P a toujours un adjoint à gauche et à droite
(left/right Kan extension), et P est connecté si la counité de l'extension
de Kan a gauche est un iso <=> P^op est connected <=> [B,V]->[A,V] est
fully faithfull <=> [B,X]->[A,X] est fully faithfull pour tout X <=> P est
absolument dense, ie est dense et les objets de B que l'on peut construire
comme des colimites le long de P sont des colimites absolues.

Note: P est dense si a left Kan extension Lan_P P of P along itself exists and is isomorphic to the identity functor 1_B:B→B

Ex: si f: R->S morphisme d'anneau, f est un épi <=> [R,X] -> [S,X] est
fully faithfull pour toute Ab-catégorie X.
Ex: si V=Set, P est connexe si f//P est connexe pour toute flêche f:b'->b.
Note: si P:A->B est connected, on factorise P=GoF F:A->C, G:C->B où F est
surjectif sur les objets et G fully faithfull; alors F est connected et C
et B sont Morita equivalent, ie ont la même catégorie de préfaisceaux.

Corollaire du théorème:
- Any full reflective and coreflective subcategory of V is equivalent to the category of the form [ A^op , V ] ,where A has one object, that is, it corresponds to a monoid in V.
- R ring => Full reflective and coreflective subcategories of [ R^op , Ab ] are of the form [ S^op , V ] for a one-object Ab -category S , that is, a ring S with a unit. Moreover, the inclusion [ S^op , V ] −→ [ R^op , V ] is induced by an epimorphism of rings f : R → S

## Reflective localization

https://ncatlab.org/nlab/show/reflective+localization
A special class of localizations are reflective localizations, those where
the functor C→L_W C has a full and faithful right adjoint. In such a case
this adjoint exhibits L_W C as a reflective subcategory of C.
One shows that L_W C is – up to equivalence of categories – the full subcategory on the W-local objects, and this property precisely characterizes such reflective localizations (ie si la catégorie des objets W-local est réflective, alors c'est L_W C).
Réciproquement, une sous-catégorie réflective C' de C est L_W C où W est la
classe des morphismes envoyés sur des isos par le réflecteur L.

https://ncatlab.org/nlab/show/local+object
c is W-local si y(c) envoie les flêches w:a->b de W sur des isos
Hom(b,c)->Hom(a,c). Un morphisme est W-local ssi y(c)(f) est un iso pour
tout objet c W-local.

Cas d'un topos: https://ncatlab.org/nlab/show/geometric+embedding
Une réflexion exacte est un geometric embedding, elle vient d'une topologie
de Lawvere-Tierney et peut se voir comme une faisceautification.

Let f:F↪E be a geometric embedding and let W⊂Mor(E) be the class of morphisms sent by f^* to isomorphisms in F.
Theorem. We have:
  F is equivalent to the localization E[W^-1]
  F is equivalent to the full subcategory of E on W-local objects.
[De plus W satisfait la 2 out of 3 et W is a left multiplicative system.]

Reflective factorisation system
-------------------------------

https://ncatlab.org/nlab/show/reflective+factorization+system
A reflective factorization system is an orthogonal factorization system (E,M) that is determined by the reflective subcategory M/1.

Let C be a category with a terminal object 1. If (E,M) is an (orthogonal) factorization system on C, then the full subcategory M/1⊆C (consisting of those objects X for which X→1 is in M) is reflective. The reflection of Y∈C is obtained by the (E,M)-factorization Y →e ℓY →m 1.
In fact, in this we do not need (E,M) to be a factorization system; only a prefactorization system with the property that any morphism with terminal codomain admits an (E,M)-factorization. For the nonce, let us call such a prefactorization system favorable.
Conversely, suppose that A↪C is a reflective subcategory, and define E to be the class of morphisms inverted by the reflector ℓ:C→A, and define M=E^⊥. Then (E,M) is a favorable prefactorization system. In this way we obtain an adjunction
Φ:reflective subcategories⇄favorable prefactorization systems:Ψ.
The unit of this adjunction is easily seen to be an isomorphism. That is, given a reflective subcategory A, if we construct (E,M) from it as above, then A≃M/1. Therefore, the adjunction allows us to identify reflective subcategories with certain favorable prefactorization systems.
The prefactorization systems arising in this way — equivalently, those for which (E,M)=ΦΨ(E,M) — are called the reflective prefactorization systems. A reflective factorization system is a reflective prefactorization system which happens to be a factorization system.
More generally, for any favorable factorization system (E,M), we have a reflective prefactorization system ΦΨ(E,M), called the reflective interior of (E,M)

Theorem 3.1. Let (E′,M′) be the reflective interior of (E,M). Then:
  - f∈E′ precisely when there exists a g∈E such that gf∈E
  - (E,M) is reflective precisely when gf∈E and g∈E together imply f∈E.
Note that the left class in any orthogonal factorization system is automatically closed under composition, contains the isomorphisms, and satisfies the property that gf∈Eg and f∈E together imply g∈E. Therefore, (E,M)(E,M) is reflective precisely when EE is a system of weak equivalences

Theorem 3.2. Suppose that C is finitely complete and M-complete for some factorization system (E,M), where M consists of monomorphisms and contains the split monics. Then any reflective prefactorization system on C is a factorization system.
Theorem 3.3. Suppose that C is finitely complete and that (E,M) is a reflective prefactorization system on C such that E-morphisms are stable under pullback along M-morphisms. Then (E,M) is a factorization system.

Liens avec la localisation:
For any favorable prefactorization system (E,M), it is easy to show that M/1 is the localization of C at E. If (E′,M′) is the reflective interior of (E,M), then since E′ is the class of maps inverted by the reflector into M/1, it is precisely the saturation of E in the sense of localization (the class of maps inverted by the localization at E).
Reflective stable factorization systems
A reflective factorization system on a finitely complete category is a stable factorization system if and only if its corresponding reflector preserves finite limits. A stable reflective factorization system is sometimes called local.

Résumé
------

- reflective subcategories are localizations (for W=les morphismes qui
  deviennent des isos via L, ie les morphismes locaux)
- reflective localization reflects onto full subcategory of local objects:
  si la W-localisation existe et est réflective (ie on a un adjoint à
  droite C[W^-1]->C pleinement fidèle), alors L est la réflexion vers les
  objets W-locaux de C.
- Enfin, si CW la catégorie des objets W-locaux est reflective dans C,
  alors par ce qui précède, CW est la localisation de C par rapport aux
  morphismes W-locaux (ce qui inclus W, mais peut-être plus grand; c'est la
  saturation de W).
  Cependant, on a la propriété de localisation suivante sur CW:
  si F est un foncteur adjoint à gauche qui inverse W, alors il
  inverse tous les morphismes W-locaux, donc se factorise par CW.
- Si C a un objet terminal 1, alors LC -> C est une localisation
  réflective, E les morphismes locaux, M=orth de E; alors (M,E) est un
  "favorable prefact system". Récip si (M,E) est un tel système, on a une
  sous-catégorie réflective M/1, et (M',E') est le favorable prefact sytem
  qui correspond à M/1, E' est la saturation de E.
  De plus (M', E') est un fact system si E' est stable par pullback le long
  de M' ou si C est M0-complète pour un système de factorisation (E0,M0) où
  split monic \subset M0 \subset monic.

Epi/Mono
========

- f: A->B est mono ssi Hom(T,A)->Hom(T,B) est mono
- f: A->B est epi ssi Hom(B,T)->Hom(A,T) est mono

f:A->B, g:B->C, h=gof:A->C
Alors f+g mono/épi => h mono/épi
f et h épi => g épi
g et h mono => f mono

TODO: Kelly
- Kelly_monomorphisms_epimorphisms_and_pullbacks.pdf
- Kelly_Classes_Morphisms_Closed_Under_Limits_JKMS-23-1-1-18.pdf
  généralise certains résultats de l'article précédent
- Kelly_Conservative_Functors_JKMS-23-1-19-33.pdf
  contient un résumé sur les types d'épi, des conditions sur la
  (Mono,StrEpi) factorisation, et des résultats sur les conservative functors
  J'ai déjà des notes sur les deux derniers résultats, grepper
  SOME REMARKS ON CONSERVATIVE FUNCTORS WITH LEFT ADJOINT

Types d'épi
-----------

* http://ncatlab.org/nlab/show/epimorphism
- f: A->B est un épi ssi B est le pushout de f par lui même
  De plus f est stable par pushout

There are a sequence of variations on the concept of epimorphism, which conveniently arrange themselves in a total order. In order from strongest to weakest, we have:
- split epimorphism = morphism having a section
- effective descent morphism
- descent morphism = stable regular epimorphism
- effective epimorphism = coequalizer of its kernel pair
- regular epimorphism = coequalizer of some parallel pair of morphisms
- strict epimorphism = joint coequalizer of all pairs which it coequalizes
- strong epimorphism = an epimorphism right orthogonal to monomorphisms
- extremal epimorphism = an epimorphism not factoring through any nontrivial monomorphism.
- epimorphism.

Equivalence: 
- si C admet les pullbacks, alors Effectif <=> Régulier <=> Strict et Strong <=> Extrémal
  (en effet, si f a un kernel pair, alors f est un coéq ssi c'est le coéq de son kernel pair)
- si les CoImReg existent et les regular épis sont stables par composition, Strong <=> Regular
- si C régulière, f Extrémal <=> f Morphisme de Descente
  cf http://ncatlab.org/nlab/show/descent+morphism, si C rég, f descent <=>
  f régulier, et comme C régulière, f régulier <=> f extrémal)

Th: si f est un épi régulier (ou extrémal) + un mono alors f est un iso

Pr: 1) En effet, f régulier => f extrémal et f extrémal épi+mono => f iso par définition.
    2) Directement, cf https://qchu.wordpress.com/2012/11/03/regular-and-effective-monomorphisms-and-epimorphisms/
si f coequalize g_1 et g_2, alors f g_1=f g_2, donc g_1=g_2 car f mono, et
donc f est un iso (car l'id se factorise à travers le coequalisateur)

- f: A->B est extrémal épi si f est épi et le seul moyen d'écrire f comme
  mono o morphisme est quand le mono est un iso.
  http://ncatlab.org/nlab/show/extremal+epimorphism
  (Note si f extrémal et C a les équalisateurs, f est un épi extrémal)

- f: A->B est strong épi s'il est épi et orthogonal aux monomorphismes
  http://ncatlab.org/nlab/show/strong+epimorphism
  http://ncatlab.org/nlab/show/orthogonality

  Orthogonal: A->>B => il y a un unique morphisme B->C qui fait commuter le diagramme       |   |
              v   v
              C-->D

  Strong => Extrémal, donc si C a les équalisateurs, juste être orthogonal
  aux monos suffit à être un épi
         <= si C admet les pullbacks [TODO + eqs? Cf Kelly "SOME REMARKS ON CONSERVATIVE FUNCTORS WITH LEFT ADJOINT"]

- f:A -> B est épi strict si 'f is the joint coequalizer of all parallel pairs of morphisms that it coequalizes.'
  (<=> f est un coéqualisateur d'une famille non nécessairement petite)
  http://ncatlab.org/nlab/show/strict+epimorphism

- f: A->B est épi régulier si f est un coégalisateur
  http://ncatlab.org/nlab/show/regular+epimorphism

- f: A->B est épi effectif si f est le coégalisateur de son 'kernel pair'
  http://ncatlab.org/nlab/show/effective+epimorphism

  Le kernel pair de f:A->B est simplement le produit fibré A x_B A
  ou encore le pullback de f au-dessus de lui-même
  A x_B A -> A
    |        |
    A     -> B

  Effectif => Régulier => Strict (équivalence si f admet une kernel pair):
  A morphism having a kernel pair (such as any morphism in a category
  with pullbacks) is a regular (or even strict) epimorphism if and only if
  it is the coequalizer of its kernel pair.

- https://ncatlab.org/nlab/show/descent+morphism
  Let C be a category with pullbacks, p:A->B.
  ker(p)= A x_B A => A, on a donc A x_B A => A -> B
   The evident internal functor ker(p)→ (viewing B as a discrete internal category) induces a comparison functor C^B \to C^{ker(p)}. We say that p is:
    - a descent morphism if this comparison functor is fully faithful, and
    - an effective descent morphism if this comparison functor is an equivalence of categories.
  Note: C^{ker p} ce sont les objets X->A muni d'une action A x_B X -> X.

  Theorem. p:A→B is a descent morphism if and only if p is a stable regular epimorphism. [stable=stable par pullback, donc si C régulière p descent<=> p régulier]

  Theorem. Effective descent morphisms are closed under pullback and composition.

  - https://ncatlab.org/nlab/show/regular+epimorphism
  In a regular category, every regular epimorphism is stable, and therefore a descent morphism. If the category is moreover exact, or has stable reflexive coequalizers, then every regular epimorphism is an effective descent morphism.

* Quand-est-ce que Strong Epi = Regular Epi?

Cf plus bas dans factorisation system:
https://math.stackexchange.com/questions/1652019/is-composition-of-regular-epimorphisms-always-regular
In a category with all kernel pairs and coequalisers of kernel pairs
  - regular epimorphisms are stable under composition;
  - regular epimorphisms coincide with strong epimorphisms;
  - for any morphism f, if m_f∘e_f is its factorisation through the coequaliser of its kernel pair, m_f is a monomorphism;
  - regular epimorphisms and monomorphisms form a factorisation system.

C'est le cas en particulier dans une catégorie régulière.
Rappel: régulier=on a les pullbacks, et les CoImReg qui de plus sont stables par pullbacks <=> On a un (StrEpi, Mono) fact system stable par pullback
(il faut utiliser la stabilité par pullback pour voir qu'on est dans la
situation de 1652019)

* SOME REMARKS ON CONSERVATIVE FUNCTORS WITH LEFT ADJOINTS
  http://icms.kaist.ac.kr/mathnet/thesis_file/JKMS-23-1-19-33.pdf

familial strong épi = comme strong épi mais pour une famille de mono m_i:
  f: A->>B
     |   |
m_i: X->Y_i

- Closure:
The classes of strict epimorphisms, of familially-strong epimorphisms, of small-familially-strong epimorphisms, of strong epimorphisms, and of (mere) epimorphisms, are each closed under colimits.
In addition, each of these classes except that of strict epimorphisms is closed under composition. Moreover, each of these classes is preserved by any functor S with a right adjoint, since S preserves colimits and its right adjoint T preserves jointly-monomorphic families.
(Par contre regular epi et extremal epi n'ont pas en génréal de bonnes
propriétés de cloture, sauf bien sûr dans les cas où ils sont égaux aux
autres classes.)

- Equivalence: existence of small product OR non-empty finite limits and
arbitrary intersection of regular monos OR pushouts OR coeqs and arbitrary cointersections of strong épi -> strong <=> familial strong

### Cas particuliers

* Dans Reflective subcategories, localizations and factorization systems,
  les auteurs disent que si C est finiment complète ou cocomplète, alors
  Mono^perp=StrongEpi et StrongEpi^perp=Mono.

* GENERATORS  AND  COLIMIT  CLOSURES MICHAEL A. SHULMAN
  http://home.sandiego.edu/~shulman/papers/generators.pdf
C finitely complete; Regular ⇒ strong ⇔ extremal ⇒ epic

Fact: If  extremal  epis  are  stable  under  pullback  and  every
      morphism  factors as an extremal epic followed by a monic, then all
      extremal epics are regular
      [En fait c'est juste la caractérisation de Joyal des catégories
      régulières: (StrEpi, Mono) est un fact system stable]

Congruence
----------
https://ncatlab.org/nlab/show/congruence
 A congruence on an object X is an internal equivalence relation on X.
 A congruence which is the kernel pair of some morphism is called effective.
 The coequalizer of a congruence is called a quotient object.
 The quotient of an effective congruence is called an effective quotient.
 A regular category is called an exact category if every congruence is effective.
 Abelian category=Additive category+Exact

Ex: G/K is the quotient of G by the congruence GxK -> GxG
    Comme Group est régulière c'est aussi le quotient de
     G \tens_G/K G -> GxG.
    On a donc G \tens_G/K G \iso GxK, l'iso est
      (g1,g2) -> (g1, g2/g1∈K)

Image et factorisation
======================

Types d'images
--------------

* http://ncatlab.org/nlab/show/image
  https://ncatlab.org/nlab/show/orthogonal+factorization+system

On a deux notions d'image/coimage dans une catégorie admettant
des limites et colimites:
- l'image régulière, qui est l'équalisateur du cokernel pair
- la coimage régulière, qui est est le coequalisateur du kernel pair
- la M-image, qui est le plus petit M-sous-objet tel qu'on se factorise
  A-> Im(f) -> B avec Im(f)->B ∈ M
  Et l'image correspond à M=monomorphismes
- pareil pour la M-coimage

-> ImReg=RegMono-image et CoImReg=RegEpi-coimage:
   In other words, the regular image is the equalizer of the cokernel pair. To see that this is in fact the RegMono-image, we first note that it is of course a regular monomorphism by definition, and then invoke the fact that in a category with finite limits and colimits, a monomorphism is regular if and only if it is the equalizer of its cokernel pair.

-> Dans une catégorie régulière, CoImage-régulière = Image (pour M=monos)
[Pr: http://ncatlab.org/nlab/show/%28epi%2C+mono%29+factorization+system
On a un factorisation system orthogonal (strong epi, mono) par définition
de strong épi, et dans une catégorie régulière strong épi=regular épi.
Plus de détails dans: https://ncatlab.org/nlab/show/regular+category
strong épi=orth à mono, mais pour voir que tout morphisme f:x->y se
factorise, on considère e:x->coimreg le coéqualisateur de son kernel pair,
alors coimreg->y est un mono, et est même l'image de f, ie le plus petit
sous-objet par lequel f se factorise.]

* CoImage-Régulière

- Existe dès qu'on a les coéqs de kernels pairs.
- Remarque sur les coéqs:
  Si on a A -> B => C, alors on a un morphisme du coéq de A=>C vers le coéq
  de B=>C, qui est un iso si A->B est un épi.
- Remarque sur les kernels pairs: si f:A->B, g:B->C, on a un morphisme
  naturel A x_B A -> A x_C A, qui est un iso si B-->C.
- Si f:A->B, on a donc A->CoImReg f -> B où A->CoImReg f est un épi
  régulier. Si f se factorise en A->C->B avec g:A->C, alors on a
  CoImReg g ->> CoImReg f est une coimage régulière.
  En effet, on a A x_C A => A qui se factorise par A x_B A et on applique
  le résultat plus haut.
  En particulier si A->>C est régulier, on a A->>C->>CoImReg f -> B.

* Noyaux généralisés:
https://ncatlab.org/nlab/show/generalized+kernel
we obtain an adjunction quot:[J,C]⇄[2,C]:ker

Factorisation system
--------------------

* https://en.wikipedia.org/wiki/Factorization_system

(M,E) factorisation system si tout morphisme f se décompose en f=e o m
de manière fonctorielle: si e o m et e' o m' sont reliés par un morphisme
(u,v), alors il y a un morphisme w tel que (u,w) soit un morphisme de e->e' et
(w,v) un morphisme de m->m'.

Cette fonctorialité se retraduit en M \subset orthogonal de E, E \subset
orthogonal de M (= (M,E) is a prefact system). En particulier, si
E=orthogonal de M, (M,E) est un prefact system.

* https://ncatlab.org/nlab/show/weak+factorization+system
Every morphism f:X→Y may be factored as the composition of a morphism in ℒ followed by one in ℛ
The classes are closed under having the lifting property against each other.
(lifting property: il y a un lift, pas forcément unique)
Si la factorisation est unique (<=> les lifts sont uniques) => orth. system

* https://ncatlab.org/nlab/show/orthogonal+factorization+system
(M,E) OFS si tout morphisme se décompose en eom et
  a. E is precisely the class of morphisms that are left orthogonal to every morphism in M;
  b. M is precisely the class of morphisms that are right orthogonal to every morphism in E.
[en fait si tout morphisme se décompose en e o m, il suffit que
M^orth \subset E <=> E^orth \subset M pour avoir l'équalité]
Ou
  a. The factorization is unique up to unique isomorphism.
  b. E and M both contain all isomorphisms and are closed under composition.

In general, (−)^⊥ and ⊥^(−) form a Galois connection on the poset of classes of morphisms in C. A pair (E,M) such that E= ⊥^M M=E^⊥ is sometimes called a prefactorization system

Prop:
- A weak factorization system (L,R) is an orthogonal factorization system precisely if L⊥R.
- For (L,R) an orthogonal factorization system in a category C, the intersection L∩R is precisely the class of isomorphisms in C.
- M contains the isomorphisms and is closed under composition and pullback (insofar as pullbacks exist in C).
- If a composite gof is in M, and f is either in M or a monomorphism, then g is in M.
- M is closed under all limits in the arrow category Arr(C).

* Relation avec la M-image:

Suppose that M is closed under composition, and that f=me is an image factorization relative to M. Then e has the property that if e=ng for some n∈M, then n is an isomorphism — for then we would have f=(mn)g and so by universality of images, m would factor through mn. In particular, if M is the class of all monomorphisms and C has equalizers, then e is an extremal epimorphism.
If C has pullbacks and M is closed under pullbacks, then we can say more: e is orthogonal to M.

Conversely, it is easy to see that if (E,M) is an OFS on a category C, then all M-images exist and are given by the factorizations of the OFS. Therefore, to give a notion of image is more or less equivalent to giving an orthogonal factorization system.

Exemple: dans une catégorie régulière (regular épi, mono) est un OFS.

* https://ncatlab.org/nlab/show/reflective+factorization+system
Cf localisation.

* https://ncatlab.org/nlab/show/M-complete+category#OFSFromAdjunction
Let C be a category and let M be a class of monomorphisms in C. (Often, M will be the right class in an orthogonal factorization system.) We say that C is M-complete if it admits all (even large) intersections of M-subobjects. This means that it admits all (even large) wide pullbacks of families of M-morphisms, and such pullbacks are again in M. (If M is the right class of an OFS, then any intersection of M-morphisms which exists is automatically in M.)

Theorem 4.1. Let M be a class of maps in a category C, and assume that
  - M consists of monomorphisms,
  - M is closed under composition,
  - all pullbacks of M-morphisms exist in C and are again in M, and
  - C is M-complete.
Then there is an orthogonal factorization system (E,M), with E= ⊥^M.

Note that if M is already part of a prefactorization system, then any composite, pullback, or intersection (or produits, produits fibrés) of M-morphisms which exists is automatically also in M, since M=E^⊥. De plus si gof ∈ M et G ∈ M alors f ∈ M.

Corollary 4.2. Let (E,M) be a prefactorization system on a category C, and assume that
  - M consists of monomorphisms,
  - All pullbacks of M-morphisms exist in C, and
  - C is M-complete.
Then (E,M) is an orthogonal factorization system.

Theorem 4.3. Let S:A⇄C:T be an adjunction, and assume that A is finitely complete and M-complete for some OFS (E,M), where M consists of monomorphisms and contains the split monics. Define E_S to be the class of maps inverted by S, and M_S=(E_S)^⊥; then (E_S,M_S) is an OFS on A.

* https://ncatlab.org/nlab/show/algebraic+weak+factorization+system
  https://ncatlab.org/nlab/show/small+object+argument

Strong-Epi, Mono factorisation system
-------------------------------------

* https://ncatlab.org/nlab/show/%28epi%2C+mono%29+factorization+system

* (Epi, Mono): https://qchu.wordpress.com/2012/11/12/epi-mono-factorizations/
   The category of epi-mono factorizations of a morphism $f$ is a preorder, 
   where the morphisms (e1,m1)->(e2,m2) are lifts, ie if a lift $g$ exists
   it is unique. Moreover, the morphisms g in the category are both
   monomorphisms and epimorphisms (=fake iso).

   Theorem: Suppose that a category C has either pushouts or pullbacks. Moreover, suppose that C has no fake isomorphisms (e.g. because all monomorphisms are regular or because all epimorphisms are regular). Then epi-mono factorizations in C are unique (up to unique isomorphism) [attention: ça ne prouve pas l'existence].

* (RegEpi, Mono)
https://math.stackexchange.com/questions/1652019/is-composition-of-regular-epimorphisms-always-regular
In a category with all kernel pairs and coequalisers of kernel pairs, the following conditions are equivalent:
  - regular epimorphisms are stable under composition;
  - regular epimorphisms coincide with strong epimorphisms;
  - for any morphism f, if m_f∘e_f is its factorisation through the coequaliser of its kernel pair, m_f is a monomorphism;
  - regular epimorphisms and monomorphisms form a factorisation system.

* (StrongEpi, Mono):
SOME REMARKS ON CONSERVATIVE FUNCTORS WITH LEFT ADJOINTS

PROPOSITION 3.1. Consider the following assertions:
( i) (SEpi, Mon) factorizations exist.
(ii) If f : A->B factorizes through no proper subobject of B, it is a strong epimorphism.
(iii) If f : A->B factorizes through no proper strong epimorphism q: A->D, it is a monomorphism.
Then (i) implies (ii) and (iii), while (ii) implies (i) if C admits arbitrary intersections of monomorphisms, and (iii) implies (i) if C admits arbitrary cointersections of strong epimorphisms.

Prop: - si C a les pullbacks et (equalisers or pushouts), alors (ii)
      - si C a les coéqus OU les pushouts+pullbacks, alors (iii)

Th: Equalisers + Pullbacks + Arbitrary intersection of monos
 OR Coeqs + Arbitrary cointersections of strong epimorphisms.
 => (StrongEpi, Mono) factorisation
 (et de plus Strong Epi => Familial Strong [dans le premier cas si on a les
 produits finis en plus]; dans le deuxième cas on a même une factorisation
 en famille: f_i: A->B_i se factorise en f_i=m_i o e avec e strong épi et
 m_i jointly mono)
[Preuve: combiner les deux résultats plus haut]

### Cas usuels

Cas simplifiés par rapport à Kelly

* Reflective subcategories, localizations and factorization systems

LEMMA 3.1. Let M a class of monomorphisms in C, closed under composition;
let C admit all pullbacks (along any map) of maps in M, and all intersections of
maps in M; and let these pullbacks and intersections again belong to M. Then
(M^perp , M) is a factorization system.

Cor: (Epi, StrMono) is a fact system if C is finitely well-complete
(=finite limits + all intersections of strong mono) OR C finitely
cocomplete et a toutes les cointersections d'épi OR C est finitely complète
et cocomplète et les strongs mono sont réguliers.

Donc (StrEpi, Mono) fact system si C est finiment cocomplète+toutes les
cointersections de strong épis OR C finiment complète et a toutes les
intersections de monos OR C est finiment complète et cocomplète et les
strongs épis sont réguliers.

[Note: les deux premiers cas sont des cas particuliers de 
SOME REMARKS ON CONSERVATIVE FUNCTORS WITH LEFT ADJOINTS; et le dernier cas
vient de https://math.stackexchange.com/questions/1652019/is-composition-of-regular-epimorphisms-always-regular]

* Avec un peu plus d'hypothèse la construction est facile:
  GENERATORS  AND  COLIMIT  CLOSURES MICHAEL A. SHULMAN
  http://home.sandiego.edu/~shulman/papers/generators.pdf

C complète et on suppose que C a les coeqs de ses kernels pairs. 
On veut construire un (StrEpi, Mono) fact system, ie on veut factoriser f
en strepi o mono. Via le coeq, on écrit f=f_1 e_1 où e_1 est régulier.
Si f_1 = mono alors on a gagné, sinon on itère de manière transfinie (on
peut si l'on suppose C cocomplète).
Si C est extremally well co-powered (=there is only a set of extremal
quotients) alors la récursion fini par un iso, ce qui veut dire que f_alpha
était un mono et on a gagné.

Donc: If A is cocomplete, finitely complete, and extremally well-copowered, then ( StrEpi , Mono) is an orthogonal factorization system. 

[Note: il me semble que les limites utilisées dans la preuve ne supposent que l'existence de coeqs de kernels pair, et de colimites filtrantes.

Cf par exemple https://math.stackexchange.com/questions/541300/epi-mono-factorization-in-presentable-categories
  => If C is cocomplete, well copowered [en fait extremally well copowered suffirait], and has pullbacks, it has a (strong epi, mono) factorisation system.
     Dually C has an (epi, strong mono) factorisation system, if it is complete, well powered, and has pushouts.
     If C is a loc. presentable category , it satisfy both conditions.
qui est un autre cas particulier de Kelly. En effet, well copowered => on a
qu'un ensemble de quotients, donc comme C cocomplet elle est épi-cocomplete.
]

Ternary factorisation system
----------------------------

* https://ncatlab.org/nlab/show/ternary+factorization+system
A ternary factorization system on C to consist of a pair (L_1,R_1) and (L_2,R_2) of ordinary orthogonal factorization systems such that L_1⊆L_2 (or equivalently R_2⊆R_1)
Proposition. Given a ternary factorization system as above, any morphism f factors as A→L_1 im_2(f)→L_2∩R_1 im_1(f)→R_2 B
in an essentially unique way, ie on a un  (L_1, L_2∩R_1, R_2) fact system.
Preuve: First factoring f into an L_1-map followed by an R_1-map, then factoring the R_1-part into an L_2-map followed by an R_2-map; and
First factoring f into an L_2-map followed by an R_2-map, then factoring the L_2-part into an L_1-map followed by an R_1-map give the same factorisation.

Conversely, just as for a binary factorization system, the extra
requirement of orthogonality can be deduced from uniqueness of the
factorizations, a unique and functorial ternary factorization implies that
it “splits” into a pair of binary factorization systems

Class R_2L_1: morphismes dont la partie L_2∩R_1 est un iso, ie qui se
factorisent comme L_1 puis R_2. 
Proposition. In a ternary factorization system, L_1=L_2∩R_2L_1 and R_2=R_1∩R_2L_1.

Exemples:
- In Top, let L_1= quotient maps, R_1= injective continuous maps, L_2= surjective continuous functions, and R_2= subspace embeddings. Here L_2∩R_1 bijective continuous maps, and the two intermediate objects in the ternary factorization of a continuous map are obtained by imposing the coarsest and the finest compatible topologies on its set-theoretic image.
- More generally, if a category has both (epi, strong mono) and (strong epi, mono) factorizations, then since strong epis are epi, we have a ternary factorization. Here L_2∩R_1 is the class of monic epics, sometimes called bimorphisms. The maps in R_2 L_1 are sometimes called strict morphisms.
- On Cat there is a 2-categorical version of a ternary factorization system, determined by the 2-categorical factorization systems (eso+full, faithful) and (eso, full and faithful). Here L_2∩R_1 is the class of eso+faithful functors, while R_2L_1 is the class of full functors. This factorization system plays an important role in the study of stuff, structure, property.
- On Topos there is also a 2-categorical ternary factorization system composed of the binary 2-categorical factorization systems (hyperconnected, localic) and (surjection = surjective geom morphism, inclusion = geometric embedding).

Relations entre Im et CoIm
--------------------------

Cf aussi ternary factorisation system.

* https://ncatlab.org/nlab/show/image
Ici Im(f) c'est la M-image pour M=mono
On suppose que le kernel pair et cokernel pair existent, ainsi que leur
coeq:=CoImReg resp eq:=ImReg. On suppose aussi que l'image et la coimage
existent.

A ->> CoImReg(f) ->> Im(f) -?> CoIm(f) --> ImReg(f) --> B
et f est strict := CoImReg(f) -> ImReg(f) est un iso

- A -> Im f --> B, avec A -> Im f extrémal, donc un épi extrémal si C a les éqs.
- A ->> CoIm f -> B, avec CoIm f -> B extrémal, donc un mono extrémal si C a les coéqs.
- Donc éqs+coéqs: A ->> Im f -->> CoIm f --> B
  où A->>Im f et CoIm f --> B extrémal
- Si f s'écrit A -g> X -->B, alors CoImReg f=CoImReg g
  Donc on a: 
  A ->> CoImReg(f) ->> Im(f) -->> CoIm(f) --> ImReg(f) --> B
    reg          extrémal  mono+épi    extrémal       régulier
- si C est régulière (ou juste 1652019), CoImReg f --> B, donc CoImReg=Im
  donc si C est régulière+corégulière
  A ->> CoImReg(f)=Im(f) -->> CoIm(f)=ImReg(f) --> B

=> Factorisation system: CoImReg pour RegEpi/Mono; ImReg pour Epi/RegMono

* Morphisme strict: https://ncatlab.org/nlab/show/strict+morphism
A strict morphism is a morphism for which the notion of regular image and regular coimage coincide, ie reg-coim f -> reg-im f est un iso.
Ex: dans un topos ou une catégorie abélienne, tout morphisme est strict.
Exemple: si f:c->d est un épi, d est sa propre image régulière, définie comme la
limite RegIm f≃lim(d ⇉ d ⊔_c d), donc il est strict si il est régulier, ie
si c'est une coimage.

[Composition of a kernel with a cokernel has a normal image
http://math.stackexchange.com/questions/271707/composition-of-a-kernel-with-a-cokernel-has-a-normal-image]

Résumé
------

Th: Equalisers + Pullbacks + Arbitrary intersection of monos
 OR Coeqs + Arbitrary cointersections of strong epimorphisms.
 => (StrongEpi, Mono) factorisation

In a category with all kernel pairs and coequalisers of kernel pairs, the following conditions are equivalent:
  - regular epimorphisms are stable under composition;
  - regular epimorphisms coincide with strong epimorphisms;
  - for any morphism f, if m_f∘e_f is its factorisation through the coequaliser of its kernel pair, m_f is a monomorphism;
  - regular epimorphisms and monomorphisms form a factorisation system.

Si on a les éqs+coéqs, et que les *Im* existent:
A ->> CoImReg(f) ->> Im(f) -->> CoIm(f) --> ImReg(f) --> B
  reg          extrémal  mono+épi    extrémal       régulier

Types de catégories
===================

Taille
------

* https://ncatlab.org/nlab/show/locally+small+category
each of its hom-sets is a small set,

* https://ncatlab.org/nlab/show/well-powered+category
every object has a small poset of subobjects.
- A well-powered category with binary products is always locally small, since morphisms f:A→B can be identified with particular subobjects of A×B (their graphs).
- Conversely, any locally small category with a subobject classifier must obviously be well-powered. In particular, a topos is locally small if and only if it is well-powered

https://math.stackexchange.com/questions/253927/a-category-with-a-strong-generator-is-well-powered
Johnstone [Sketches of an elephant, Remark A1.4.17]:
locally small category with finite intersections of subobjects and a (strong) generating set is well-powered.

Note: well-powered => regularly co-well-powered (en effet un épi régulier
est donné comme un noyau de Ax_BA qui est un sous-objet de AxA).

* https://ncatlab.org/nlab/show/skeleton
A category is skeletal if objects that are isomorphic are necessarily
equal.
A skeleton of a category C is defined to be a skeletal subcategory of C whose inclusion functor exhibits it as equivalent to C.
Skeletally small => the skeletal subcategory is small

Total category
--------------

* https://ncatlab.org/nlab/show/total+category
A locally small category C is total if its Yoneda embedding Y:C⟶[C^op,Set] has a left adjoint L (=> it is complete).
If the opposite category C^{op} is total, C is called cototal.
=> Since the Yoneda embedding is a full and faithful functor, a total category C induces an idempotent monad Y∘L on its category of presheaves. Autrement dit C totale si elle est réfléxive dans PSh(C).

Propriétés:
- C est complète et cocomplète (et admet même certaines limites large, cf
  "G. M. KELLY A survey of totality for enriched and ordinary categories").
- any colimit-preserving functor from a total category to a locally small category has a right adjoint.
Pr: c'est une sous-catégorie reflective de PSh, qui est complète et cocomplète.

Proposition 4.1. Any cocomplete and epi-cocomplete category with a (small set) generator is total. More generally, any cocomplete and E-complete category with an E-generator is total, for a suitable class E.
-> locally presentable categories, hence in particular Grothendieck toposes [they are also cototal], or the category of abelian sheaves on a small site.

Cor (cf Kelly): C est réflexive dans une catégorie de préfaisceaux [B^op,
Set] avec B small [=> C totale] ssi C est cocomplète et a une catégorie
small dense; c'est le cas si C est loc. présentable.
Pr: <= Comme C est cocomplète, le foncteur yoneda_restriction à un adjoint à
gauche.

Th: totality lifts along solid functors; that is, if the codomain of a solid functor is total, then so is its domain
- any reflective subcategory of a total category
- any category which is monadic over Set
- any category admitting a topological functor to Set
=>
- The category Grp of groups as a category monadic over Set is total
- The category of topological groups is total as well since it is topological over the total category Grp.
- If C is total and J is small, then C^J is total, morally because it is a reflective subcategory of Set^{C^op×J}

- Any presheaf category of a small category is cototal (as well as total). Indeed, any Grothendieck topos is both cototal and total.
=> En particulier, une catégorie réflexive dans une catégorie de préfaisceau est totale.

* https://ncatlab.org/nlab/show/lex+total+category
A lex total category ℰ is a Grothendieck topos iff ℰ has a small set of generators.

Theorem 2.3. (Street) A category E is a Grothendieck topos iff it is lex total and the size of the set of isomorphism classes of objects is κ or less.
https://ncatlab.org/nlab/show/Grothendieck+topos

Closed category
---------------

https://ncatlab.org/nlab/show/closed+category
A un internal hom (qui satisfait des conditions de compatibilités, c'est
plus compliqué que de le définir comme dual du produit comme pour les
cartesian closed categories)

https://ncatlab.org/nlab/show/closed+monoidal+category
A closed monoidal category C is a monoidal category that is also a closed category, in a compatible way:
it has for each object X a functor (−)⊗X:C→C(-) of forming the tensor product with X, as well as a functor [X,−]:C→C of forming the internal-hom with X, and these form a pair of adjoint functors.
Hom(a⊗b,c)≃Hom(a,[b,c]),

Cartesian category
------------------

http://ncatlab.org/nlab/show/finitely+complete+category
A category is finitely complete (cartesian dans Elephant) if and only if:
- It admits all finite limits
- It has a terminal object and admits all binary products and equalizers; or
- It has a terminal object and admits all binary pullbacks.

Cartesian closed category
-------------------------

Cartesian closed: admet les limites (finies), et a les exponentielles (définies
comme le dual du produit: Hom(XxY,Z)=Hom(X,Hom(Y,Z))
On a Z^(XxY)=Z^X x Z^Y car Z^ étant un adjoint il commute aux limites.
Z^(Y^X)=(Z^Y)^X via l'adjonction.

https://ncatlab.org/nlab/show/locally+cartesian+closed+category
C/x est cartesian closed pour tout objet x dans C.

https://ncatlab.org/nlab/show/cartesian+closed+functor
preserves both products and exponential objects/internal homs
Proposition 3.1. For 𝒞 a locally cartesian closed category and f:X_1→X_2 a morphism, the base change/pullback functor between the slice categories f *:𝒞 /X_2→𝒞 /X_1 is cartesian closed.

Proposition 2.1. (Frobenius reciprocity)
Let R:𝒞→𝒟 be a functor between cartesian closed categories with a left adjoint LL. Then R is cartesian closed precisely if the natural transformation
(Lπ_1,ϵ_ALπ_2):L(B×R(A))→L(B)×A is an isomorphism.

Locally regular category
-------------------------

* https://ncatlab.org/nlab/show/locally+regular+category
A locally regular category is a relative of a regular category in which the condition of finite limits is weakened to finite connected limits. It is so named because every slice category of a locally regular category is a regular category

A category C is locally regular if
  - It has finite connected limits — equivalently, it has pullbacks and equalizers;
  - It has (extremal epi, mono) factorizations which are stable under pullback; and
  - Every span factors as an extremal epi followed by a jointly-monic span.

A locally regular category is regular if and only if it has a terminal object.

The factorization axiom for spans implies, by induction, a similar factorization property for nonempty finite cosinks. However, similar factorizations for empty cosinks (i.e. “supports”) do not necessarily exist.

Regular category
----------------

* http://en.wikipedia.org/wiki/Regular_category
http://ncatlab.org/nlab/show/regular+category

C'est une catégorie qui admet les pullbacks (=> all finite limits si on a
un objet final, mais c'est les pullbacks qui nous intéressent) et telle
que
- tout kernel pair A x_B A => B admet un conoyau
  [déjà dans une catégorie satisfaisant ces deux propriétés, un
  coéqualisateur D=>A->B est le coéqualisateur de son kernel pair
  A x_B A => B]
- le pullback d'un épi régulier est régulier
  (=> tous les épi réguliers sont de descente)

Autre définition: A regular category is a finitely complete category with pullback-stable image factorizations. 
[ cf Image plus bas ou
https://mathoverflow.net/questions/252815/is-a-category-regular-iff-extremal-epis-and-monomorphisms-are-a-strong-factoriza
  Result of Joyal that a category is regular if and only if it is finitely complete and if the classes (strong epi, mono) form a stable (orthogonal) factorisation system]

Prop: [In a regular category]
- regular epimorphisms are preserved by pullback.
- si dans un pullback
  A -> B   les flêches C->D et B->D sont des épis réguliers (et donc 
  |    |   par la prop précédente toutes les flêches sont des épis réguliers)
  C -> D   alors le diagramme est aussi un pushforward
  (cf https://ncatlab.org/nlab/show/regular+epimorphism)
- Image factorization: In a regular category, every morphism f:x→Yf : x\to Y can be factored – uniquely up to isomorphism – through its image im(f) as
f:x→_e im(f)→_i y, where e is a regular epimorphism and i a monomorphism.

* Dans une catégorie régulière, épi régulier = épi de descente = épi extrémal.
Quand est-ce que épi régulier => épi de descente effectif?
https://arxiv.org/abs/1101.4921
  Effective descent morphisms of regular epimorphisms
  Tomas Everaert
    Let A be a regular category with pushouts of regular epimorphisms by
    regular epimorphism and Reg(A) the category of regular epimorphisms in
    A. We prove that every regular epimorphism in Reg(A) is an effective
    descent morphism if, and only if, Reg(A) is a regular category. Then,
    moreover, every regular epimorphism in A is an effective descent
    morphism. This is the case, for instance, when A is either exact
    Goursat, or ideal determined, or is a category of topological Mal'tsev
    algebras, or is the category of n-fold regular epimorphisms in any of
    the three previous cases, for any n≥1
=> dans une catégorie exacte, un morphisme régulier est de descente
effective.

* Références:
https://sites.uclouvain.be/ctat2014/RegularCategories.pdf
Notes on regular, exact and additive categories
Marino Gran

https://www.researchgate.net/publication/265423323_Regular_protomodular_and_abelian_categories
Regular, protomodular, and abelian categories
Marino Gran
[chapitre 4 du livre: Categorical Foundations Special Topics in Order, Topology, Algebra, and Sheaf Theory
https://www.cambridge.org/core/books/categorical-foundations/1621D6D7227266EF55ABCCF96D934557]

Additive = Protomodular + pointed + every mono is normal.
Abelian = Exact + Additive

Plus exactement:
Th 5.10: C finitely complete, then additive <=> pointed, protomodular, every mono normal.

$ 6. The Short Five Lemma and the Tierney equation
6.1. Definition. [9] [12] A category C is abelian if
(1) C has a zero object
(2) C has binary products and binary coproducts
(3) every arrow has a kernel and a cokernel
(4) every monomorphism is a kernel, every epimorphism is a cokernel
Note: ça implique automatiquement que C est additive!

$ 2. Epimorphisms and regular categories
Theorem 2.17 Barr-Kock theorem
si on a f:  X -> Y un diagramme commutatif (*)
        f': X'-> Y'
tel que R[f]->R[f'] est fibrant (ie on a un pullback), et f un strong épi
stable sous pullback, alors (*) est un pullback. De plus dans ce cas si
X->X' est un mono, Y->Y' aussi.
(on note R[f] le kernel pair de f)

Corollaire 2.18: si f=i o q avec q strong épi stable par pullback, i est un mono
ssi R[f]=~R[q].

Déf 2.20: C régulière si strong épis are stable under pullback and C has
coequaliser of effective equivalence relations (ie of kernel pairs).

$ 3. Normal monomorphisms and protomodular categories
=> on a une notion de noyau.

$ 4. Regular protomodular categories

If C is regular, then the pullback cancellation property defining a protomodular
category can be extended from split épis to regular épis.

=> on a une notion de suite exacte

Exact category
--------------

https://ncatlab.org/nlab/show/exact+category
An exact category (in the sense of Barr) is a regular category in which every congruence is a kernel pair (that is, every internal equivalence relation is effective). Exact categories are also called effective regular categories.
Exemples:
- Any topos is an exact category.
- Any category which is monadic over a power of Set is exact.
- Any abelian category is exact. In fact an abelian category is precisely an exact additive category.

Extensive category
------------------

* https://ncatlab.org/nlab/show/extensive+category
  A finitely extensive category (or finitary extensive category) is a category E with finite coproducts such that one, and hence all, of the following equivalent conditions holds:
  - Pullbacks of finite-coproduct injections along arbitrary morphisms exist and finite coproducts are disjoint and stable under pullback.
  -  For any objects a,b the coproduct functor E/a×E/b→E/(a+b) is an equivalence of categories.
  - In any commutative diagram
    x → z ← y 
    ↓   ↓   ↓ 
    a →a+b← b
    the two squares are pullbacks if and only if the top row is a coproduct diagram.
  - Finite coproducts are van Kampen colimits. By definition, this is to say one of the previous two conditions (depending on the definition chosen).

$ Remarks:
- the alternative definitions of finitary disjunctive refer only to binary coproducts, but they obviously imply analogous statements for n-ary coproducts for all finite n≥1. Less obviously, they also imply the analogous statement for 0-ary coproducts (that is, initial objects). In this case, the statement is that the initial object 0 is strict (any map a→0 is an isomorphism).
- Furthermore, if binary coproducts are disjoint, then (at least assuming classical logic) any infinitary coproducts that exist are also disjoint, since
⨆_a∈A X_a≅X_a_0⊔ ⨆_a≠a_0 X_a≅X_a_0⊔X_a_1⊔ ⨆_a≠a_0,a_1 X_a for any a_0,a_1∈A. Therefore, if a finitary-extensive category has infinitary pullback-stable coproducts, it is necessarily infinitary-extensive. In particular, a cocomplete locally cartesian closed category is finitary extensive if and only if it is infinitary extensive.
- As a further special case of the preceding, since an elementary topos is finitary extensive, any cocomplete elementary topos is infinitary extensive. However, in this case, one of the arguments for finitary extensivity applies directly to the infinitary case and does not require classical logic; see toposes are extensive.

$ Examples
  - An elementary topos is finitary lextensive; a Grothendieck topos (or, more generally, any cocomplete elementary topos) is infinitary lextensive.
  - A quasitopos with disjoint coproducts, or more generally a locally cartesian closed category with disjoint coproducts, is extensive.

$ Pre-extensive:
- it has a strict initial object 0 (equivalently, its subobject preorders have pullback-stable bottom elements), and
- whenever A↣X and B↣X are disjoint subobjects (i.e. A∩B=0A\cap B=0), they have a pullback-stable union (which is then automatically a disjoint and stable coproduct).

Regular/exact categories have quotients of (some) congruences. Exact categories have quotients of all congruences, while regular ones have quotients only of congruences that are kernel pairs. Another way to say that is that in a regular category, you can conclude that the quotient of some congruence exists if you can exhibit another object of which the quotient would be a subobject if it existed. Similarly, pre-/lextensive categories have disjoint unions. Lextensive categories have all disjoint unions (= coproducts), while in a pre-lextensive category you can conclude that a pair of objects X,Y have a disjoint union if you can exhibit another object in which X and Y can be embedded disjointly. Finally, coherent categories/pretoposes have both quotients and disjoint unions, or equivalently quotients and not-necessarily-disjoint unions, with the same sort of relationship between the two.

Coherent category
-----------------
Regular + pre-lextensive [Hum: pre-lextensive donne juste l'union de deux
sous-objets distincts, est-ce qu'on peut utiliser la régularité pour avoir
l'union quelconque?]
A coherent category (also called a pre-logos) is a regular category in which the subobject posets Sub(X) all have finite unions which are preserved by the base change functors

An infinitary coherent category is a regular category in which the subobject posets Sub(X) have all small unions which are stable under pullback. Infinitary coherent categories are also called geometric categories.

Elephant: si C régulière + a coproduit, alors C a les unions (finies) de sous-objets; en effet C/A a les coproduits (crée par C), donc Sub(A) qui est réflective
aussi.

Soit C une catégorie cohérente, 1 l'objet terminal, et 0 l'objet initial de Sub(1). Alors 0 est un objet initial strict. (A_1) \cap (A_2 \cup A_3)=(A_1 \cap A_2) \cup (A_1 \cap A_3). 
A_1 \cap A_2 -> A_1          est un pullback et un pushout dans C.
 |
 v
A_2          -> A_1 \cup A_2

k-ary exact category
--------------------

* https://ncatlab.org/nlab/show/%CE%BA-ary+exact+category
TODO: ary-exact category

The notions of regular category, exact category, coherent category, extensive category, pretopos, and Grothendieck topos can be nicely unified in a theory of “familial regularity and exactness.”

Let C be a finitely complete category. By a sink in C we mean a family {f_i:A_i→B} of morphisms with common target. A sink is extremal epic if it doesn’t factor through any proper subobject of B. The pullback of a sink along a morphism B′→B is defined in the evident way.

By a (many-object) relation in C we will mean a family of objects {A_i} together with, for every i,j∈I, a monic span A_i←R_ij→A_j (that is, a subobject R_ij of A_i×A_j. We say such a relation is:
  - reflexive if R_ii contains the diagonal A_i→A_i×A_i
  - transitive if the pullback R_ij× A_j R_jk factors through R_ik
  - symmetric if R_ij contains, hence is equal to, the transpose of R_ji
  - a congruence if it is reflexive, transitive, and symmetric; this is an internal notion of (many-object) equivalence relation.

A quotient for a relation is a colimit for the diagram consisting of all the A_i and all the spans A_i←R_ij→A_j. And the kernel of a sink {f_i:A i→B} is the relation on A_i with R_ij=A_i×_BA_j. It is evidently a congruence.
Finally, a sink is called effective-epic if it is the quotient of its kernel. It is called universally effective-epic if any pullback of it is effective-epic.

Theorem 3.1. For a category C, the following are equivalent:
  - C has finite limits, every κ-ary sink in C factors as an extremal epic sink followed by a monomorphism, and the pullback of any extremal epic κ-ary sink is extremal epic.
  - C has finite limits, and the kernel of any κ-ary sink in C is also the kernel of some universally effective-epic sink.
  - C is a regular category and has pullback-stable joins of κ-small families of subobjects.

Theorem 3.2. For a category C, the following are equivalent:
  - C has finite limits, and every κ-ary congruence is the kernel of some universally effective-epic sink.
  - C is κ-ary regular, and every κ-ary congruence is the kernel of some sink.
  - C is both exact and κ-ary extensive.

Examples
- C is regular iff it is unary regular.
- C is coherent iff it is finitary regular.
- C is infinitary-coherent iff it is well-powered and infinitary regular.
- C is exact iff it is unary exact.
- C is a pretopos iff it is finitary exact.
- C is an infinitary pretopos iff it is well-powered and infinitary exact.

Prop:
  In a κ-ary regular category,
    Every extremal-epic κ-ary sink is the quotient of its kernel.
    Any κ-ary congruence that is a kernel has a quotient.
  Thus, in a κ-ary exact category,
    Every κ-ary congruence has a quotient.
  In a κ-ary regular category, the class of all κ-small and effective-epic families generates a topology, called its κ-canonical topology. This topology makes it a ∞-ary site.

* Référence:
  http://www.tac.mta.ca/tac/volumes/27/7/27-07.pdf
  EXACT COMPLETIONS AND SMALL SHEAVES MICHAEL SHULMAN

Complétion
----------

* https://ncatlab.org/nlab/show/Karoubi+envelope
The Karoubi envelope or idempotent completion of a category is the universal enlargement of the category with the property that every idempotent is a split idempotent. This is the Set-enriched version of the more general notion of Cauchy completion of an enriched category.

Theorem 4.1. The subcategory i:Open↪Manifolds exhibits Manifolds as an idempotent-splitting completion of Open.

* https://ncatlab.org/nlab/show/Cauchy+complete+category
For C a small category there is an equivalence of categories
C¯≃Topos_ess(Set,[C,Set])^op
of its Cauchy completion, def. 2.1, with the category of essential points of [C,Set].

* https://ncatlab.org/nlab/show/Freyd-Mitchell+embedding+theorem
The Freyd–Mitchell embedding theorem says that every abelian category is a full subcategory of a category of modules over some ring R and that the embedding is an exact functor.

Theorem 2.3. Let C be an abelian category. If C has all small coproducts and has a compact projective generator, then C≃RMod for some ring R.
In fact, in this situation we can take R=C(x,x)^{op} where x is any compact
projective generator. Conversely, if C≃RMod, then C has all small
coproducts and x=R is a compact projective generator.

Watts’ Theorem 2.4. If B is an an S-R-bimodule, the tensor product functor
B⊗_R−:RMod→SMod is right exact and preserves small coproducts. Conversely, if F:Mod_R→Mod_S is right exact and that preserves small coproducts, it is naturally isomorphic to B⊗_R− where B is the S-R-bimodule FR.

* https://ncatlab.org/nlab/show/Barr+embedding+theorem
If a category is small and regular, then there exists an embedding, which is a full, faithful and regular, into a category of presheaves over some small category.

* Généralisation: cf http://www.math.mcgill.ca/barr/papers/embed.pdf

Verdier: X est une catégorie, on a un full embedding R:X->E dans un topos E où E=Sh(X, topologie canonique). R préserve les épis réguliers universels (ie f: A->B est un épi régulier, et le pullback de f existe toujours et reste stable par pullbacks); si X a les pullbacks R les réflète aussi.

For general X, it might happen that Rf is an epimorphism when, for lack of
enough pullbacks, is not a universal regular epimorphism. For example it
might be a split epimorphism — a property preserved by every functor. 

Déf: on dit que f est un R-universal regular épi si Rf est universal regular 
[ie si Rf est un épi car dans un topos, universal regular épi=régular épi=épi.]
(Donc si X est régulière, R-universal regular épi = universal régular épi=regular épi=extrémal épi.)
Déf: f est dit 'R-exact' si il préserve les limites finies et les
morphismes R-universal regular. Il est dit 'R-reflexively-exact' si de plus
il reflète les limites finies et les R-épi réguliers universels.

Ainsi R:X->E est fully faithfull et 'R-reflexively-exact'.
On applique l'embedding de Barr à E, et on obtient qu'il existe une small
category X' et un embedding fully faithfull et 'R-reflexively-exact' vers [X'^op, Set] (Th A).

Corollaires:
Th B. Let X be a small category. Then there is a (discrete) set I and a functor U:X->Set^I which is faithful and R-reflexively exact.
Theorem C. Let X be a small category. Then there is a family {U_i} of exact set-valued functors on X which collectively are faithful and reflect finite limits and R-universal regular epimorphisms.

Application: on peut faire du diagramme chasing en se ramenant à Set pour montrer: si on a un diagramme commutatif f: X_1->X_2
                                   g: Y_1->Y_2
où f est un morphisme R-universel régulier épi tel que le kernel pair de f
soit un pullback du kernel pair de g:
XX => X_1 -> X_2
YY => Y_1 -> Y_2
alors f est un pullback de g.

* Embedding of topos
https://ncatlab.org/spahn/files/aspects_of_topoi.pdf
Aspects of topoi, Peter Freyd
After a review of the work of Lawvere and Tierney, it is shown that every topos may be exactly embedded in a product of topoi each with 1 as a generator, and near-exactly embedded in a power of the category of set.

* https://ncatlab.org/nlab/show/regular+and+exact+completions

The forgetful 2-functors
- from regular categories to lex categories (lex=finitely complete),
- from exact categories to lex categories, and
- from exact categories to regular categories
have left adjoints, and in fact are (2-)monadic. Their left adjoints are called (free) regular or exact completions.
In the third case the 2-monad is idempotent, so the left adjoint can properly be called a completion, while in the first two cases, the 2-monad is only lax-idempotent, so the left adjoint should technically be called a free completion.

C_ex/lex is the full subcategory of its presheaf category spanned by those presheaves F such that
  - FF admits a regular epimorphism y(X)↠F
  - with the additional property that if K⇉y(X) is the kernel pair of y(X)↠F, then K also admits a regular epi y(Z)↠K.

The reg/lex completion C_reg/lex of a lex category C is perhaps most succinctly described as the subcategory of C_ex consisting of those objects which admit monomorphisms into objects of C, ie:
- F admits a regular epimorphism y(X)↠F
- F admits a monomorphism F↣y(Z)

If C is regular, a quick definition of C_ex/reg is as the full subcategory of the category Sh(C) of sheaves for the regular coverage on C spanned by those sheaves which are quotients of congruences in C

Handbook of category: on a même une complétion exacte
C catégorie régulière -> Préfaisceaux(S)
ie qui envoit un coéqualisateur sur un coéqualisateur.
Dans le livre il construit juste C -> Sheave(C) pour la topologie canonique
(des épimorphismes effectifs)

* Généralisation: http://www.tac.mta.ca/tac/volumes/27/7/27-07.pdf
EXACT COMPLETIONS AND SMALL SHEAVES MICHAEL SHULMAN
We prove a general theorem which includes most notions of “exact
completion” as special cases.  The theorem is that “κ-ary exact
categories” are a reflective sub-2-category of “κ-ary sites”, for any
regular cardinal κ.  A κ-ary exact category is an exact category with
disjoint and universal κ-small coproducts, and a κ-ary site is a site
whose covering sieves are generated by κ -small families and which
satisfies a solution-set condition for finite limits relative to κ.

In the unary case, this includes the exact completions of a regular
category, of a category with (weak) finite limits, and of a category with a
factorization system.  When κ = ω, it includes the pretopos completion of
a coherent category.  And when κ = K is the size of  the  universe,  it
includes  the  category  of  sheaves  on  a  small  site,  and  the
category of small presheaves on a locally small and finitely complete
category.  The K-ary exact completion of a large nontrivial site gives a
well-behaved “category of small sheaves”.

Pretopos
--------

* https://ncatlab.org/nlab/show/pretopos
A pretopos is a category which is both exact and extensive.
A Π-pretopos is a pretopos which is also a locally cartesian closed category.
(loc. cartesian closed: C/a est cartesian closed pour tout objet a de C)
A topos is a pretopos that has power objects. A topos is automatically a Π-pretopos; conversely, a Π-pretopos is a topos iff it has a subobject classifier

A pretopos is necessarily balanced, but while it has coproducts and coequalizers of equivalence relations, it need not have all finite colimits.
However, if it has countable pullback-stable unions of subobjects, then any internal binary relation generates an equivalence relation and therefore has a quotient, so we can construct arbitrary coequalizers and thus arbitrary finite colimits.

An infinitary pretopos is an infinitary coherent category which is both infinitary extensive and exact. Giraud's theorem says that infinitary pretoposes with small generating sets are the same as Grothendieck toposes, and in particular are toposes (although this last result is not valid in predicative mathematics).

Elephant, Lemme 1.4.8: dans un prétopos, si A-->B, et A-->C, on a un
pushout A-->B,C --> D. (Et A est le pushout square est aussi un pullback
square). Corollaire 1.4.9: tous les monos/épis sont réguliers.

* https://ncatlab.org/nlab/show/quasitopos
Definition. A quasitopos is a finitely complete, finitely cocomplete, locally cartesian closed category E in which there exists an object Ω that classifies strong monomorphisms.
Déf: Let C be a category with two Grothendieck topologies J and K such that J⊆K. The full subcategory BiSep(C,J,K)↪PSh(C) of the category of presheaves over C consisting of the sheaves for J that are also separated for K is a quasitopos.
Corollary. A quasitopos that is also a balanced category is a topos.

Monoïdes
========

## Catégorie monoïdale

* https://ncatlab.org/nlab/show/coherence+theorem+for+monoidal+categories
The coherence theorem for monoidal categories, like many coherence theorems, has several forms (or, alternatively, refers to several different theorems):
  - Every “formal” diagram in a monoidal category made up of associators and unitors commutes.
  - Every diagram in a free monoidal category made up of associators and unitors commutes.
  - The free monoidal category on some given data is equivalent to the free strict monoidal category on the same data.
  - Every monoidal category is monoidally equivalent to a strict monoidal category.
  - Every monoidal category is equivalent to an unbiased monoidal category?.
  - The forgetful 2-functor StrMonCat→MonCatStrMonCat \to MonCat has a strict left adjoint and the components of the unit are equivalences in MonCatMonCat.

* https://ncatlab.org/nlab/show/coherence+theorem+for+symmetric+monoidal+categories
The coherence theorem for symmetric monoidal categories, like many coherence theorems, has several forms (or, alternatively, refers to several different theorems):
  - Every diagram in a free symmetric monoidal category made up of associators and unitors and symmetries (braidings), and in which both sides have the same underlying permutation, commutes.
  - The free symmetric monoidal category on some given data is equivalent to the free symmetric strict monoidal category on the same data.
  - Every symmetric monoidal category is symmetric-monoidally equivalent to a symmetric strict monoidal category.
  - Every symmetric monoidal category is equivalent to an unbiased symmetric monoidal category?.
  - The forgetful 2-functor SymStrMonCat→SymMonCatSymStrMonCat \to SymMonCat has a strict left adjoint and the components of the unit are equivalences in SymMonCatSymMonCat.

Note that in a symmetric strict monoidal category, the associators and unitors are identities, but the symmetry is not in general.

Voir aussi: https://ncatlab.org/toddtrimble/published/Closed+structure+on+modules+over+a+commutative+monoid
Theorem (Kelly-Mac Lane). Let F=F[a,b,c,…] be the free symmetric monoidal closed category generated by a countably infinite set of letters. Let f,g:X→Y be morphisms in F between unit-free words where each letter occurring in var(X)+var(Y) occurs exactly twice. Then f=g.

For example, by this theorem there is exactly one morphism in F of shape
[b,a]⊗b→a
(namely the internal evaluation map). In this example, the morphism is natural in the variable a and extranatural in the variable b; in general, the two occurrences of each letter appearing in the domain/codomain of such “every-variable-twice” morphisms are connected via naturality or extranaturality, so the theorem roughly says that any two smc-definable transformations having the same (extra)natural form must be equal – a kind of coherence theorem.

* https://ncatlab.org/nlab/show/cartesian+monoidal+category
= monoidal structure is given by the category-theoretic product 

Cartesian monoidal categories have a number of special and important properties, such as the existence of diagonal maps Δ_x:x→x⊗x and augmentations e_x:x→I for any object x. In applications to computer science we can think of Δ as ‘duplicating data’ and e as ‘deleting’ data. These maps make any object into a comonoid. In fact, any object in a cartesian monoidal category becomes a comonoid in a unique way.

Moreover, one can show (e.g. Heunen-Vicary 12, p. 84) that any symmetric monoidal category equipped with suitably well-behaved diagonals and augmentations must in fact be cartesian monoidal.

* https://ncatlab.org/nlab/show/semicartesian+monoidal+category
A monoidal category is semicartesian if the unit for the tensor product is a terminal object, a weakening of the concept of cartesian monoidal category.

The internal logic of a (symmetric) semicartesian monoidal category is affine logic, which is like linear logic but permits the weakening rule (and also the exchange rule, if the monoidal structure is symmetric).

In a semicartesian monoidal category, any tensor product of objects x⊗yx \otimes y comes equipped with morphisms
p_x:x⊗y→x, p_y:x⊗y→y
We can thus ask whether p_x and p_y make x⊗y into the product of x and y. If so, it is a theorem that CC is a cartesian monoidal category. (This theorem has been observed by Eilenberg and Kelly (1966, p.551)

## Monoïdes
* https://ncatlab.org/nlab/show/monoid
Catégorie monoïdale = objet en monoïde dans Cat.

- A monoid in which every element has an inverse is a group. For that reason monoids are often known (especially outside category theory) as semi-groups. (But this term is often extended to monoids without identities, that is to sets equipped with any associative operation.)
- A monoid object in Ab (with the usual tensor product of ℤ-modules as the tensor product) is a ring. A monoid object in the category of vector spaces over a field kk (with the usual tensor product of vector spaces) is an algebra over kk.
  (si on prend un monoïde dans Ab pour le produit cartésien, on a un groupe
  commutatif)
- For a commutative ring RR, a monoid object in the category of RR-modules (with its usual tensor product) is an RR-algebra.
- A monoid object in Top (with cartesian product as the tensor product) is a topological monoid.
- A monoid object in Ho(Top) is an H-monoid.
- A monoid object in the category of monoids (with cartesian product as the tensor product) is a commutative monoid. This is a version of the Eckmann-Hilton argument.
- A monoid object in the category of complete join-semilattices (with its tensor product that represents maps preserving joins in each variable separately) is a unital quantale.
- Given any monoidal category C, a monoid in the monoidal category C^{op} is called a comonoid in C.
- In a cocartesian monoidal category, every object is a monoid object in a unique way.
- For any category C, the endofunctor category C^C has a monoidal structure induced by composition of endofunctors, and a monoid object in C^C is a monad on C.

* https://ncatlab.org/nlab/show/Eckmann-Hilton+argument
The Eckmann–Hilton argument shows that a monoid or group object in the category of monoids or groups is commutative. In other terms, if a set is equipped with two monoid structures, such that one is a homomorphism for the other, then the two structures coincide and the resulting monoid is commutative.

En particulier: Let C be a 2-category and x∈C an object. Write Id_x for the identity morphism of X and End(Id_x) for the set of endo-2-morphisms on X. Then:
  - horizontal composition and vertical composition define the same monoid object structure on End(Id_x)
  -  this is an abelian monoid.

A more general version is this: If a set is equipped with two binary operations with identity elements, as long as they commute with each other in the sense that one is (with respect to the other) a homomorphism of sets with binary operations, then everything else follows:
- the other is also a homomorphism with respect to the first;
- each also preserves the other's identity;
- the identities are the same;
- the operations are the same;
- the operation is commutative;
- the operation is associative.
This can also be internalised in any monoidal category.

* Bimonoids
- https://ncatlab.org/nlab/show/bimonoid

If B is a bimonoid in 𝒞, then the category Mod Mod_B of B-modules inherits a monoidal structure such that the forgetful functor Mod_B→𝒞 (the “fiber functor”) is a strong monoidal functor. For B-modules M and N, we equip the tensor product M⊗N in 𝒞 with the B-action
B⊗(M⊗N) →Δ (B⊗B)⊗(M⊗N) →≅( B⊗M)⊗(B⊗N)→M⊗N

- https://ncatlab.org/nlab/show/Hopf+monoid
=bimonoid where the comonoid structure is a cogroup.

For any bimonoid H in 𝒞, the category Mod_H of H-modules inherits a monoidal structure such that the forgetful functor (“fiber functor”) Mod_H→𝒞 is strong monoidal; see bimonoid. If H is moreover a Hopf monoid and 𝒞 is a closed monoidal category, then Mod_H is also closed, and the forgetful functor is strong closed (preserves internal homs).

This is a special case of Tannaka duality for monoids/algebras, see at structure on algebras and their module categories - table.
https://ncatlab.org/nlab/show/structure+on+algebras+and+their+module+categories+-+table

- https://ncatlab.org/nlab/show/Frobenius+algebra
A Frobenius algebra is a vector space that is both an algebra and a coalgebra in a compatible way. This sort of compatibility is different (and more “topological”) from that involved in a bialgebra/Hopf algebra

## Module

* https://ncatlab.org/nlab/show/module
module over a monad is called an Algebra over a monad

En fait si C est une catégorie monoidale, on peut définir une action de C
sur B comme un foncteur C*B->B respectant de bonnes propriétés; et si m est un
monoide dans C on peut considérer un module m dans B.

Si T est une monade, alors End(C) agit naturellement sur C; et un module
pour T dans C correspond exactement à une algèbre (de Cartan Eilenberg) pour la monade.

* https://ncatlab.org/nlab/show/module+over+an+enriched+category
The action on a module over a monoid A in a closed monoidal category V may be equivalently encoded in terms of a V-enriched functor
ρ:BA^op→V
from the delooping one-object V-enriched category BA, corresponding to A, to V itself.
More generally it makes sense to replace BA by any V-enriched category C – regarded as the horizontal categorification of a monoid, a “monoid-oid” – and think of a V-enriched presheaf ρ:C→V as a module over the category C.

* https://ncatlab.org/nlab/show/Tannaka+duality
More precisely, let V be any enriching category (a locally small closed symmetric monoidal category with all limits). Then for
    - A a monoid in V;
    - A-Mod the V-enriched category of all A-modules in V;
    - F:A-Mod→V the forgetful fiber functor ;
    A can be reconstructed as the object of enriched endomorphisms of F, given by the end
    A≃End(F):=∫ N∈A-Mod V(F(N),F(N)).
    This is just the enriched Yoneda lemma in a slight disguise.
In good cases, this end is computed already by restriction to the full subcategory AMod_dual of dualizable modules

## Groups

* https://sbseminar.wordpress.com/2007/10/07/group-hopf-algebra/
  pour le lien entre groupes et algèbres de Hopf
  ie un groupe est une algèbre de Hopf dans la catégorie Set

  => you *can* talk about groups in a symmetric monoidal category: they are what are usually called the Hopf algebras in it. The justification for calling them groups is that a Hopf algebra in a cartesian monoidal category C (i.e. one whose tensor product is categorical product) is simply a group in C.

  En effet, dans ces catégories là, la structure de comonoide est unique:
  in any monoidal category where the monoidal product is the categorical product that every object is uniquely a comonoid (object). And moreover this is compatible with any monoid structure on an object

  => Traditionally a group object is defined relative to a category with cartesian products, and Scott has indicated that a Hopf object in such a category boils down to a group. It is natural to wonder whether Hopf objects are in fact group objects in the traditional sense, by viewing the Hopf object as an object in some other category with cartesian products.

  Indeed you can, if the underlying comonoid is cocommutative. For the category of cocommutative comonoids has cartesian products given by the tensor of the symmetric monoidal category where they live. Thus cocommutative Hopf objects become group objects (in the traditional sense) in the cartesian category of cocommutative monoids.

  Therefore I would say that the notion of cocommutative Hopf object is coextensive with the traditional notion of group object, but more general Hopf objects are an honest-to-god generalization of the notion of group, which nevertheless gives the “right” notion in categories where the tensor is cartesian product. Interesting.

Category of monoids
-------------------

* https://ncatlab.org/nlab/show/category+of+monoids
Rem: The properties of the category of monoids Mon(C), especially with respect to colimits, are markedly different according to whether or not the tensor product of C preserves colimits in each variable. (This is automatically the case if C is closed.)

Theorem 2.1. Let C be a closed symmetric monoidal category with countable coproducts which is locally presentable.
  - U:Mon(C)→C  is a finitary monadic functor.
  - If C is a λ-locally presentable category then so is Mon(C).

Free and relative free monoids:
Proposition 2.2. Let C be a monoidal category with countable coproducts that are preserved by the tensor product. Then the forgetful functor U_C has a left adjoint F_C:C→Mon(C). On an object X∈C the underlying object of F_C X is U_C F_C X=∐ n∈ℕ X^⊗n with the monoidal structure given by tensor product/juxtaposition.

Pushout of commutative monoids:
Proposition 2.4. Suppose that 𝒞 is a symmetric monoidal category, with reflexive coequalizers, that are preserved by the tensor product functors A⊗(−):𝒞→𝒞.
Then for f:A→B and g:A→C two morphisms in the category CMon(𝒞) of commutative monoids in 𝒞, the underlying object in 𝒞 of the pushout in CMon(𝒞) coincides with that of the pushout in the category AMod of A-modules:
U(B ∐_A C)≃B⊗_AC.

Pushout of noncommutative monoids:
Proposition 2.5. If C is cocomplete and its tensor product preserves colimits on both sides, then the category Mon(C) of monoids has all pushouts
along morphisms F(f):F(K)→F(L), for f:K→L a morphism in C and F:C→Mon(C) the free monoid functor from above.

Filtered colimits:
Proposition 2.6. For C a closed symmetric monoidal category the forgetful functor U:CMon(C)→C from commutative monoids to C create filtered colimits.

Structure induced from monoidal functors:
If F:C→D is a lax monoidal functor, then it induces canonically a functor between categories of monoids Mon(F):Mon(C)→Mon(D).

* Références:
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.144.4291&rep=rep1&type=pdf
On Categories of Monoids, Comonoids, and Bimonoids; Hans–E. Porst

C est dite admissible si elle est monoidale symmétrique loc présentable et
le produit tensoriel est fini (ie préserve les colimites filtrantes).

2.3   Lifting  adjunctions
Si F:C->C' est un foncteur monoidal, il donne un foncteur F_Mon: Mon_C -> Mon_C', et si F a un adjoint à droite, F_Mon aussi.

2.5   Functor algebras and –coalgebras
Facts.  
1. The underlying functor Alg F→ K creates limits and those colimits which are preserved by F;  consequently,  it is monadic as soon as ithas a left adjoint.
2.  If K is cocomplete and F preserves directed colimits, then AlgF→K has a left adjoint.
3.  The underlying functor Coalg F→K creates colimits and those limits which are preserved byF;  it is comonadic as soon as it has a right adjoint.  (This is just the dual of 1. above.)
4.  If K is a locally presentable category and F preserves directed colimits, then Coalg F→K has a right adjoint.
5.  If K is locally presentable and F preserves directed colimits the categoriesAlgF and CoalgF are accessible

En particulier si T_+ est C→(C⊗C)+I et T_x est C→(C⊗C)xI; alors si C est
admissible:
1.  The category AlgT+ is finitary monadic over C and contains Mon C as a full subcategory.
2.  The category CoalgT× is comonadic over C and contains ComonC as a full subcategory.

2.6   Closure properties.
1. MonC is closed in AlgT+ with respect to the formation of limits and of directed and absolute colimits.
2. ComonC is  closed  in CoalgT× with respect to colimits and absolute limits.

Corollary: Let C be an admissible monoidal category.  Then
1. MonC is finitary monadic over C.
2. MonC is a locally λ–presentable category provided C is.

Proof: Since the Eilenberg–Moore category of a finitary monad on a locally λ–presentable category is locally λ–presentable again, 2. follows from 1. Since AlgT+ is  a  locally  finitely  presentable  category  (see  2.5)  it  follows from the previous proposition (by the reflection theorem for accessible categories [2, 2.48]) that MonC is reflective in AlgT+. Consequently, the forgetful functor MonC→C is finitary and has a left adjoint.  Monadicity of AlgT+ and closure of MonC under absolute coequalizers now proves monadicity (using the Beck–Pare–Theorem).

- cMonC is closed in MonC under limits, directed colimits and absolute colimits
- cMonC is reflective in MonC and finitary monadic over C.
- cMonC is a locally presentable category.

2.7   ComonC as  an  equifier
Proposition Let C be an admissible monoidal category.  Then
1. ComonC is a locally presentable category.
2. ComonC is comonadic over C.

- cocComonC is closed in ComonC under colimits and absolute limits
- cocComonC is coreflective in ComonC
- cocComonC is  locally  presentable and comonadic over C.

3.1 Monoidal  structures  for  monoids  and  comonoids

Fact With the monoidal structures defined above cMonC and cocComonC are symmetric monoidal categories and, moreover le produit tensoriel induit est un coproduit dans cMonC, et un produit dans cocComonC (par exemple pour cMonC via C1=C1 \tens I -> C1 \tens C2).

Proposition If C is an admissible monoidal category, then ComonC and cocComonC are  admissible.  If C is  even  monoidally  closed,  then  so  are Comon C and cocComon C,  where cocComonC is  then  in  fact  cartesian closed.
And MonC and cMonC are admissible too.
Proof: Each  functor  (C,μ,ε)⊗− on ComonC and cocComonC,  respectively,  preserves  those  colimits  which  are  preserved  by C⊗− on C, since the underlying functors of the categories of comonoids create colimits. Since these categories are locally presentable, the Special Adjoint Functor Theorem applies.

4  Bimonoids
Fact (Eckmann-Hilton Principle). The category of monoids over Mon C is isomorphic to cMonC. By duality, the category of comonoids over ComonC is isomorphic to cocComonC.

Un bimonoid est un objet C muni d'une structure de monoïde et de comonoïde
tel que les morphismes de la structure de comonoides C->C \tens C et C->I sont des morphismes de monoides ou de manière équivalente que les morphismes C \tens C->C et I->C issus de la structure de monoides sont des morphismes de comonoides.

=> MonComonC=BimonC=ComonMonC
Proposition For any admissible monoidal category C the category BimonC is locally presentable.  It is finitary monadic over ComonC and comonadic over MonC.

4.2   Commutative  and  cocommutative  bimonoids
cBimonC=ComoncMonC and cocBimonC=MoncocComonC

Proposition
1. cBimonC is a locally presentable category.  
   It is comonadic over cMonC.
   cBimonC is a reflexive subcategory of BimonC closed w.r.t.  directed colimits, and, consequently monadic over ComonC.
2. cocBimonCis  a  locally  presentable  category.
   It  is  finitary  monadic over cocComonC.
   cocBimonC is a coreflexive subcategory of BimonC and, consequently, comonadic over MonC

Facts
1.  The  cofree  bimonoid  over  a  commutative  monoid C is  commutative and, thus, the cofree commutative bimonoid over C.
2.  The free bimonoid over a cocommutative comonoid C is cocommutative and, thus, the free cocommutative bimonoid over C.

Catégories internes et groupoïdes
---------------------------------

* Catégories internes

https://ncatlab.org/nlab/show/internal+category

$ Internal category

Let A be any category. A category internal to A consists of
  - an object of objects C_0∈A
  - an object of morphisms C_1∈A
together with
  - source and target morphisms s,t:C_1→C_0
  - an identity-assigning morphism e:C_0→C_1
  - a composition morphism c:C_1 ×_C_0 C_1→C_1

$ Internal groupoid
A groupoid internal to A is all of the above with a morphism C_1 →i C_1. i
joue le rôle de l'inverse.

$ Alternative definition
If A has all pullbacks, then we can form the bicategory Span(A) of spans in A. A category in A is precisely a monad in Span(A).
The underlying 1-cell is given by the span (s,t):C_0←C_1→C_0, and the pullback C_1 ×_C_0 C_1 is the vertex of the composite span (s,t)∘(s,t). The morphisms e:C_0->C_1 and c: C_1 ×_C_0 C_1→C_1 are required to be morphisms of spans, which is equivalent to imposing the source and target axioms above. Finally the unit and associativity axioms for monads imply those above.

$ Internal nerve

The notion of nerve of a small category can be generalised to give an internal nerve construction. For a small category, D, its nerve, N(D), is a simplicial set whose set of n-simplices is the set of sequences of composable morphisms of length n in D. This set can be given by a (multiple) pullback of copies of D_1. That description will carry across to give a nerve construction for an internal category:
Par Ex N(C)_3=C_1 ×_C_0 C_1 ×_C_0 C_1, the object of composable triples of arrows; ainsi N(C) est le bar construction de C.

$ In a cartesian closed category
Theorem 4.1. Let E be a finitely complete cartesian closed category. Then the category Cat(E) of internal categories in E is also finitely complete and cartesian closed.

$ In a topos

If the ambient category is a topos, then with the right kind of notion of internal functor [=j'imagine des anafunctors], the internal groupoids form the corresponding (2,1)-topos of groupoid-valued stacks and the internal categories form the corresponding 2-topos of category-valued stacks/2-sheaves.

* Torseurs

Note: si G est un groupe, alors G-Set la catégorie des ensembles muni d'une
action de G est un topos [en effet on peut voir G comme une catégorie avec
1 point, G-Set est alors la catégorie des préfaisceaux dessus]. Plus
généralement c'est vrai si G topologique et G-Set = action continue de G
dans X, X muni de la topologie discrète.

Le théorème fondamental est que G-Set est le topos classifiant des
G-torseurs, ie [E, G-Set]=G-torseurs vus dans E.
Note: E est un torseur <=> GxE->ExE est un isomorphisme.
Par exemple, si X est un espace (topologique ou frame), alors Sh(X)->BG est
équivalent à se donner une G-bundle principale sur X.

Si G est un groupe continu, on a aussi BG l'espace topologique classifiant les
G-principal bundle:
https://en.wikipedia.org/wiki/Classifying_space
any G principal bundle over a paracompact manifold is isomorphic to a
pullback of the principal bundle EG → BG.

Références:
https://arxiv.org/pdf/0912.4551v2.pdf
Torsors, herds and flocks
Thomas Booker and Ross Street

This paper presents non-commutative and structural notions of torsor. The
two are related by the machinery of Tannaka-Krein duality.

Catégorie enrichie
------------------

https://ncatlab.org/nlab/show/enriched+category+theory

* https://ncatlab.org/nlab/show/enriched+category
  The category K must be monoidal, so that we can define composition as a morphism ∘:hom(y,z)⊗hom(x,y)→hom(x,z).
  Pour la liste des axiomes, cf: https://ncatlab.org/nlab/show/enriched+category#InMonoidCat, on a par exemple for each object a∈Obj(C) a morphism j_a:I→C(a,a) – called the identity element

Note: More generally, one may think of a monoidal category as a bicategory with a single object and this way regard enrichment in a monoidal category as the special case of enrichment in a bicategory.

Note: internal categories and enriched categories are both instances of monads in bicategories (the bicategory of spans and the bicategory of matrices, respectively) and so are both forms of generalized multicategory. On the other hand, when K is an ∞-extensive category, such as Set or simplicial sets (or more generally any Grothendieck topos), (small) K-enriched categories can be identified with K-internal categories whose object-of-objects is discrete (that is, a coproduct of copies of the terminal object).

$ Enrichment through lax monoidal functors

If V is a monoidal category, then an alternative way of viewing a V-category is as a set X together with a (lax) monoidal functor Φ=Φ_d of the form
V^op →yon_V Set^V →d Set^X×X
where the codomain is identified with the monoidal category of spans on X.

$ Change of enriching category
- Passage between ordinary categories and enriched categories
Every K-enriched category C has an underlying ordinary category, usually denoted C_0, defined by C_0(x,y)=K(I,hom(x,y)) where I is the unit object of KK.

- Lax monoidal functors
More generally, any (lax) monoidal functor F:K→L between monoidal categories can be regarded as a “change of base”. By applying F to its hom-objects, any category enriched over K gives rise to one enriched over L, and this forms a 2-functor from K-Cat to L-Cat, and in fact from K-Prof to L-Prof.

Moreover, this operation is itself functorial from MonCat to 2Cat. In particular, any monoidal adjunction K⇄L gives rise to a 2-adjunction KCat⇄LCat (and also for profunctors). 
In particular, if K(I,-) has an adjoint: −⋅I:Set⇄K:K(I,−) where −⋅I:Set→K-
takes a set S to the tensor or copower S⋅I, viz. the coproduct of an
S-indexed set of copies of I, then we have an adjunction  Cat⇄KCat.

Dualité
-------

* https://ncatlab.org/nlab/show/compact+closed+category
A compact closed category, or simply a compact category, is a symmetric monoidal category in which every object is dualizable, hence a rigid symmetric monoidal category.

* https://ncatlab.org/nlab/show/rigid+monoidal+category
A monoidal category is rigid if every object has duals on both sides. If only one type of dual exists, we speak of left rigid (or left autonomous) or right rigid categories.
This definition does not assert that the right dual of an object is isomorphic to its left dual: this need not be the case in general, though it is true in a braided monoidal category, and thus automatically also in a symmetric monoidal category (this last fact can be considered an algebraic form of the “Whitney trick” for knots; see this MO discussion). Note that a rigid monoidal category which is also symmetric is sometimes called compact closed, or simply “compact”.

* https://ncatlab.org/nlab/show/star-autonomous+category
it is a monoidal category in which all objects have “duals”, but in a weaker sense than in a compact closed category.

Monades
=======

Une monade est un objet en monoïde dans la catégorie des endofoncteurs. Si
on a une adjonction, on a une monade via l'endofoncteur T=GF, avec comme
unité η et comme jointure TT->T donnée par GεF.

Algèbres d'une monade
---------------------

* https://en.wikipedia.org/wiki/Monad_(category_theory)
Conversely, it is interesting to consider the adjunctions which define a given monad (T,η,μ) this way. Let Adj(C,T)  be the category whose objects are the adjunctions (F,G,e,ε) such that (GF,e,GεF)=(T,η,μ) and whose arrows are the morphisms of adjunctions which are the identity on C. Then this category has
  - an initial object (FT,GT,η,μT) : C → C_T, where C_T is the Kleisli category,
    a terminal object (FT,GT,η,μT) : C → C^T, where C^T is the Eilenberg–Moore category.

An adjunction (F,G,η,ε) between two categories C is a monadic
adjunction when the category D is equivalent to the Eilenberg–Moore
category C^T for the monad T = G F.

Note: Kleisli category: Hom_C_T(X,Y)=Hom_C(X, TY) où la composition utilise
la monade: X->TY->T^2Z->Z.
C'est une catégorie équivalente à la sous-catégorie des algèbres libres.
C'est la catégorie initiale des adjonctions correspondant à la monade T,
tandis que Eilenberg-Moore et la catégorie finale.

* https://ncatlab.org/nlab/show/Eilenberg-Moore+category
Eilenberg–Moore category=category of T-algebra, ie (x,h) où  h:Tx->x
satisfait le diagramme T^2x->Tx. Kleisli=sub cat of free algebras, ie x=Ty, 
                        Tx -> x
h:TTy->Ty vient de la monade.

$ As a colimit completion of the Kleisli category

Proposition 3.1. Every T-algebra (A,ν) is the coequalizer of the first stage of its bar resolution:
(T^2A,μ_TA)=>(TA,μ_A)⟶(A,ν).
This is a reflexive coequalizer of T-algebras. Moreover, the underlying fork in C is a split coequalizer, hence in particular an absolute coequalizer (sometimes called the Beck coequalizer, due to its role in the Beck monadicity theorem). A splitting is given by
T^2A ⟵η_TA TA ⟵η_A A

Proposition 3.2. The T-algebras in C are equivalently those presheaves on the category of free T-algebras whose restriction along the free functor is representable in C. In other words, the Eilenberg-Moore category C^T is the (1-category theoretic) pullback
C^T → [C_T^op,Set] 
↓       ↓[F_T^op,Set] 
C →Y  [C^op,Set]
of the category of presheaves on the Kleisli category along the Yoneda embedding Y of C.

* Note: si T est une monade qui a un adjoint à droite Y, alors Y est
automatiquement une comonade, et C^T =~ C_Y canoniquement via l'adjonction
TA -> B  ~>  A -> YB. Le foncteur d'oubli U a donc un adjoint à gauche (qui
donne T) et à droite (qui donne Y).

Limites et colimites pour les catégories d'Elienberg-Moore
----------------------------------------------------------
* https://ncatlab.org/nlab/show/Eilenberg-Moore+category

$ Limits and colimits in EM categories

Limites: The Eilenberg-Moore category of a monad T on a category C has all limits which exist in C, and they are created by the forgetful functor.

Colimites: If C is cocomplete and C^T has reflexive coequalizers, then C^T is cocomplete. C'est le cas en particulier si T preserve reflexive coequalizers. (cf plus bas)

$ Local presentability
Definition 3.3. An accessible monad is a monad on an accessible category whose underlying functor is an accessible functor.
Proposition 3.4. The Eilenberg-Moore category of a κ-accessible monad, def. 3.3, is a κ-accessible category. If in addition the category on which the monad acts is a κ-locally presentable category then so is the EM-category.

* https://ncatlab.org/nlab/show/colimits+in+categories+of+algebras

$ Reflexive coequalizers and cocompleteness
Prop 2.1: if T preserves colimits over J, U:C^T->C reflects colimits over J.

Theorem 2.2. If C is cocomplete and C^T has reflexive coequalizers, then C^T is cocomplete.
Corollary 2.3. If T is a monad on a complete and cocomplete category C that preserves reflexive coequalizers, then C^T is complete and cocomplete.
Exemple: C is a complete, cocomplete, cartesian closed category and T is the monad corresponding to a finitary algebraic theory.
Pr: the finitary power functors x↦x^n preserve reflexive coequalizers if C is cartesian closed.

Corollary 2.4. If T is a monad on Set (resp Set/X, Vect), then Set^T is cocomplete.

$ Categories of algebras are Barr exact
Theorem 2.6. If C is a regular category or exact category in which regular epimorphisms split, and T is any monad on C, then C^T is a regular category (or exact category, respectively).
Corollary 2.7. If T is a monad on a slice category Set/X, then the category of T-algebras is (Barr-)exact

$ For functors preserving filtered colimits
Proposition 2.8. If C has coequalizers and equalizers of arbitrary sets of
parallel morphisms, and if a monad T:C→C preserves colimits of
countable chains ω→C, then C^T has coequalizers.
Corollary 2.9. If C is complete and cocomplete and T:C→C preserves filtered colimits, or even just colimits of ω, then C^T is complete and cocomplete.

$ For locally presentable categories
If C is a locally presentable category and T is an accessible monad (aka a bounded monad, aka a monad with rank) on C, then C^T is also locally presentable and in particular cocomplete.

$ Relatively free functors
Theorem 3.1. Suppose that θ:S→T is a morphism of monads on C, and suppose that C^T has coequalizers. Then the relative “forgetful” functor
C^θ:C^T→C^S (pulling back a T-algebra) to a S-algebra has a left adjoint.

Pr: C^T→C^S→C is the forgetting map on C^T, so by the adjoint lifting
theorem, since C^T has coequalizers of reflexive pairs, then C^θ has a left
adjoint and is, in fact, monadic.
Concretely, it sends an S-algebra Sc→c to the coequalizer
  TSc    →    Tc
      → TTC →

* cf aussi https://ncatlab.org/nlab/show/reflexive+coequalizer
- If T is a monad on a cocomplete category C, then the category C^T of Eilenberg Moore algebras is cocomplete if and only if it has reflexive coequalizers. This is the case particularly if T preserves reflexive coequalizers.
- If F:C×D→E is a functor of two variables which preserves reflexive coequalizers in each variable separately (that is, F(c,−) and F(−,d) preserve reflexive coequalizers for all c∈C and d∈D), then F preserves reflexive coequalizers in both variables together.
- Reflexive coequalizers in Set commute with finite products
=> If T is a finitary monad on Set, then T preserves reflexive coequalizers.

[voir aussi https://ncatlab.org/nlab/show/adjoint+lifting+theorem#sufficient_conditions_for_cocompleteness_of_monadic_categories
 U: 𝒜 -> 𝒞 monadique, 
 if 𝒜 has coequalizers of reflexive pairs and 𝒞 is small-cocomplete, then 𝒜 is small cocomplete.]

Monadicity theorem
------------------

* Beck's monadicity theorem gives a characterization of monadic functors.
https://en.wikipedia.org/wiki/Beck%27s_monadicity_theorem

* https://ncatlab.org/nlab/show/monadicity+theorem

Theorem 1.2. (Beck’s monadicity theorem, tripleability theorem)
A functor U:D→C is monadic if and only if
  - U has a left adjoint, and
  - U creates coequalizers of U-split pairs
    [Déf: 
    - f,g est U-split si Uf, Ug: Ua => Ub a un coéq split;
    - U creates coeqs of U-split pairs
    si f,g a un coéq e préservé par U, et si de plus un fork dans D
    qui a pour image un coéq split dans C est déjà un coéq (pas forcément
    split) dans D.]

Theorem 1.3. A functor U:D→C is monadic precisely if
  - U has a left adjoint,
  - U reflects isomorphisms (i.e. it is conservative), and
  - D has, and U preserves, coequalizers of U-split pairs.
[This is equivalent because a conservative functor reflects any limits or colimits which exist in its domain and which it preserves, while monadic functors are always conservative.]

L'importance des splits coéqualisers dans le cadre des monades vient de:
Let A be an algebra for the monad T on the category C, with structure map a:TA→A. Then the diagram
T^2A⇉_{μ_A}^{Ta} TA→^a A
called the canonical presentation of the algebra (A,a), is a split coequalizer in C (and a reflexive coequalizer in the category of T-algebras). The splittings are given by s=η_A:A→TA and t=η_TA:TA→T^2A.

[Note: plus généralement si T=UF, où F-|U; U: D->C, alors un objet A=UX
dans C a une structure naturelle d'algèbre (eg parce qu'on a D->C^T).
Dans D on a FUFUX => FUX -> X est un coeq reflectif, dont l'image dans  C
(UFUFUX => UFUX -> UX) = (T^2A => TA -> A) est un coeq réflectif split;
qui est aussi un coéq reflectif dans C^T.

Exemple: si on prend la monade concaténation de mots (C=Set), dont les
algèbres sont les monoides. On a T^2 A => T A -e> A où les deux applications
T^2 A => TA sont données par f:[liste1, ..., liste_k] -> [concaténation des
listes] et par g:[list1, ..., list_k] -> [A| mot1, ..., mot_k]. C'est une
bien un coeq de monoides. De plus T^2 A => TA
est réflexif dans C^T, une section étant donnée par [m1, ..., mk] -> [
[m1], ..., [mk] ]; qui est bien un morphisme de monoides libres.
Et vu dans C, le coéq est split, via s:m -> [m], et t:[m1, ..., mk] -> [[m1,
..., mk]]. On a bien es=Id, ft=Id et se = gt = [m1, ..., mk] -> [m1...mk]
]

Crude monadicity theorem: a functor U:D→C is monadic if
 - U has a left adjoint
 - U reflects isomorphisms
 - D has and U preserves coequalizers of reflexive pairs.

Duskin’s monadicity theorem
  - A right adjoint between finitely complete categories is monadic if it creates quotients for congruences. (on peut en fait se restreindre aux congruences whose images in C have split coequalizers).
As usual, we can also modify it by replacing reflection of limits by reflection of isomorphisms.
  - A conservative right adjoint U:D→C between finitely complete categories is monadic if any congruence in D which has a quotient in C already has a quotient in D, and that quotient that is preserved by U.

Monadicity over Set:
a functor U:D→Set is monadic if and only if
  - U has a left adjoint,
  - D admits kernel pairs and coequalizers,
  - A parallel pair R⇉S in D is a kernel pair if and only if its image under U is so, and
  - A morphism A→B in D is a regular epimorphism if and only if its image under U is so.
=> it is faithful (because it preserves equalizers and reflects isomorphisms) 

Free monad
----------

* https://ncatlab.org/nlab/show/free+monad
A free monad is a free object relative to a forgetful functor whose domain is a category of monads.

Ex: if C is locally presentable and we consider monads and endofunctors which are accessible. Suppose for the sake of argument that C is locally finitely presentable (the higher-ary case is analogous). Then we can restrict the above string of forgetful functors to the finitary monads, i.e. those preserving filtered colimits, to obtain: Mnd_f(C)→PtEnd_f(C)→End_f(C)→[ob(C)_f,C].
In this case, all these forgetful functors do have left adjoints, and moreover at least the functors Mnd_f(C)→End_f(C) and Mnd_f(C)→[ob(C)_f,C] are monadic.
For example, the left adjoint to Mnd_f(C)→End_f(C), shows that there exists a “free finitary monad” on any finitary endofunctor. Note, though, that this does not automatically imply that the “free finitary monad” on a finitary endofunctor is also a “free monad” on that endofunctor, i.e. that as a free object it satisfies the requisite universal property relative to all objects of Mnd(C), not merely those lying in Mnd_f(C). It is, however, generally true that this is the case: free finitary monads are also free monads.

We say that a monad T is algebraically-free on an endofunctor F if the category TAlg_mnd of T-algebras (in the sense of algebras for a monad) is equivalent to the category FAlg_{endo} of F-algebras (in the sense of algebras for an endofunctor. 

Cf https://ncatlab.org/nlab/show/algebra+for+an+endofunctor: this is just a morphism F(X)→X. When C and F are well-behaved, then algebras over an endofunctor F are equivalent to algebras over a certain monad, the algebraically-free monad T generated by F. This is analogous to the relationship between an action M×B→B of a monoid M and a binary function A×B→B (an action of a set): such a function is the same thing as an action of the free monoid A^* on B.

Algebraically-free => free.
Theorem 3.2. If C is locally small and complete, then any free monad is algebraically-free.

* https://ncatlab.org/nlab/show/transfinite+construction+of+free+algebras
Let 𝒜 be a locally presentable category. All endofunctors of 𝒜 which we consider will be accessible.

Definition 2.1. An endofunctor S:𝒜→𝒜 is called pointed if it is equipped with a natural transformation σ:Id_𝒜→S. It is called well-pointed if Sσ=σS (as natural transformations S→S^2).
Of course, a monad can be regarded as a pointed endofunctor where σ is its unit. Such an endofunctor is well-pointed precisely when the monad is idempotent.

Definition 2.2. If H is an endofunctor, then an H-algebra is an object A together with a map HA→A. If (S,σ) is a pointed endofunctor, then an S-algebra is an object A with a map a:SA→A such that aσ_A=1_A.

Lemma 2.3. If (S,σ) is well-pointed, then an object A admits at most one S-algebra structure. This happens exactly when σ_A is an isomorphism, in which case its inverse is that unique algebra structure.
Thus, when S is well-pointed, the category of S-algebras is a full subcategory of 𝒜.

Lemma 2.4. If (S,σ) is a well-pointed endofunctor and α:S→T is a natural transformation whose components are epimorphisms, then T is also well-pointed.
Lemma 2.5. Suppose (S_i,σ_i) is a family of (accessible) well-pointed endofunctors and let σ:Id→S be the wide pushout of all the points σ_i:Id→S_i. Then (S,σ) is (accessible and) well-pointed, and SAlg=⋂_i(S_iAlg).

Lemma 2.6. Let F:𝒜⇄ℬ:G be an adjunction and (S′,σ′) an (accessible) well-pointed endofunctor on ℬ. Let (S,σ)(S,\sigma) be the pushout
FG →Fσ′G FS′G 
↓         ↓
Id →σ     S.
Then (S,σ) is (accessible and) well-pointed, and A∈𝒜A is an S-algebra exactly when GA is an S′-algebra.

Free algebras for well-pointed endofunctors
Theorem 3.1. If 𝒜 is locally presentable and S is an accessible well-pointed endofunctor, then SAlg is reflective in 𝒜. Therefore, the algebraically-free monad on S exists (and is accessible).

Example 3.2. Let K be a set of morphisms in 𝒜; recall that an object A∈𝒜 is said to be orthogonal to K if 𝒜(k,A) is a bijection for all k∈K, which is to say that each functor 𝒜(k,−):𝒜→Set^2 takes A to an isomorphism, where Set^2 is the arrow category of Set. Now the subcategory of isomorphisms is reflective in Set^2, hence is the algebras for a well-pointed endofunctor R_k. By Lemma 2.6, there is a well-pointed endofunctor S_k on 𝒜 whose algebras are the objects orthogonal to k. And by Lemma 2.5, there is a well-pointed endofunctor S whose algebras are those objects orthogonal to all k∈K. Thus, by Theorem 3.1, the category of objects orthogonal to K is reflective in 𝒜.
Example 3.3. Applying the previous example on slice categories, we can construct orthogonal factorization systems.

4. Free algebras for pointed endofunctors
Now let (T,τ)(T,\tau) be a general (accessible) pointed endofunctor.
If α:T′→T is a natural transformation, we have an adjunction α_!:T′/𝒜⇄T/𝒜:α^* in which α sends (A,B,a) to (A,B,a∘α A) and α_! is defined by a pushout.
Note that if α is τ:Id→T, then τ^*(A,B,a) is the composite A →τ_A TA →a BA.

Lemma 4.1. The category TAlg of T-algebras is a reflective full subcategory of T/𝒜.
Proof. It is easy to show that it is a full subcategory. Moreover, (A,B,a) lies in TAlg just when τ^*(A,B,a) is an isomorphism. The isomorphisms are a reflective subcategory of 𝒜^2, hence the algebras for a well-pointed endofunctor R. Now by Lemma 2.6, there is a well-pointed endofunctor S of T/𝒜 whose algebras are precisely the T-algebras. Now apply Theorem 3.1.  ▮

Theorem 4.2. The category TAlg is monadic over 𝒜, and cocomplete. In particular, the algebraically-free monad on T exists and is accessible.

The free functor can be defined inductively a transfinite sequence
       TX_0 → TX_1 → TX_2 → … 
       ↓ x_0  ↓ x_1  ↓ x_2 
X_0 →  X_1 →  X_2 →  X_3 →  …
such that X_β→X_β+1 is equal to x_β∘τ_{X_β}

Ex 4.3: The algebraic small object argument is an enhancement of the small object argument, based on a free monad construction, that produces algebraic weak factorization systems.

5. Free algebras for unpointed endofunctors

An algebra for an unpointed endofunctor H is the same as an algebra for the pointed endofunctor T≔Id+HT. Thus, Theorem 4.2 can be applied to unpointed endofunctors as well.
In this case, the transfinite sequence for the free H-algebra on A∈𝒜A is much simpler: we have X_0=A and X_β+1=A+HX_β.

6. Colimits of algebras for a monad

Let T be a monad on 𝒜, and let TAlg denote the category of T-algebras qua monad.
Theorem 6.1. The category TAlg is a reflective subcategory of T/𝒜.

Corollary 6.2. TAlg is locally presentable. Moreover, any functor TAlg→T′Alg induced by a monad morphism T′→T has a left adjoint.

7. Colimits of monads

When speaking of colimits of monads, we are not interested merely in colimits in the category of monads, but algebraic colimits in the following sense. Let V:K→Monad(𝒜) be a diagram in the category of monads on 𝒜, and define a V-algebra to be an object A together with V_k-algebra structures which commute with the images of morphisms in K.
Definition 7.1. An algebraic colimit of V is a monad P whose usual Eilenberg-Moore category PAlg is equivalent, over 𝒜, to the category of V-algebras.
It follows, by arguments similar to those for algebraically-free monads, that an algebraic colimit is also a colimit in the category of monads.

Theorem 7.2. Algebraic colimits of (accessible) monads exist (and are accessible).

* https://ncatlab.org/nlab/show/algebraic+small+object+argument
https://arxiv.org/abs/0712.0724
Understanding the small object argument, Richard Garner

https://www.sciencedirect.com/science/article/pii/S0001870813004581?via%3Dihub
On a fat small object argument
M.Makkai J.Rosický L.Vokřínek

* https://ncatlab.org/toddtrimble/published/Associated+idempotent+monad+of+a+monad

Theorem (Fakir). Let C be a complete, well-powered category, and let M:C→C be a monad with unit u:1→M and multiplication m:MM→M. Then there is a universal idempotent monad, giving a right adjoint to IdempotentMonad(C)↪Monad(C)

Proof. Given a monad M, define a functor M′ as the equalizer MuM u and uMu M:
M′↪M=>MM. This M′ acquires a monad structure. It might not be an idempotent monad (although it will be if M is left exact). However we can apply the process again, and continue transfinitely.

Distributive laws
-----------------

https://ncatlab.org/nlab/show/distributive+law
Exemple: pour combiner la monade Ab groupe abélien et la monade Mon monoïde
pour faire la monade Ring anneau libre, il faut Mon Ab Mon Ab -> Mon Ab.
En utilisant que Mon et Ab sont des monades, on veut donc Ab Mon -> Mon Ab.

Monads in any 2-category C make themselves a 2-category Mnd in which 1-cells are either lax or colax morphisms of monads; by dualization the same is true for comonads. Monads internal to the 2-category of monads are called distributive laws. In particular, distributive laws themselves make a 2-category. There are other variants like distributive laws between a monad and an endofunctor, “mixed” distributive laws between a monad and a comonad...

Distributive laws from the monad T to the endofunctor P are in a canonical bijection with lifts of P to an endofunctor P^T in the Eilenberg-Moore category A^T, satisfying U^TP^T=PU^T. [Note: Si P est une monade, on demande les conditions de compatibilité supplémentaires qui vont bien]

Exemples:
- Ab and Mon qui donnent Ring
- In a distributive category products distribute over coproducts.
- For many standard choices of tensor products in the presence of direct sums the former distribute over the latter.
- strict factorization systems can be identified with distributive laws between categories regarded as monads in Span(Set).
  More generally, factorization systems over a subcategory can be identified with distributive laws in Prof. Ordinary orthogonal factorization systems are a special case.

Monades et Objets en Monoïdes
-----------------------------

http://ncatlab.org/nlab/show/monad
http://ncatlab.org/nlab/show/enriched+category
http://ncatlab.org/nlab/show/2-category

A 2-category is a category enriched over the cartesian monoidal category Cat

Monade:
1) On peut définir une monade dans une bicatégorie K comme un objet a, un
endomorphisme t:a->a, une unité 1_a=>t, et une 2-multiplication \mu: t o t -> t
2) Une monade dans CAT (vue comme 2-catégorie) est une monade au sens usuel
(ie un objet en monoïde dans Hom(C,C) ie dans les endofoncteurs)

Monade => objet en monoïde
- Une catégorie monoïdale est un objet en monoïde dans CAT
- Une catégorie monoïdale C = Une 2-catégorie BC avec un seul 0-objet
  http://ncatlab.org/nlab/show/2-category
  -> horizontal composition in BC is the tensor product in C and vertical
  composition in BC is composition in C.
- Un objet en monoïde dans C = Une monade dans BC

On a donc:
- Niveau 0: Set (la catégorie des 0-objets). Un 0-objet (ie un ensemble A)
  peut être muni d'une structure de monoïde
  Un monoïde est simplement une catégorie avec un objet.
- Niveau 1: Catégories. Une catégorie C est telle que Hom(A,A) est une
  0-catégorie qui est un monoïde; réciproquement un monoïde est une
  catégorie avec 1 objet.
  On a une notion de catégorie monoïdale (= vertical enhancement of monoid)
  et d'objet en monoïde dans une telle catégorie.
- Niveau 2:
  Si C est monoïdale, on peut définir des C-catégories, Hom(A,A) est alors
  un objet en monoïde dans C. Réciproquement, un objet en monoïde dans C
  est une C-Catégorie avec un seul objet.
  Cat est monoïdale, donc on peut définir 2-Catégorie=Cat-Catégorie.
  Ainsi une 2-catégorie C est telle que Hom(A,A) est une 1-catégorie
  monoïdale, réciproquement si C est monoïdale, la catégorie BC avec 1
  objet est une 2-catégorie.
  Une monade est un objet en monoïde dans Hom(A,A); réciproquement un objet
  en monoïde dans C est une monade dans BC. Souvent on applique ça à la
  2-Catégorie 2-Cat: une monade est alors un objet en monoïde dans les
  endofoncteurs

Donc on peut descendre: un monoïde est une catégorie avec un objet, une
catégorie monoïdale est une 2-catégorie avec un objet;
étendre horizontalement: une catégorie c'est un monoïdeoïde, ie une collection de monoïdes; une 2-catégorie c'est une collection de 1-catégorie monoïdales;
internaliser: un objet en monoïde c'est un monoïde vu dans une catégorie monoïdale;
monter: Set est une catégorie, Cat est une 2-catégorie; Catégorie monoïdale:
généralisation à Cat d'un monoïde, ie objet en monoïde dans Cat; monade:
généralisation à 2-Cat.

En résumé: on part de Set, dans lequel on peut définir les monoïdes, on remarque que Hom(X,X) est un monoïde; on horizontalifie les monoïdes pour obtenir Cat dans laquelle on peut définir les catégories monoïdales et les objets en monoïdes dedans, on remarque que Hom(C,C) est une catégorie monoïdale (et un object en monoïde dedans est une monade); on horizontalifie les catégories monoïdale pour avoir les 2-catégories, et une monade est un objet en monoïde dans la catégorie monoïdale Hom(CC, CC), CC un objet de la 2-catégorie. Réciproquement, si C est monoïdale elle forme une 2-catégorie BC (avec un unique objet C), un objet en monoïde dans C est une monade dans BC; si M est un monoïde et il forme une catégorie BM avec un unique objet.

Liens avec Haskell
------------------

return: A -> GF A c'est ηeta (ex: élément a -> [a])
fmap: f -> GF f c'est le foncteur GF (ex: une fonction A -> B donne une
liste de A -> une liste de B)
join: GFGF A -> GF A c'est G\espilonF (ex: une liste de liste -> une liste)

>>= (bind) c'est à m=GFA et g=(A->GFB) l'application
GFA -GFg -> GFGFB -join-> GFB, ie join(GFg(m))
(ex: une liste de A et une fonction A -> liste de B donne une liste de B)

Exemple en IO:

type IO a  =  RealWorld -> (a, RealWorld)

(>>=) :: IO a -> (a -> IO b) -> IO b
(action1 >>= action2) world0 =
   let (a, world1) = action1 world0
          (b, world2) = action2 a world1
             in (b, world2)

[cf Infos/Functional/Monades pour plus de détails]

Exemples: la monade Maybe, la monade List, la monade Continuation
Continuation = "monade universelle"
- https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/the-mother-of-all-monads
  => http://blog.sigfpe.com/2008/12/mother-of-all-monads.html
  [or is it the condensity monad? cf comment by Edward Kmett]
  "As I mentioned, given any language with a syntax for continuations you have the possibility of reusing that notation for monads. For example Python has linear continuations (via generators) so you can use this as a syntax for any of the 'linear' monads (like Identity, Maybe and Writer I think)."
- https://ncatlab.org/nlab/show/continuation+monad
  C'est aussi la monade du Non-Non:
  Cf les liens dans nlab:
  http://hal.inria.fr/docs/00/33/91/56/PDF/linear-control.pdf
  https://ncatlab.org/nlab/files/MelliesContinuation.pdf
- http://blog.sigfpe.com/2010/03/partial-ordering-of-some-category.html
- https://www.mail-archive.com/haskell-cafe@haskell.org/msg57738.html
   Re: [Haskell-cafe] Monads from Functors 
- https://mail.haskell.org/pipermail/haskell-cafe/2010-June/079472.html
  [Haskell-cafe] The mother of all functors/monads/categories

Operads et props
----------------

* https://ncatlab.org/nlab/show/operad
  https://en.wikipedia.org/wiki/Operad
  [operad = multiprises que l'on compose, avec les conditions
  d'associativité qui vont bien]

Réf: http://www.numdam.org/item/SB_1994-1995__37__47_0/
 La renaissance des opérades Loday, Jean-Louis, Séminaire Bourbaki

An operad is a gadget used to describe algebraic structures in symmetric monoidal categories. It is
  - a bunch of abstract operations of arbitrarily many arguments;
  - equipped with a notion of how to compose these;
  - subject to evident associativity and unitality conditions.

An algebra over an operad is a concrete realization of these abstract operations: an object AA equipped with nn-ary operations A⊗⋯⊗A→AA \otimes \cdots \otimes A \to A as specified by the operad, subject to the composition relation as specified by the operad.

This way an operad is like a Lawvere theory in that it can be used to describe algebraic structures having finitary operations obeying equational laws. However, unlike Lawvere theories, operads can be defined internal to general symmetric monoidal categories where the tensor product might not be the cartesian product.

This definition is essentially that of an enriched category, only that the hom-objects are allowed to go from more than one object to a given output object.

* Abstract definition: https://ncatlab.org/nlab/show/operad#Conceptual
- Let ℙ be the groupoid of finite cardinals with bijections as morphisms – the permutation category.
Since ℙ is the core groupoid of the category Fin of finite cardinals and functions between them, the coproduct on Fin restricts to a symmetric monoidal product called the cardinal sum on ℙ.

Remark. Under this symmetric monoidal structure, ℙ may be characterized as the free symmetric strict monoidal category on one generator.

- The cardinal sum on ℙ extends along the Yoneda embedding to a symmetric monoidal product F⊗G on the presheaf category Psh(ℙ):=[ℙ op,Set]. This is an instance of the Day convolution.

Psh(ℙ) is up to equivalence the free symmetric monoidally cocomplete category on a single generator.

- A (Set-based) operad is a monoid in the monoidal category (Psh(ℙ),∘,I)

* https://ncatlab.org/nlab/show/algebrad
https://arxiv.org/pdf/1105.3114.pdf
Classifying Vectoids and Generalisations of Operads

* https://ncatlab.org/nlab/show/Day+convolution
The category of functors on a monoidal category canonically inherits itself a monoidal category structure via a categorified convolution product

X⊗_Day Y:c↦∫^(c1,c2)∈𝒞×𝒞 𝒞(c1⊗c2,c) ⊗_V X(c1) ⊗_V Y(c2).

Proposition 2.3. The Day convolution product (def. 2.1) of two functors is equivalently the left Kan extension of their external tensor product (def. 2.2) along the tensor product ⊗_𝒞\: there is a natural isomorphism
X⊗_DayY≃Lan_⊗𝒞(X⊗¯Y) où X⊗¯Y ≔⊗_V∘(X,Y) i.e. (X⊗¯Y)(c1,c2)=X(c1)⊗_V Y(c2)

TODO: Day convolution

* https://ncatlab.org/nlab/show/actegory
As monoidal categories are a vertical categorification of monoids, actegories are a vertical categorification of actions of a monoid. So given a monoidal category (C,⊗,I,l,r,a) an actegory is another category D with a notion of “tensor by object of C”, i.e., a functor: ⊘:C×D→D that is associative and unital up to natural isomorphism with respect to ⊗ in ways that generalize actions of a monoid, and satisfy coherence laws similar to those of a monoidal category.

* https://ncatlab.org/nlab/show/PROP
   ‘PROP’ — an abbreviation of ‘products and permutations category’ — is a symmetric monoidal category generated by a single object, used to describe a given sort of algebraic structure. One can think of PROPs as a variant of Lawvere theories suitable for noncartesian contexts. In this respect they are similar to operads. However, they are more general, because they can be used to describe operations with many outputs as well as many inputs.
   [ie une opérade encode des opérations n->1 alors qu'une prop des
   opérations n->m]

Definition 2.1. A PROP is a strict symmetric monoidal category where every object is of the form x^⊗n=x⊗x⊗⋯⊗x for a single object x and n≥0.

* https://sbseminar.wordpress.com/2007/10/07/group-hopf-algebra/
Voir les commentaires: une algèbre de Hopf ne vient pas d'une monade mais
d'une PROP. On a aussi la notion d'Hopf monad

Théories algébriques
====================

## Théorie algébrique.

### Variété équationelle

https://en.wikipedia.org/wiki/Variety_(universal_algebra)

Birkhoff: A class of algebraic structures of the same signature is a variety if and only if it is closed under the taking of homomorphic images, subalgebras and arbitrary products

If V is a finitary algebraic category (i.e. the category of a variety of algebras, with homomorphisms as morphisms) then the forgetful functor
    G : V → Set
has a left adjoint F : Set → V, namely the functor that assigns to each set the free algebra on that set. This adjunction is strictly monadic, in that the category V is isomorphic to the Eilenberg–Moore category Set T  for the monad T = G F.

One says a category is an algebraic category if it is monadic over Set. This is a more general notion than "finitary algebraic category".

Note: pour une preuve que qu'une catégorie algébrique est équivalente à
la catégorie d'algèbre de la monade associé à foncteur d'oubli o foncteur
libre sur Set, cf par exemple
http://math.uchicago.edu/~may/REU2012/REUPapers/Sankar.pdf
MONADS  AND  ALGEBRAIC  STRUCTURES
ou https://mathoverflow.net/questions/134295/further-relation-between-monads-and-theories

### Théorie algébrique finie

* https://ncatlab.org/nlab/show/Lawvere+theory
Definition. 
- A Lawvere theory or finite-product theory is (equivalently encoded by its syntactic category which is) a category T with finite products in which every object is isomorphic to a finite cartesian power x^n = x of a distinguished object x (called the generic object for the theory T).
- A homomorphism of such theories T→T′ is a product-preserving functor.

Remark. For T a Lawvere theory, we are to think of the hom-set T(n,1):=T(x n,x)T(n,1) := T(x^n, x) as the set of n-ary operations definable in the theory.

Definition. A model of T – an algebra over the Lawvere theory or simply T-algebra – is a product-preserving functor A:T→Set and homomorphism of T-algebras is a natural transformation between such functors.

Lien avec une théorie algébrique:
 - The Lawvere theory T is the category opposite to the category of free algebras on finitely many generators,
 - The category of algebras is in turn equivalent to the category of product-preserving functors T→Set
 - The (finite) free algebras are retrieved as the representable functors T→Set

As discussed in the article on operads, the notion of Lawvere theory may also be formulated in terms of operads relative to the theory of cartesian monoidal categories.

Caractérisation:
Theorem 3.1. A concrete category U:C→Set is a category of algebras over a Lawvere theory precisely if U
  - is monadic
  - is finitary in that it preserves filtered colimits.

Theorem 3.2. (Birkhoff's HSP theorem)
Suppose given a language L generated by a set of (single-sorted) finitary operations, and a class C of structures for L. Then C is the class of models for a set of universally quantified equations between terms of L if and only if
    (H) The class is closed under homomorphic images,
    (S) The class is closed under subalgebras,
    (P) The class is closed under taking products.

Si A est une algèbre, une congruence est une relation d'équivalence R
stable par les opérations de A. A/R est alors une algèbre.
Si f,g: A->B, le coéqualisateur est A/<f(a)=g(a)>

Exemple: pour une théorie vide, on a T=FiniteSet^op, que l'on note S. Une
algèbre est juste un ensemble.
Si T est une théorie, on a un toujours un morphisme de théorie S->T, 1
\mapsto x qui est essentiellement surjectif.

Soit f:T_1 -> T_2 un morphisme de théorie, le pullback f^* donne un
morphisme T_2-Alg -> T_1-Alg. Ce foncteur a un adjoint à gauche f_*:
T_1-Alg->T_2-Alg.

Preuve: si K_1 et K_2 sont les monades associés, si A est une T_1-algèbre
on peut définir f_*A comme le coéqualisateur K2K1 A => K2A -> f_*A
qui en fait donc une T_2-algèbre.

Exemple: si i:S->T, alors on a le foncteur algèbre libre i_*: Set -> T-Alg,
adjoint au foncteur i^*: T-Alg -> Set qui est simplement le foncteur
d'oubli (via l'identification de Set à S-Alg).
Par exemple i_*([n]) est l'algèbre libre à n éléments, donné comme le
foncteur représentable Hom(x^n, .): T->Set. Pour un ensemble S quelconque,
Free(S) est la colimite filtrante des Free(S_n) pour S_n \subset S fini.
Pour l'adjonction précédente, on écrit A=Free_T1(A)/Gamma et on pose
f_*(A)=Free_T2(A)/<Gamma>

Limits and colimits of T-algebras
Proposition. For T a Lawvere theory, the category TAlg has all small limits and colimits. The limits and the filtered colimits in TAlg are computed pointwise.

Liens avec les monades: l'adjonction i_*, i^* donne une monade sur S-Alg=Set.
Réciproquement, si on a une monade T sur Set, alors
The large Lawvere theory Th(T) of T is the opposite of the Kleisli category, Kl(T)^op.
Théorème:
- The monad associated with the theory Th(T) is isomorphic to T
- the Lawvere theory of the monad of C is equivalent to C.
- Each algebra X of the monad T gives rise to a model M_X of the Lawvere theory
  Kl(T)^op↪Alg(T)^op→hom(−,X)Set
  On a une équivalence de catégorie: M:Alg(T)→Mod(Th(T),Set)


## Théorie algébrique généralisée

* https://ncatlab.org/nlab/show/algebraic+theory
Definition:. A Lawvere theory or algebraic theory is a locally small category C with small products that is equipped with an object x such that the (unique-up-to-isomorphism) product-preserving functor
i:Set^op→C:[1]↦x is essentially surjective.

Multi-sorted theories: Π:(Set/S)^op→C is product preserving and essentially surjective.
Note: Each object U→S of Set/S may be thought of as a monomial term ∏_s x_s^U_s indexed by S, ie (Set/S)^{op} is the free category with small products generated by the set S.
If D has small products, a model of C in D is a product-preserving functor M:C→D. A homomorphism of models is simply a natural tranformation between product-preserving functors

Commutative theories: Commutative algebraic theories are (single-sorted) algebraic theories for which each operation is an algebra homomorphism. These form an important subclass. Their categories of models are closed: the hom sets have a natural model-structure (algebra-structure), and the enriched Hom-functor has a left adjoint, tensor product.

- Lien avec les monades pour le cas multisorted (locally small): 
Π:(Set/S)^op→C

Remark: Modèles(Set/S^op)=Prod((Set/S)^op,Set)≃^−∘i Set^S≃Set/S
ie Set/S^op is the theory of S-multi sorted set.

Theorem 1. The functor
Set/S →Π^op C^op→y Mod(C,Set) is left adjoint to the functor
Prod(C,Set) →^Prod(Π,Set) Prod((Set/S)^op,Set)≃Set/S
Note: y:C^op→Mod(C,Set), c->hom(c,-) is the (co)yoneda embedding, y(c) is
product preserving.

De même si T:Set/S est une monade, la théorie de Lawrere large Th(T) est
l'opposé de la catégorie de Kleisli est bien une théorie:
the left adjoint Set/S→Kl(T) is coproduct-preserving, so we have a product-preserving functor (Set/S)^op→Kl(T)^op.
Th 2: The monad associated with the theory Th(T) is isomorphic to T;
Th 3: Réciproquement let C be an S-sorted Lawvere theory. Then the Lawvere theory of the monad of C is equivalent to C.

- Algebras and models
Each algebra XX of the monad T gives rise to a model M_X of the Lawvere theory:
Kl(T)^op ↪ Alg(T)^op →^hom(−,X) Set
so we have a functor M:Alg(T)→Mod(Th(T),Set).
This functor is an equivalence.
It is convenient to proceed as follows. By Theorem 2, the underlying functor
Prod(Kl(T)^op,Set)→Set/S has a left adjoint such that the associated monad is T, and this yields a comparison functor
A:Prod(Kl(T)^op,Set)→Alg(T), which is the essential inverse of M.

* https://ncatlab.org/nlab/show/essentially+algebraic+theory
= théorie d'une categorie loc. présentables. (cf sketch)

An essentially algebraic theory or finite limits theory is a category that is finitely complete, i.e., has all finite limits. A model of an essentially algebraic theory T is a functor F:T→Set that is left exact, i.e., preserves all finite limits. A homomorphism of models is a natural transformation.

Categories of models of finitary essentially algebraic theories are precisely equivalent to locally finitely presentable categories. These are equivalent to categories of models of finite limit sketches.

Examples: A (multisorted) Lawvere theory T is the same thing (has the same models) as a finitary essentially algebraic theory in which all operations are total. If C_T is the opposite of the category of finitely presented T-algebras, then the category of models is equivalent to Lex(C_T,Set).

An equivalent formulation is as a cartesian theory, a geometric theory in which disjunction ⋁ is not used, and each use of existential quantification ∃ must be accompanied by a proof that existence is unique.

* https://ncatlab.org/nlab/show/generalized+algebraic+theory
Sur le papier GENERALISED ALGEBRAIC THEORIES AND CONTEXTUAL CATEGORIES* de
Cartmell: https://www.sciencedirect.com/science/article/pii/0168007286900539

=> Cartmell’s paper explains how, for every GAT there is an EAT with the same models and for every EAT there is a GAT with the same models. In this sense they are more or less equivalent in descriptive power.

* Lien avec les catégories présentables:
https://link.springer.com/content/pdf/10.1007/s000120050111.pdf
On  essentially  algebraic  theories  and  their  generalizations

(a)  We  provide  a  new,  clearer  proof  of  the  result  that  essentially  algebraictheories  form  a  syntax  for  locally  presentable  categories.(b)  For  locally  generated  categories  of  Gabriel  and  Ulmer  we  describe  theappropriate syntax, which turns out to be completely analogous to (a)

THEOREM  1.A  category  is  locally λ-presentable  iff  it  is  equivalent  to  the category  of  models  of  λ-ary  essentially  algebraic  theory.

Catégories finiment localement présentables
-------------------------------------------

* https://ncatlab.org/nlab/show/sketch
Definition 2.1. A sketch is a small category T equipped with a set L of cones and a set C of cocones. A realized sketch is one where all the cones in L are limit cones and all the cocones in C are colimit cocones.
A model of a sketch in a category 𝒞 is a functor T→𝒞 taking each cone in L to a limit cone and each cocone in C to a colimit cocone.

A Lawvere theory is a special case of a (limit-)sketch

An accessible category is equivalently:
  - a full subcategory of a presheaf category that’s closed under κ-filtered colimits for some κ
  - the category of models of a sketch

A locally presentable category is equivalently:
  - a reflective full subcategory of a presheaf category that’s closed under κ-filtered colimits for some κ
  - the category of models of a limit sketch
  - an accessible category with all small limits
  - an accessible category with all small colimits

* https://ncatlab.org/nlab/show/locally+finitely+presentable+category
=ℵ_0-locally presentable category.
A category C satisfying (any of) the following equivalent conditions is said to be locally finitely presentable (or lfp):
  - C has all small colimits, the category C_fp is essentially small, and any object in C is a filtered colimit of the canonical diagram of finitely presentable objects mapping into it.
  - C is the category of models for an essentially algebraic theory. Here an ‘essentially algebraic theory’ is a small category D with finite limits, and its category of ‘models’ is the category of finite-limit-preserving functors D→Set
  - C is the category of models for a finite limit sketch.
  - C_fp has finite colimits, and the restricted Yoneda embedding C↪[C_fp^op,Set] identifies C with the category of finite-limit-preserving functors C_fp^op→Set.

* https://pi.math.cornell.edu/~maru/documents/locally_finitely_presentable_cats.pdf
Recapitulating, a locally small, cocomplete category is locally finitely presentable if any of the following equivalent conditions are satisfied:
1. C_fp is  skeletally  small,  and  any  object  in C is  the  filtered  colimit  of  a diagram in C_fp
2.  There  exists  a  set S of  objects  of C_fp such  that  any  object  in C is  the filtered colimit of a diagram with objects in S.
3. C_fp is  skeletally  small,  and  the  functor F : C → [C_fp,Set] defined  by F(X)(A) = Hom(A,X) is fully faithful.
4. C_fp is  skeletally  small,  and  the  functor F : C → [C_fp,Set] defined  by F(X)(A) = Hom(A,X) is faithful and conservative.
5.  There exists a small subcategory S ⊂ C_fp such that the functor F : C → [S,Set] defined by F(X)(A) = Hom(A,X) is faithful and conservative.
6. C is the category of algebras for a finitary essentially algebraic theory.
If, in addition, C has equalizers, the adjective “faithful” can be dropped from
conditions 4 and 5.

Rem: in the category of algebras for any algebraic theory, the categorical
and algebraic notions of finite presentability agree.

Proposition 15. An object X in C can be written as a filtered colimit of objects in C_fp if and only if X is the colimit of the canonical diagram U_X : C_fp ↓ X →C , where U_X is the forgetful functor.

* https://ncatlab.org/nlab/show/Gabriel-Ulmer+duality
Gabriel–Ulmer duality says that there is an equivalence of 2-categories (or in other words, a biequivalence)
Lex^op → LFP, C ↦ Lex(C,Set)
where Lex is the 2-category of:
  - small finitely complete categories,
  - finite limit preserving functors, and
  - natural transformations,
and LFP is the 2-category of
  - locally finitely presentable categories,
  - finitary right adjoint functors and
  - natural transformations.

The idea is that an object C∈Lex can be thought of as an essentially algebraic theory, which has a category of models Lex(C,Set). Gabriel–Ulmer duality says that this category of models is locally finitely presentable, all LFP categories arise in this way, and we can recover the theory C from its category of models.

Locally presentable category
----------------------------

* https://ncatlab.org/nlab/show/locally+presentable+category
A locally presentable category is a category which contains a small set S of small objects such that every object is a nice colimit over objects in this set.
This says equivalently that a presentable category C is a reflective localization C↪PSh(S)of a category of presheaves over S. Since here PSh(S) is the free colimit completion of S and the localization imposes relations, this is a presentation of C by generators and relations, hence the name (locally) presentable category.

A category 𝒞 is called locally presentable if
  - it is an accessible category;
  - it has all small colimits (or all small limits, cf Borceux vol 2 Théorème 5.5.8)
En déroulant tout:
  - 𝒞 is a locally small category;
  - 𝒞 has all small colimits;
  - there exists a small set S↪Obj(𝒞) of λ-small objects that generates 𝒞 under λ-filtered colimits, for some regular cardinal λ. 
[Attention, a κ-small colimit of κ-compact objects is again a κ-compact object, mais une λ-filtered colimit peut être de taille > λ]

=> C is cocomplete, complete, wellpowered, co-wellpowered, C a (regular
épi, mono) factorisation, les λ-directed colimits sont exactes, any
cocontinuous functor C->D a un adjoint à gauche.

[- wellpowered: https://math.stackexchange.com/questions/253927/a-category-with-a-strong-generator-is-well-powered
Johnstone [Sketches of an elephant, Remark A1.4.17] only mentions that a locally small category with finite intersections of subobjects and a (strong) generating set is well-powered.
- complete: https://mathoverflow.net/questions/45577/any-cocomplete-category-with-a-dense-small-full-subcategory-is-complete
if C is a cocomplete category endowed with a small full subcategory B with the property that every element in C is a colimit of elements in B (hum je pense qu'il faut que ce soit la colimite canonique B/c, ie B dense), then C is complete. En effet, ça implique même C totale, cf #total categorie plus haut.]

* Borceux Déf 5.2.1: C est loc. présentable ssi C est cocomplète, et a un
ensemble (G_i) de strong generators λ-présentables.

Th: soit G la catégorie engendrée par les générateurs G_i∈S sous les
λ-colimits. Alors G est skeletally small, est exactement
la sous-catégorie des objets λ-présentables, et a les λ-colimites calculées
comme dans C. G est dense, et G/x est λ-filtrée pour tout x∈C, et tout
x∈C est small.
C est équivalente à λ-Lex(G^op, Set) [où plutôt à λ-Lex(T, Set) une small catégorie T λ-complète équivalente à G^op]
Donc les λ-limites commutent avec les λ-filtered colimites, qui sont
universelles.
Réciproquement, si T a les λ-limits, C=λ-Lex(T, Set) est loc. présentable.
et les objets λ-présentables/small sont exactement les foncteurs
représentables.
[En effet, Lex(C,Set) est cocomplet, et les représentables sont exacts à
gauche, denses donc strongly generator, et préservent les colimites
filtrées.]

- Locally presentable categories are precisely the accessibly embedded full reflective subcategories of categories of presheaves on some category K.
=> Proposition 4.10. Every sheaf(=Grothendieck) topos is locally presentable.

- Locally presentable categories are precisely the categories of models of limit-sketches (ou cf Borceux modèles of colimit-sketches):
Cf Gabriel–Ulmer: there is an equivalence of 2-categories Lex^op ≃ LFP
(locally finitely presented), C↦Lex(C,Set) which sends a finitely complete
category C to the category of models of C, i.e., the category of left exact
functors C→Set.

Stabilité:
Props: Lemma 3.8. A slice category of a locally presentable category is again locally presentable.

Theorem 3.9. If A is locally presentable/accessible and C is a small category, then the functor category A^C is locally presentable/accessible.

Theorem 4.12. If T is an accessible monad (a monad whose underlying functor is an accessible functor) on a locally presentable category A, then the category A^T of algebras over the monad is locally presentable.
In particular, if A is locally presentable and i:B→A is a reflective subcategory, then B is locally presentable if i is accessible.

* https://golem.ph.utexas.edu/category/2019/03/the_myths_of_presentability_an.html
Details sur locally λ-presentable => locally μ-presentable for μ⊳λ
- If λ≤μ, then every λ-presentable object is μ-presentable, and any μ-small colimit of μ-presentable objects is again μ-presentable. In particular,any μ-small colimit (λ-filtered or not) of λ-presentable objects is μ-presentable.
- If 𝒞 is locally λ-presentable and μ is a regular cardinal with μ≥λ, then every μ-presentable object of 𝒞 can be written as a μ-small (not necessarily λ-filtered) colimit of λ-presentable objects (Remark 1.30 in AR).
- If 𝒞 is λ-accessible and μ is a regular cardinal with μ⊳λ (a “sharp” cardinal inequality — see below), then every μ-presentable object of 𝒞 can be written as a μ-small λ-filtered colimit of λ-presentable objects (Remark 2.15 in AR).
- If F is an accessible functor, then there is a regular cardinal κ such that F preserves μ-presentable objects for any regular cardinal μ with μ⊳κ.

See also: https://mathoverflow.net/questions/325278/mu-presentable-object-as-mu-small-colimit-of-lambda-presentable-objects

* Références

- le livre Locally Presentable Categories

- Références pour le lien entre loc. présentable = modèle d'une théorie
essentiellement algébrique:
https://personalpages.manchester.ac.uk/staff/mike.prest/BridgeThesisFin.pdf, ESSENTIALLY ALGEBRAIC THEORIES AND LOCALIZATIONS IN TOPOSES AND ABELIAN CATEGORIES

https://link.springer.com/content/pdf/10.1007/s000120050111.pdf, On essentially algebraic theories and their generalizations
An object is l-presentable iff its hom-functor preserves l-directed
colimits, and it is l-generated, iff its hom-functor preserves l-directed
unions. Recall that Gabriel and Ulmer call a category K locally l-presentable
(or locally l-generated), iff
(i) K is cocomplete,
(ii) K has a set A of l-presentable (or l-generated, respectively) objects such that every K-objects is a l-directed colimit of A-objects
(iii) K is co-wellpowered w.r.t. strong epimorphisms.
In the locally presentable case, (iii) can be left out. In the locally
generated case, it is (still!) an open problem whether (iii) can be left
out.

- http://elib.suub.uni-bremen.de/diss/docs/E-Diss1326_Dzierzon.pdf
  Essentially Algebraic Descriptions of Locally Presentable Categories
  Christian Dzierzon
  Une autre preuve (plus catégorique) de loc présentable <=> modèle d'une
  théorie ess. algébrique.
  A aussi la preuve que dans les modèles d'une théorie algébrique, loc.
  présentable = loc. présentable au sens standard; car on a bien un
  générateur régulier:

  If C even has a regular generator of λ-presentable objects, Pres_λ C can be characterized as follows:
  2.2.10 Proposition ([GU71, 7.6]) Let C be locally λ-presentable, and G a regular generator of λ-presentable objects in C. Then a C-object A is λ presentable iff it is a retract C −→ A of some coequalizer
  ∐_I G_i => ∐_J G_j -> C with G_i, G_j∈G , and card(I),card(J)<λ.
  If regular epimorphisms in C are stable under composition, then A is λ-presentable iff A is a coequalizer of such a pair (s, t).

- https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2E08033166568856D3D19211C0D59D3D/S0004972700005591a.pdf/on_the_essentiallyalgebraic_theory_generated_by_a_sketch.pdf
  ON THE ESSENTIALLY-ALGEBRAIC THEORY GENERATED BY A SKETCH, G.M. KELLY
  qui montre tout (cone) sketch S a un modèle générique M:S->T
  où T est un sketch qui admet toute les F-limites, F={union des cones dans
  S}; ie M* est une équivalence de catégorie entre les T-modèles et les
  S-modèles, et son inverse est donné par l'extension (pointwise) de Kan à
  droite le long de M.
  [Note: on sait que Mod-S est localement présentables, donc on peut
  prendre pour T les objets localement présentés par ex]

* https://ncatlab.org/nlab/show/Vop%C4%9Bnka%27s+principle
Theorem 2.3. The VP is equivalent to the statement:
For C a locally presentable category, every full subcategory D↪C which is closed under colimits is a coreflective subcategory.

Theorem 2.7. The weak VP is equivalent to the statement:
For C a locally presentable category, every full subcategory D↪C which is closed under limits is a reflective subcategory.

Accessible category
-------------------

* https://ncatlab.org/nlab/show/accessible+category
Definition 2.1. A locally small category C is κ-accessible for a regular cardinal κ if:
  - the category has κ-directed colimits (or, equivalently, κ-filtered colimits), and
  - there is a set of κ-compact objects G_i that generate the category under κ-directed/filtered colimits.
Then C is an accessible category if there exists a κ so that it is κ-accessible.

Borceux Def 5.3.1: Si C est κ-accessible, G (la catégorie générée par les
G_i) est dense dans C, et G/x est κ-filtered pour tout objet x (et comme G
est dense, x est la colimite de G/x, donc en particulier est small car G/x
est small). De plus la sous-catégorie de C des objets κ-small
(=présentables) est petite; un tel objet s'écrit comme un équalisateur g=>g
pour un g dans G, cf Prop 5.3.8.

Proposition 2.3. Equivalent characterizations include that C is accessible iff:
  - it is the category of models (in Set, or even in a locally presentable
    category) of some small sketch.
  - it is of the form Ind_κ(S) for S small, i.e. the κ-ind-completion of a small category, for some κ.
  - it is of the form κ-Flat(S) for S small and some κ, i.e. the category of κ-flat functors from some small category to Set.
  - it is the category of models (in Set) of a suitable type of logical theory.
    =essentially algebraic theory
Note, cf Borceux: on peut prendre pour S la catégorie duale de G, qui est
équivalente à une petite catégorie. Pour le sketch on peut prendre le
sketch donné par la catégorie GG de tous les objets κ-small, C est
équivalente aux foncteurs [[GG, Set], Set] qui préservent les κ-limites et les
petites colimites. Sauf que le sketch [GG, Set] est large, donc il faut
travailler un peu pour montrer qu'il y a un petit sketch qui a les mêmes
modèles dans Set. De plus ce sketch a déjà les limites/colimites de ses
cones/cocones, ce qui montre que les modèles d'un sketch sont toujours
équivalent aux modèles d'un autre sketch qui a ses limites/colimites
marqués par ses cones/cocones.

Proposition 3.2. (preservation of accessibility under inverse images)
Let F:C→D be a functor between locally presentable categories which preserves κ-filtered colimits, and let D_0⊂D be an accessible subcategory. Then the inverse image f^−1(D_0)⊂C is a κ-accessible subcategory.

Proposition 3.7. A small category is accessible precisely when it is idempotent complete.

### Modèles d'une théorie géométrique de type preheaf:

cf la discussion dans https://golem.ph.utexas.edu/category/2014/04/on_a_topological_topos.html:
- if 𝒞 is a κ-accessible category, then 𝒞 is the free completion of the full subcategory of κ-presentable objects under κ-filtered colimits. Conversely, the free completion of any small category under κ-filtered colimits is κ-accessible.

- The classifying topos B[𝕋] of a geometric theory 𝕋 is a presheaf category (the theory is “of presheaf type”) if and only if the category Mod(𝕋) of models in Set is finitely accessible; cf https://ncatlab.org/nlab/show/theory+of+presheaf+type

  Attention: l'énoncé est faux tel quel, le vrai énoncé est Mod(T) est
  finiment accessible ssi il existe T' de type presheaf tel que
  Mod(T)=Mod(T'). Exemple: la théorie cohérente T des corps est
  ℵ_0-accessible, donc vient aussi d'une théorie T' de type presheaf, mais
  T n'est pas de type presheaf: there exists no coherent presheaf type
  axiomatization of field.

[Preuve: par Diaconescu, si T est un presheaf [C,S], les modèles Top/S(E, [C,S]) =~ Flat(C,E).
Avec les résultats sur les catégories accessibles, on en déduit l'énoncé.]

=> Plus de détails dans:
http://faculty.uml.edu/tbeke/jsl.pdf
THEORIES OF PRESHEAF TYPE, TIBOR BEKE

I Presheaf topos

Def: T is of presheaf type if its classifying topos B[T] is (equivalent to) a presheaf topos.

Proposition 0.1.
For a category M, the following properties are equivalent:
(i) M is a finitely accessible category in the sense of Makkai–Pare [14], i.e., it has filtered colimits and a small dense subcategory C of finitely presentable objects
(ii) M is equivalent to Pts(PSh(C)), the category of points of some presheaf topos
(iii) M is equivalent to the free filtered cocompletion (also known as Ind-C) ofa small category C.
(iv) M is equivalent to Mod(T) for some geometric theory of presheaf type.
Moreover, if these are satisfied for a given M , then the C —in any of (i), (ii) and (iii)— can be taken to be the full subcategory of M consisting of finitely presentable objects. (There may be inequivalent choices of C , as it is in general only determined up to idempotent completion).

Preuve: (ii)⇒(iii)⇒(iv)⇒(ii) is provided by Mac Lane-Moerdijk Theorem 2 [bis] on p. 382 since Flat(𝒞) is the free filtered cocompletion of C and also obviously a category of models for the geometric theory of flat functors C→Set. And then (i)⇔(ii) follows from the Representation Theorem 2.26 of Adámek and Rosický.

Warning: in (iv) the presheaf topos one recovers this way (which indeed has M as its category of Set-models) need not coincide with the sought-for topos B[T].
Par ex T=corps, alors comme les corps sont accessibles, donc il existe une
théorie T2 de type presheaf dont la théorie est donnée par les corps, mais
B[T] n'est pas de type presheaf.

Theorem 1.1. si T est de presheaf type, et T+ une extension géométrique de
T dans le même language, alors T+ est de presheaf type si
  - T+ a assez de modèles dans Set
  - tout modèle de T+ dans Set est vu dans Mod(T) comme filtered colimits
    de modèles de T+ finiment présentables dans Mod(T).

II Coherent presheaf topos

Theorem 2.1.
Let C be a small category. The following are equivalent:
(i) PSh(C) is a coherent topos.
(ii) C has all fc finite limits. (That is, any functor F:D→C with D a finite diagram has an fc limit in C.) [fc= finite cone terminal = il y a un ensemble fini TT tel que tout X a une map, pas forcément unique, X->T, T \in TT]
(iii) C has fc terminal objects, fc products, and fc equalizers.

Corollaire: il n'y a pas d'axiomatisation des corps cohérente de type
presheaf (ie on peut avoir l'un ou l'autre, mais pas les deux en même
temps).
Pr: If there were, its classifying topos would have to be
Set^F,where F is spanned by fields that are finitely presentable as objects of the category of fields and homomorphisms. But Set^F is not a coherent topos, since F has infinitely many components —to wit, each of the prime fields F_p
as well as the rationals Q are finitely presentable as objects
of fields(!), and no two of them are connected by a zig-zag o fhomomorphisms—
where as for a coherent Set^F, F has to have fc initial objects, a fortiori a finite number of connected components.

As an immediate consequence of Prop.0.1 and Thm.2.1:
Corollary 2.6.
For a category M, the following properties are equivalent:
(i) M is a finitely accessible category some (equivalently, all) of whose dense sub- categories consisting of finitely presentable objects possess fc
finite colimits
(ii) M is equivalent to Pts(Set, C), i.e., the free filtered cocompletion of a small category C that has all fc finite colimits
(iii) M is equivalent to Mod(T) for *some* coherent theory of presheaf type.
Moreover, if these are satisfied for a given M , then the C in (ii) can be taken to be the full subcategory of M consisting of finitely presentable objects, and the theory T of (iii) can be taken to be that of coherent flat functors.

Attention dans (iii) au *some*: One should mention that for a coherent theory T (even with just one axiom) Mod(T) may fail to be finitely accessible (see Remark 2.59 of Adamek–Rosicky),though it will always be א1-accessible.

III Axiomatizing ind-objects
Theorem 2.8. Let K be a locally finitely presentable category, and G a full
subcategory of K such that objects of G are finitely presentable in K. Let
A be the closure of G in K under filtered colimits, i.e., the full
subcategory of K with all objects that can be written as colimits of a
filtered diagram in G. Then A is a finitely accessible category, equivalent
to Ind-G. 
Assume moreover K=Mod(T), where T is a finite limit theory (ie an
finite essentially algebraic theory, ie category which has finite limits)
Then there exists, in the language of T, a geometric theory T+ of presheaf
type such that A=Mod(T+). If G has fc finite colimits, then T+ can be
chosen coherent.

IV Exemples: des théories où le Th 1.1 s'applique pour montrer qu'elles
sont de presheaf type
- Negated positive sentence
- Non empty domains
- Universal relational theories
  - Cosimplicial sets
  - Simplicial sets
  - Preserving and reflecting formulas
- Flat modules
- Hereditary module properties over noetherian ring

Résumé sur les catégories accessibles et localement présentables
----------------------------------------------------------------

* κ-accessible = loc. small +
- has κ-directed colimits (or κ-filtered colimits)
- there is a set of κ-compact objects G_i that generate the category under κ-directed/filtered colimits.
=> G (la catégorie générée par les G_i sous les κ-limites) est dense dans
C, et G/x est κ-filtered pour tout objet x et x est la colimite de G/x. 

Accessible <=>
- it is the category of models (in Set, or even in a locally presentable category) of some small sketch.
- it is of the form Ind_κ(S) for S small, i.e. the κ-ind-completion of a small category, for some κ.
- it is of the form κ-Flat(S) for S small and some κ, i.e. the category of κ-flat functors from some small category to Set.
- it is the category of models (in Set) of a suitable type of logical theory.
  =essentially algebraic theory
- a full subcategory of a presheaf category that’s closed under κ-filtered
  colimits for some κ

Preuve: 
- S = la catégorie duale de G, qui est équivalente à une petite catégorie.
- Pour le sketch on peut prendre le sketch donné par la catégorie GG de
  tous les objets κ-small (=présentables), GG est petite, un objet de GG
  s'écrit comme un équalisateur g=>g pour un g dans G.
  C est alors équivalente aux foncteurs [[GG, Set], Set] qui préservent les
  κ-limites et les petites colimites. Sauf que le sketch [GG, Set] est
  large, donc il faut travailler un peu pour montrer qu'il y a un petit
  sketch qui a les mêmes modèles dans Set. De plus ce sketch a déjà les
  limites/colimites de ses cones/cocones, ce qui montre que les modèles
  d'un sketch sont toujours équivalent aux modèles d'un autre sketch qui a
  ses limites/colimites marqués par ses cones/cocones.

Ex: A small category is accessible precisely when it is idempotent complete.

* A locally presentable category is equivalently:
- the category of models of a limit sketch
- the category of models of a colimit sketch
- an accessible category with all small limits
- an accessible category with all small colimits
  (et alors les λ-présentables sont denses et skel. small, et pour tout x G/x est λ-filtrée)
- cocomplète + un ensemble (G_i) de strong generators λ-présentables
- C est équivalente à λ-Lex(T, Set) où T a les λ-limits
  et T = les λ-présentables^op
  [Note: dans ce cas λ-Lex(T, Set)=λ-Flat(T, Set)]
  ie C = the category of models of an λ-essentially algebraic theory T
- a reflective full subcategory of a presheaf category [=> total] that’s
  closed under κ-filtered colimits for some κ (ie is accessibly embedded)
  En effet λ-Lex(T, Set) est plein dans [T, Set]. Autrement dit,
  C->[λ-présentables^op, Set] n'est pas seulement conservatif (= les λ-prés
  sont des strong génerators), il est pleinement fidèle.

Preuve:
- soit G la catégorie engendrée par les générateurs G_i∈S sous les
  λ-colimits. Alors G est skeletally small, est exactement la
  sous-catégorie des objets λ-présentables, et a les λ-colimites calculées
  comme dans C. G est dense, et G/x est λ-filtrée pour tout x∈C, et tout
  x∈C est small.
  C est équivalente à λ-Lex(G^op, Set) [où plutôt à λ-Lex(T, Set) une small
  catégorie T λ-complète équivalente à G^op]
  Donc les λ-limites commutent avec les λ-filtered colimites, qui sont
  universelles.
- Réciproquement, si T a les λ-limits, C=λ-Lex(T, Set) est loc.
  présentable. et les objets λ-présentables/small sont exactement les
  foncteurs représentables. En effet, Lex(C,Set) est cocomplet, et les
  représentables sont exacts à gauche, denses donc strongly generator, et
  préservent les colimites filtrées.

=> C is cocomplete, complete, wellpowered, co-wellpowered, C a (regular
épi, mono) factorisation, les λ-directed colimits sont exactes, any
cocontinuous functor C->D a un adjoint à gauche.
=> Every sheaf(=Grothendieck) topos is locally presentable.

Stabilité:
- A slice category of a locally presentable category is again locally presentable.
- If A is locally presentable/accessible and C is a small category, then the functor category A^C is locally presentable/accessible.
- If T is an accessible monad on a locally presentable category A, then the category A^T of algebras over the monad is locally presentable.
In particular, if A is locally presentable and i:B→A is a reflective subcategory, then B is locally presentable if i is accessible.

* Catégorie totales:
- C est totale si elle est réflexive dans PSh(C)
- C est réflexive dans une catégorie de préfaisceaux [B^op, Set] avec B
  small [=> C totale] ssi C est cocomplète et a une catégorie small dense;
  c'est le cas si C est loc. présentable.
- Any cocomplete and epi-cocomplete category with a (small set) generator
  is total.

Les catégories suivantes sont totales:
- any reflective subcategory of a total category
- any category which is monadic over Set (or admit a topological functor to Set)
- les catégories de faisceaux (elles sont totales et cototales)

Catégorie de préfaisceaux: A subcategory of a category of presheaves [A^{op}, Set] which is both reflective and coreflective is itself a category of presheaves [B^{op}, Set], and the inclusion is induced by a functor A→B.

* Sheaf topos
Giraud's axioms: Grothendieck toposes =
- a locally small category with a small generating set,
- with all finite limits,
- with all small coproducts, which are disjoint, and pullback-stable,
- where all congruences have effective quotient objects, which are also pullback-stable.
= locally small regular category with effective equivalence relations and disjoint and pullback-stable coproducts admitting a small separator (which will be dense)
= a locally small infinitary pretopos with a small generating set
= a lex total category with a small set of generators.

* Diaconescu theorem
- Si f: E->V est géométrique, C catégorie interne à V, alors [E, V^C]_V =~ {internal presheaves on f^*C which are flat}
  ie Topos(ℰ,PSh(C))≃FlatFunc(C,ℰ): any presheaf topos is the classifying topos for internally flat functors on its site.
- If C is moreover itself a small site, then geometric morphisms E→Sh(C)
  correspond to internally/covering flat functors which are also
  cover-preserving [https://golem.ph.utexas.edu/category/2011/06/flat_functors_and_morphisms_of.html]

Lien avec les catégories finiment accessibles et présentables: (<=>)
(i) M finitely accessible category
(ii) M is equivalent to Pts(PSh(C))=FlatFunc(C, Set), the category of points of some presheaf topos
(iii) M is equivalent to the free filtered cocompletion (also known as Ind-C) ofa small category C.
(iv) M is equivalent to Mod(T) for *some* geometric theory of presheaf type.
[C=la catégorie des objets finiment présentés]
Et (<=>)
(i) M finiment présentable
(ii) M is equivalent to Pts(PSh(C))=Lex(C,Set) où C est finiment complète 
(iii) M is equivalent to Ind-C, C finiment complète
(iv) M is equivalent to Mod(T) for a finite limit theory T.
[Attention: une théorie (finiment complète) est toujours de presheaf type,
par contre on peut avoir des théories géométriques T1 (ex: les corps) dont
les modèles dans Set coincident avec une théorie T2 de type presheaf sans
que T1 soit de type presheaf]

Pr:
- Flat(C) is the free filtered cocompletion of C and also obviously a category of models for the geometric theory of flat functors C→Set
- If C is a finitely complete category it is the syntactic site of an essentially algebraic (finite limit) theory 𝕋_C. An internally flat functor C→ℰ is then precisely a finite limit preserving functor, hence is precisely a 𝕋_C-model in ℰ.
Par Diaconescu: Topos(ℰ,PSh(C))≃𝕋_C Mod(ℰ)=Lex(C, Set)
Or par Gabriel-Ulmer: C ↦ Lex(C,Set) est une équivalence de catégorie entre les finitely complete categories et les categories loc. finiment présentables.
-> les topos classifiant d'une théorie T de limites finies sont précisément
les PSh(C) où C est finiment complète

* Adjoint functor theorems: F:C->D functor
- if C locally small and total, D locally small:
  F has a right adjoint iff it preserves all small colimits
- If C, D accessible:
  F has a left (resp. right) adjoint iff it is accessible and preserves all small limits (resp. colimits).
- If C, D locally presentable categories:
  - F has a right adjoint iff it preserves all small colimits
  - F has a left adjoint iff it is an accessible functor and preserves all small limits.
- If C, D sheaf toposes:
  - F has a right adjoint precisely if it preserves all small colimits;
  - F has a left adjoint precisely if it preserves all small limits.

Algèbres et algèbres commutatives
=================================

TODO: monoidal monads, cf les références

Références
----------

* https://ncatlab.org/nlab/show/commutative+monoid+in+a+symmetric+monoidal+category
  - Categorical properties of commutative monoid objects in symmetric monoidal categories are spelled out in sections 1.2 and 1.3 of Florian Marty, Des Ouverts Zariski et des Morphismes Lisses en Géométrie Relative, Ph.D. Thesis, 2009, web
  - A summary is in section 4.1 of Martin Brandenburg, Tensor categorical foundations of algebraic geometry, arXiv:1410.1716.
    https://arxiv.org/pdf/1410.1716.pdf
  - These references are also given in the nlab link at bottom: https://mathoverflow.net/questions/180673/category-of-modules-over-commutative-monoid-in-symmetric-monoidal-category
* https://mathoverflow.net/questions/146561/two-definitions-of-modules-in-monoidal-category?rq=1
  Preuve qu'on peut se donner un A-module V via soit A⊗V→V, soit A→[V,V]
* https://arxiv.org/abs/1205.0101, Tensors, monads and actions, Gavin J. Seal
    We exhibit sufficient conditions for a monoidal monad T on a monoidal
    category C to induce a monoidal structure on the Eilenberg--Moore
    category C^T that represents bimorphisms. The category of actions in
    C^T is then shown to be monadic over the base category C.
* This look like a very nice summary:
  http://zll22.user.srcf.net/writing/algebraic-theories/20121121-Main.pdf
  Algebraic eories, Z.L. Low, from https://mathoverflow.net/questions/114703/why-does-tensor-product-in-abv-require-colimits-in-v

Résumé:
- dans une catégorie monoïdale symmétrique 'admissible' 
  [voir 'categories of monoids'] (C,x) on peut voir un objet en
  monoïde comme une algèbre pour la monade monoïde libre (A->\sum A^n) [C
  étant admissible, elle a les coproduits dénombrables].
- la catégorie Mon_C des monoïdes reste monoïdale symmétrique; un objet en
  monoïde dedans est un monoïde commutatif.
  Note: il faut que x soit symmétrique pour que AxB reste un objet en
  monoïde si A et B le sont.
- la catégorie cMon_C des monoïdes commutatifs est monoïdale symmétrique
  (et les foncteurs cMon_C -> Mon_C et cMon_C -> C sont monadiques);
  le produit tensoriel est alors un produit cartésien.
- Si M est un objet en monoïde, on a la catégorie des modules (à gauche ou
  à droite) sous M, qui est monadique via le foncteur module libre: X->M x X
- Si M est un monoïde commutatif, on a un produit tensoriel sur les
  M-modules comme le coéqualisateur de AxMxB⇉AxB.
  M-Mod est alors monoïdale symmétrique.
  Note: on a besoin que M soit commutatif pour que Ax_M B soit un M-module.
- on peut regarder les bimorphismes dans cMon_c (ie les morphismes AxB->C
  bilinéaires, c'est à dire les morphismes induits A->AxB->C et B->AxB->C
  via l'unité sont linéaires); on obtient un produit
  tensoriel ⊗, défini (dans le cadre d'une monade monoïdale) par le
  coéqualisateur T(TAxTB)=>T(AxB)->A⊗B
On peut donc recommencer, dans la catégorie monoidale symmétrique (cMon_C,⊗):
- un objet en monoïde pour ⊗ est un anneau R
- on a la notion de module pour R. M->R⊗M est le foncteur module libre.
- Si R est commutatif, on a
  le coéq A⊗R⊗B⇉A⊗B->A⊗_R B qui donne un produit tensoriel sur R-Mod
- une algèbre dans R-Mod est une R-algèbre, se donner une R-algèbre S c'est
  la même chose que se donner un anneau S et un morphisme R->Z(S);
  en particulier une R-algèbre commutative S c'est pareil qu'un anneau
  commutative et une application R->S.

Tensor product
--------------

* https://ncatlab.org/nlab/show/tensor+product
The tensor product of modules A⊗_R B B of R-modules A and B can be constructed as the quotient of the tensor product of abelian groups A⊗B underlying them by the action of R: ie as the coeq of A⊗R⊗B⇉A⊗B
If R is a monoid in any monoidal category, we can define the tensor product of a left and a right R-module in an analogous way. If R is a commutative monoid in a symmetric monoidal category, so that left and right R-modules coincide, then A⊗_RB is again an R-module, while if R is not commutative then A⊗_RB will no longer be an R-module of any sort.
The tensor product of left and right modules over a noncommutative monoid in a monoidal category is a special case of the tensor product of modules for a monad in a bicategory.

* https://ncatlab.org/nlab/show/copower
Let V be a closed monoidal category. In a V-enriched category C, the copower of an object x∈C by an object k∈V is an object k⊙x∈C with a natural isomorphism
C(k⊙x,y)≅V(k,C(x,y))
In the V-category V, the copower is just the tensor product of V.

Exemple: si V=Set, on a S⊗b:=∐_s∈S b.

Internal Hom
------------

* https://ncatlab.org/toddtrimble/published/Closed+structure+on+modules+over+a+commutative+monoid

Si R monoïde, M, N des R-modules à gauche,
on peut construire le Hom internet [M,N]_R comme R-module comme étant
l'équalisateur de [M,N]=>[R⊗M,N]

Algèbre commutative
-------------------

* https://ncatlab.org/nlab/show/commutative+algebraic+theory
Definition. T is a commutative monad if there is an equality between two maps
α=β:TA×TB → T(A×B)

- Abstract formulation
The category Th of Lawvere theories is endowed with a symmetric monoidal product (called Kronecker product) ⊗:Th×Th→Th
whereby (S⊗T)-algebras are S-algebras internal to T-algebras, or equally well T-algebras internal to S-algebras. A commutative theory is tantamount to a commutative monoid in the symmetric monoidal category Th.
If S and T are commutative theories, then their coproduct in the category of commutative theories is S⊗T.

- Commutative theory as monoidal monad:
commutative Lawvere theories on Set are precisely the same things as (finitary) symmetric monoidal monad structures on (Set,×).

- The category of algebras for a commutative algebraic theory is canonically a closed symmetric monoidal category:
An algebraic theory is commutative iff its operations are algebra
homomorphisms, so Hom(A,B) is enriched as a model of the algebraic theory,
and we have a closed category of models and homorphisms. Furthermore, this
internal Hom has a left adjoint ⊗ for which the free model on one
generator is a unit, so we have a closed symmetric monoidal category.
A⊗B is the following coequalizer in Alg_T:
  T(TA×TB) →^Tα TT(A×B) 
   T(ξ_A×ξ_B)↘    ↓ m
                T(A×B) → A⊗B

Voir aussi https://mathoverflow.net/questions/75921/what-is-the-tensor-product-for-the-eilenberg-moore-category-of-a-commutative-mon/75929#75929
pour la généralisation de × à un tenseur ⊗ dans C:
  Caveat: this construction only works if your category of algebras has coequalizers of reflexive pairs, i.e. coequalizers of parallel pairs of arrows with a common right inverse.
  Let T:C→C be your monad. Being commutative, it comes with maps dst:T(A)⊗T(B)→T(A⊗B). Let ϕ:TA→A and ψ:TB→B be algebras. Then ϕ⊗ψ is the coequalizer in Alg(T) of T(ϕ⊗ψ) and μ∘T(dst) (which is a reflexive pair of morphisms from the free algebra on T(A)⊗T(B) to the free algebra on A⊗B). The unit I in Alg(T) is the free algebra μ:T2(I)→T(I). Moreover, the free functor C→Alg(T) preserves monoidal structure.

* https://ncatlab.org/nlab/show/monoidal+monad
A monoidal monad is a monad in the 2-category of monoidal categories, lax monoidal functors, and monoidal transformations.

Let V be a monoidal category. We say a functor T:V→V is strong if there are given left and right tensorial strengths
τ_A,B:A⊗T(B)→T(A⊗B), σ_A,B:T(A)⊗B→T(A⊗B)
which are suitably compatible with one another. The full set of coherence conditions may be summarized by saying T preserves the two-sided monoidal action of V on itself.
If V is symmetric monoidal, we will assume that the left and right strengths τ and σ are related by the symmetry in the obvious way.
A strong monad is a commutative monad if α=β:TA×TB → T(A×B)

Let T be a monoidal monad, with structural constraints on the underlying functor denoted by α_A,B:T(A)⊗T(B)→T(A⊗B),ι=uI:I→T(I).
This induces strengths on both the left and the right, which makes T a commutative monad; in fact α=β=α_A,B

Anneaux
-------

https://ncatlab.org/nlab/show/ring
https://ncatlab.org/nlab/show/ring+object
https://ncatlab.org/nlab/show/scheme

La catégorie des anneaux c'est:
- les modèles d'une théorie (finiment) algébrique
  (au sens logique ou au sens catégorique)
  en particulier c'est les modèles d'un sketch, donc c'est loc de prés fini
- l'algèbre d'Eilenberg-Moore sur Set donné par le foncteur G=anneau libre
  (très lié à la précédente présentation); en particulier Ring est
  monadique sur Set (qui est total), donc Ring est total.
  En fait Set et loc de prés fini et G est accessible, donc on retrouve que
  Ring est loc de prés fini.
  Le foncteur G est la composée de deux foncteurs monoides libres (pour +
  et x) qui intéragissent bien entre eux.
- la catégorie des modules sur la catégorie monoidale des groupes abéliens
  muni du produit tensoriel; un groupe abélien étant un groupe commutatif
  dans la catégorie monoidale Set.

Un anneau, c'est aussi une Ab-catégorie avec un objet, ou encore une monade
sur Ab qui est cocomplète.

Rem: plus généralement on a le lien entre sketches et algèbres d'une monade
suivant: modèles des sketchs = cat loc de prés finie = accessible reflective subcategories of presheaves; donc en particulier une catégorie d'algèbre pour la monade idempotente donnée par la réflexion; réciproquement une monade accessible sur une cat. loc présentable (comme Set) donne une algèbre loc présentable.

* https://arxiv.org/pdf/0704.2030.pdf
New Approach to Arakelov Geometry, Nikolai Durov

2-Catégories
============

* https://ncatlab.org/nlab/show/stuff,+structure,+property
=> http://math.ucr.edu/home/baez/qg-spring2004/discussion.html

Lower categories
----------------

* Negative thinking
https://ncatlab.org/nlab/show/negative%20thinking

- a (0,1)-category is (up to equivalence) a poset or (up to isomorphism) a proset
  a (0,1)-site: a posite
  a (0,1)-topos: a Heyting algebra
  a Grothendieck (0,1)-topos: a frame or locale.
  a (0,1)-category which is also a groupoid (that is, every morphism is an isomorphism) is a (0,0)-category (which may think of as either a 0-category or as a 0-groupoid), which is the same as a set (up to equivalence) or a setoid (up to isomorphism).
- a 0-category is a set (up to equivalence)
- A (−1)-category is a truth value = 0-poset = 0-groupoid
  https://ncatlab.org/nlab/show/%28-1%29-category
  If we equip the category of (-1)-categories with the monoidal structure of conjunction (the logical AND operation), then a category enriched over this is a poset; an enriched groupoid is a setoid
- (-2)-category: the truth value True

* https://ncatlab.org/nlab/show/periodic+table
- k-tuply 0-category: set, monoid, abelian monoid
- k-tuply 1-category: category, monoidal category, braided monoidal category, symmetric monoidal category

* https://ncatlab.org/nlab/show/stabilization+hypothesis
an (m+2)-tuply monoidal (m,n)(m,n)-category is maximally monoidal.

* https://ncatlab.org/nlab/show/delooping+hypothesis

k-tuply monoidal n-categories can be identified with (k−j)-tuply monoidal, (j-1)-simply connected (n+j)-categories, for any 0≤j≤k.
=> k=j: k-tuply monoidal n-categories can be identified with pointed (k−1)-connected (n+k)-categories.

Here j-(simply) connected means that any two parallel i-morphisms are equivalent for i≤j. Also, 0-tuply monoidal is interpreted as meaning pointed.

The identification involves a degree shift: the i-morphisms of a k-tuply monoidal n-category become (i+j)-morphisms in the associated (k−j)-tuply monoidal (n+j)-category.

* https://ncatlab.org/nlab/show/k-tuply+monoidal+n-category

A k-tuply monoidal n-category is an n-category in which objects can be multiplied in k different ways, all of which interchange with each other up to equivalence. By the Eckmann-Hilton argument, this implies that these k ways all end up being equivalent, but that the single resulting operation is more and more commutative as k increases. The stabilization hypothesis states that by the time we reach k=n+2, the multiplication has become “maximally commutative.”

- 1-tuply monoidal n-category may be called simply a monoidal n-category
- A doubly monoidal n-category is a braided monoidal n-category
- A symmetric monoidal n-category is an k-tuply monoidal n-category for k≥n+2

Strings
-------

* http://en.wikipedia.org/wiki/String_diagram

The idea is to represent structures of dimension d by structures of dimension 2-d, using the Poincaré duality. Thus,
- an object is represented by a portion of plane,
- a 1-cell f:A\to B is represented by a vertical segment — called a string — separating the plane in two (the left part corresponding to A and the right one to B),
- a 2-cell \alpha:f\Rightarrow g:A\to B is represented by an intersection of strings (the strings corresponding to f above the link, the strings corresponding to g below the link).

Rem: Monoidal categories can also be pictured this way since a strict monoidal category can be seen as a 2-category with only one object (there will therefore be only one type of plane) and Mac Lane's strictness theorem states that any monoidal category is monoidally equivalent to a strict one. 
[Pour Mac Lane's strictness theorem, cf
http://ncatlab.org/nlab/show/monoidal+category]

En effet, si C est une cat monoïdale, on forme une 2-catégorie en prenant
pour 0-obj un unique objet; pour 1-objet les objets de C, avec la
composition donnée par le produit tensoriel, et pour 2-objets les
morphismes de C.

On obtient donc:
* http://ncatlab.org/nlab/show/string+diagram
  String diagrams are a graphical calculus for expressing operations in a monoidal category. The idea is roughly to think of objects in a monoidal category as “strings” and a morphism from one tensor product to another as a node which the source strings enter and the target strings exit. Further structure on the monoidal category is encoded in geometrical properties on these strings. For instance
  - putting strings next to each other denotes the monoidal product, and having no string at all denotes the unit;
  - braiding strings over each other corresponds to – yes, the braiding (if any);
  - bending strings around corresponds to dualities on dualizable objects (if any).

* Références:
  https://qchu.wordpress.com/2012/11/05/introduction-to-string-diagrams/
  https://qchu.wordpress.com/2012/11/06/string-diagrams-duality-and-trace/
  https://jvns.ca/blog/2019/03/26/what-are-monoidal-categories/
  https://threadreaderapp.com/thread/1109474342822244353.html
  https://arxiv.org/abs/1305.0297 The operad of wiring diagrams: formalizing a graphical language for databases, recursion, and plug-and-play circuits, David I. Spivak

Functors
--------

* https://ncatlab.org/nlab/show/lax+morphism
a lax morphism f:A→B is one which “preserves” the algebraic structure only up to a not-necessarily invertible transformation
Let T be a 2-monad on a 2-category K, and let A and B be (strict, pseudo, or ever lax or colax) T-algebras. A lax T-morphism f:A→B is a morphism in K
together with a 2-cell
 TA →Tf TB 
a↓   ⇙  ↓ b 
 A →f   B
Ex: - A lax monoidal functor is a lax morphism for the 2-monad on Cat whose algebras are monoidal categories. Similarly, an oplax monoidal functor is a colax morphism for this 2-monad.
- A lax functor between 2-categories is a lax morphism for the 2-monad on Cat-graphs whose algebras are 2-categories.

* https://ncatlab.org/nlab/show/monoidal+functor
μ_x,y:F(x)⊗_𝒟F(y)⟶F(x⊗_𝒞y)
Lax monoidal functors send monoids to monoid

* https://ncatlab.org/nlab/show/lax+functor
  https://ncatlab.org/nlab/show/pseudofunctor
A lax functor or lax n-functor is a morphism of n-categories that is allowed to have structural cells – compositors, associators, etc – that need not be invertible (not even weakly).
This is to distinguish from pseudofunctor for which all these cells are required to be equivalences.

∞-categories
============

* ∞-categories
https://golem.ph.utexas.edu/category/2010/02/intrinsic_naturalness.html
- All this is clarified now. Now with HTT an entirely intrinsic, abstract, pure higher category theory definition of ∞-stack has been given: a Grothendieck (∞,1)-topos of ∞-stacks is a reflective ∞-subcategory of an (∞,1)-presheaf category
Sh_(∞,1)(C)↪←lex PSh_(∞,1)(C).
Every abstractly defined ∞-stack (∞,1)-topos Sh (∞,1)(C) has a generators-and-relation presentation by simplicial presheaves on C, and every such presentation presents an ∞-stack (∞,1)-topos

- In every (∞,1)-category C with a 0-object, there are two god- given operations: the formation of loop space objects and that of suspension objects
Ω:C→≃←C:Σ.
These are nothing but the pullback and pushforward along itself of the inclusion of the zero object into any other object. An (∞,1)-category is stable if it is stable under these operations: if Ω and Σ exhibit an auto-equivalence.
Decatégorifier => triangulated category

- The simple central idea is that a concrete generalized space is an (∞,1)-topos equipped with a structure sheaf 𝒪, modeled as an ∞-stack-valued ∞-copreshaef on the ∞-category 𝒢 of spaces on which the geometry is modeled
𝒪:𝒢→Sh_(∞,1)(X).
And as shown there, by making concrete choices for that category of test spaces and then turning the crank, the abstract formalism spits out first standard algebraic geoemtry, then algebraic stack theory, then differential geometry, then derived differential geometry, derived E_∞-spectral geometry and everything else.

* Structured spaces:
  https://ncatlab.org/nlab/show/structured+(infinity%2C1)-topos
  https://ncatlab.org/nlab/show/space#NotionsOfSpace

* ∞-topos

- https://golem.ph.utexas.edu/category/2018/06/atomic_geometric_morphisms.html
  - (open geometric morphisms) and C3.3 (locally connected geometric morphisms) are steps n=−1 and n=0 on an infinite ladder of locally n-connected geometric morphisms. A geometric morphism between (n+1,1)-toposes is locally nn-connected if its inverse image functor is locally cartesian closed and has a left adjoint
  - ∞-atomic morphism = ∞-étale morphism (ie local homéo)?
  1LH⇒2LH⇒⋯⇒∞LH ⇒ <=? ∞Atom ⇒⋯⇒2Atom⇒1Atom

* ∞-stacks
- https://perso.math.univ-toulouse.fr/btoen/files/2015/02/msri2002.pdf
  Stacks and non-abelian cohomoloy
  Toen

# Logique

Fondements
----------

* Fondements logiques
https://ncatlab.org/nlab/show/size+issues
https://ncatlab.org/nlab/show/Grothendieck+universe
https://ncatlab.org/nlab/show/foundation+of+mathematics
https://ncatlab.org/michaelshulman/show/category+of+all+sets
https://arxiv.org/pdf/0810.1279.pdf SET THEORY FOR CATEGORY THEORY, MICHAEL A. SHULMAN
ECTS: https://ncatlab.org/nlab/show/Trimble+on+ETCS+I


Type de logique
---------------

Excluded middle:
https://ncatlab.org/nlab/show/principle+of+omniscience

Sequent calculus:
https://ncatlab.org/nlab/show/sequent+calculus

Modal logic:
https://ncatlab.org/nlab/show/modal+logic

* Horn clauses
https://en.wikipedia.org/wiki/Horn_clause

* Linear logic
- https://hal.archives-ouvertes.fr/hal-00154229/document
Categorical models of linear logic revisited Paul-André Melliès
Book: Categorical Semantics of Linear Logic
https://www.irif.fr/~mellies/mpri/mpri-ens/biblio/categorical-semantics-of-linear-logic.pdf
=> *-autonomous categories

- http://www.madore.org/~david/weblog/d.2019-01-13.2578.html#d.2019-01-13.2578 Et maintenant, un peu de logique linéaire

- LINEAR  LOGIC  FOR  CONSTRUCTIVE  MATHEMATICS, MICHAEL SHULMAN
  https://arxiv.org/pdf/1805.07518.pdf
  Slides: https://home.sandiego.edu/~shulman/papers/lcm-bloomington-talk.pdf

- https://www.college-de-france.fr/media/xavier-leroy/UPL1878795019259660262_Tasson.pdf
  Sémantique des programmes fonctionnels probabilistes à la lumière de la logique linéaire
  => Lien avec les ECP, espaces cohérents probabilistes
  et donc avec les algo probabilistes (en gros les matrices stochastiques
  forment une catégorie monoidale symétrique, donc on peut appliquer de la
  logique linéaire)

- https://cs.stackexchange.com/questions/48672/what-is-the-curry-howard-analogue-for-linear-logics
  Linear logic corresponds to a type system for a process calculus (a variant of the internal π-calculus), where:
  - proofs correspond to processes;
  - propositions correspond to session types (communication protocols).

- https://www.irif.fr/~mellies/papers/Mellies20submitted.pdf
  A Functorial Excursion BetweenAlgebraic Geometry and Linear Logic, Paul-André Melliès
  The purpose of this work is to establish on firmmathematical foundations the idea that linear logic shouldbe understood as a logic of generalised vector bundles, inthe same way as dependent type theory is understood todayas a logic of spaces up to homotopy.
  Related: https://ncatlab.org/nlab/show/indexed+monoidal+%28infinity%2C1%29-category

Types
-----

HoTT: https://ncatlab.org/nlab/show/mathematics+presented+in+homotopy+type+theory
https://en.wikipedia.org/wiki/Univalent_foundations
https://en.wikipedia.org/wiki/Homotopy_type_theory

- https://www.college-de-france.fr/site/xavier-leroy/course-2019-01-23-10h00.htm
Qu'est-ce que l'égalité ? De Leibniz à la théorie homotopique des types
- https://www.college-de-france.fr/site/xavier-leroy/seminar-2019-01-16-11h30.htm
  Réalisabilité et forcing, Alexandre Miquel

- https://arxiv.org/abs/1703.03007
Homotopy type theory: the logic of space
Michael Shulman
    This is an introduction to type theory, synthetic topology, and homotopy type theory from a category-theoretic and topological point of view, written as a chapter for the book "New Spaces for Mathematics and Physics" (ed. Gabriel Catren and Mathieu Anel).

- https://arxiv.org/abs/1803.02294
A self-contained, brief and complete formulation of Voevodsky's Univalence Axiom
Martín Hötzel Escardó

- http://www.ams.org/journals/bull/2018-55-04/S0273-0979-2018-01616-9/
  An introduction to univalent foundations for mathematicians
  Author: Daniel R. Grayson

Syntaxe et semantique
---------------------

* Syntactic categories
https://ncatlab.org/nlab/show/theory
https://ncatlab.org/nlab/show/internal+logic
https://ncatlab.org/nlab/show/syntactic+category
https://ncatlab.org/nlab/show/type+theory
https://ncatlab.org/nlab/show/relation+between+type+theory+and+category+theory

https://ncatlab.org/nlab/show/hyperdoctrine
= an axiomatization of the collection of slices of a locally cartesian closed category (or something similar): a category T together with a functorial assignment of “slice-like”-categories to each of its objects

Specifically, a hyperdoctrine on a category T for a given notion of logic L is a functor P:T^op→C to some 2-category (or even higher category) C, whose objects are categories whose internal logic corresponds to L. Thus, each object A of T is assigned an “L-logic” (the internal logic of P(A)).

https://ncatlab.org/nlab/show/categorical+semantics
https://ncatlab.org/nlab/show/computational+trinitarianism

Logique interne
---------------

* Logique interne

Exemple: dans une catégorie régulière, on a
f: X->Y est un épi ssi "pour tout y\in Y \exist x\in X/f(x)=y" est vrai en
logique interne.

- http://www.staff.science.uu.nl/~ooste110/syllabi/catsmoeder.pdf#page=30
Basic Category Theory, Section A little piece of categorical logic on
regular logic; https://ncatlab.org/nlab/show/regular+logic
(logical operations consist only of truth, conjunction, and existential quantification)

- https://arxiv.org/pdf/1305.3254.pdf
Dissertation: Classifying Topoi and Preservation of Higher Order Logic by Geometric Morphisms

*  Categorical Logic Cf http://www.math.harvard.edu/~lurie/278x.html

Theorem 12 (Makkai  Definability  Theorem)
Conditions for a "generic" subset of a model to come from a formula of the
theory

Theorem  13 (Strong  Conceptual  Completeness). Let T be  a  first-order theory and let Mod(T) be  the category of models of T(where the morphisms are given by elementary extensions).  Then T can be recovered,up to equivalence, from the structure of Mod(T) as a “category with ultraproducts.”

Theorem 15(Makkai). Let T be a first-order theory.  Then the syntactic category Syn(T)can be recovered from the category of models Mod(T).  More precisely, there is a canonical equivalence Syn(T)=~UFun(Mod(T),Set) where UFun(Mod(T),Set) denotes  the  category  of  “ultrafunctors”  from Mod(T) to Set:   that  is,  functors which are compatible with ultraproducts

{Propositional Theories} = {Boolean Algebras} = {Stone Spaces}
{(Classical) First-Order Theories}              {Hausdorff Spaces}
{Pretopoi}                                      {Sober Topological Spaces}
{Coherent Topoi}       -> {Topoi} <-            {Spatial Topoi}.

Synthetic and cohesion
----------------------

https://ncatlab.org/nlab/show/synthetic+mathematics

* Synthetic Topology:
https://ncatlab.org/nlab/show/synthetic+topology
https://ncatlab.org/nlab/show/abstract+Stone+duality
=> https://golem.ph.utexas.edu/category/2009/01/abstract_stone_duality.html
=> http://www.paultaylor.eu/ASD/
https://ncatlab.org/nlab/show/Johnstone%27s+topological+topos
=> https://golem.ph.utexas.edu/category/2014/04/on_a_topological_topos.html

Theorem [Δ^op,Set] is the classifying topos for intervals in Set-toposes.
The closed unit interval [0,1] is sequential and is in fact an interval (a totally ordered object with distinct top and bottom elements). Thus it corresponds to a geometric morphism ℰ→[Δ op,Set] (an adjunction (f^⋆⊣f_⋆) with f^⋆ left-exact). [E=topological topos]
Theorem If S∈[Δ op,Set] is a simplicial set, then f^⋆(S) is its geometric realization, considered as a sequential space and hence as an object of ℰ. If X∈ℰ is a sequential space, then f_⋆(E) is its singular complex.

* Domain theory
https://ncatlab.org/nlab/show/domain+theory
= denotational semantics for certain theories of computability (such as the untyped lambda calculus)
Refs: Domain theory and general relativity, Keye Martin and Prakash Panangaden
https://ncatlab.org/nlab/show/synthetic+domain+theory

* Geometry
https://ncatlab.org/nlab/show/synthetic+geometry
https://ncatlab.org/nlab/show/synthetic+projective+geometry

* Differential geometry
https://ncatlab.org/nlab/show/synthetic+differential+geometry

* Algebraic geometry
https://mathoverflow.net/questions/606/synthetic-reasoning-applied-to-algebraic-geometry
https://ncatlab.org/nlab/show/synthetic+differential+geometry+applied+to+algebraic+geometry
https://ncatlab.org/schreiber/show/%E2%88%9E-vector+bundle => quasi coherent vector bundle

* Measure and non standard analysis:
https://www.andrew.cmu.edu/user/awodey/students/jackson.pdf
M. Jackson. “A sheaf theoretic approach to measure theory”
https://terrytao.wordpress.com/2012/04/02/a-cheap-version-of-nonstandard-analysis/
https://terrytao.wordpress.com/2014/07/15/real-analysis-relative-to-a-finite-measure-space/

* Cohesion

https://ncatlab.org/nlab/show/cohesive
https://ncatlab.org/nlab/show/motivation+for+cohesive+toposes
https://ncatlab.org/nlab/show/cohesive+topos
cohesive topos = strongly connected topos and a local topos.
<=> quadruple of adjoint functor f_! f^* f_* f^! such that f_! preserves finite products.
https://ncatlab.org/nlab/show/cohesive+site
https://ncatlab.org/nlab/show/cohesive+%28infinity%2C1%29-topos
https://ncatlab.org/nlab/show/cohesive+homotopy+type+theory
https://ncatlab.org/nlab/show/infinity-cohesive+site
https://ncatlab.org/nlab/show/differential+cohesive+%28infinity%2C1%29-topos

Ncafe
-----

* Logique interne:
- https://golem.ph.utexas.edu/category/2011/06/flat_functors_and_morphisms_of.html
 [=> discussions sur la logique interne]
- https://golem.ph.utexas.edu/category/2010/03/stack_semantics.html
 [=> avoir des quantificateurs non bornés]
  pour https://ncatlab.org/michaelshulman/show/stack+semantics
  et les exposés de Mike Shulman: https://home.sandiego.edu/~shulman/papers/index.html

* Logique infinie:
- https://golem.ph.utexas.edu/category/2010/02/infinity_1logic.html
  I prefer to distinguish between the internal type theory of a category and the internal logic which sits on top of that type theory. The type theory is about constructing objects, while the logic is about constructing subobjects. For instance, limits and colimits, exponentials, and object classifiers belong to the type theory, while images, dual images, intersections, unions, and subobject classifiers belong to the logic.
  => cf https://ncatlab.org/michaelshulman/show/categorified+logic
- https://golem.ph.utexas.edu/category/2011/11/internalizing_the_external_or.html
  Internalizing the External, or The Joys of Codiscreteness
  axiomatizing cohesive (∞,1)-toposes in homotopy type theory
- https://golem.ph.utexas.edu/category/2018/04/what_is_an_ntheory.html
- https://golem.ph.utexas.edu/category/2018/09/a_communal_proof_of_an_initial.html
  A Communal Proof of an Initiality Theorem

* Linear logic
- https://golem.ph.utexas.edu/category/2018/05/linear_logic_for_constructive.html
- https://golem.ph.utexas.edu/category/2017/11/the_2chu_construction.html

* Divers:
- https://golem.ph.utexas.edu/category/2011/02/tarskis_two_approaches_to_moda.html#c036899
  [ionads: https://ncatlab.org/nlab/show/ionad]

- https://golem.ph.utexas.edu/category/2007/10/concrete_groups_and_axiomatic.html
  [Contient des discussions intéressantes sur la condition de
  Beck-Chevalley et son application au changement de base en cohomologie
  étale, ainsi que sur l'isomorphisme de Frobenius]

  https://golem.ph.utexas.edu/category/2007/11/concrete_groups_and_axiomatic_1.html
  Theorem. Let X be a finite set. There is a Galois correspondence (a bijective correspondence) between
  - (Complete) theories of structures on X, i.e., subtheories of P(X^*)
  - Groups of transformations of X, i.e., subgroups G⊆X!=Aut(X)

* Philo:
- http://math.ucr.edu/home/baez/corfield/Towards.htm#impcon

# Topologie et Homotopy

https://ncatlab.org/nlab/show/Introduction+to+Homotopy+Theory
https://ncatlab.org/nlab/show/Introduction+to+Stable+Homotopy+Theory

* https://ncatlab.org/nlab/show/nerve
Definition 3.2. For 𝒞 a small category, def. 3.1, its simplicial nerve N(𝒞)• is the simplicial set with N(𝒞)_n≔𝒞_1 ×^{𝒞_0^n} the set of sequences of composable morphisms of length n.

* https://ncatlab.org/nlab/show/model+category
A model category (sometimes called a Quillen model category or a closed model category, but not related to “closed category”) is a context for doing homotopy theory. Quillen developed the definition of a model category to formalize the similarities between homotopy theory and homological algebra: the key examples which motivated his definition were the category of topological spaces, the category of simplicial sets, and the category of chain complexes.
So, what is a model category? For starters, it is a category equipped with three classes of morphisms, each closed under composition and called weak equivalences, fibrations and cofibrations

* https://ncatlab.org/nlab/show/Dold-Kan+correspondence
The Dold–Kan correspondence asserts there is an equivalence of categories between abelian simplicial groups and connective chain complexes of abelian groups.

Theorem (Dold–Puppe) 2.1. For A an abelian category there is an equivalence of categories N: A^Δ^op →← Ch•+(A) :Γ between
  - the category of simplicial objects in A;
  - the category of connective chain complexes in A;

Quillen equivalence of model categories

Both Ch•+(A) and A^Δop are categories with weak equivalences in an standard way:
  - the weak equivalences of simplicial abelian groups are the weak homotopy equivalences of the underlying Kan complexes, hence morphisms that induces isomorphisms on all simplicial homotopy group;
  - the weak equivalences of chain complexes are the quasi-isomorphisms: the morphisms that induces isomorphisms on all chain homology groups.

Proposition 2.6. These functors N and Γ both respect all weak equivalences with respect to the standard model structure on simplicial sets and on chain complexes in that they induce isomorphisms between simplicial homotopy groups and homology groups.

The structures of categories with weak equivalences have standard refinements to model category structures:
  - the projective model structure on chain complexes Ch• has as fibrations the chain maps that are surjections in each positive degree;
  - the model structure on simplicial abelian groups has as fibrations those whose underlying morphisms in sSet are fibrations (Kan fibrations) with respect to the standard model structure on simplicial sets.

Proposition 2.7. Both (N⊣Γ) as well as (Γ⊣N) are Quillen equivalences with respect to these model structures. The above Quillen equivalence is even a simplicial Quillen adjunction.

* https://ncatlab.org/nlab/show/homotopy+hypothesis
The homotopy hypothesis is the assertion that
    ∞-groupoids are equivalent to topological spaces (considered modulo weak homotopy equivalence)
or rather the stronger statement that
    n-groupoids are equivalent to homotopy n-types for all extended natural numbers n∈ℕ
and moreover
    this equivalence is induced by the fundamental ∞-groupoid construction.

* https://ncatlab.org/nlab/show/Kan+complex
The notion of a Kan complex is an abstraction of the combinatorial structure found in the singular simplicial complex of a topological space.

https://ncatlab.org/nlab/show/algebraic+Kan+complex
The notion of algebraic Kan complex is an algebraic definition of ∞-groupoids.

It builds on the classical geometric definition of ∞-groupoids in terms of Kan complexes. A Kan complex is like an algebraic ∞-groupoid in which we have forgotten what precisely the composition operation and what the inverses are, and only know that they do exist. This becomes an algebraic model for ∞-groupoids by adding the specific choices of composites back in.

The category AlgKan is the category of algebras over a monad
sSet→←AlgsSet.
This means that algebraic Kan complexes are formally an algebraic model for higher categories.

* Bar resolution

- https://golem.ph.utexas.edu/category/2007/05/cohomology_and_computation_wee_4.html
Simplicial sets from algebraic gadgets. Algebraic gadgets and adjoint functors. The unit and counit of an adjunction: the unit ‘includes the generators’, while the counit ‘evaluates formal expressions’. The canonical presentation of an algebraic gadget. Simplicial objects from adjunctions: the bar construction. 1-simplices as proofs.

- https://golem.ph.utexas.edu/category/2007/05/on_the_bar_construction.html
  - the category Δ is the walking monoid
  - Δ^op is the “walking comonoid”. It’s nice to know by the way that Δ^op is equivalent to the category of finite intervals (i.e., finite totally ordered sets with a top and bottom, and maps which preserve the order and top and bottom)

With that, the bar construction is easy to construct. Let (M,m:M→M,u:1→M) be a monad on a category E. One has an adjunction
(F:E→E^M)⊣(U:E^M→E)
where E^M is the Eilenberg-Moore category of M-algebras. This in turn gives a comonad FU acting on M-algebras, that is to say, a comonoid in a monoidal category of endofunctors. Because Δ^op is the walking comonoid, there is a unique monoidal functor (the bar construction)
Bar_M:Δ^op→[E^M,E^M]
which sends the comonoid [1] in Δ^op to FU. Applying the functor which evaluates at an M-algebra X, one gets a simplicial M-algebra
B_M(X):Δ^op→E^M [... MMM X ≡> MMX => MX ->X]
and this is the bar construction applied to X.

What I want to talk about here is the conceptual sense in which the bar construction is a resolution of X, i.e., the acyclicity of the bar construction as a simplicial object. I also want to talk about the sense in which the bar construction on X is a universal M-free resolution of X.

- http://math.ucr.edu/home/baez/trimble/barconstructions.pdf

# GeoDiff

* Geo diff

https://ncatlab.org/nlab/show/embedding+of+smooth+manifolds+into+formal+duals+of+R-algebras
The functor C^∞(−):SmoothMfd⟶Alg ℝ^op which sends a smooth manifold (finite dimensional, paracompact, second countable) to (the formal dual of) its ℝ-algebra of smooth functions is a full and faithful functor.
In other words, for two smooth manifolds X,Y there is a natural bijection between the smooth functions X→Y and the ℝ-algebra homomorphisms C^∞(X)←C^∞(Y).

Cas continu:
https://ncatlab.org/nlab/show/Gelfand-Kolmogorov+theorem
C(−,ℝ):Top cptHaus↪ℝ-Alg^op is a fully faithful functor.
It follows in particular that compact Hausdorff spaces X and Y are homeomorphic precisely if the algebras C(X,ℝ) and C(Y,ℝ) are isomorphic.

* Higher geo diff

https://ncatlab.org/nlab/show/Lie+groupoid
https://ncatlab.org/nlab/show/differentiable+stack

https://ncatlab.org/nlab/show/smooth+set
= sheaf on open subsets of the Euclidean spaces ℝ^n and whose morphisms are smooth maps between these.

https://ncatlab.org/nlab/show/diffeological+space
= concrete sheafs of smooth sets.
Références:
- https://arxiv.org/abs/0807.1704
  Convenient Categories of Smooth Spaces, John C. Baez, Alexander E. Hoffnung
  we show that Chen spaces, diffeological spaces, and even simplicial complexes are examples of "concrete sheaves on a concrete site".
- http://math.huji.ac.il/~piz/documents/AITD.pdf
  AN INTRODUCTION TO DIFFEOLOGY, PATRICK IGLESIAS-ZEMMOU

https://ncatlab.org/nlab/show/concrete+sheaf
https://ncatlab.org/nlab/show/distributions+are+the+smooth+linear+functionals

* synthetic differential geometry
https://ncatlab.org/nlab/show/synthetic+differential+geometry

https://pdfs.semanticscholar.org/801d/ca92068d15b68063374453541af8d016982e.pdf
Infinitesimal Models of Algebraic Theories

https://medium.com/@corba77/some-differentiable-programming-pitfalls-with-examples-in-python-google-jax-julia-zygote-f83c8c9f777b

## Connections (point de vue catégorique)

* https://ncatlab.org/nlab/show/vielbein
A vielbein or solder form on a manifold X is a linear identification of a tangent bundle with a vector bundle with explicit (pseudo-)orthogonal structure.
Any such choice encodes a (pseudo-)Riemannian metric on X.

* https://golem.ph.utexas.edu/category/2007/05/quantization_and_cohomology_we_22.html
Principal bundles. The transport groupoid Trans(P) of a principal G-bundle P over a smooth space M. Connections as smooth functors hol:PM→Trans(P)
where PM is the path groupoid of M. Proof that connections are described locally by smooth functors hol:PU→G where U is a neighborhood in M. Theorem: smooth functors hol:PU→G are in 1-1 correspondence with Lie(G)-valued 1-forms on U.

Commentaires:
- It is well known that a G-bundle on M without connection is the same as an extension
Ad(P)→Trans(P)→codisc(M) (note all of these groupoids have object space M.)

There is another exact sequence of groupoids with object space M:
ΛPM→PM→codisc(M) where ΛPM is the inertia groupoid of PM - consists of only the loops.

Then what John talks about above is essentially a map from the second exact sequence to the first. The map ΛPM→Ad(P) materialises by universality of the kernel, and I’m talking about the strict kernel here. This last map looks like holonomy to me, and I wonder if given just ΛPM→Ad(P) we can find PM→Trans(P): reconstruct the connection form from its holonomy, but using just what we have here.
=> one can only reconstruct the connection up to gauge equivalence, but this I suppose is what one expects - uniqueness up to a unique 2-arrow.

- Yes! We have talked about this before: this is the “exponentiated Atiyah sequence” of a principal bundle. It is more familiar to many people in its differentiated version, where it becomes the ordinary Atiyah sequence of Lie algebroids over TM: 0→ad P→TP/G→TM→0.

Once I summarized some cool facts related to this in n-Transport and Higher Schreier Theory.

And I very much like your (David’s) observation that from a transport
tra:P_1 X→Trans(P)
we actually get a morphism of sequences of groupoids
Ω_1(X) → P_1(X)   → X×X 
↓ hol  ↓ tra      ↓ 
Ad P   → Trans(P) → X×X.
Here Ω_1(X) is the skeletal groupoid which is the loop group based at xx over each point x∈X.

- The situation is this
transport functor→{choose smooth local structure} descent data→{nice repackaging} anafunctor
Here “transport functor” is defined to be a functor which admits at least one smooth local trivialization.
And the cool thing is: one shows that if a functor admits any one smooth local trivialization at all, then this is unique up to isomorphism.
A smooth anafunctor is a neat way of repackaging an entire object of the descent category in terms of a single functor.
The anafunctor is the universal morphism by which the chosen local trivialization of the global transport functor factors through the universal one.

* https://golem.ph.utexas.edu/category/2007/06/quantization_and_cohomology_we_23.html
Connections and smooth anafunctors: review and prospectus. Connections on the trivial principal G-bundle over M are smooth functors hol:PM→G; gauge transformations are smooth natural transformations between these. Connections on a fixed principal G-bundle P→M are smooth functors hol:PM→Trans(P); gauge transformations are smooth natural transformations between these. Connections on an arbitrary, or variable principal G-bundle over MM are smooth anafunctors hol:PM→G; gauge transformations are smooth ananatural transformations between these. The definition of smooth anafunctor.

* https://arxiv.org/pdf/0705.0452.pdf
Parallel Transport and Functors
Urs Schreiber and Konrad Waldor
Parallel transport of a connection in a smooth fibre bundle yields a
functor from the path groupoid of the base manifold into a category that
describes the fibres of the bundle. We characterize functors obtained
like this by two notions we introduce: local trivializations and smooth
descent data. This provides a way to substitute categories of functors for
categories of smooth fibre bundles with connect ion. We indicate that this
concept can be generalized to connections in categorified bundles, and
how this generalization improves the understanding of higher dimensional
parallel transport.


# GeoAlg


- https://ncatlab.org/toddtrimble/published/Notes+on+conversations+with+James+Dolan
The spaces (or generalized spaces, e.g., stacks) studied by algebraic geometers are invariably, and are usefully seen as, moduli spaces (or generalized moduli spaces) of models of some theory of some categorical doctrine.

- Zhen Lin Low: http://zll22.user.srcf.net/dpmms/
http://dx.doi.org/10.17863/CAM.384
PhD: Categories of spaces built from local models
http://zll22.user.srcf.net/dpmms/slides/2015-06-16-ChartedSpaces.pdf
Generalising the functor of points approach, Zhen Lin Low
http://zll22.user.srcf.net/dpmms/slides/2016-05-22-ChartedSpaces.pdf
Categories of spaces built from local models, Zhen Lin Low

- https://github.com/iblech/internal-methods
=> https://rawgit.com/iblech/internal-methods/master/notes.pdf
  Using the internal language of toposesin algebraic geometry, Ingo Blechschmidt
Notes on how to use the internal language of toposes in algebraic geometry
Also referenced from this discussion: https://mathoverflow.net/questions/164721/is-it-possible-for-a-theorem-to-be-constructive-only-in-a-non-constructive-metat


# Physique

https://ncatlab.org/nlab/show/model+theory+and+physics
https://ncatlab.org/nlab/show/higher+category+theory+and+physics
https://ncatlab.org/nlab/show/continuum+mechanics

https://ncatlab.org/nlab/show/geometry+of+physics
https://ncatlab.org/nlab/show/supersymmetry
https://ncatlab.org/nlab/show/geometry+of+physics+--+supergeometry
https://ncatlab.org/nlab/show/supergeometry

https://ncatlab.org/nlab/show/Wigner+classification
The identification of particle species with irreducible unitary representations of the symmetry group acting on matter fields over spacetime. Named after Eugene Wigner.

https://ncatlab.org/nlab/show/gauge+theory
A gauge theory may denote either a classical field theory or a quantum field theory whose field configurations are cocycles in differential cohomology (abelian or nonabelian).
An ordinary gauge theory is a quantum field theory whose field configurations are vector bundles with connection.
- Ordinary electromagnetism in the absence of magnetic charges is a gauge theory of U(1)-principal bundles with connection.
- Fields in Yang-Mills theory (such as appearing in the standard model of particle physics and in GUTs) are vector bundles with connection.

https://ncatlab.org/nlab/show/New+Spaces+for+Mathematics+and+Physics
Book: https://ercpqg-espace.sciencesconf.org/resource/page/id/1
Blog: https://golem.ph.utexas.edu/category/2017/03/the_logic_of_space.html

https://ncatlab.org/nlab/show/Bohr+topos
A Bohr topos is a topos associated with any quantum mechanical system, which is such that
  - the quantum observables and quantum states of the quantum mechanical system, hence its quantum probability theory,
are equivalently
  - the classical observables and classical states, hence its classical probability theory,
  - internal to the Bohr topos, hence in the internal logic of the Bohr topos.

# Combinatoire

* Species
https://ncatlab.org/nlab/show/species
https://harrisonbrown.wordpress.com/2009/06/30/category-theory-and-combinatorics/
https://topologicalmusings.wordpress.com/2009/03/28/number-of-idempotent-endofunctions/
Joyal, une théorie combinatoire des séries formelles (=species) https://core.ac.uk/download/pdf/82361055.pdf

* https://ncatlab.org/nlab/show/Lawvere%27s+fixed+point+theorem
Theorem 2.1. (Lawvere’s fixed-point theorem) In a cartesian closed category, if there is a point-surjective map ϕ:A→B, then every morphism f:B→B has a fixed point s:1→B (so that fs=s).

Proposition 2.4. (Cantor’s theorem in a topos) For any object X, there is an epimorphism f:X→Ω^X only if the topos is degenerate.

* https://ncatlab.org/nlab/show/fixed-point+combinator
Y-combinator: Y=λn.(λs.n(ss))(λs.n(ss)) => Yn=n(Yn)

* https://ncatlab.org/nlab/show/groupoid+cardinality
|X|=∑_[x]∈π_0(X) 1/|Aut(x)|

 ∞-groupoid X: |X|:=∑_{[x]∈π_0(X)} ∏_k=1^∞ |π_k(X,x)|^(−1^k)

# Computer Sciences
* Catégories monoïdales et complexité
https://cstheory.stackexchange.com/questions/3074/a-category-of-np-complete-problems => "implicit complexity theory"
> The basic technique is to relate complexity classes to subsystems of linear
> logic (the so-called "light linear logics"), with the idea that the
> cut-elimination for the logical system should be complete for the given
> complexity class (such as LOGSPACE, PTIME, etc). Then via Curry-Howard you
> get out a programming language in which precisely the programs in the given
> class are expressible. As you might expect from the mention of linear
> logic, these all these systems then give rise to monoidal closed categories
> of various flavors, which leaves you with a purely algebraic and
> machine-independent characterization of various complexity classes.

=> http://perso.ens-lyon.fr/olivier.laurent/cours/cr-icc.html

* Topos
https://ncatlab.org/nlab/show/realizability+topos
A realizability topos is a topos which embodies the realizability interpretation of intuitionistic number theory (due to Kleene) as part of its internal logic. Realizability toposes form an important class of elementary toposes that are not Grothendieck toposes, and don’t even have a geometric morphism to Set.

https://ncatlab.org/nlab/show/effective+topos
The effective topos Eff is an example of an elementary topos with a natural numbers object which is not a Grothendieck topos (and doesn’t even have a geometric morphism to Set).
It is an environment for higher order recursion theory, where, in the internal logic, it is provable that every total function from natural numbers to natural numbers is recursive (furthermore, the functor Hom(1,−) from the effective topos into Set, the inverse image part of a geometric morphism Set→Eff preserves the natural numbers object, giving a suitable version of this result in the external logic as well).
It can be specified as the realizability topos for Kleene's first algebra.

http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.136.4692&rep=rep1&type=pdf "TOPOI AND COMPUTATIONS", Andreas Blass

http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.95.3657&rep=rep1&type=pdf
First Steps in Synthetic Computability Theory, Andrej Bauer

# Probability
https://golem.ph.utexas.edu/category/2019/03/the_kantorovich_monad.html
References to probability monads:
Probability monads were introduced by Michèle Giry in her work A Categorical approach to probability theory

# Motivations et introductions

https://ncatlab.org/nlab/show/applications+of+%28higher%29+category+theory
https://ncatlab.org/nlab/show/motivation+for+sheaves%2C+cohomology+and+higher+stacks
https://ncatlab.org/nlab/show/motivation+for+higher+differential+geometry
https://ncatlab.org/nlab/show/motivation+for+cohesive+toposes

Ncafe
-----

https://golem.ph.utexas.edu/category/2011/12/the_eventual_image.html
Cf les commentaires de Joyal pour la tétralogie du compact

https://golem.ph.utexas.edu/category/2011/12/the_eventual_image_part_2.html
Propriété commune aux X ens fini/e.v. fini/métrique complact

