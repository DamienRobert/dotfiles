vim: foldmethod=expr ft=markdownlight

Liste d'exos: http://math.stackexchange.com/questions/524100/list-of-pre-graduate-level-exercises
Proba: http://math.stackexchange.com/questions/156165/good-books-on-advanced-probabilities

Représentations
===============

Burnside's theorem: every proper algebra of matrices over an algebraically closed field has a non-trivial invariant subspace.
http://en.wikipedia.org/wiki/Invariant_subspace#Fundamental_theorem_of_noncommutative_algebra
(One consequence is that every commuting family in L(V) can be simultaneously upper-triangularized.)

Maschke: K[G] est semi-simple si G fini avec card G non divisible par car K.

Algèbre linéaire
================

Lemme des noyaux:  \somme ker P_i(f)= ker \prod P_i(f)
si les P_i sont premiers entre eux
(c'est de la localisation qui ne dit pas son nom...)

Cayley-Hamilton: pol min | pol car
(outre la preuve classique via Nakayama, une preuve possible est de montrer
qu'il existe un sous-espace cyclique de dim le degré du pol min; cas
particulier de la décomposition en classes de similitudes)

Théorème de la décomposition de Dunford — Un endomorphisme u d'un espace
vectoriel de dimension finie admet un polynôme minimal scindé si et
seulement s'il peut s'écrire sous la forme u = d + n avec d un
endomorphisme diagonalisable et n un endomorphisme nilpotent tels que d et
n commutent (c'est-à-dire dn = nd). De plus d et n sont alors des polynômes
en u et sont uniques.
(si k=\C alors le pol min est tjrs scindé donc u=d+n existe toujours)
Construction: d=\sum \lambda_i \pi_i où \pi_i est la projection sur
l'espace caractéristique ker(X-lambda_i)^n_i.

Décomposition de Frobenius: la décomposition issu des polynômes de
similitudes (k[x] est principal); décomposition de Jordan la version avec
des puissances (sur un corps alg clos on a des (X-lambda)^n_i)

Nilpotent <=> Trace des puissances = 0
http://math.stackexchange.com/questions/159167/trace-of-powers-of-a-nilpotent-matrix
(pour le <= il suffit d'avoir la trace de A^k=0 pour k=1..n)

Recursion formula for the higher traces (of exterior product) giving the
coeffs of the characteristic polynomial:
http://math.stackexchange.com/questions/23899/formulas-for-the-top-coefficients-of-the-characteristic-polynomial-of-a-matrix

Perron Frobenius:
https://en.wikipedia.org/wiki/Perron%E2%80%93Frobenius_theorem

Analyse Fonctionnelle
=====================

https://en.wikipedia.org/wiki/Hahn%E2%80%93Banach_theorem
https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Hahn-Banach
-> Prolongement des formes linéaires continues
-> Let M be a vector subspace of the topological vector space X. Suppose K is a non-empty convex open subset of X with K ∩ M = ∅. Then there is a closed hyperplane N in X containing M with K ∩ N = ∅.

Banach:
- https://en.wikipedia.org/wiki/Open_mapping_theorem_(functional_analysis)
  [Banach Schauder]
-> Si A:X->Y (banach) linéaire bijective continue, A^{-1} est continue
-> If A : X → Y is a linear operator between the Banach spaces X and Y, and
   if for every sequence (xn) in X with xn → 0 and Axn → y it follows that
   y = 0, then A is continuous (the closed graph theorem)

Banach Steinhaus:
For a family of continuous linear operators (and thus bounded operators) whose domain is a Banach space, pointwise boundedness is equivalent to uniform boundedness in operator norm.
Corollary. If a sequence of bounded operators (Tn) converges pointwise, that is, the limit of {Tn(x)} exists for all x in X, then these pointwise limits define a bounded operator T (=> convergence uniforme sur les compacts)


Hilbert:
- https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_projection_sur_un_convexe_ferm%C3%A9
  https://en.wikipedia.org/wiki/Hilbert_projection_theorem
-> Séparation des convexes (cf l'article Wikipedia)
-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_du_suppl%C3%A9mentaire_orthogonal_d%27un_ferm%C3%A9_dans_un_espace_de_Hilbert
-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_repr%C3%A9sentation_de_Riesz_(Fr%C3%A9chet-Riesz)
   Il existe un unique y dans H tel que pour tout x de H on ait f(x) = ⟨y, x⟩.
-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Lax-Milgram
   Sous ces conditions, il existe un unique u de K tel que
    (1)\forall \ v\in K\quad a(u,v)\geq L(v)
-> https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Stampacchia
   Sous ces conditions, il existe un unique u de K tel que
    (1)\forall \ v\in K\quad a(u,v-u)\geq L(v-u)
    Si de plus la forme bilinéaire a est symétrique, alors
    u minimise la fonctionnelle I(v)=a(v,v)/2-L(v)

Holomorphie
===========

https://en.wikipedia.org/wiki/Montel%27s_theorem
Uniformly bounded families are normal
[normal family = relatively compact family of continuous functions with respect to the compact-open topology]
- A uniformly bounded family of holomorphic functions defined on an open subset of the complex numbers is normal.
- Corollary: Suppose that F is a family of meromorphic functions on an open
  set D. If z_0 ∈ D is such that F is not normal at z_0, and U ⊂ D is a
  neighborhood of z_0 ⋃_{f ∈ F} f(U) is dense in the complex plane.

Opérateurs
==========

https://en.wikipedia.org/wiki/Operator_norm

Polynômes
=========

Majoration des racines:
http://www.les-mathematiques.net/phorum/read.php?3,411117,411203
http://enseignement.math.univ-angers.fr/IMG/pdf/09-ep2.pdf

Proba
=====

https://en.wikipedia.org/wiki/Markov_chain

https://en.wikipedia.org/wiki/Convergence_of_random_variables
- (L^r, ae) => proba => distrib
- proba => il existe une sous suite qui converge ae
- distribution => il existe une suite équivalente en distrib qui converge ae
- si \sum P(|X_n-X|>\epsilon)<\infty (ie la conv en proba non seulement
  tend vers 0 mais est sommable), alors X_n->X ae par Borel-Cantelli
- ae + dominated convergence => L1

Finite Fields
=============

https://en.wikipedia.org/wiki/Factorization_of_polynomials_over_finite_fields
Rabin's test of irreducibility:
Let p1, ..., pk, be all the prime divisors of n, and denote n / p_i = n_i
f of degree n is irreducible in Fq[x] if and only if gcd (f,x^q^n_i−x)=1
and f divides x^q^n−x.

Note: le gcd avec x^q^i-x donne le produit des facteurs irréd de degré divisant i (on suppose f square free quitte à diviser par le pgcd avec f').
On calcule x^q^i-x mod f via une exponentiation rapide.
[autre méthode: calculer la matrice A du Frobenius puis faire A^i.x]
Pour continuer la factorisation: cf Berlekam ou Cantor-Zassenhaus

Calcul scientifique
===================

https://en.wikipedia.org/wiki/Galerkin_method
Galerkin methods are a class of methods for converting a continuous
operator problem (such as a differential equation) to a discrete problem.
In principle, it is the equivalent of applying the method of variation of
parameters to a function space, by converting the equation to a weak
formulation.

Divers
======

Points fixes: http://www.math.u-psud.fr/~guiheneu/Fichiers/LecAna/206.pdf

Formules
========

Résultant: si f=a_n x^n + ... + a_0
              g=b_m x^m + ... + b_0
  f=qg+r, r non constant, deg r<deg g
  alors Res(f,g)=(-1)^(n+m) b_0^(n-deg r) Res(g,r)

CRT: si n_1 et n_2 premiers entre eux, un_1+vn_2=1
     x=x_1 (n_1), x=x_2 (n_2)
     Alors x=x_1 vn_2 + x_2 un_1
            =x_1+un_1(x_2-x_1)

Euclide étendu:
  r_i=q_{i+1}r_{i+1}+r_{i+2}
  (r_{i+1}; r_{i+2})=(0 1; 1 -q_{i+1})(r_i; r_{i+1})
                    =(u_{i+1} v_{i+1}; u_{i+2} v_{i+2})(a b)
  Donc R_{i+1}=Q_{i+1}R_i=UV_{i+1}R_0
  où UV_i=Q_i Q_{i-1}... Q_0; UV_{i+1}=Q_{i+1} UV_i
  (on remarque que det Q_i=-1, tr Q_i=-q_i, ie car(Q_i)=X^2+q_iX-1.
  En particulier det UV=\pm 1, ie u_i et v_i sont premiers entre eux).

  On a r_i=u_i a+ v_i b; et si r_{k+1}=0, gcd(a,b)=r_k et r_k=u_k a+v_k b
  On a |u_i|<b/r_i et |v_i|<a/r_i, autrement dit |a/b+v_i/u_i|<1/u^2.
  Donc les v_i/u_i approximent a/b (fractions continues), et ce sont les
  seuls qui approximent aussi bien (on va voir qu'on peut faire plus fort)

  Si U_i=(-1)^i u_i, V_i=(-1)^(i+1) v_i (ie on remplace la matrice Q_i par
  |Q_i| dans les formules de récurrence pour simplifier les signes), on a
  r_i=(-1)^i (aU_i-bV_i). Or  U_iV_{i+1}-V_{i+1}U_i=(-1)^i, ie
  V_i/U_i < a/b si i pair, et a/b < V_i/U_i sinon.
  On a |a/b - V_i/U_i|<1/(U_i U_{i+1}<1/(2U_i^2)
  Réciproquement, si |a/b-v/u|<1/(2u^2), alors u=U_i et v=V_i.

  Forme polynômiale: deg u_i<deg b-deg (r_i), deg v_i<deg a-deg(r_i).
  De manière plus précise: deg u_i=deg b-deg(r_{i-1}) et deg v_i=deg
  a-deg(r_{i-1}).
  Réciproquement, si deg(ua+vb)+deg(u)<deg(b), autrement dit si
  |a/b+v/u|=fraction rationelle de degré < - 2 deg u, alors u=alpha u_i et
  v=alpha v_i à un facteur constant alpha près.

Ecrits
======

2017: Répliques de Chevalley
Cf: http://www.numdam.org/article/SSL_1954-1955__1__A9_0.pdf
- B est une réplique de A <=> B_r,s=P_r,s(A_r,s) avev P_r,s polynôme sans
facteur constant pour tout r,s <=> si A=D+N décomp de Dunford de A, B=DD+NN décomp de Dunford de B alors NN=\lambda N et DD=P(D) où \lambda_i -> P (\lambda_i)
donne une forme linéaire de Q(\lambda_i)-> K
- A est nilpotent <=> Tr(AB)=0 pour tout B réplique de A
- Si G algèbre de Lie, Tr(XY) nulle sur G => G résoluble
  => Décomposition d'une algèbre de Lie semi-simple
