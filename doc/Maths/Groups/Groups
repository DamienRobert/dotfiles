vim: ft=markdownlight fdm=expr

Exemples
========
* Z/nZ*

- Z/p^nZ* = Z/p^(n-1)p Z = Z/\phi(p^n)Z pour p > 2
- Z/2^n Z = Z/2Z x Z/2^{n-2}Z
A abélien, G groupe.

* Groupes symétriques

- A_n est simple, et le seul groupe distingué de S_n pour n>=5
- Si H est d'indice n dans S_n, alors H=S_{n-1}
  De plus si n != 4 ou 6, alors il n'y en a que n.
- Aut(S_n)=Int(S_n) sauf si n=6

Actions
=======

G agit sur G/H transitivement.
Le stabilisteur de x est xHx^-1
Récip, si G agit sur X, l'orbite de x est isomorphe à G/Stab(x).

G agit par conjugation sur H. Le stabilisateur est le normalisateur N de H,
ie le nb de conjugués de H = [G:N].

Si G agit sur X, #X=\sum_orbites [G:Stab(a)]
 #G * #Orbites = \sum_g Points fixes de g

Centre
------

- Le centre est un ss-groupe caractéristique.
- Si G/Z(G) est cyclique, G est abélien

Ordre p, Indice p
-----------------

Soit p le plus petit diviseur premier de #G
- Si H est distingué d'ordre p, H est inclus dans Z(G)
- Si H est d'indice p, H est distingué

Pr: 1) On fait agir G par conjugaison sur H, comme Aut(H)=p-1 l'image de G
est triviale
2) On fait agir G sur G/H, on obtient un morphisme de G dans S_p dont le
   noyau est l'intersection des gHg^-1. Mais par hypothèse sur p, ce noyau
   doit contenir H, donc le noyau = H et H est distingué.

Sylow
=====

G a tjrs au moins un p-Sylow, de plus ils sont tous conjugés.
Si #G=p^n m alors le nombre de p-Sylow est congru à 1 mod p et divise m.

Corollaire (Cauchy)
Si p | #G, G contient un élément d'ordre p.

Application: si l'une des conditions suivante est satisfaites
1. p^n ne divise pas (m-1)!
2. p>m
3. aucun des diviseurs de m n'est congru à 1 mod p
Alors G n'est pas simple (pour 2 ou 3, il y a un unique p-sylow, qui est
donc distingué).

Pr: pour 1, si k est le nombre de p-sylow, on a un morphisme de G dans S_k,
mais par hypothèse #G ne divise pas m! donc il ne divise pas k! donc il y a
un noyau.

Application: Si H est distingué et contient un p-Sylow, il les contient
tous.

Cauchy
------
http://en.wikipedia.org/wiki/Cauchy%27s_theorem_%28group_theory%29

[Rem: trivial par Sylow]

Theorem: Let G be a finite group and p be a prime. If p divides the order of G, then G has an element of order p.

- Proof 1

We first prove the special case that where G is abelian, and then the general case; both proofs are by induction on n = |G|, and have as starting case n = p which is trivial because any non-identity element now has order p. Suppose first that G is abelian. Take any non-identity element a, and let H be the cyclic group it generates. If p divides |H|, then a|H|/p is an element of order p. If p does not divide |H|, then it divides the order [G:H] of the quotient group G/H, which therefore contains an element of order p by the inductive hypothesis. That element is a class xH for some x in G, and if m is the order of x in G, then xm = e in G gives (xH)m = eH in G/H, so p divides m; as before xm/p is now an element of order p in G, completing the proof for the abelian case.

In the general case, let Z be the center of G, which is an abelian subgroup. If p divides |Z|, then Z contains an element of order p by the case of abelian groups, and this element works for G as well. So we may assume that p does not divide the order of |Z|; since it does divide |G|, the class equation shows that there is at least one conjugacy class of a non-central element a whose size is not divisible by p. But that size is [G : CG(a)], so p divides the order of the centralizer CG(a) of a in G, which is a proper subgroup because a is not central. This subgroup contains an element of order p by the inductive hypothesis, and we are done.

- Proof 2

This proof uses the fact that for any action of a (cyclic) group of prime order p, the only possible orbit sizes are 1 and p, which is immediate from the orbit stabilizer theorem.

The set that our cyclic group shall act on is the set X = \{\,(x_1,\cdots,x_p) \in G^p : x_1x_2...x_p = e\, \} of p-tuples of elements of G whose product (in order) gives the identity. Such a p-tuple is uniquely determined by all its components except the last one, as the last element must be the inverse of the product of those preceding elements. One also sees that those p − 1 elements can be chosen freely, so X has |G|p−1 elements, which is divisible by p.

Now from the fact that in a group if ab = e then also ba = e, it follows that any cyclic permutation of the components of an element of X again gives an element of X. Therefore one can define an action of the cyclic group Cp of order p on X by cyclic permutations of components, in other words in which a chosen generator of Cp sends (x_1,x_2,\ldots,x_p)\mapsto(x_2,\ldots,x_p,x_1).

As remarked, orbits in X under this action either have size 1 or size p.
The former happens precisely for those tuples (x,x,...,x) for which xp = e.
Counting the elements of X by orbits, and reducing modulo p, one sees that
the number of elements satisfying xp = e is divisible by p. But x = e is
one such element, so there must be at least p − 1 other solutions for x,
and these solutions are elements of order p. This completes the proof.

Extensions
==========

Une extension E est une suite exacte:
0->A->E->G->1

Deux extensions E_1 et E_2 sont congruentes s'il existe un iso de E_1 dans
E_2 qui induit l'idendité sur A et G; elles sont pseudo-congruentes si il
existe un iso de E_1 dans E_2 qui induisent des isos sur A et G (ie que les
deux suites exactes soient isomorphes).

On a une strate des extensions donnée par G->Aut(A).
[Rem: si A n'est pas abélien, une extension induit un morphisme de G dans
Out(A)=Aut(A)/Inner(A)]
L'action de G dans A étant fixée, les extensions à congruence près forment
un groupe isomorphe à H^2(G,A).

