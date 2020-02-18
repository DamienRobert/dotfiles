vim: ft=markdownlight fdm=expr

Euclide
=======

Fractions continues
-------------------

http://www.albany.edu/~hammond/gellmu/examples/confrac.pdf

http://en.wikipedia.org/wiki/Continued_fraction
http://en.wikipedia.org/wiki/Euclidean_algorithm

Note: dans le développement en fraction continue a/b=[x_1,...,x_k]
les x_k sont les quotients dans l'algo d'Euclide et les approximants
partiels sont les quotients des coefficients de Bézout (à un signe près).

De plus les approximants partiels sont les meilleurs approximants (cf aussi
Agreg)

Euclide Etendu
--------------

r_i=q_{i+1}r_{i+1}+r_{i+2}
On a r_i=u_i a+ v_i b; et si r_{k+1}=0, gcd(a,b)=r_k et r_k=u_k a+v_k b

(r_{i+1}; r_{i+2})=(0 1; 1 -q_{i+1})(r_i; r_{i+1})
                  =(u_{i+1} v_{i+1}; u_{i+2} v_{i+2})(a b)
Donc R_{i+1}=Q_{i+1}R_i=UV_{i+1}R_0
où UV_i=Q_i Q_{i-1}... Q_0; UV_{i+1}=Q_{i+1} UV_i
(on remarque que det Q_i=-1, tr Q_i=-q_i, ie car(Q_i)=X^2+q_iX-1.)

En particulier :
- det UV=(-1)^i=\pm 1, ie u_i et v_i sont premiers entre eux).
- gcd(r_i,v_i)=gcd(a,v_i); gcd(r_i,u_i)=gcd(b,u_i)
- a=(-1)^i(v_{i+1}r_i-v_i r_{i+1}); b=(-1)^{i+1}(u_{i+1}r_i-u_i r_{i+1})
  [Ecrire (a,b)=UV_{i}^{-1}R_i]

