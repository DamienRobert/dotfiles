vim: ft=markdownlight fdm=expr

Calculabilité
=============
cf [Logique#Calculabilite] pour les degrés de turing et les machines de
Turing infinies.

Arithmétique
------------

Hiérarchie arithmétique: Delta_n= Sigma_n \inter Pi_n
(Pi_n commencer par pour tout, Sigma_n commencer par il existe).

Delta_1 est équivalent à récursif, Sigma_1 à récursivement énumérable.
Plus généralement le th de Post dit que le n ième jump de Turing 0^n est
équivalent à Delta_n, et Sigma_n sont les ensembles re sur 0^n.

Hyperarithmétique
-----------------

Si O est l'ensemble des notations ordinales de Kleene, on peut généraliser
le jump de Turing en faisant de l'induction sur le pb de l'arrêt le long de
o \in O. On peut aller jusqu'à w_1^CK comme ça.
Comme ça on monte jusqu'à 0^w_1^CK qui est la hiérarchie hyperarithmétique.
C'est équivalent à une machine de turing avec le turing jump comme
hyperoracle, ou encore de la w_1^CK-récursivité.

Exemple: 0^w_0 est équivalent à l'ensemble des énoncés vrais de la théorie
arithmétique du premier ordre (il est donc non arithmétique, mais il est
hyperarithmétique).
Les notations ordinales O sont hyperarithmétiquement
énumérables, mais pas hyperarithmétiques. En particulier w^CK_1 le plus
petit ordinal non récursif n'est pas hyperarithmétique non plus.

En terme de théorie des ensembles, la hiérarchie hyperarithmétique est
Deta^1_1, et Pi^1_1 c'est l'équivalent des ensembles hyperrécursivement
énumérable (par exemple c'est donner par une machine avec comme hyperoracle
l'hyperjump), ou encore c'est équivalent aux notations de Kleene O.

Constructible
-------------

Pour aller plus loin que la hiérarchie hyperarithmétique, on peut par exemple
utiliser les espaces L_alpha de Gödel: L_0=vide ou ensembles
héréditairement fini (on va prendre le dernier, ça ne change pas L_1), et
L_alpha+1=L_alpha union la compréhension de premier ordre. En particulier
et L_w_1^CK \inter P(w_0) est la hiérarchie hyperarithmétique et
L_1 inter P(w_0) = la hiérarchie arithmétique

On raffine donc en M_w \alpha=L_\alpha, et M_w alpha+n = Delta_n sur M_w alpha.
Comme ca si alpha<w^CK_1, on a M_1+alpha \inter P(w_0)=0^(alpha), et si alpha
est entier, c'est aussi Delta_alpha.
Ca permet de généraliser le turing jump au delà de w^1_CK.

Plus généralement, L_alpha \inter P(w_0) prolonge la hiérarchie analytique
ramifiée.. Comme ça on va jusqu'au plus petit ordinal beta_0 tel que
L_beta_0 \inter P(w_0) ne croit plus (on a alors un modèle de
l'arithmétique du second ordre), qui est en gros le plus grand ordinal
où la calculabilité n'utilise que des parties de N et pas des parties de
parties.

- A alpha récursivement énumérable = Sigma_1 sur L_alpha
- A alpha récursif=A et sont complémentaire sont alpha-re
(ou encore des grands whiles sur alpha)

Résumé sur les ensembles hyperarithmétiques
-------------------------------------------

Pour résumer: Delta^1_1 = hyperarithmétique = saut de turing jusqu'à w_1^CK
= calculable avec le turing jump comme hyperoracle (ou l'hyperoracle qui
donné f:N->N teste si 0 \in Im(f)) = w_1^CK récursive = L_w_1^CK \inter
P(w_0)

On a Degrés de turing <- Turing jumps: 0, 0^2, ...
Contenus dans l'hyperdegré, et l'hyperjump: 0^w_1^CK, 0^w_2^CK...
Attention: hyperdegré/A <=> w_1^CK[A]-calculabilité/A or w_1^CK[A] dépend de
A. Donc la notion (relative) d'hyperdegré n'est pas la même que pour la
w_1^CK-calculabilité. (Alors que w_0[A]=w_0, donc
arithmétique=calculabilité=w_0-calculabilité=degré de turing).

Rappel: l'hypersaut = machines hyperarithmétiques ne terminant pas
(relativement à A), ou
encore les notations ordinales (relativement à A), ou encore w_1^CK[A]...
Ainsi w_2^CK=w_1^CK[w_1^CK]=O (notations ordinales)=machines
hyperarithmétiques ne terminant pas.

Grands ordinaux:
---------------

Un ordinal alpha est admissible ssi la alpha-calculabilité ne donne pas
d'ordinaux plus grand que alpha ssi L_alpha est un modèle de Kripke-Plateck

Un ordinal est récursivement innaccessible s'il est admissible et limite
d'admissibles. Le plus petit tel ordinal est donné par une machine de
Turing avec l'hyperjump comme hyperoracle.

alpha non projectible <=> L_alpha KP+séparation Sigma_1
beta_0 (cf plus haut) a KP+séparation, autrement dit L_beta_0\interP(w) est
un modèle de l'artihmétique du second ordre.

sigma plus petit ordinal stable (ie stable pour tout delta-calcul) = c'est
le plus petit ordinal non absolu = le plus petit ordinal non Delta^1_2.

En particulier f:w_0->w_0 est Delta^1_2 = f est sigma-calculable = f est
delta calculable pour un ordinal delta < sigma.

Grands Nombres
==============

- Construire des grands nombres: http://www.madore.org/~david/weblog/2013-01-16-grands-nombres.html#d.2013-01-16.2104

- forum sciences.maths:18969

x+y est de niveau 1
x*y de niveau 2
x^y de niveau 3

Ackerman de niveau w_0
Ackerman itérée:
  AA(x,y)= A(AA(x-1,y),y) de niveau omega+1
  AAA(x,y)=AA(AAA(x-1,y),y) de niveau omega+2

Les flêches de Conway:
x->y->n c'est [n](x,y), donc ça donne Ackerman
x->y->z->t ça donne AAAAAA, donc de niveau omega*2
                    t fois
Flêche de longeur 2+n de niveau omega*n
Donc avec un nombre de flêches variables on obtient omega^2

Ackerman à plusieurs variables: n+1 variables donne omega^n
A(x,y,z)=A(A(x-1,y,z),y-1,z)
A(x,y,z,t)=A(A(x-1,y,z,t),y-1,z,t)
-> omega^omega en faisant varier le nombre de variables

La fonction de Friedman's (sur les sous-blocs) est d'ordre omega^omega
aussi (voir plus bas)

Fonction de Goodstein:
Pour G1 on écrit X_0 = b + X_1 récursivement
Pour G2 on écrit X_0= b X_1 + X_2 récursivement
Pour G3 on écrit X_0 = b^X_1*X_2+X_3 récursivement
Pour G4 on écrit X_0 = b^^X_1^X_2*X_3+X_4 récursivement...
puis on change les b en b+1, et on retranche 1, on recommence jusqu'à tomber sur 0.
Alors G2 est d'ordre omega, G3 d'ordre epsilon_0 et (conjecture) G_n est d'ordre \phi_{n-2}(0) où \phi est la fonction de Veblen, ie G_4 est d'ordre \eta_0, ...
L'hydre de Kirby-Paris est d'ordre \epsilon_0

La fonction Tree, d'ordre entre \Gamma_0 (Feferman-Schütte et le petit
ordinal de Veblen) [update: wiki dit petit ordinal de Veblen]
  Tree(n) est le (plus petit) nombre tel que pour toute suite d'arbres T_1,
  ..., T_f(n), chaque arbre étant étiqueté par un élément dans {1, ..., n},
  et l'arbre T_i ayant au plus i sommets, alors il y a forcément deux arbres
  T_a et T_b avec T_a <= T_b (ie on peut mapper homéorphiquement T_a dans T_b
  en préservant les étiquettes).

  The TREE sequence begins TREE(1) = 1, TREE(2) = 3, then suddenly TREE(3)
  explodes to a value so enormously large that many other "large"
  combinatorial constants, such as Friedman's n(4),[*] are extremely small
  by comparison. A lower bound for n(4), and hence an extremely weak
  lower bound for TREE(3), is A(A(...A(1)...)), where the number of As is
  A(187196),[2] and A() is a version of Ackermann's function: A(x) = 2↑^{x-1}x
  in Knuth's up-arrow notation. Graham's number, for example, is
  approximately A^{64}(4) which is much smaller than the lower bound
  A^{A(187196)}(1). It can be shown that the growth-rate of the function TREE
  exceeds that of the function fΓ0 in the fast-growing hierarchy, where Γ0
  is the Feferman–Schütte ordinal.

  ^* n(k) is defined as the length of the longest possible sequence that
  can be constructed with a k-letter alphabet such that no block of letters
  x_i,...,x_2i is a subsequence of any later block x_j,...,x_2j.[3] n(1) = 3,
  n(2) = 11 and n(3) > 2↑^{7197}158386.
  (cf http://mathoverflow.net/questions/163007/applications-of-really-large-numbers,
  http://googology.wikia.com/wiki/Block_subsequence_theorem
  Friedman has demonstrated that the growth rate of the n function lies asymptotically between f_{ω^ω}(n) and f_{ω^ω+1}(n)
  )

La même sur les graphes, d'ordre le collapse de \Omega_\omega
  http://en.wikipedia.org/wiki/Robertson%E2%80%93Seymour_theorem
  Theorem: For every positive integer n, there is an integer m so large
  that if G1, ..., Gm is a sequence of finite undirected graphs, where each
  Gi has size at most n+i, then Gj ≤ Gk for some j < k.
L'hydre de David, qui suivant la stratégie se comporte comme \Gamma_0 ou
comme le collapse de \Omega^\Omega^...^\Omega (ordinal de
Bachman-Horward); l'hydre de Bucholz se comporte comme le collapse de
\Omega_\Omega: http://googology.wikia.com/wiki/Buchholz_hydras

Les busy beavers sur les machines de Turing dont une théorie prouve
qu'elles s'arrêtent en moins de n caractères (d'ordre la puissance ordinale
de la théorie)

http://googology.wikia.com/wiki/Rayo%27s_number
The smallest positive integer bigger than any finite positive integer named by an expression in the language of first order set theory with a googol symbols or less
(pas du tout calculable, si on remplace first order set theory par first
order arithmetic theory on a w_1^CK, et
http://googology.wikia.com/wiki/Xi_function est d'ordre le point fixe de
a->w_a^CK, mais plus petit que la fonction de Rayo)

- http://mathoverflow.net/questions/108949/various-definitions-of-recursion-from-ordinal-machines

Thread de yaf.maths:1048
------------------------
-> yaf.maths:1055

>> Toi, tu n'avais pas le droit de répondre.  Ceci dit, je m'attendais à
>> mieux de ta part. :-]
>
>Oui, c'est un peu décevant, une version d'Ackerman, soit seulement
>une croissance de w_0...
>
>Je propose quelques examples plus intéressants:
>- f(n)=n->n->..->n avec les notations de Conway (de croissance w_0^2),
>- Les suites de Goodstein ou des versions à base de l'hydre (epsilon_0)
>- La suite TREE (de croissance l'ordre)

Oui, c'est un peu décevant, une version d'Ackerman...

Quitte à m'auto-usurper, j'aurais au moins proposé le nombre suivant:
soit f(n) le (plus petit) nombre tel que pour toute suite d'arbres T_1,
..., T_f(n), chaque arbre étant étiqueté par un élément dans {1, ..., n},
et l'arbre T_i ayant au plus i sommets, alors il y a forcément deux arbres
T_a et T_b avec T_a <= T_b (ie on peut mapper homéorphiquement T_a dans T_b
en préservant les étiquettes).

Alors je propose f(42), c'est déjà un bon challenge de faire mieux ;)

                                ---
-> yaf.maths:1065

> En tout cas j'ai en tête une approche qui explose complètement les
> deux (et, pour le coup, qui produit un nombre démontrablement
> supérieur à la fois à Ackermann(9999999,9999999) et à TREE(42)).

Bon, voici la solution - enfin, le programme que j'avais en tête :

Je commence par calculer N=10^(10^100) (juste pour bootstraper).
Ensuite, j'énumère toutes les chaînes de caractères de longueur <=N,
et je garde celles qui (1) sont des démonstrations valides dans ZFC,
et (2) ont une conclusion du type « la machine de Turing <truc>
termine » : visiblement, ces critères sont testables et pas
horriblement chiants à programmer.  Je fais une liste de toutes ces
machines de Turing, et je les exécute tour à tour, en mesurant, à
chaque fois, le nombre d'étapes d'exécution.  Je renvoie le max de ces
nombres (bon, ne soyons pas chiche : je renvoie la somme, ou le
produit, mais enfin, à ce stade-là, ça ne change franchement pas
grand-chose).

En une phrase : je renvoie la somme des temps d'exécution des machines
de Turing dont ZFC prouve la terminaison en au plus 10^(10^100)
symboles.

Pourquoi est-ce beaucoup plus grand que Ackermann(9999999,9999999) et
que TREE(42) ?  Parce que la démonstration du fait que les fonctions
d'Ackermann ou TREE sont bien définies (i.e., que les machines de
Turing qui les calculent terminent pour toute entrée) se font sans
difficulté dans ZFC, et manifestement en beaucoup moins que N
symboles.  Donc en instanciant à toute entrée qui s'écrit en beaucoup
moins que N symboles, mon programme va trouver la machine
correspondante et l'exécuter.

Mais mais mais, me dira-t-on, tu ne sais pas si ton programme termine,
puisque tu ne peux pas le démontrer dans ZFC (vu que c'est le point de
départ d'un argument à la Gödel : ZFC ne peut pas prouver que toute
machine de Turing dont ZFC prouve la terminaison termine
effectivement ; et visiblement, sur mon instance précise, ZFC ne peut
pas prouver que mon programme termine en moins de N symboles puisque
sinon le nombre serait supérieur à lui-même).  Et pourtant si !
Puisque toute démonstration faite de longueur <=N ne peut pas utiliser
les axiomes de Pi^k-remplacement pour k>N (puisqu'il sont trop longs
pour tenir dans la démonstration ! - peu importe si vous ne savez pas
exactement ce que Pi^k veut dire, c'est juste une mesure de
complexité), donc en particulier, cette démonstration n'est pas dans
ZFC, elle est dans ZFC où l'axiome de remplacement est limité aux
énoncés Pi^N ou moins.  Or ZFC prouve bien la consistance de ce
sous-système de ZFC, et même sa véracité arithmétique (i.e., que s'il
montre la terminaison d'une machine de Turing alors elle termine
vraiment) : cette démonstration est très très longue (puisqu'on
utilise vraiment N quantificateurs, écrits de façon explicite), mais
produite de façon complètement mécanique à partir de N, et elle figure
dans tous les bons livres de théorie des ensembles.  Donc ZFC prouve
bien (quoique très très laborieusement) que mon programme termine et
que mon grand nombre est bien défini.

Après, si on croit à plus que ZFC, on peut faire beaucoup plus grand :
si je remplace ZFC par ZFC + « il existe un cardinal inaccessible »
(IC), par exemple, mon nombre est beaucoup plus grand que celui pour
ZFC (même en remplaçant N par N^N ou truc de ce genre).  En effet,
ZFC+IC prouve de façon très courte, lui, que mon programme est bien
défini (parce que ZFC+IC prouve que toute machine de Turing dont ZFC
prouve qu'elle termine, termine effectivement) : du coup, le programme
avec ZFC+IC, il trouvera mon programme (avec ZFC) parmi les programmes
dont il énumérera une preuve de terminaison, et évidemment pareil avec
des variantes beaucoup plus grosses de N, donc en remplaçant ZFC par
ZFC+IC on obtient un nombre considérablement plus grand.  Et le même
argument exactement vaut pour tout axiome de grand cardinal, donc on
peut prendre le plus grand auquel on veut bien croire.

--
David, qui aime beaucoup ce genre de variations sur un thème de Gödel,
et qui trouve que ça soulève des questions philosophiques un peu
effrayantes.

Cardinaux
=========

Cofinalité
----------

The cofinality of an ordinal α is the smallest ordinal δ which is the order
type of a cofinal subset of α. It is a cardinal.

More generally: the cofinality cf(A) of a partially ordered set A is the
least of the cardinalities of the cofinal subsets of A.

If cf(alpha)=alpha then alpha is called regular. It is then a cardinal. cf
o cf = cf, so the cofinality is regular.

Si alpha successeur ou 0, Aleph_alpha est régulier, sinon on a
cf(Aleph_alpha)=cf(alpha), donc si Aleph_alpha est régulier alors on a un
point fixe (mais la réciproque est fausse: le point fixe
Aleph_Aleph_Aleph... a cofinalité w_0).

- Si A unbounded dans gamma, alors cf(gamma)=cf(type(A))
- cf(a+b)=cf(b). Si A limite < w_2, alors cf(A)=w_0 ou w_1
- pour un cardinal kappa infini, cf(kappa) est le plus petit ordinal alpha tel
  que kappa s'écrit comme somme de alpha cardinaux < kappa

Rem: cardinal exponentiation:
si 2<=kappa<=2^lamba, alors kappa^lambda=2^lambda

forum
-----

> Eventuellement si tu peux éclaircir ton indication (par exemple en 
> expliquant ce que signifient des choses comme "cofinal sous tout cardinal
> réugulier indénombrable d'ordinaux [...]"

Un ensemble cofinal dans un ordinal limite c'est un ensemble qui n'est
pas majoré dedans (il tend vers l'ordinal en question, quoi).  Un
cardinal régulier c'est un ordinal limite qui n'a pas d'ensemble
cofinal de cardinalité plus petite que lui.  On montre (avec l'axiome
du choix, mais peu importe) que tout cardinal successeur est régulier.
Un ensemble clos dans un ordinal limite c'est un ensemble fermé pour
la topologie de l'ordre.  Un ensemble clos cofinal (dans un ordinal
limite, mais bon, c'est essentiellement intéressant dans un cardinal
régulier) c'est un ensemble à la fois clos et cofinal...  c'est
intéressant parce que, par exemple, l'intersection de deux ensembles
clos cofinaux est close cofinale.

Dire d'une classe d'ordinaux qu'elle est close cofinale (dans la
classe On de tous les ordinaux) signifie qu'elle contient des ordinaux
arbitrairement grands (elle est cofinale) et que son intersection avec
n'importe quel ordinal limite est close.  Dire qu'elle est close
cofinale sous n'importe quel cardinal régulier indénombrable est un
peu plus précis : son intersection avec n'importe quel cardinal
régulier indénombrable est close cofinale (elle ne peut pas, par
exemple, « rater » \omega_1 et commencer plus grand).  Mais bon, ma
façon de dire les choses est maladroite ou fausse (à la réflexion,
l'ensemble des \alpha pour lesquels V_\alpha |= ¬P peut commencer très
haut, mais il est sûr qu'elle est close cofinale sous le premier
cardinal inaccessible) : le point, en tout cas, est qu'il y a plein de
\alpha pour lesquels V_\alpha |= ¬P et plein de \alpha pour lesquels
V_\alpha |= ZFC, avec un « plein » qui permet d'en trouver en commun.

Grands cardinaux
----------------

1) Un cardinal limite est faiblement innaccessible s'il est régulier.
En particulier, kappa faiblement innaccessible implique qu'il est le
kappa-ième point fixe de Aleph.

2) Un ordinal kappa fortement innaccessible est un ordinal faiblement
   innaccessible qui est en plus fortement limite (ie 2^lambda < kappa pour
   tout lambda < kappa). Sous l'hypothèse du continu généralisée 2)
   coincide avec 1)

