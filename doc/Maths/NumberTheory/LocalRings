vim: ft=markdownlight fdm=expr

Structure de Z/p^nZ
===================

Théorème:
1->U_1->Z/p^kZ*->Z/pZ*->1 où U_n={x = 1 mod p^n}=1+p^nZ/p^k.
1) On a une filtration {1}=U_k \subset U_{k-1} \subset ... \subset U_1
   avec U_n/U_{n+1} \iso Z/pZ via
   1+a p^n mod p^{n+1} \mapsto a.
2) On a une section de Z/pZ* donné par les racines de x^{p-1}-1 dans Z/p^kZ.
   (par Hensel il y en a exactement p-1)
3) Si x \in U_n \ U_{n+1} (ie si c'est un générateur de U_n/U_{n+1}
   alors x^p \in U_{n+1}\U_{n+2}
   [sauf si p=2 où ça ne marche que pour n \geq 2]

   Corollaire: si p\geq 3, U_1 est cyclique d'ordre p^{k-1} engendré par 1+p.
     donc Z/p^kZ*=Z/(p-1)ZxZ/p^{k-1}Z
   Si p=2, U_2 cyclique d'ordre p^{k-2} engendré par 5 et U1={1,-1}xU2
     donc Z/2^kZ*=Z/2ZxZ/p^{k-2}Z

   => Pour trouver un générateur $g$ de (Z/p^nZ)* il suffit qu'il soit
   d'ordre multiplicatif (p-1)p mod p^2, ou même d'ordre p-1 mod p et
   g^{p-1} \ne 1 mod p^2.

4) En fait on a plus généralement
   si log(x) = (x-1) - (x-1)²/2 + (x-1)³/3 -... (tous les termes deviennent
   nuls à partir d'un certain point) que log induit un isomorphisme entre
   U_1 et p\Z/p^n\Z
   de réciproque exp(t)= + t + t²/2 + t³/6 + ... (de nouveau, tous les
   termes sont nuls à partir d'un certain point ; je rappelle que t est
   divisible par p)

   => Pour trouver un générateur x de U_1 il faut que log(x) soit
   générateur de p\Z/p^n\Z, ie v_p(log(x))=1. Or v_p(log(1+x))=v_p(x) dès
   que v_p(x)>0.

## Z_p

Z_p=lim proj Z/p^nZ
Z^=lim proj Z/nZ = \prod_p Z_p
Z(p^\infty)=lim ind Z/p^nZ

On a Z(p^\infty)=Q_p/Z_p=Z[1/p]/Z
De plus si A=Q/Z, A[p]=1/pZ/Z et donc le "module de Tate" T_pA=\Z_p
et la limite injective lim A[p^n] est Z(p^\infty)

Anneaux Finis
=============

Cf Algebraic Shift Register Sequence

R anneau fini => Artinien => R= \prod R_p
on peut donc supposer R local, d'idéal max m

Soit \mu l'application R->F=R/m
Déf: f(x) \in R[x] est régulier ss'il n'est pas diviseur de zéro ssi \mu(f)
\ne 0.
     Si f(x) est régulier et \mu(f) irréductible, alors
     R[x]/(f^n) est un anneau local, d'idéal max m[x]+(f)
     et de corps résiduel F[x]/\mu(f)
     [On dit que f est un irréductible de base]

Hensel: si f régulier et xbar racine simple de \mu(f), alors il existe un
lift de xbar dans R racine de f.

Théorème:
- m contient les non unités de R
- il existe n tel que m^n=0 (en effet R est de dim 0 donc m est l'unique
  idéal premier, donc le nilradical est m)
- R*=F* \times (1+m)
  où F* est de card q-1 et (1+m) de card q^j
  De plus la projection R*->F* splite (en tant que morphisme commutatif)
  et la section $i$ est donnée par les x \in R / x^{q-1}=1

Exemple: 
- R=Z/(p^m), alors l'exponentielle réalise un isomorphisme entre
  Z/(p^{m-1}) et 1+m quand p>2
- R=F[x]/(x^m)
  Ici l'iso R*=F* \times (1+m) est simplement
  a+xh(x) -> (a, 1+x h(x))

Théorème: soit R=F[x]/(f^m) avec f irréductible, \mu: F->K=F[x]/(f).
  Alors \mu splitte (en tant que morphisme d'anneau) de manière unique, et
  si \phi est le splitting \phi: K->R et que l'on pose \phi(y)=f alors
  \phi: K[y]/(y^m) \iso R.

Égale caractéristique:
- R est de carac p^e, F de carac p.
  Lemme: la section i:F->R (étendue de F*->R* par i(0)=0) est un morphisme d'anneau ssi e=1 ssi R=F[x_1,...,x_r]/I (où I est un idéal contenant tous les monomes de degré supérieur à un N)

Prop (divisibilité)
- f=\sum a_i X^i \in R[x] est une unité <=> \mu(f)  \in F[x] est une unité
  <=> a_0 est une unité et les a_i sont nilpotents
- f est nilpotent <=> \mu(f)=0 <=> a_i nilpotents <=> f diviseur de zéro
  <=> il existe a \in R / a f= 0
- f régulier <=> \mu(f) \ne 0 <=> un des a_i est une unité
- f et g sont premiers entre eux ssi \mu(f) et \mu(g) le sont
- si \mu(f) irréd, f est irréd. Si f irréd alors \mu(f)=ag^n où a\in F et g
  \in F[x] pol unitaire irréductible
- Division euclidienne: f=gq+r avec deg r<deg g
- Si f et g sont unitaires réguliers et (f)=(g) alors f=g.
- f est un élément primaire (ie (f) is a primary ideal) ssi
  f=ug^n+h avec u \in R[x] unité, g irréductible de base et h \in m[x]
- Si f est régulier f=\prod g_i, g_i réguliers primaires premiers entre eux
  et la décomp est unique

Galois theory
--------------

S/R extension, Gal(S/R)=Aut_R(S).
- S/R non ramifiée ssi M=mS (où M idéal max de S)
- S/R Galoisienne si non ramifiée et R=S^G
  [remarque: S^G est toujours une R-algèbre locale d'idéal max S^G \cap M]

Ex: si f \in R[x] irréductible basique, alors S=R[x]/(f^m) est une
extension de R, non ramifiée ssi m=1.

Théorème: R anneau local fini. Alors toute extension non ramifiée S/R est
une extension Galoisienne, et Gal(S/R) \iso Gal(K/F) où K=S/M et F=R/m.
S est de la forme S=R[h] (pour un h \in S), et Gal(S/R) est engendré par
h->h^q (q=#F). f(x)=\prod (X-h_i) (h_i conjugués de h) est dans R[x], c'est
un pol irréductible basique de degré d=#Gal(S/R), et S \iso R[x]/(f), h <-x
Donc S=R^d (en tant que R-module), S est un corps ssi R est un corps, et si
g est un autre poly irréductible basique de degré d de R[x] alors
S \iso R[x]/g(x), en particulier g splitte complétement dans S.
Il y a bijection entre les extensions Galoisiennes de R inclues dans S,
et les extensions Galoisiennes de F inclues dans K (ie les extensions de
corps car F est un corps fini), et les sous-groupes de Gal(S/R)=Gal(K/F).

Corollaire: si S/R est une extension non ramifiée de degré d, f(x) \in R[x]
un pol irréductible basique de degré d, \alpha une racine de f dans S (f
splitte complètement dans S), alors une base de S/R est donnée par
{1,\alpha, ...,\alpha^{d-1}); de plus \alpha est inversible dans S.

Prop: Tr_S/R(a)=\sum \sigma_i(a) = Trace matrice multiplication par a
      N_S/R(a)=\prod \sigma_i(a) = dét matrice multiplication par a
      La trace est surjective, et Hilbert 90 s'applique.

Th: soit L:S->R une application R-linéaire, S/R ext non ramifiée.
    Alors L(M^i) \subset m^i donc L induit Lbar: K->F.
    - L surjectif ssi Lbar surjectif
    - Dans ce cas L(M^i)=m^i, L(ab) est une appli bilinéaire non
      dégénérée.
    - Il existe b \in S tel que L(a)=Tr(ba), et b inversible <=> L surjective.

Prop [Polynomes primitifs]: Si f pol irréductible basique de degré d,
S=R[x]/f(x), et si \mu(f) est primitif, et alpha racine de f, alors
{1, \alpha, ..., \alpha^{q-2}} forment des éléments distincts, ou q=#K=S/M.
Les racines de f sont dans i(K*) ssi f | x^q-1. Dans ce cas
i(K*)={1, \alpha, ..., \alpha^{q-2}}.

Exemple: GF(p^n,d)=(Z/p^nZ)[x]/f(x) où f unitaire de deg d et f mod p est
irréductible.
Les sous-anneaux sont les GF(p^n,e) avec e | d, les quotients sont les
(Z/p^mZ)[x]/f(x) avec m < n.
GF(p^n,d)*=i(K*)x(1+M) avec 1+m \iso (Z/p^{n-1}Z)^d si p>2.

Hensel lift
===========

https://en.wikipedia.org/wiki/Hensel's_lemma

Si f(r)=0 mod p^n et f'(r) \ne 0 mod p, on peut lifter r p-adiquement.
Plus généralement, on peut lifter dès que
  |f(r)|p < |f′(r)|p^2
Ie si f'(r) \ne 0 mod p^{n+1}, il nous faut une racine de r mod p^{2n+1}.

Cas multivarié
--------------

Theorem: Let A be a commutative ring that is complete with respect to an ideal m ⊂ A and fi(x) ∈ A[x1, …, xn] for i = 1,...,n be a system of n polynomials in n variables over A. Let f = (f1,...,fn), viewed as a mapping from An to An, and let Jf(x) be the Jacobian matrix of f. Suppose some a = (a1, …, an) ∈ An is an approximate solution to f = 0 in the sense that

    fi(a) ≡ 0 mod (det Jf(a))^2 m

Then there is some b = (b1, …, bn) in An satisfying f(b) = 0, i.e.,
    fi(b) = 0 for all i,
and furthermore this solution is "close" to a in the sense that
    bi ≡ ai mod Jf(a)m.

As a special case, if fi(a) ≡ 0 mod m for all i and det Jf(a) is a unit in A then there is a solution to f(b) = 0 with bi ≡ ai mod m for all i.

Hensel et factorisation
-----------------------

http://www.mpi-inf.mpg.de/~csaha/lectures/lec12.pdf

Théorème 7.18 d'Eisenbud:
si f(x)=g_1(x) g_2(x) avec <g_1,g_2>=1, et g_1 unitaire, alors
F(x)=G_1(x) G_2(x) avec G_1 unitaire (de manière unique)
[et si je comprends bien le papier ci-dessus, g_1 unitaire c'est juste pour
imposer l'unicité]

Newton polygons
---------------

https://en.wikipedia.org/wiki/Newton_polygon
Polytope autour de $(i, v(a_i)$
Si les pentes sont \mu_i de longueur \lambda_i (projetées sur Ox), il y a
\lambda_i racines de valuation -\mu_i

Preuves:
- https://math.stackexchange.com/questions/1671738/explaining-newton-polygon-in-elementary-way/1678839
  The point is the following : if Q1,…,Qr∈Q[X] are pure (ie only one
  slope), with increasing slopes, then the Newton polygon of P=∏Qi is the
  concatenation of the Newton polygon of the Qi, meaning that if Qi has
  degree di and its Newton polygon has slope si, then the Newton polygon is
  made of a segment of length d1 and slope s1, followed by a segment of
  length d2 and slope s2 etc. 
- http://www.math.umn.edu/~garrett/m/number_theory/newton_polygon.pdf
(+factorisation: the polynomial f factors over k into polynomials f_i of degrees d_i , where all roots of f_i have ord −m_i . Let m_i = a_i /d_i , if a_i is relatively prime to d_i then f_i is irreducible over k and any root of f_i generates a totally ramified extension of k
Application: le polynome de Laguerre est irréductible, et à groupe de
Galois S_n: https://mattbakerblog.wordpress.com/2014/05/02/newton-polygons-and-galois-groups/)

Genre d'une courbe:
https://mathoverflow.net/questions/16615/calculating-the-genus-of-a-curve-using-the-newton-polygon
Given a plane affine curve ∑i,j ai,j X^iY^j=0, its genus can be calculated as the number of integral points of the interior of the convex hull of {(i,j)∣ai,j≠0}. (claimed here: http://lamington.wordpress.com/2009/09/23/how-to-see-the-genus/)

Puiseux series
--------------
https://en.wikipedia.org/wiki/Puiseux_series
k<<x>>=lim k((x^{1/d})) est la cloture algébrique de k((x)) pour k de car 0

http://www.risc.jku.at/education/courses/ss2017/caag/09-puiseux.pdf
Pour trouver une paramétrisation de F(X,Y)=0,
on construit le polygone de Newton Oxy pour la valuation v_0, les pentes nous
donnent alors -1/d.
On cherche donc Y=c_1 x^\gamma_1 + ... où -\gamma_1 est une des pentes
et on substitue F(X,Y)=0. Les termes de plus petit degré sont donnés par
les points du polygone de Newton sur la ligne que l'on a choisit; le degré
en x est égal à l'ordonnée de l'intersection de la ligne avec l'axe vertical
Ox. On résout les valeurs possibles de c_1, et on itère (en cherchant
\gamma_2 > \gamma_1).

(D'autres exemples ici: https://arxiv.org/abs/0807.4674
 How to Compute a Puiseux Expansion)

Déf: An equivalence class of irreducible local parametrizations of the algebraic curve C is called a place of C. The common center of the local parametrizations is the center of the place.
Theorem: Let f (x, y) be a polynomial in K[x,y], and let C be the curve defined by f. To each root Y(x) ∈ K≪x≫ of f(x,y) = 0 with ord(Y) > 0 there corresponds a unique place of C with center at the origin. Conversely, to each place (X(t) ,Y(t)) of C with center at the origin there correspond ord(X) roots of f(x,y) = 0 , each of order greater than zero.
The solutions of f(x,y) of order 0 correspond to places with center on the y-axis (but different from the origin), and the solutions of negative order correpond to places at infinity.
