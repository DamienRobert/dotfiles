vim: ft=markdownlight fdm=expr

Anneaux réguliers
=================

Th: (R,P) anneau local régulier, (A,Q) algèbre noeth sur R, PA \subset Q.
Alors (i) A/R plat <=> depth(PA,A)=dim R
      (ii) Si A est Cohen-Macauley, A/R plat <=> dim A=dim R+dim A/PA

Th: (R,P) anneau local régulier, A/R fini, A équidim
     A Cohen-Macauley <=> A R-module libre

Rem: Module plat sur k[x_1,...,x_n]=>libre (Serre-Quillen)
Donc si B/k[x_1,...,x_n] entier, B Cohen-Macauley <=> B libre

Anneaux semi-locaux
===================

Par la théorie de Wedderburn, A semi-local artinien de radical nul => A produit de corps (car A est alors semi-simple)

Eisenbud, exo 4.13:
R semilocal, M,N de présentation finies.
Si M_P \iso N_P pour tout maximal P, alors M \iso N
(la difficulté est de construire l'application M \to N qui induit l'iso
localement en les P).

Decomposition of complete semilocal rings
-----------------------------------------

http://math.stackexchange.com/questions/218020/finite-free-rings-over-complete-local-rings-are-direct-products-of-local-rings

As rschwieb notes, commutative Artinian rings can always be factored
uniquely as a product of local Artinian rings, and the formation of this
factorization commutes with the passage to the maximal reduced quotient
(i.e. it is invariant under quotienting out by the nilradical).

Since a complete semilocal ring is (by definition) the projective limit of
A/I^nA, where I is the Jacoson radical and is the intersection of the
finitely many maximal ideals, applying the preceding paragraph to the
quotients A/I^nA (each of which is Artinian, and all of which has the same
maximal reduced quotient, namely A/IA), we obtain a factorization of A into
a product of finitely many complete local rings.

This result uses completeness in a crucial way (via passage to the Artinian
case). E.g. the localization of ℤ[i] at the prime ideal 5 of ℤ (i.e. invert
all elements coprime to 5) is semi-local (because there are two prime
ideals in ℤ[i] lying over the prime ideal 5 of ℤ), but is not a product of
local rings. (It is an integral domain, and so cannot be written as a
product in a non-trivial way.) Of course, if we 5-adically complete it,
then by the preceding discussion it will split as a product (of two copies
of ℤ5).

Anneaux finis
-------------
A fini réduit => A produit de corps fini

https://groups.google.com/forum/#!search/Gaetan$20Chevenier/fr.sci.maths/7rkPQxKxknE/eioYJRhjgEQJ

  Il est d'ailleurs amusant de voir que plus faiblement: si A est un
anneau fini réduit (sans éléments nilpotents) c'est un produit de corps
finis (et il est donc commutatif). J'en ai trouvée une preuve élémentaire,
 c'est pourquoi je me permet de poster. Elle utilise le fait que tout
monoide fini non nécéssairement unitaire contient un idempotent (pas
difficile), et que dans tout anneau réduit les idempotents sont centraux (si
e est idempotent: e^2=e, remarquer que pour tout x, ex(e-1) et (e-1)xe sont de
carrés nuls, donc nuls). On conclut de la manière suivante, par récurrence
sur le cardinal de A, A fini réduit: si il existe un diviseur de 0, le
monoide qu'il engendre contient un idempotent e différent de 0 et 1, mezalor
e est central et donc A est isomorphe à eA x (1-e)A, avec eA et (1-e)A
strictement plus petits.

PS: ce résultat découlerait de la théorie de wedderburn sur les anneaux
semisimples artiniens.

Multiplicités
-------------

### Samuel (Algèbre locale, p 32)

A anneau local, B semi-local, B/A fini et aucun élément non nul de A n'est
diviseur de 0 dans B. \hat{B}=\prod B_i la décomposition du complété de B
en produit d'anneaux locaux, p_i idéal max de B_i, et q un idéal primaire
de B par rapport à l'idéal max m de A.
Alors [B:A] e(q)=\sum_i [B_i/p_i : A/m] e(B_iq) et e(q)=\sum e(B_iq)
[Note: [B:A] c'est dim_{A/m}(B/mB)]

### Serre: groupes algébriques et corps de classes, $13 quelques formules relatives aux revêtements, p60

F/F' ext finie, X' var irréductible non singulière, F'=k(X'), X normaisée
de X' dans F/F', g:X->X'.
g^{-1}(P')=\sum_{g(P)=P'} e_p P cycle de X