Ex, si kappa est fortement innaccessible, V_kappa est un modèle (du second
ordre) de ZFC, Delta_0(V_kappa) est un modèle de Von Neumann–Bernays–Gödel
(on a le droit de parler de classes, mais le principe de comprehension est
restreint à des ensembles, c'est une extension conservative de ZFC), et
V_kappa+1 est un modèle de Morse–Kelley  (là on a un schéma de
compréhension où les variables peuvent être des classes).

Innaccessible cardinals are Pi^1_0-indescriptilbe

3) A cardinal κ is α-inaccessible, for α any ordinal, if and only if κ is
inaccessible and for every ordinal β < α, the set of β-inaccessibles less
than κ is unbounded in κ (and thus of cardinality κ, since κ is regular).

The α-inaccessible cardinals can be equivalently described as fixed points
of functions which count the lower inaccessibles. For example, denote by
ψ0(λ) the λth inaccessible cardinal, then the fixed points of ψ0 are the
1-inaccessible cardinals. Then letting ψβ(λ) be the λth β-inaccessible
cardinal, the fixed points of ψβ are the (β+1)-inaccessible cardinals (the
values ψβ+1(λ)). If α is a limit ordinal, an α-inaccessible is a fixed
point of every ψβ for β < α (the value ψα(λ) is the λth such cardinal).
This process of taking fixed points of functions generating successively
larger cardinals is commonly encountered in the study of large cardinal
numbers.

