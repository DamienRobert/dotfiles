vim: ft=markdownlight fdm=expr

Differential Equations
======================

* Trouver une solution particulière d'une ODE:
https://en.wikipedia.org/wiki/Method_of_undetermined_coefficients
https://en.wikipedia.org/wiki/Annihilator_method
https://en.wikipedia.org/wiki/Variation_of_parameters

* Existence: Cauchy Peano
https://en.wikipedia.org/wiki/Peano_existence_theorem
 y'(x)=f(x,y(x))
f continue => existence locale (mais pas unicité)

* Existence au sens faible
https://en.wikipedia.org/wiki/Carath%C3%A9odory%27s_existence_theorem

Consider the differential equation
    y′(t)=f(t,y(t)),y(t0)=y0
    f(t,y) is continuous in y for each fixed t
    f(t,y) measurable in t for each fixed y
    there is a Lebesgue-integrable function m(t) |t−t0|≤a such that |f(t,y)| ≤ m(t) 
then the differential equation has a solution in the extended sense in a neighborhood of the initial condition. (ie y is absolutely continous and satisfy the eq diff almost everywhere).

* Cauchy-Lipschitz:
https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Cauchy-Lipschitz
https://en.wikipedia.org/wiki/Picard%E2%80%93Lindel%C3%B6f_theorem
http://math.univ-lyon1.fr/~vovelle/2Cours.pdf

E désigne un espace de Banach, Ω un ouvert de R×E et f une fonction continue de Ω dans E. 
 (1) x'(t) = f(t,x(t))
Si la fonction f est continue et localement lipschitzienne par rapport à la deuxième variable, il existe une et une seule solution maximale à l'équation (1) respectant la condition de Cauchy C. Son intervalle de définition est ouvert.

- Si de plus f est globalement lipschitzienne par rapport à la deuxième
  variable, alors toute solution maximale est globale (c'est-à-dire définie
  sur I tout entier).

