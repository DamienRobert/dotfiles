vim: foldmethod=expr ft=markdownlight

# Mathematical definition

- Monoidal category:
http://en.wikipedia.org/wiki/Monoidal_category
A monoidal category (or tensor category) is a category C equipped with a bifunctor ⊗ : C × C → C which is associative up to a natural isomorphism, and an object I which is both a left and right identity for ⊗, again up to a natural isomorphism.

- Braided and Symmetric Monoidal Category:
http://en.wikipedia.org/wiki/Braided_monoidal_category
http://en.wikipedia.org/wiki/Symmetric_monoidal_category
Braided: \gamma_A,B: A \tens B \iso B \tens A avec des conditions de commutativité de diagrammes
Symmetric: A braided monoidal category is called symmetric if \gamma also satisfies \gamma_{B,A} \circ \gamma_{A,B} = Id

- Monoid object:
http://en.wikipedia.org/wiki/Monoid_%28category_theory%29
In category theory, a monoid (or monoid object) (M, μ, η) in a monoidal category (C, ⊗, I) is an object M together with two morphisms
    μ: M ⊗ M → M called multiplication,
    η: I → M called unit,
tel que \mu soit associatif et I soit une unité (droite et gauche).
Suppose that the monoidal category C has a symmetry γ. A monoid M in C is symmetric when μ o γ = μ.

Examples:
- Any category with finite coproducts is monoidal with the coproduct as the monoidal product and the initial object as the unit. Such a monoidal category is called cocartesian monoidal
- Any category with finite products can be regarded as monoidal with the product as the monoidal product and the terminal object as the unit. Such a category is sometimes called a cartesian monoidal category. For example:
* Set, the category of sets with the Cartesian product, one-element sets serving as the unit.
-> A monoid object in Set is a monoid in the usual sense.
-> A monoid object in the category of monoids (with the direct product of monoids) is just a commutative monoid. This follows easily from the Eckmann–Hilton theorem.
* Cat, the bicategory of small categories with the product category, where the category with one object and only its identity map is the unit.
-> A monoid object in Cat is a strict monoidal category
- R-Mod, the category of modules over a commutative ring R, is a monoidal category with the tensor product of modules ⊗R serving as the monoidal product and the ring R (thought of as a module over itself) serving as the unit.
-> monoid=R-algebra.
- For any commutative ring R, the category of R-algebras is monoidal with the tensor product of algebras as the product and R as the unit.
- The category of all endofunctors on a category C is a strict monoidal category with the composition of functors as the product and the identity functor as the unit.
-> Monoid=monade
- Just like for any category E, the full subcategory spanned by any given object is a monoid, it is the case that for any 2-category E, and any object C∈Ob(E), the full 2-subcategory of E spanned by {C} is a monoidal category. In the case E=Cat, we get the endofunctors example above.
[terminologie: n-flêche=flêche entre n-objets, un n-objet étant une (n-1)-flêche. Dans une 1-catégorie, objet=1-objet=0-flêche et flêche=1-flêche=2-objets
La catégorie des catégories est une 2-catégorie ou
0-flêche: Catégorie; 1-flêche: Foncteurs; 2-flêche: transformation naturelle.
Dans une n-catégorie la restriction a un objet est une (n-1)-catégorie qui est un objet en monoïde pour la catégorie des (n-1)-catégorie.
On retrouve Hom(C,C)=monoide (ie monoide dans Set=0-CAT) et Hom_CAT(C,C)=catégorie monoidale]

Résumé: 
- on a une notion d'objet en monoïde dans une catégorie monoïdale
- une catégorie monoïdale stricte est un objet en monoïde dans CAT
- une monade est un objet en monoïde pour la catégorie monoïdale des endofoncteurs

