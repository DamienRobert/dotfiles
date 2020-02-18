vim: ft=markdownlight fdm=expr

Références:
- https://www.jmilne.org/math/CourseNotes/CFT.pdf
  Class Field Theory J.S. Milne
- http://www-math.mit.edu/~poonen/papers/cft.pdf
  A  BRIEF  SUMMARY  OF  THE  STATEMENTS  OF  CLASS FIELD THEORY BJORN POONEN
- https://projecteuclid.org/download/pdf_1/euclid.rmjm/1250128658
  CLASS  FIELD  THEORY  SUMMARIZED  DENNIS  GARBANATI
- https://en.wikipedia.org/wiki/Artin_reciprocity_law

Adeles
======

* https://en.wikipedia.org/wiki/Adele_ring
* Adèles
A_K = prod_restreint^{O_v} K_v
      {x_v \in K_v} où presque tout x_v est dans O_v
      muni de la topologie restreinte (ie les rectanges sont de la forme
      O_v pour presque tout v), c'est un groupe loc. compact.
K \subset A_K est discret et cocompact.

Exemple: A_Z = Zhat x R
         A_Q = A_Z \tens Q
         A_L = A_K \tens_K L (isomorphismes topologique)
On a A_L = prod_restreint^{O_L,v}_{v place de K} L_v

* Idèles:
I_K = A*_K le groupe des unités, muni de la topologie rendant
x->1/x continu (c'est donc une topologie moins finie que la topologie
restreinte), ie muni de la topologie induite par
A*_K -> A_K x A_K, x -> (x, 1/x).

