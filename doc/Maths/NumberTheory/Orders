vim: ft=markdownlight fdm=expr

# Dedekind domains

Rappel: Corps Locaux
A noeth int clos dans K=Frac A, L/K ext finie, B cloture intégrale.
1) Si A algèbre de type finie sur un corps ou A anneau de valuation
   discrète complet, ou L/K est séparable
   alors B/A est fini et B est de Dedekind si A l'est.
2) Plus généralement si A Dedekind alors B Dedekind 
   (même si B/A n'est pas fini, mais la preuve est plus compliquée)

## Modules over Dedekind domains

cf: Modules over Hereditary Noetherian Prime Rings (Survey), Lawrence S. Levy

By a Dedekind domain we mean a commutative noetherian integral domain R, in
which every ideal is a projective R-module. The following two theorems —
essentially due to Steinitz in 1911 — can be regarded as the ultimate
generalization of the Fundamental Theorem of Abelian Groups to finitely
generated modules over some class of commutative noetherian domains.

Theorem 1.1 (Decomposition). Let R be a Dedekind domain and M a finitely
generated R-module. Then:
(i) M = P ⊕ T
(P a projective module, T a torsion module).
(ii) T is a direct sum of uniserial modules of finite length, each isomorphic to
R/m^e for some maximal ideal m and exponent e.
(iii) There is a decomposition
(1.1.1) P ∼ H1 ⊕ . . . ⊕ Hn (each Hi an ideal != 0)
de plus la classe d'iso de P dépend uniquement de \prod H_i dans le groupe
de classe.

Cf aussi Cohen - Advanced Topics, Th 1.2.12:
- M module sur un anneau de Dedeking, M sans torsion <=> M proj
- T de torsion s'écrit \sum R/D_i avec D_i \mid D_i+1 idéaux
- I \oplus J \iso R \oplus IJ
donc si P ~ H1 \oplus ... Hn, alors
P ~ R^{n-1}+I où I~\prod H_i est la classe de Steinitz de P
P libre ssi I est principal.

## Critère de Dedekind

(à ne pas confondre avec le critère de Dedekind qui dit que si (O_K:Z[x])
n'est pas disible par p (en particulier si p^2 ne divise pas le
discriminant de x), alors on peut lire la factorisation de p dans O_K en
regardant la décomposition du pol min de x dans F_p.
cf math.stanford.edu/~conrad/154Page/handouts/dedekindcrit.pdf
  www.math.uconn.edu/~kconrad/.../dedekindf.pdf
  and "Factoring ideals after Dedekind")

Il s'agit d'un critère qui dit quand Z[x] \subset O_K est maximal
localement en p. Cf
Henri Cohen, A course in computational number theory, Th 6.1.4
http://books.google.fr/books?id=hXGr-9l1DXcC&pg=PA305&lpg=PA305&dq=dedekind+criteria&source=bl&ots=ywd5ENzIJg&sig=BG-2RDDhaN9weqU2r0NMPtbuOCo&hl=en&sa=X&ei=HjtlU6a2FOeK0AXK04HQBQ&redir_esc=y#v=onepage&q=dedekind%20criteria&f=false

## Dévissage

Cf corps locaux $7, cas L/K Galoisien
D le groupe de décomp de P/p et I le groupe d'inertie, 
K - K_D - K_I - L la décomposition en sous-corps associé.

Posons [L:K]= e0 f0 g0, et [Lbar:Kbar]=f0=f1 p^m via la décomposition
en extension inséparable d'une extension séparable:
Kbar - Lbar_separable - Lbar

- K_D/K a f=e=1, l'extension est de cardinal g (= le nombre de conjugués de P)
- K_I/K_D a e=1 et f=f1 (et le corps résiduel est Lbar_separable)
- L/K_I a e=e0 et f=p^m

Ramification modérée: http://math.stackexchange.com/questions/641186/definition-of-tame-ramification-from-the-ramification-groups
http://math.stackexchange.com/questions/293789/definition-of-tamely-ramified?rq=1

Ici on se place dans le cas A complet de valuation discrète pour parler des
groupes d'inerties:
I=G_0 \supset G_1 \supset ...
G_1 est d'indice premier à p, tandis que |G_i/G_i+1| est une puissance de p.
Ie G_1 est l'unique (car normal) p-sylow du groupe d'inertie
=> G/G_1 définit le groupe de ramification modérée; L/K est modéremment
ramifiée ssi G_1=1.
On a alors
- K_G_1/K_I a e=e1 (où e0=e1 p^n)
- L/K_G_1 a e=p^n et f=p^m

