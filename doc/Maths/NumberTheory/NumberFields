vim: ft=markdownlight fdm=expr

Quadratic Orders
================
Réf: Cox, primes of the form x^2+n y^2

Q(\sqrt{d}) est de discriminant D=d si d=1 mod 4, et 4d sinon.
Dans le premier cas on pose w=(1+\sqrt{d})/2, dans le second w=\sqrt{d}.
[1,w] base de O_K.

La base duale pour la trace de [1,\sqrt{d}] est [1/2, 1/2\sqrt{d}],
et celle de [1,(1+\sqrt{d})/2] est [(-1+\sqrt{d})/2\sqrt{d}, 1/\sqrt{d}]
dans tous les cas on a O_K*=1/\sqrt{D} O_K

Discriminants
-------------

Si K quadratique de discriminant D, alors
O_K=Z[w] où w=(D+\sqrt{D})/2.

Note: si K=Q(\sqrt{d}), alors le discriminant de Z[sqrt(d)] est 4d.
Si d est sans facteurs carrés, on a donc D=d ou D=4d.
Comme D est toujours congru à 1 mod 4 [car c'est un carré mod 4, ça marche
pour tout corps de nombre mais je ne me souviens plus de la preuve], on
peut montrer que 
- si d=3 mod 4 alors D=4d et O_K=Z[\sqrt{d}]
- si d=1 mod 4 alors D=d et O_K=Z[(1+\sqrt{d})/2]