Pour savoir si deux cocycles correspondent à deux extensions
pseudo-congruentes, cf
http://mathoverflow.net/questions/161950/group-extensions-isomorphic-as-groups?rq=1
http://groupprops.subwiki.org/wiki/Group_extension_problem#Finding_all_pseudo-congruence_classes_for_a_given_action
1) Aut Ax Aut G agit déjà sur Hom(G,Aut A):
s'il existe un automorphisme alpha:A->A et beta:G->G on va définir
(beta g).(alpha m)=alpha (g.m)
ie il va falloir regarder les extensions pour les actions dans cette orbite
2) Si on se restreint au stabilisateur, le sous-groupe
Aut_0 A x Aut_0 G va agir sur le H^2(G,A), l'orbite denant les extensions
(pour l'action fixée) modulo pseudo-congruence.
[explicitement si f est l'élément de Hom(G,Aut A) que l'on s'est fixé,
Aut_0 A c'est le centralisateur de f, et Aut_0 G ce sont les automorphismes
\beta tels que f(\beta(g))=\beta(g))].
-> En particulier pour l'action triviale, le H^2 est partitionné sous Aut AxAut G.

Contre-Exemples
---------------

1)
Il existe des groupes abéliens qui forment deux extensions non pseudo-congruentes
http://mathoverflow.net/questions/35649/extensions-isomorphic-as-groups-but-not-congruent-or-pseudo-congruent/35662#35662
http://groupprops.subwiki.org/wiki/Series-equivalent_not_implies_automorphic_in_finite_abelian_group

Autrement dit il peut exister deux sous groupes isomorphes A_1 et A_2 d'un
groupe abélien E, tel qu'il n'existe aucun automorphisme de E envoyant A_1
sur A_2

2)
Il existe des extensions non triviales qui sont isomorphes en tant que
groupe à une extension triviale:
http://math.stackexchange.com/questions/131881/group-extensions/131895#131895
cf aussi: le thread ens.forum.sciences.maths.avancees:2882
(Attention: dans l'exemple les deux extensions formées correspondent à des
actions différentes de G dans A; est-ce qu'on peut trouver un exemple où on
prend la même action, et construire deux extensions E_1 et E_2, avec E_1
scindée et pas E_2, mais E_1 isomorphe en tant que groupe à E_2?)

3)
http://mathoverflow.net/questions/42174/can-a-module-be-an-extension-in-two-real
ly-different-ways/42309#42309

Si A et G sont abéliens de type fini et que l'action est triviale (i.e., E
est abélien), alors si E est isomorphe à AxG alors l'extension est scindée.
Ceci marche sur les modules de type fini sur un anneau commutatif noethérien
cf: http://projecteuclid.org/euclid.kjm/1250524308

Autrement dit ça répond négativement à la question posée dans 2) dans le
cas abélien (fini)

4) Il faut donc chercher un exemple non commutatif: cf sciences.maths.avancees:2887
Où on voit Z/2ZxD_8 comme une extension non split de D_8 par Z/2Z.

Concernant les lifts
--------------------

http://mathoverflow.net/questions/130770/can-group-cohomology-be-interpreted-as-an-obstruction-to-lifts?rq=1

In your setup, the extension C→B→B/C
represents a cohomology class u∈H^2(B/C;C). The homomorphism ϕ:A→B/C admits a lift ϕ¯:A→B if and only if ϕ∗(u)∈H^2(A;C) is zero.

To see this, note that the induced map on second cohomology is given by pullback of extensions, so ϕ∗(u) is represented by the bottom row in the diagram
C→B→B/C
∥ ↑ ↑
C→E→A
Now splittings of the bottom row correspond to liftings of ϕ.

Cas non abélien
---------------

http://mathoverflow.net/questions/129414/extensions-with-trivial-induced-outer-action?rq=1
Let E be a group extension such that the induced outer action ψ:G→Out(N) is trivial (ie E=N C_E(N))

