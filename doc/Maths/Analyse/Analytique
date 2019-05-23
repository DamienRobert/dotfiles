vim: ft=markdownlight fdm=expr

Holomorphie
===========

https://en.wikipedia.org/wiki/Cauchy%E2%80%93Riemann_equations
=> Cauchy–Goursat theorem

Formule de Cauchy homologique
=============================

* Homologie:

On dit qu'un cycle est homologue à 0 dans \Omega si I(\Gamma,p)=0 pour tout
p dans \C \ Omega.

Rem: deux cycles homotopes sont homologues.

* Theorème de Cauchy homologique

Si \Gamma est un cycle homologue à 0 dans \Omega, alors pour toute 1-forme
fermée w on a \int_Gamma w=0.
En particulier, si \Gamma_1 et \Gamma_2 sont homologues
\int_Gamma_1 w=\int_Gamma_2 w.

Application:
si f est holomorphe dans \Omega, fdz est fermée donc
\int_Gamma f(z)dz = 0 si \Gamma homotope à 0 dans \Omega.

Plus généralement, si a \in \Omega \ im(Gamma):
I(\Gamma,a) f(a) = 1/(2\pi i) \int_Gamma f(z)/(z-a) dz

Remarque:
- si \Gamma est homotope à un lacet constant, alors \Gamma est homologue à 0
=> formule de Cauchy homotopique.
- si \Gamma est le bord d'un compact K \subset \Omega a bord réguliers,
  alors \delta K est homologue à 0 dans \Omega.

Résidus
=======

Soit f holomorphe dans \Omega \ S, S fini. Soit \Gamma un cycle dans \Omega
\ S, \Gamma homologue à 0 dans \Omega.
Alors \int_\Gamma f(z)dz = 2i \pi\sum_{a\in S} I(\Gamma,a) Res(f,a)

Principe de l'argument
----------------------

https://en.wikipedia.org/wiki/Argument_principle

    ∮_C f′(z)/f(z)dz = 2πi (∑n(C,a)−∑n(C,b))

Soit f méromorphe sur \Omega et K \subset \Omega compact à bord régulier /
f n'ait ni pôle ni zéros sur \delta K. Alors
1/2i\pi \int_{\delta K} f'(z)/f(z) dz=nb zeros - nb poles

Interprétation: si f est holomorphe sur \Omega, alors le nombre de zéros de
f dans K est donné par
\sum I(f o \gamma_i, 0) où \delta K est paramétré par les \gamma_i.
Ainsi, le nombre de solutions de f(z)=w dans K est donné par le nombre de
fois que f(z) tourne autour de w quand z parcourt le bord de K.

