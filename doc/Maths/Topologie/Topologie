vim: ft=markdownlight fdm=expr

Compacité
=========

https://en.wikipedia.org/wiki/Compact_space
Tout ultrafiltre converge

Espaces totalement bornés
--------------------------
https://en.wikipedia.org/wiki/Totally_bounded_space

Definition:
Totally bounded (=precompact): for every real number ϵ > 0, there exists a finite collection of open balls in M of radius ϵ whose union contains M
A metric space is said to be cauchy-precompact if every sequence admits a Cauchy subsequence. For metric spaces we have: compactness = cauchy-precompactness + completeness. It turns out that the space is cauchy-precompact if and only if it is totally bounded. Therefore both names (cauchy-precompact and totally bounded) can be used interchangeably.

Examples and nonexamples:
- A subset of the real line, or more generally of (finite-dimensional) Euclidean space, is totally bounded if and only if it is bounded. Archimedean property is used.
- The unit ball in a Hilbert space, or more generally in a Banach space, is totally bounded if and only if the space has finite dimension.
- Every compact set is totally bounded, whenever the concept is defined.
- Every totally bounded metric space is bounded. However not every bounded metric space is totally bounded.[2]
- A subset of a complete metric space is totally bounded if and only if it is relatively compact (meaning that its closure is compact).
- In a locally convex space endowed with the weak topology the precompact sets are exactly the bounded sets.
- A metric space is separable if and only if it is homeomorphic to a totally bounded metric space.[2]
- An infinite metric space with the discrete metric (the distance between any two distinct points is 1) is not totally bounded, even though it is bounded.

Relationships with compactness and completeness:
- Every compact metric space is totally bounded.
- A uniform space is compact if and only if it is both totally bounded and Cauchy complete. This can be seen as a generalisation of the Heine–Borel theorem from Euclidean spaces to arbitrary spaces: we must replace boundedness with total boundedness (and also replace closedness with completeness).
- There is a complementary relationship between total boundedness and the process of Cauchy completion: A uniform space is totally bounded if and only if its Cauchy completion is totally bounded. (This corresponds to the fact that, in Euclidean spaces, a set is bounded if and only if its closure is bounded.)
- Combining these theorems, a uniform space is totally bounded if and only if its completion is compact. This may be taken as an alternative definition of total boundedness. Alternatively, this may be taken as a definition of precompactness, while still using a separate definition of total boundedness. Then it becomes a theorem that a space is totally bounded if and only if it is precompact. (Separating the definitions in this way is useful in the absence of the axiom of choice; see the next section.)

Sigma-compact
-------------
https://en.wikipedia.org/wiki/%CE%A3-compact_space
In mathematics, a topological space is said to be σ-compact if it is the union of countably many compact subspaces.[1]
A space is said to be σ-locally compact if it is both σ-compact and locally compact.[2]

https://en.wikipedia.org/wiki/Lindel%C3%B6f_space
A Lindelöf space is a topological space in which every open cover has a countable subcover. 
- Any σ-compact space is Lindelöf.
- Any second-countable space is a strongly Lindelöf space

Paracompact
------------
https://en.wikipedia.org/wiki/Paracompact_space
A paracompact space is a topological space in which every open cover has an open refinement that is locally finite. These spaces were introduced by Dieudonné (1944). Every compact space is paracompact. Every paracompact Hausdorff space is normal, and a Hausdorff space is paracompact if and only if it admits partitions of unity subordinate to any open cover. (=> it is normal)
- Every metric space is paracompact. A topological space is metrizable if and only if it is a paracompact and locally metrizable Hausdorff space.
- Every regular Lindelöf space is paracompact.
https://en.wikipedia.org/wiki/Metrization_theorem

Séparabilité
============

https://en.wikipedia.org/wiki/Axiom_of_countability
Important countability axioms for topological spaces include:[1]
- sequential space: a set is open if every sequence convergent to a point in the set is eventually in the set
- first-countable space: every point has a countable neighbourhood basis (local base)
- second-countable space: the topology has a countable base
- separable space: there exists a countable dense subspace
- Lindelöf space: every open cover has a countable subcover
- σ-compact space: there exists a countable cover by compact spaces

Relationships with each other
These axioms are related to each other in the following ways:
- Every first countable space is sequential.
- Every second-countable space is first-countable, separable, and Lindelöf.
- Every σ-compact space is Lindelöf.
- Every metric space is first countable.
- For metric spaces second-countability, separability, and the Lindelöf property are all equivalent.

Métrisabilité
=============

Urysohn's metrization theorem. This states that every Hausdorff second-countable regular space is metrizable

Urysohn's Theorem can be restated as: A topological space is separable and metrizable if and only if it is regular, Hausdorff and second-countable. The Nagata–Smirnov metrization theorem extends this to the non-separable case. It states that a topological space is metrizable if and only if it is regular, Hausdorff and has a σ-locally finite base. A σ-locally finite base is a base which is a union of countably many locally finite collections of open sets.

Complétion
----------

https://en.wikipedia.org/wiki/Uniform_space
Hausdorff completion of a uniform space
As with metric spaces, every uniform space X has a Hausdorff completion

