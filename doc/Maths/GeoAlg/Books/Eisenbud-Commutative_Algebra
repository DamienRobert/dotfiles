vim: ft=markdownlight fdm=expr

Part 1: Basic
=============

* CRT:
Si les Q_i sont premiers deux à deux, R/\inter Q_i = \prod R/Q_i
(par localisation)

* Idempotents:
R a un idempotent e non trivial => R est isomorphe au produit
Re x R(1-e) (et de plus Re=R[1/e]), et ça équivaut à Spec R non connexe (ie
= X_1 union X_2, X_i fermés)

Entiers
-------

Soit S=R[x]/I. Alors S est fini ssi I contient un polynôme unitaire; et S
est libre (de rang n) ssi I est engendré par un polynôme unitaire (de degré
n).

Integral extensions of affine rings <=> finite and proper maps.
Si phi: X \to Y est un morphisme de variétés algébriques, phi se factorise
par Y' qui est l'ensemble des fibres connexes, dans le cas affine, Y' est
la normalisation de Y dans X.

* Cayley-Hamilton:
Si phi(M) \subset IM, alors \phi est annulé par dét(x\Id -\phi), qui est
monique, et le coefficient c_j est dans I^j.

Application:
- M/R fini, alpha: M \to M épi => alpha est un iso.
- Si M=R^n, tout ensemble générateur de n éléments est libre.

Nakayama
--------
(M/R fini.)

Si IM=M, alors il existe r \in I tel que (1-r)M=0.
Or on a l'équivalence suivante: I \subset radical de Jacobson (=intersection des maximaux) ssi les éléments {1-a, a \in I} sont inversibles.

Donc si I est dans le radical de Jacobson (ex I=m, où (R,m) local), alors
- IM=M => M=0
- Des générateurs de M/IM se relèvent en générateurs de M.

Application: M,N/R finis
1. Si M \tens_R N=0, alors ann M + ann N=R
2. Si de plus R local, alors M ou N=0

Pr: 2 vient de Nakayama, 2. => 1. par localisation.

 Versions de Nakayama sans supposer M/R fini:
 -------------------------------------------

si R est complet par rapport à un idéal m, et que M est séparé (ie \inter
m^k M=0), alors des générateurs de M/mM se relèvent en des générateurs de
M.
Note: si R est noethérien m-complet et M/R fini, M est m-séparé par le lemme
d'Artin-Rees.

Version qui combine les deux:
R \subset S noetheriens, R m-complet, m inclus dans le radical de Jacobson
de S et M/S fini. Alors générateurs de M/mM se relèvent en des générateurs
de M (pour R).

Normalisation
-------------

Si R \subset S, f \in R[x] unitaire, f=gh dans S[x] avec g,h unitaires.
Alors les coeffs de g et h sont entiers sur R.
Donc si R est int. clos dans S, g,h \in R[x]

- La normalisation commute à la localisation
- La normalisation d'une variété affine X est une variété affine finie au
  dessus de X.
- Krull-Akizuki: la normalisation d'un anneau noethérien de dimension 1 est
  noethérien.
- Si R \subset S, S/R entier ssi S[x]/R[x] entier; si R intègre, R est
  normal ssi R[x] normal.

Nullstellensatz
---------------

* Artin-Tate

Si R noetherien, S/R de type fini, T \subset S algèbre telle que S/T est
finie, alors T/R est de type fini.

Application: si k, K corps et l'extension K/k est de type fini, alors K/k
est finie. (Version faible du Nullstellensatz).
Cf exo 4.32 dans Eisenbud.

* Nullstellensatz version Jacobson

R de Jacobson si tout idéal premier est intersection d'idéaux maximaux
(ie: pour tout quotient de R, radical=radical de Jacobson).

Th: si R de Jacobson, S/R de type fini => S de Jacobson.
De plus si n \subset S est maximal, m=n\inter R est maximal, et S/nS est
finie sur R/mR.

Artin-Rees lemma
----------------

gr_I R=R/I+I/I^2+...
B_I R= R+I+I^2 = R[tI] \subset R[t]

Si I est l'idéal de Y \subset X, B_I R correspond à Z \subset A^r x P^s (où
a_1, a_r générateurs de R et g_0, g_s générateurs de I) correspondant au
blowup de X le long de Y. Z -> X est donc un iso sur X\Y.
La préimage de Y dans Z correspond à B_IR/IB_I R=gr_I R, qui est le cône
tangent.

Si M=M_0 > M_1 > ... est une filtration I-stable ssi B_I M est fini sur B_I R.
En particuliar, gr_I M est alors fini sur gr_I R.

Artin-Rees: si M' \subset M modules finis, R noetherien. Si M a une
filtration I-stable, M' \inter M_i est une filtration I-stable.
ie: M' \inter M_i+n = I^i (M' \inter M_n) pour n assez grand.

Krull intersection theorem
--------------------------

I \subset R idéal, R noetherien. Si M/R fini, il existe r \in I tel que
(1-r) \inter_j I^j M = 0. En particulier, si R intègre ou local, et I idéal
propre, \inter I^j =0.

ex: si R Noetherien local, I idéal propre. Alors gr_I R domain => R domain.


Flatness
--------

### Localisation

- Si S/R plat, M, N R-modules, M finiment présenté, alors
Hom_R(M,N)\tens S = Hom_S(M \tens S, N \tens S)
- Si S/R plat, M, N finis sur R, alors S \tens Tor^R_i(M,N)=Tor^S(S\tens M,
  S \tens N)