## Ext Monogène

Soit (A,m) local, B=A[X]/f
Soit f=\prod g_i^e_i dans k=A/m et g_i un relevé dans B.

Prop: les idéaux maximaux de B sont exactement les (m,g_i)

Th (tot split):
- Si A anneau de valuation discrète, f est irréductible modulo m,
  alors B est à valuation discrète d'idéal max mB et de corps résiduel
  k[X]/f de degré n, et B est de ramification 1.
  En particulier, si K=Frac A, f est irréductible dans K[X] et B est la
  fermeture intégrale de A dans L=K[X]/f.
- Réciproquement, si A est à valuation discrète, de corps de fractions K,
  L/K ext finie de degré n, B fermeture intégrale de A dans L.
  Supposons B de valuation discrète, de corps résiduel l de degré n sur k.
  Soit x \in B tel que l=k(x), et f le polynôme caractéristique de x sur K.
  Alors B est isomorphe à A[X]/f (ie B est engendrée par x).

Rappel:
Si A anneau de valuation discrète, f=X^n+\sum a_i X^i est d'Eisenstein si
f mod m = X^n et a_0 est une uniformisante.
Ie a_i \in m et a_0 \not\in m^2.

Th (ramification maximale):
- Si A est de valuation discrète, et f d'Eisenstein
  alors B est à valuation discrète d'idéal max (m,x)=(x) et de corps résiduel k,
  et B est de ramification n.
  En particulier, si K=Frac A, f est irréductible dans K[X] et B est la
  fermeture intégrale de A dans L=K[X]/f.
- Réciproquement, si A est à valuation discrète, de corps de fractions K,
  L/K ext finie de degré n, B fermeture intégrale de A dans L.
  Supposons B de valuation discrète, d'indice de ramification n sur A.
  Soit x \in B une uniformisante, et f le polynôme caractéristique de x sur K.
  Alors f est d'Eisenstein, et B est isomorphe à A[X]/f (ie B est engendrée
  par x).

Réinterprétation des deux théorèmes: 
O=A[x] est un ordre dans B, si x splitte complètement
dans O alors aussi dans B; si x est de valuation $n$ dans O (cf pol de Newton)
alors B est max ramifié.

Th: (B cloture intégrale de A dans L, L/K finie)
Supposons que B soit de valuation discrète (ex: c'est le cas si A complet),
et le corps résiduel l est séparable sur k.
Alors B est monogène sur A.

Pr:
- Si \pi est une uniformisante de B et x \in B génère l sur k, on a une
  base de B/A donnée par x^i \pi^j, i<f et j<e
- On peut trouver x tel que \pi=R(x) où R est un polynôme unitaire de degré
  f, à coefficients dans A.
[En particulier on retrouve que dans le cas totalement ramifié, B est
engendré par l'uniformisante, et dans le cas non ramifié, B est engendré
par n'importe quel générateur de l/k]

# Norme

L/K extension de corps de nombre, si x \in L, la norme N_K(x) est
- le produit des \sigma_i(x)
- le déterminant de la multiplication par x
- le coefficient constant du polynôme caractéristique de x

Si x est dans un ordre O de L, on voit en prenant pour base de L des
éléments de O que N_K(x) \in O \inter K. Via la pol car on voit que
N_K(x)=x*P(x) donc N_K(x) divise x dans O.

Pour un idéal de O_K, 
N_K(I)=<idéal engendré par les N_K(x), x \in I>
      = #(O_K/I) (plus généralement c'est le groupe de Grothendieck associé)
      = \prod \sigma_i(I) si K est galoisien (vu comme idéal sur Z via son intersection)
Attention: ceci ne marche pas pour un ordre non maximal; penser à un idéal
principal dans le conducteur, on obtiendrait la même norme que pour le cas
maximal alors que O/c est plus petit que O_K/c, ie N(I)O n'est pas {N(x), x
\in O} en général.

## Norme sur Q: indice généralisé de réseaux

http://math.stackexchange.com/questions/604050/norm-of-a-fractional-ideal-of-an-order-of-an-algebraic-number-field
  This is not really a problem about orders or fractional ideals, but about lattices. Let V be a finite-dimensional Q-vector space (such as a number field) and set n=dimQ(V). A lattice in V is a finite free Z-module in V of rank n. If V is a number field K, examples of lattices in V include any order R in K and any R-fractional ideal.
  When L and L′ are lattices in V, check their sum L+L′={x+y:x∈L,y∈L′} is a lattice. If L′⊂L, the usual index [L:L′]=|L/L′| is finite. We want to define an index [L:L′] even if L′ is not contained in L. Here's how we can do it. For any two lattices L and L′ in V, define the index [L:L′] to be the positive rational number [M:L′]/[M:L], where M is any lattice in V containing L and L′, and the numerator and denominator here are the usual notion of index (because L and L′ are contained in M).
  Exercises.
  1) Check this is independent of the choice of M and thus is well-defined. (Hint: use multiplicativity of the usual notion of index and the fact that any lattice containing L and L′ must contain L+L′.)
  2) Check this equals |L/L′| if L′⊂L.
  3) Check for any three lattices L,L′,L″ in V that [L:L″]=[L:L′][L′:L″].
  4) For any lattices L and L′ in V, and any Q-linear automorphism φ:V→V, check [L:L′]=[φ(L):φ(L′)].
  5) For any lattice L in V and Q-linear automorphism φ:V→V, check φ(L) is a lattice in V and [L:φ(L)]=|detφ|.
  6) For any lattices L and L′ in V, show there is a Q-linear automorphism φ:V→V such that φ(L)=L′, and for any such φ we have [L:L′]=|detφ|. This provides a different way of defining the index [L:L′].
  => Using V=K and considering the lattices R, I, and J, and using as φ:K→K suitable multiplication maps φ(x)=αx, you can recover the properties you want. Define N(I)=[R:I], even if I is not contained in R.