κ is hyperincasseible if κ is κ-inaccessible.
For any ordinal α, a cardinal κ is α-hyper-inaccessible if and only if κ is
hyper-inaccessible and for every ordinal β < α, the set of
β-hyper-inaccessibles less than κ is unbounded in κ.

4) A cardinal number κ is called Mahlo if κ is inaccessible and the set U =
   {λ < κ: λ is inaccessible} is stationary in κ.

   A cardinal κ is called weakly Mahlo if κ is weakly inaccessible and the
   set of weakly inaccessible cardinals less than κ is stationary in κ.

5) Reflecting cardinal
A reflecting cardinal is a
cardinal number κ for which there is a normal ideal I on κ such that for
every X∈I+, the set of α∈κ for which X reflects at α is in I+. (A
stationary subset S of κ is said to reflect at α<κ if S∩α is stationary in
α.) Reflecting cardinals were introduced by (Mekler & Shelah 1989).

6) Formally, a cardinal κ is defined to be weakly compact if it is
   uncountable and for every function f: [κ] 2 → {0, 1} there is a set of
   cardinality κ that is homogeneous for f. In this context, [κ] 2 means
   the set of 2-element subsets of κ, and a subset S of κ is homogeneous
   for f if and only if either all of [S]2 maps to 0 or all of it maps to
   1.