Work of Eilenberg and Mac Lane (as summarized in Brown's book "Cohomology of Groups", Section IV.6) shows that extensions as above are classified by H2(G;C), where C denotes the centre of N regarded as a trivial G-module, and therefore by central extensions of the form
C↪A↠G.

Transfert
=========

Le transfert est une application de G dans H/D(H) pour H sous-groupe de G.

## Th de Burnside

Si P est un p-Sylow contenu dans le centre de son normalisateur, P possède
un p-complément, ie G= N \prod P (N distingué dans G).

Burnside (1911, Theorem II, section 243) showed that if a Sylow p-subgroup of a group G is in the center of its normalizer then G has a normal p-complement. This implies that if p is the smallest prime dividing the order of a group G and the Sylow p-subgroup is cyclic, then G has a normal p-complement.

## Th de Frobenius (étend Burnside):

http://en.wikipedia.org/wiki/Normal_p-complement
http://groupprops.subwiki.org/wiki/Frobenius%27_normal_p-complement_theorem
cf aussi Fusion_p_Complement

Th: <=>
(i) G has a normal p-complement
(ii) The normalizer of every non-trivial p-subgroup has a normal p-complement
(iii) For every p-subgroup Q, the group NG(Q)/CG(Q) is a p-group.
(iv) G has a p-Sylow subgroup P that is conjugacy-closed in G: any two elements of P that are conjugate in G are conjugate in P.


Frattini
========
* http://en.wikipedia.org/wiki/Frattini_subgroup

The Frattini subgroup Φ(G) of a group G is the intersection of all maximal subgroups of G.

- Φ(G) is equal to the set of all non-generators or non-generating elements of
G. A non-generating element of G is an element that can always be removed from
a generating set; that is, an element a of G such that whenever X is a
generating set of G containing a, X − {a} is also a generating set of G.
- Φ(G) is always a characteristic subgroup of G; in particular, it is always a
normal subgroup of G.
- If G is finite, then Φ(G) is nilpotent.
- If G is a finite p-group, then Φ(G) = G^p [G,G]. Thus the Frattini subgroup is
the smallest (with respect to inclusion) normal subgroup N such that the
quotient group G/N is an elementary abelian group, i.e., isomorphic to a direct
sum of cyclic groups of order p. Moreover, if the quotient group G/Φ(G) (also
called the Frattini quotient of G) has order p^k, then k is the smallest number
of generators for G (that is the smallest cardinality of a generating set for
G). In particular a finite p-group is cyclic if and only if its Frattini
quotient is cyclic (of order p). A finite p-group is elementary abelian if and
only if its Frattini subgroup is the trivial group, Φ(G) = e.
- If H and K are finite, then Φ(HxK) = Φ(H)x Φ(K).

Proofs: http://crazyproject.wordpress.com/tag/frattini-subgroup/

* http://en.wikipedia.org/wiki/Frattini%27s_argument

Frattini's Argument. If G is a finite group with normal subgroup H, and if P is
a Sylow p-subgroup of H, then G = N_G(P)H, where N_G(P) denotes the normalizer of P in G.

- Frattini's argument can be used as part of a proof that any finite nilpotent group is a direct product of its Sylow subgroups.
- By applying Frattini's argument to NG(NG(P)), it can be shown that NG(NG(P)) = NG(P) whenever G is a finite group and P is a Sylow p-subgroup of G.
- More generally, if a subgroup M ≤ G contains NG(P) for some Sylow p-subgroup P of G, then M is self-normalizing, i.e. M = NG(M).
Proof: M is normal in H := NG(M), and P is a Sylow p-subgroup of M, so the Frattini argument applied to the group H with normal subgroup M and Sylow p-subgroup P gives NH(P)M = H. Since NH(P) ≤ NG(P) ≤ M, one has the chain of inclusions M ≤ H = NH(P)M ≤ M M = M, so M = H.

Fusion: et p-complément
=======================
cf http://for.mat.bham.ac.uk/P.J.Flavell/fusion.pdf

O^p et O_p'
-----------

Déf: O_p'(G) and O^p(G)
O_p'(G) est le plus grand sous-groupe normal de G de card premier à p
O^p(G) est le plus petit sous-groupe normal de G / G/O^p soit un p-groupe.
On a O_p'(G) <= O^p(G)

Th: <=>
- G a un p-complément normal
- O^p(G)=O_p'(G)
- Le produit de deux p'-éléments est un p'-élément
- Tout p'-élément est dans O_p'(G)
- L'intersection de O^p(G) avec un Sylow est l'indentité.
Dans ce cas le complément normal est donné par O^p(G)=O_p'(G)

Rem: Si G a un p-complément normal, alors les ss-groupes et les quotients
aussi.

Rem:
- O_p' et O^p sont caractéristiques
- O_p' est engendré par les q-Sylows, q \ne p, ou encore par les
  p'-éléments, ou encore par les <g^p^m, g \in G> où |G|=p^m alpha
- O^p(O^p(G))=O^p(G), O_p'(G/O_p'(G))=1
- G' O^p(G) est le plus petit sous-groupe normal dont le quotient est un
  p-groupe abélien
- Si P est un p-Sylow, G=P O^p(G)

Fusion
------

Déf: H controle la fusion dans P par rapport à G ssi deux éléments de P
conjugués dans G le sont déjà dans H.

Ex: si P p-Sylow abélien, alors N_G(P) contrôle la fusion de P.

Rem (Lemme 5.5): N_G(P) contrôle la fusion de P ssi pour tout x \in P,
C_G(x) agit transitivement sur les p-Sylows contenant x.

Th 5.7: Si N_H(P) controle la fusion de P pour tout p-groupe local H de G,
P p-sylow de H, alors N_G(P) contrôle la fusion de P où P p-Sylow de G.

(Rappel: un groupe local est le normalisateur ou le centralisateur d'un
p-groupe)

Th (fusion, 4.10): Si P<=H est un p-groupe de Sylow de G dont H contrôle la
fusion; alors G/G'O^p(G) = H/H'O^p(H)
(Si H ne contrôle pas la fusion alors on a juste un épimorphisme
G/G'O^p(G) <<- H/H'O^p(H))

Examples
- (exo 14): si P \inter P^g \ne 1 => P=P^g, alors
N_G(P) contrôle la fusion de P par rapport à G.
Si de plus N_G(P)=P (ie P \inter P^g est toujours d'intersection nulle si g
\not \in P), alors P controle la fusion de P donc G a un p-complément.
C'est la version du th de Frobenius prouvé dans Serre.
- (exo 19): Si W est faiblement clos dans P (ie le seul conjugué de W
  inclus dans P est W), et W est dans le centre de P, alors
  N_G(W) controle la fusion de P.
  On retrouve le cas P abélien mentionné plus haut.

Burnside
--------

Th de Burnside:
Si P est dans le centre de son normalisateur, G a un p-complément.

Cor: Si p est le plus petit facteur premier de |G| et P un p-Sylow est
cyclique, alors G a un p-complément

Pr: N_G(P)/C_G(P) s'injecte dans Aut(P); comme P est abélien P contient
C_G(P) donc N_G(P)/C_G(P) est un p'-groupe. Si P est cyclique, Aut P est de
card p^(m-1) (p-1) donc N_G(P)/C_G(P) a un ordre divisant p-1, donc est
trivial par hypothèse sur p, donc on peut appliquer Burnside.

Frobenius
---------

Th 5.1 (Cas abélien)
Let P ∈ Sylp (G) and suppose that P is abelian. Set N = N_G(P). Then the following hold:
(a) N controls fusion in P with respect to G.
(b) G/G' O^p(G) = N/N' O^p(N), that is, N controls abelian p-factor groups.
(c) G has a normal p-complement if and only if N has a normal p-complement.
That is, N controls normal p-complements in G.

Pr: On a vu (a) et on sait que (a)=>(b). Pour (c) on vérifie que si N a un
p-complément normal, P est dans le centre de N et donc on peut appliquer
Burnside.

Th 5.10 Frobenius’ Normal p-Complement Theorem Let P ∈ Sylp (G). The
following are equivalent.
(a) G has a normal p-complement.
(b) Every p-local subgroup of G has a normal p-complement.
(c) P controls fusion in P with respect to G. In other words, any two elements
of P that are conjugate in G are already conjugate in P .
(d) Pour tout p-groupe Q non-trivial, N_G(Q)/C_G(Q) est un p-groupe.