On a |u_i|<b/r_i et |v_i|<a/r_i, autrement dit |a/b+v_i/u_i|<1/u_i^2.
Donc les v_i/u_i approximent a/b (fractions continues), et ce sont les
seuls qui approximent aussi bien (on va voir qu'on peut faire plus fort)

Si U_i=(-1)^i u_i, V_i=(-1)^(i+1) v_i (ie on remplace la matrice Q_i par
|Q_i| dans les formules de récurrence pour simplifier les signes), on a
r_i=(-1)^i (aU_i-bV_i). Or  U_iV_{i+1}-V_{i+1}U_i=(-1)^i, ie
V_i/U_i < a/b si i pair, et a/b < V_i/U_i sinon.
On a |a/b - V_i/U_i|<1/(U_i U_{i+1})<1/(2U_i^2)
Réciproquement, si |a/b-v/u|<1/(2u^2), alors u=U_i et v=V_i.

MCA Lemme 3.12: |u_i|<=b/r_{i-1}
Exo 3.13: u_{2i} et v_{2i+1} sont positif, u_{2i+1} et v_{2i} sont
négatifs, et 0=u_1<1=u_2 \leq |u_3| < u_4 <... < u_{l+1}, 0=v_0<1=v_1 \leq |v_2| < v_3 <... < v_{l+1}

Forme polynômiale: deg u_i<deg b-deg (r_i), deg v_i<deg a-deg(r_i).
De manière plus précise: deg u_i=deg b-deg(r_{i-1}) et deg v_i=deg
a-deg(r_{i-1}).
Réciproquement, si deg(ua+vb)+deg(u)<deg(b), autrement dit si
|a/b+v/u|=fraction rationelle de degré < - 2 deg u, alors u=alpha u_i et
v=alpha v_i à un facteur constant alpha près.

Modern Computer Algebra: deg u_{i+1}=deg q_i+deg u_i [Lemme 3.10]

Reconstruction Rationelle
-------------------------

  r=tf mod m, deg r<k, deg t<=deg m-k; ie r/t=f mod m avec r et t petits
  ie r=tf+ \alpha m, avec r et t "petits".

MCA Lemme 5.15 p.107: si r=ua+vb, avec deg r+deg v<deg a,
alors on a à une constante prêt r=r_i, u=u_i, v=v_i, où i est le plus petit
entier tel que deg r_i<= deg r.
Cor: si r/t=f mod m comme avant, r=r_i (r_i=u_i m + v_i f), t=v_i

Section 5.10 p.116
r/t=f mod m, avec |r|<k et t<=m/k

Lemme 5.25: si r=ua+vb avec r<k et v<=a/k pour un k entier (en particulier
|rv|<a), alors r,u,v=r_i,u_i,v_i ou r_i*,u_i*,v_i*
En particulier pour la reconstruction rationelle, on a r_i/v_i ou r_i*/v_i*
Si de plus |r|<k/2 il y a au plus une solution: r_i/v_i=r_i*/v_i*

En résumé: Modern Computer Algebra: $5.10 p.116
On cherche f=r/t mod m; |r|<k, 0<=t<=m/k; ie r=tf+sm.
Soit r_i les restes d'Euclide appliqué à f et m; et r_j le plus grand reste <k (r_j<k<=r_{j-1}). r_j=t_j f+s_jm.
Alors (à une constante près), (r,t,s)=(r_j,t_j,s_j) ou (r*_j, t*_j, s*_j)
avec x*_j=x_{j-1}-q x_j et q est le plus petit entier tel que r*_j<k.
[En gros on a deux solutions car la fraction peut être positive ou
négative. Si on demande de plus |r|<k/2 alors on n'a plus qu'une solution:
(r_j,t_j,s_j)=(r*_j,t*_j,s*_j).]

Résumé: a/b est bien approximé par -v_i/u_i (|a/b-p/q|<1/2q^2).
        et r_i/u_i approxime bien a modulo b


Irrationalité
=============

* Liouville-Roth irrationality measure:
http://mathworld.wolfram.com/IrrationalityMeasure.html

the largest possible value for μ such that 0 < | x − p/q | < 1/q^μ is satisfied by an infinite number of integer pairs (p, q) with q > 0.
Ou encore l'inf des μ pour lesquels il n'y a qu'un nombre fini de solutions, ou encore l'inf des μ pour lesquels | x − p/q | > 1/q^{μ+ε} pour p,q assez grands.

- si x rational, μ=1
- Dirichlet's approximation theorem: for an irrational α, the inequality
    | α − p/q | < 1/q^2
  is satisfied by infinitely many integers p and q, ie irrationality measure >= 2.
  Meilleure amélioration possible:
  https://en.wikipedia.org/wiki/Hurwitz%27s_theorem_(number_theory)
  for every irrational number ξ there are infinitely many relatively prime integers m, n such that | ξ − p/q | < 1/sqrt{5}q^2.
- Transcendental numbers have irrationality measure 2 or greater
- The Liouville numbers are precisely those numbers having infinite irrationality measure
- Almost all numbers have an irrationality measure equal to 2.
- Roth: an algebraic number as irrationality measure = 2
  Liouville: irrationality measure of a degree d alg number is <= d.

μ(x)=1+lim sup(ln q_(n+1))/(ln q_n)
    =2+lim sup(ln a_(n+1))/(ln q_n)
où [a_0, a_1, ...] est le développement en fraction continues de x et
p_n/q_n le nième convergent.

=> prouver l'irrationalité: si on exhibe |α-r_n/s_n|=o(1/s_n)
   ie |s_n α-r_n|->0, alors α est irrationel;
   et si |α-r_n/s_n|=O(1/s_n^{2+ε}) alors α est trascendant.
   Utilisé par Apery pour la preuve de l'irrationalité de ς(3):
   https://math.stackexchange.com/questions/62878/proving-irrationality

* Résultats de transcendance:
- https://en.wikipedia.org/wiki/Gelfond%E2%80%93Schneider_theorem (1934)
    If a and b are algebraic numbers with a ≠ 0, 1, and b irrational, then any value of ab is a transcendental number.

- https://en.wikipedia.org/wiki/Lindemann%E2%80%93Weierstrass_theorem (1885)

Lindemann–Weierstrass theorem — if α1, ..., αn are algebraic numbers that are linearly independent over the rational numbers ℚ, then e^α1, ..., e^αn are algebraically independent over ℚ.

An equivalent formulation — If α1, ..., αn are distinct algebraic numbers, then the exponentials e^α1, ..., e^αn are linearly independent over the algebraic numbers.

Application:  e^α is transcendental for every non-zero algebraic number α, thereby establishing that e and π are transcendental.
