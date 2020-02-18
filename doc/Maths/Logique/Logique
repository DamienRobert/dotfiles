vim: ft=markdownlight fdm=expr

Réfs:
- https://arxiv.org/pdf/1212.6543.pdf Rethinking set theory, Tom Leinster (on ECTS)

Absoluteness
============

* https://en.wikipedia.org/wiki/Absoluteness

1) Certain properties are absolute to all transitive models of set theory, including the following (see Jech (2003 sec. I.12) and Kunen (1980 sec. IV.3)).

    x is the empty set.
    x is an ordinal.
    X is a finite ordinal.
    x = ω.
    x is (the graph of) a function.

Other properties, such as countability, are not absolute.

2) Shoenfield's absoluteness theorem

Shoenfield's absoluteness theorem shows that \Pi^1_2 and \Sigma^1_2 sentences in the analytical hierarchy are absolute between a model V of ZFC and the constructible universe L of the model, when interpreted as statements about the natural numbers in each model. The theorem can be relativized to allow the sentence to use sets of natural numbers from V as parameters, in which case L must be replaced by the smallest submodel containing those parameters and all the ordinals. The theorem has corollaries that \Sigma^1_3 sentences are upward absolute (if such a sentence holds in L then it holds in V) and \Pi^1_3 sentences are downward absolute (if they hold in V then they hold in L). Because any two transitive models of set theory with the same ordinals have the same constructible universe, Shoenfield's theorem shows that two such models must agree about the truth of all \Pi^1_2 sentences.

One consequence of Shoenfield's theorem relates to the axiom of choice. Gödel proved that the constructible universe L always satisfies ZFC, including the axiom of choice, even when V is only assumed to satisfy ZF. Shoenfield's theorem shows that if there is a model of ZF in which a given \Pi^1_3 statement φ is false, then φ is also false in the constructible universe of that model. In contrapositive, this means that if ZFC proves a \Pi^1_3 sentence then that sentence is also provable in ZF. The same argument can be applied to any other principle which always holds in the constructible universe, such as the combinatorial principle ◊. Even if these principles are independent of ZF, each of their \Pi^1_3 consequences is already provable in ZF. In particular, this includes any of their consequences that can be expressed in the language of Peano arithmetic.

Shoenfield's theorem also shows that there are limits to the independence results that can be obtained by forcing. In particular, any sentence of Peano arithmetic is absolute to transitive models of set theory with the same ordinals. Thus it is not possible to use forcing to change the truth value of arithmetical sentences, as forcing does not change the ordinals of the model to which it is applied. Many famous open problems, such as the Riemann hypothesis and the P = NP problem, can be expressed as \Pi^1_2 sentences (or sentences of lower complexity), and thus cannot be proven independent of ZFC by forcing.

Rem: une version moins forte de ce th montre que V_{w_2} est Sigma_0-absolu

3) Aller beaucoup plus loin :-)
http://mathoverflow.net/questions/108197/sets-of-reals-and-absoluteness
    Theorem. Assume there are a proper class of cardinals that are simultaneously measurable and Woodin. If ϕ is a Σ^2_1 statement (with real parameters from the ground model), then: ϕ is true in some set forcing extension of the universe iff ϕ is true in every set forcing extension that satisﬁes 𝖢𝖧.

Inner models
============

* https://en.wikipedia.org/wiki/Inner_model_theory
= transitive subsets or subclasses of the von Neumann universe V
= transitive models

- The first non-trivial example of an inner model was the constructible universe L developed by Kurt Gödel. Every model M of ZF has an inner model ^LM satisfying the axiom of constructibility, and this will be the smallest inner model of M containing all the ordinals of M. Regardless of the properties of the original model, LM will satisfy the generalized continuum hypothesis and combinatorial axioms such as the diamond principle ◊.
- The sets that are hereditarily ordinal definable form an inner model
- The sets that are hereditarily definable over a countable sequence of ordinals form an inner model, used in Solovay's theorem.

=> Réfs on L: https://projecteuclid.org/download/pdf_1/euclid.pl/1235419480

* Existence
https://math.stackexchange.com/questions/2126493/existence-of-transitive-standard-models-of-zfc-independent-of-existence-of-model

Standard transitive model ==> there exist an \omega-model ==> there exist a
model (where ==> means that <= is false)

More details (=>):
https://math.stackexchange.com/questions/33688/zfc-exists-standard-model-rightarrow-conzfc-exists-omega-model

- ZFC+∃Vα model of ZFC⊢Con(ZFC+∃ transitive standard model of ZFC)

  Proof: we can always find a countable extentional M⊂Vα elementary equivalent to Vα. Let M′ be the mostowski collapse of M. M′≈M so M′ is model of ZFC. And because M′ is countable and transitive then M′∈Vα (since Hω1⊂Vω1 and α is surely far larger than ω1). 

- ZFC+∃ transitive standard model of ZFC⊢Con(ZFC+∃ω−model of ZFC)

  Proof: There is an ω-model of ZFC" is Σ11: Note that if there is an ω-model, there is a countable one (take a countable elementary substructure), and now we can express this by saying that "there is a real x coding a model of ZFC, and there is a real y coding an order isomorphism of ω onto the natural numbers of the model coded by x".
  Mostowski's absoluteness theorem gives us that any transitive model of ZFC is correct about Σ11 statements (see Section 13 of Kanamori's book, for example). In particular, your transitive model is a model of the statement that there is an ω-model..

https://math.stackexchange.com/questions/265379/absoluteness-of-textcon-mathsfzfc-for-transitive-models-of-mathsf?rq=1 (</=)

- Con(ZFC) is absolute for transitive models

  Proof: Con(ZFC) is an arithmetic statement (Π01 in particular, because it says a computer program that looks for an inconsistency will never halt) so it is absolute to transitive models (and even \omega-models).

=> By Godel: ZFC+Con(ZFC)⊬⟨There exists a transitive model of ZFC⟩ (or an \omega-model).
  Furthermore: the existence of an ω-model of ZFC does not prove the existence of a transitive model of ZFC, because the existence of an ω-model of ZFC is a Σ11 statement, and Σ11 statements are absolute to transitive models.

* Countable transitive models:
By Skolem: if ZF has a model it has a countable model (but which may not be
transitive). Mostowski=transitive version of Skolem:

https://en.wikipedia.org/wiki/Mostowski_collapse_lemma
R binary relation that is (i) set like, (ii) well-founded, (iii)
extensional => there exists a unique transitive class (possibly proper) whose structure under the membership relation is isomorphic to (X, R), and the isomorphism is unique. The isomorphism maps each element x of X to the set of images of elements y of X such that y R x.

=> Every set model of ZF is set-like and extensional. If the model is well-founded, then by the Mostowski collapse lemma it is isomorphic to a transitive model of ZF and such a transitive model is unique. 

=> If there is a transitive model, there is a countable one:
https://mathoverflow.net/questions/57225/kunens-use-of-countable-transitive-models

Generalisations:
- https://math.stackexchange.com/questions/810771/existence-of-countable-transitive-models
- https://mathoverflow.net/questions/294526/consistency-strength-of-the-existence-of-a-transitive-model-of-mathsfzfc

Preuves et vérité
=================

Preuves internes
----------------

Soit T une théorie du premier ordre, avec des axiomes récursivement
énumérable (et une signature dénombrable) alors pour tout énoncé P de T  on
peut construire un énoncé arithmétique Sigma_1 []P qui dit: il existe un
entier qui code une démonstration de P.

Et on a N|= []P ssi T |- P.

Maintenant on peut regarder []P dans une théorie contenant T2 l'arithmétique.
Il me semble que les affirmations suivantes sont vraies:
- si T2 contient l'arithmétique de Robinson, alors si T |- P, T2 |- []P
  (en effet, on a un algorithme de preuve pour la logique du premier ordre,
  et l'arithmétique de Robinson est suffisante pour parler de fonctions
  calculables)
- si T2 est Sigma_1-sound (donc en particulier si elle est
  Omega-consistante) alors
  T2 |- []P implique T |- P
  (en effet []P étant Sigma_1, si T2 |- []P,  N |= [] P)

Mais attention, sans hypothèse de plus
(pour simplifier prenons T2=T, T arithmétique), soit M un modèle de T.
alors M |= []P n'implique pas M |= P:
M |= []P signifie juste qu'il existe un entier, pê non standard qui code une démo de P, mais s'il est non standard ça ne prouve pas P.
Par exemple, il existe des modèles M de Peano tels que
M |= [](0=1) (ça existe par Gödel), par contre on n'a pas M |= (0=1) par
définition.

Goedel formel
-------------

T théorie telle que
- Si T|-P alors T |- []P
- T |- []P=>[][]P
- T |- [](P=>Q)=>[]P=>[]Q

Th de Lob:
- Si T |- []P=>P alors T |- P
- T |- []([]P=>P)=>[]P

Soit G l'énoncé de Goedel: G <=> Non [] G
H l'énoncé de Robinson: H <=> []H
Consis(T) est l'énoncé Non [] (1=0), NonConsis(T) est l'énoncé [](1=0)

Cor:
- Si T |- Consis(T) ou si T |- G alors T |- (1=0)
- Si T |- Non G alors T |- NonConsis(T)
- T |- []Consis(T) => NonConsis(T)
- T |- H
(Moralité, si T |- Non [] Truc, alors T |- Consis(T) donc T est
inconsistante)

Rem (cf plus haut): si T est w-consistante ou même sigma_1-sound, T ne peut
pas prouver NonConsis(T), donc T ne prouve ni G, ni Non G.
De même Consis(T) est indécidable, donc
S_0=T+Consis(T) est consistante, mais aussi S_1=T+NonConsis(T)
(et bien sûr on peut itérer sur S_0 mais pas sur S_1...)

En général (Goedel Rosser),
soit T une théorie _consistante_, contenant l'arithmétique minimale, et
récursivement énumérable (ou axiomatisable de façon récursivement
énumérable, cela revient au même) ; il existe toujours un énoncé G_0 Pi_1
indécidable dans T.

# Reverse Maths

* https://en.wikipedia.org/wiki/Reverse_mathematics#The_base_system_RCA0
- RCA0 is the fragment of second-order arithmetic whose axioms are the
  axioms of Robinson arithmetic, induction for Σ^0_1 formulas, and
  comprehension for Δ^0_1 formulas. 

  The first-order part of RCA0 (the theorems of the system that do not
  involve any set variables) is the set of theorems of first-order Peano
  arithmetic with induction limited to Σ^0_1 formulas. It is provably
  consistent, as is RCA0, in full first-order Peano arithmetic.

  Ordinal order: ω^ω

- Weak Kőnig's lemma WKL0
  RCA0 + every infinite subtree of the full binary tree has an infinite path

  WKL0 can also be defined as the principle of Σ^0_1 separation (given two
  Σ^0_1 formulas of a free variable n which are exclusive, there is a class
  containing all n satisfying the one and no n satisfying the other)

  It turns out that RCA0 and WKL0 have the same first-order part, meaning
  that they prove the same first-order sentences.

  Ordinal order: ω^ω

- Arithmetical comprehension ACA0
  RCA0 + the comprehension scheme for arithmetical formulas
  Actually, it suffices to add to RCA0 the comprehension scheme for Σ_1
  formulas in order to obtain full arithmetical comprehension.

  The first-order part of ACA0 is exactly first-order Peano arithmetic;
  ACA0 is a conservative extension of first-order Peano arithmetic.
  ACA0 can be thought of as a framework of predicative mathematics,
  although there are predicatively provable theorems that are not provable
  in ACA0.

  Ordinal order: ε_0

- Arithmetical transfinite recursion ATR0

  The system ATR0 adds to ACA0 an axiom which states, informally, that any
  arithmetical functional (meaning any arithmetical formula with a free
  number variable n and a free class variable X, seen as the operator
  taking X to the set of n satisfying the formula) can be iterated
  transfinitely along any countable well ordering starting with any set.
  ATR0 is equivalent over ACA0 to the principle of Σ^1_1 separation. ATR0 is
  impredicative, and has the proof-theoretic ordinal Γ_0,
  the supremum of that of predicative systems.

- Π^1_1 comprehension Π^1_1-CA0
  Π^1_1-CA0 is stronger than arithmetical transfinite recursion and is
  fully impredicative. It consists of RCA0 plus the comprehension scheme
  for Π^1_1 formulas.

  In a sense, Π^1_1-CA0 comprehension is to arithmetical transfinite
  recursion (Σ^1_1 separation) as ACA0 is to weak Kőnig's lemma (Σ^0_1
  separation).

  Ordinal order: ψ_0(Ω_ω)