https://en.wikipedia.org/wiki/Completely_uniformizable_space
Every regular paracompact space (in particular, every Hausdorff paracompact space) is completely uniformizable. [6][7]
Every metrizable space is paracompact, hence completely uniformizable. As there exist metrizable spaces that are not completely metrizable, complete uniformizability is a strictly weaker condition than complete metrizability.

https://en.wikipedia.org/wiki/Completely_metrizable_space
=> il existe une distance complète qui induit la topo

Axiomes de séparation
=====================

https://en.wikipedia.org/wiki/Separation_axiom

- X is T0, or Kolmogorov, if any two distinct points in X are topologically distinguishable. (It will be a common theme among the separation axioms to have one version of an axiom that requires T0 and one version that doesn't.)
- X is R0, or symmetric, if any two topologically distinguishable points in X are separated.
- X is T1, or accessible or Fréchet, if any two distinct points in X are separated. Thus, X is T1 if and only if it is both T0 and R0. (Although you may say such things as "T1 space", "Fréchet topology", and "Suppose that the topological space X is Fréchet", avoid saying "Fréchet space" in this context, since there is another entirely different notion of Fréchet space in functional analysis.)
- X is R1, or preregular, if any two topologically distinguishable points in X are separated by neighbourhoods. Every R1 space is also R0.
- X is Hausdorff, or T2 or separated, if any two distinct points in X are separated by neighbourhoods. Thus, X is Hausdorff if and only if it is both T0 and R1. Every Hausdorff space is also T1.
- X is T2½, or Urysohn, if any two distinct points in X are separated by closed neighbourhoods. Every T2½ space is also Hausdorff.
- X is completely Hausdorff, or completely T2, if any two distinct points in X are separated by a continuous function. Every completely Hausdorff space is also T2½.
- X is regular if, given any point x and closed set F in X such that x does not belong to F, they are separated by neighbourhoods. (In fact, in a regular space, any such x and F will also be separated by closed neighbourhoods.) Every regular space is also R1.
- X is regular Hausdorff, or T3, if it is both T0 and regular.[1] Every regular Hausdorff space is also T2½.
- X is completely regular if, given any point x and closed set F in X such that x does not belong to F, they are separated by a continuous function. Every completely regular space is also regular.
- X is Tychonoff, or T3½, completely T3, or completely regular Hausdorff, if it is both T0 and completely regular.[2] Every Tychonoff space is both regular Hausdorff and completely Hausdorff.
  Embedding: Every Tychonoff spaces are precisely those spaces which can be embedded in compact Hausdorff spaces. One can always choose K to be a Tychonoff cube (i.e. a possibly infinite product of unit intervals) (donc un produit d'espaces métriques)
- X is normal if any two disjoint closed subsets of X are separated by neighbourhoods. (In fact, a space is normal if and only if any two disjoint closed sets can be separated by a continuous function; this is Urysohn's lemma.)
- X is normal Hausdorff, or T4, if it is both T1 and normal. Every normal Hausdorff space is both Tychonoff and normal regular.
  (Ex: un espace métrique est T4)
- X is completely normal if any two separated sets are separated by neighbourhoods. Every completely normal space is also normal.
- X is completely normal Hausdorff, or T5 or completely T4, if it is both completely normal and T1. Every completely normal Hausdorff space is also normal Hausdorff.
- X is perfectly normal if any two disjoint closed sets are precisely separated by a continuous function. Every perfectly normal space is also completely normal.
- X is perfectly normal Hausdorff, or T6 or perfectly T4, if it is both perfectly normal and T1. Every perfectly normal Hausdorff space is also completely normal Hausdorff.

Bourbaki
--------

- rare: l'intérieur de l'adhérence est vide = contenu dans un fermé
  d'intérieur vide

- C dans X est clairsemé si pour tout parfait P dans X, P \cap C est rare
  relativement à P.
  => la frontière d'un clairsemé est rare
  => il existe dans X un plus grand parfait, dont le complémentaire est
  clairsemé

- maigre: réunion dénombrable de rares

- espace de Baire: si toute intersection dénombrable d'ouverts denses est
  dense. De façon équivalente, un espace topologique est de Baire si toute
  union dénombrable de fermés d'intérieurs vides est d'intérieur vide, ou
  encore, si le seul ouvert maigre est le vide

  Théorème de Baire: un espace uniforme localement compact ou un espace
  complet sont des espaces de Baire

- inépuisable: non maigre dans lui même
  (<=> une intersection de G_delta denses est non vide)
  => le complémentaire d'un maigre est inépuisable
  Baire => Inépuisable

- totalement inépuisable: tout fermé non vide est inépuisable
  Régulier + Totalement inépuisable => Baire
  [attention, il y a des exemples Baire mais non Totalement inépuisables]

  Ex: espace loc. compact ou métrique complet.

  « Dans un espace accessible totalement inépuisable, un ensemble fermé dénombrable non vide est clairsemé, et par suite a au moins un point isolé »
  (accessible=T1=tout point est fermé)

  => une intersection dénombrable d'ouvert est totalement inépuisable.