Plus généralement: si f est un morphisme vers la sphère de Riemann, alors
on regarde le chemin tracé par fo\gamma. Si il ne passe pas par deux points
a et b de la sphère, on peut regarder l'indice par de fo\gamma par rapport
à l'axe définit par (ab). Alors cet indice donne le nombre de fois que f
passe par a moins le nombre de fois que f passe par b à l'intérieur de K
(en regardant l'orientation trigonométrique).

Formule de Jensen
-----------------

f analytique sur D=D(0,r) de rayon r avec des zéros en a_i (a_i \ne 0):
    log ⁡|f(0)| = ∑ log(|a_k|/r) + 1/2π ∫_0^{2π} log |f(re^{iθ})|dθ.
d'où si n(t) est le nombre de zéro dans D(0,t):
    1/2π ∫_0^{2π} log|f(re^{iθ})|dθ −log|f(0)|= ∫_0^r n(t)/t dt

Théorème de Weierstrass
=======================

Th (Weierstrass)
Si S fermé discret de \Omega. Il existe une fonction f \in H(\Omega)
s'annulant avec multiplicité m_a pour tout a \in S, et ne s'annulant pas en
dehors de S.

Plus généralement, donné f_a holomorphe dans un voisinage épointé de a, il
existe une fonction f holomorphe dans \Omega\ S telle que pour tout a \in
S, f-f_a se prolonge en une fonction holomorphe de a ayant un zéro d'ordre
m_a au point a. [Ce n'est pas tout à fait plus général que Weierstrass, car
même si on prend f_a=(z-a)^m_a, rien ne dit que f ne s'annule pas en dehors
de S].

Cor:
- il existe une fonction holomorphe qui en tout a \in S a pour
  développement de Taylor d'ordre m_a un polynôme fixe f_a
- (Mittag-Leffer)
si S est sans point d'accumulation dans \Omega, et qu'on fixe une fonction
rationelle f_a pour tout a, il existe une fonction f méromorphe dans \Omega
dont les seuls pôles sans dans S, et que la partie principale de f en a
soit f_a.

Indice d'un lacet
=================

## Intégrale le long d'un chemin

(Cf Analyse Complexe, Chapitre 5)

Si \gamma est un chemin de class C^1 par morceau, et w une 1-forme
différentielle
\int_\gamma w est simplement l'intégrale de \gamma^*(w) le long de [a,b].

Si \gamma est seulement continu mais que w est fermée, alors on peut
intégrer w le long de \gamma en prenant une primitive de w le long de
\Gamma (localement comme w est fermé en tout point de \gamma, w admet une
primitive locale, et on les recolle).

Si deux chemins sont homotopes, ils donnent la même intégrale des formes
fermées.

## Indice

L'indice en p du lacet \gamma est simplement: \int_\gamma dz/(z-p)

Remarque: une primitive de la forme dz/z le long de \gamma est simplement
une détermination continue du logarithme le long de \gamma; et donc
l'indice d'un lacet est donné par l(b)-l(a) où l est une telle
determination continue du logarithme.

- L'indice est bien défini si p n'est pas dans \gamma
- L'indice est à valeur dans 2\pi\Z
- L'indice reste constant quand p varie dans une composante connexe de
  \C \ \gamma.
- Si p est dans la composante non connexe de \C \ \gamma, alors l'indice
  est nul.

Exemples:
- si K est un compact de bord un chemin connexe (positivement orienté), alors
l'indice de p par rapport à ce bord et 1 si p \in K° et 0 si p \in \C \ K.
- l'indice de 0 par rapport à un lacet dans \C* donne une bijection de la
  classe d'homotopie des lacets sur \C* avec \Z. En particulier deux
  lacets sont homotopes ss'ils ont même indice.
  (Dans C*, homotopie = homologie)

Th: f: Omega -> \C* admet un logarithme holomorphe ssi
I(f o \gamma,0)=0 pour tout lacet C^1-par morceau (et alors c'est le cas
pour tout lacet continu).

Plus généralement, si X est localement connexe par arcs, f: X -> C* admet
un logarithme continu ssi I(f o \gamma,0)=0 pour tout lacet \gamma dans X.

Homotopie à 1 dans C*
----------------------

* Théorème de Borsuk (Cf Analyse Complexe, Chapitre 6)

Th: si K est un compact de R^n, f: K -> \C*, alors
(i) f admet un log continu
<=> (ii) f est homotope dans \C* à 1
<=> (iii) f possède une extension continue à R^n
<=> I(f o \gamma,0)=0 pour tout lacet \gamma dans X si X loc connexe par
arc (voir plus haut)

Rem:
- en général pour X quelconque dans R^n on a (f admet un prolongement à
un ensemble convexe) => (f admet un logarithme continu) => (f est homotope
à 1).
- on peut voir (ii)=>(i) de la manière suivante: G(K)={f: K->C*, f
  continue} est une sous-algèbre de Banach de (C(K),|| ||_{\infty}), et
  deux fonctions sont homotopes ssi elles sont dans la même composante
  connexe par arc. Comme G(K) est ouvert dans C(K) (car c'est le
  sous-espace des éléments inversibles), ces composantes connexes par arc
  sont les composantes. Or dans une algèbre de Banach commutative, la
  composante connexe de 1 est l'ensemble des exponentielles.

Cor:
- deux applications u,v: K->C* sont homotopes ssi u/v admet un log continu
- ça donne une autre preuve que tout chemin admet un log continu.

Degré d'une application
-----------------------

Si \phi est définie sur le cercle unité, le degré de \phi en p est l'indice
de \phi o le cercle en p. Si \phi se prolonge en une application continue
sur le disque unité D, alors le degré est non nul => p est dans l'image de
\phi(D°)

Théorème de Jordan
==================

K compact de \C.
G(K) est l'ensemble des fonctions continues K->C*, E(K) la composante
connexe de 1, ie les fonctions admettant un log continu par ce qui
précède.

Rem: si U est une composante connexe de \C \ K, sa frontière est dans K.

Th: G(K)/E(K)=Z^N où N est le nombre de composantes connexes bornées de \C
\ K; il est engendré par les z-p, où p parcourt ces composantes

Cor (Jordan): si \Gamma est une courbe de Jordan fermée, G(\Gamma)=\Z
(isomorphisme donné par l'indice, donc elle a deux composantes connexes
(une bornée et une non bornée). La frontière de chacune de ces composantes
est \Gamma.

Cor: si K compact de \C, p,q \not\in K; alors K sépare p et q ssi
(z-p)/(z-q) n'admet pas de log continu sur K.
En particulier si A et B sont compacts, A \inter B connexe et ni A ni B ne
séparent p de q, alors A \union B ne sépare pas p de q.

Domaines de Jordan
------------------

Lemme: si \phi: Dbar -> \C est continue sur Dbar et holomorphe sur D, et
que sa restriction à \delta D est injective (ie ça donne une courbe de
Jordan), alors \phi|D est un biholomorphisme de D sur l'intérieur de la
courbe de Jordan \phi(\delta D).

Def: un domaine de Jordan est l'intérieur d'une courbe de Jordan

Th (Carathéodory) Si \Omega et \Omega' sont deux domaines de Jordan, tout
biholomorphisme de \Omega sur \Omega' se prolonge en un homéo de leur
adhérence.

Cor: l'adhérence d'un domaine de Jordan est toujours homéomorphe à \Dbar

Théorème de Runge
=================
(Cf Analyse Complexe, Chapitre 9)

Th (Runge): Si K est compact de \C, et S une partie de C rencontrant chaque
composante connexe bornée de \C \ K, alors tout fonction holomorphe au
voisinage de K est uniformément approchable sur K par des fonctions
rationelles dont les pôles éventuels sont dans S.

Ex: si K n'a pas de trou, toute fonction holomorphe au voisinage de K est
uniformément approchable par des fonctions polynomiales. Par contre si K a
un trou, et p est dans ce trou, on peut montrer que 1/(z-a) n'est pas
uniformément approchable par des fonctions polynômiales.
[En effet, on montre avec le principe du maximum que si a \in O ouvert
borné, 1/(z-a) n'est pas approchable uniformément par des fonctions
continues sur Obar et holomorphes dans O]

Cor: dans \Omega (ouvert), les fonctions rationelles sans pôles dans \Omega
sont denses dans H(\Omega), si \C \ \Gamma n'a pas de composantes connexes
bornées, les fonctions polynômiales sont denses dans H(\Omega) (=fonctions
holomorphes sur Omega).

Th (Mergelyan): si \C \ K est connexe, toute fonction continue sur K et
holomorphe à l'intérieur est uniformément approchable par des fonctions
polynomiales
[le th précédent ne donne le résultat que pour les fonctions holomorphes au
voisinage de K]

Enveloppe d'homotopie
---------------------

Th: (i) toute fonction holomorphe au voisinage de K peut être approchée
uniformément sur K par des fonctions holomorphes dans \Omega
<=> (ii) l'ouvert \Omega \ K n'a pas de composantes connexes relativement
compacte dans \Omega
<=> (iii) pour tout point z_0 \in \Omega \ K, on peut trouver une fonction
f \in H(\Omega) / |f(z_0)|>sup_K |f|

Rem: - les composantes connexes de \Omega \ K relativement compactes sont
exactement les composantes connexes bornées de \C \ K contenues dans
\Omega; de plus l'adhérence (dans \C) d'une telle composante est contenue
dans \Omega.
- Si \Omega=\C on retrouve le th de Runge, car les fonctions holomorphes
  sur \C sont les fonctions polynomiales, ie
  (i) toute fonction holomorphe au voisinage de K peut être approchée
  uniformément par des fonctions polynomiales
<=> (ii) \C \ K est connexe
<=> (iii) pour tout point z_0 \in \C \ K, on peut trouver un polynôme
f / |f(z_0)|>sup_K |f|
[pour (iii) c'est parce que les fonctions entières sont uniformément
approchables par des polynômes]

Déf: si E \subset \Omega, l'enveloppe d'holomorphie de E dans \Omega est
E_\Omega={z \in \Omega / |f(z)| <= sup_K |f| pour tout f \in H(\Omega)}

Th:
- K_\Omega est la réunion de K et des composantes connexes relativement
compactes de \Omega \ K;
- K_\Omega est inclus dans l'enveloppe convexe de K; en particulier un
  compact convexe est holomorphiquement convexe, ie \C \ K est connexe et
  toute fonction holomorphe au voisinage de K est approchable uniformément
  par des fonctions polynômiales
- si a \in \delta \Omega, d(a,K)=d(a,K_\Omega)

Représentation conforme
=======================

Th: tout ouvert simplement connexe de \C (et distint de \C) est
conformément équivalent au disque ouvert D.

Ouverts simplement connexes
---------------------------
Th: les conditions suivantes sont équivalentes pour \Omega ouvert dans \C
(i) \Omega est simplement connexe
(ii) tout 1-forme fermée dans \Omega est exacte
(iii) \int_\gamma f dz = 0 pour toute fonction f holomorphe dans \Omega et
tout lacet
(iv) toute fonction holomorphe sur \Omega admet une primitive holomorphe
(v) toute fonction holomorphe: \Omega->\C* admet un log holomorphe
(vi) toute fonction holomorphe: \Omega->\C* admet une racine carrée holomorphe
(vii) \Omega=\C ou \Omega est conformément équivalent à D
(viii) \Omega est homéomorphe à D
(ix) Tout cycle dans \Omega est homologue à 0
(x) S_2 \ \Omega est connexe, ie \C \ \Omega n'a pas de composantes
connexes bornées
(xi) Les fonctions polynômiales sont denses dans H(\Omega)

Automorphismes
--------------
- Les automorphismes de \C sont les similitudes z-> az+b
- Les automorphismes de la sphère de Riemann S_2 sont les homographies
  (Rem: une homographie laissant fixe le point à l'infini est une
  similitude...)

Rem: les cercles de S_2 correspondent aux cercles de \C et aux droites de
\C (+ le point à l'infini). Toute homographie envoie un cercle de S_2 sur
un cercle de S_2.

Ex: (z-i)/(z+i) envoie le demi plan de Poincaré sur le disque unité
[en effet elle envoit la ligne R \union {\infity} sur le cercle unité]

- Les automorphismes du disque unité sont les homographies de type
  "transformation de Moebius":
  z-> \lambda (a-z)/(1-\abar z), où \lambda est de module 1 et a \in D.
  [Ex: si la transformation de Moebius fixe 0, alors c'est une rotation z->
  \lambda z]

Théorème de Picard
==================
http://en.wikipedia.org/wiki/Picard_theorem

    Little Picard Theorem: If a function f : C → C is entire and non-constant, then the set of values that f(z) assumes is either the whole complex plane or the plane minus a single point.

    Great Picard's Theorem: If an analytic function f has an essential singularity at a point w, then on any punctured neighborhood of w, f(z) takes on all possible complex values, with at most a single exception, infinitely often.

    Great Picard's Theorem (meromorphic version): If M is a Riemann surface, w a point on M, P1(C) = C ∪ {∞} denotes the Riemann sphere and f : M\{w} → P1(C) is a holomorphic function with essential singularity at w, then on any open subset of M containing w, the function f(z) attains all but at most two points of P1(C) infinitely often.

The following conjecture is related to "Great Picard's Theorem":[1]

    Conjecture: Let {U1, ..., Un} be a collection of open connected subsets of C that cover the punctured unit disk D \ {0}. Suppose that on each Uj there is an injective holomorphic function fj, such that dfj = dfk on each intersection Uj ∩ Uk. Then the differentials glue together to a meromorphic 1-form on D.

It is clear that the differentials glue together to a holomorphic 1-form g dz on D \ {0}. In the special case where the residue of g at 0 is zero the conjecture follows from the "Great Picards's Theorem".

Surface de Riemann
==================

Residue Theorem
---------------
https://math.stackexchange.com/questions/880259/question-on-forsters-proof-of-the-residue-theorem
https://math.stackexchange.com/questions/441813/the-sum-of-the-residues-of-a-meromorphic-differential-form-on-a-compact-riemann

if X is a compact Riemann surface, and f meromorphic 1-forme then
\sum_residues Res(f) = 0.

Application: \sum mult(f) = 0  [look at df/f]
ie deg(div(f))=0

Morphism to projective space
----------------------------

If f: X -> Y is a map of compact Riemann surfaces, then
deg f^* D = deg f deg D.

If D is a divisor without base point, |D| of dimension n, then we get a
morphism
f: X -> P^{n-1}.
Geometrically, the divisors in |D| correspond to the pullback of the
hyperplanes via f.

Coordinate free: the map f is given by
x -> { E \in |D| | E >= (x) } \in P(|D|)*
    Indeed, this set is a hyperplane in |D|, more precisely under the
    bijection between |D| and P(L(D)) it corresponds to P(L(D-x))

Linear pencils (= dimension 1):
--------------

a map X -> P^1 correspond to a meromorphic function f.
Reciprocally, D=Div(f)_{\infty} has elements of L(D) given by (1,f), which
give the previous map (up to an inversible constant).

The corresponding subspace of |Div f| is then
{div (1)} \join {div (f-c), c \in \C}, this is a "trivial"
pencil, corresponding to f*((c)-(\infty)).

Rem: Div(f) is simply f*( (0)-(\infty) ), so it is of degree 0.
We could replace (0)-(\infty)=Div(X) by any divisor D=\sum n_i (P_i) of
degree 0. D corresponds to \prod (X-P_i)^n_i, so f^* D correspond to
div (f(X)-P_i)^n_i

Variétés Complexes
==================

Cf: http://www.les-mathematiques.net/phorum/read.php?3,854366

 Une variété complexe est définie comme une variété différentielle, sauf que les ouverts du recouvrement sont identifiés à des ouverts de ℂn et qu'on demande aux fonctions de transition d'être holomorphes. Sur une variété différentielle, il est important de distinguer trois notions de fibré tangent : d'abord on a le fibré tangent réel, qui est le "vrai" fibré tangent, c'est-à-dire celui pour la structure différentiable. Si X est une variété complexe de dimension complexe n, son fibré tangent réel est de rang réel 2n. Ensuite, on a le fibré tangent complexe, qui est simplement le complexifié du fibré tangent réel. C'est donc un fibré complexe (attention, pas holomorphe !) de rang 2n sur la variété différentiable X.

Pour parler du fibré tangent holomorphe, il faut définir la structure presque complexe sur le tangent réel. Par définition, si X est une variété différentiable (juste différentiable), une structure presque complexe sur X est la donnée d'un endomorphisme J du fibré tangent réel tel que J2=−Id. En particulier, si X a une structure presque complexe, la dimension de X est paire.

Une variété complexe admet naturellement une structure presque complexe (voir l'article Almost complex manifold de Wikipedia). Très grossièrement, elle est définie comme la multiplication par i dans les cartes holomorphes de l'atlas.

Dès qu'on a une structure presque complexe sur une variété différentiable X, l'opérateur J se diagonalise sur le complexifié du fibré tangent ; on a un espace propre pour la valeur propre i et un espace propre pour la valeur propre −i, conjugué du premier. Dans le cas où X est une variété complexe avec sa structure presque complexe canonique, on appelle fibré tangent holomorphe le sous-espace propre pour la valeur propre i.

Pour résumer, si X variété complexe de dimension complexe n, on a le fibré tangent réel, de rang réel 2n, le fibré tangent complexe, de rang complexe 2n, le fibré holomorphe, de rang complexe n.

Ta question était : quelle est la différence entre structure complexe et structure presque complexe. C'est simplement qu'il existe des variétés différentiables admettant une structure presque complexes mais qui ne peuvent pas être munies d'une structure de variété complexe. Quand la structure presque complexe vient d'une structure complexe, on dit que la structure presque complexe est intégrable. Le théorème de Newlander-Nirenberg dit que c'est le cas exactement quand un certain tenseur (dit de Nijenhuis) défini à partir de J est nul.

Pour ta deuxième question, on note en général h une métrique hermitienne, laissant la notation g pour la partie réelle de la métrique, qui est une métrique riemannienne sur la variété différentiable sous-jacente. Comme la métrique h préserve la structure presque complexe J, au sens où h(Ju,Jv)=h(u,v), on a la suite d'égalités h(u,Ju)=h(Ju,J2u)=−h(Ju,u)=−\bar{h(u,Ju)} si u est dans le fibré tangent réel. Ceci prouve que h(u,Ju) est imaginaire pur. En particulier, pour la métrique riemannienne g, g(u,Ju)=0. Regarde Hermitian manifold, sur Wikipedia.

Note : On se perd facilement dans ces choses là, même après plusieurs années de pratique. Pour bien démarrer, il fau comprendre à fond la situation sur un espace vectoriel (tout le reste n'est que mise en famille différentiable de ces notions). Les pages Wikipedia sont bien faites et les livres de Voisin, Huybrechts et Griffiths-Harris expliquent cela (j'ai sans doute une préférence pour Huybrechts, Complex Geometry.

Dimension supérieure
====================

## Hartog's lemma:
https://en.wikipedia.org/wiki/Hartogs%27s_extension_theorem
https://www-fourier.ujf-grenoble.fr/~demailly/manuscripts/agbook.pdf (I.3.28)

Si Omega est ouvert dans C^n, n>1 et K compact dedans tel que \Omega \ K
soit connexe, une fonction holomorphe sur \Omega\K s'étend uniquement en
une fonction holomorphe sur Omega.

Reformulation: https://hal.archives-ouvertes.fr/hal-00110786/document, http://matrika.fmf.uni-lj.si/letnik-3/stevilka-1/Elementary_approach_to_the_Hartogs_extension_theorem.pdf
Si Omega (borné) à une frontière \deltaO connexe, une fonction holomorphe au
voisinage de \deltaO s'étend uniquement à tout O.

Raffinement de cette reformulation dans agbook:
A refined version of the Hartogs extension theorem due to Bochner will be
given in Exercise 8.13. Ig shows that f need only be given as a C^1
function on ∂Ω, satisfying the tangential Cauchy-Riemann equations (a
so-called CR-function). Then f extends as a holomorphic
function ̃f∈O(Ω)∩C^0(Ω), provided that ∂ Ωis connected.

forum
=====

Dam's, @maths.avances:768

Surtout qu'il y a plein de versions subtilement différentes:                    

le lemme de Koebe cité par Mikael: si f est holomorphe sur le disque            
unité et injective, f(0)=0 et f'(0)=1, alors son image contient le disque       
de centre 0 et de rayon 1/4                                                     
                                                                                
(la preuve que je connais est exactement celle citée par Mika)                  
                                                                                
Un autre résultat: si f holomorphe sur le disque unité et bornée par M,         
f(0)=0 et f'(0)=1 alors son image contient le disque D(0,1/4M).                 
                                                                                
Pr: si b n'est pas dans l'image, on pose h(z)=sqrt(1-f(z)/b) avec h(0)=1,       
en majorant h et en utilisant parseval, on tombe sur |b|>=1/4M
                                                                                
Le théorème de Bloch: si f est holomorphe au voisinage du disque unité          
fermé, et f'(0)=1, alors son image contient un disque de rayon 1/16             

Pr: on utilise le résultat précédent en un point a maximisant f'(a) *           
rayon du disque de centre a contenu dans le disque unité.                       

Applications:                                                                   
une fonction entière a dans son image des disques de rayon arbitrairement       
grand.                                                                          
                                                                                
On peut en déduire le petit théorème de Picard ainsi:
si f est entière telle que f est non constante et ne prend pas les
valeurs 0 et 1, alors il existe g entière telle que
f(z)=exp(2i\pi (ch(g(z)))^2), or g(\C) ne rencontre pas l'ensemble
{+/- log(sqrt(n+1)-sqrt(n)) + 2ik\pi, n \in \N, k \in \Z} ce qui
contredit mon énoncé plus haut.                                                 