La multiplicité e_P est définie comme suit:
A' \subset A anneaux locaux de P' et P
m' -> m'A idéal primaire dont la multiplicité est e_P
e_P=\sum (-1)^i Tor^{A'}_i(A,k)

Soit L \supset F ext normale, Y la normalisée de X' (ou de X) dans L.
G=Aut_F'(L), H=Aut_F(L), G/H = Hom_F'(F,F'bar)
Y -\pi-> X -g-> X'
Pour tout P\in X, g^{-1}( (g(P)) )=[F:F']_i \sum_{\sigma_i \in G/H} \pi \sigma_i(Q) où \pi(Q)=P

### Zariski-Samuel: décomposition of a prime ideal in extensions of Dedekind domains

A Dedekind, B cloture de A dans L, K=Frac(A), L/K fini
p premier dans A, pB=\prod p_i^e_i
e_i: indice de ramification réduit
e_i[B/p_i:A/p]_i: indice de ramification

Alors \sum e_i f_i=dim_{A/p} B/pB \leq [L:K]
égalité ssi B_p est un A_p-module de type fini

Vient des lemmes (Zariski-Samuel, Commutative Algebra Tome 1, p 285-286):
Lemme 1: Soit A \subset R \subset L un anneau, a un idéal de R / a \cap A=p
  Alors dim_{A/p} R/a \leq [L:K]

Lemme 2: Soir A \subset R \subset L un anneau noéthérien, p^eR=D_1 \cap ...
\cap D_g une décomposition irrédondante en "primary components", P_i=rad
D_i, e_i=length D_i, f_i=[R/P_i:A/p]. Alors \sum e_i f_i=dim_{A/p} R/p^eR
et dim_{A/p}(R/pR) \leq [L:K] avec égalité ssi R_p est un A_p module de
type fini

Anneaux locaux complets
=======================

Théorème de Cohen (cf Eisenbud):
- R local complet => R=A[[x1,...xn]]/I où A local complet principal. 
  A[[x1,...,xn]] est un anneau régulier
  (si A=K, de dim n, si A=W(K) de dim n+1)
- Si R contient un corps (<=> est d'égale charactéristique à son résidu
  K=R/m), alors on peut même prendre A=K.
- Si on n'est pas d'équale charac, alors car R=0 et car K=p, si K parfait
  on peut prendre A=W(K) l'anneau des vecteurs de Witt.
  (dans le cas non parfait il existe toujours W(K) local complet d'idéal
  max = <p> et de corps résiduel K mais il n'est plus unique; on peut
  encore prendre A=W(K)).

Plus précisément (cf Th 7.8)
Si R local complet, K=R/m, R contient un corps k, et K/k séparable.
Soit B une base différentielle de K/k. Alors il y a bijection entre les
corps de coefficients Ktilde \iso K dans R et les lifts de la base
différentielle B. Si k parfait de car p>0, k est inclus dans tous les
Ktilde. [Si R contient un corps, il contient Q ou F_p qui est parfait, donc
R contient toujours K]

Généralisation: si f:R->S morphisme d'anneau local, f se factorise
en R->R'->>S où R' local complet et R'/mR' anneau local régulier.
Par ex si S local complet S/m=K de car p, on peut factoriser Z_(p)->S via
R'=W(K)[[x1,...xn]] par ce qui précède.

Rem (Section 10.3): Si (R,m) est régulier, alors R est intègre (et même
factoriel), un système de paramètre régulier x_1, ..., x_n de m donne une
séquence régulière. Si R local complet régulier de corps résiduel k, alors
si R contient un corps, R \iso k[[x_1,...x_d] pour tout système de
paramètres x_i de R.

* Serre (Corps Locaux)

$ Cas d'égale carac
Th 2: Si A anneau de valuation discrète complet, de corps résiduel k et de
corps de fraction K. Si k et K ont égale caractéristique, A=k[[T]].

Preuve: on a un syst de représentant S qui est un corps (iso à k), 
dans tous les cas tout élément de A s'écrit uniquement \sum_{i>=0} s_i π^n
(et une série de Laurent pour x dans K), donc A=k[[T]].

(i) k de carac 0
Soit A un anneau local séparé complet pour a_i (a_i a_j \subset a_i+j).
Si k=A/a_0 corps de carac 0, alors il existe dans A un syst de représentant de k
qui est un corps.

La preuve utilise Hensel: si A/a_0 est un corps, f a une racine simple dans
A/a_0, alors cette racine se lifte uniquement.

(ii) k et K de carac p
Prop 8: Soit A un anneau séparé complet pour a_i (a_i a_j \subset a_i+j).
Si k=A/a_0 anneau parfait de carac p, alors 
- il existe dans A un syst de représentant f:k->A qui commute au Frobenius: f(x)^p=f(x^p)
- x \in f(k) ssi x est une puissance p^n-ième pour tout n
- f(xy)=f(x)f(y)
- Si A de carac p, f(x+y)=f(x)+f(y)

$ Cas d'inégale carac
A est de carac 0, on a Z_p -> A, e=v(p) l'indice de ramification absolu. A
absolument non ramifié si e=1.

Th: si k parfait de carac p, il existe un unique anneau W(k) de valuation
discrète complet absolument non ramifié de corps résiduel k.
Si A est de ramification absolue e, il existe un unique morphisme W(k)->A
au-dessus de k, ce morphisme est injectif et A est libre sur W(k) de rang e
(et donc A s'obtient en ajoutant une équation d'Eisenstein à W(k))

Exemple: si k=F_q, W(k)=Z_q et A est est un Z_q module libre de rang e,
donc Z_p module libre de rang ef où q=p^f.

Déf: A p-anneau si A un anneau séparé complet pour a_i=p^i, d'anneau
résiduel k=A/p anneau parfait de carac p, et A est un p-anneau strict si de
plus p non diviseur de 0 dans A. Alors il existe un système de rep
multiplicatif f:k->A par la Prop 8 et tout élément s'écrit uniquement de la
forme a=\sum f(α_i) p^i.

Zhat[X_i^{p^-\infty}] est un p-anneau strict universel (il encode la
multiplication dans le développement de a plus haut), les X_i étant des
représentants multiplicatifs.

Th:
- Si k anneau parfait de carac p, il existe un unique p-anneau strict W(k)
  d'anneau résiduel k
- Si A et A' des p-anneaux d'anneaux résiduels k et k', et A strict, tout
  morphisme k->k' se lifte uniquement en A->A'.
Th: On a W_n schéma affine et de type fini sur Z, W_n(A) dont la limite
projective et W(A), l'anneau des vecteurs de Witt. Si k parfait de carac p,
W(k) est bien un p-anneau strict (de corps résiduel k).

Invariants
==========

Invariants d'un groupe fini
---------------------------

Prop: A intègre, K=Frac A, L/K ext algébrique
B cloture intégrale de A dans L.
Si x \in L, x s'écrit b/a, b \in B, a  \in A.
Donc toute partie gén (resp libre) de B/A est gén (resp libre) dans L/K
 (car B est intègre donc sans A-torsion)

Th: B anneau commutatif intègre, G gpe d'auto fini de B.
L=Frac B, A=B^G, K=Frac A.
Alors:
- K=L^G, ie L/K Galois de groupe G.
- x \in L s'écrit b/a, b \in B, a  \in A.
- B int clos => A aussi.

Algèbres de polynômes
---------------------

Th (Chevalley): Soit S une k-alg de polynômes, R \subset S sous-alg graduée
telle que S/R admette une base finie formée d'éléments homogènes.
Alors R est une k-alg de polynômes.

Cor: R est une algèbre de polynômes <=> S/R libre [d'éléments homogènes?]
Pr: <= Par Chevalley
    => Si R est une alg de polynôme, par régularité de R et comme S est
    Cohen-Macauley, S est libre sur R.

Soit S=k[X_1,...,X_n] une algèbre de polynômes, X_i homogène de deg d_i>0
Soit R=k[Y_1,...Y_n] \subset S, Y_i homogène de deg e_i.
Si Y_i alg libre alors e_i >= d_i.
On a (i) S/R entier
  <=> (ii) S/R fini
  <=> (iii) L'idéal (Y_1, ..., Y_n) de S est de codimension (vectorielle) finie dans S
  <=> (iv) pour toute extension K de k, il y a qu'un nombre finis de
  solutions Y_i(x)=0 (il suffit de le vérifier pour kbar)
  <=> (v) (0,...,0) est l'unique solution commune des Y_i
Ds ce cas les Y_i sont alg libres, et S/R est libre de rang \prod e_i/\prod d_i.
On dit que les Y_i sont un système de paramètres de S/R.

Pr: Les équivalences viennent de Nakayama gradué, et la conséquence que S/R
est libre vient du corollaire au théorème de Chevalley. Si le système est
fini, comme il est homogène seul (0,...0) est solution.

Ex: Si G groupe fini d'auto de S, Y_i \in S^G homogènes de deg > 0, alors
S^G=k[Y_i] ssi # G=\prod e_i/\prod d_i et S/R entier.
On peut montrer que S^G est une alg de polynômes ssi G est un groupe de
réflexion complexe.

Th: Nakayama gradué
A k-alg graduée, M A-module gradué. M fini <=> M/A+M k-ev fini.
M A-module gradué libre fini => M admet une base homogène

Remarque:
Soit A une k-alg de type fini, intègre. Par normalisation, \exists X_i (i<=n)
A/k[X_i] entière. Alors K=Frac(A) / k(X_i) algébrique, donc X_i base de
transcendance.
Donc - si Y_i (i<=r) alg ind, r<=n. Si r=n, K/k(Y_i) entière
(Attention, A/k[Y_i] n'est pas forcément entière, ex A=S et on prend Y_i alg
ind, \prod d_i ne divise pas \prod e_i).
     - si A/k[Y_i] (i<=r) entier, r>=n. Si r=n, Y_i alg libres

Groupes de reflexion complexes
------------------------------

Soit G \subset GL(V) fini, V=Spec S (S=algèbre de polynômes)
V/G \iso Spec S^G
Th: G roupe de réflexion complexe <=> V/G \iso V (ie S^G alg de polynômes)
                                  <=> V/G est lisse
En général, S^G est entier sur k[f_1,...,f_n] (avec f_i homogènes) par
normalisation de Noether, et comme S^G est Cohen-Macauley S^G est même
libre sur k[f_1,...,f_n]

Série de Poincarré
------------------
A k-alg graduée de type fini, engendrée par x_1,...,x_n de deg d_i.
M A-module gradué fini.
Alors P_M=f(t)/[(1-t^d_1)...(1-t^d_n)] où f \in Z[t].

Molien
------
La série de Poincaré de S^G est donnée par
1/|G| \sum_g \dét(1-gt|V)^{-1}

Si on écrit S^G = \sommetens_i=1^s k[f_1,...,f_n]\alpha_i
où deg f_i=d_i, deg \alpha_i=e_i, on suppose \prod d_i minimal,
alors la série de Poincaré de S^G est donnée par
[t^e_1+...+t^e_s]/[\prod (1-t^d_i)]
En développant en t=1 on trouve |G|=d_1 ... d_n /s
On a s=1 <=> |G|=d_1...d_n <=> S^G=k[f_1,...,f_n]<=>G groupe de réflexions
complexes.

forum
-----
sciences.maths.avancees               Message  1297
Auteur: Dam's (robert)
-Sujet: systemes de parametres

Soit S=k[x_1, ...,x_r] un anneau de polynomes où les x_i sont
algébriquement indépendants homogènes de degré d_i.

Soit y_1, ... y_r dans S homogènes de degré e_i, et R=k[y_1, ... y_r]. On
dit que les y_i forment un système de paramètres de S si S/R est entier.
Dans ce cas (en passant au corps des fractions, on voit qu'ils forment
une base de transcendance) ils sont algébriquement indépendants, et comme
S est de cohen-macauley, S/R est libre. Un calcul avec les séries de
Poincarré nous donne que le rang de S/R est e_1...e_r/d_1...d_r.

Tant que j'y suis à blablater sur le sujet, on peut caractériser les
systèmes de paramètres ainsi:
- l'idéal qu'ils engendrent dans S est de codimension finie
  (par nakayma gradué)

(ou)

- (0,...0) est leur unique racine commune dans une cloture algébrique K
  de k
  (en effet, S/m est fini ssi la variété associée est finie).

Est-ce qu'on a une réciproque?

C'est à dire si je prends y_1,... y_r homogènes algébriquement
indépendants de degré e_i, des considérations élémentaires nous montrent
déjà que d_i <= e_i (je suppose que les degrés sont ordonnés). Pour que
les y_i soient un système de paramètres, d'après le début il faut que le
produit des d_i divise le produit des e_i. Est-ce une condition
suffisante?

En particulier, dans le cas où les d_i sont égaux aux e_i, est-ce que
R=S?

Nakayama
========

cf https://mathoverflow.net/questions/32133/expressing-adja-as-a-polynomial-in-a
Proposition 2.4. in Atiyah-Macdonald, http://www.math.toronto.edu/jcarlson/A--M.pdf
Si f un endo de M, un A-module fini, alors on a Cayley-Hamilton: det(X-A)(A)=0
Donc si f(M) \subset IM, on a un polynôme annulateur de f
f^n+a_1 f^{n-1} + ... a_n où les a_i sont dans A.

Cor: 
- si IM=M, il existe x=1 mod I tel que xM=0
- si IM=M et I dans l'idéal de Jacobson de A, M=0