- Th de sortie de tout compact (si Omega=IxOmega' dans R^d, je pense que ça
  marche dans le cas Banach aussi): soit ]alpha,beta[ l'intervalle max de
  définition de x. Si beta est dans I (l'intervalle de déf de f pour t)
  alors x sort de tout compact au voisinage de beta: pour tout compact K de 
  Omega', il existe \epsilon tel que x(t) \not\in K pour tout t dans
  ]beta-epsilon,beta[

Rem: si f est continue, définie sur un voisinage V=I(t0,eta)xB(x0,r),
qu'on note M la borne de f sur V et L la constante de Lipschitz par rapport
à la deuxième variable, alors il existe une solution au problème de cauchy
défini sur I(t0,eta'), avec eta'=min(eta, r/2M). En particulier eta' ne
dépend pas de L.

Linear differential equation
============================

https://en.wikipedia.org/wiki/Linear_differential_equation

y'=Ay+b, where the matrix A, B are non constant
y(x0)=y0

Let U be the solution of the homogeneous equation U'=AU
U(x0)Id
(the vectors of U give the solutions of the homogeneous equation)

We look at Y=UZ (variation de la constante)
=> UZ'=B, ie
y=U(y0+\int_x0^x U^-1 b)

If A(x1) commute with A(x2) for all x1,x2, then
U(x)=e^{∫_x0^x A(x)dx}

Coefficients constants
----------------------

y^(n)+a_1 y^(n-1)+...+a_n y=0
se transforme en Y'=AY avec
A=(0 1 0 ...
   0 0 1
  -a3 -a2 -a1)
ie la matrice companion du pol P=X^n+a_1 X^{n-1}+...+a_n

En voyant A comme la matrice de multiplication par X mod P, on en déduit
que si A=\prod (X-\lambda_i)^n_i la décomp de Jordan de A est donnée
par les blocs de Jordans de taille n_i J(\lambda_i)

Exponential of a matrix
-----------------------

https://en.wikipedia.org/wiki/Matrix_exponential#Computing_the_matrix_exponential
http://math.stackexchange.com/questions/33851/how-to-calculate-the-matrix-exponential-explicitly-for-a-matrix-which-isnt-diag

Pour un bloc de Jordan J=\lambda Id + N
e^J=e^\lambda e^N
avec e^N de la forme des diagonales successives: (1...1) (t...t) (t^2/2
...) ... (t^n/n! ...)
et donc e^J=diags (e^\lambda ... e^\lambda) (e^\lambda t... e^\lambda t)...

Et donc dans le cas d'une équa diff linéaire plus haut, comme
Y=(y y' ...) on a comme base de solutions pour un bloc de Jordan
y=e^\lambda t, y=t e^\lambda t, ... y=t^n/n! e^\lambda t

Et donc les sols générales sont t^j e^\lambda_i si lambda_i est racine de P
de mult > j.

Méthode de Laplace
------------------

https://en.wikipedia.org/wiki/Laplace_transform

Lf(s)=∫_0^∞ f(t)e^{−st} dt

L(af+bg)=aF+bG
L(t^n f)=(-1)^n F^(n)(s)
L(f/t)=\int_s^\infty F
L(f')=sF(s)-f(0)
L(f'')=s^2F(s)-s f(0) -f'(0)
L(f^(n))=s^n F(s) - \sum_k=1^n s^{n-k} f^(k-1)(0)
L(\int_0^t f)=L(u*f)=L(u)L(f)=F/s
L(e^{at} f(t))=F(s-a)
L(f(t-a)u(t-a))=e^{-as} F(s)
L(f*g)=L(f)L(g)

L(\delta)=1 où \delta=dirac
L(u)=1/s où u=Heaviside function=\int dirac
L(t^n e^{-at} u(t))=n! / (s+a)^{n+1}

L'équation différentielle linéaire devient, si F=L(y):
s^n F+a_1 s^{n-1} F + ... = c(s) où c=Expression en les y^(i)(0)
F=c(s)/P(s)
La décomposition en élément simple de F redonne avec la formule de Laplace
inverse que les solutsions sont les t^j e^\lambda_i

Equation d'ordre 1
------------------

https://en.wikipedia.org/wiki/Time_constant
    dV/dt + 1/τ V = f(t)
1) f(t)=Ae^{jwt}
   => V=V_0 e^{-t/τ} +A/(j w +1/τ) (e^{j w t} - e^{-t/τ})
2) f(t)=Au(t), u fonction d'heavyside
   => V = V0 e^{−t/τ} + Aτ (1 − e^{−t/τ})
      [=limite de la solution précédente avec w->0]

Equation d'ordre 2
------------------

Si on a des coeffs réels, et qu'on cherche les solutions réelles, il faut
combiner les sols complexes pour avoir des cosinus/sinus (hyperboliques ou
non).

Via la transformée de Laplace ça revient à regarder la décomposition de la
fraction avec des dénominateurs irréductibles de degré 2; on a
L(sin(wt) u(t))= w/(s^2+w^2)
L(cos(wt) u(t))= s/(s^2+w^2)
L(sinh(wt) u(t))= w/(s^2-w^2)
L(cosh(wt) u(t))= s/(s^2-w^2)
Et on peut décaler le s de +\alpha en multipliant par e^{-\alpha t}
ça permet de traiter tous les cas.

Example: circuit RLC
https://en.wikipedia.org/wiki/RLC_circuit

d^2/dt^2 I(t) + 2α d/dt I(t) + ω0^2 I(t)=0.
avec α=R/2L, ω0^2=1/LC

Damping factor: \zeta=\alpha/w0
Delta=\alpha^2-w0^2, donc \zeta>1 <=> 2 racines réelles distinctes
                          \zeta=1 <=> racine réelle double
                          \zeta<1 <=> 2 racines complexes
1) Overdamped (\zeta>1), I=comb linéaire en e^{s_i t} où s_i racine du pol car
   s_i=-w0(\zeta \pm \sqrt{\zeta^2-1})
2) Critically damped (\zeta=1)
   I=e^{-αt)(at+b)
3) Underdamped (\zeta<1)
   I=e^{-αt)(a cos(w_d t)+b sin(w_d t))=e^{-αt)(c sin(w_d t+\phi))
   où w_d=w_0 \sqrt{1-\zeta^2}

Laplace transform: V(s)=I(s)(R+Ls+1/Cs)