# Calculability

* Turing degree and turing jump
* https://en.wikipedia.org/wiki/Turing_jump
- The Turing jump 0′ of the empty set is Turing equivalent to the halting problem.
- For each n, the set 0(n) is m-complete at level Σ_n^0 in the arithmetical hierarchy (by Post's theorem). https://en.wikipedia.org/wiki/Post%27s_theorem
  => Cf [Ordinaux/Calculabilite] pour l'extension de la hierarchie
  arithmétique (arithmétique = L_1 \cap P(w_0)) le long d'ordinaux récursifs (ie à L_{w_1^CK} \cap P(w_0) ie hyperarithmétique) puis le long des L_alpha.

* https://en.wikipedia.org/wiki/Turing_degree
- For every degree a there is a degree strictly between a and a′. In fact, there is a countable sequence of pairwise incomparable degrees between a and a′.
- A degree a is of the form b′ if and only if 0′ ≤ a.
- For any degree a there is a degree b such that a < b and b′ = a′; such a degree b is called low relative to a.
- There is an infinite sequence ai of degrees such that a′i+1 ≤ ai for each i.
- A degree is called r.e. (recursively enumerable) if it contains a recursively enumerable set. Every r.e. degree is less than or equal to 0′ but not every degree less than 0′ is an r.e. degree.
  (G. E. Sacks, 1964) The r.e. degrees are dense; between any two r.e. degrees there is a third r.e. degree.

* https://arxiv.org/pdf/math/9808093.pdf
Infinite Time Turing Machines Joel David Hamkins and Andy Lewis
= machine de turing qui ont un état "limite", permettant de passer à la
limite sur un ordinal. Plus puissant que la higher recursion theory:

There has been much work in higher recursion theory analyzing well-founded computations on infinite objects (see e.g. [Sacks]). Much of that theory, however, grows out of the analogy which associates the ∆^1_1 sets with the finite sets and the Π^1_1 sets with the semi-decidable sets.  It there foregives a different analysis than ours, since in our account, the Π^1_1 sets will become actually decidable, along with their complements the Σ^1_1sets, and the semi-decidable sets, with the jump operator, will stratify the class of ∆^1_2 sets.

forum
=====

Références:
- http://www.madore.org/~david/weblog/2014-05.html#d.2014-05-08.2200
(surtout pour les liens, en particulier le très bon résumé sur Godel, les
schémas de réflexions, ...:
- http://www.madore.org/~david/weblog/2012-12-15-verite-en-mathematiques.html#d.2012-12-15.2093.le-cadre-des-mathematiques.deux-points-de-vue

Gödel
-----

-----------------------------------------------------------------------
From madore@clipper.ens.fr Fri Jan 21 15:55:54 2005
Article: 625 of ens.forum.sciences.maths.avancees
Subject: indecidabilite (was: Re: notations ordinales...)

Marc Mezzarobba  in litteris <csqt2s$jcu$1@clipper.ens.fr> scripsit:
> (En passant, si je comprends bien, on peut se passer de parler de
> calculabilité et d'indécidabilité algorithmique pour démontrer le premier
> théorème de Gödel, mais c'est plus difficile pour le théorème de Tarski ou
> le second théorème de Gödel. Est-ce que ce que je raconte là est correct ?)

Qu'est-ce que tu appelles le « premier » et le « second » théorèmes de
Gödel ?  Le théorème de complétude et celui d'incomplétude, ou bien le
théorème d'incomplétude au sens « il existe une affirmation non
démontrable dans le système T » et celui au sens « et d'ailleurs
l'affirmation Consis(T) est un exemple » ?  Ou encore est-ce que le
second est l'affirmation « et ça marche dans tout système T qui code
l'arithmétique et qui soit récursivement énumérable » ?  Dans ce
dernier cas, bien sûr, c'est assez clair qu'on ne peut pas se passer
de la notion de récursive énumérabilité.

Mais en tout cas, historiquement, tous les théorèmes de Gödel sont
antérieur aux travaux de Turing, donc à tout ce qui concerne la
calculabilité.

Personnellement, j'aime bien présenter le théorème de Gödel de la
façon suivante :

On prend un système formel qui comporte un modalisateur que je vais
noter [] (petit carré) et qu'il faut imaginer comme signifiant « la
formule qui suit est un théorème ».  On peut se contenter de
n'autoriser le modalisateur que sur les énoncés (formules sans
variables libres).  On autorise de plus, dans ce qui suit le
modalisateur, un symbole spécial, *, utilisé comme une variable
propositionnelle, qui signifie « cette formule elle-même ».  Les
règles utilisées sur le modalisateur sont :

(D1) : Si P est un théorème, alors []P en est un.
(D2) : []P=>[][]P est un théorème pour toute formule P.
(D3) : Si [](P=>Q)=>[]P=>[]Q (à parenthéser comme
       « ([](P=>Q))=>(([]P)=>[]Q) ») est un théorème pour toutes
       formules P et Q.

Et concernant l'étoile, on demande que si P est une formule utilisant
(éventuellement) ce symbole (derrière le modalisateur [], donc) et P'
la formule obtenue en remplaçant * dans P par P elle-même, alors
P<=>P' soit un théorème.

Soit maintenant P un énoncé quelconque, et G l'énoncé « []*=>P » (il
faut parenthéser ça comme « ([]*)=>P »).  Alors G=>[]G=>P est un
théorème (règle de l'étoile), donc [](G=>[]G=>P) en est un par (D1),
donc []G=>[]([]G=>P) en est un par (D3), donc []G=>[][]G=>[]P encore
par D3, donc []G=>[]P par (D2).  En particulier, si []P=>P est un
théorème, alors []G=>P en est un, c'est-à-dire que G en est un (règle
de l'étoile), donc []G en est un, donc P en est un.  Bilan : si []P=>P
est un théorème, P en est un ; c'est le théorème de Löb.  Si on prend
pour P l'affirmation « Faux », ça dit que si ¬[]Faux est un théorème,
alors Faux en est un : par contraposée, si Faux n'est pas un théorème
(si le système n'est pas contradictoire), ¬[]Faux n'en est pas un (il
ne prouve pas sa consistance).

Tout ceci n'a rigoureusement rien à voir avec la calculabilité ou la
complexité.  Bon, maintenant, on peut me dire, dans le système que je
veux étudier (un système arithmétique), il n'y a pas ce modalisateur
[] magique, ni cette étoile magique.  Mais ce n'est pas grave : c'est
justement ce qu'on obtient en introduisant le codage de Gödel, en
remplaçant []P par « P est un théorème » (convenablement arithmétisé)
et en utilisant l'astuce de Quine (expliquée en détails sur <URL:
http://www.eleves.ens.fr:8080/home/madore/computers/quine.html >) pour
l'étoile.  La règle D3 ne pose pas de problème particulier, elle
traduit juste l'expression du modus ponens ; mais pour avoir D1 et D2,
on va, d'une façon ou d'une autre, utiliser le fait que les axiomes
sont donnés par une formule Sigma_1 et prouver (soit directement, pour
D1, soit dans le système lui-même pour D2) le théorème de
Sigma_1-complétude.  Ceci étant, si tu t'amuses à prendre n'importe
quel jeu d'axiomes, pas forcément récursif ou quoi que ce soit (mais
quand même arithmétiquement définissable, sinon on va perdre la
possibilité d'arithmétiser), et que tu assures les conditions D1, D2
et D3, le théorème de Gödel vaut encore.

--------------------------------------------------------------------------

From madore@clipper.ens.fr Sat Jul 16 04:26:58 2005
Article: 12005 of ens.forum.sciences.maths

Sa Majesté le Roy de France in litteris <db9idd$s2$2@clipper.ens.fr>
scripsit:
> Je cherche une preuve *detaille* du theoreme de Godel,

Quel théorème de Gödel ?  C'est très subtil, en fait : il y en a un
certain nombre qui se ressemblent dangereusement et qui sont en fait
différents.  En gros, tu as :

* Soit T une théorie _vraie_ [c'est-à-dire, dont tous les axiomes, et
donc tous les théorèmes, sont vrais], contenant l'arithmétique
minimale, et récursivement énumérable (ou axiomatisable de façon
récursivement énumérable, cela revient au même).  Alors si G est
l'affirmation arithmétique « G n'est pas dénombrable dans T » (qu'on
peut écrire dans T grâce au fait qu'elle est récursivement énumérable
- ce qui permet d'arithmétiser les démonstrations - et qu'elle
contient l'arithmétique), primo, G n'est pas démontrable dans T (elle
est vraie, quoi), secundo, il est un théorème de T (et donc, vrai,
mais ça c'est contenu dans le primo) que « si G est démontrable dans T
alors Faux est démontrable dans T » (i.e., en logique classique, que G
est indémontrable dans T sauf si T est inconsistante).  Ça (au moins
le « primo ») c'est généralement ce qu'on appelle le « premier »
théorème de Gödel (en fait, historiquement, le théorème concernait un
système T bien précis, celui des *Principia mathematica* de Russell et
Whitehead).  La démonstration est assez triviale (tout le problème est
d'expliquer pourquoi on peut construire G) : primo, si G est
démontrable dans T alors G est vraie donc G n'est pas démontrable dans
G, contradiction, secundo, on voit dans T que si G que si G est un
théorème de T alors ¬G en est un (car G théorème de T implique « G
théorème de T » théorème de T, et c'est justement ¬G) donc Faux en est
un.

* Soit T une théorie vérifiant les mêmes hypothèses que ci-dessus,
alors Consis(T) (autrement dit, « Faux n'est pas un théorème de T » -
qui est une affirmation arithmétique, vraie puisque T l'est) n'est pas
un théorème de T.  Ça c'est généralement appelé le « second théorème
de Gödel » (parfois avec tout le secundo du point précédent).  La
démonstration n'est pas moins triviale : j'ai expliqué ci-dessus que
c'est un théorème de T que si G est un théorème de T alors Faux en est
un.  En retraduisant ça (« G est un théorème de T » c'est ¬G, et
« Faux en est un » c'est ¬Consis(T)) et en passant à la contraposée,
on voit que Consis(T) implique G (...est un théorème de T).  Comme G
n'est pas un théorème de T, Consis(T) non plus.

* Quelques faits anecdotiques : le théorème de Robinson dit que « ceci
est un théorème » (est un théorème...).  Le théorème de Löb généralise
Gödel (tel qu'énoncé ci-dessus), et dit, en gros, que si P (une
affirmation quelconque de T) est prouvable dans T en utilisant
l'hypothèse qu'il existe une démonstration de P (dans T) alors P est
prouvable dans T (sans cette hypothèse).

* Le théorème de Gödel-Rosser.  Très subtilement différent de Gödel.
Soit T une théorie _consistante_, contenant l'arithmétique minimale,
et récursivement énumérable (ou axiomatisable de façon récursivement
énumérable, cela revient au même) ; mais je ne suppose pas que T est
vraie.  Alors il existe une affirmation arithmétique indécidable G
pour T (qu'on peut écrire explicitement, mais qui est plus subtile que
celle du premier théorème de Gödel ; dans tous les cas, on peut
prendre pour G une affirmation Pi_1).  Corollaire trivial : l'ensemble
des théorèmes de T n'est pas récursif.  Accessoirement, G est vrai
(mais on s'en fout un peu).  Il faut remarquer que T, bien que
consistante, peut très bien prouver ¬Consis(T), ce qui fait qu'il ne
faut pas chercher à généraliser le 2e théorème de Gödel.

La confusion vient souvent du mélange entre ces différents énoncés
(notamment entre le premier théorème de Gödel et celui de
Gödel-Rosser).

Tu peux jeter un oeil à <URL: http://www.dma.ens.fr/~madore/goedel.pdf
 >, malheureusement inachevé, mais dont la première partie présente,
je crois, quelque intérêt.  C'est la version purement formelle du
théorème de Gödel (débarrasser de toute l'arithmétisation, que je
comptais présenter ensuite, mais je n'ai pas eu le temps ou la
patience).  Par ailleurs, il y a mon article
<cvdmli$hav$1@clipper.ens.fr> (maths:10959) qui prétend démontrer
Gödel-Rosser.

> Bon deja outre que c'est vague et faux, quel sens doit-on donner a "is
> true" ? Dans quel modele ?

On parle d'affirmations arithmétiques, donc il y a un modèle naturel,
ce sont les entiers naturels.  Quand on dit d'une affirmation
arithmétique qu'elle est « vraie » sans plus de précision, c'est dans
les entiers naturels.  De même, ci-dessus, quand je parle d'une
théorie vraie, c'est une théorie dons les axiomes (donc tous les
théorèmes) sont vrais dans les entiers naturels, i.e., elle admet les
entiers naturels comme modèle.

(Bon, par ailleurs, il y a des gens, qui, ayant fait trop de logique
et surtout n'ayant pas bien compris ce qu'ils faisaient, prétendent ne
plus savoir ce que sont les entiers naturels.  Si c'est ton cas, il
faut surtout faire une cure de désintoxication ***avant*** d'essayer
de comprendre quoi que ce soit au théorème de Gödel.)

Remarquons que quand on dit « <gnagna> est un théorème de la théorie
<bidule> » (<bidule> étant supposée récursivement axiomatisable, quand
même), *cela* est un énoncé arithmétique, et dire qu'il est « vrai »
c'est précisément dire qu'il est vrai dans les entiers naturels (il
existe un entier naturel - un vrai - qui code une démonstration de
<gnagna> dans la théorie <bidule>).

> Et si l'enonce n'est ni prouvable, ni refutable, par le theoreme de
> completude c'est bien qu'il existe des modeles ou il est vrai, et des
> modeles ou il est faux... je suis fatigue, la, faut que j'aille dormir
> c'est le week-end, en plus j'ai fait une heure de course a pied chuis
> creve, y'a quelqu'un pour me donner ce que j'ai loupe dans leur enonce ?

Il y a des modèles où l'affirmation de Gödel est fausse, mais ces
modèles ne sont pas standards.  Dans le modèle standard, elle est
vraie : l'affirmation dit qu'elle n'est pas un théorème, et, de fait,
*elle n'est pas* un théorème.

---------------------------------------------------------------

From madore@clipper.ens.fr Sat Jul 16 04:36:19 2005
Article: 12007 of ens.forum.sciences.maths
Subject: Re: Godel

Gro-Tsen in litteris <db9r9i$rcm$2@clipper.ens.fr> scripsit:
> * Soit T une théorie vérifiant les mêmes hypothèses que ci-dessus,
> alors Consis(T) (autrement dit, « Faux n'est pas un théorème de T » -
> qui est une affirmation arithmétique, vraie puisque T l'est) n'est pas
> un théorème de T.

Je peux rajouter que *tout* énoncé Pi_1 vrai qui n'est pas un théorème
de T est impliquée dans T par Consis(T) pour une certaine énumération
de T (le piège, justement, est qu'il peut y avoir plein de façons
d'énumérer T et que ça donne plein d'énoncés Consis(T) qui ne sont pas
équivalents...).  J'explique ça dans le message
<csu3ru$oms$1@clipper.ens.fr> (maths.avancees:643), et c'est un
théorème de Turing (monstrueusement étendue, ensuite, par Feferman).

Quant à des références, il y a le petit bouquin *Inexhaustibility* de
Torkel Franzén, qui est vachement bien et clair (mais il ne prouve pas
Gödel-Rosser, par exemple, en revanche il prouve le résultat
ci-dessus), et le gros *Metamathematics of First-Order Arithmetic* de
Hájek et Pudlák, qui est assez indigeste mais quand même vachement
bien.

------------------------------------------------------------------------

Cet énoncé est un théorème
--------------------------

-------------------------------------------------------------------------

From madore@clipper.ens.fr Sat Jan 22 15:43:53 2005
Article: 642 of ens.forum.sciences.maths.avancees
Subject: "cet enonce est un theoreme" (was: Re: indecidabilite)

Joel Riou in litteris <cstnsu$hjk$1@clipper.ens.fr> scripsit:
> D'accord, donc si on note H l'énoncé « []* », alors par la règle de
> l'étoile H<=>[]H est un théorème, donc en particulier []H=>H est un
> théorème, et d'après le théorème de Löb, H est un théorème, c'est-à-dire :
>
> Théorème : cet énoncé est un théorème.

Voilà.  Une autre façon de faire, qui est peut-être plus parlante même
si elle a l'inconvénient de ne pas fonctionner correctement en logique
intuitionniste, c'est de dire : ¬H affirme qu'on ne peut pas démontrer
H, autrement dit, ¬H affirme exactement la consistance de la théorie
(Peano+)¬H.  Mais une théorie qui affirme sa propre consistance est
forcément inconsistante d'après le théorème de Gödel[#].  Et si ¬H est
inconsistante, c'est que H est démontrable (donc vraie).

[#] On s'imagine souvent, probablement à cause de la confusion avec le
théorème de Tarski sur l'indéfinissabilité de la vérité, qu'il est
impossible de faire une théorie (Sigma_1...) qui énonce sa propre
consistance.  Ce n'est pas du tout ce que dit le théorème de Gödel.
Une telle théorie est facile à constuire, c'est (Peano+)¬H, justement.
Ce que dit le théorème de Gödel, c'est qu'elle est inconsistante.

À part ça, pour l'étoile, c'était une mauvaise idée de ma part.  Ou
alors il faut que l'étoile soit accompagnée d'une sorte de renvoi qui
précise quelle sous-formule elle reprend, parce que comme j'ai fait
les choses, ¬[]* (l'énoncé de Gödel) n'est pas la négation de []*
(« cet énoncé est un théorème »), ce qui est quand même lourd.

> [Je me souviens d'avoir vu cet énoncé dans _Gödel Escher Bach_ (et ton
> Weblog) sans avoir réussi à le démontrer...]

C'est mal, de spoiler. :-) Tu enlèves aux gens tout le plaisir de
trouver cette démonstration par eux-mêmes !

--
David, qui va devoir écrire un texte rassemblant toutes ces
considérations sur le théorème de Gödel, sinon je vais rapidement
oublier.

Godel-Rosser
------------

From madore@clipper.ens.fr Mon Feb 21 23:17:22 2005
Article: 10959 of ens.forum.sciences.maths
Subject: theoreme d'incompletude de Goedel-Rosser

Voici un extrait d'un mail que je viens d'envoyer : je pense que ça
vaut la peine de poster ça ici, parce que je ne suis sans doute pas le
seul pour qui ce n'était pas parfaitement clair (dans la formulation
usuelle du théorème de Gödel, on part d'une théorie T consistante
récursivement axiomatisable dans le langage de l'arithmétique et on
construit l'affirmation G qui dit « G n'est pas démontrable [dans T] »
- alors G n'est pas un théorème de T, mais pour montrer que ¬G n'est
pas non plus un théorème de T il faut des hypothèses supplémentaires
sur T, par exemple que T est vraie (a les entiers naturels standards
pour modèle, bref, est un fragment de l'arithmétique) ou au moins que
T est « omega-consistante », que T+Consis(T) est consistante, bref,
quelque chose de plus ; parce qu'il existe des théories T consistantes
mais qui prouvent leur propre inconsistance, par exemple
Peano+¬Consis(Peano), et alors elles prouvent évidemment ¬G).

Bref, voici ce que j'écrivais :

J'appelle Q une arithmétique minimale (pour fixer les idées, si le
langage est (0,S,+,·,<), la clôture universelle des affirmations
suivantes doit pouvoir servir pour axiomes : (Sm=0 => Faux), (Sm=Sn =>
m=n), (m+0 = m), (m+Sn = S(m+n)), (m·0 = 0), (m·Sn = (m·n)+m), (m<0 =>
Faux), (m<Sn <=> (m<n \/ m=n)), (0=n \/ 0<n), ((Sm<n \/ Sm=n) <=>
m=n)).  Tout ce que je demande, en fait, c'est que tout modèle de Q
ait pour segment initial une copie isomorphe des entiers naturels N
avec leur structure usuelle (le sens de « segment initial » I étant à
prendre pour la relation '<' qui n'est pas forcément une relation
d'ordre : si m<n et n est dans I alors m est dans I, et si m est dans
I et n n'y est pas alors m<n).

Théorème : Soit T une théorie consistante contenant Q et récursivement
énumérable (ce qui revient à dire qu'elle a une axiomatisation
récursivement énumérable).  Alors il existe une affirmation G, qu'on
peut explicitement écrire en fonction d'une récursive-énumération des
théorèmes de T, telle que ni G ni ¬G ne soit un théorème de T, et on
peut prendre pour G une affirmation Pi_1.  L'ensemble des théorèmes
(même Sigma_1) de T n'est pas récursif.

Remarques : On n'a pas besoin que T soit aussi forte que Peano.  On
n'a pas besoin que les axiomes de T soient vrais dans N, ni même que T
soit omega-consistante ou que T+Consis(T) soit consistante : on a
seulement besoin que T elle-même le soit.  Le résultat s'applique
aussi bien à Peano+Consis(Peano) qu'à Peano+¬Consis(Peano).
Évidemment, le résultat s'applique aussi à n'importe quelle théorie
consistante capable d'interpréter Q (par exemple, ZF, et ce, sans
supposer plus que Consis(ZF)).

Historique : J. B. Rosser, « Extensions of some theorems of Gödel and
Church », *Journ. Symb. Log.*, 1 (1936), 87-91.  (Je n'ai pas vérifié,
mais ça a l'air d'être ça.)

Démonstration : ce n'est pas difficile quand on connaît l'astuce.  On
prend une machine de Turing qui énumère les théorèmes de T et on
considère l'énoncé U(n,"P") qui dit « n est une trace d'exécution de
la machine de Turing en question, qui s'arrête en ayant énuméré P »
(ou bien « n est une démonstration de P » si on est parti d'une
axiomatisation récursive).  Par un argument diagonal facile on écrit
un énoncé G qui dit « pour tout m, si U(m,"G"), alors il existe n<m
tel que U(n,"¬G") » (c'est ça l'astuce de Rosser : ne pas essayer de
dire « je ne suis pas un théorème » mais « je ne suis pas un théorème
avant ma négation »).

Si G est un théorème de T, alors il existe un vrai entier naturel m
tel que U(m,"G") et U(n,"¬G") pour aucun n<m, et comme ceci est un
énoncé Delta_0 (= à quantificateurs bornés), c'est absolu (dans un
modèle quelconque de Q, comme les vrais entiers naturels forment un
segment initial, c'est vrai) donc Q le prouve, c'est-à-dire que Q
prouve ¬G, contradiction (T était supposée consistante).

Si ¬G est un théorème de T, alors il existe un vrai entier naturel n0
tel que U(n0,"¬G") (et U(m,"G") pour aucun m<=n) ; or Q prouve que
tout m est soit un vrai entier naturel <=n0 (écrit explicitement) soit
n0<m, pour ces derniers (Q prouve qu')il existe n<m (à savoir n=n0)
tel que U(n,"¬G") et pour les premiers Q prouve ¬(U(m,"G")) (ça c'est
un peu plus subtil, et c'est pour ça que j'ai demandé que m soit une
*trace d'exécution* de la machine de Turing : dans ce cas, U s'écrit
uniquement avec quantificateurs bornés parce qu'il y a juste à
vérifier des informations contenues dans n, ce qui donne le résultat),
bref, Q prouve G, une nouvelle contradiction.

Pour expliquer que l'ensemble des théorèmes (ne serait-ce que Sigma_1)
de T n'est pas récursif, on fait essentiellement la même chose, avec
une machine de Turing qui discerne si un énoncé (Sigma_1) est un
théorème et U(n,"P") qui dit « n est une trace d'exécution qui
discerne P comme étant un théorème » et U(n,"¬P") qui dit « n est une
trace d'exécution qui discerne ¬P comme étant un théorème », enfin,
bref, je m'exprime mal mais ça se comprend.

Voilà, j'espère ne pas m'être planté (je me suis fait avoir plusieurs
fois par les raisonnements à la fin ; évidemment, si on est prêt à
supposer qu'on prend pour arithmétique minimale quelque chose d'un peu
plus costaud que le strict minimum, ça marche déjà mieux).

Inexhaustibilité
----------------

From madore@clipper.ens.fr Sat Jan 22 18:51:58 2005
Article: 643 of ens.forum.sciences.maths.avancees
Subject: Godelisation iteree et inexhaustibilite (was: Re: notations ordinales...)

Bon, je raconte un autre truc dans la même ligne d'idées.  Le but est
d'expliquer ce qui se passe quand on essaie d'itérer le théorème de
Gödel « de façon transfinie » : on part d'une théorie arithmétique T
vraie et récursive (i.e., ses axiomes forment un ensemble récursif),
disons T=Peano, et on ajoute l'énoncé que cette théorie est
consistante (qui, d'après Gödel, n'est pas démontrable dans la
théorie), puis l'énoncé que *cette* théorie est consistante, « et
ainsi de suite » de façon transfinie.  Comment est-ce que ça
s'arrête ?  La question est, en fait, hautement subtile, et ce sont
Turing et Feferman qui l'ont résolue.

Le truc, c'est qu'il y a de la poussière sous le tapis, même si ce
n'est pas évident : la manière dont on Gödelise dépend de choix qu'on
fait, qui peuvent être rendus canoniques, disons, pour les ordinaux
successeurs, mais pas à tous les niveaux, et ces choix correspondent
essentiellement à des branches de O.  C'est-à-dire qu'en fait on itère
non pas sur les ordinaux (suffisamment petits, disons plus petits que
l'ordinal de Church-Kleene) mais, en fait, sur les notations ordinales
de Kleene.

Je commence par expliquer un exemple qui illustre bien pourquoi les
choses sont plus subtiles qu'on se l'imagine parfois (et notamment
pourquoi le théorème d'incomplétude de Gödel, on ne saurait trop le
souligner, s'applique non pas à une théorie récursivement énumérable
mais à une théorie *récursivement énumérée*).  J'espère que mes
explications un peu verbeuses seront claires.

Prenons un énoncé Pi_1 qui est vrai (dans les vrais entiers naturels,
hein ! quand je ne précise pas, « vrai » veut dire « vrai dans N », et
ma théorie initiale est supposée être non seulement récursive mais
aussi vraie dans N), c'est-à-dire de la forme (\forall n)(P(n)) où
P(n), prédicat Delta_0 (c'est-à-dire essentiellement finitiste : tous
les quantificateurs sont bornés), est vrai pour tout naturel n.  Bon,
peut-être que ma théorie T démontre l'énoncé, auquel cas ce que je
vais dire n'est pas très intéressant.  Mais peut-être qu'elle ne le
démontre pas.  En fait, je peux toujours supposer (c'est-à-dire, à
équivalence démontable dans T près pour (\forall n)(P(n))) que P(n)
est de la forme « la machine de Turing <foo> ne termine pas en n
étapes », et l'énoncé (\forall n)(P(n)) dit que la machine <foo> ne
termine pas du tout.  Par ailleurs, j'ai une autre machine de Turing,
<bar>, qui termine toujours, qui prend un naturel en entrée et renvoie
le n-ième axiome de la théorie T.  Maintenant je fabrique une
troisième machine de Turing, <foobar> qui fait la chose suivante :
quand on lui passe un entier naturel n, elle exécute d'abord <foo> sur
n étapes : si <foo> n'a pas terminé au bout de n étapes, elle exécute
<bar> sur l'entier naturel n, et si <foo> a terminé (c'est-à-dire
qu'on a réfuté P(n)) alors elle renvoie la conjonction de <bar>(n) et
de l'affirmation, que je noterai Consis(Tfoobar), « la théorie
composée de tous les axiomes énumérés par <foobar> est consistante »
(ce n'est pas grave d'utiliser <foobar> dans la définition de <foobar>
d'après les méthodes de Quine, et on sait qu'on peut coder la
consistance d'une théorie récursivement énumérée).  Bon, maintenant,
en vrai, on sait que P(n) est vrai pour tout n, donc <foo> ne termine
jamais, donc <foobar> renvoie exactement les mêmes axiomes que <bar>.
Et Consis(Tfoobar) est vrai, du coup : de fait, la théorie composée de
tous les axiomes énumérés par <foobar>, c'est la théorie T, et elle
est consistante.  Mais je n'appelle pas ça Consis(T), bêtement, parce
que, dans la façon dont c'est formulé, c'est différent : il faut bien
distinguer Consis(T) (ou Consis(Tbar), plutôt), qu'on construirait
normalement, et Consis(Tfoobar) telle que je l'ai décrite.  Il se
trouve que les deux affirmations sont vraies, mais Consis(Tfoobar) a
(potentiellement) plus de conséquences.  En effet, je peux faire dans
T le raisonnement suivant : si <foo> terminait (soit ¬P(n) pour un
certain n), alors <foobar> renverrait l'axiome Consis(Tfoobar), donc
Tfoobar prouverait Consis(Tfoobar), et par le théorème de Gödel ça
signifie que Tfoobar est inconsistante, i.e., ¬Consis(Tfoobar).  Par
contraposée, dans T, Consis(Tfoobar) prouve (\forall n)(P(n)).
Moralité : *n'importe quel* énoncé Pi_1 vrai est (démontrablement dans
T) conséquence d'un énoncé Consis(Tfoobar) pour une certaine
énumération <foobar> des axiomes de T !  Ceci est un théorème de
Turing.  En clair, le théorème de Gödel, non seulement il donne un
énoncé Pi_1 vrai et non démontrable, mais il donne *tous* les énoncés
Pi_1 vrais et non démontrables.  Scholie : Consis(T) ça ne veut rien
dire, il faut dire très très précisément comment on énumère les
axiomes de T.  Bon, quand même, si T est récursive (je veux dire, si
ses axiomes sont un ensemble récursif), on peut choisir une fonction
primitive récursive qui dit si un machin est un axiome de T ou pas, et
à ce moment-là il y a un Consis(T) canonique (à équivalence
démontrable dans T près, quoi).  Par défaut, c'est de ça qu'on parle.

Revenons aux notations ordinales.  On construit par induction
bien-fondée pour toute notation a (élément de O) une théorie T_a de la
façon suivante.  Si a=S(b) (successeur), on appelle T_a la théorie T_b
à laquelle on ajoute l'axiome Consis(T_a).  D'après ce que je viens
d'expliquer, ça n'a pas grand sens, mais, en fait, il faut dire que la
théorie T_a ce n'est pas juste un ensemble d'axiomes, c'est une
récursive énumération explicite de ces axiomes, et, du coup,
Consis(T_a) a bien un sens.  Pour a=0 on prend T_a=T.  Pour a=L(e) où
e est le code d'une fonction récursivement énumérable U(e,·) qui
énumère des notations ordinales b_i=U(e,i) vérifiant b_{i+1}>>b_i pour
tout i, on prend pour T_a la théorie dont les axiomes sont ainsi
énumérés (disons en énumérant diagonalement) par tous ceux des
T_{b_i}.  Bref, c'est la réunion, mais ce l'est de façon explicitement
énumérée.

Bon, en fait, j'ai un peu triché, parce qu'on ne peut pas faire
bêtement une récursion sur O vu que O n'est pas arithmétiquement
définissable.  Mais l'idée c'est qu'on peut définir, et énumérer
récursivement explicitement, une théorie T_a pour tout a entier
naturel, pas seulement a dans O : si a est de la forme S(b) il n'y a
pas de problème, si a=L(e) on fait ce que j'ai dit mais comme e n'est
pas obligé de terminer tout le temps (parce qu'on n'est pas en train
de supposer a dans O, là, donc peut-être que e fait des conneries) bah
ce n'est pas grave, le truc pour énumérer les axiomes de T_a il fait
ce qu'il peut et si jamais e ne termine pas il ne va pas terminer non
plus.  Peut-être même que e va énumérer S(a)=S(L(e)), auquel cas la
théorie T_a aura Consis(T_a) dans ses axiomes et elle sera donc
inconsistante (une théorie récursivement énumérable consistante ne
pouvant pas prouver sa propre consistance).  Mais bien sûr, si a est
dans O, T_a est vraie et donc consistante (elle a N pour modèle).

Bon, eh bien il y a un résultat de Feferman qui dit que *tout énoncé
vrai* de l'arithmétique est un théorème d'une des théories T_a pour un
a dans O.  (Et, du coup, plus précisément, il existe une branche de O
de longueur maximale, c'est-à-dire \omega_1^{CK}, telle que la réunion
des T_a sur cette branche soit une théorie - non récursivement
énumérable, certes - qui prouve n'importe quel énoncé vrai de
l'arithmétique.)  Ceci étant, ce n'est pas si intéressant que ça, en
fait : parce que l'information qui consiste à savoir que l'énoncé est
vrai, elle est cachée dans le fait que a est dans O : de fait, savoir
décider si un naturel est dans O ou pas, c'est quelque chose
d'exactement aussi difficile que de savoir décider si un énoncé
arithmétique est vrai ou pas (l'ensemble des énoncés vrais de
l'arithmétique du premier ordre, ou l'ensemble O, sont tous les deux
« Pi^1_1-complets », ce qui veut dire à peu près ce que j'ai dit) - et
c'est essentiellement ce que j'ai prouvé, là.

Ensuite, on peut vouloir faire quelque chose d'un peu plus
constructif, à savoir considérer des « progressions autonomes »,
c'est-à-dire très approximativement qu'on demande, pour passer de T_b
à T_a avec b<<a, que T_b « prouve que a est dans O » (ce qui ne veut
rien dire, parce que O n'est pas arithmétiquement définissable, mais
on peut dire quelque chose comme le fait que T_b prouve que l'ordre <<
sous a est récursivement bien fondé).  Là les choses sont
épistémologiquement beaucoup mieux fondées, mais je n'ai pas encore
compris exactement ce à quoi on arrive au bout du compte.

----------------------------------------------------------------------

From madore@clipper.ens.fr Mon Jan 24 22:40:57 2005
From: madore@clipper.ens.fr (Gro-Tsen)
Subject: Re: Godelisation iteree et inexhaustibilite (was: Re: notations ordinales...)

129.199.72.99 in litteris <ct39if$nm$1@clipper.ens.fr> scripsit:
> Attends, si je comprends bien, tu dis que
> - si l'on considère toutes les machines de Turing <foo> qui énumèrent
>   les axiomes de T, les Consis(<foo>) ne sont pas tous démontrablement
>   (dans T) équivalents ; et tu donnes d'ailleurs un exemple
> - mais, tu dis que ce n'est plus le cas si on considère les machines de
>   Turing qui se contentent de décider si un axiome donné est dans T.
> Et que donc, le deuxième point fournit pour une théorie T récursivement
> énumérable, un Consis(T) canonique. C'est bien ça ?

C'est effectivement ce que je pensais en écrivant mon message, mais en
fait je me suis planté.  Pour s'en convaincre, on construit une
machine qui doit déterminer si un axiome est dans T ou pas : elle fait
la même chose que la machine « raisonnable » sauf sur une certaine
suite infinie (récursive et sympa comme tout) d'affirmations
trivialement fausses (du genre Faux&Faux&...&Faux), pour la m-ième
desquelles elle va vérifier si P(n) est vrai pour tout n<=m et ensuite
renvoyer « oui, ça fait partie des axiomes » si cette vérification
échoue, « non, ça ne fait pas partie des axiomes » si effectivement
ces P(n) sont vrais.  Du coup, affirmer la consistance de la théorie
ainsi définie permet de démontrer P(n) pour tout n, alors que la
fonction indicatrice des axiomes de la théorie est récursive et même
primitive récursive.

> Alors, moi, je me demande ce qui se passe si on itère ordinalement l'ajout
> des Consis(.) avec ces Consis canoniques ? C'est possible, non ? Et alors,
> décrit-on une branche de O de longuer omega_1^{CK} ?

Eu égard à mon erreur que je viens d'expliquer, ce n'est pas la bonne
question à poser.  La bonne question à poser, c'est ce qui se passe
quand on considère des extensions autonomes.  Et apparemment, dans un
certain sens que je ne comprends pas bien, l'ordinal jusqu'auquel on
peut monter est l'ordinal « de Feferman-Schütte » \Gamma_0, (défini
comme ceci : on définit h(\alpha,\beta) en appelant h(0,\beta) =
\omega^\beta, et, si \alpha>0, h(\alpha,\beta) = le \beta-ième point
fixe commun à tous les h(\gamma,·) pour \gamma<\alpha ; alors \Gamma_0
est le plus petit point fixe de h(·,0) ; voir le message
<cnalom$m0r$1@clipper.ens.fr> aka maths:10130 pour plus de
précisions).

> Si tu continues à t'intéresser à ça, tu peux poster le résultat de tes
> lectures dans forum ? Moi, ça m'intéresse en tout cas...

Ouaip.  Si des gens veulent lire les articles dont il est question,
outre le livre de Torkel Franzén intitulé *Inexhaustibility*, il y a
deux articles notoires de S. Feferman :

* Solomon Feferman, « Transfinite recursive progressions of axiomatic
theories », *J. Symbolic Logic* 27 (1962) 259-316. [MR0172792 (30 #3011)].

* Solomon Feferman, « Systems of predicative Analysis », *J. Symbolic
Logic* 29 (1964) 1-30. [MR0193006 (33 #1228)].

Voir aussi <URL:
http://math.stanford.edu/~feferman/papers/predicativity.pdf >.

The set of Pi_1 theorems of Peano arithmetic is non recursive
-------------------------------------------------------------

https://groups.google.com/forum/#!msg/sci.math.research/CmQddAMpzGs/kTYZzJtyeV0J

David Madore    2/24/06
Hi,

I had always taken the following fact for granted, but I realize now
that I don't know how to prove it, and the question doesn't even seem
mentioned in any of the books I can find (e.g., *Metamathematics of
First-Order Arithmetic* by Hájek and Pudlak):

  Is the set of Pi_1 theorems of Peano arithmetic nonrecursive?

Comment: it is well-known that the set of Sigma_1 theorems is
nonrecursive (essentially because Sigma_1 theorems are exactly Sigma_1
true statements).  If the above is true then there exists a true Pi_1
statement such that P is not provable in Peano, and _that_ is not
provable in Peano+Consis(Peano) (otherwise we would have a decision
algorithm for Pi_1 theorems and the above says exactly that this does
not exist): i.e., there is an "undecidably undecidable" (but true)
statement.

Is this known?  If so, where can I find a proof?

  David Madore  2/24/06
David Madore in litteris <dtn8q2$fea$1...@news.ks.uiuc.edu> scripsit:

>   Is the set of Pi_1 theorems of Peano arithmetic nonrecursive?

Sorry, I think this is another instance of the general rule of "I'll
think about a problem for hours, and find the answer minutes after I
decide to ask the question publicly"...  So if I'm not mistaken,
here's a proof of this:

Let T1 and T2 be two Turing machines which enumerate recursively
enumerable sets S1 and S2 of integers which are disjoint but not
recursively separable (that is, there is no recursive set which
contains one and is disjoint from the other).  We also need the fact
that Peano arithmetic proves that S1 and S2 are disjoint (or, more
accurately, that there is no integer x which is enumerated by T1 and
by T2): this is harmless.  (The existence of T1 and T2 is proved,
e.g., in Roger's *Theory of Recursive Functions and Effective
Computability*, circa §7.7.)

Now given an integer x the statement "T2 never generates x" (that is,
"x does not belong to S2") is Pi_1.  Consider the set C of x such that
this is a theorem of Peano: if the set of Pi_1 theorems of Peano
arithmetic were recursive, then C would be recursive.  Certainly, C is
disjoint from S2 because Peano is sound.  But conversely, if x belongs
to S1 then that fact is a theorem in Peano (because it is a Delta_0
statement), so it is also a theorem in Peano that T2 never generates x
(because by assumption Peano proves disjointness of S1 and S2), i.e.,
x belongs to C.  So we have a recursive set C which contains S1 and is
disjoint from S2, a contradiction.

In fact the reasoning above shows that the set of Pi_1 theorems of
Peano and the set of Pi_1 antitheorems (=negation is a theorem) are
recursively inseparable.  So it is not possible that for all Pi_1
statements P either Peano+Consis(Peano) proves Consis(Peano+P) or
Peano+Consis(Peano) proves Consis(Peano + not-P): for if this were the
case we would have a recursive separation of the set of Pi_1 theorems
into certain consistent statements (including all Pi_1 theorems) and
certain unprovable statements (including all Pi_1 antitheorems).  In
particular, there is a Pi_1 statement P such that Peano+Consis(Peano)
does not prove either Consis(Peano+P) or Consis(Peano + not-P); and of
course, P must be true, because otherwise not-P would be a theorem (so
Peano+Consis(Peano) would prove Consis(Peano + not-P)), but it must
also be unprovable in Peano (otherwise Peano+Consis(Peano) would prove
Consis(Peano+P)).  Ergo, I have shown that there is a true Pi_1
statement P which is not provable in Peano (nor refutable) but such
that Peano+Consis(Peano) cannot show that P is unprovable nor can it
show that it is consistent.

And I'm sure P can be made explicit (using effective inseparability).
Also, I'm sure we can go much further (for all integers k, find a true
Pi_1 statement P such that any addition of up to k levels of "is
consistent" or "is unprovable" is true: P is true, P is consistent, P
is unprovable, "P is consistent" is consistent, "P is consistent" is
unprovable, "P is unprovable" is consistent, "P is unprovable" is
unprovable, etc., where each level refers to a formal system which
adds consistency of the previous one to its axioms).

I hope I didn't make any major mistakes here.

I'd still like to find a textbook reference to such questions, because
I'm sure there are more interesting things to be said than my modest
knowledge will let me discover.

Schéma d'axiomes de Hilbert
---------------------------

From madore@clipper.ens.fr Tue Nov 15 15:25:27 2005
Article: 12297 of ens.forum.sciences.maths

Une façon de définir le calcul propositionnel classique, c'est le
schéma d'axiomes de Hilbert : le fragment pour l'implication est

(I) A=>A	[cet axiome n'est pas strictement nécessaire]
(K) A=>B=>A	[parenthéser vers la droite, bien sûr...]
(S) (A=>B=>C)=>(A=>B)=>A=>C
(P) ((A=>B)=>A)=>A

- ensuite on peut rajouter des fragments pour d'autres connecteurs
(par exemple pour le ou logique ce sera A=>A\/B, B=>A\/B et
(A=>C)=>(B=>C)=>(A\/B)=>C) ; chacun de ces trucs est un schéma
d'axiomes, i.e., tu mets ce que tu veux à la place de 'A', 'B' et 'C'
et tu as un axiome ; et la seule règle de déduction est le modus
ponens (si tu as A=>B et que tu as A alors tu as B).

Eh bien le calcul propositionnel intuitionniste s'obtient en virant
uniquement le schéma d'axiome (P), ou loi de Pierce, qui, en présence
d'autres connecteurs (notamment la négation, qu'on peut voir comme un
simple sucre syntaxique pour « machin => Faux », où Faux est le
connecteur nullaire \bot, l'affirmation universellement fausse),
équivaut à (¬¬A)=>A (l'implication dans l'autre sens, elle, se
démontre même en calcul propositionnel intuitionniste) ou A\/¬A
(« tertium non datur »).  Moralement, donc, tu dis que ce n'est pas
pareil de montrer que quelque chose est « pas faux » que de montrer
que c'est vrai.

Bon, ça ce n'est pas forcément très très parlant.  On peut donc
chercher une sémantique à mettre derrière la syntaxe - une
interprétation, quoi - pour y comprendre quelque chose, de même que
pour comprendre la logique classique on étudie les algèbres de Boole
et on parle de valeurs de vérité.  En voici une, qui parlera sans
doute le plus à un mathématicien.  Considérons un espace topologique
X, et appelons « valeurs de vérité » des ouverts de X ; interprétons
les connecteurs du calcul propositionnel comme des opérations sur ces
ouverts : le /\ (et logique) est l'intersection, le \/ (ou logique)
est la réunion, le Vrai est X tout entier, le Faux est l'ensemble
vide, et U=>V est le plus grand ouvert de X dont l'intersection avec U
soit V (c'est-à-dire, en termes plus clairs, l'intérieur de la réunion
de V et du complémentaire de U), et bien sûr ¬U c'est pareil pour
V=vide, soit l'intérieur du complémentaire de U (ou complémentaire de
l'adhérence, si on veut).  Ceci définit bien une sémantique pour la
logique intuitionniste, i.e., tout théorème du calcul propositionnel
intuitionniste donne l'ouvert plein dans n'importe quel espace
topologique.  Et, mieux, cette sémantique est complète, en ce sens
qu'un énoncé est un théorème (du calcul propositionnel intuitionniste)
*si et seulement si* il donne l'ouvert plein dans n'importe quel
espace topologique.  Les mathématiciens ont donc l'impression de
comprendre quelque chose à la logique intuitionniste : c'est juste des
histoires familières d'espaces topologiques.  Plus généralement, on
appelle « algèbre de Heyting » un ensemble muni d'opérations
correspondant aux connecteurs du calcul propositionnel (et, ou,
implication, vrai, faux, éventuellement négation) et qui vérifie les
lois de la logique intuitionniste (OK, il y a des façons plus sympa de
définir ces choses-là, par exemple comme un ensemble partiellement
ordonné tel que gnagnagna, mais je ne sais plus ça par coeur) : c'est
l'analogue des algèbres de Boole pour la logique classique, et
l'ensemble des ouverts de n'importe quel espace topologique (ordonné
par l'inclusion) forme une algèbre de Heyting (avec des propriétés
d'universalité si on fait varier l'espace topologique).

Les informaticiens, eux, ils préfèrent voir les choses comme une
théorie des types : il se trouve (c'est un bout de l'« isomorphisme de
Curry-Howard ») que les théorèmes du calcul propositionnel
intuitionniste sont exactement les types peuplés du lambda-calcul typé
(enfin, d'un certain lambda-calul typé).  C'est ce qui me permet, par
exemple, de « démontrer » que (A=>B=>C)=>(B=>A=>C) (en calcul
propositionnel intuitionniste, donc) en utilisant OCaml et en une
ligne (alors qu'à partir du schéma de Hilbert ou en raisonnant sur des
espaces topologiques faudrait un peu plus suer) :

 # fun f -> fun x -> fun y -> f y x ;;
 - : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c = <fun>

(Pour plus d'explications à ce sujet et un exemple un peu plus
fouillé, voir le message <dgjaqo$ovv$3@clipper.ens.fr> aka
alt.bavardage.maths:3523 : je n'ai pas écrit explicitement que tout
était vrai en logique intuitionniste, mais ça l'est.  Pour le lien
avec le schéma de Hilbert, voir aussi le manuel du langage
Unlambda...)  Noter que dans cette présentation, la loi de Pierce
qu'on a retirée pour former le calcul propositionnel intuitionniste
correspond au « call/cc » (« call-with-current-continuation ») qu'ont
certains langages de programmation : cf. <URL:
http://www.madore.org/~david/computers/callcc.html >.

Encore une façon de voir la logique intuitionniste, c'est par le
calcul des séquents.  Finalement, je pense que c'est la meilleure, et
ce n'est pas difficile, mais c'est un peu pénible à écrire dans un
message de forum : demande-moi IRL un jour.  En tout cas, aussi bien
la présentation « calcul des séquents » que la présentation « types du
lambda-calcul » laissent l'idée morale que la logique intutionniste
correspond à briser une symétrie qui existait entre « prémisses et
conclusion » dans la logique classique.

Bon, mais la logique intuitionniste ne s'arrête pas au calcul
propositionnel : exactement comme en logique classique, tu as un
calcul des prédicats qui le complète, et tu peux éventuellement faire
des mathématiques dessus.  Pour définir la syntaxe (et la
démonstration syntaxique) du calcul des prédicats intuitionniste, on
complète le schéma de Hilbert exactement comme on le fait pour la
logique classique : il n'y a pas vraiment de subtilité cachée, là, je
crois (enfin, si on le fait vraiment exprès on doit pouvoir se
planter, mais bon...).  On peut obtenir une sémantique avec des
modèles à valeurs dans des algèbres de Heyting - mais il y a quelques
subtilités - ou avec les topoï (à ce sujet, voir les références que je
donne dans le message <dkfpev$b3f$1@clipper.ens.fr> aka
maths.avancees:1109).  Pour des exemples de mathématiques qu'on peut
faire ensuite, voir le message <atncrj$c81$1@clipper.ens.fr>, aka 7074
de ce conti, et son thread (je pense que ça devrait être relativement
compréhensible).  Une des choses à avoir à l'esprit, notamment, c'est
que prouver ¬\forall x(P(x)) ce n'est pas du tout pareil que prouver
\exists x(¬P(x)) : ça, on peut même dire, c'était la motivation
initiale de Brouwer en imaginant la logique intuitionniste (même si
lui ne l'imaginait pas de la façon dont elle est actuellement
formalisée - il en aurait même probablement frissonné d'horreur).

---------------------------------------------------------------------------

From madore@clipper.ens.fr Sun Sep 18 11:08:40 2005
Article: 3523 of ens.forum.alt.bavardage.maths

Tz'1 in litteris <dgi7fj$796$1@clipper.ens.fr> scripsit:
> Je viens de terminer une périlleuse aventure de calcul propositionnel, à
> savoir démontrer à partir des nombreux axiomes du cours de P. Dehornoy
> (voir http://math.unicaen.fr/~dehornoy) que (F=>G et G=>H)=>(F=>H), en
> n'utilisant que le modus ponens et en m'inspirant fortement de sa preuve
> que sous les hypothèses F=>G et G=>H on montre F=>H. Tout ce que je peux
> dire, c'est que ça fait déjà 8 modus ponens avec des formules longues
> comme ma feuille (un A4 en paysage).

Voyons voyons, comment fait-on ça systématiquement ?  Pour vérifier
mes affirmations je vais utiliser l'isomorphisme de Curry-Howard et le
typeur de OCaml (il faut observer les types des objets construits : ce
sont des théorèmes du calcul propositionnel si on lit « -> » comme
« implique » et « * » comme « et ») : d'abord pour représenter les
axiomes,

 # let p1 = fun (x,y) -> x ;;
 val p1 : 'a * 'b -> 'a = <fun>
 # let p2 = fun (x,y) -> y ;;
 val p2 : 'a * 'b -> 'b = <fun>
 # let q = fun x -> fun y -> (x,y) ;;
 val q : 'a -> 'b -> 'a * 'b = <fun>
 # let k = fun x -> fun y -> x ;;
 val k : 'a -> 'b -> 'a = <fun>
 # let s = fun x -> fun y -> fun z -> (x z) (y z) ;;
 val s : ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c = <fun>

puis pour vérifier l'affirmation qu'on cherche à prouver

 # let goal = fun (u, v) -> fun t -> v (u t) ;;
 val goal : ('a -> 'b) * ('b -> 'c) -> 'a -> 'c = <fun>

qu'il est assez clair de savoir comment réécrire en fonction de p1, p2
et q :

 # fun pair -> fun t -> (p2 pair) ((p1 pair) t) ;;
 - : ('a -> 'b) * ('b -> 'c) -> 'a -> 'c = <fun>

puis on applique un niveau d'« élimination d'abstraction » comme
expliqué sur <URL:
http://www.madore.org/~david/programs/unlambda/#lambda_elim >,

 # fun pair -> s (k (p2 pair)) (p1 pair) ;;
 - : ('a -> 'b) * ('b -> 'c) -> 'a -> 'c = <fun>

puis un autre (c'est là que ça devient assez gore, mais nous aimons
tous programmer en Unlambda) :

 # s (s (k s) (s (k k) p2)) p1 ;;
 - : ('_a -> '_b) * ('_b -> '_c) -> '_a -> '_c = <fun>

(tiens, OCaml perd le polymorphisme à ce stade-là), et on arrive
effectivement à 8 modi ponentes.  Pour dérouler complètement l'arbre
de démonstration, il faut typer les sous-parties, ce qui est facile
(quoique légèrement fastidieux, dommage que je ne sache pas demander à
OCaml d'afficher ça) maintenant qu'on a l'expression et son type
global :

S(S(KS)(S(KK)P2))P1: (A=>B)*(B=>C)=>A=>C
 par 2 modi ponentes successifs de
  S: ((A=>B)*(B=>C)=>(A=>B)=>A=>C)=>((A=>B)*(B=>C)=>(A=>B))=>(A=>B)*(B=>C)=>A=>C
   (axiome S, "A2" chez Dehornoy)
 sur
  S(KS)(S(KK)P2): (A=>B)*(B=>C)=>(A=>B)=>A=>C
   par 2 modi ponentes successifs de
    S: ((A=>B)*(B=>C)=>(A=>B=>C)=>(A=>B)=>A=>C)=>((A=>B)*(B=>C)=>A=>B=>C)=>(A=>B)*(B=>C)=>(A=>B)=>A=>C
     (axiome S, "A2" chez Dehornoy)
   sur
    KS: (A=>B)*(B=>C)=>(A=>B=>C)=>(A=>B)=>A=>C
     par modus ponens de
      K: ((A=>B=>C)=>(A=>B)=>A=>C)=>(A=>B)*(B=>C)=>(A=>B=>C)=>(A=>B)=>A=>C
       (axiome K, "A1" chez Dehornoy)
     sur
      S: (A=>B=>C)=>(A=>B)=>A=>C
       (axiome S, "A2" chez Dehornoy)
   et
    S(KK)P2: (A=>B)*(B=>C)=>A=>B=>C
     par 2 modi ponentes successifs de
      S: ((A=>B)*(B=>C)=>(B=>C)=>A=>B=>C)=>((A=>B)*(B=>C)=>B=>C)=>(A=>B)*(B=>C)=>A=>B=>C
       (axiome S, "A2" chez Dehornoy)
     sur
      KK: (A=>B)*(B=>C)=>(B=>C)=>A=>B=>C
       par modus ponens de
        K: ((B=>C)=>A=>B=>C)=>(A=>B)*(B=>C)=>(B=>C)=>A=>B=>C
         (axiome K, "A1" chez Dehornoy)
       sur
        K: (B=>C)=>A=>B=>C
         (axiome K, "A1" chez Dehornoy)
     et
      P2: (A=>B)*(B=>C)=>B=>C
       (axiome P2, "A8" chez Dehornoy)
 et
  P1: (A=>B)*(B=>C)=>(A=>B)
   (axiome P1, "A7" chez Dehornoy)

Donc je suis d'accord pour les 8 modi ponentes, mais l'expression la
plus longue qui apparaît ci-dessus fait 95 symboles, ce n'est pas si
monstrueux que ça, quand même.

> Je commence à me demander quelle longueur aurait une démonstration
> suivant le même fonctionnement que (p=>q)<=>(non p ou q), ou encore que
> (F ou F)<=>F...

Il est clair que le schéma d'axiomes de Hilbert (celui que Dehornoy
introduit sans le nommer, en cachant même les traditionnels "S" et "K"
sous des numéros peu amènes) donne des démonstrations volumineuses.
Mais il faut se convaincre que toute l'information est contenue dans
l'expression « S(S(KS)(S(KK)P2))P1 », car c'est elle qui *est* la
démonstration (le reste n'est que du typage).  Et par ailleurs, il est
notoire qu'Unlambda (qui est exactement le correspondant par
Curry-Howard du schéma de Hilbert) est verbeux par rapport à un autre
langage de programmation, mais rien n'oblige à l'utiliser : si j'écris
« goal = fun (u, v) -> fun t -> v (u t) » c'est quand même plus
parlant que « goal = s (s (k s) (s (k k) p2)) p1 »...

Douglas Hofstadter, dans *Gödel, Escher, Bach*, présente un système
(qui comporte ce qu'il appelle des « fantaisies », c'est-à-dire en
fait exactement des lambda-abstractions) qui permet d'avoir des
démonstrations de taille déjà beaucoup plus gérable.

> Tz'1, qui cherche des exos de khôlles mais qui pense que ça sera un peu
> trop long ça...

Euh oui, je crois aussi.  Ils voient les axiomes de Hilbert du calcul
propositionnel en taupe, maintenant ?

Vérité
------

### An introduction to independence proofs
- ens.forum.sciences.maths.avancees:2309 et thread associé

----------------------------------------------------------------
Les deux exercices suivants (tirés de K. Kunen, « Set Theory: an
Introduction to Independence Proofs », Studies in Logic and the
Foundations of Mathematics 102, Elsevier 1980 - que je ne recommande
d'ailleurs pas particulièrement) m'ont fait complètement bugguer,
surtout mis l'un à côté de l'autre :

Exercice 1.  Donner une définition D d'un ensemble M et d'une relation
e sur M telle que : (a) [ZFC prouve qu']il existe effectivement M et e
satisfaisant cette relation, même avec M dénombrable, et on pourra
aussi facilement imposer leur unicité, et (b) pour tout théorème P de
ZFC, [ZFC prouve que, si M et e vérifient la définition en question,]
(M,e) |= P.

Commentaires : Comprendre l'énoncé est très subtil !  On a envie de
traduire ça en disant « il existe un ensemble M et une relation e
dessus tels que (M,e) |= P pour tout théorème P de ZFC », mais ZFC ne
prouve pas ça, bien sûr, puisque ça voudrait dire que (M,e) est un
modèle de ZFC.  Le truc, c'est que même si ZFC ne prouve pas que pour
tout théorème P de ZFC on a (M,e)|=P, on a quand même que pour tout
théorème P de ZFC, ZFC prouve (M,e)|=P.  Mais pour dire ça on est
obligé de dégager le (a) parce que dire « montrer qu'il existe (M,e)
tel que pour tout théorème P de ZFC, ZFC prouve (M,e)|=P » ne veut
rien dire, et ZFC _ne prouve pas_ « il existe (M,e) tel que pour tout
théorème P de ZFC, ZFC prouve (M,e)|=P ».  Le Club Contexte vous
félicite si vous avez suivi !  Mais même une fois qu'on a compris
l'énoncé, ce n'est pas hyper facile, parce que s'il est vrai (c'est le
« théorème de réflexion ») que pour tout théorème P de ZFC, ZFC prouve
qu'il existe un ensemble M dénombrable transitif tel que (M,\in)|=P
(et il faut s'en servir dans l'exercice), où \in est la relation
d'appartenance, pourtant, _on ne peut pas utiliser la relation \in_
comme relation e dans l'exercice ci-dessus ! et c'est justement
l'objet de l'exercice qui suit.  Je donne quand même une indication :
il faut _aussi_ utiliser le théorème de compacité.

Exercice 2.  On suppose que pour un certain prédicat D on a les
hypothèses suivantes : (a) ZFC prouve qu'il existe effectivement M
satisfaisant D, et (b) pour tout axiome P de ZFC, ZFC prouve que, si M
vérifie D alors (M,\in) |= P.  Montrer alors que ZFC est
\omega-inconsistant (i.e., qu'il existe une formule H(n) telle que
H(n) soit un théorème pour tout entier naturel mais que ¬(\forall n
\in \omega)(H(n)) le soit).

Commentaires : Bref, si on avait réussi à résoudre l'exercice
précédent avec e=\in, alors ZFC prouverait son incohérence.
Indication : soit Q l'énoncé « tout M vérifiant D est un modèle de
ZFC » : il est facile de voir que ZFC + ¬Q est \omega-inconsistant ;
mais si on suppose Q, il existe un modèle transitif de ZFC, donc un
modèle transitif de plus petit rang, et celui-ci ne contient pas de
modèle transitif donc vérifie ¬Q, etc.

--------------------------- réponse ----------------------------
Voici comment je vois maintenant les choses :

En travaillant dans ZFC, on ne sait pas si ZFC a un modèle.  On peut
cependant considérer les entiers n tels que les n premiers axiomes[#]
de ZFC aient un modèle.  D'après le théorème de compacité [je me suis
trompé en écrivant « complétude » au lieu de « compacité » dans le
grand-père de ce message], soit il y a un N tel que les n premiers
axiomes de ZFC aient un modèle pour n<=N et pas au-delà, soit ZFC a un
modèle.  On peut alors appeler (M,e) un modèle de, dans le premier
cas, les N premiers axiomes de ZFC, et dans le second cas, ZFC.  Ceci
fournit un prédicat D(M,e) portant sur[*] le couple (M,e) (« être un
modèle des N premiers axiomes de ZFC pour le plus grand N tel que les
N premiers axiomes de ZFC aient un modèle, ou bien être un modèle de
ZFC si ZFC a un modèle »).  Bref, on obtient (M,e) (ou plus
exactement, un prédicat D(M,e) les définissant) tel que ZFC prouve que
(M,e) existe bien, et que, pour tout entier n, ZFC prouve que (M,e)
vérifie les n premiers axiomes de ZFC (car il est bien connu que ZFC
prouve la consistance des n premiers axiomes de ZFC, pour tout n).
Ceci n'est pas uniforme en n, évidemment, sans quoi ZFC prouverait que
ZFC a un modèle.

[#] En général, en fait, il est plus agréable de prendre ZFC dans
lequel les axiomes de sélection et remplacement ont été limités aux
propriétés Sigma_n.  Mais ça ne change rien à ce que je dis.

[*] En travaillant un peu avec L (même si je n'ai pas vérifié avec un
soin infini), on doit même d'ailleurs pouvoir assurer l'unicité de ce
couple (M,e) (genre, prendre le premier couple (M,e) qui vient dans le
bon-ordre canonique de L, sachant qu'il doit forcément y en avoir un).
Alors le prédicat D(M,e) _définit_ vraiment M et e.

C'est ce qui était demandé par mon premier exercice.

Maintenant, si on essaie de prendre M transitif dans ce qui précède,
on se heurte au problème suivant : certes on peut considérer les n
tels que les n premiers axiomes de ZFC aient un modèle transitif, mais
on n'a plus de théorème de compacité : il est parfaitement
envisageable que pour chaque n les n premiers axiomes de ZFC aient un
modèle transitif, et pourtant que ZFC n'ait pas de modèle transitif.
C'est d'ailleurs ce qui se passe dans le plus petit modèle transitif S
de ZFC s'il existe (il est alors bien défini, et c'est un L_alpha).

Ou, pour dire les choses autrement : si on appelle alpha_n le plus
petit ordinal (s'il exste) tel que L_{alpha_n} soit un modèle des n
premiers axiomes de ZFC, et alpha_omega le plus petit ordinal (s'il
existe) tel que L_{alpha_omega} soit un modèle de ZFC (c'est le modèle
transitif minimal S, justement), alors ZFC prouve pour chaque n que
alpha_n existe, mais il ne prouve pas que la suite (alpha_n) existe,
et même si tous les alpha_n existent rien ne dit que leur limite soit
alpha_omega (au contraire : si alpha_omega existe, L_{alpha_omega}
vérifie « pour tout n, alpha_n est bien défini », donc la suite
(alpha_n) est bien définie dans L_{alpha_omega}, donc sa limite _ne
peut pas_ être alpha_omega).

C'est ce qui justifie de se poser la question de mon second exercice.


Maintenant supposons que pour un certain prédicat D(M) portant sur un
ensemble transitif M, ZFC prouve les choses suivantes :

(P) il existe un M (transitif) tel que D(M),

(Q_n) tout M (transitif) vérifiant D(M) est un modèle transitif des n
premiers axiomes de ZFC.

Je suppose bien sûr que pour tout n ZFC prouve (Q_n), pas que ZFC
prouve « pour tout n (Q_n) ».  Soit Q cette dernière affirmation,
« pour tout n, (Q_n) » : manifestement, c'est encore équivalent à
« tout M (transitif) vérifiant D(M) est un modèle transitif de ZFC ».

Alors la théorie ZFC+¬Q est omega-inconsistante, c'est-à-dire qu'il y
a un prédicat d'une variable entière (en l'occurrence (Q_n)) tel que
la théorie en question prouve Q_n pour tout n mais prouve la négation
de « pour tout n, (Q_n) ».  J'ai tout fait pour.

Quant à la théorie ZFC+Q, elle prouve P et Q, donc elle prouve
l'existence d'un modèle transitif de ZFC.  Or (en raisonnant dans
cette théorie,) s'il existe un modèle transitif de ZFC, il existe un
plus petit modèle transitif de ZFC, S, et on a S|=P et S|=Q_n pour
tout n, donc S|=Q, donc S |= « il existe un modèle transitif de ZFC »,
ce qui n'est pas le cas (puisque S est minimal, justement).  Donc
ZFC+Q est inconsistante.  [Je crois bien que c'est inconsistante tout
court, et pas juste omega-inconsistante, mais j'ai quand même un petit
doute, là.]

Du coup, ZFC tout court est omega-inconsistante.  (Si ZFC+Q et ZFC+¬Q
sont omega-inconsistantes, alors ZFC l'est, ce n'est pas difficile de
s'en convaincre.)  Noter que tout ça (« ZFC+¬Q est
omega-inconsistante », « ZFC+Q est inconsistante », « ZFC est
omega-inconsistante »), ce sont des théorèmes d'une méta-théorie sans
grande importance dans laquelle on a supposé « il existe un prédicat D
tel que (etc.) ».  Typiquement cette méta-théorie pourrait aussi être
ZFC (mais je crois qu'une théorie faible comme Peano suffirait tout à
fait).  Ce n'est pas très important, mais c'est juste pour ça que
c'est un peu plus conceptuel que le premier exercice dans lequel on
construit explicitement un prédicat D(M,e) donc on n'a pas à se
soucier de méta-théorie...

### Grands cardinaux et ZFS

Encore un exercice instructif (qui permet de comprendre en quoi les
grands cardinaux sont des choses puissantes) :

On suppose qu'il existe un cardinal inaccessible.  Montrer pour tout
énoncé P que « si P est un théorème de ZFC alors P est vrai ».

(Remarque : on ne peut évidemment pas quantifier sur P puisqu'il est
question de la vérité de P ; on demande donc de prouver cette
affirmation pour tout P, pas de prouver l'affirmation « machin pour
tout P ».)

        Indication : il suffit de prouver : « si ¬P, alors il existe un
        modèle
        transitif de ZFC+¬P » ; or il existe une classe close cofinale sous
        tout cardinal régulier indénombrable d'ordinaux \alpha tels que
        V_\alpha soit un modèle de ¬P (réflexion), et si \kappa est
        inaccessible, V_\kappa est un modèle de ZFC et il existe un
        ensemble
        clos confinal de \alpha sous \kappa tels que V_\alpha soit
        élémentairement équivalent à V_\kappa.


À la réflexion, c'est faux (je vais expliquer pourquoi), et le bon
énoncé est :

        On suppose que toute classe close cofinale d'ordinaux contient
        un cardinal régulier (« On est Mahlo »).  Montrer pour tout
        énoncé P que « si P est un théorème de ZFC alors P est vrai ».

D'abord, j'explique ce que signifie cette hypothèse et pourquoi je la
traduis « On est Mahlo ».  C'est une hypothèse qui permet de générer
beaucoup d'inaccessibles : déjà, en l'appliquant à la classe des
cardinaux singuliers, elle prouve qu'il existe un cardinal
inaccessible, et facilement que tout cardinal est majoré par un
inaccessible ; mais elle prouve mieux : il existe un cardinal régulier
qui est limite d'inaccessibles (i.e., « hyperinaccessible »), et tout
cardinal est majoré par un hyperinaccessible ; et il existe un
cardinal régulier qui est limite de ça, etc.

Un cardinal inaccessible \kappa est dit Mahlo lorsque l'ensemble des
cardinaux réguliers plus petits que lui est stationnaire dans \kappa
(i.e., rencontre tout ensemble clos cofinal dans \kappa).  Mon
hypothèse dit donc essentiellement que la classe des ordinaux (On) est
un cardinal Mahlo.  En termes de consistance, c'est moins fort que de
demander qu'il existe un cardinal Mahlo, mais l'hypothèse dont j'ai
envie est bien que On soit Mahlo : par exemple, ça ne me convient pas
s'il y a juste un cardinal Mahlo et pas d'inaccessible au-dessus.
L'hypothèse « On est Mahlo » est une infinité d'axiomes (c'est
essentiel pour que l'exercice puisse marcher, comme je vais
l'expliquer), un pour chaque formule définissant une classe
d'ordinaux.  Il faut penser à cette hypothèse un peu comme le schéma
de remplacement, c'est un schéma de clôture de l'univers (d'ailleurs,
moralement, le schéma de remplacement affirme que « On est
inaccessible »).
Bon, maintenant pourquoi mon exercice était trivialement faux avec
juste « il existe un cardinal inaccessible » ?  Notons (H) l'hypothèse
« il existe un cardinal inaccessible » - peu importe ce que c'est
exactement, en fait, du moment qu'elle est consistante.  Par Gödel,
ZFC+(H) ne peut pas prouver Consis(ZFC+(H)).  Donc il existe un modèle
de ZFC+(H)+¬Consis(ZFC+(H)) : dans ce modèle, ZFC « prouve » ¬(H) (je
mets des guillemets parce que c'est une « preuve » qui n'est pas
standard, heureusement), et pourtant (H) est vrai.  Quand on y pense,
c'est pervers : c'est un monde dans lequel les cardinaux inaccessibles
existent mais sont démontrablement impossibles. ;-) En tout cas, ça
réfute l'exercice comme je l'avais posé : on a simultanément
« ZFC|-¬(H) » et (H).  Et aucun axiome seul, que ce soit « il existe
un cardinal inaccessible », « il existe un cardinal Mahlo » ou « il
existe un cardinal Vachement Super Grand » ne peut entraîner
« (ZFC|-P)=>P » pour tout P.

(Ce qui n'allait pas dans mon indication c'était justement le point
« clos cofinal sous tout cardinal <schmurz> » : les ordinaux \alpha
tels que V_\alpha |= ¬P sont une classe close cofinale mais qui peut
commencer très haut : on s'en persuade en prenant justement pour ¬P
l'énoncé « il existe un inaccessible ».  En revanche, si On est Mahlo,
ce n'est pas grave, on va trouver plein de cardinaux inaccessibles
dans ces \alpha, donc plein de modèles de ZFC.  Là je pense qu'on peut
dire que j'ai vraiment démontré le truc.)

Il y a un truc qui marche avec un cardinal inaccessible, quand même,
donc une autre façon de réparer l'exercice :

        On suppose qu'il existe un cardinal inaccessible.  Montrer
        pour tout énoncé _arithmétique_ P que « si P est un théorème
        de ZFC alors P est vrai ».

Mais là c'est vraiment facile : si \kappa est inaccessible, V_\kappa
est un modèle de ZFC ayant pour entiers naturels les vrais entiers
naturels, donc tout ce que ZFC démontre à leur sujet est vrai...


### Définition de « vrai »

> Tiens, puisqu'on en discutait l'autre jour, c'est typiquement le genre 
> de questions dont j'ai beaucoup de mal à comprendre le sens. Ca veut dire 
> quoi "vrai" dans cette phrase ?

Ah oui, je comprends ce qui te perturbe : « vrai » est subtilement
polysémique ; enfin, non, c'est toujours le même sens, mais des
emplois subtilement différents du même sens.  Quand on dit que « P est
vrai dans M » - où M est une structure - c'est la notion de
satisfaction dans un modèle/structure, mais quand on dit que « P est
vrai » tout court, c'est juste de l'emphase pour dire « P » (i.e.,
<truc> peut se dire « <truc> est vrai » ou « "<truc> est vrai" est
vrai », etc.), de même que « P est faux » est une variante emphatique
de « ¬P ».  En fait, ces deux emplois de « vrai » se rejoignent avec
la notion de satisfaction dans une classe : le « vrai » tout court est
juste le « vrai » dans la classe universelle (V = {x|x=x}).

Donc, reprenons : si P est un prédicat du langage de la théorie des
ensembles :

1. dire que « P est vrai » signifie juste P, (i.e., l'écriture V|=P
   sera considérée comme un rallongement inutile de P),

2. dire que « P est vrai dans la classe M », où M est la classe {x |
   H(x)} définie par un prédicat H (mettons pour simplifier une classe
   transitive, mais on pourrait aussi prendre une classe avec une
   relation-classe dessus), ça veut juste dire l'énoncé obtenu en
   remplaçant tous les quantificateurs dans P par des quantificateurs
   gardés par H (i.e. : on remplace les « pour tout x » par « pour
   tout x tel que H(x) » et « il existe un x » par « il existe un x
   tel que H(x) »), on dit encore que c'est l'énoncé P _relativisé_ à
   la classe M, et on note M|=P,

3. dire que « P est vrai dans la structure (M,e) » (où M est un
   ensemble et e une relation binaire sur M) signifie l'énoncé obtenu
   en remplaçant tous les quantificateurs de P par des quantificateurs
   portant sur M et tous les « u \in v » par des « e(u,v) », et on
   note ça (M,e)|=P.

La différence essentielle entre l'usage 3 et les usages 1-2, c'est que
dans l'usage 3 on peut aussi définir « P est vrai dans la structure
(M,e) » non pas pour P un _prédicat_ mais le _code arithmétique_ d'un
prédicat, c'est-à-dire qu'on peut écrire une formule « (M,e) |= #P »
qui dit que la formule de code #P est satisfaite dans la structure
(M,e) : _ceci n'est pas possible pour le sens 1 (ou 2, a fortiori)_
comme l'affirme un célèbre théorème de Tarski (par ailleurs assez
trivial : si on pouvait écrire une formule V |= #P, on pourrait
facilement construire une formule qui dit d'elle-même qu'elle est
fausse.  (En revanche, on peut écrire une formule V |=_n #P qui
fonctionne uniquement pour les énoncés \Sigma_n-ou-moins, avec n
fixé ; mais le point est qu'on ne peut pas uniformiser sur n.)

On passe souvent sous silence la distinction entre une formule et son
code arithmétique, mais elle est essentielle ici parce que c'est ce
qui permet de quantifier sur les formules (sans faire de la logique du
second ordre ou quelque chose comme ça).  Par exemple, « (M,e) est un
modèle de ZFC » (si M est un ensemble et e une relation dessus) est
bien un énoncé (il se traduit : « pour tout code-de-formule #P qui
fait partie des codes-des-axiomes-de-ZFC, on a (M,e) |= #P » - comme
on utilise le code #P de P, on peut quantifier dessus) ; alors que
quand on se permet de dire « M est un modèle de ZFC » où M est une
classe (typiquement, M la classe des ensembles constructibles, ou,
tautologiquement, la classe universelle), c'est une infinité d'énoncés
qu'on fait à la fois, un pour chaque axiome de ZFC (à savoir les mêmes
énoncés relativisés à la classe M).  Et ce passage sous silence est
*d'autant plus testique* que l'exercice 1 du message précédent
montrait qu'il y a des cas où ZFC va effectivement prouver (M,e)|=P
(ou (M,e)|=#P) pour chaque axiome P de ZFC sans pour autant prouver
« pour tout code #P d'un axiome de ZFC, on a (M,e)|=#P » !

Il est tautologique que pour tout théorème P de ZFC, ZFC
prouve « P est vrai » (puisque ça signifie juste P, d'après les
conventions que j'ai données : et, oui, si ZFC prouve P alors ZFC
prouve P).  Mais ce qui n'est pas tautologique, et même pas vrai (du
moins si ZFC est consistant) c'est si ZFC prouve « si #P est le code
d'un théorème de ZFC alors P [est vrai] » : la différence est dans le
placement des guillemets.  De fait, si on applique ça à P = Faux
(l'affirmation tautologiquement fausse), on se demande si ZFC prouve
« si #Faux est le code d'un théorème de ZFC alors Faux », i.e.,
« #Faux n'est pas le code d'un théorème de ZFC », i.e., « ZFC est
consistant », et ça on sait que ce nest pas possible si ZFC est
consistant.

J'insiste : pour chaque énoncé ensembliste P, « #P est (le code d')un
théorème de ZFC » est un énoncé arithmétique, et « (#P est un théorème
de ZFC) => P » est un énoncé ensembliste qui n'est pas du tout
tautologique et n'est pas du tout, en général, une conséquence des
axiomes de ZFC.  (Alors que si on a un modèle (M,e) de ZFC, l'énoncé
« (#P est un théorème de ZFC) => (M,e)|=P » est évident pour tout P,
et même, en fait, « pour tout #P, (#P est un théorème de ZFC) =>
(M,e)|=#P ».  Donc la différence entre les usages 1 et 3 de la notion
de vérité est vraiment critique.)  Et bien sûr, on ne peut pas
quantifier sur P dans ce « (#P est un théorème de ZFC) => P » (mais de
toute façon, même pour des énoncés bien explicites, ZFC ne peut pas le
prouver).

Il y a en fait un théorème, le théorème de Löb, qui dit que si ZFC
prouve « (#P est un théorème de ZFC) => P » alors ZFC prouve P (ce
n'est pas particulier à ZFC, hein...).  Informellement, donc, les
_seuls_ énoncés dont ZFC arrive à prouver que s'ils sont des théorèmes
ils sont vrais, sont les énoncés qui sont effectivement des
théorèmes !  Inversement, c'est une façon standard de renforcer une
théorie (récursive, contenant l'arithmétique, \omega-consistante et
tout le tralala) c'est de lui ajouter ce schéma d'axiomes qui dit
donc, informellement, que ses propres théorèmes sont vrais !  Ça
implique la consistance du système, mais aussi la consistance du
système renforcé par sa propre consistance, et la consistance de ça...
(Mais ça n'empêche qu'on peut ensuite recommencer et dire que les
théorèmes qui découlent du schéma en question sont eux-mêmes vrais,
etc.  On peut aussi essayer des trucs plus forts comme ajouter un
prédicat de vérité.  Il y a beaucoup de façons d'essayer de renforcer
systématiquement un système de ce genre.)

Mon exercice consiste donc à prouver qu'ajouter un cardinal
inaccessible à ZFC est plus fort que ce schéma.

Bref, l'exercice consiste à prouver dans ZFC, pour P un énoncé
quelconque :

« S'il existe un cardinal inaccessible et si #P est un théorème de
ZFC, alors P. »

------------------------------------

Qu'est-ce que #P?

C'est un code arithmétique de P.  J'ai mis le # pour insister sur
le fait que c'est un entier naturel.  Le point de mon message, c'est
qu'il y a deux relations |= différentes : si M est un ensemble
transitif (ou (M,e) un ensemble muni d'une relation binaire
quelconque), on peut définir M|=#P (ou (M,e)|=#P) lorsque #P est le
code arithmétique d'une formule P, et on peut ensuite quantifier sur
 #P et ainsi de suite (par exemple, on peut écrire en une seule formule
« l'ensemble M est un modèle transitif de ZFC »), mais d'autre part si
M est un ensemble _ou une classe_ transitif (ou (M,E) un ensemble ou
une classe muni d'une relation binaire quelconque), on peut définir
M|=P (ou (M,E)|=P) lorsque P est une formule explicite, en modifiant
tous ses quantificateurs pour porter sur M (et éventuellement aussi
ses symboles d'appartenance pour les remplacer par E).  Là on ne peut
pas quantifier sur P : on peut juste dire, par exemple, que telle
classe vérifie les n premiers axiomes de ZFC (et il se peut que ZFC
prouve ça pour tout n, mais c'est un schéma de théorèmes).  En théorie
des ensembles, on manie beaucoup ces deux notions, et c'est parfois
très confusant.

Par exemple, voici trois façons d'enrichir ZFC par réflexion :

(a) pour tout énoncé arithmétique P, mettre l'axiome « si ZFC|-P alors
P »,

(a1) mettre l'unique axiome « pour tout code #P d'un énoncé
arithmétique, si ZFC|-P alors N|=#P » (on peut faire ça dans ZFC parce
que N est un ensemble dans ZFC, on ne pourrait pas dans Peano),

(b) pour tout énoncé P (pas forcément arithmétique), mettre l'axiome
« si ZFC|-P alors P ».

On ne peut pas transformer (b) en un unique axiome comme (a) a été
transformé en (a1).

--------------------------------

Dans le même genre, quelle serait la différence de réaction de la
communauté mathématique dans le cas (a) quelqu'un fournit une
démonstration valable de « 0=1 » à partir de ZFC, et (b) quelqu'un
fournit une démonstration valable de « il existe une démonstration de
"0=1" à partir de ZFC » à partir de ZFC ?  Probablement le (b) serait
vu comme aussi désastreux que le (a) (indépendamment du fait que le
(b) montre d'ores et déjà l'inexistence d'un cardinal inaccessible ou
même d'un modèle transitif de ZFC, toutes choses sur lesquelles on
compte beaucoup).  Et ce, même s'il est logiquement envisageable qu'il
existe une démonstration dans ZFC de la contradiction de ZFC sans pour
autant que ZFC soit contradictoire...  mais mathématiquement, on se
foutrait de cette subtilité, donc on attend plus des axiomes de ZFC
que juste le fait qu'ils soient consistants - on s'attend à ce qu'ils
soient, au moins arithmétiquement, *vrais*.

(Maintenant, on peut peut-être avoir à distinguer la situation d'un
énoncé P arithmétique et celle d'un énoncé P ensembliste, et admettre
le principe « (ZFC |- P) => P » uniquement pour les premiers.  Ce que
ça a de sympathique, c'est que le simple axiome « il existe un
cardinal inaccessible » non seulement entraîne automatiquement « (ZFC
|- P) => P » pour tout énoncé P arithmétique, mais même entraîne
« (ZFC+R |- P) => P » où R est le schéma « (ZFC|-P)=>P », et aussi
« (ZFC+R' |- P) => P » où R' est le schéma précédent, « et ainsi de
suite ».  Alors que pour P de nature ensembliste, « (ZFC|-P)=>P » il
faut peut-être des hypothèses du style « On est faiblement compact » -
mais je n'ai pas vraiment réfléchi.)

--------------------------------------------------------------------------

Réflexion
---------

>					    ou encore ce qu'est ce fameux
> théorème de réflexion, je te lirais volontiers.

Le théorème de réflexion est en fait un schéma de théorèmes : pour
chaque P, il dit « si P [est vrai] alors il existe un ensemble
transitif M, qu'on peut choisir dénombrable ou bien égal à un V_\alpha
(mais pas les deux à la fois), tel que M |= P ».  Bon, en fait, il y a
plein plein plein d'énoncés dans le même genre, en voici quelques
uns si je ne me plante pas :

* {pour chaque énoncé P,} il existe un ensemble transitif M, qu'on
  peut choisir dénombrable ou bien égal à V_\alpha, tel qu'on ait
  l'équivalence : P <=> (M |= P) ;

* {pour chaque énoncé P,} il existe une classe close cofinale
  d'ordinaux \alpha tels que P <=> (V_\alpha |= P) ;

* {pour chaque énoncé P,} si M_0 est un ensemble transitif quelconque,
  il existe un ensemble transitif M contenant M_0, qu'on peut choisir
  de cardinal card(M_0)+\aleph_0 ou bien égal à un V_\alpha, tel qu'on
  ait l'équivalence : P <=> (M |= P) ;

* {pour chaque énoncé P,} il existe une classe close cofinale (et même
  close cofinale sous chaque cardinal régulier indénombrable)
  d'ordinaux \alpha tels que (L |= P) <=> (L_\alpha |= P) (où L est
  l'univers constructible, réunion des L_\alpha définis comme
  l'ensemble des parties définissables d'un des L_\beta antérieur) ;

* {pour chaque formule R(x_1,...x_n),} si M_0 est un ensemble
  transitif quelconque, il existe un ensemble transitif M contenant
  M_0, qu'on peut choisir de cardinal card(M_0)+\aleph_0 ou bien égal
  à un V_\alpha, tel qu'on ait pour tous x_1,...,x_n de M_0
  l'équivalence R(x_1,...,x_n) |= (M |= R(x_1,...,x_n)) ;

* {pour chaque formule R(x_1,...x_n),} si M_0 est un ensemble
  (transitif) quelconque, il existe un ensemble transitif M contenant
  M_0, qu'on peut choisir égal à un V_\alpha, tel qu'on ait pour tous
  x_1,...,x_n de M (et plus seulement de M_0 cette fois !)
  l'équivalence R(x_1,...,x_n) |= (M |= R(x_1,...,x_n)) ;

* {pareil que l'un des précédents, avec n'importe quel ensemble fini
  de formules R} ;

* {pour chaque entier naturel n,} il existe un ensemble transitif M,
  qu'on peut choisir dénombrable ou bien égal à V_\alpha, tel qu'on
  ait : M |= tous les axiomes de ZFC sauf que le schéma de
  remplacement est limité aux prédicats \Sigma_n.

Attention !  À chaque fois, ce que j'ai écrit entre accolades ne fait
pas partie de l'énoncé mais paramètre un schéma de théorèmes !  Par
exemple, ZFC - s'il est consistant - ne prouve certainement pas « pour
chaque entier naturel n, il existe un ensemble transitif M tel qu'on
ait M |= tous les axiomes de ZFC sauf que le remplacement est limité
aux prédicats \Sigma_n » (un tel théorème impliquerait la consistance
de ZFC) !  C'est ce qui rend le dernier schéma d'énoncés d'autant plus
impressionnant.

Tous ces résultats sont prouvés avec le même genre de techniques que
le théorème de Löwenheim-Skolem : prendre des clôtures pour des
fonctions de Skolem.

