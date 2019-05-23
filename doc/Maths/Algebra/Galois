vim: ft=markdownlight fdm=expr

Multiplicités
=============

P est séparable <=> il est premier avec P'; et P/P \wedge P' est toujours
séparable. 
Sur un corps parfait, un irréductible est toujours séparable.
Contre exemple classique: X^p-T est irréductible non séparable.

Preuve:
Si P=P0^n Q, P'= n P0' P0^{n-1} Q + P0^n Q' donc P0^{n-1} divise P \wedge P',
ie P non séparable => P non premier à P', ie P premier à P'=>P séparable.
En carac p, on a même P0^n divise P \wedge P' si n est divisible par p.
Donc Q=P/ P \wedge P' = \prod P_i où les P_i sont distincts et P_i n'est pas de
multiplicité un multiple de p dans P.

En raisonnant sur kbar (ça ne change pas P \wedge P'), on a donc que
(P \wedge P')=\prod (x-a)^m où a racine de P, et m=n-1 si a est d'ordre n
dans P, n non divisible par p, et m=n si a est d'ordre n, n divisible par
p. Et P/ P\wedge P' = \prod (x-a) où les a son les racines distinctes de P de
multiplicité dans P non divisibles par P. Donc on a bien (i).
Pour obtenir les autres racines de P, on peut regarder
P/ P \wedge Q^deg P qui est égal à la p-partie de P,
donc sur un corps parfait on peut prendre une racine p-ième et itérer.

Enfin si P est irréductible, alors P est premier avec P' sauf si P'=0, ie
si P=Q^p sur kbar. Si k est parfait alors Q \in k[X] donc P n'est pas
irréductible.

Critère de résolubilité
=======================

Si P \in Q[x] est irréd de degré premier, alors Gal(P) est résolube ssi le
spliting field est engendré par 2 racines de P.
http://mathoverflow.net/questions/110727/on-a-theorem-of-galois
http://mathoverflow.net/questions/24081/solvable-transitive-groups-of-prime-degree


Groupe fondamental
==================

Théorie de Galois finie
-----------------------

Théorie de Galois: soit L/k une ext Galoisienne finie, G=Gal(L/k).
Alors le foncteur E -> Hom_k(E,L) est une antiéquivalence de catégorie
entre les algèbres étales déployées sur E et les G-ensembles finis.

Rappels:
- E déployée ssi E \tens_k L \iso L^{deg E}
- L/k est Galoisienne si L est déployé sur lui-même
- Une algèbre étale E est un produit de corps séparables
  (et elle est déployée sur L si les corps sont des sous-corps de L)

Le passage à la cloture séparable se fait sans problème, en prenant en
compte la protopologie induite sur Gal(ksep/k)=\lim_proj Gal(L/k)
et en regardant les actions continues.

Groupe fondamental étale
------------------------

Soit X/k un schéma étable, et x \in X(ksep). On a le foncteur fibre
F: (Y->X) -> Y(x) (des revêtements étales)

Le groupe de Galois G est alors isomorphe à Aut(F).
De plus F est représentable par le revêtement étale fondamental Z, ie 
F(Y)=Hom(Z,Y) et donc G=Hom(Z,Z)

Dans le cas des corps, Z=ksep et F(L)=Hom_k(L,ksep)

G-ensembles finis
-----------------
(traduction du dictionnaire plus haut)

Un G-ensemble fini (X,p) pointé est simplement un morphisme de G->X (qui
envoie 1\in G dans p). Si X est une orbite (ie si l'action est transitive),
alors X correspond à un corps K et p \in X correspond à un plongement de K
dans L. (X,p) est donc caractérisé par H=Stab p \subset G (et
réciproquement à H on associe l'ensemble pointé (G/H,e)). On retrouve la
correspondance de Galois classique qui associe les sous-corps de L aux
sous-groupe de G; les classes de conjugaison consistent à changer le point
base.
On a donc K=L ssi X=G ssi le sous-groupe est {e}
          K=k ssi X={pt} ssi le sous-groupe est G

- dim_k E=|X|
- Le produit XxY correspond au produit tensoriel E \tens F,
  et le produit fibré X x_Z Y doit correspondre au produit tensoriel
  E \tens_K F.
- Le coproduit X U Y correspond au produit cartésien E x F.
- Si K_1, K_2 \subset L, alors K_1 K_2 correspond à l'orbite de (x,y) dans XxY
[(X,x) correspond à K_1, (Y,y) à K_2, XxY correspond à K_1 \tens K_2, et
l'image =K_1 K_2 de K_1 \tens K_2 dans L = K_1 K_2 correspond donc à (XxY,
(x,y)) ou implicitement quand on point un ensemble on parle de son orbite).
- L \tens_k K correspond à G \times X
  [expliquer comment voir L \tens L comme \oplus L_\sigma, pour chaque
  \sigma dans le groupe de Galois G; en trivialisant l'action à gauche]
- Si X et Y sont des orbites, alors il existe au plus un unique morphisme
  envoyant x \in X sur y \in Y; pour qu'il existe il faut que Stab(x)
  \subset Stab(y) ie le morphisme est surjectif (et au niveau des corps on
  a une injection...). Si on fixe x et y (ie les plongements de K_1 et K_2 dans
  L), alors les conjugués du plongement de K_2 dans L restent dans K_1 ssi
  g Stab(y) g^{-1} \subset Stab(x)

- f:X->Y est un monomorphisme ssi f est injectif ssi u:F->E est un épi ssi u
est surjectif.
- f:X->Y est un épi ssi f est surjectif ssi u:F->E est un mono ssi u est
injectif.

Les G-ensembles admettent les équalisateurs et les coéqualisateurs (qui
commutent avec le foncteur d'oubli vers les ensembles, donc ils sont tous
effectifs; on a une catégorie régulière). Du côté des algèbres étales un
équalisateur est aussi donné ensemblistement; une manière de voir le
coéqualisateur est de le voir comme un coproduit fibré, il est donc donné
par le produit tensoriel F \tens_E F.

Plus généralement les produits fibrés sont transformés en coproduits fibrés
et vice versa.

Comme G-ens est régulière, on a une bonne notion d'image, et l'image de f
coincide avec l'image de u (on peut voir ça en définissant l'image comme
factorisant f en un épi suivit d'un mono; ça reste stable par anti-équivalence de catégorie).

TODO:
- caractériser les extensions linéairement disjointes
- Gal(L_1 L_2)=Gal(L_1)x_Gal(K) Gal(L_2)
- Changement de base (ie alg étales au-dessus de K) comme la catégorie
  fibrée au-dessus de X
- Restriction à K \subset L galoisien (ie X=G/H groupe) [=> restriction aux
  alg étales déployées sur K]

Produit tensoriel
=================
cf Eisenbud

Th: K est séparable sur k équivaut à
(i) Pour toute extension L/k, L \tens_k K est réduit
(ii) k^{1/p^\infity) \tens_k K est réduit
(iii) k^{1/p) \tens_k K est réduit
(iv) k^{1/p^\infity) est linéairement disjoint de K
(v) k^{1/p) est linéairement disjoint de K
(vi) K^p est linéairement disjoint de k sur k^p [cf wikipedia]

- Si R est intègre, S réduit et contiennent un corps k.
  Alors si K(R)/k est séparable, R \tens_k S est réduit.

  Application: si K/k séparable et L/K séparable, L/k séparable.

- Si R, S sont intègres et contiennent un corps k.
  Si K(R)/k est séparable et k alg clos dans K(R), alors
  R \tens_k S est intègre.

Application: le produit de deux variétés irréductibles sur k alg clos est
une variété irréductible.

-  Si K(R)/k est fini et purement inséparable, R \tens_k S est irréductible
   (ie il y a juste un premier minimal).

   http://mathoverflow.net/questions/82083/when-is-the-tensor-product-of-two-fields-a-field
   A field extension E/k is primary if the algebraic closure of k in E is purely inseparable over k. In that case for any field extension F/k the quotient E⊗kF/Nil(E⊗kF) is a domain. In other words Spec(E⊗kF) is irreducible.

http://mathoverflow.net/questions/82083/when-is-the-tensor-product-of-two-fields-a-field
Theorem (Grothendieck-Sharp ) The Krull dimension of the tensor product of the field extensions K/k,L/k is given by the formula
dimKrull(K⊗kL)=min(trdegk(K),trdegk(L))

Extensions séparables/inséparables
==================================

Résumé: K/k séparable <=> toute extension de type finie K'/k a une base de
transcendance séparable <=> toute extension de type finie K'/k est
séparable <=> pour toute ext de type finie K'/k, Omega_K'/k = deg tr_k K'.
Si K/k algébrique, K/k séparable <=> tout x dans K est séparable <=>
Omega_K/k=0.

Conrad:
http://www.math.uconn.edu/~kconrad/blurbs/galoistheory/separable2.pdf
Caractérisations d'une extension séparable et extension aux cas
d'extensions non algébriques.

Multiplicité
------------

K corps de carac p.

Si P=\prod P_i^n_i décomposition en irréductible, alors
P \wedge P'=1 ssi n_i=1 et P'_i \ne 0 pour tout i.
Or si K parfait, P irréductible => P' \ne 0, donc P \wedge P'=1 ssi P a des
facteurs simples.
[Pr: si P'=0, P=\sum X^p^i=(\sum X^p^{i-1} + \alpha)^p où \alpha^p=terme
constant, donc P non irréductible]

Exemple: si K alg clos, P \wedge P'=1 ssi les racines sont de multiplicité
1, et P'=0 ssi toutes les racines sont de multiplicité divisible par p.

L'exemple de X^p-T dans F_p(T) montre qu'on peut être irréductible mais
avoir une racine de mult p dans une cloture algébrique.

Inséparabilité
--------------

Si K/k est une extension algébrique, il existe K_s \subset K qui est
l'extension séparable maximale; alors K/K_s est purement inséparable.

Si K est normal, alors on regarde K_i=K^G, on a k-k_i purement inséparable
et k_i-K est séparable.

   K

K_i K_s

   k
On vérifie facilement que K=K_i K_s et K_i \inter K_s=k (ie ils sont
linéairement disjoint)

cf http://mathoverflow.net/questions/15987/if-k-k-is-a-finite-normal-extension-of-fields-is-there-always-an-intermediate-f, qui renvoit vers Lang Proposition 6.11

Séparabilité
------------

Déf: K est séparément généré si il existe une base de transcendance telle
que K/k(x1,...,xn) soit séparable.
Déf: K séparable si K'/k séparément généré pour tout K'/k de type fini.
     K sep généré => K séparable.

p-base: x_i p-base  ssi les P(x_i)/  deg_x_i P <p est une base de K/k*K^p
Prop: si B=x_i p-base, alors K=k*K^q[B] pour q=p^n
      si de plus K/k séparable, B q-base; donc en poussant n->\infty
      les x_i sont alg indépendant sur k*K^p^\infty
      (si K/k non séparable alors B contient une base de transcendance qui
      peut être plus petite)
Cor: - separating transcendance basis => p-basis
     - B p-basis + K/k finitely generated => K/k(B) finite,separable
       si de plus K/k séparable => B base de transcendance séparable

Résumé: K/k séparable, p-base => base de transcendance (séparable si K/k de
type fini); et base de transcendance séparable => p-base.

Différentielles
---------------

Th: Omega_K/k a pour base les dx_i, ssi x_i est une p-base (en car 0 ssi x_i base de transcendance). Donc si K/k séparable de type fini, Omega_K/k a pour base
dx_i ssi x_i base de transcendance séparable.

Lemme: si K/k séparable algébrique, Omega_R/K=K \tens_k \Omega_R/k

Cor: R/k localisation d'une algèbre de type fini sur k.
Omega_R/k=0 <=> R étale (ie R somme directe finie de corps k'/k finis séparables)
Cor: si K/k est de deg transcendance r, dim_k Omega_K/k>=r avec équalité
ssi K/r séparable.
Cor: si K/k de type fini séparable, tout système de générateurs contient
une base de transcendance séparable
Descent
=======

Galois Descent
--------------

Cf: http://www.tac.mta.ca/tac/volumes/23/5/23-05.pdf
(Monadic descent rather than Grothendieck descent)

http://www.sphere.univ-paris-diderot.fr/IMG/pdf/Descent_theory_torsors.pdf
Galois Descent theory, descent along fppf topology and the fact that they
form a stack.

http://www.math.uconn.edu/~kconrad/blurbs/galoistheory/galoisdescent.pdf
Elementary introduction to Galois descent

Faithfully flat descent
-----------------------

http://pub.math.leidenuniv.nl/~zomervruchtw/docs/ffdesc.pdf
Faithfully flat descent, Wouter Zomervrucht, November 6, 2013

- QCoh is an fpqc stack, ie every descent datum is effective for
quasi-coherent sheaves on the fpqc topology
- representable functors are fpqc sheaves:
  if U->S is an fpqc covering and we have a morphism f:U->Xx_S U
  such that the pullbacks on Ux_S U coincide then f comes from a
  g:S->X

Remarque: si f:Y->X est fidèlement plate de prés finie; alors f est ouverte
(f est submersif); le polynôme de Hilbert des fibres est constant.
Exemple: extension des scalaires

Application: http://math.stackexchange.com/questions/424758/a-question-on-faithfully-flat-extension
Let B be a faithfully flat extension of A. Can I claim that b⊗1=1⊗b in B⊗AB if and only if b∈A?

Réponse oui: par descente on peut tensoriser par B, et demander si c'est
vrai pour B'/B où B'=B\tens_A B. Mais on a une section de \Spec B'->\Spec B
donnée par B'->B: x \tens y=xy, ie on peut supposer B'=B \somme I; donc
B' \tens_B B'=B + I + I + I \tens_B I.
The general philosophy behind this kind of argument is that for answering these kinds of questions when A→B is faithfully flat, it is usually no loss of generality to assume in addition that A is a direct summand of B as an A-module.

Extensions de Kummer et d'Artin-Schreier
========================================

Kummer
------

A Kummer extension is a field extension L/K, where for some given integer n > 1 we have
- K contains n distinct nth roots of unity (i.e., roots of X^n-1)
- L/K has abelian Galois group of exponent n.

Kummer theory: if K has n distinc nth roots of unity, then
abelian extensions of K of exponent n correspond bijectively with subgroups
of
  K*/K*^n
via the correspondance
  \Delta -> K(\Delta^{1/n})
and reciprocally L -> \Delta = (K* \cap L*^n)/K*^n \iso Hom(Gal(L/K), \mu_n)
où l'isomorphisme est $a \mapsto (\sigma \mapsto \sigma(\alpha)/\alpha)$ où
$a=\alpha^n$.

Exemple: si L=K(\beta)/K est cyclique de degré p, \zeta racine primitive p-ième,
\alpha =\sum_{l=0}^{p-1}\zeta^l \sigma^l(\beta)
vérifie \sigma(\alpha)=\alpha/\zeta, donc \alpha^p=N_{L/K}(\alpha) \in K.

Artin Schreier
--------------

K de carac p.

P(X)=X^p-X+a, par Galois P splitte complètement dans son corps de rupture
donc soit P est tot split sur K soit P irréductible et L=K(\beta)/K est
cyclique d'ordre p: \sigma^i(\beta)=\beta+i.

Récip si, L/K cyclique de degré p, alors L vient d'une extension d'Artin
Schreier.

Normal basis
============

See Normal Bases over Finite Fields by Shuhong Gao
http://www.math.clemson.edu/~sgao/papers/thesis.pdf

L/K ext Gal

Discriminant: \Delta=dét (Tr(a_i a_j))
\Delta !=0 iff the a_i forms a basis of L/K

Let A=(\sigma_j(a_i)). Then \Delta=dét (A A^T)
so a_i basis iff \dét A != 0

Plus généralement:
a_i \in L forment une famille libre dans L(=K^n) sur K
ssi les vecteurs (\sigma_j(a_i)) forment une famille libre dans L^n sur L.

Preuve marteau pilon: c'est de la descente Galoisienne,
si V est l'espace engendré par les a_i, alors V \tens_K L est engendré par
les (\sigma_j(a_i))
Sinon c'est de l'algèbre linéaire

Additive polynomials
--------------------

http://en.wikipedia.org/wiki/Additive_polynomial

P(a+b)=P(a)+P(b)
Then P(x)=\sum a_i x^p^i
k{\tau_p} ring of additive polynomial (under sum and composition)

Let P(x) be a separable polynomial with coefficients in k, then P(x) is
additive if and only if the roots forms a group with the field addition.

For proofs and a lot more details, see:
http://math.usask.ca/~fvk/Fvkbook.htm
Chapter 12: http://math.usask.ca/~fvk/bookch12.pdf

Détail: soit donc W un sous-espace de dim m de \F_p^n de dim m
(un sous-groupe additif est un ev car on a la mult par Z).
Alors si b_1, ... b_m est une base,
le polynôme qui s'annule sur W est donné par
dét(b_i^p^j; x, x^p, ...)
Cf Normal_Basis

Résolvantes
===========

S_n agit sur k[X1,...,Xn]
H \subset S_n.
P=\sum_{\sigma \in H} \prod X^i_{\sigma(i)}
Alors Stab P=H

Plus généralement si c \in S_n/H;
P_c=\sum_{\sigma \in c} \prod X^i_{\sigma(i)}

Groupe de Galois de Q(\alpha)=Q(\alpha_1,...,\alpha_n) (le corps de décomp
d'un pol Q)
=> On calcule les P_c(\alpha)_{c \in S_n/H}

Th: - Si Gal \subset H, P_0(\alpha) \in Q
    - R=\prod_c (X-P_c(\alpha)) a une racine simple ds Q <=> \Gal \subset H
      (à conjugaison près)

Plus généralement (Cohen, Algebraic Number Theory, Section 6.3 p316):
Soit G un sous-groupe de S_n contenant Gal(T)
P un pol tel que Stab P=H (dans G)
Résolvante: R_G(P,T)=\prod_{c \in G/H} (X-P o c(\alpha)))
[comme Stab P=H, Poc ne dépend que de la classe de c]

Th 6.3.3: si R_G(P,T) est square free, son groupe de Galois est
\phi(Gal(T)) où \phi représente l'action de G sur G/H (ie \phi(G) \subset
S_m, avec m=#G/H=deg R_G)
En particulier la liste des degrés des facteurs irréductibles de R_G donne
la liste des longueurs des orbites de \phi(Gal(T)) sur {1,...,m}.
En particulier R_G a une racine dans Q (et donc dans Z) ssi Gal(T) est
conjugué dans G a un sous-groupe de H.
[Ce dernier énoncé n'a en fait pas besoin que R_G soit square free, le =>
est évident et pour le <= on a juste besoin que la racine soit simple]

NFS
---

Res(a-bX,f) =~ max(|a|,|b|)^deg f
Res(a-bX,g) =~ a-bm =~ b ||g||

Corps finis (forum)
===========

Note que s'il s'agit juste de compter le nombre de polynômes
unitaires, resp. unitaires irréductibles, resp. unitaires
irréductibles primitifs, de degré k, sur F_p, sans les énumérer, ça se
fait très bien.  Je vais expliquer comment (les agrégatifs sont
encouragés à lire ce qui suit, n'est-ce pas, Fabrice ? ;-).

Pour simplifier, je me place sur F_p avec p premier.  Je laisse en
exercice au lecteur la tâche de tout refaire sur un corps de base F_q
non nécessairement premier.

D'abord, le nombre de polynômes unitaires de degré k sur F_p est

				 p^k

Ça c'est évident.  Mais je le signale pour amener la suite.

Une observation : si P est un polynôme irréductible sur un corps fini,
son corps de décomposition est égal à son corps de rupture.
[Démonstration : avec de la théorie de Galois, c'est trivial : le
corps de décomposition est la clôture galoisienne du corps de rupture,
c'est le composé de tous ses conjugués par le groupe de Galois
absolu ; mais comme le groupe de Galois est abélien (procyclique
engendré par le Frobenius), il n'y a qu'un seul conjugué.  On peut
certainement dire ça de façon plus élémentaire.]

Ça, ça nous dit que la donnée d'un polynôme unitaire irréductible de
degré k sur F_p, c'est pareil que la donnée d'une orbite à k éléments
du groupe de Galois, c'est-à-dire essentiellement du Frobenius,
agissant sur F_{p^k}.  On veut donc regarder un peu de plus près à
quoi ressemble F_{p^k} muni de cette action du Frobenius.

L'astuce, maintenant, c'est d'oublier la structure additive sur
F_{p^k}, et ne garder que la structure multiplicative.  Parce qu'elle
est particulièrement simple : on a un élément tout seul, le zéro, et
les autres éléments forment un groupe cyclique (d'ordre p^k-1, donc).
Là-dessus, le Frobenius, il laisse zéro fixe (évidemment) et il agit
par élévation à la puissance p, c'est-à-dire, si on note additivement
(plutôt que multiplicativement) le groupe cyclique multiplicatif, par
multiplication par p.  Cette multiplication par p a ordre k (car elle
envoie 1 sur p, sur p², sur..., sur p^k=1, qui sont tous distincts,
donc elle n'a pas un ordre moins, et certainement pas plus non plus).

Commençons par compter les polynômes unitaires irréductibles de degré
k sur F_p.  D'après ce que je viens d'expliquer, il suffit pour ça de
compter les éléments de F_{p^k} sur lesquels l'ordre de p est
exactement k (i.e., qui appartiennent à une orbite de cardinal k) et
diviser par k.  Or les éléments qui appartiennent à une orbite plus
petite, ce sont ceux qui appartiennent à un F_{p^l} pour l divisant k
(où l est la taille de l'orbite en question).  Pour les compter
précisément, on va partir de p^k, soustraire tous les p^l pour l=k/d
avec d un facteur premier de k, mais en ce faisant on aura décompter
deux fois certains éléments, donc il faut ajouter à nouveau les p^l
avec l=k/(dd') avec d et d' deux facteurs premiers distincts de k, et
ainsi de suite.  Sur l'exemple de p=2 et k=18, le nombre de polynômes
unitaires irréductibles de degré 18 sur F_2 est donc donné par 1/18
fois 2^18 - 2^9 - 2^6 + 2^3 = 261576 (il y a 262144 éléments dans
F_{2^18}, dont on retire les 512 appartenant à F_{2^9}, les 64
appartenant à F_{2^6} et on rajoute les 8 qui appartiennent aux deux à
la fois, c'est-à-dire à F_8, parce qu'on les a décomptés deux fois),
soit 14532 (on a trouvé 14532 orbites de taille 18), ce qui est bien
la valeur que tu annonçais.  Pour le dire plus proprement et plus
formellement, le nombre de polynômes unitaires irréductibles de degré
k sur F_p est :

		     (1/k) · somme(mu(d)·p^(k/d))

où mu(d) est la fonction de Möbius et d parcourt les diviseurs de k.
Remarquons qu'on a simplement besoin de savoir factoriser k ici.  Et,
comme Mehdi le disait, ça fait en gros un polynôme unitaire sur k qui
est irréductible.

Maintenant, comptons le nombre de polynômes unitaires irréductibles
qui sont primitifs (rappelons que ça veut dire qu'une de leur racines
- et, par conséquence, n'importe laquelle de leurs racines - engendre
le groupe multiplicatif de F_{p^k}).  Le nombre d'éléments primitifs
du groupe multiplicatif de F_{p^k} est donné par phi(p^k-1) où phi est
la fonction indicatrice d'Euler.  Sur chacun de ces éléments, le
Frobenius a bien l'ordre k (je veux dire, chacun appartient bien à une
orbite de cardinal k) parce que c'est le cas de l'un d'entre eux (1,
comme je l'ai expliqué au début) et que tous ces éléments sont
conjugués par des automorphismes (*multiplicatifs seulement* ! ce ne
sont pas des automorphismes pour la structure de corps !) du groupe
cyclique d'ordre p^k-1.  Bref, le nombre recherché est tout
simplement :

			  (1/k) · phi(p^k-1)

Noter qu'ici, la formule peut paraître plus simple, mais il faut
savoir factoriser p^k-1 pour l'utiliser, ce qui est quand même autre
chose que de factoriser k...  Exemple : pour p=2 et k=18, toujours, on
a 2^18-1 = 3³·7·19·73, donc phi(2^18-1) = 2·3²·6·18·72 = 139968, et le
nombre de polynômes unitaires irréductibles primitifs est 1/18 fois
ça, soit 7776.  (Attention : si p>2, il faut se rappeler qu'il y a une
racine primitive (p-1)-ième dans le corps de base.  Donc, si la
formule ci-dessus est juste, il convient cependant de penser que
chaque racine primitive (p^k-1)-ième en détermine p-1 par
multiplication par les éléments non nuls du corps de base.)

On peut éventuellement dire quelques petites choses sur la
combinatoire de ces trucs.  Dans le cas où 2^k-1 est un nombre
premier, par exemple, c'est-à-dire un premier de Mersenne, il y a donc
(2^k-2)/k polynômes unitaires irréductibles de degré k sur F_2 qui
sont primitifs : ils le sont tous (et évidemment, du coup, k lui-même
est premier...).

Ce qui est un peu perturbant, avec les corps finis, c'est que les
polynômes cyclotomiques ne sont pas irréductibles : en comptant comme
je viens de le faire, c'est flagrant : le polynôme cyclotomique pour
les racines (p^k-1)-ièmes de l'unité, il est de degré phi(p^k-1), et
il se décompose en phi(p^k-1)/k polynômes irréductibles primitifs
chacun de degré k.  Quand on y pense, c'est assez violent, comme
décomposition (comme non-irréductibilité).  Et ça veut dire que, alors
que le groupe multiplicatif de F_{p^k} a phi(p^k-1) automorphismes,
seul un sous-groupe d'ordre k, le groupe de Galois, donne des
automorphismes de *corps*.

En particulier, si je me dis : j'appelle g un générateur du groupe
multiplicatif de F_{p^k}, j'ai donc g, g^p, g^{p²}, ..., g^{p^{k-1}}
qui sont un système complet de conjugués (une orbite de cardinal k
sous l'action de Galois, quoi), donc (X-g)·...·(X-g^{p^{k-1}}) doit
être un polynôme unitaire irréductible primitif.  Seulement, manque de
chance, on peut certes calculer le coefficient constant de ce
polynôme, mais, pour les autres, il faudrait connaître la structure
additive, et ça, on ne sait pas faire.  Et pour cause : ça dépend du
choix de g, il y en a plein possibles, et ils ne sont *pas* conjugués
par Galois.  Comme je disais, je trouve ça hautement perturbant.

(Normalement, là, je devrais parler des places au-dessus de p du corps
Q(\zeta_{p^k-1}) obtenu en rajoutant une racine primitive (p^k-1)-ième
de l'unité aux rationnels, et de choses de ce genre, mais je n'ai pas
le temps.  Peut-être plus tard.)

--
David, qui n'a jamais trouvé aucun endroit où ces choses étaient bien
expliquées.  Du coup, on en retient une idée très vague des corps
finis.

Revêtements topologiques
========================

Propriétés topo élémentaires
----------------------------

Def pour B loc connexe:
X/B est un revêtement ssi
il existe un recouvrement de B par des ouverts connexes U, tel que toute
composante connexe V de \pi^-1(U) soit isomorphe à U.

Déf: pour X/B, étalé=homéo local, séparé=la diagonale fibrée est fermée
- Si X/B est étalé séparé, alors X est un revêtement trivial ssi tout point
x\in X admet une section.
- Si B connexe et loc connexe, X/B revêtement, alors X trivial <=> tout
  point d'une fibre admet une section

- Si f,g Y->X sont des morphismes de B-revêtement, f=g sur un ensemble ouvert
fermé. En particulier, si Y connexe et f(y)=g(y), ou si B connexe et f=g
sur une fibre, alors f=g.
- Si f Y->X morphisme de revetement, B loc connexe, f est un revetement
  (En effet, si B connexe et que Y, X sont triviaux, alors Y->X est un
  revetement de X, trivial sur chaque composante connexe de X)
Application:
  - si f Y-> X morphisme de revetement, f(Y) est ouvert fermé dans X, en
  particulier f est surj si X connexe
  - si B est connexe et que f est une bij sur une fibre, f est un iso.
Inversement, si Y revetement de X, X revetement de B, et X/B fini ou B loc
simplement connexe => Y/B revetement.

Prop: X/B revetement fini <=> X->B est étale, propre et séparée

Th: si g,f B'-> B sont homotopes, X/B revetement, alors les pullback de X
par f et g sont des revêtements isomorphes sur B'

Revetement universel
-------------------

Def: revetement universel, represente le foncteur fibre X -> X(b_0) de
l'espace pointé (B,b_0). E/B revetement, E universel <=> E est connexe +
trivialise toute revetement de B. En particulier, si E simplement connexe
il est universel.

Prop: si B est connexe, loc simplement connexe, il admet un revetement
universel simplement connexe

Revetement galoisien
--------------------

E/B est Galoisient si E se trivialise, ie Aut_B(E) opére transitivement sur les fibres de E.

Si X/B est connexe et f:E -> X morphisme de revetement, alors E/X est
galoisien, et Aut_X(E) est le sous-groupe de Aut_B(E) stabilisant f. Si B
est loc connexe, E trivialise X.

On a Hom_B(E,X)=Hom_E(E,E x_B X) = sections du pullback de X à E.

Théorème: Le foncteur Hom_B(E,-) est une équiv de catégorie est les
Aut_X(E)-Ens et les revetements de B trivialisés par E.

Groupe fondamental
------------------

\pi_1(B,b_0) c'est le groupe d'automorphie du foncteur fibre
(ne dépend que de la composante connexe de b_0 si B loc connexe)

Si E/B est un revetement universel, tel que E(b_0) est non vide, alors
\pi_1(B,b_0) est antiisomorphe à Aut_B(E)

Théorème: B connexe, loc connexe et admet un revetement universel.
Alors le foncteur fibre est une équivalence de catégorie avec
\pi_1(B,b_0)-ens

Dico:
- union disjointe topo <=> union disjointe des fibres
- connexe <=> action transitive
- revetements pointés connexes <=> sous groupes
- X/B et X'/B connexes sont isomorphes <=> leur stabilisateurs sont
  conjugués
- X/B connexe, galoisien  <=> stabilisateur distingué

(Passage à la limite:)
Prop: B connexe admettant un revetement simplement connexe, X/B revetement
Alors le pullback \pi_1(X,x_0) -> \pi_1(B,b_0) est injectif, d'image le
stabilisateur de x_0
Donc en particulier, les sous-groupes du dico qui viennent des
stabilisateurs sont les \pi_1(X,x_0). Et X galoisien, alors
Aut_B(X)=\pi_1(B,b_0)/\pi_1(X,x_0)

Th: si B est loc simplement connexe par arc, alors \pi_1(B,b_0) est
isomorphe à l'espace des lacets à homothépie près.

# Théorie de Galois catégorique

Références:
https://ncatlab.org/nlab/show/Galois+theory
https://ncatlab.org/nlab/show/Grothendieck%27s+Galois+theory
Eduardo Dubuc, C. S. de la Vega, On the Galois theory of Grothendieck, Bol. Acad. Nac. Cienc. (Cordoba) 65 (2000) 111–136. arXiv:math.CT/0009145
Marco Antònio Delgado Robalo, Galois theory towards dessins d’enfants, masters thesis, Lisboa 2009, pdf