[On a aussi une notion de catégorie close, ie une catégorie qui admet des
hom internes (qui doivent satisfaire certains diagramme). Dans une
catégorie monoïdale symmétrique, on définit plus simplement le hom interne
comme l'adjoint à droite du produit tensoriel:
http://ncatlab.org/nlab/show/closed+monoidal+category]

Monades
=======

Une monade est un endofoncteur muni d'une unité
\eta: 1->T et d'une multiplication
\mu: T^2->T
satisfaisant:
\mu o T\mu = \mu o \mu T (associativité)
\mu o T \eta = \mu o \eta T = 1_{T} (identité)

Une adjonction (F,G) définit une monade via T=GoF, l'unité \eta, et
\mu=G\epsilonF où \epsilon: FG->Id est la counité.
Inversement toute monade vient d'une adjonction, cf:
the Kleisli category and the category of Eilenberg-Moore algebras
http://en.wikipedia.org/wiki/Kleisli_category

[cf Maths/Categorie/Monades pour plus de détails sur les adjonctions]

Categorie de Kleisli
====================

Hom_K(X,Y)=Hom(X,TY)
Si f \in Hom_K(X,Y), g \in Hom_K(Y,Z) alors
la compositin gof dans K est notée par Haskell
f >=> g.
On la définit de la manière suivante:
f: X->T(Y) [dans la catégorie initiale],
g: Y->T(Z)
g*: T(Y)->T(Z) via g*=\mu o T(g)
et f >=> g = g* o f
>=> est associatif et a pour identité \eta_X, ie on a bien une catégorie.

Réciproquement, si on a
- For each object A in C, a morphism \eta_A:A\to T(A);
- For each morphism f:A\to T(B) in C, a morphism f^*:T(A)\to T(B)
telle que >=> soit associatif d'idendité \eta_X, alors on a une monade.

Rem: 
- On retrouve \mu via \mu(X)=Id_T(X)*: Id: T(X)-T(X), Id*: T^2(X)->T(X)
- A partir de la composition >=>, on retrouve f*= Id>=>f
  et donc \mu(X)= (Id: T^2(X)->T^2(X))>=>(Id: T(X)->T(X))
- On retrouve une adjonction via
F X=X, F (f:X->Y)= \eta o F: X->T Y \in Hom_K(X,Y)
G Y=TY, G (f:X->TY)=f*
- A partir de f*, on retrouve Tf via
  Tf: TX->TY= (\eta o f)*

Bind:
====
on a l'unité toujours \eta (encore appelée 'wrap' ou 'return') et le bind
T X -> (f: X->TY) -> TY
via x->f*(x \in TX)

Avec les lois
 - wrap acts approximately as a neutral element of >>=, in that:
      (wrap x) >>= f   ≡   f x
 -     m >>= wrap   ≡   m
 - Binding two functions in succession is the same as binding one function that can be determined from them:
      (m >>= f) >>= g   ≡   m >>= ( \x -> (f x >>= g) )
Rem:
- m >>= f = (Id >=> f)(m)
- On a réciproquement (f >=> g) x = (f x) >>= g

http://en.wikipedia.org/wiki/Monad_%28functional_programming%29#Formal_definition
A binding operation of polymorphic type (M t)→(t→M u)→(M u), which Haskell represents by the infix operator >>=. Its first argument is a value in a monadic type, its second argument is a function that maps from the underlying type of the first argument to another monadic type, and its result is in that other monadic type. Typically, the binding operation can be understood as having four stages:
- The monad-related structure on the first argument is "pierced" to expose any number of values in the underlying type t.
- The given function is applied to all of those values to obtain values of type (M u).
- The monad-related structure on those values is also pierced, exposing values of type u.
- Finally, the monad-related structure is reassembled over all of the results, giving a single value of type (M u).

# Codensity and continuation monad
[cf aussi Continuations pour la monade continuation]

- https://www.reddit.com/r/haskell/comments/6qn4y0/when_to_use_cps_vs_codensity_vs_reflection/
  https://stackoverflow.com/questions/45334985/when-to-use-cps-vs-codensity-vs-reflection-without-remorse-in-haskell

- http://comonad.com/reader/2012/unnatural-transformations-and-quantifiers/
  Haskell point of view on the codensity monad: https://golem.ph.utexas.edu/category/2012/09/where_do_monads_come_from.html

- https://lmcs.episciences.org/4924/pdf
  CODENSITY  LIFTING  OF  MONADS  AND  ITS  DUAL

- http://blog.sigfpe.com/2008/12/mother-of-all-monads.html

- https://news.ycombinator.com/item?id=10175296
  From Imperative to Pure-Functional and Back: Monads vs. Scoped Continuations (paralleluniverse.co)
  => http://blog.paralleluniverse.co/2015/08/07/scoped-continuations/

## Mathematic aspects of the continuation monad
- https://math.stackexchange.com/questions/2347437/continuations-in-mathematics-nice-examples

# Monads in prog. languages

- https://ncatlab.org/nlab/show/monad%20%28in%20computer%20science%29

## Introduction aux monades dans ruby
http://moonbase.rydia.net/mental/writings/programming/monads-in-ruby/00introduction.html
http://stackoverflow.com/questions/2709361/monad-equivalent-in-ruby

## Dans ML

https://existentialtype.wordpress.com/2011/05/01/of-course-ml-has-monads/

## Monades dans Haskell:
- la monade continuation:
http://www.haskellforall.com/2012/12/the-continuation-monad.html
http://www.haskellforall.com/2012/08/the-category-design-pattern.html
http://www.haskellforall.com/2012/09/the-functor-design-pattern.html
- Monads made difficult:
http://www.stephendiehl.com/posts/monads.html
- Yet another monad tutorial:
http://mvanier.livejournal.com/3917.html

Exemples de monades:
https://en.wikipedia.org/wiki/Monad_(functional_programming)#Other_examples

Free monad in Haskell
https://www.reddit.com/r/haskell/comments/7q4sku/are_people_using_freer_monads_or_still_mostly/

Right kan extensions
https://www.reddit.com/r/haskell/comments/6vu2i4/fun_exploration_right_kan_extensions_swapped/
=> https://gist.github.com/Icelandjack/83e77449d2857f24a7c94fede6d7311b

# Algebraic effects
cf aussi Info/bookmarks (rust, ocaml)

- http://www.cs.ox.ac.uk/people/samuel.staton/papers/popl2015.pdf
  Algebraic Effects, Linearity, and Quantum Programming Languages

+ https://www.reddit.com/r/haskell/comments/9l0ey4/trycatch_and_asyncawait_are_just_a_specialized/
  => https://www.microsoft.com/en-us/research/wp-content/uploads/2016/08/algeff-tr-2016-v2.pdf
  Algebraic Effects for Functional Programming(Type Directed Compilation of Row-typed Algebraic Effects)

- https://www.reddit.com/r/haskell/comments/39wpi8/fusion_for_free_efficient_algebraic_effect/
- https://www.reddit.com/r/haskell/comments/1b64xh/programming_and_reasoning_with_algebraic_effects/

# Free / Freeer

* Free: https://ncatlab.org/nlab/show/free+monad
https://stackoverflow.com/questions/13352205/what-are-free-monads
http://www.haskellforall.com/2012/06/you-could-have-invented-free-monads.html
https://www.parsonsmatt.org/2017/09/22/what_does_free_buy_us.html
https://markkarpov.com/post/free-monad-considered-harmful.html

* Freeer:
https://reasonablypolymorphic.com/blog/freer-monads/
http://okmij.org/ftp/Computation/free-monad.html
=> http://okmij.org/ftp/Haskell/extensible/more.pdf
