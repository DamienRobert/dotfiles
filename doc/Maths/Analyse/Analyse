vim: ft=markdownlight fdm=expr

Développements Limités
======================

Dévelopement de la série harmonique
-----------------------------------

H_n=ln n+gamma+1/(2n)-1/(12n^2)+o(1/n^2)
Preuve "à la main"
http://boumbo.toonywood.org/sandrine/pageperso/agreg/serie_harmonique.pdf
http://fr.wikipedia.org/wiki/Comparaison_s%C3%A9rie-int%C3%A9grale

Un développement plus général est donné par la formule d'Euler Maclaurin, cf
http://math.stackexchange.com/questions/55358/eulers-constant-the-asymptotic-behavior-of-left-sum-limits-j-1n-frac
http://en.wikipedia.org/wiki/Euler%E2%80%93Maclaurin_formula
http://fr.wikipedia.org/wiki/Formule_d%27Euler-Maclaurin

Comparaison série intégrale
---------------------------

http://fr.wikipedia.org/wiki/Comparaison_s%C3%A9rie-int%C3%A9grale

Si a>1, le reste \sum_{k>n} 1/k^a ~ 1/(a-1) 1/(n^{a-1})
Si a=1, la somme H_n est équivalent à ln n
Si a<1, la somme partielle \sum_{k<n} 1/k ~ 1/(1-a) n^{1-a}

Soit f telle que un=f(n). Si f est décroissante et continue sur l'intervalle [0, \infty[, alors on peut encadrer:
    \int_0^{N+1} f(t) dt \leq \sum_{n=0}^N u_n \leq u_0 + \int_{0}^{N} f(t) dt

Ex: soit S_n=\sum u_n et Delta_n=u_n- \int_n^{n+1} f(t) dt.
Alors \Delta_n converge (car 0 \leq \Delta_n \leq u_n-u_{n+1}), d'où
\sum_{n=0}^N u_n=\int_0^{N+1} f(t)dt+\sum_{n=0}^N \Delta_n=\int_0^{N+1} f(t) dt+\Delta + o(1)

Pousser l'approximation plus loin:
Si S_n ~ R_n, on pose a_n=S_n-R_n, et b_n=a_n-a_{n-1}-a_n=u_n+R_{n-1}-R_n
d'où a_n=\sum_{m>n} b_m. On calcule un équivalent g(n) de b_n, puis un équivalent \int_{t>n} g(t)dt de a_n, ce qui donne S_n=R_n+\int_{t>n} g(t). [Il faut que \int_{t=n}^{n+1} g(t) soit négligeable devant \int_{t>n} g(t)dt.
Par exemple avec u_n=1/n, on a S_n = log(n)+gamma+o(1) et
b_n=1/n+log(n-1)-log(n)~1/(2n^2); d'où S_n=log(n)+gamma+1/(2n)+o(1/n).

Théorème des équivalents
------------------------