En particulier:
Tor^R_m(M,N)[U^-1]=Tor_m^R(M,N[U^-1]) =Tor^R_m(M[U^-1],N[U^-1])=Tor^R[U^-1]_m(M[U^-1],N[U^-1])

### Critères

Prop: M est plat <=> I \tens M -> M est un mono pour tout idéal I <=>
Tor^R_1(R/I,M)=0

Rem: si I=(x), on a Tor_0(R/x,M)=M/xM, Tor_1(R/x,M)=(0:x)_M, Tor_n(R/x,M)=0
si n>1.

Cor: si M/R plat, un non diviseur de 0 dans R est non diviseur de 0 dans M.
     Resp si R de Dedekind, M/R plat <=> M sans torsion.

Th: M est plat si pour toute application f d'un module libre fini F -> M, alors
pour tout sous module K de Ker f, il existe g: F -> G libre tel que Ker g contienne K et le diagramme suivant commute:
K\subset Ker f \subset F -> G
                        \  /
                         M
(En fait il suffit de le vérifier pour K module de type fini)

### Projectivité

M projectif <=> M facteur direct d'un R-module libre.
Si R local, M projectif <=> M libre.
En général, si M est de présentation finie, M plat <=> M projectif <=> M localement libre
(<=> M_P plat sur R_P pour tout P max <=> Tor_1^R(M,R/P)=0 pour tout P max
<=> M_P libre sur R_P pour tout P max)

(ou localement libre peut se prendre à la fois au sens sur chaque fibre
M_P, ou au sens M[1/f_i] pour un recouvrement ouvert de Spec A, ie les
(f_i) engendrent l'idéal unité. En effet, si M et N sont de présentation
finies, M_P iso N_P signifie qu'il existe f \not\in P tel que M[1/f] iso N[1/f]).

### Critère local:

(R,m) anneau local noethérien, (S,n) R-alg locale noetherienne, mS \subset n,
M/S fini.
Alors M est plat sur R <=> Tor^R_1(R/m,M)=0

Part 2: Dimension
=================

Dimension relative zero
-----------------------

Si R noethérien, dim R=0 ssi R est artinien. Dans ce cas R est isomorphe à
un produit (fini) d'anneau locaux. Si X affine, dim X=0 <=> X fini.

Theorem:
Si phi: R \to S entier, alors Spec S \to Spec R est fermée, surjective sur son
image et respecte les dimensions (donc est à fibres finies). Autrement dit,
tout idéal premier de R contenant Ker phi est la préimage d'un idéal
premier de S, et si I est un idéal de S, dim I = dim phi^{-1} I.

Preuve:
1) Going up + lying over: si Q_1 est un idéal de S tel que R\inter Q_i
   \subset P, il existe Q premier dans S contenant Q_1 tel que R \inter Q =
   P.
2) Si R \subset S sont intègres, K(S)/K(R) algébrique; alors tout idéal non
   trivial de S intersecte R non trivialement.
   Application:
   - si S/R entier, R corps <=> S corps.
   - Incomparabilité: si Q_1 et Q_2 premiers dans S ont la même
     intersection dans R, ils sont incomparables.

Application:
- Spec S -> Spec R est submersive (car l'application est propre), ie Spec R
  est un quotient topologique de Spec S.
- les fibres sont de dimension 0
- Si (R,m) local, les fibres au dessus de m sont exactement les idéaux max
  de S.
- Si R et S intègres et R intégralement clos => going down
- Si R intégralement clos et S la cloture de R dans l'ext normale finie
  K=Frac R \subset L, alors les points d'une fibre sont conjugués par le
  groupe de Galois des automorphismes de L/K. Ceci est valable même si R et
  S ne sont pas noethériens.

Pr: les deux premiers résultats sont des conséquences triviales du th, les
deux suivantes sont Eisenbud Th 13.9 et 13.10.

Normalisation
-------------

Si R/k est une variété affine, K=K(R) et L/K finie. Si T est la cloture
intègrale de R dans L, T/R est fini, en particulier T est une variété
affine.

Dans le cas séparable, on a une version pour R plus général:
Si R est noéthérien intègre, L/K finie séparable, alors la cloture de R
dans L est finie en tant que R-module.

Ex: si k alg clos de char 0, la cloture algébrique de k((x)) est le corps
des séries de Puiseux \union k((x^1/n)) et la cloture intégrale de k[[x]] dans k((x^1/n)) est k[[x^1/n]].

Application de l'ex: une équation polynômiale f(x,y)=0 sur k a des
solutions de la forme y=p(x^1/n) où p est une série de Laurent. Si f est
unitaire en y, p est dans k[[x]]. Si de plus f(0,0)=0, on peut écrire p
sans terme constant.

Lemme de Normalisation de Noether
---------------------------------

R affine de dim d sur k
I_1 \suset ... \subset I_m chaine d'idéaux de dim d_i avec d_1>d_2...>d_m>0
Alors il existe x_1,...,x_d alg indép tels que
(i) R/k[x_1,...,x_d] fini
(ii) I_j \inter k[x_1,...,x_d]=(x_{d_j+1},...,x_d)
Géométriquement: on a une application finie qui envoit la chaîne de
variétés affines Spec R/I_i sur une chaîne linéaire.