## Norme entre anneaux de Dedekind

Plus généralement (cf corps locaux) [ici A et B sont maximaux], on remplace
l'indice par \chi:
A tout A-module M de longueur finie, on associe \chi(M)=\prod A/p_i où les p_i sont les idéaux de la décomposition de Jordan Holder. Ex si A=Z, \chi(M)=#M.
Théorème:
- \chi est multiplicative: si 0->M'->M->M''->0 est exacte, \chi(M)=\chi(M')\chi(M'')
[en particulier Idéaux(A)=groupe de Grothendieck des A-modules de longueur finie]
- Si M est un B-module de longueur finie, \chi_A(M)=N_B/A \chi_B(M)
- Si M est un A-module de longueur finie, \chi_B(M \tens_A B)=\chi_A(M)B
- chi_B(B/I)=I, donc N_{B/A}(I)=chi_A(B/I)
  (ie on définit N_{B/A}(I):=\chi_A(B/I))

Pour des réseaux L_1 et L_2 de L, on définit \chi(L_1,L_2) comme \chi(L_1/L')/\chi(L_2/L') où L' est un sous-réseau inclus dans L1 et L2. Tous les points de Conrad plus haut restent valides (sauf le point 6 qui n'est valide que localement, pour que les réseaux soient libres, cf le Lemme plus bas.).

Th: (Corps Locaux, prop 2 p.58) \chi(L_1,L_2)=\chi(^L_1,^L_2) où ^L_i
dénote l'image de L_i dans K \iso \wedge^n L (où L est vu comme un K-ev de dim n), autrement dit \chi(L_1,L_2) est l'idéal fractionnaire ^L_1/^L_2.

Lemme: Soit u:A^n->A^n une application linéaire telle que dét u \ne 0 (A principal). Alors \chi(coker u)=\dét u A. (Corps Locaux, lemme 3 p. 28)
Cor: N(xB)=N_L/K(x) A (on se ramène au lemme en localisant)

Discriminant: disc_X,T=\chi(X*_T,X)=dét(T(e_i,e_j)) (si X libre)
                      =T(Lambda^n X, Lambda^n X)

# Ordres
## Réseaux et idéaux

Si I est un idéal fractionnaire de O, il est potentiellement inversible
dans son ordre associé R \supset O [et si I est inversible dans O, alors R=O].
Si I* est le dual de I pour la trace, alors I I*=R* et I*R*^{-1} est le seul
candidat pour I^{-1}. Donc I est inversible dans R si R* est inversible (ce
qui est le cas pour R monogène par exemple).
On a alors: I*=I^{-1} R*, I^{-1}=I* R*^{-1}