Groupes nilpotents
==================

cf forum.sciences.maths: 12015 <dbj8gs$86p$4@clipper.ens.fr>
http://en.wikipedia.org/wiki/Nilpotent_group

Un groupe est nilpotent si il a une série centrale

    \{1\} = A_0 \triangleleft A_1 \triangleleft \dots \triangleleft A_n = G
with [G, A_{i + 1}] ≤ A_i ie A_i is in the center of G/A_{i+1}

Dans ce cas la série centrale supérieure
    G = G1 ⊵ G2 ⊵ ⋯ ⊵ Gn ⊵ ⋯, G_{n + 1} = [Gn, G]
a la même longueur que la série centrale inférieure
    1 = Z_0 \triangleleft Z_1 \triangleleft \cdots \triangleleft Z_i \triangleleft \cdots,
with Z_{i+1} = \{x\in G \mid \forall y\in G:[x,y] \in Z_i \}

Th:
- Un p-groupe est nilpotent
- Un groupe nilpotent ssi il est le produit (direct) de ses groupes de Sylow
- Un groupe est nilpotent ssi tous ses p-Sylow sont distingués

Pr: 1) par récurrence triviale sachant que le centre d'un p-groupe est non
trivial 3) Si les p-Sylow sont distingués il est facile de voir que leur
produit est isomorphe au produit direct, et par cardinalité le groupe tout
entier est donc isomorphe au produit direct de ses p-Sylow, donc est
nilpotent 2) Il reste à montrer que nilpotent => les p-Sylow sont
distingués, mais
- si G est nilpotent, il existe une chaine S < S_1 < ... G (cf (2) plus
  bas, les normalisateurs grossissent).
  Mais comme S est distingué dans S_1, il est caractéristique, donc la
  conjugaison par g \in S_2 stabilise S, donc S est distingué dans S_2, ...
  S est distingué dans G.

Autre preuve qu'un p-Sylow est normal dans un groupe nilpotent:
http://math.stackexchange.com/questions/24220/show-that-if-g-is-a-finite-nilpotent-group-then-every-sylow-subgroup-is-norma
1) Le normalisateur N_G(S) d'un p-Sylow est toujours autonormal:
   N_G(N_G(S))=N_G(S)
Pr: S est normal dans N_G(S), si g normalise N_G(S) alors gSg^-1 est dans
N_G(S) dans est équal à S, donc g \in N_G(S)
2) Dans un groupe Nilpotent, N_G(H) est toujours plus gros que H (sauf si
   H=G).
Pr: soit Z(G) n'est pas inclus dans H, donc N_G(H) est plus gros que H,
soit Z(G) est inclus dans H et on peut quotienter par Z(G) et raisonner par
récurrence.

Caractérisation des groupes nilpotents
--------------------------------------

http://groupprops.subwiki.org/wiki/Finite_nilpotent_group
A finite group is termed a finite nilpotent group if it satisfies the following equivalent conditions:
  - It is a nilpotent group
  - It satisfies the normalizer condition i.e. it has no proper self-normalizing subgroup
  - Every maximal subgroup is normal
  - All its Sylow subgroups are normal
  - It is the direct product of its Sylow subgroups
  - It is a p-nilpotent group for every prime number p (it suffices to check this condition only for those primes that divide the order). p-nilpotent means that there exists a normal p-complement.
  - It has a normal subgroup for every possible order dividing the group order
  - Every normal subgroup of the group contains a normal subgroup of the group for every order dividing the order of the normal subgroup.

Rem: - un sous-groupe ou un quotient d'un groupe nilpotent est nilpotent

Caractérisation des groupes résolubles
--------------------------------------

http://groupprops.subwiki.org/wiki/Finite_solvable_group
A finite group is termed a finite solvable group if it satisfies the following equivalent conditions:

  - It is a solvable group
  - It is a polycyclic group
  - It has Sylow complements for all prime divisors of the order of the group
  - It has Hall subgroups of all possible orders
  - All its composition factors (i.e., the quotient groups for any composition series for the group) are cyclic groups of prime order. Equivalently, all its composition factors are abelian.
  - All its chief factors (i.e., the successive quotient groups for any chief series for the group) are elementary abelian groups.

Rem: - un sous-groupe ou un quotient d'un groupe résoluble est résoluble
     - une extension de groupes résoluble est résoluble

Rem: un groupe de Hall c'est comme Sylow mais pour une union de nombre
premiers, ie |G|=k n/k avec k et n/k premiers entre eux.
Th: Si G admet un p-complément pour tout p alors G est résoluble alors G
admet des groupes de Hall et ils sont conjugués.

Caractérisation des n tels que tout groupe d'ordre n soit cyclique
------------------------------------------------------------------

Ce sont les n tels que n est premier à \phi(n), ie n=\prod p_i, p_i
distincts et ne divisant pas p_j-1.

Caractérisation des n tels que tout groupe d'ordre n soit abélien
------------------------------------------------------------------

Ce sont les n tels que n=\prod p_i^e_i avec
- e_i <= 2
- p_i ne divise pas p_j-1
- p_i ne divise pas p_j+1 si e_j=2

Pr: par récurrence.
Soit Sp un p-sylow de G et Np son normalisateur.
Alors soit Np = G et Sp est distingué dans G, soit Np != G donc Np est
abélien et le théorème de Burnside en question s'applique (Sp est dans le
centre de Np donc a un p-complément).
On a donc une extension 1->A->G->B->1, avec A et B abéliens d'ordre
premers entre eux.

Or Aut(A)=\prod \Aut(Z/p_i^e_i Z) et
Aut(Z/pZ) est de cardinal p-1, Aut(Z/p^2Z) de cardinal p(p-1) et Aut(Z/pZ^2) de card p(p-1)^2(p+1). Donc par hypothèse sur les p_i, l'action par conjugaison de B sur A est triviale,