Equivalently:
- κ is inaccessible and has the tree property, that is, every
tree of height κ has either a level of size κ or a branch of size κ.
- κ is \Pi^1_1-indescribable.
- κ is κ-unfoldable.

-> Πm n-indescribable, totally indescribable cardinals

7) λ-unfoldable, unfoldable cardinals, ν-indescribable cardinals and
   λ-shrewd, shrewd cardinals [not clear how these relate to each other].

- Formally, a cardinal number κ is λ-unfoldable if and only if for every
transitive model M of cardinality κ of ZFC-minus-power set such that κ is
in M and M contains all its sequences of length less than κ, there is a
non-trivial elementary embedding j of M into a transitive model with the
critical point of j being κ and j(κ) ≥ λ.

A cardinal is unfoldable if and only if it is an λ-unfoldable for all
ordinals λ.

- A cardinal number κ is called λ-shrewd if for every proposition φ, and set
A ⊆ Vκ with (Vκ+λ, ∈, A) ⊧ φ there exists an α, λ' < κ with (Vα+λ', ∈, A ∩
Vα) ⊧ φ. It is called shrewd if it is λ-shrewd for every λ (including λ >
κ).

This definition extends the concept of indescribability to transfinite
levels. A λ-shrewd cardinal is also μ-shrewd for any ordinal μ < λ.
Shrewdness was developed by Michael Rathjen as part of his ordinal analysis
of Π12-comprehension. It is essentially the nonrecursive analog to the
stability property for admissible ordinals.

8) ethereal cardinals, subtle cardinals

A cardinal κ is called subtle if for every closed and unbounded C ⊂ κ and
for every sequence A of length κ for which element number δ (for an
arbitrary δ), Aδ ⊂ δ there are α, β, belonging to C, with α<β, such that
Aα=Aβ∩α. A cardinal κ is called ethereal if for every closed and unbounded
C ⊂ κ and for every sequence A of length κ for which element number δ (for
an arbitrary δ), Aδ ⊂ δ and Aδ has the same cardinal as δ, there are α, β,
belonging to C, with α<β, such that card(α)=card(Aβ∩Aα).

9) almost ineffable, ineffable, n-ineffable, totally ineffable cardinals

A cardinal number \kappa is called ineffable if for every binary-valued
function f : \mathcal{P}_{=2}(\kappa) \to \{0,1\}, there is a stationary
subset of \kappa on which f is homogeneous: that is, either f maps all
unordered pairs of elements drawn from that subset to zero, or it maps all
such unordered pairs to one.

10) remarkable cardinals

11) α-Erdős cardinals (for countable α), 0# (not a cardinal), γ-Erdős cardinals
(for uncountable γ)

- The Erdős cardinal κ(α) is defined to be the least cardinal such that for
every function f: κ<ω → {0, 1} there is a set of order type α that is
homogeneous for f (if such a cardinal exists). In the notation of the
partition calculus, the Erdős cardinal κ(α) is the smallest cardinal such
that κ(α) → (α)<ω

- Zero sharp was defined by Silver and Solovay as follows. Consider the
language of set theory with extra constant symbols c1, c2, ... for each
positive integer. Then 0# is defined to be the set of Gödel numbers of the
true sentences about the constructible universe, with ci interpreted as the
uncountable cardinal ℵi. (Here ℵi means ℵi in the full universe, not the
constructible universe.)

There is a subtlety about this definition: by Tarski's undefinability
theorem it is not in general possible to define the truth of a formula of
set theory in the language of set theory. To solve this, Silver and Solovay
assumed the existence of a suitable large cardinal, such as a Ramsey
cardinal, and showed that with this extra assumption it is possible to
define the truth of statements about the constructible universe. More
generally, the definition of 0# works provided that there is an uncountable
set of indiscernibles for some Lα, and the phrase "0# exists" is used as a
shorthand way of saying this.

12) almost Ramsey, Jónsson, Rowbottom, Ramsey, ineffably Ramsey cardinals

With [κ]<ω denoting the set of all finite subsets of κ, a cardinal number κ
such that for every function
    f: [κ]<ω → {0, 1}
there is a set A of cardinality κ that is homogeneous for f (i.e.: for
every n, f is constant on the subsets of cardinality n from A) is
called Ramsey.
function

13) measurable cardinals, 0†

- Formally, a measurable cardinal is an uncountable cardinal number κ such
that there exists a κ-additive, non-trivial, 0-1-valued measure on the
power set of κ. (Here the term κ-additive means that, for any sequence Aα,
α<λ of cardinality λ<κ, Aα being pairwise disjoint sets of ordinals less
than κ, the measure of the union of the Aα equals the sum of the measures
of the individual Aα.)

Equivalently, κ is measurable means that it is the critical point of a
non-trivial elementary embedding of the universe V into a transitive class
M. This equivalence is due to Jerome Keisler and Dana Scott, and uses the
ultrapower construction from model theory. Since V is a proper class, a
small technical problem that is not usually present when considering
ultrapowers needs to be addressed, by what is now called Scott's trick.

Equivalently, κ is a measurable cardinal if and only if it is an
uncountable cardinal with a κ-complete, non-principal ultrafilter. Again,
this means that the intersection of any strictly less than κ-many sets in
the ultrafilter, is also in the ultrafilter.

Although it follows from ZFC that every measurable cardinal is inaccessible
(and is ineffable, Ramsey, etc.), it is consistent with ZF that a
measurable cardinal can be a successor cardinal. It follows from ZF + axiom
of determinacy that ω1 is measurable, and that every subset of ω1 contains
or is disjoint from a closed and unbounded subset.

- 0† exists if and only if there exists a non-trivial elementary
embedding  j : L[U] → L[U] for the relativized Gödel constructible
universe L[U], where U is an ultrafilter witnessing that some cardinal
κ is measurable.