Lenstra (Approximating rings of integers):
  Définissons I^-1:=(O:I). I est inversible ssi I I^-1=O. Alors
  - I est inversible ssi I^-1^-1=I et R(I)=O
  - I est inversible ssi R(I^-1)=O
  [en effet on a forcément par dualité de Galois I^-1^-1^-1=I^-1 donc on applique le cas plus haut qui donne I^-1 inversible, donc I inversible]

Rem:
- si O est de Gorenstein (<=> O* est inversible) alors tout idéal I tel
  que R(I)=O est inversible dans O. C'est le cas si O est monogène.
  De plus dans ce cas, cf 'conducteur', le conducteur f satisfait f O*=O_K*
  (ie O est uniquement déterminé par son conducteur)
- mais si [K:Q]>2 il y a une infinité d'ordres R contenant un idéal I non
  inversible d'ordre R. (Si [K:Q]=2 tous les ordres sont monogènes, donc de
  Gorenstein.

### Cf les commentaires de K.Conrad:
- http://mathoverflow.net/questions/17555/alternative-proof-of-unique-factorization-for-ideals-in-a-dedekind-ring/17667#comment55473_26178

 Imaginary quadratic rings of integers are also nicer because in that case the inverse of an ideal class is the same as its complex conjugate. There's a simple proof of that fact here: math.umass.edu/~weston/oldpapers/cnf.pdf (theorem 2.13 on page 30); this is also the approach used in chapter 11 of Artin's /Algebra/. I don't know if this argument can be generalized to higher degree number fields; it seems like there would be difficulties extending this technique to non-Galois extensions of Q. –  Alison Miller May 27 '10 at 21:34

 Alison and David: the correct involution to use on ideal classes which generalizes the inverse formula to higher degree is dual lattices. If K is a number field and L is a Z-lattice in K with dual lattice L' (I mean dual w.r.t. the trace-pairing K x K ---> Q, as used in defining the different ideal for instance) then the "master formula" is LL' = R(L)', where R(L) = {x in K : xL \subset L} is the order associated to L. Now in the special case that L = Z[a], L' = (1/f'(a))Z[a] for f = min. poly. of a over Q. Passing to Z[a]-ideal classes, the eqn. LL' = R(L)' becomes [L][L'] = [1]. –  KConrad May 28 '10 at 5:22

 What's very special about the quadratic setting is that in a quadratic field all orders have the form Z[a] for some a, hence all Z-lattices L in the field are invertible fractional ideals relative to their natural associated order R(L), which is the only order w.r.t which the lattice could be an invertible fractional ideal at all. To emphasize that this is very special to the quadratic case, one can show that in every number field of degree greater than 2 there are infinitely many Z-lattices L that are not invertible as fractional R(L) ideals. :( –  KConrad May 28 '10 at 5:25

- http://mathoverflow.net/questions/137605/class-numbers-of-orders

 @DavidSpeyer: Any (full) Z-lattice in a number field is a fractional ideal for its multiplier ring, so you can always interpret the lattice as a fractional ideal for an order. –  KConrad Jul 26 '13 at 10:45

 + Donne une réponse complète dans le cas quadratique (car tout idéal fractionnaire est dans ce cas inversible pour son ordre)

- http://mathoverflow.net/questions/112250/orders-of-number-fields?rq=1

 4.) Is every ideal I of O also a proper O-ideal as is the case for the maximal order? That is, has ring of multipliers R exactly O. (The rings of multipliers R⊂K is the subring of elements α so that α⋅I⊂I). Certainly O⊂R.

 For (4): if I is an inv. frac. O-ideal then I is a proper O-ideal. To say that the inv. frac. O-ideals are the proper O-ideals is equivalent to saying the Z-dual O^∨ is an invertible fractional O-ideal. This condition on the Z-dual is satisfied if O=Z[α] for an α, which covers all quad. orders, but if [K:Q]>2 there are inf. many orders O in K containing a noninv. fractional O-ideal s.t. R=O –  KConrad Nov 13 '12 at 7:44

### Réseaux d'ordres

http://mathoverflow.net/questions/130089/orders-in-number-fields

Donne des formules pour borner le nombre d'ordres d'indices l de l'ordre
maximal.