Un ordre O est de la forme [1,fw] où f \in \N est le conducteur de O.
Dans le cas quadratique, on a simplement f=[O_K:O]
D_O=D*f^2 et donc K=Q(\sqrt{D_O})
[le discriminant se définit comme dét Tr(\alpha_i \alpha_) ou encore comme
ici on est Galoisien comme dét^2 (\sigma_i(\alpha_j))

Comme O est monogène (engendré par w_O=(D_O+\sqrt{D_O})/2), I idéal frac de
O est inversible ssi R(I)=O

Norme
-----

Si K=Q(\tau) où a f(\tau)=a tau^2+b tau+c=0 est le pol
minimal et a,b,c sont premiers entre eux.
Alors O=[1, a \tau] est un ordre et [1,\tau] est un idéal inversible de O.
O est l'ordre de discriminant Disc f (cf Théorème 7.7 p. 137)

Réciproquement, si I=[alpha,beta], I=alpha[1,\tau] où \tau=beta/alpha
Si f(tau)=a tau^2+b tau +c est le polynôme minimal de tau, alors
O=[1,alpha \tau] est l'ordre associé à I.

On a N(I) O=I Ibar O=N(alpha)/a O.
[Rem: pour un ordre maximal galoisien, on a tojours N(I)O_K=\prod
\sigma_i(I) O_K, mais que ça marche aussi pour un ordre non maximale est
une feature des ordres quadratiques]
Donc I^-1=Ibar/N(I), ou encore I^-1=I* f'(tau) car f'(tau)=Différente(O)

Formes quadratiques
-------------------
[cf aussi https://math.stackexchange.com/questions/552516/canonical-basis-of-an-ideal-of-a-quadratic-order]

Théorème:
- f(x,y)=a x^2+b xy + c y^2 -> [a, \tau=(-b +\sqrt{D})/2] [\tau \in H]
envoit f forme primitive positive de discriminant D sur
I idéal inversible de O ordre de discriminant D; O=[1,a \tau].
- Cette application induit une bijection de C(D) sur Pic(O), où C(D) dénote
la relation d'équivalence par changement de base linéaire des formes de
discriminant D.
L'application réciproque est I=[\alpha,\beta]->f(x,y)=N(\alpha x-\beta y)/N(I)
- m=f(x,y) ssi m=N(I) où I est dans la classe de (l'image de) f
[Rappel: deux formes f et g sont équivalentes ssi <=>
- g(x,y)=f(ax+by,cx+dy) avec (a b, c d) \in SL_2(Z)
- \tau'=(a b, c d).\tau (via homographie)
- (1: \tau)=(1:\tau') dans P^1(K)]
En fait le vrai théorème est quand a une équivalence entre
C(D) et Cl^+(O) où Cl^+ est le groupe de classe restreint.
Pour les corps quadratiques imaginaires, on a une unité avec N(\xi)=-1 donc
Cl^+(O)=Cl(O). Pour certains corps quadratiques réels, #Cl^+(O)=2 #Cl(O)

Groupe de Picard
----------------

[Si I est inversible dans O, on peut toujours le changer dans sa classe
d'équivalence pour qu'il soit de norme première à un nombre M fixé]

Pic(O)=I(O,f)/P(O,f) (ie idéaux inversibles de O premiers à f)
      =I(O_K,f)/P(O_K,Z,f)
où P(O_K,Z,f) sont les éléments de O_K congrus à a mod fO_K où a \in Z est
premier à f.

Formules des classes
--------------------

h(O)=h(O_K)/[O_K*:O*]*\prod_{p \mid f} [1-\lengendre{d_K/p} 1/p]
En effet dans le terme de droite on a (O_K/f)* et (O/f)*=(Z/f)*
Or (Z/f)*=f \prod (1-1/p) et (O_K/f)*=f^2 \prod(1-1/p)(1-\lengendre(d_K/p)1/p)
Or h(O_K)=\sum_{n=1}^{|d_K|-1} \legendre{d_K/n}n

Units
=====

- x est une unité ssi N(x)=1.

- x est une racine de l'unité ssi pour tout plongement i, ||x||_i=1.
http://math.stackexchange.com/questions/4323/are-all-algebraic-integers-with-absolute-value-1-roots-of-unity
En particulier s'il existe un plongement réel, les seules racines de
l'unité sont \pm 1.

- Le groupe des unités est de rang r=r_1+r_2-1 où r_1 est le nombre de
plongements réels, r_2 le nombre de plongements complexes.

Plus précisément le plongement log ||u||_i dans R^{r+1} réalise les unités
comme un sous-réseau de l'espace vectoriel de dimension r des vecteurs
de somme nulle.

Ici, ||u||_i dénote la valeur absolue normalisée du i-ième plongement, ie
si c'est un plongement complexe c'est |\phi_i(u)|^2.

- Application: L/K est une extension telle que rang unités(L)=rang
  unités(K) ssi L est un corps CM et K le corps réel associé (ie tout
  plongement réel de K devient un plongement complexe).

- Soit K un corps CM. Alors si ||x||_i=1 pour un plongement complexe, x est
  une racine de l'unité.
  [Pr: par ce qui précède il suffit de prouver que ||x||_j=1 pour tout
  plongement complexe j, mais ça vient du fait que les plongements
  commutent à la conjugaison pour un corps CM. Cf:
  http://math.stackexchange.com/questions/39856/sums-of-roots-of-unity
  http://math.stackexchange.com/questions/4323/are-all-algebraic-integers-with-absolute-value-1-roots-of-unity]
  Application: si x \in Z[\zeta_n] est de valeur absolue 1, alors x est une
  racine 2n-ième de l'unité. [Pr: Q(\zeta_n) est un corps CM].

Ramification
============

Cf Neukirch:
L/K extension, K non archimedian henselian.

Unramificatied case
-------------------

T: maximal unramified extension in L.
Then t (residual field) is the separable subfield of l/k.
Valuation(T)=Valuation(K).

In particular, the maximal unramified extension K_nr of K_bar has the roots
of unity of order m not divisibles by car k. If k is finite, as kbar/k is
generated by these roots, K_nr is too.

Tame ramification
-----------------
(ramification modérée)

L/K is tamely ramified iff
L=T(a_i^{1/m_i}) where (m_i,p)=1
In this case we always have [L:K]=ef

Let V be the maximal tamely ramified ext in L.
Then v is the separable subfield of l/k.
Valuation(V*)=Valuation(L*)^(p) (=the elements of Valuation(L^*) whose
order modulo Valuation(K*) is prime to p).

Summary
-------

K \subset T \subset V   \subset L
k \subset l_s  =    l_s \subset l
v(K*)  =  w(T*)   w(L*)^(p)   w(L*)

- The subextensions of T/K correspond 1-1 to the subextensions of l_s/k
- The subextensions of V/T correspond 1-1 to the subgroups of w(V*)/w(T*).

* Extensions de Q_p:
- non ramification
Il y a bijection entre les extensions non ramifiées de Q_p et les
extensions de F_p. En particulier, l'extension maximale non ramifiée de Q_p
est donnée par toutes les racines n-ième de l'unité, n premier à p.

Le groupe de Galois et donc Gal(Fpbar/Fp)=Z^

- ramification modérée
La ramification modérée est donnée par les racines e-ièmes de p, avec e
premier avec p

Le groupe de Galois par rapport à la non ramification est dans
\prod_{\ell \ne p} Z^_\ell
Comme \Z^ est procyclique, si G est le groupe de Galois par rapport à Q_p 
la suite exacte associé \prod Z^_\ell -> G -> \Z^ splitte et
G=\Z^ x| \prod Z^_ell
Dans G, \Z^ est engendré par le Frobenius, donc l'action du produit semi-direct est donné par multiplication par p sur les facteurs Z^_\ell

- ramification sauvage
On rajoute les racines p^n-ièmes de p, en particulier on a aussi les
racines p^n-ièmes de l'unité.

* Cyclotomic extension de Q_p:
Let \zeta_n be a primitive n-th root of unity, with n=dp^m.
We have
\Q_p \subset T=\Q_p(\zeta_d) \subset V=T(\zeta_p) \subset \Q_p(\zeta_n)

Ramification, trace et nilpotents
---------------------------------

Cf: clipper/2003-2004/GT par Gaetan Chevenier

Voila une methode un peu semblable et legerement plus conceptuelle
qui prouve l'equivalence.

i) p est ramifie ssi D/pD, qui est une F_p-algebre finie, a un element
nilpotent non nul:
        (a) si (p)=P_1...P_g avec les P_i distincts, le lemme chinois
assure que c'est un produit de corps, donc sans nilpotent.
        (b) si (p)=P^2A, soit x dans PA-P^2A, alors x^2 est dans P^2A=(p)
mais x n'est pas dans P: l'image de x est nilpotent non nul dans D/pD.

ii) Soit k un corps parfait et A une k-algebre de dimension finie sur k.
A a une "trace" en prenant x->tr(m_x), m_x etant la multiplication par x:
A->A, c'est une forme bilineaire symetrique que je note tr_A.

Alors A est sans nilpotent ssi tr_A est non degeneree:

(a) Si A a un nilpotent x, alors m_xy est nilpotent et donc de trace nulle
pour tout y: tr_A est degeneree.  (b) Si A est sans nilpotent, alors A est
un produit fini d'extensions de corps de k. Je ne le montre pas (ca n'est
pas dur), mais tu auras uniquement a l'appliquer a k=F_p, D=D/pD, auquel
cas on l'a prouve en i). Dans ce cas la, A=K_1 x ... x K_m, on voit que
tr_A est reduite par bloc dans les K_i, ou elle coincide avec tr_{K_i}. Il
suffit donc de le montrer quand A est une extension separable de k.
Dans ce cas, on sait qu'il existe [A:k] plongements A->k^bar, et on voit
que tr_{A} est la somme de ces plongements. Le fait que cette trace est
non degeneree est une consequence simple de l'independance lineaire des
plongements, et est traitee dans Ireland et Rosen.

iii) Enfin, considerons D=Z^n. Notons que si x est dans D, alors tr(x) est
aussi la trace de la multiplication par x: D->D. Ainsi, la trace induit
par reduction modulo p une forme bilineaire sur D/pD a valeur dans F_p qui
coinde encore avec la trace de F_p-algebre.

Ainsi, p divise disc(D) ssi la trace de D/pD est degeneree, ssi D/pD a des
nilpotents, ssi p est ramifie. Et on a l'equivalence.

Strong approximation theorem
============================

cf Henri Cohen, Advanced Topics, Prop 1.2.8

## Approximation forte:

Soit S={v_i} un nombre fini de places de K, x_i \in K et \epsilon_i >0.
Alors il existe x \in K tel que
|x-x_i|_i <\epsilon_i pour tout i dans S
|x|_i <= 1 pour toute place non dans S, sauf au plus pour une place qui
peut être choisie à l'avance.
[Comme \prod_v |x|_v=1, on n'est obligé de laisser une place non controlée]

### Interprétation adique

http://modular.math.washington.edu/129/ant/html/node84.html

Theorem 20.4.4 (Strong Approximation)   Let $v_0$ be any normalized
nontrivial valuation of the global field $K$. Let $\AA_{K,v_0}$ be the
restricted topological product of the $K_v$ with respect to the $\O_v$,
where $v$ runs through all normalized valuations $v \neq v_0$. Then $K$
is dense in $\AA _{K,v_0}$.

Lemma 20.4.1   There is a constant $ C>0$ that depends only on the global
field $K$ with the following property:
Whenever $\mathbf{x}=\{x_v\}_v \in \AA_K$ is such that
$\prod_v |x_v|_v > C$
then there is a nonzero principal adele $a \in K \subset \AA_K$ such that
$|a|_v \leq |x_v|_v$ for all $v$.

## Approximation faible:

Soit S_0={v_i} un nombre fini de places finies, et e_i \in N.
Alors il existe x tel que v_i(x)=e_i pour i dans S_0, et v_i(x)>=0 pour i
fini pas dans S_0.
(la différence avec l'approximation forte est qu'on n'impose rien sur les
places à l'infini.)

Version avec approximation forte:
Soit S_0 comme avant et S_infini les places réelles. e_i \in N des
valuations et \epsilon_j=\pm 1 des signes.
On peut trouver x dans K tel que
- v_i(x)=e_i si i \in S_0
- sign \sigma_j(x)=epsilon_ si j \in S_infini
- v_i(x)>=0 pour les places finies non dans S_0.

Corollaire: si I est un idéal de O_K, il existe x \in I tel que pour tout
p \mid I, v_p(x)=v_p(I)

Corollaire: Soit m un entier et I un idéal fractionnaire de O_K.
Il existe x tel que xI soit premier à m.

### Autre référence

http://deltaepsilons.wordpress.com/2009/10/06/the-artin-whaples-approximation-theorem/

So fix pairwise nonequivalent absolute values {\left|\cdot\right|_1, \dots,
\left|\cdot\right|_n} on the field {K}; this means that they induce
different topologies, so are not powers of each other.

Theorem 1 (Artin-Whaples)
Hypotheses as above, given {a_1, \dots, a_n \in K} and {\epsilon>0},
there exists {a \in K} with
\left|a - a_i\right|_i < \epsilon, \quad 1 \leq i \leq n.

Theorem 3
  Let {K} be a field with a discrete valuation {v} (yes, this is a change of notation), and let {L} be a finite extension with {w} the valuations on {L} prolonging {v}. Then

  \prod_w L_w \simeq L \otimes_K K_v.


## Approximation forte pour les groupes algébriques

- http://en.wikipedia.org/wiki/Weak_approximation_theorem

In algebraic group theory, approximation theorems are an extension of the
Chinese remainder theorem to algebraic groups G over global fields k. They
give conditions for the group G(k) to be dense in a restricted direct
product of groups of the form G(ks) for ks a completion of k at the place
s. In weak approximation theorems the product is over a finite set of
places s, while in strong approximation theorems the product is over all
but a finite set of places.

- Cas SL_n:
http://mathoverflow.net/questions/81626/is-strong-approximation-difficult
Preuve que SL_n(O)->SL_n(O/I) est surjectif pour un ordre O.
(Strong approximation for SL_2 implies Sl_2(Z)->>SL_Z(Z/nZ), but there are
more elementary proofs given here)

Polynômes cyclotomiques
=======================

https://en.wikipedia.org/wiki/Cyclotomic_polynomial
Calcul: si n est impair, Phi_2n(x)=Phi_n(-x)
Si n=p^m r, Phi_n(x)=Phi_pr(x^p^{m-1}) et donc si q est le radical de n, Phi_n(x)=Phi_q(x^{n/q})
Si n=p r, Phi_n(x)=Phi_r(x^p)/Phi_r(x)

\phi_n mod p se décompose suivant les classes p-cyclotomiques modulo n: le
Frobenius agit comme i->pi mod n, et donc les orbites donnent les facteurs
irréductibles.

Variétés de Shimura, Théorie de Hodge et représentation Galoisiennes
====================================================================

## Cas elliptique

Si on prend une forme modulaire pour X_0(n), l'algèbre de Hecke agit
dessus, et le noyau donne un idéal I.

Maintenant la cohomologie étale donne une représentation Galoisienne de
X_0(n), et un réseau dedans est donné par le module de Tate.

Si on prend J(X_0(n))[I]_0, alors on trouve une courbe elliptique, de telle
sorte que X_0(n) -> E, en particulier on a une application entre la
cohomologie.

## Dimension supérieure

En général, si f est une forme modulaire de Siegel, elle correspond à une
forme automorphe (ie une fonction sur G(Adèles)/G(Q)) où G correspond ici à
GSP_4 pour l'espace de Siegel.

Si on a une représentation automorphe V (aka une représentation du groupe
précédent), on peut chercher à identifier des éléments dedans. Par exemple,
si on se fixe un sous-groupe compact K, alors on a un double quotient
K/G(Adèles)/K, qui agit sur V^K. Ceci est une généralisation de l'action de
Hecke précédente.

En particulier on peut chercher à lire ça dans la cohomologie étale de la
variété de Shimura.

## Théorie de hodge p-adique
https://en.wikipedia.org/wiki/P-adic_Hodge_theory

Si K est un corps local, on regarde les représentations du groupe de galois
de K. Dedans on peut trouver des sous-espaces sympa, avec des foncteurs
pleinement fidèles vers des objets d'algèbres linéaires.

Représentation crystalline < Représentation semi-stables <Représentation de
De Rham < Représentation de Hodge-Tate < Toutes les représentations.

On gros on associe un anneau, genre B_cris, de sorte que B_cris tens
cohomologie étale sur Q donne B_cris tens cohomologie de De Rham sur K pour
une bonne variété.

On défini D_cris(V)=(B_cris \tens_Q_p V)^G, par ce qui précède pour une bonne
variété, D_cris(cohomologie étale)=cohomologie de De Rham.

On dit que V est crystallin si B \tens D_cris(V) -> V est un isomorphisme.

- V -> D_cris(V) est un foncteur pleinement fidèle des représentations
crystallines vers les \phi-module.
- V -> D_st(V) est un foncteur pleinement fidèle des représentations
crystallines vers les (\phi,N)-module.

En général, il y a une équivalence de catégorie entre les représentations
et les (phi, Gamma)-modules d'un certain type.