If 0† exists, then a careful analysis of the embeddings of L[U] into
itself reveals that there is a closed unbounded subset of κ, and a
closed unbounded proper class of ordinals greater than κ, which
together are indiscernible for the structure (L,\in,U), and 0† is
defined to be the set of Gödel numbers of the true formulas about the
indiscernibles in L[U].

14) λ-strong, strong cardinals, tall cardinals

If λ is any ordinal, κ is λ-strong means that κ is a cardinal number and
there exists an elementary embedding j from the universe V into a
transitive inner model M with critical point κ and
    V_\lambda\subseteq M
That is, M agrees with V on an initial segment. Then κ is strong means
that it is λ-strong for all ordinals λ.

15) Woodin, weakly hyper-Woodin, Shelah, hyper-Woodin cardinals

λ is Woodin if and only if λ is strongly
inaccessible and for all A \subseteq V_\lambda there exists a \lambda_A < λ
which is <\lambda-A-strong.

A Woodin cardinal is preceded by a stationary set of measurable cardinals,
and thus it is a Mahlo cardinal. However, the first Woodin cardinal is not
even weakly compact.

16) superstrong cardinals (=1-superstrong; for n-superstrong for n≥2 see
further down.)

In mathematics, a cardinal number κ is called superstrong if and only if
there exists an elementary embedding j : V → M from V into a transitive
inner model M with critical point κ and V_{j(\kappa)} ⊆ M.

17) subcompact, strongly compact (Woodin< strongly compact≤supercompact),
 supercompact cardinals

- A cardinal κ is strongly compact if and only if every κ-complete filter
 can be extended to a κ complete ultrafilter.

- If λ is any ordinal, κ is λ-supercompact means that there exists an
elementary embedding j from the universe V into a transitive inner model M
with critical point κ, j(κ)>λ and
     { }^\lambda M\subseteq M \,.
That is, M contains all of its λ-sequences. Then κ is supercompact
means that it is λ-supercompact for all ordinals λ.

Alternatively, an uncountable cardinal κ is supercompact if for every A
such that |A| ≥ κ there exists a normal measure over [A]< κ.

18) η-extendible, extendible cardinals

A cardinal number κ is called η-extendible if for some λ there is a nontrivial elementary embedding j of
    Vκ+η into Vλ
where κ is the critical point of j.
κ is called an extendible cardinal if it is η-extendible for every ordinal number η. All extendible cardinals are supercompact cardinals.

19) Vopěnka cardinals

Vopěnka's principle asserts that for every proper class of binary relations (with set-sized domain), there is one elementarily embeddable into another. Equivalently, for every predicate P and proper class S, there is a non-trivial elementary embedding j:(Vκ, ∈, P) → (Vλ, ∈, P) for some κ and λ in S.

The intuition is that the set-theoretical universe is so large that in every proper class, some members are similar to others, which is formalized through elementary embeddings.

20) n-superstrong (n≥2), n-almost huge, n-super almost huge, n-huge,

- A cardinal κ is n-superstrong if and only if there exists an elementary embedding j : V → M from V into a transitive inner model M with critical point κ and V_{j^n(\kappa)} ⊆ M. Akihiro Kanamori has shown that the consistency strength of an n+1-superstrong cardinal exceeds that of an n-huge cardinal for each n > 0.

- In mathematics, a cardinal number κ is called huge if there exists an elementary embedding j : V → M from V into a transitive inner model M with critical point κ and
    {}^{j(\kappa)}M \subset M.\!
Here, αM is the class of all sequences of length α whose elements are in M.

21) n-superhuge cardinals (1-huge=huge, etc.)

22) rank-into-rank (Axioms I3, I2, I1, and I0)

In set theory, a branch of mathematics, a rank-into-rank is a large cardinal λ satisfying one of the following four axioms (commonly known as rank-into-rank embeddings, given in order of increasing consistency strength):

    Axiom I3: There is a nontrivial elementary embedding of Vλ into itself.
    Axiom I2: There is a nontrivial elementary embedding of V into a transitive class M that includes Vλ where λ is the first fixed point above the critical point.
    Axiom I1: There is a nontrivial elementary embedding of Vλ+1 into itself.
    Axiom I0: There is a nontrivial elementary embedding of L(Vλ+1) into itself with the critical point below λ.

These are essentially the strongest known large cardinal axioms not known to be inconsistent in ZFC; the axiom for Reinhardt cardinals is stronger, but is not consistent with the axiom of choice.

23) Reinhardt
In set theory, a branch of mathematics, a Reinhardt cardinal is a large cardinal κ, suggested by William Nelson Reinhardt (1967, 1974), that is the critical point of a non-trivial elementary embedding j of V into itself.
Not consistent in ZFC!

forum
=====

Notations ordinales
-------------------

From madore@clipper.ens.fr Thu Jan 20 18:02:29 2005
From: madore@clipper.ens.fr (Gro-Tsen)
Subject: notations ordinales, ordinal de Church-Kleene, et branches de O

[Je poste ceci suite à une discussion ce midi avec Xavier Caruso,
Benny, Gilles Tauzin et Rémy.]

Je « rappelle » la définition du système de notations ordinales de
Kleene.

On définit un ensemble O d'entiers naturels (je noterai N l'ensemble
de tous les naturels), une relation << sur les éléments de O, et une
application |·| de O vers les ordinaux dénombrables, de la façon
suivante :

Pour simplifier les notations, je suppose que j'ai posé S(n)=2^n et
L(n)=3·5^n.  (Les seules choses qui importent est que S et L soient
des injections récursives des naturels vers les naturels, d'images
disjointes et disjointes de {0}.)  De plus, je me fixe une fonction
récursive universelle U : U est récursive (de N²->N) et pour toute
fonction récursive f (pas forcément totale, c'est-à-dire, pas
forcément définie sur tout indice) des naturels vers les naturels il
existe un indice n tel que f=U(n,·).

On met 0 dans O et |0|=0, et si n est dans O, S(n) est dans O et
n<<S(n) et |S(n)|=|n|+1, et si e est tel que U(e,·) est totale et
vérifie U(e,n) dans O pour tout n et U(e,n)<<U(e,n+1) pour tout n
alors L(e) est dans O et U(e,n)<<L(e) pour tout n et |L(e)| est la
borne supérieure des |U(e,n)|, et enfin si a<<b et b<<c dans O alors
a<<c.

(Cette définition doit se lire comme : on prend le plus petit ensemble
O et la plus petite relation << qui vérifient les propriétés en
question, et on définit |·| ensuite en remarquant que tout a bien un
sens.)