+ reference Jos Brakenhoff's thesis:
https://openaccess.leidenuniv.nl/bitstream/handle/1887/14539/proefschrift-brakenhoff.pdf?sequence=2
-> Theorem 4.1. Let Z be a commutative ring, J ⊂ Z an ideal and A a commutative
Z-algebra. Let W be the set of sub-Z-algebras R ⊂ A with A/R ∼ Z/J as Z-modules,
which is a set of certain cocyclic subrings. Let V be the set of A-ideals I with
A/I ∼ (Z/J)^2 as Z-modules. Then the maps
f :W →V, R → {x ∈ A : xA ⊂ R}
and g:V →W: I →Z +I are well-defined and each others two-sided inverse.
-> à appliquer pour le réseau d'ordre contenant O_0.

## Morphisme de normalisation

cf http://mathoverflow.net/questions/112250/orders-of-number-fields?rq=1 again:
- ϕ:Spec O_K →Spec O n'est pas plat
  (the normalization of a ring R is never flat over R, unless R was normal
  in the first place) [mais ça sera certainement plat, et même isomorphe(?)
  en dehors du conducteur]
- Par contre elle est surjective (The map on primes is surjective - for any
  local ring of O its integral closure is a local ring of O_K), une autre
  façon de le voir est que O_K est entier sur O.
- Ce n'est pas injectif:
  To glue two primes, π1 and π2 together, consider the subring of O_K where
  the residue mod π1 equals the residue mod π2. You can do this whenever you
  can embed O_K/π1 and O_K/π2 in a common field, which you can do when they
  have the same characteristic. Then repeat this process to glue any number.
- tout idéal n'est pas généré par deux éléments comme dans le cas maximal:
  There can be at least n (and at most n since it is of rank n over Z). Take p
  a totally split prime, and consider the subring of O_K of elements that are
  in ℤ, modulo p. Then the primes lying over p glue together into a single
  prime ideal, whose local ring is the inverse image of the diagonal 𝔽p in
  the natural map ℤnp→𝔽np. If m is the maximal ideal of this local ring, then
  m/m^2=𝔽_p^n=(R/m)^n, so the ideal requires at least n generators.

Rappels: si I \subset O, alors IO_K correspond à la préimage de Var(I). Réciproquement si J \subset O_K, alors J \inter O correspond à l'image de Var(J).
Comme \phi est surjectif, PO_K \inter O = P pour P un idéal premier de O
(ou même radical), mais pas forcément pour tout idéal.
Cf le thread partant de sciences.maths:21120/21144, plus généralement un conducteur 'principal' cO_K donne un contre example: (cO)O_K \inter O=cO_K

## Conducteur

Rappels: Serre, Ch III $4

A Dedekind, B cloture dans une extension séparable L de K=Frac(A)
C \subset B ayant même corps des fractions.

Le conducteur f est
- le plus grand idéal de B inclus dans C
- l'annulateur du C-module B/C={c \in C | cb \in C \forall b}
                              ={x \in L | xB \subset C}=(C:B)
- (B*:C*) ie {x \in L/ xC* \subset B*}

Si C* est invertible (comme C-idéal fractionnaire), d'inverse c, alors
f=c D_{B/A}^{-1}, ie c=D_{B/A} f
[Pr: dans ce cas C*f=B*]

Rappels: si I a pour ordre O, on a I I*=O* et si I inversible, I I^-1=O.
Si O* est inversible d'inverse D_O, on a donc I^-1= I* D_O ou encore I*=I^-1 O*

Rem ($6)
Si L=K(x), et C=A[x], f le polynôme minimal de x, alors
- C*=1/f'(x)A[x] est un module libre de base x^i/f'(x)
- le conducteur est égal à f'(x) D_{B/A}^{-1}

Rappel ($7)
La différente D_{B/A} est l'annulateur du B-module monogène \Omega^1_A(B)

### Keith Conrad: the conductor ideal

c=Ann_O(O_K/O)=Ann_{O_K}(O_K/O)
Th: un idéal de O_K est dans O ss'il est contenu dans c