I_K = prod_restreint^{O_v*} K_v*, groupe loc compact, K* sous-groupe
discret dedans. En fait on a même K* \subset A_K,1 (les adèles de valeur
absolue 1, qui a la même topologie vu dans I_K ou dans A_K). K* est discret
cocompact dans A_K,1. On en déduit, suivant l'image de la valeur absolue
dans [0, \infty[:
I_K ≅ A_K,1×Z (K de car > 0)
I_K ≅ A_K,1×M, where M closed subgroup of I_K iso to R^{>0} (K de car 0).

Exemple: A_Q,1/Q =~ Zhat*.
         I_Q =~ A_Q,1 x [0, \infty]
         A_Q,1 = I_Q^fin x {-1,1}

* Groupe de classes
For an algebraic number field K , we define C_K,fin := I_K,fin/K*.
C_K = I_K/K* = A_K,1 / K* x N (où N = Z ou [0, \infty[)

    J_K ≅ I_K,fin / O^*  where J_K = fractional ideals of K
    Cl_K ≅ C_K,fin / O^*K*
    Cl_K ≅ C_K / (O^*×∏_v∣∞ K_v*)K*.

* Applications:
- |Cl_K|<\infty
  Preuve: Cl_K est discret et l'image de A_K,1/K* qui est compact.
- Group of units and Dirichlet's unit theorem
  Soit E(P)=K(P)^×, where K(P):= K∩(∏_v∈P K_v × ∏_v∉P O_v) où P est un ensemble fini de places contenant les places infinies.
  Soit F:={ξ∈K : |ξ|_v ≤ 1  for all places v of K} = {ξ∈K:|ξ|_v = 1
  for all places  v of K } ∪ { 0 } et E=F\{0} \subset E(P).
  - Alors E est un groupe fini cyclique, égal aux racines de l'unité de K.
  - E(P) is the direct product of the group E and a group being isomorphic to Z^s. We note, that s = 0 if P = ∅ and that s = |P|−1 if P ≠ ∅.
  En particulier, si P=P_infty est égal aux r+s places à l'infini, alors
  E(P)=O* et on retrouve le théroème de Dirichlet.
- Strong approximation theorem: si v est une place de K, alors K est dense
  dans prod_restreint^{O_W}_{w \ne v} K_w
  En particulier si on se fixe un nombre fini de places, on a un x dans K
  qui approxime x_v dans K_v.

* Principe local global
- Minkowski-Hasse: A quadratic form on the global field K is zero, if and only if, the quadratic form is zero in each completion K_v.

Corps de classe local
=====================

* http://en.wikipedia.org/wiki/Local_class_field_theory
* http://www-math.mit.edu/~poonen/papers/cft.pdf

* Groupe pro-fini:
si G est un groupe topologique, on peut considérer Ghat sa complétion
profinie. Les sous-groupes ouverts d'indices finis de G sont en bijection
avec ceux de Ghat (donc pour la théorie de Galois c'est pareil d'utiliser G
ou Ghat).

* K local
Le morphisme θ d'Artin est un iso de Khat* sur Gal(K^ab/K).
Si K archimédien, θ(K) est surjectif et a pour noyau la composante connexe
de 1.
Sinon θ est injectif sur K.
On a 0 ->      O* ->               K*     -v>         Z -> 0
               ||                  |                  |
     0 -> Gal(K^ab/K^unr) -> Gal(K^ab/K) -res> Gal(K^unr/K) -> 0
où via l'iso Gal(K^unr/K)=Gal(k^s/k)=Zhat, la flêche
Z --> Gal(K^unr/K) devient l'inclusion Z \subset Zhat
ie l'image de K* sont les σ induisant une puissance entière (plutôt que
dans Zhat) du Frobenius sur le corps résiduel. La ligne du bas est
simplement la complétion profinie de la ligne du haut.

θ(O*) est le groupe d'inertie, et la décomposition en sous-groupes
de ramification (indice en haut) est donnée par O*, 1+pfrac, 1+pfrac^2,
1+pfrac^3...

* Fonctorialité: si L/K, alors Gal(L^ab/L) -res> Gal(K^ab/K) est donnée par N_{L/K}: L*->K* (en effet, N_{L/K} se factorise par L^ab).

Réciproquement, un sous-groupe ouvert d'indice fini de K* est de la forme
N_{L/K}(L*) avec L/K abélien, et Gal(L/K)=K*/N(L*), O_L* s'envoie sur I_L/K
et π_L sur un Frobenius.

* Résumé:
L/K ext abélienne finie
Loi de réciprocité induit une bijection de K*/N(L*)=Gal(L/K)
Plus généralement si L/K fini on a K*/N(L*)=Gal(L/K)^ab
et donc globalement on a en recollant au niveau des idèles
CC_K/N_{L/K}(CC_L)=Gal(L/K)^ab

Corps de classe global
======================

Version idélique
-----------------

* http://www.madore.org/~david/weblog/d.2014-05-19.2202.corps-de-classes.html
sur le role des idèles diagonales
* http://www-math.mit.edu/~poonen/papers/cft.pdf

* K Global
C_K = A_K* / K* (K* étant vu comme sous-groupe discret des idèles A_K*,
attention le quotient n'est pas compact) et le morphisme d'Artin
θ: C_K -> Gal(K^ab/K) induit un iso sur la complétion profinie Chat_K.

- Si K corps de nombre, θ est surjectif et son noyau est la composante de
  l'identité de C_K
- Si K corps de fonction (ie ext finie de F_p(t)), θ est injective et son
  image est donnée par les σ induisant une puissance entière du Frobenius
  sur k^s/k.

* Fonctorialité: Si L/K, alors Gal(L^ab/L) -res> Gal(K^ab/K) est donnée par N_{L/K}: C_L->C_K

Réciproquement: un sous-groupe ouvert d'indice fini de C_K est de la forme
N(C_L) où L/K abélien, et Gal(L/K)=C_K/N(C_L).

Lien local global
-----------------

La composée K_v* --> A_K* ->> C_K est injective. Le diagramme suivant est
commutatif:
  K_v* - θ_v -> Gal(K_v^ab/K)
   |                  | res
  C_K     - θ ->  Gal(K^ab/K)
donc θ induit θ_v.

Réciproquement si L/K est fini, on peut définir A*_K -> Gal(L/K)
                                                (a_v) -> ∏ θ_v(a_v)
et passer à la limite pour obtenir A*_K -> Gal(K^ab/K), la réciprocité
d'Artin adélique dit que K* est dans le noyau, d'où θ: C_K -> Gal(K^ab/K).

Rayons
------

Si m est un module, on peut lui associer le sous-groupe U_m=∏ U_m,v par
U_m,v=1+pfrac_v^m_v   Note: Um,v=O_v* si m_v=0
et si v est une place réelle, U_m,v=R*=K_v* si m_v=0
                              U_m,v=R+ \subset K_v* si m_v=1
Alors l'image de U_m dans C_K est ouverte d'indice fini, d'où un corps
R_m le ray class field de module m, dont le groupe de Galois est le ray
class group C_K/U_m = A*_K / (K* U_m).

Tout sous groupe ouvert d'indice fini de C_K contient un U_m, donc tout L/K
abélien est dans un R_m.

Théorie du corps de classe via les idéaux
-----------------------------------------

Cl_m(O_K)=I_m/P_m où I_m={idéaux premiers à m}     =~ C_K/U_m
                     P_m={a \in K*/ a = 1 mod* m}
(Rem: a=1 mod* m signifie a=u/v avec u=v mod m et u, v premiers à m
ou encore a-1 est de valuation m_v pour toute les places v / m_v>0.)

Si L/K ext abélienne et m contient les places ramifiées, alors on a le morphisme d'Artin Θ: I_m -> Gal(L/K), qui envoit pfrac sur Frob_pfrac.

Réciprocité d'Artin: il existe un module m tel que P_m \subset Ker Θ
    On a alors H=N_{L/K}(I_L(m)) P_K,1(m)
Existence: si P_m \subset H \subset I_m, il existe L/K abelienne non
ramifiée en dehors de supp m telle que Ker Θ = H.

Preuve: on a A*_K ->> I:=I_1 (donnée par v: K_v* ->> Z), de noyau U_1.
D'où A*_K/U_1 =~ I, et donc en divisant par K*: C_K/U_1 =~ I/P = Cl(O_K).
Pour un module m quelconque, on a A^m_K ->> I_m de noyau U_m, ie
A^m_K/U_m =~ I_m où A^m_K = {a \in A*_K, a_v \in U_m,v si m_v > 0}.
Si K^m=A^m_K \cap K*, on obtient A_K^m/U_m K^m =~ I_m / P_m
mais comme A*_K=A^m_K K^* on a A_K^m/K^m =~ A*_K/K*=C_K, d'où
C_K/U_m =~ I_m/P_m=Cl_m(O_K).

### Cox

Réf: Cox: on primes of the form x^2+ny^2 p.159

Module m=\prod p^n_p où le produit est fini et
- n_p=0 sur les places à l'infini
- n_p<=1 sur les places réelles
Ie m=m_0 m_infini avec m_infini un produit de places réelles distinctes

I_K(m)=idéaux fractionnaires premiers à m
P_K,1(m)=idéaux principaux aO_K ou a=1 mod m_0 et v(a)>0 aux places réelles
de m_infini.
P_K,1(m) est d'indice fini dans I_K(m), un groupe de congruence est un
groupe P_K,1(m)\subset H \subset I_K(m); I_K(m)/H est un groupe de classe
généralisé.

Ex: pour un corps quadratique imaginaire, m=m_0, O conducteur d'ordre m
H=P_K,Z(m) (ie les élements congru à a mod m_0, a premier à m),
le groupe de classe est le groupe de Picard de O.

#### Réciprocité d'Artin

Soit L/K une extension abélienne non ramifiée en dehors de m.
Le symbole d'Artin (L/K, p) \in Gal(L,K) [normalement le Frobenius est
défini à conjugaison près sur un idéal premier non ramifié, mais on est
abélien là...] s'étend multiplicativement en (L/K,I), d'où un morphisme
Phi_m: I_K(m)->Gal(L/K).

Théorème 8.2:
- Phi_m est surjectif [cf Cebotarev on a une densité 1/Gal(L/K) pour que
  l'image d'un premier soit un élément donné du groupe de Galois]
- Le noyau H de Ker Phi est un groupe de congruence si les exposants de m
  sont assez grand, ie Gal(L/K) est un groupe de classe.
  [dans ce cas on a même H=N_{L/K}(I_L(m)) P_K,1(m) cf (8.21) p. 173]

Théorème 8.5:
- il existe un plus petit module f(L/K) (le conducteur de l'extension) qui
  satisfait le th 8.2. En particulier une place est ramifiée ssi elle
  divise f, et un module m du théorème 8.2 est telle que Ker Phi_m est un
  groupe de congruence ssi f \mid m.
  Il suffit de le définir comme le pgcd des modules m tels que L soit
  inclus dans le ray class field de rayon m.

[cf Exo 9.20, le ring class field d'un ordre quadratique imaginaire O de
conducteur f est (f/2)O_K si f=2f', f' impair et 2 splitte complétement
dans O_K; et fO_K sinon [avec les exceptions dégénérées ou le conducteur
est O_K quand f=2 ou 3 et K=Q(\sqrt(-3)) et f=2 avec K=Q(i)].
Autrement dit, si f=2 et 2 splitte complétement (ou un des cas dégénérés),
alors le ring class field=le corps de classe de Hilbert, ie
Pic(O)=Cl(O_K).]
[Wikipedia: http://en.wikipedia.org/wiki/Conductor_%28class_field_theory%29
le conducteur est le produit des conducteurs locaux,
où localement f(Lp/Kp) est le plus petit n tel que U^(n)=1+p^n soit inclus
dans N_{L/K}(L*)=Ker Artin Map. p est non ramifié ssi f=0, p est
modéremment ramifié ssi f=1.]
[Attention: f(L/K) \mid f(M/K) n'implique pas L \subset M
cf http://math.stackexchange.com/questions/729295/abelian-extensions-under-inclusion-and-their-conductors]

Théorème 8.6 (existence):
- Si H est un groupe de congruence pour m, il existe une extension
  abélienne L/K ramifiée exactement aux places de m tel que
  H=\Ker \Phi_m

Example: K=Q, L=Q(\zeta_m), \frak{m}=m \infinity
\Phi_m: I_Q(m)->(Z/mZ)* satisfait
\Phi_m(a/b Z)=[a]/[b] dans (Z/mZ)* (ici a/b>0 et a et b premiers à m)
montre que \ker Phi_m=P_Q,1(m)

Corollaire 8.7:
L,M ext abéliennes de K. Alors L \subset M ssi'il existe un module m
divisible par les conducteurs de L et M tel que Ker \Phi_M,m \subset Ker
\Phi_L,m.
=> Kronecker-Weber: une ext abélienne K de Q est inclus dans Q(\zeta_m), où
m \infity est divisible par le conducteur de K.

Th 8.10: le corps abélien H_K correspondant à m=1 et H=P_K est le corps des
classe de Hilbert; on a donc Cl(O_K)=Gal(H_K/K). C'est l'extension
abélienne maximale non ramifiée.
Le ray class field correspond à I_K(m)/P_K,1(m) [ex: Q(\zeta_m) est le ray
class field de module m\infity]
Le ring class field à I_K(m)/P_K,Z(m)

#### Normes et idèles

CC_K=II_K/K* (idèles sur idèles principales) est le idèle class group.
Si L/K abélien, application d'Artin \Phi_L/K: CC_K->Gal(L/K)) est continue
et surjective, dont le noyau H est un sous-groupe fermé d'indice fini de CC_K
(et réciproquement tout tel sous-groupe correspond à une extension
abélienne). Le noyau H est simplement N_{L/K}(CC_L) dans CC_K.

Conducteur
----------

* https://en.wikipedia.org/wiki/Conductor_(class_field_theory)

- Cas local:
conducteur = m_K^n où n est le plus petit entier tel que U^n=1+m^n
est inclus dans N_L/K(L*) (ie l'application d'Artin est triviale sur U^n).

Cet entier n est le plus petit entier tel que l'indice de ramification (en
haut) soit trivial, donc n=0 si L/K non ramifié, n=1 si L/K tame.

C'est aussi le ppcm des conducteurs des caractères χ de Gal(L/K):
https://en.wikipedia.org/wiki/Artin_conductor

- Cas global:
Conducteur f_L/K de L/K = plus petit m tel que θ: I_m -> Gal(L/K) se factorise
par U_m, ie tel que L \subset R_K,m, le corps de classe de rayon m.
(Plus exactement: f_L/K est le pgcd des tels m, et on vérifie qu'on a bien
L \subset R_K,f).

- Lien global/local
f_L/K = \prod_p p^{f_Lp/Kp}
=> p ramifié <=> p | f_L/K. Une place infinie v | f_L/K ssi v est réelle et
devient complexe dans L.

Applications
------------

TODO: Milne p.165 nth power Legendre symbol, weak reciprocity, strong reciprocity using the nth power Hilbert symbol from local class field theory.

* Symbole de Hilbert: https://en.wikipedia.org/wiki/Hilbert_symbol
K corps local contenant μ_n (n premier à p)
    (a, b) b^{1/n} = (a, K(b^{1/n})/K) b^{1/n}
      où a, b \in K*, (a, K(b^{1/n})/K) est le symbole d'Artin, ie
      l'élément du groupe de Galois de K(b^{1/n}) associé à a
    (ab,c) = (a,c)(b,c), (a,bc) = (a,b)(a,c), (a,b) = (b,a)^−1
    Non dégénéré
    (a,b)=1 if and only if a is a norm of an element in K(b^{1/n})
Exemple: si n=2
  (a,b)=1 si z^2=ax^2+by^2 a une solution non triviale
       =-1 sinon

Réciprocité: si K global
     ∏_p (a, b)_p = 1

Lien avec le power symbol:
  \njacobi{a}{p}=(\pi, a)_p
  où p est un idéal premier de K corps de nombre contenant μ_n (p \nmid n)
  et a est premier à p. En étendant \njacobi par multiplicativité sur les
  idéaux, et en voyant b comme un idéal principal, on peut définir
  \njacobi{a}{b} et la loi de réciprocité est
  \njacobi{a}{b}=\jacobi{b}{a} \prod_{p \mid n, \infty} (a, b)_p

* https://en.wikipedia.org/wiki/Hasse_norm_theorem
Hasse norm theorem states that if L/K is a cyclic extension of number fields, then if a nonzero element of K is a local norm everywhere, then it is a global norm

Proof: The Hasse norm theorem can be deduced from the theorem that an element of the Galois cohomology group H2(L/K) is trivial if it is trivial locally everywhere, which is in turn equivalent to the deep theorem that the first cohomology of the idele class group vanishes. This is true for all finite Galois extensions of number fields, not just cyclic ones. For cyclic extensions the group H2(L/K) is isomorphic to the Tate cohomology group H0(L/K) which describes which elements are norms, so for cyclic extensions it becomes Hasse's theorem that an element is a norm if it is a local norm everywhere. 

* https://en.wikipedia.org/wiki/Grunwald%E2%80%93Wang_theorem
A local-global principle stating that—except in some precisely defined
cases—an element x in a number field K is an nth power in K if it is an nth
power in the completion K_p for all but finitely many primes p of K.

* https://math.stackexchange.com/questions/1251609/how-does-class-field-theory-help-us-deduce-the-splitting-of-nonprincipal-prime-i
=> http://math.uga.edu/~pete/8410Chapter8.pdf

Cebotarev
=========

* http://en.wikipedia.org/wiki/Chebotaryov_density_theorem

Let L be a finite Galois extension of a number field K with Galois group G. Let X be a subset of G that is stable under conjugation. The set of primes v of K that are unramified in L and whose associated Frobenius conjugacy class Fv is contained in X has density
    #X/#G.

Cox: Théorème de Densité de Cebotarev
--------------------------------------

L/K ext Galoisienne de corps de nombre, P premier au dessus de p non ramifié.
\sigma=(L/K,P) lift du Frobenius, la classe de conjugaison de \sigma est
donnée par les (L/K, gP). Donc (L/K,p) est bien défini à conjugaison près.

Théorème 8.17:
{p premier de K, non ramifié dans L et (L/K,p) \in S} (S \subset Gal(L/K)
stable par conjugaison) a pour densité |S|/|Gal(L/K)|

Rappel: (L/K,p)=1 <=> p splitte complétement dans L, donc on a une densité
de 1/|G| de tels premiers (et ils caractérisent entièrement L):

Théorème 8.19:
  S_L/K=premiers splittant complétement.
  Si L/K et M/K sont Galoisiens, alors
- L \subset M ssi S_M/K \subset S_L/K (a un nombre fini près)
- L=M ssi S_M/K=S_L/K (a un nombre fini près, et donc on a forcément
  une vraie égalité du coup)
Plus précisément, si L/K et M/K ext finies alors
- Si M/K Galoisien, L \subset M <=> S_M/K \subset S_L/K (a un nombre fini près)
- Si L/K Galoisien, L \subset M <=> Stilde_M/K \subset S_L/K (a un nombre fini près) où Stilde_M/K=premiers p non ramifiés dans L et il existe un P au dessus de p avec f(P/p)=1.