Exemples : |0|=0 (c'est dans la définition), |S(0)|=1, |S(S(0))|=2 et
ainsi de suite (pour chaque naturel n, il existe une unique notation a
dans O telle que |a|=n).  |L(e)|=\omega, où e est (l'indice pour la
fonction universelle U choisie de) n'importe quelle fonction récursive
totale qui prend des valeurs dans {0,S(0),S(S(0)),...} qui croissent
strictement pour l'ordre << (i.e. 0<<S(0)<<S(S(0))<<...).  Évidemment,
ça donne plein de a pour lesquels |a|=\omega, et pour chacun, on a
|S(a)|=\omega+1, mais les différents a ne sont pas <<-comparables.

L'idée à garder en tête, c'est que O est un ensemble de naturels
absolument affreux et incalculable (techniquement, il paraît qu'il
existe une fonction primitive récursive mettant les naturels en
bijection avec les formules de l'arithmétique du premier ordre de
telle façon que O soit mis en bijection avec les formules vraies) - en
particulier, O n'est pas définissable dans le langage de
l'arithmétique du premier ordre (il l'est, en revanche, dans
l'arithmétique du second ordre puisque je l'ai défini comme « le plus
petit ensemble [c'est-à-dire l'intersection de tous les ensembles] tel
que gnagnagna »).  La relation <<, elle, est plutôt gentille : il
existe une façon de prolonger << à une relation récursivement
énumérable (mais pas forcément un ordre) sur les entiers, c'est assez
évident à faire, et on s'arrange même pour que si b<<a pour cette
relation étendue et que a est dans O alors b y est aussi.

Il faut aussi voir que O est un arbre pour <<, c'est-à-dire que pour
tout a dans O, l'ensemble des b de O tels que b<<a est bien ordonné ;
et cet ensemble a d'ailleurs pour type d'ordre |a|.

On appelle « ordinal dénotable » l'image par |·| d'un élément de O.
On peut montrer qu'un ordinal est dénotable si et seulement si il est
récursif / calculable, c'est-à-dire qu'il existe un bon ordre récursif
sur une partie récursive de N qui a pour type l'ordinal en question
(un sens est clair : si \alpha=|a|, alors \alpha est le type d'ordre
de l'ensemble {b tq. b<<a} et on a la relation recherchée sur cet
ensemble ; l'autre sens n'est pas bien dur).

Le plus petit ordinal non dénotable, c'est-à-dire la borne supérieure
des ordinaux dénotables (les |a| pour a dans O, donc), s'appelle
l'ordinal de Church-Kleene (souvent noté \omega_1^{CK} ou quelque
chose d'approchant ; bien remarquer que c'est un ordinal dénombrable,
bien sûr, nonobstant le \omega_1 dans la notation).

Voilà pour les rappels sur les faits de base.