(Trivial, cf par exemple
http://www-fourier.ujf-grenoble.fr/~rombaldi/AgregInterne/Oral1/202.pdf)

Si u_n, v_n positifs, u_n ~ v_n
- \sum u_n converge <=> \sum v_n converge et les restes partiels sont équivalentes.
- \sum u_n diverge <=> \sum v_n diverge et les sommes partielles sont équivalents.

Formule de Stirling
-------------------

http://en.wikipedia.org/wiki/Stirling%27s_approximation

The formula as typically used in applications is
    \ln(n!) = n\ln(n) - n + O(\ln(n))
The next term in the O(ln(n)) is (1/2)ln(2πn); a more precise variant of the formula is therefore
    n! \sim \sqrt{2 \pi n}\left(\frac{n}{e}\right)^n

Le calcul asymptotique se fait via Euler Maclaurin, ou via Laplace.
http://en.wikipedia.org/wiki/Laplace%27s_method

\ln(n!) = \sum_{j=1}^n \ln(j) approx \int_1^n \ln(x)dx = n\ln(n) - n + 1.

cf aussi:
- http://www.math.uconn.edu/~kconrad/blurbs/analysis/stirling.pdf
  (Historique de la formule de Stirling et comment déterminer la constante)
- http://math.stackexchange.com/questions/78902/asymptotics-of-terms-and-errors-in-stirlings-approximation
- http://math.univ-lyon1.fr/~gelineau/devagreg/Formule_Stirling.pdf
  (constante dans Sitrling via la formule de Wallis)
- http://www.maths-france.fr/MathSpe/GrandsClassiquesDeConcours/SeriesNumeriques/FormuleDeStirling.pdf
  (début de la série asympotique de Stirling)
- http://jf.burnol.free.fr/agregeulermaclaurin.pdf
  (Euler Maclaurin pour les équivalents de Stirling et les sum 1/n^a; avec
  des méthodes plus élémentaires aussi)

L'Hôpital
----------
http://en.wikipedia.org/wiki/L%27H%C3%B4pital%27s_rule

In its simplest form, L'Hôpital's rule states that for functions f and g which are differentiable on an open interval I except possibly at a point c contained in I:

If \lim_{x \to c} f(x)=\lim_{x \to c} g(x)=0 or \pm\infty, and
    \lim_{x\to c}\frac{f'(x)}{g'(x)} exists, and
    g'(x)\neq 0 for all x in I with x ≠ c,
then
    \lim_{x\to c}\frac{f(x)}{g(x)} = \lim_{x\to c}\frac{f'(x)}{g'(x)}.

 #Version finie:
http://en.wikipedia.org/wiki/Stolz%E2%80%93Ces%C3%A0ro_theorem

Let (a_n)_{n \geq 1} and (b_n)_{n \geq 1} be two sequences of real numbers. Assume that (b_n)_{n \geq 1} is strictly monotone and divergent sequence (i.e. strictly increasing and approaches + \infty or strictly decreasing and approaches - \infty ) and the following limit exists:
    \lim_{n \to \infty} \frac{a_{n+1}-a_n}{b_{n+1}-b_n}=\ell.\ 
Then, the limit
    \lim_{n \to \infty} \frac{a_n}{b_n}\ 
also exists and it is equal to ℓ.

The general form of the Stolz–Cesàro theorem is the following (see http://www.imomath.com/index.php?options=686): If (a_n)_{n\geq 1} and (b_n)_{n\geq 1} are two sequences such that (b_n)_{n \geq 1} is monotone and unbounded, then:
    \liminf_{n\to\infty} \frac{a_{n+1}-a_n}{b_{n+1}-b_n}\leq \liminf_{n\to\infty}\frac{a_n}{b_n}\leq\limsup_{n\to\infty}\frac{a_n}{b_n}\leq\limsup_{n\to\infty}\frac{a_{n+1}-a_n}{b_{n+1}-b_n}. 

Asymptotique des intégrales
---------------------------

Laplace:
http://en.wikipedia.org/wiki/Laplace%27s_method
    \int_a^b e^{M f(x)} dx\approx \sqrt{\frac{2\pi}{M|f''(x_0)|}}e^{M f(x_0)}
   (M ->  \infty)
où x_0 est un maximum global de f, avec f''(x_0)<0

Phase stationnaire:
http://en.wikipedia.org/wiki/Stationary_phase_approximation
  In mathematics, the stationary phase approximation is a basic principle of asymptotic analysis, applying to oscillatory integrals
    I(k) = \int g(x) e^{i k f(x)} dx   (k->infty)
Ex: \int_{-1}^{1} e^{ikx^{2}} dx = \sqrt{\pi/k}e^{i\pi/4}+O(1/k)

Méthode des cols:
http://en.wikipedia.org/wiki/Method_of_steepest_descent

  In mathematics, the method of steepest descent or stationary phase method
  or saddle-point method is an extension of Laplace's method for
  approximating an integral, where one deforms a contour integral in the
  complex plane to pass near a stationary point (saddle point), in roughly
  the direction of steepest descent or stationary phase. The saddle-point
  approximation is used with integrals in the complex plane, whereas
  Laplace’s method is used with real integrals.
  The integral to be estimated is often of the form
      \int_C f(z)e^{\lambda g(z)}dz
  where C is a contour and λ is large. One version of the method of steepest descent deforms the contour of integration so that it passes through a zero of the derivative g′(z) in such a way that on the contour g is (approximately) real and has a maximum at the zero.

    I(\lambda) := \int_{I_x} f(x) e^{\lambda S(x)} dx
      = \left( \frac{2\pi}{\lambda}\right)^{\frac{n}{2}} e^{\lambda S(x^0)} \prod_{j=1}^n (-\mu_j)^{-\frac{1}{2}} \left(f(x^0)+ O\left(\lambda^{-1}\right) \right), \qquad \lambda \to \infty,
      = \left( \frac{2\pi}{\lambda}\right)^{\frac{n}{2}} e^{\lambda S(x^0)} \left ( \det (-S_{xx}''(x^0)) \right )^{-\frac{1}{2}} \left (f(x^0) + O\left(\lambda^{-1}\right) \right),

=> The asymptotic expansion in the case of a single non-degenerate saddle point
\int_{I_{x}} f(x)e^{\lambda S(x)}dx=\frac{2\pi }{\lambda}^{n/2} e^{\lambda S(x^{0})} (f(x^{0})+O(\lambda^{-1})) \prod_{j=1}^{n}(-\mu_{j})^{-1/2} (\lambda \to \infty)
where μj are eigenvalues of the Hessian S''_{xx}(x^0)

  * Utilise le lemme de Morse (complexe)
  http://en.wikipedia.org/wiki/Morse_theory#The_Morse_lemma
  Near a non-degenerate saddle point z0 of a holomorphic function S(z), there exist coordinates in terms of which S(z) − S(z0) is quadratic: let S be a holomorphic function with domain W ⊂ Cn, and let z0 in W be a non-degenerate saddle point of S, that is, ∇S(z0) = 0 and \det S''_{zz}(z^0) \neq 0. Then there exist neighborhoods U ⊂ W of z0 and V ⊂ Cn of w = 0, and a bijective holomorphic function φ : V → U with φ(0) = z0 such that
      \forall w \in V,  S(\varphi(w)) = S(z^0) + \frac{1}{2} \sum_{j=1}^n \mu_j w_j^2, \quad \det\boldsymbol{\varphi}_w'(0) = 1
  Here, the μj are the eigenvalues of the matrix S_{zz}''(z^0).

  La preuve du lemme de Morse passe par le lemme intermédiare:
  * Auxiliary Statement. Let  f:C^n → C be holomorphic in a neighborhood of the origin and f (0)=0. Then in some neighborhood, there exist functions g_i : C^n → C such that f(z) = \sum_{i=1}^n z_i g_i(z), g_i(0) = \left. \tfrac{\partial f(z)}{\partial z_i} \right|_{z=0}.

Théorème des accroissements finis
=================================

Si f:[a,b] -> R, C^0
et \forall x \in [a,b] lim inf h->0+ [f(x+h)-f(x)]/h <= C
(sauf peut être en un nombre dénombrable de points)
alors f(b)-f(a) <=C(b-a)

Application
-----------

f:[a,b] -> E (affine normé), g:[a,b] -> R dérivables et
||f'(x)|| <= g'(x) sur ]a,b[
alors ||f(b)-f(a)|| <= g(b)-g(a)

Pr: appliquer le th précédent à h(x)=||f(x)||-g(x), on a h(b)<=h(a)

Formules de Taylor (fonctions de plusieurs variables)
==================

Omega \subset E ouvert

Taylor-Lagrange
---------------
(1) f: Omega \to R, m fois dérivable sur [x,x+h] \subset Omega
    et (m+1) fois dérivable sur ]x,x+h[
  Alors f(x+h)=f(x)+f'(x).h +f''(x)/2!.h^2+...+f^(m)(x)/m!.h^m
               +f^(m+1)(x+theta h).h^(m+1)/(m+1)!
  où theta \in ]0;1[
  et f^(m)(x).h^m := f^(m)(x)(h,h,h,...,h)
                   = \sum_{\alpha, |alpha|=m} D^alpha f(x) h^alpha
     ex: f^(2)(x).h^2 = \sum d^2f/dx_idx_j h_i h_j

Pr: g(t)=f(x+th), g^(m)(t)=f^(m)(x+th).h^m, on se ramène à Taylor réel.

(2) f: Omega \to F (affine), m fois dérivable sur [x,x+h] \subset Omega
     et (m+1) fois dérivable sur ]x,x+h[, avec ||f^(m+1)|| <=M
  Alors ||f(x+h)-f(x)-f'(x).h -f''(x)/2!.h^2-...-f^(m)(x)/m!.h^m|| <=
               M.h^(m+1)/(m+1)!

(2') f: Omega \to F (affine), m fois dérivable sur [x,x+h] \subset Omega
     et (m+1) fois dérivable sur ]x,x+h[,
     L (m+1)-linéraire continue de E^(m+1) -> F.
  Alors ||f(x+h)-f(x)-f'(x).h -f''(x)/2!.h^2-...-f^(m)(x)/m!.h^m
          -L.h^(m+1)/(m+1)!|| <= w.h^(m+1)/(m+1)!
  avec w=sup_{ξ \in ]x,x+h[} ||f^(m+1)(ξ)-L||

ex: ||f(x+h)-f(x)-f'(x).h|| <= w.h où w=sup_{xi \in ]x,x+h[} ||f'(xi)-f'(x)||
   avec L=f'(x)

Pr: appliquer (2) à ξ->f(ξ)-L.(ξ-x)^(m+1)/(m+1)!

Taylor-Young
-----------
(3) f: Omega \to F (affine), m fois dérivable sur un ouvert de x
     et a une dérivée d'ordre m dérivable en x.
  Alors f(x+h)=f(x)+f'(x).h +f''(x)/2!.h^2+...+f^(m)(x)/m!.h^m+o(h^m)

Pr: Pareil, soit g(h) la différence, on applique l'hypothèse de rec plus TAF

Formules de Taylor (pour une variable réelle)
=================

Taylor avec reste intégral de Laplace:
-------------------------------------

f:R\to R, m fois dérivable sur [a,b], et f^(m) est absolument continue,
alors f(b)=f(a)+f'(a)(b-a) +f''(a)/2!(b-a)^2+...+f^(m)(a)/m!(b-a)^m+
 \int_a^b f^(m+1)(t)/m! (b - t)^m dt

Taylor-Lagrange:
---------------

f:R\to R, m fois dérivable sur [a,b], et (m+1)-dérivable sur ]a,b[
alors f(b)=f(a)+f'(a)(b-a) +f''(a)/2!(b-a)^2+...+f^(m)(a)/m!(b-a)^m
             +f^(m+1)(xi)/(m+1)!(b-a)^(m+1) avec xi \in ]a,b[

Preuve: soit g(x)=f(x)-f(a)-.... - \lambda/(m+1)! (x-a)^(m+1), lambda tel que g(b)=0.
Alors g s'annule en a jusqu'à l'ordre m, donc par Rolle récursif il existe
xi tel que g^(m+1)(xi)=0. Or g^(m+1)(xi)=f^(m+1)(xi)-\lambda, d'où
lambda=f^(m+1)(xi), on pluggue ça dans g(b)=0 et on a le résultat.

Taylor Lagrange généralisé
--------------------------

La preuve donne une généralisation suivante: soit (a_i) \in [a,b]
et P l'unique polynôme de degré m-1 qui coincide avec f en a_i à l'ordre m_i
(ie (f-P)^(k)(a_i)=0 pour 0<=k<m_i) où m=\sum m_i. L'espace vectoriel des
polynômes de degrés m qui s'annulent en a_i à l'ordre m_i est de dimension
1, soit Q le générateur unitaire, Q=\prod (x-a_i)^m_i.
Soit g(x)=f(x)-P(x)-lambda Q(x), avec lambda choisit pour que g(c)=0.
Alors en appliquant Rolle m fois, on a xi tel que g^(m)(xi)=0, xi \in ]a,b[
Donc f^(m)(xi)=lambda m! <- constante.
D'où f(c)=P(c)+f^(m)(xi)/m! Q(c)
(rem par définition ça marche même si c est l'un des a_i)

Différences finies
------------------

Cf Algebre/Interpolation pour le développement de Taylor des différences divisées:
f[x_{0},\dots ,x_{n}]=\frac {f^{(n)}(\xi )}{n!}.
f[x0,…,xn]=f(0)⋅p0[x0,…,xn]+f′(0)⋅p1[x0,…,xn]+f″(0)/2!⋅p2[x0,…,xn]+f‴(0)/3!⋅p3[x0,…,xn]+…

Si les x_i sont équirépartis, on retrouve les différences finies
https://en.wikipedia.org/wiki/Finite_difference
f[x_{0},x_{1},\ldots,x_{k}]=\frac{1}{k!h^{k}}}\triangle^(k)f(x_0).

Et les différences finies approximent les dérivées:
\frac{d^{n}f}{dx^{n}}}(x)={\frac{\Delta_{h}^{n}[f](x)}{h^{n}}}+O(h)={\frac{\nabla_{h}^{n}[f](x)}{h^{n}}}+O(h)={\frac{\delta _{h}^{n}[f](x)}{h^{n}}}+O(h^{2}).]

https://en.wikipedia.org/wiki/Umbral_calculus
[\frac{\Delta_h}{h},xT_h^{-1}]=[D,x]=I.
Donc dans toutes les formules on peut remplacer D^k et x^n
par les différences finies et x_n=x(x-h)(x-2h)...
et tout marche pareil!

Exemple: Δh=T_h−I; et Taylor donne
  Δh=hD+1/2! h^2D^2+1/3! h^3D^3+⋯=e^{hD}−I, ie T_h=e^{hD} et
  hD=log(⁡1+Δ_h)=Δh−1/2 Δ_h^2+1/3 Δ_h^3+⋯.

Formule de Taylor des différences finies:
f(x)=\sum_{k=0}^{\infty}{\frac{\Delta^{k}[f](a)}{k!}}(x-a)_{k}=\sum_{k=0}^{\infty }{x-a \choose k}\Delta^{k}[f](a).
[Rem: cette formule vient de l'Umbral calculus, alors que la formule plus
haut des différences divisées reivent juste à remplacer f par sa série de
Taylor et d'évaluer en la différence divisée]

Points fixes
============

Application contractante
------------------------

 # https://fr.wikipedia.org/wiki/Application_contractante

Point fixe de picard pour une application contractant dans un espace
métrique complet.

Corollaire — Soient E un espace métrique complet (non vide) et f une application de E dans E dont une itérée f q est contractante (on dit que f est à puissance q-ième contractante). Alors f possède un unique point fixe x* et toute suite d'éléments de E vérifiant la récurrence xn+1 = f(xn) converge vers x*.
k

Point fixe de Brouwer/Schauder
------------------------------

 # https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_du_point_fixe_de_Brouwer

Convexe compact — Toute application continue f d'un convexe compact non
vide K d'un espace euclidien à valeurs dans K admet un point fixe.

Théorème de Schauder — Toute application continue d'un convexe compact non vide K d'un espace de Banach à valeurs dans K admet un point fixe.

 # https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_du_point_fixe_de_Schauder

Soient E un ℝ-espace vectoriel topologique séparé et C un convexe fermé non vide de E.
Théorème [Schauder Généralisé] — Si T est une application continue de C dans C telle que T(C) soit relativement compact, alors T a un point fixe.
Démonstration si E est localement convexe: https://fr.wikipedia.org/wiki/Espace_localement_convexe

Note:
Ce théorème fut d'abord démontré en 1930 par Schauder dans des cas particuliers, comme celui des espaces vectoriels topologiques métrisables complets1. Il conjectura le cas général dans le Livre écossais. En 1934, Tychonoff démontra le théorème dans le cas où C est compact et E est localement convexe3. Cette version est connue sous le nom de théorème du point fixe de Tychonoff. B. V. Singbal généralisa ce résultat au cas où C n'est pas compact. Le cas général (sans l'hypothèse de convexité locale) fut finalement démontré par Robert Cauty en 20015.

Markov-Kakutani
---------------

 # https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_du_point_fixe_de_Markov-Kakutani
    Soient K un compact convexe non vide d'un espace vectoriel topologique séparé X et G un ensemble d'opérateurs affines continus sur X, qui commutent deux à deux et laissent K stable. Alors il existe dans K au moins un point fixe par tous les éléments de G. 

Cf la preuve sur wikipedia ou http://page.mi.fu-berlin.de/werner99/preprints/markkaku.pdf

Application: http://math.stackexchange.com/questions/753512/how-to-use-markov-kakutani-fixed-point-theorem-to-show-that-abelian-groups-are-a
Every abelian group is amenable.

Version faible:
http://agreg-maths.univ-rennes1.fr/documentation/docs/PointFixe.pdf
(Markov-Kakutani:  version  faible)
E normé, K convexe borné fermé non vide de E'; T:K->K affine et continue pour la topo *-faible. Alors T possède un point fixe dans K.
Preuve: considérer les 1/n \sum T^i(x).
  Application: existence de la mesure de Haar.
  [On a besoin de la preuve pour la topo faible car la boule unité des mesures est compact par Banach Alaoglu seulement pour la topo faible]

Version complète: http://mathworld.wolfram.com/KakutanisFixedPointTheorem.html
 One common form of Kakutani's fixed point theorem states that, given a locally convex topological vector space X, any equicontinuous group G={g_alpha}_(alpha in A) of affine maps g_alpha mapping a (nonempty) compact, convex subset K subset X into itself necessarily has a common fixed point in K, i.e., that under the above conditions, there exists a point x in K satisfying g_alpha(x)=x for all g_alpha in G. In addition, Markov and Kakutani proved that some of these hypotheses can be weakened without affecting the results, e.g. that the result remains true for arbitrary topological vector spaces X (which may or may not be locally convex) provided that G is a commuting collection (not necessarily a group, and not necessarily equicontinuous) of continuous affine maps from K into K. 

See also https://books.google.fr/books?id=55a6CgAAQBAJ&pg=PA46&lpg=PA46&dq=markov+kakutani+theorem+equicontinuity&source=bl&ots=AfEdpO7jRg&sig=d-JzZ3BGcEgxc3-oTu6ZvEkh92c&hl=en&sa=X&ved=0ahUKEwiS75P4y4fOAhXIuxQKHSt1CTIQ6AEIHjAA#v=onepage&q=markov%20kakutani%20theorem%20equicontinuity&f=false

Résumé:
- K compact convexe non vide, X evt séparé, G ensemble d'opérateurs affines continus qui commutent deux à deux et laissant K stable
- K compact convexe non vide, X localement convexe, G groupe d'opérateurs affines équicontinus et laissant K stable
  Cor: E normé, K convexe borné fermé non vide de E'; T:K->K affine et continue pour la topo *-faible. (En effet la boule unité est compacte pour la topo faible)

Kakutani
--------

https://en.wikipedia.org/wiki/Kakutani_fixed-point_theorem

Let S be a non-empty, compact and convex subset of some Euclidean space R^n. Let φ: S → 2^S be a set-valued function on S with a closed graph and the property that φ(x) is non-empty and convex for all x ∈ S. Then φ has a fixed point. 

Application: équilibre de Nash

Dérivées
========
[réf: Bruckner, differentiation of real functions]

Si A est mesurable, presque tout point de A est de densité 1 (en A), et
presque tout point pas dans A est de densité 0 (en A).
Avec les mêmes hypothèses, si F est fermé dans A et constitué de points de
densité 1 (en A), alors F est inclus dans un parfait P formé de points de
densité 1 (en A)

Une fonction f est mesurable ssi elle est approximativement continue a.e.

Une dérivée est baire 1, et aussi Darboux (cf Bruckner)
Une fonction approximativement continue est Darboux Baire 1
(si de plus elle est bornée, c'est une dérivée).

Si G est un Gdelta_dense, il existe une fonction dérivée qui a pour points
de continuités l'ensemble G (et réciproquement, en fait toute fonction
baire 1 est continue sur un Gdelta-dense)

Exemples pathologiques:
- il existe une fonction dérivable non constante dont
la dérivée s'annule sur un ensemble dense. En fait pour tout E=F_sigma
formé de points de densité, il existe une dérivée égale à 0 en dehors de E,
et comprise entre 0<f(x)<=1 sur E.
- il existe une fonction dérivable partout (et de dérivée bornée) qui n'est
  monotone nulle part (en fait on peut écrire [a,b]=A \union B \union C
  avec A, B, C denses, f'=0 sur C, 0<f'<=1 sur A et 0>f'>=-1 sur B).
- pour tout ensemble dénombrables A, B, il existe une fonction dérivable f
  de dérivée bornée qui a un max strict (resp min strict) en tout point de
  A (resp B). (Inversement si f est continue, elle a au plus un nb dén de
  max/min stricts)
- Si P est un ensemble parfait nowhere dense (un cantor), tel que P \inter
  tt intervalle est soit vide, soit de mesure non nulle, alors il existe
  une fonction dérivable g qui est constante sur chaque intervalle
  complémentaire à P mais non constante sur chaque intervalle qui
  intersecte P (et la condition avec l'intersection est une condition
  nécessaire à l'existence de g).

En combinant les trois premiers exemples, on doit pouvoir montrer qu'il
exsite une fonction dérivable partout (de dérivée bornée), dont la dérivée
s'annule sur un ensemble dense, mais qui n'est monotone nulle part (en
particulier constante sur aucun intervalle) et a un nombre infini
dénombrable  de maximums/minimums stricts.

Baire
=====

Caractérisation des Polynômes
-----------------------------

Let f be an infinitely differentiable function on [0,1] and suppose that
for each x∈[0,1] there is an integer n∈N such that f^(n)(x)=0. Then does f
coincide on [0,1] with some polynomial? If yes then how.


The proof is by contradiction. Assume f is not a polynomial.

Consider the following closed sets:
Sn={x:f(n)(x)=0}
and
X={x:∀(a,b)∋x:f↾(a,b) is not a polynomial}.

It is clear that X is a non-empty closed set without isolated points.
Applying Baire category theorem to the covering {X∩Sn} of X we get that
there exists an interval (a,b) such that (a,b)∩X is non-empty and
(a,b)∩X⊂Sn
for some n. Since every x∈(a,b)∩X is an accumulation point we also have
that x∈Sm for all m≥n and x∈(a,b)∩X.

Now consider any maximal interval (c,e)⊂((a,b)−X). Recall that f is a
polynomial of some degree d on (c,e). Therefore f(d)=const≠0 on [c,e].
Hence d<n. (Since either c or e is in X.)

So we get that f(n)=0 on (a,b) which is in contradiction with (a,b)∩X being
non-empty.

Fonctions Baire \alpha
----------------------

Une fonction est baire alpha+1 si elle est limite simple de fonctions baire
alpha. Critère bien connu: f est baire alpha ssi la réciproque d'un ouvert
et un borel de classe alpha.

En particulier, toute fonction borélienne est une fonction baire alpha.

Ex: f est baire 1 (=limite de fonctions continues), ssi la réciproque d'un
ouvert est un F_sigma (union dén de fermés). Autre caractérisation
(Bruckner) pour tout ensemble parfait P, il existe un x dans P tel que f|P
soit continue en x. (Rappel: tout borel non dénombrable contient un
ensemble parfait non vide).

Une dérivée est baire 1, et aussi Darboux (cf Bruckner)

~/posts/forum/maths/agreg_limites_fonctions_continues:
- Une fonction est continue en dehors d'un ensemble négligeable ssi la
réciproque de tout ouvert et l'union d'un ouvert et d'un négligeable.
- Une fonction est continue sur un résiduel (un G_delta dense, ie une
  intersection dénombrable d'ouvert denses) ssi la réciproque d'un ouvert
  est l'union d'un ouvert et d'un maigre (un F_delta formés de fermés
  d'intérieur vide).
  Ex: c'est le cas d'une fonction Baire 1 (car un F_delta est l'union d'un
  ouvert (l'intérieur des fermés) et d'un maigre (la frontière des fermés),
  donc une baire 1 est continue sur un résiduel.

Uniformité
==========

- si f_n: X-> Y, Y complet, f_n unif conv <=> unif Cauchy
- f_n continue converge vers f uniformément => f continue
- f_n dérivable, converge simplement en x_0 et f'_n converge uniformément
  vers g, alors f_n converge uniformément vers f (sur un compact) et f'=g
- f_n analytiques -> f uniformément => f analytique
- si f_n converge pp vers f de manière bornée par g L_1, alors \int f_n ->
  \int f.

Equicontinuity
---------------
Convergence uniforme = convergence simple + équicontinuité

In mathematical analysis, a family of functions is equicontinuous if all
the functions are continuous and they have equal variation over a given
neighbourhood, in a precise sense described herein. In particular, the
concept applies to countable families, and thus sequences of functions.

The equicontinuity appears in the formulation of Ascoli's theorem, which
states that a subset of C(X), the space of continuous functions on a
compact Hausdorff space X, is compact if and only if it is closed,
pointwise bounded and equicontinuous. As a corollary, a sequence in C(X) is
uniformly convergent if and only if it is equicontinuous and converges
pointwise to a function (not necessarily continuous a-priori). In
particular, the limit of an equicontinuous pointwise convergent sequence of
continuous functions f_n on either metric space or locally compact space[1]
is continuous. If, in addition, f_n are holomorphic, then the limit is also
holomorphic.

The uniform boundedness principle states that a pointwise bounded family of
continuous linear operators between Banach spaces is equicontinuous.

Ascoli
-------
https://en.wikipedia.org/wiki/Arzel%C3%A0%E2%80%93Ascoli_theorem
    Let X be a compact Hausdorff space. Then a subset F of C(X) is relatively compact in the topology induced by the uniform norm if and only if it is equicontinuous and pointwise bounded. 
Generalisation:
    Let X be a compact Hausdorff space and Y a metric space. Then F ⊂ C(X, Y) is compact in the compact-open topology if and only if it is equicontinuous, pointwise relatively compact and closed. 

Application:
    Consider a sequence of real-valued continuous functions { fn }n ∈ N defined on a closed and bounded interval [a, b] of the real line. If this sequence is uniformly bounded and equicontinuous, then there exists a subsequence { fnk }k ∈ N that converges uniformly.
    The converse is also true, in the sense that if every subsequence of { fn } itself has a uniformly convergent subsequence, then { fn } is uniformly bounded and equicontinuous. 

Corollaire: on a family F of equicontinuous functions φ:X→Y, the topology
of pointwise convergence on X, the topology of pointwise convergence on a
(fixed) dense subset of X and the topology of uniform convergence on
compact subsets of X coincide. [Pr: prendre une sous-séquence qui converge
uniformément]

Montel
------
https://en.wikipedia.org/wiki/Normal_family
Normal=precompact (=relativement compact) pour une famille de fonctions
(pour la norme compacte ouverte)

https://en.wikipedia.org/wiki/Montel%27s_theorem
- Uniformly bounded holomorphic families are normal
The first, and simpler, version of the theorem states that a uniformly bounded family of holomorphic functions defined on an open subset of the complex numbers is normal.
This theorem has the following formally stronger corollary. Suppose that F is a family of meromorphic functions on an open set D. If z0 ∈ D is such that F is not normal at z0 and U ⊂ D is a neighborhood of z 0 then ⋃ f ∈ F f(U) is dense in the complex plane.
- Functions omitting two values:
The stronger version of Montel's Theorem (occasionally referred to as the Fundamental Normality Test) states that a family of holomorphic functions, all of which omit the same two values a , b ∈ C {\displaystyle a,b\in \mathbb {C} } a,b\in {\mathbb {C}}, is normal.

Integrabilité uniforme
----------------------
http://math.stackexchange.com/questions/35115/classifying-the-compact-subsets-of-lp
https://en.wikipedia.org/wiki/Fr%C3%A9chet%E2%80%93Kolmogorov_theorem
Conditions pour que B soit relativement compact dans L^p:
uniform p-integrability (=l'intégrale L_p en dehors d'une boule de rayon r tend vers 0 uniformément en r) and p-tightness (=la translation est continue uniformément)

https://en.wikipedia.org/wiki/Uniform_integrability
    Dunford–Pettis theorem[12]
    A class of random variables Xn ⊂ L1(μ) is uniformly integrable if and only if it is relatively compact for the weak topology σ(L1,L∞)

Dini uniform convergence theorem
--------------------------------

https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8mes_de_Dini
https://en.wikipedia.org/wiki/Dini%27s_theorem<Paste>

Une suite monotone de fonction continues (f_n <= f_{n+1}) qui convergent
simplement vers une fonction f continue sur [a,b] converge uniformément
vers f.

2ème Théorème: La convergence simple d'une suite de fonctions réelles d'une
variable réelle définies et croissantes sur un segment [a, b] de ℝ vers une
fonction continue sur [a, b] implique la convergence uniforme.

Helly's Selection theorem
-------------------------
http://en.wikipedia.org/wiki/Helly%27s_selection_theorem

Si f_n: I->R est uniformément localement de bounded variation, et f_n est
uniformément borné en un point t \in I, alors il existe une sous-suite des
f_n et une fonction f locallement de bounded variation tel que
  - cette sous suite converge simplement partout vers f.
  - de même pour une convergence locale dans L_1
  - et localement, |df/dt|_L1 (df au sens des distributions) <= lim inf
    |df_{n_k}/dt|_L1

Même hypothèse, on suppose que f_n tend simplement vers f pour tout x
(c'est tjrs le cas d'après ce qui précède quitte à prendre une sous suite)
Alors df_n tend préfaiblement vers df ie Int phi df_n tend vers Int phi df
pour toute phi continue.

### Cas particulier

f_n fonctions croissantes et uniformément bornées. Alors il existe une
sous-suite qui converge vers f croissante.
Si de plus f est continue la convergence est localement uniforme.

[Preuve: on extrait des sous-suites qui convergent sur un ens dénombrable (dense) de points, puis on rajoute les points de discontinuité (qui sont dénombrables)]

### Rappels

Une fonction BV est la diff de deux fonctions croissantes.
Une fonction croissante est dérivable pp, et sa dérivée f' est intégrable,
avec Int f' <= f(b-)-f(a+)

L'escalier de Cantor montre qu'il n'y a pas toujours égalité (f(0)=0,
f(1)=1, f dérivable pp avec f'(x)=0)
L'égalité arrive si f est absolument continue. Réciproquement la primitive
d'une fonction intégrable est abs continue.

Si f est continue et dérivable partout (sf en un ens dénombrable), alors f'
n'est pas forcément L_1. Ms si f' est L_1 alors f est la primitive de f',
donc est abs continue.