Ex: 
- O=Z+I, alors c=dZ+I où d est l'exposant de O_K/O
(en particulier d divise \# O/I=Z/(I\inter Z) Z)

- Si O=Z+cO_K (c entier positif), alors c=cO_K
[Dans ce cas, on voit que cO est invertible, mais cO_K \inter O = cO_K != cO]
Les orders quadratiques sont tous de cette forme; si O est un tel ordre c=[O_K:O]
Dans ce cas pour tout p \mid c, l'unique premier au-dessus de p est
pZ+cO_K, d'indice p dans O.

Si b est un idéal fractionaire de O, alors
b est premier à c => b est invertible => R(b)=O
[De plus si b est invertible son inverse est forcément b^{-1}=(O:b)_K
Si b < O, alors O < b^{-1}, ie il existe x \not\in O/ xb \sub O.]

Th:
1) si b est premier, ces conditions sont des équivalences ie
p est premier à c <=> p est invertible <=> R(p)=O
<=> O_p est intégralement clos (ie ici de valuation discrète)
<=> O_p=O_K,p
2) b est premier à c <=> b est produit de premiers invertibles
3) 1->O_K*/O* -> (O_K/c)*/(O/c)* -> Cl(O) -> Cl(O_K) -> 1 est exact
4) On a une bijection (multiplicative) entre les idéaux premiers à c dans O et
ceux premiers à c dans O_K [I->IO_K; J->J\inter O] et de plus O/I=O_K/J.
Cette bijection induit une bijection sur les idéaux premiers (premiers à c)
et préserve les idéaux principaux "venant de O": si b \in O est premier à
c, alors bO_K \inter O=bO.
cf p.7 pour voir des contre-exemples pour les idéaux non premiers au conducteur.

Th: dans un anneau local (domain), un idéal fractionnaire est invertible ssi il est principal. Dans un ordre, un idéal fractionnaire est invertible ssi il est localement invertible (penser à l'équation II^{-1}=O), ie si il est localement principal, ie ssi il est projectif.

Cor: Si I est un idéal de O_K tel que I\inter O soit *invertible*, alors
O/(I \inter O)=O_K/IO_K (et donc (I \inter O)O_K=I)
Pr: 
On montre que si I \inter O =(xO), alors I=xO_K:
N(x)=[O:xO]<=[O_K:I]<=[O_K: xO_K]=N(x) donc il y a bien égalité.
Pour le cas I \inter O inversible, il est localement principal et le lemme précédent s'applique.

Remarque:
O/J \inter O = O_K/J => (J \inter O) O_K = J
Pr: Si I=J \inter O, alors IO_K \inter O=I donc on a
N(I) <= N(I O_K) <= N(J) et donc on a équalité

[
- si I est invertible dans O, on n'a pas forcément O/I = O_K/IO_K, cf
  Conrad p.7., et donc pour ce I on a IO_K \inter O \ne I.
- En plus, on n'a pas forcément: O/I = O_K/IO_K => IO_K \inter O = I
  En effet, si le conducteur C=cO_K, on a O/cO = O_K/cO_K mais cO_K \inter
  O=C.
- La réciproque (J \inter O) O_K=J => O/J \inter O=O_K/J n'est pas vraie
  non plus: le conducteur c vérifie |O/c|<|O_K/c|.
-> D'ailleurs ça montre que N_O(I) n'est pas l'idéal engendré par les N(x), x
\in I, en effet pour le conducteur on obtiendrait N_O=N_OK(c). On a
seulement que N(I) divise l'idéal engendre par les N(x) en général; si
O=O_K on a égalité parce que par approximation faible on peut trouver x \in
I qui a les mêmes valuations positives. L'idéal {N(x), x \in I} est
simplement N(IO_K)).
]

Les applications F: I->IO_K et G: J->J \inter O forment une correspondance
Galoisienne. On a donc I \subset GoF(I) et J \supset FoG(I); de plus GFG=G
et FGF=F [donc GoF(I)=I ssi I=G(J), ou autrement dit F et G induisent des
bijections sur l'image de G dans l'image de F], en particulier GoF est
idempotente (croissante) et FoG est idempotente (décroissante).

Résumé:
- F et G sont des bijections sur les idéaux premiers à c, qui préservent
  les idéaux premiers et les idéaux principaux (de O)
- on a N(G(J)) <= N(J) car O/G(J) \subset O_K/J, et si on a égalité alors
  J \in Im F. C'est le cas si J est inversible. [En revanche pour F on n'a
  des contres exemples]
- comme Spec O_K->Spec O est surjective (car finie), si I est radical il
  est dans l'image de G.
- p est premier à c <=> p est invertible <=> R(p)=O <=> O_p est intégralement clos (ie ici de valuation discrète) <=> O_p=O_K,p