Une branche (sous-entendu : maximale) de O, c'est un sous-ensemble
totalement ordonné (et donc bien ordonné) maximal de O.  La longueur
de la branche, bien sûr, c'est l'ordinal (le type d'ordre) de
celle-ci.  Voici deux faits qui me fascinent :

* il existe des branches de O de longueur exactement \omega^\omega
(mais c'est la plus petite longueur possible), et

* il existe des branches de O de longueur exactement \omega_1^{CK}
(mais pas de longueur plus grande, évidemment, par définition de
l'ordinal de Church-Kleene).

Je suis un peu perplexe quant à la difficulté de ces affirmations :
est-ce que quelqu'un a les idées plus claires que moi et peut les
expliquer correctement ?  (Est-ce que c'est, par exemple, c'est dans
le cours de langage formel de première année ?)

(Une chose est totalement claire, c'est que pour tout ordinal
\alpha<\omega_1^{CK}, c'est-à-dire tout ordinal dénotable, il existe
une branche de longueur *au moins* \alpha, puisque si |a|=\alpha alors
{b tq. b<<a} est de longueur \alpha et se complète en une branche.)

Est-ce qu'on peut caractériser exactement l'ensemble des longueurs des
branches de O ?

Ordinal de Howard
-----------------

From madore@clipper.ens.fr Mon Nov 15 17:33:26 2004
Subject: l'ordinal de Howard

Voici la définition d'un ordinal dénombrable plutôt rigolo, appelé
l'« ordinal de (Bachmann-)Howard » (pour ceux qui connaissent,
l'ordinal de Bachmann-Howard est strictement plus grand que l'ordinal
de Feferman-Schütte, mais strictement plus petit que l'ordinal de
Church-Kleene).  J'essaie de synthétiser les définitions que j'en ai
lu çà ou là et de pondre quelque chose de vaguement compréhensible
(quoique assez long).  (Si des gens peuvent me confirmer que ce que je
dis a l'air de bien définir quelque chose de sensé...)

J'appellerai comme d'habitude omega le plus petit ordinal infini, et
j'appellerai par ailleurs Omega (plus léger que omega_1) le plus petit
ordinal indénombrable.  On rappelle que si kappa est un cardinal
régulier indénombrable (par exemple Omega, ou omega_2), une « fonction
normale » sur kappa désigne une fonction kappa->kappa strictement
croissante et continue.  On peut identifier une telle fonction avec
son image, qu'elle énumère, qui est dite « partie normale » de kappa :
c'est donc une partie fermée et non bornée (un « club ») de kappa.  Si
f est une fonction normale, on peut considérer l'ensemble de ses
points fixes (les alpha<kappa tels que f(alpha)=alpha), il y en a
toujours (par exemple, la limite de 0, f(0), f(f(0)), etc., est
précisément le plus petit point fixe de f) et ils forment un ensemble
normal / clos cofinal, donc indicé par une fonction normale, qu'on
peut appeler la fonction dérivée f' de f : c'est-à-dire que f'(alpha)
est le alpha-ième point fixe (en comptant à partir de zéro) de la
fonction f (en particulier, f'(0) est la limite de 0, f(0), etc.).

Un exemple classique concerne la fonction f(alpha)=omega^alpha, qui
est bien normale (sur n'importe quel cardinal régulier indénombrable).
Le alpha-ième point fixe de f, soit f'(alpha), est appelé
epsilon_alpha (donc epsilon_0 est le plus petit ordinal alpha tel que
omega^alpha = alpha).

Partant de cette fonction f-là, on est tenté de définir une fonction
de deux arguments, f(gamma,alpha), pour gamma<Omega, par :

* f(0,alpha) = f(alpha) = omega^alpha pour tout alpha<Omega,

* f(gammma+1,·) = f(gamma,·)' (autrement dit, f(gamma+1,alpha) est le
alpha-ième point fixe de la fonction f(gamma,·) ; en particulier,
f(1,alpha) = epsilon_alpha pour tout alpha), et

* pour delta ordinal limite, f(delta,·) est la fonction qui énumère
l'intersection des images des f(gamma,·) pour gamma<delta,
c'est-à-dire l'ensemble des points fixes communs aux f(gamma,·) pour
tout gamma<delta.

Attention !  Lorsque alpha>0, f(delta,alpha) n'est pas bêtement la
limite des f(gamma,alpha) pour gamma<delta : en effet, tous les f(n,1)
pour n<omega sont strictement inférieurs à f(omega,0), puisque
f(omega,0) >= f(n+1,0) = f(n,f(n+1,0)) > f(n,1), donc la limite des
f(n,1) est exactement f(omega,0), et pas f(omega,1).  Ça ne devrait
pas paraître suprenant : après tout, la limite des gamma+1 pour
gamma<delta n'est *pas* delta+1.)

En revanche, f(alpha,0) définit bien une fonction continue de alpha,
et (si f(0)>0, ce qui est manifestement le cas ici) strictement
croissante, c'est-à-dire une fonction normale.

Ce schéma f(·,·) s'appelle le schéma de Veblen.  L'ordinal alpha plus
petit point fixe de la fonction normale f(alpha,0) est appelé
l'ordinal de Feferman-Schütte, et il est déjà assez rigolo (beaucoup
plus grand que epsilon_0 = f(1,0) ou epsilon_(epsilon_(epsilon_...)) =
f(2,0)).  Mais ce n'est rien comparé à l'ordinal de Howard.

Évidemment, on a envie de continuer à diagonaliser (et c'est en gros
ce qu'on va faire).  Là, ça devient plus technique.  On pourrait
définir g(alpha)=f(alpha,0) et recommencer à partir de là, puis itérer
un peu pareil (ça définirait l'ordinal de Veblen), mais on veut faire
ça de façon un peu plus systématique.

L'idée, c'est de définir f(gamma,alpha) pour certains gamma
indénombrables (mais pas de façon croissante en gamma, sinon
évidemment on n'a plus de place dans Omega).  Par exemple, on va
définir f(Omega,alpha) comme le alpha-ième point fixe de f(·,0) (donc
f(Omega,0) est ce que je viens d'appeler l'ordinal de
Feferman-Schütte), après quoi on définit sans problème
f(Omega+gamma,alpha) pour tout gamma<Omega, sauf que f(Omega+delta,·)
pour delta limite n'énumère pas les points fixes de *tous* les
f(gamma,·) pour gamma<Omega+delta (ce serait absurde - parce qu'il n'y
en a pas ! les f(gamma,0) sont cofinaux dans Omega pour gamma<Omega)
mais seulement de ceux de la forme f(Omega+gamma,·).  Mais à cette
petite correction près, la définition précédente se transpose très
bien, et permet de définir f(Omega+gamma,·) pour tout gamma<Omega (si
on veut, c'est la même définition qu'avant, en partant de la fonction
f(Omega,·)).  On définit alors, sans surprise, f(Omega·2,alpha) comme
le alpha-ième point fixe de beta->f(Omega+beta,0).  Maintenant, il
s'agit de voir « jusqu'où on peut aller » comme ça.  La définition de
ce « schéma de Bachmann » n'est pas aussi intrinsèque que celui de
Veblen (elle fait intervenir des « séquences standard », voir plus
loin), mais il va quand même jusqu'à un certain point.

Faisons une petite digression sur les représentations en base Omega
des ordinaux.

Considérons l'ordinal epsilon_{Omega+1}, c'est-à-dire le plus petit
point fixe strictement supérieur à Omega de la fonction
alpha->omega^alpha.  On se convainc sans mal que c'est aussi le plus
petit point fixe de alpha->Omega^alpha (explication : montrer que si
alpha>Omega et alpha=omega^alpha alors alpha=Omega^alpha ; pour cela,
on montre successivement que Omega+alpha=alpha, puis que
Omega·alpha=alpha, et enfin que Omega^alpha=alpha).  Tout ordinal
possède une représentation unique « en base Omega » de la forme
Omega^{tau_0}·alpha_0 + ... + Omega^{tau_n}·alpha_n, où les alpha_i
sont des ordinaux dénombrables non nuls et où les tau_i sont
strictement décroissants (tau_0>tau_1>...>tau_n).  Lorsque l'ordinal
alpha ainsi exprimé est strictement inférieur à epsilon_{Omega+1}, on
peut dire que les tau_i sont strictement inférieurs à alpha (puisque
epsilon_{Omega+1} est le plus petit point fixe de alpha->Omega^alpha).
Par ailleurs, comme d'habitude, on peut choisir de formuler la
représentation en base Omega d'un ordinal (quelconque) en l'écrivant
comme une famille presque nulle d'ordinaux dénombrables : autrement
dit, poser alpha[tau_i] = alpha_i avec les notations ci-dessus, et
alpha[tau]=0 pour tout autre tau.  La cofinalité d'un alpha<omega_2 se
détermine, à partir de son écriture en base Omega, comme ceci : si
alpha[0] est non nul, la cofinalité est la sienne (donc dénombrable
lorsque alpha et alpha[0] sont limites, et finie s'ils sont
successeurs) ; sinon, on considère le plus petit « chiffre » non nul,
alpha[tau] : si alpha[tau] est limite _ou_ si tau est limite de
cofinalité dénombrable, alors alpha est de cofinalité dénombrable,
sinon, alpha est de cofinalité indénombrable (exemples : Omega² ou
Omega^{omega+1}·2 sont de cofinalité indénombrable, tandis que
Omega^omega ou Omega³·epsilon_0 sont de cofinalité dénombrable).

Revenons à nos moutons.

On va définir f(gamma,·) pour tout gamma<epsilon_{Omega+1} en
considérant gamma dans sa représentation en base Omega :

* f(gamma,alpha) pour gamma<Omega a déjà été défini, et on garde cette
définition.  Les définitions qui suivent sont censées être
compatibles.

* f(0,alpha) = omega^alpha.

* f(gamma+1,alpha) = le alpha-ième point fixe de f(gamma,·).

* Si delta est limite de cofinalité dénombrable, f(delta,·) énumère
les points fixes communs à tous les f(gamma_alpha,·) (ou encore
l'intersection de leurs images, cela revient au même) où gamma_alpha
est une « séquence standard » qui tend vers delta, comme sera défini
ci-dessous.

* Si delta est limite de cofinalité indénombrable, f(delta,·) énumère
les points fixes de alpha->f(gamma_alpha,0) où gamma_alpha est une
« séquence standard » qui tend vers delta, comme sera défini
ci-dessous.

Restent à définir les séquences standards pour un ordinal limite, dans
les deux cas où alpha est de cofinalité dénombrable et indénombrable,
et c'est là que la représentation en base Omega va servir.

Si delta est de la forme Omega·beta+delta[0] où delta[0] est non nul
et dénombrable (et, obligatoirement, limite, puisque delta l'est),
autrement dit si alpha *n'est pas* un multiple de Omega (et delta[0]
est son reste par « division euclidienne » par Omega), alors on
définit gamma_alpha comme Omega·beta+alpha pour tout alpha<delta[0] :
c'est la séquence standard convergeant vers delta.  Ceci traite le cas
où le dernier chiffre delta[0] de la représentation de delta en base
Omega n'est pas nul.  (Exemple : la séquence standard pour
Omega+epsilon_0, ce sera les Omega+alpha avec alpha<epsilon_0.)

Sinon, si delta est de la forme Omega^tau·(Omega·beta + delta[tau])
avec delta[tau] non nul, dénombrable et limite, autrement dit si le
dernier chiffre non nul delta[tau] de l'écriture en base Omega de
delta est limite, alors on définit la séquence standard gamma_alpha
par Omega^tau·(Omega·beta + alpha) pour tout alpha<delta[tau].
(Exemple : la séquence standard pour Omega·omega, ce sera les
Omega·n avec n entier naturel.)

Sinon, si delta est de la forme Omega^tau·(Omega·beta + delta[tau])
avec delta[tau] = omega·psi + n où n est entier naturel non nul, et
tau est de cofinalité dénombrable, autrement dit si le dernier chiffre
non nul delta[tau] de delta en base Omega est successeur mais
correspond à une puissance tau qui, elle, est limite de cofinalité
dénombrable, alors on définit gamma_alpha comme Omega^tau ·
(Omega·beta + omega·psi + (n-1)) + Omega^{tau_alpha} où tau_alpha est
la séquence standard pour tau (noter que comme tau<delta puisque
delta<epsilon_{Omega+1}, cette définition utilise bien un cas déjà
défini !).  Par exemple, la séquence standard pour
Omega^{Omega+omega}·2, c'est les Omega^{Omega+omega} + Omega^{Omega+n}
avec n parcourant les entiers naturels.

Voilà, ça ça devrait couvrir tous les cas où delta est limite de
cofinalité dénombrable.  Maintenant les cas de cofinalité
indénombrable : c'est plus simple : delta s'écrit Omega^tau ·
(Omega·beta + delta[tau]) où delta[tau] (le dernier chiffre non nul,
comme d'habitude) est successeur et tau est soit successeur soit
lui-même limite de cofinalité indénombrable.  On écrit donc delta[tau]
= omega·psi + n avec n entier naturel non nul.

Si tau est successeur, disons tau=rho+1, alors on définit gamma_alpha
comme Omega^tau · (Omega·beta + omega·psi + (n-1)) + Omega^rho·alpha
avec alpha parcourant tous les ordinaux dénombrables.  Exemple : la
séquence standard pour Omega²·3, c'est les Omega²·2 + Omega·alpha avec
alpha parcourant les ordinaux dénombrables.

Si tau est limite de cofinalité indénombrable, alors on définit
gamma_alpha comme Omega^tau · (Omega·beta + omega·psi + (n-1)) +
Omega^{tau_alpha} où tau_alpha est la séquence standard pour tau.
Exemple : la séquence standard pour Omega^{Omega²}, c'est les
Omega^{Omega·alpha} avec alpha parcourant les ordinaux dénombrables.

Si je ne délire pas, ceci définit bien la séquence standard dans tous
les cas.  Les notations sont un peu lourdingues, mais c'est bien « ce
qu'on pense » à chaque fois.

Maintenant, on se doute bien ce que c'est que l'ordinal de Howard :
c'est la borne supérieure des f(Omega^{Omega^{Omega^...}},0).
Évidemment, ça revient à définir une séquence standard (à savoir 1,
Omega, Omega^Omega, Omega^{Omega^Omega}, etc.) qui tend vers
epsilon_{Omega+1}, ce qui permettrait, du coup, de définir les
notations jusqu'à epsilon_{Omega+2}, mais enfin, bon, il faut savoir
s'arrêter un jour.  D'autant plus que je ne crois pas qu'on puisse,
quoi qu'on fasse, continuer le schéma jusqu'au plus petit point fixe
*de cofinalité indénombrable* de alpha->omega^alpha.

Ordinal analysis
----------------

From madore@clipper.ens.fr Mon May 21 18:26:00 2007
Subject: Re: ordinal analysis

Dam's in litteris <f2ser5$4m9$1@clipper.ens.fr> scripsit:
> Est-ce que quelqu'un a une introduction au sujet?

<URL: http://en.wikipedia.org/wiki/Large_countable_ordinals > (je suis
un des auteurs) et les références y citées.

> D'apres ce que j'ai compris, c'est une maniere de definir la "puissance"
> d'une theorie logique (j'imagine qu'a une theorie on associe le plus petit
> ordinal dont elle ne peut pas prouver l'existence).

Plutôt (et plus précisément) : à une théorie on associe le plus petit
ordinal alpha tel que la théorie ne montre l'induction transfinie pour
aucune notation ordinale à la Kleene dont le (vrai) ordinal est alpha.
Enfin, si je ne me trompe pas.  Rappelons que les notations ordinales
sont des entiers naturels (codant un programme de machine de Turing
qui génère des notations d'ordinaux plus petits) et que la difficulté
est de savoir si une notation supposée est effectivement [la notation
d'un] ordinal, c'est-à-dire de s'assurer qu'on a bien affaire à un bon
ordre (c'est-à-dire de prouver l'induction transfinie jusqu'à cette
hauteur).

> Par exemple l'ordinal associe a l'arithmetique de Paeno est \epsilon_0 il me
> semble,

Oui : pour tout ordinal inférieur à epsilon_0 il existe une notation
pour cet ordinal tel quel Peano prouve l'induction transfinie (pour
n'importe quelle formule [arithmétique, forcément] fixée) jusqu'à
cette notation, alors qu'il n'en existe aucune pour epsilon_0.

>	  mais pour ZFC c'est quoi (j'ai dans l'idee que ce serait un cardinal
> inaccessible. Mais je suis un peu confuse parce que il me semble que
> 2^\aleph_0, qui "existe" dans ZFC peut tres bien etre faiblement
> inaccessible (ca ne contredit pas ZFC)).

Non, c'est forcément un ordinal dénombrable, et même un ordinal
strictement inférieur au omega_1 de Church-Kleene.  Mais pour des
raisons « évidentes » il n'est pas descriptible de façon utile (en
gros le meilleur qu'on puisse décrire de façon sensée c'est la
puissance ordinale de la théorie des ensembles de Kripke-Platek, et en
l'occurrence c'est l'ordinal de Bachmann-Howard).

Pour ZFC tu peux le décrire de façon complètement idiote (donc
inutile) avec un truc du style : tu prends l'ensemble des paires (p,x)
où x est un entier naturel et p est une démonstration dans ZFC qu'une
certaine relation '<_p' est un bon ordre sur les entiers naturels
(bon, faut peut-être chipoter sur ce que ça veut dire au juste, du
style prendre une suite de preuves d'induction pour tous les énoncés
arithmétiques ou je ne sais quoi) et on ordonne ça en mettant toutes
les relations '<_p' bout à bout (sur x).  Manifestement tout ça peut
se définir par une unique formule de l'arithmétique : en une seule
formule tu peux tester que p est bien une preuve gnagnagna.
Manifestement, ZFC ne peut pas prouver que l'ordre résultat est bien
fondé, et pourtant une théorie plus forte ZFC+IC le prouve, donc ça te
donne bien un ordinal, et ZFC prouve l'induction jusqu'à toute hauteur
plus petite que cet ordinal.  Donc c'est exactement la force de ZFC.
Enfin, y'a certainement plein d'imprécisions et de trucs à corriger
dans ce que j'ai écrit, mais c'est l'idée.

En tout cas, ce dont je suis sûr c'est qu'on peut donner une notation
ordinale explicite pour la puissance de ZFC, mais cette notation est
sans intérêt parce qu'elle fait juste intervenir un ordre sur les
preuves de ZFC.  Alors que pour des théories plus faibles on a des
notations ordinales plus intéressantes.

> Et quand on dit par exemple que le theoreme de Goodstein a la puissance de
> \epsiolon_0, ca veut dire quoi exactement?

Le rajouter à Peano doit être équivalent à ajouter l'affirmation que
<telle notation ordinale explicite définissant epsilon_0 de façon
raisonnable et que je ne prends pas la peine de décrire> est un bon
ordre (i.e., qu'on a l'induction transfinie pour toute formule).

Par contre, je suis extrêmement flou sur la question de svoir quelle
est la puissance ordinale de Peano+Consis(Peano) ou des trucs de ce
genre.