- Par Schur-Zassenhaus G est une extension triviale, donc un produit semi-direct, donc un produit direct, donc G=AxB est abélien.
- Ou alors comme B agit trivialement sur A et que A est abélien, A est dans
  le centre de G. Donc G est nilpotent, donc produit des p-groupes, donc
  abélien (car un p-groupe d'ordre p^2 est abélien).
- Ou alors pour éviter Schur-Zassenhaus, dans le cas où Sp est dans le
  centre de Np, un relévement de 1->H->G->Sp->1 (où H est le p-complément) est donné par Sp donc G=H.Sp, donc G=HxSp comme précédemment.
  Sinon on peut supposer que tous les p-Sylow sont distingués. Mais alors G
  est le produit de ses Sylow (car l'intersection deux à deux est triviale),
  donc est abélien.

(Rem: pour le nombre de groupes abéliens d'ordre n, cf
https://oeis.org/wiki/Number_of_groups_of_order_n
https://oeis.org/wiki/Number_of_partitions)

Groupes d'ordre n, n sans facteur carré
---------------------------------------
(cf forum.maths:11632, <d6vqls$18a$1@clipper.ens.fr>)

Lemme: un tel groupe est résoluble.
  Pr: En effet, sinon il en existerait un qui est simple non abélien. Soit p
son plus petit facteur premier. Alors, si P est un p-Sylow de G, alors P
est dans le centre de son normalisateur (car un groupe distingué de
cardinal p est central) , et ainsi, par le théorème de Burnside mentionné
ci-dessus, P est un quotient non trivial de G, contradiction.

Maintenant, soit G un groupe sans facteur carré. Soit N son "radical
nilpotent" (dit aussi sous-groupe de Fitting): c'est le plus gros
sous-groupe distingué nilpotent de G.
Alors, N étant nilpotent, il est produit direct de ses Sylows, et donc est
cyclique.
Prouvons que G/N est aussi cyclique, si bien que G est
extension de deux groupes cycliques (on dit que G est "métacyclique").
  Pr: L'action par conjugaison induit une action de G/N sur N. Soit M son noyau.
  supposons par l'absurde M non trivial. Soit W le dernier terme non trivial
  de la série dérivée de M. Alors l'image réciproque de W dans G est
  nilpotent, contredisant la maximalité de N.
  Donc N est égal à son propre centralisateur, i.e. l'action de G/N sur N
  est fidèle. Par ailleurs, comme N est cyclique Aut(N)
  est abélien. On en déduit que G/N, qui se plonge dans Aut(N), est abélien,
  donc cyclique.
Par Schur-Zassenhaus G est un produit semi-direct.
Remarque: dans le cas où on suppose que n est premier à phi(n), on
obtient directement que l'action de G/N sur N est triviale, et donc que
G=N est bien cyclique.

Caractérisation des n tels que tout groupe d'ordre n soit nilpotent
-------------------------------------------------------------------

Cf clipper/Scolarite/Admin-Ens, par Gaetan Chenevier.

### Cas abélien

Lemme: Un groupe non-abélien minimal est non simple

Si H est un sous-groupe maximal, l'intersection avec ses conjugués est
triviale, et soit on magouille en comptant le nombre d'éléments, soit on
invoque un théorème de Frobenius qui dit que G est un produit
semi-direct.

  Cf: https://groups.google.com/forum/#!search/Gaetan$20Chevenier/fr.sci.maths/2ex0S0cx1KI/V8kTTgKZ1AkJ
  > G est un groupe fini de cardinal n, tel que n et phi(n) (où phi est la
  > fonction indicatrice d'Euler) sont premiers entre eux, montrer que G est
  > abélien.
  On remplace abélien par cyclique, par ce que ca ne coute rien (par exemple
  prendre un element d'ordre p pour tout p divisant n, le produit de ces
  elements engendre G).

  Une facon de voir le probleme  est d'utiliser un raisonnement par récurrence,
  un point crucial etant que voir que G n'est pas un groupe simple, on peut
  alors utiliser (par exemple) le lemme élémentaire suivant:

  Lemme: Si G un groupe fini dont tous les sous-groupes stricts sont abeliens,
  alors G n'est pas simple.

  Modulo ce lemme, voila une preuve. On raisonne par récurrence sur cardinal
  G. Si H est un sous-groupe de G, |H| est premier avec phi(|H|), donc
  l'hypothese de rec s'applique. En particulier, si H est, par le lemme, un
  sous-groupe distingue strict, H est cyclique. Mais alors la conjugaison
  induit un morphisme de G dans Aut(H), et |Aut(H)|=phi(|H|) qui est premier
  avec |G|. Ce morphisme est donc trivial et H est dans le centre de G, non
  trivial. L'hypothese de récurrence s'applique a G/H, qui est donc cyclique,
  et donc G est abelien (car H est central), et donc cyclique.

  La preuve du lemme: Supposons G simple. Soit A et B deux sous-groupes
  maximaux stricts différents de G, l'intersection H de A et B est normalisee
  par A et B, donc par AB=G, par simplicite H=1: deux sous-groupes maximaux de
  G sont egaux ou d'intersection triviale. On conclut de la maniere suivante:
  soit M un sous-groupe maximal de G, son normalisateur dans G est M par
  simplicité de G. Le nombre de conjugues distincts de M est alors egal a
  l'indice de M dans G, par le debut ces conjugues sont d'intersection
  triviale.  On pose n=|G|, m=|M|. La réunion de ces conjugues est donc de
  cardinal n/m(m-1) +1 = n+1-n/m  < n. On peut donc trouver un autre
  sous-groupe maximal M' non dans la réunion des conjugues de M, de cardinal
  M', mais toujours par le debut il ne peut intersecter que trivialement la
  reunion des conjugues de M. D'ou encore n/m'(m'-1) elements, et G a donc au
  moins (n+1-n/m)+(n-n/m')=n(2-1/m-1/m')+1. Notons que 1/m <= 1/2, idem pour
  m' et donc on obtient au moins n+1 elements ce qui est absurde. Ouf!

  Le lemme est en fait plus general, il permet de montrer que si G est un
  groupe dont tous les sous-groupes stricts sont nilpotents, alors G n'est
   pas simple. (exercice!). Ce lemme permet aussi de caractériser tous les
  entiers n tels que tout groupe d'ordre n est abélien, et meme mieux tous les
  entiers n tels que tout groupe d'ordre n est nilpotent (plus dur).

Remarque: fin de la preuve pour le cas abélien, par des moyens élémentaires
(pas de Schur Zaschenhaus...)
On sait donc qu'il y a un sous-groupe distingué non trivial H dans G, on a
la suite exacte 1-H-G-G/H-1 où l'action de G/H sur H est triviale (vu la
forme de n), donc H est dans le centre de G. Soit Z le centre, si G/Z est
cyclique, G est abélien. Sinon, le seul cas possible vu n c'est que G/Z
contienne (Z/pZ)^2, mais dans ce cas p est inversible dans Z.
Soit x_0 un élément d'ordre p de G/Z, x un relevé quelconque; on a donc x^p=a
\in Z. Soit y=gxg^-1 (g \in G), on a y=x*b, b \in \Z. On constate que
y^p=x^p b^p=g a g^-1=a=a b^p. En passant en notation additive: a=a+p*b, ie
pb=0, ie b=0 par ce qui précède, ie x est dans le centre de G,
contradiction.
Où de manière plus simple dans notre cas: si G/Z n'est pas cyclique d'ordre
premier, comme il est abélien il a un sous-groupe strict distingué, et sa
préimage est distinguée, et vu n elle est centrale, contradiction.

Remarque: ce que montre la première version de la preuve est la chose
suivante:
Prop: soit Z le centre de G, et Y le centre de G/Z. Alors les premiers
divisant #Y sont inclus dans ceux divisant #Z.
Pr: la preuve précédente marche (prendre un élément d'ordre p de Y et
considérer sa préimage. Preuve plus conceptuelle: soit Y_0 un facteur
d'ordre premier à Z de Y, par les considérations sur la cohomologie
(H^2(Y_0,Z)=0), Y_0 a une section, donc la préimage de Y_0=Z*Y_0 est
abélienne. Pour montrer que la préimage est carrément dans le centre de G,
on doit pouvoir considérer le H^1(G/Z,Z) [pas sûr].

### Cas nilpotent

Tout groupe d'ordre n=p_1^n_1...p_r^n_r est nilpotent ssi pout tout i,j
distincts, p_i ne divise pas p_j^q-1 pour tout q <= n_j.
(autrement dit ssi p_i ne divise pas les #GL_{n_j)(F_p_j), j<>i)

Preuve: Si p et q sont premiers distincts, un produit semi-direct non trivial
d'un p-groupe par un q-groupe est non nilpotent, donc la condition est
necessaire. Montrons par recurrence sur n=|G| qu'elle suffit, en admettant
pour l'instant le

Lemme: un groupe non nilpotent minimal est non simple.

Soit donc H distingue strict dans G, p un diviseur premier de |H|. Comme H est
nilpotent par recurrence, son p-Sylow est distingue dans G
[cf plus haut: Sp < H < G => Sp <G car un Sylow distingué est
caractéristique], et on peut
supposer que H est un p-groupe, puis un p-Sylow de G quitte a le remplacer par
l'image reciproque du p-Sylow de G/H. Soit maintenant Z le centre de H, G/H
agit par automorphismes sur Aut(Z), mais ils sont d'ordres
premiers entre eux, l'action est triviale et Z est dans le centre de G, on a
gagne (je sens qu'on pourrait faire plus court, mais bon c'est ce qui me vient
a l'esprit).

Reste a prouver le lemme. Supposons G simple. Soient A et B des sous-groupes
maximaux stricts et distincts de G, par le meme argument que dans le cas que
j'avais donne sur le web si je me souviens bien, il suffit de voir que si C
est l'intersection de A et B, alors C=1. Supposons que ca ne soit pas le cas.
Choississons tout d'abord A et B comme plus haut de sorte que |C|>0 est
maximal. Comme C n'est pas distingue dans G, son normalisateur (dans G) est
inclus dans un sous-groupe maximal strict M de G. Notons que A etant
nilpotent, M inter A (i.e. le normalisateur de C dans A) contient strictement
C. Idem pour M inter B. Comme A est different de B, M est different de A ou
different de B, et on a une contradiction par maximalite de C.

p-groupes
=========

Si G p-groupe agit sur X, alors #X=#X^G mod p (points fixes)

Corollaire
- Z(G) est non trivial.
- G est nilpotent
- G contient un p-groupe distingué d'ordre p^m pour tout p^m | #G

* Un groupe d'ordre p est isomorphe à Z/pZ.
* Un groupe d'ordre p^2 est abélien

Pr: le centre est non trivial, et si G/Z est non trivial alors G/Z est
cyclique car d'ordre p. Mais une extension centrale d'un groupe cyclique
est abélienne, donc G est abélien.

Groupes d'ordre p^3
-------------------

On a 3 groupes abéliens et 2 groupes non abéliens.

Cf www.math.uconn.edu/~kconrad/blurbs/grouptheory/groupsp3.pdf

Lemma 1. Let p be prime and G be a nonabelian group of order p^3 with
center Z. Then #Z = p, G/Z = Z/pZ × Z/pZ, and [G, G] = Z.

Proof. Since G has p-power size, its center is nontrivial. That means #Z =
p, p^2 , or p^3 . Since G is nonabelian, #Z \ne p^3. For any group G, if
G/Z is cyclic then G is abelian. So our G has G/Z noncyclic, which means
 #(G/Z) = p, so #Z \ne p^2 . The only choice left is #Z = p. The group G/Z
therefore has size p^2 . Up to isomorphism the only groups of order p^2 are
Z/(p^2) and Z/(p) × Z/(p). Since G/Z is noncyclic, G/Z = Z/(p) × Z/(p).
Since G/Z is abelian, [G, G] ⊂ Z, so [G, G] = Z because [G, G] is
nontrivial (G is not abelian) and #Z = p.

- Cas p=2
On a G = D_4 (le groupe dihédral) ou H_8 (les quaternions)

- Cas p impair
On a G=matrices triangulaires sup de M_3(F_p) avec des 1 sur la diagonale
(ie G=(Cp×Cp) ⋊ Cp)
ou G=(1+pm, b; 0, 1) dans M_2(F_p) où m, b \in Z/p^2Z.
(ie G= (Cp^2) ⋊ Cp)
[Rem: si p=2 ces groupes sont isomorphes]

Détails
-------
http://www.weddslist.com/groups/misc/pcubed.html

For every prime p, there are five non-isomorphic groups of order p^3. Three
are Abelian, these are Cp^3, Cp^2×Cp, and Cp×Cp×Cp. Two are non-Abelian. The
rest of this page is about the non-Abelian groups.

### Non-Abelian Groups of order p^3

For any prime p, we can imagine three non-Abelian groups of order p^3:

    (Cp×Cp) ⋊ Cp ; (Cp^2) ⋊ Cp ; Cp ↑ (Cp×Cp)

However, for all values of p, there turn out to be only two. Which two depends on whether p is even or odd.

### Non-Abelian Groups of order p^3, p an even prime; i.e. of order 8

For p=2, the two groups (C2×C2)⋊C2 and C4⋊C2 are isomorphic. This is the group usually known as D8 (or by some authors as D4). It can be presented as either
    < a, b | a^4, b^2, abab >
or as
    < a, b, t | a^2, b^2, t^2, atb^3t, bta^3t >
It has five elements of order 2, falling into two equivalence classes of sizes one and four, and two elements of order four.

However C2 ↑ (C2×C2) is another group of order eight, with no analogue for higher values of p. This is the quaternion group. It can be presented as
    < i, j | i^4, j^4, iji^3j, i^2j^2 >
It has one elements of order 2, and six elements of order four forming a single equivalence class.

### Non-Abelian Groups of order p^3, p an odd prime

For every odd prime p, (Cp×Cp) ⋊ Cp is a group which can be presented as
    < a, b | ap2, bp, babp-1ap2-p-1 >
It has p^2-1 elements of order p, which fall into two equivalence classes, of sizes p-1 and p^2-p; and p^3-p^2 elements of order p^2, forming a single equivalence class.

For every odd prime p, there is also a group (Cp^2) ⋊ Cp. It has p^3-1 elements of order p, which fall into three equivalence classes, of sizes p-1, p^2-p, and p^3-p^2. Cp ↑ (Cp×Cp) can be interpreted in various ways, but each of them is isomorphic to one of (Cp×Cp) ⋊ Cp, (Cp^2) ⋊ Cp, or Cp2 × Cp.

### Summary
p       Cp^2 ⋊ Cp        (Cp×Cp) ⋊ Cp    [Cp ↑ (Cp×Cp)]
2       C4⋊C2  ≅  D8  ≅  (C2×C2)⋊C2     Q8

Serre, Groupe Finis
===================

Théorème 1.2 (Jordan-Holder): le gradué (lié à une filtration maximale)
d'un groupe ne dépend pas de la filtration (à permutation près)

Sylows
------

- Si H subset G, il existe un sylow S de G tel que S \inter H soit Sylow de
  H.
- Si de plus H est distingué, alors
  - Pour tout Sylow S, S\inter H est un sylow de H
  - Les sylow de G/H sont l'image des Sylows de G
  - (Frattini) Si Q est un Sylow de H, alors H.N_G(Q)=G
    => Si H contient N_G(S) alors N_G(H)=H
    => N_G(N_G(S))=N_G(S)

Fusion
------

Si X et Y sont dans le centre de S et sont conjugués par g, alors il existe
n \in N_G(S) tels que nxn^-1=g x g^-1, en particulier X et Y sont conjugués
par n.

Th 2.14 (Alperin): x et y \in S sont conjugués dans G <=> x et y sont
équivalents pour la relation "localement conjugués"

Résolubilité
------------

(i) H contient D(G) <=> H est normal et G/H abélien

Prop: <=>
(i) G résoluble de classe n
(ii) \exist A abélien normal tel que G/A soit résoluble de classe n-1
(iii) \exist une suite G=G_0 \supset ... G_n={1} avec G_i normal et
G_i/G_{i+1} abélien
(iv) comme (iii) mais on suppose seulement G_{i+1} normal dans G_i

Suite centrale descendante:
[C^i(G), C^j(G)] \subset C^{i+j}(G)
On a D^n(G) \subset C^2^n(G), ie nilpotent => résoluble

Prop: G est nilpotent de classe <=n+1 ssi G est une extension centrale d'un
groupe nilpotent de classe <=n

Cor: si G est nilpotent, N_G(H) > H si H < G.

Th 3.10: Kolchin
Si G \subset GL(V) est nilpotent, il existe un drapeau complet tel que G
soit inclus dans les matrices triangulaires avec des 1 sur la diagonale.
(Rem les matrices triangulaires sont résolubles, celles avec les 1 sur la
diagonale nilpotente)

Th 3.14: <=>
(i) G nilpotent
(ii) G est produit de p-groupes
(iii) Pour tout p, G a un unique p-Sylow

Cor 3.12: si G est un p-groupe d'ordre p^n
- H d'ordre p^{n-1} est normal
- On a une filtration où les indices sont p
- Si H < G, H est contenu dans un groupe d'ordre p^{n-1}

Frattini
--------

Déf: \phi(G)=\intersection ss-groupes maximaux de G

S engendre G ssi S engdre G/\phi(G)

Th 3.18,3.19
\phi(G) est nilpotent; si G est un p-groupe c'est [G,G].G^p

Application:
G est commutatif/nilpotent/résoluble ssi tout ss-gp engendré par x,y \in G
l'est.

Cohomologie
-----------

Th 4.3: Les extensions de G par A sont en bijection avec H^2(G,A). (A abélien)

Th 4.1: Les classes de conjugaison (par A ou G) des sections de E qui sont
des homomorphismes est un torseur sous l'action de H^1(G,A)

Th 4.6: Si |G|=m, et x \in H^n(G,A) (n>0) alors m.x=0
En particulier, si m est un automorphisme de A, H^n(G,A)=0 pour n>0

Cor 4.9: si G et A sont d'ordres premiers entre eux:
- Toute extension E de G par A est triviale
- Deux sections-homomorphismes de G sont conjugués par un élément de A

Th 4.10 (Zashenhaus)
1->A->E->G->1 (A non supposé abélien), A et G d'ordres premiers entre eux
(i) G a une section dans E, ie E est le produit semi-direct de A et G
(ii) Si A ou G est résoluble, les sections sont conjugués par un élément de
E (ou même de A)

Th 4.12 (relêvement d'homomorphisme)
1->A->E->G_1->1, et G_2 -> G_1 un morphisme, si G_2 et A sont d'ordre
premiers alors G_2->G_1 se relève en G_2->A
Si de plus A ou G_2 résoluble les relevés sont conjugués par un élément de A.

Application: si on a une représentation de G dans GL(Z/pZ), alors elle se
relève à GL(Z_p)

Groupes de Hall
---------------

Th 5.1 (Hall)
G a des groupes de Hall <=> G est résoluble
Dans ce cas tout \Pi sous-groupe est contenu dans un groupe de Hall (en
particulier les groupes de Hall sont conjugués)

Cor (Burnside): un groupe d'ordre p^a q^b est résoluble.

Sous-groupes permutables
------------------------

Lemme 5.5: A.B=B.A <=> AB est un sous-groupe de G.
(Rem si A est distingué c'est toujours le cas, AB c'est la préimage de
l'image de B dans G/A)

Lemme 5.7: <=>
(i) A.B=G
(i') B.A=G
(ii) G opère transitivement sur G/AxG/B
(iii) [G fini] (G:A \inter B)=(G:A)(G:B)
(iii') [G fini] (G:A \inter B)>=(G:A)(G:B)
Rem: (G:A) et (G:B) sont premiers entre eux => A.B=G

Groupes de Frobenius
--------------------

Th 6.1 (Jordan) H<G
On a |union des conjugués de H| <= |G|-(|G|/|H|-1)

Cor: - si H rencontre toutes les classes de conjugaison, H=G
     - si G opère transitivement sur X (|X|>1) alors il existe g sans
       points fixes

Déf: H est de Frobenius si l'inégalité du th 6.1 est une égalité, ie ssi H
et ses conjugués sont d'intersection triviales.

Th 6.3: Si H est de Frobenius, il existe N normal complémentaire de H, ie
G=N.H (N est l'ensemble des éléments non conjugués à H)

Th 6.7: N est nilpotent

Transfert
---------
H <= G.

Ver: G^ab -> H^ab est un morphisme

Cor 7.3: si phi: H^ab -> A est un morphisme stable par conjugaison dans G, alors
\phi(Ver(h))=\phi(h)^n où n=(G:H)

Th 7.7: S p-Sylow de G, \phi: S -> A p groupe abélien
\phi se prolonge sur G ssi \phi est stable par conjugaison dans G, et dans
ce cas le prolongement est donné par \phi(Ver(g))^{1/n}

Th 7.8: si S p-Sylow abélien, l'image de Ver est l'ensemble des éléments de
S dans le centre de N_G(S)

Th 7.9: Soit S un p-Sylow abélien non trivial, et supposons que G n'est pas
de quotients cyclique d'ordre p. Soit N=N_G(S)
(i) Le groupe des éléments de S fixés par N (ie dans le centre de N) est trivial
(ii) Si r est le rang de S (nb min de générateurs), il existe un nombre
premier l (\ne p) divisant (N:S) et \prod_{i=1}^{r} (p^i-1)
(Rem: si S_p={x \in S/ x^p=1}, alors S_p est un F_p ev de dim r)

Caractères
----------

V ev-complexe, \rho: G -> GL(V)

Déf: \chi c'est la trace de la représentation \rho

Prop: - \chi est centrale
      - \chi_V*(s)=\chi_V(s^-1)

Th: si \pi = 1/|G| \sum g.x, alors \pi est un projecteur sur V^G,
- V=V^G + \Ker \pi
- dim V^G=Tr(\pi)=1/|G| \sum \chi(g)

Cor: - Si V->>V', tout élément de V'^G est image d'un élément de V^G
- Si V' \subset V est stable par G, il admet un supplémentaire stable par G
- Toute représentation est somme de rep irréductibles

Th A.6 (Lemme de Schur)
Si f est un G-morphisme de V_1 dans V_2 irréd alors
- soit V_1 non iso à V_2 et f=0
- sinon ils sont isos et f est une homothétie

Déf: <f,g>=1/|G| \sum f(s) g(s^-1)

Th A.7 (orthogonalité des caractères)
<\chi,\chi'>=1 si V=V', \chi=\chi', 0 sinon

Cor:
- les caractères des reps irréd sont linéaire indépendants
- Si V une rep, V=\sum V_i décomp en irréd, W rep irréd, alors le nombre de
  V_i iso à W et égal à <\chi_V,\chi_W>
  En particulier il ne dépend pas de la décomp

Th A.11: les caractères irréductibles de G forment une base des fonctions
centrales. En particulier il y en a h, le nombre de classes de conjugaison.

Rem: Si r est la représentation régulière, r=\sum_i=1^h \chi_i(1)\chi_i
D'où |G|=r(1)=\sum \chi_i(1)^2

Prop A.13: les valeurs de \chi sont des entiers algébriques

Th A.15: si \chi irréd, de dim n=\chi(1)
f centrale sur G à valeurs dans les entiers algébriques
alors 1/n \sum f(s)\chi(s) est algébrique
En particulier c(s)\chi(s)/n est algébrique où c(s) est le cardinal de la
classe de conjugaison de s

Cor: - n=\chi(1)=dim V (V irréd) divise |G|
- Si c(s) est premier à n, alors \chi(s)/n est entier algébrique et s'il
  est non nul alors \rho(s) est une homothétie

Applications (A.6 et A.7): th de Burnside et de Frobenius
Th A.20: si s\in G \ {1} / c(s)=p^m, p premier.
Alors il existe N normal < G / s soit dans le centre de G/N.