## Formule des classes

On a la suite exacte:
1->O*_K/O* -> (O_K/f)*/(O/f)* -> Pic(O)->Cl(K)->1
donc #Pic(O)=h_K/(O_K*:O*) * #(O_K/f)* / #(O/f)*
et (O*_K/O*)=w(O) reg(O_K) / reg(O) w(O_K) (où w(O) est le nombre de racines de l'unités)

[Pr: l'image des unités par l'application de Dedekind 1|2 * log |u_i|_j
est un réseaux de rang r=r1+r2-1 dans R^{r1+r2} de volume fondamental
Reg(O_K) \sqrt{r1+r2}.]

De plus #(O/f)* = N(f) ∏_{𝔭⊃f} (1−1/N(𝔭))

Cf Neukirch:
1) Pic(O)=\oplus P(O_p)/P(O)
2) 1->O*->O*_K-> \oplus O*_K,p/O*_p -> Pic(O)->Pic(O_K)->1
3) f={a \in O_K/ a O_K \subset O} le conducteur; p \not\mid f <=> p régulier dans O et alors pO_K est premier et O_p=(O_K)_{pO_K}
4) \oplus O*_K,p/O*_p=(O_K/f)* / (O/f)* = (Ô_K*:Ô*) [les complétés en p]
d'où 1->O*_K/O* -> (O_K/f)*/(O/f)* -> Pic(O)->Cl(K)->1
et #Pic(O)=h_K/(O_K*:O*) * #(O_K/f)* / #(O/f)*
et (O*_K/O*)=w(O) reg(O_K) / reg(O) w(O_K)

Pour la formule de la norme, #(O/f)* = N(f) ∏_{𝔭⊃f} (1−1/N(𝔭))
cf: http://mathoverflow.net/questions/32050/class-number-of-non-maximal-order-in-imaginary-quadratic-function-field

  There is a formula that works in all degrees, not just imaginary
  quadratic. In a global field K, let O be integral over Z or F[t] (F a
  finite field) and be "big", i.e., it has fraction field K. Let 𝔠 be the
  conductor ideal of O in its integral closure R. Then
      h(O)=h(R)/[R×:O×]* φR(𝔠)/φO(𝔠),
  where φO(𝔠) is the number of units in O/𝔠 and φR(𝔠) is the number of
  units in R/𝔠. This is derived in Neukirch's alg. number theory book in
  the number field case, but it goes through to any one-dimensional
  Noetherian domain with a finite residue rings and a finite class group.
  In the imag. quadratic case the unit index [R×:O×] is 1 most of the time
  so you don't notice it.

  Both φR(𝔠) and φO(𝔠) can be written in the form N(𝔠)∏𝔭⊃𝔠(1−1/N(𝔭)), where
  the ideal norm N means the index in R or O and 𝔭 runs over primes in R or
  O for the two cases.
  [Preuve: Dans le cas maximal on se ramène à c=p^n, et on a la suite exacte
   1->O_K/p -> (O_K/p^n)* -> (O_K/p^{n-1})* -> 1 qui montre que
   #(O_K/p^n)*=N(p)^{n-1}(N(p)-1)=N(p^n)(1-1/N(p))]

### The conductor square
[voir aussi GeoAlg/Schemes#Dualité]

cf Eisenbud Exo 11.15 et 11.16

Si c est le conducteur de R dans sa normalisation S
(ie l'annilateur de S/R; c'est un idéal de R mais aussi de S), alors on a
le produit fibré
R   ->  S
|       |
R/C -> S/C

Or pour un produit fibré (où R1->S est surjectif)
R->R1
|   |
R2->S
on a la suite de Mayer-Vietoris:
0->U(R)->U(R1)+U(R2)->U(S)->Pic(R)->Pic(R1)+Pic(R2)

d'où (en passant en notation O et O_K) dans ce cas
0->U(O)->U(O/c)+U(O_K)->U(O_K/c)->Pic(O)->Pic(O_K)+Pic(O_K/C)=Cl(O_K) -> 0
d'où h=h_K \phi(O_K/c) / (\phi(O/c) [O_K*:O*])

Une autre méthode est de regarder la suite exacte de faisceau et d'appliquer la cohomologie
1→O*_R->i* O*_S -> i* O*_S/O*_R ->1
cf http://mathoverflow.net/questions/137605/class-numbers-of-orders, Gene S. Kopp
