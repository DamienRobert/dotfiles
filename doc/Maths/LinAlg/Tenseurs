vim: ft=markdownlight fdm=expr

Vecteurs
========

- https://en.wikipedia.org/wiki/Vector_algebra_relations
- https://en.wikipedia.org/wiki/Vector_calculus_identities
 A ⋅ ( B × C ) = B ⋅ ( C × A ) = ( A × B ) ⋅ C =[A,B,C]
 A × ( B × C ) = ( A ⋅ C ) B − ( A ⋅ B ) C
 A × ( B × C ) + C × ( A × B ) + B × ( C × A ) = 0  (Jacobi identity)
 ( A × B ) ⋅ ( C × D ) = ( A ⋅ C ) ( B ⋅ D ) − ( B ⋅ C ) ( A ⋅ D ) (Binet–Cauchy identity in three dimensions)

- https://en.wikipedia.org/wiki/Binet%E2%80%93Cauchy_identity
A general form, also known as the Cauchy–Binet formula, states the following: Suppose A is an m×n matrix and B is an n×m matrix. If S is a subset of {1, ..., n} with m elements, we write AS for the m×m matrix whose columns are those columns of A that have indices from S. Similarly, we write BS for the m×m matrix whose rows are those rows of B that have indices from S. Then the determinant of the matrix product of A and B satisfies the identity
    det ( A B ) = ∑_{S ⊂ { 1 , … , n } |S|=m} det (A_S) det (B_S)

Hodge star: https://en.wikipedia.org/wiki/Hodge_star_operator
     α ∧ ⋆β = ⟨α, β⟩ ω 
     where ⟨ ⋅ , ⋅ ⟩ denotes the inner product on k-vectors and ω is the preferred unit n-vector.

=> Cross product in R^3: a⃗ × b⃗ =∗(a⃗ ∧ b⃗ )

Geometric algebra
=================

References
----------
https://math.stackexchange.com/questions/1852691/why-use-geometric-algebra-and-not-differential-forms

* Geometric algebra:
- https://en.wikipedia.org/wiki/Geometric_algebra

- https://en.wikipedia.org/wiki/Conformal_geometric_algebra

- http://geocalc.clas.asu.edu/html/UAFCG.html
David Hestenes, Hongbo Li & Alyn Rockwood. In: G. Sommer (ed.), Geometric Computing with Clifford Algebra

(Bof https://arxiv.org/pdf/1306.1358.pdf
Geometric operations implemented by conformal geometric algebra neural nodes
Eckhard HITZER)

* Geometric calculus:
- https://en.wikipedia.org/wiki/Geometric_calculus

* Books/Pdf:

- http://geocalc.clas.asu.edu/pdf/Tutorial%20on%20Geometric%20Calculus.pdf
David Hestenes Tutorial on Geometric Calculus

- http://www2.montgomerycollege.edu/departments/planet/planet/Numerical_Relativity/bookGA.pdf
An Introduction to Geometric Algebra and Calculus, Alan Bromborsky
New url: https://www.scribd.com/document/354134564/An-Introduction-to-Geometric-Algebra-and-Calculus-Bromborsky-A-pdf

- Haskell: https://crypto.stanford.edu/~blynn/haskell/ga.html
           http://www-cs-students.stanford.edu/~blynn/haskell/cga.html
=> ! http://www.faculty.luther.edu/~macdonal/GA&GC.pdf
     A Survey of Geometric Algebra and Geometric Calculus, Alan MacDonald

- Books of MacDonald (in Books/):
http://www.faculty.luther.edu/~macdonal/laga/
http://www.faculty.luther.edu/~macdonal/vagc/

* Discussions:
https://math.stackexchange.com/questions/2210804/is-hesteness-geometric-algebra-widely-accepted
https://www.reddit.com/r/math/comments/8z9y9c/what_is_the_status_of_geometric_algebra_among/

Plucker coordinates
-------------------

- https://en.wikipedia.org/wiki/Pl%C3%BCcker_coordinates
- Lien avec GA: http://www.geometricalgebra.net/plucker_coordinates.html
- https://www.cs.cmu.edu/afs/cs/academic/class/15462-s09/www/lec/12/lec12.pdf
  algèbre de Clifford de la quartique de Klein
- http://robotics.stanford.edu/~birch/projective/projective.pdf
  An Introduction to Projective Geometry (for computer vision)
- Klein quartic et plucker et Clifford: https://arxiv.org/pdf/1311.0131.pdf
  A Clifford algebraic Approach to Line Geometry

* Formules: http://web.cs.iastate.edu/~cs577/handouts/plucker-coordinates.pdf

Plucker: d direction de la ligne, m=OPxOQ=OP x d pour P,Q \in D.
Si on voit P et Q comme des points de P^3,
(m,d) est le vecteur des mineurs 2x2 de la matrice engendrée par P et Q.

R \in D <=> OR x d=m.
Si d est normalisé pour être de norme 1, ||m|| donne la distance de O à D,
la projection de O sur D est dxm. Si on se fixe un point R, on a le même d, et m_R:=(P-R)xd=m-ORxd. La projection de R sur D est R+dxm_R.

Si (d1, m1) et (d2, m2) sont les coords de Plucker de deux lignes, alors
le moment d'un point de D2 par rapport à D1, projeté sur D1, est d1m2+d2m1
C'est la forme quadratique canonique D1*D2 sur les coordonnées de Plucker.

Th 1: la distance entre (d1,m1) et (d2,m2) est de
- ||(d1,m1)*(d2,m2)||/||d1xd2|| si D1 n'est pas // à D2
- ||d1x(m1-m2/s)||/||d1||^2 si d2=s d1.
Dans le cas skew (le premier cas), on a p1*-p2* (points les plus proches)
= ||(d1,m1)*(d2,m2)||/||d1xd2||^2 d1xd2
Section 5.1: coordonnées de Plucker de la perpendiculaire commune, Section
5.2: coordonnées de p1* et p2*.

A Survey of Geometric Algebra and Geometric Calculus, Alan Macdonald
---------------------------------------------------------------------

Geometric algebra G^n = Clifford algebra for the scalar product. So uu=u.u=|u|^2.

* Fundamental identity: si u et v sont des vecteurs, uv = u.v + u ∧ v.
- u·v=1/2(uv+vu) and u∧v=1/2(uv−vu); the inner and outer products are the symmetric and antisymmetric parts of the geometric product.
- uv is a bivector ⇔ u·v=0 ⇔ u⊥v ⇔ uv=u∧v ⇔ uv=−vu.
  In particular, for i =! j, ei ej=ei∧ej.
- uv is a scalar ⇔ u∧v=0 ⇔ u‖v ⇔ uv=u·v ⇔ uv=vu

Déf: 
- (unit) pseudoscalar I=e1e2···en a pour inverse I^{-1}=en ... e1 = \pm I.
- Blade: product of non zero orthogonal vectors. Si e_i base canonique, les
blades en les e_i forment une base canonique e_I. La norme de A=\sum a_I
e_I est \sum a_I^2. Si A est une blade, A^2 = \pm |A|^2.
- La dual d'un multivector est A*:=A I^{-1}. Si A est une blade, A* est la
blade du complément orthogonal. Dans R^3, (u∧v)*=u x v.

Si A est un j-vecteur et B un k-vecteur, on peut définir la contraction
à gauche A.B=<AB>_{k-j} (la composante k-j du produit), et A∧B=<AB>_{k+j}.
(A.B)*=A ∧ B*, (A∧B)*=A.B*. Le . est associatif mais pas le ∧. [Update: il
semblerait que si]
Si A et B sont des blades, A.B \subset B (et si A \subset B, A.B=AB)
et A \cap B={0} <=> A∧B \ne 0 (et dans ce cas A∧B est la blade de A+B).

* Extended fundamental identity: si a un vecteur et B une k-blade,
                         aB=a.B + a∧B.
Si on décompose a en a=a_par + a_orth (relativement à B), on a
a.B=a_par.B=a_par B est une (k-1)-blade (ou 0), et
a∧B=a_orth∧B=a_orth B est une (k+1)-blade Vec(a,B) (ou 0), et donc
  - Projection: a_par=(a.B)B^{-1}.    a.B=0 <=> a ⊥ B
  - Rejection: a_orth=(a∧B)B^{-1}.    a∧B=0 <=> a // B
On en déduit a \in B <=> a∧B=0 <=> a.B*=0.

* Réflections: la réflexion M_B(a) de a à travers la k-blade B est donnée par
M_B(a)=-(1)^{k+1} BaB^{-1}. Si B est un hyperplan et b=B* le vecteur normal à B,
on obtient M_B(a)=-bab^{-1}.

* Volumes: si u_1, ..., u_k sont k vecteurs linéairement indépendants,
B=u_1 ∧ ... ∧ u_k est une k-blade B=b_1 b_2 ... b_k = b_1∧...∧b_k où les
b_i sont orthogonaux, et |B|=Prod |b_i| est le volume associé.

* Plans:
soit i l'unit pseudoscalar d'un plan dans R^n. Alors i^2=-1, et si
u, v sont deux vecteurs dans i, on a
uv = u.v + u ∧ v=|u||v|(cos θ + i \sin θ) = r e^{i θ}. i θ se voit comme un
arc de cercle d'angle θ.

Les bivecteurs dans G^3 (avec 1) forment l'algèbre de quaternions:
i_1=e_3e_2, i_2=e_1e_3, i_3=e_2e_1 forment une base des plans de l'espace.

Rotations de d'un angle θ dans le plan i:
R_{iθ}(u)=R^{-1}uR où R=e^{i θ/2}.
Dans R^3, l'axe de la rotation est donné par n=i*=i/I, d'où R=e^{nI θ/2}.
En écrivant R=b_1b_2, on voit qu'un élément de SO(n) s'écrit comme la
conjugaison d'un produit B=b_1...b_{2k} de 2k-vecteurs. Les tels B donnent
le Spin group de SO(n).
[https://en.wikipedia.org/wiki/Spin_group
L'algèbre de Lie spin =~ Cl^2(V), Pin(V)={sous groupe de Cl(V) des v_1...v_k où
|v_i|=1}, et Spin(V)=Pin(V) \cap Cl^{pair}(V)]

* Linear algebra
Si f est une transformation linéaire de R^n, on peut l'étendre à G^n
via f(A∧B)=f(A)∧f(B) [par ex: f(u∧v)=f(u)∧f(v) => f(parallélogramme
engendré par u et v)=parallélogramme engendré par f(u) et f(v)].
f(I)=dét(f) I

Exemple: (Cramer's rule) pour résoudre l'équation affine de dim 4
v=c_1 u_1+c_2 u_2 + c_3 u_3 + c_4 u_4, on a
u_1 ∧ v ∧ u_3 ∧ u_4 = c_2(u_1 ∧ u_2 ∧ u_3 ∧ u_4)

Résumé: On a si A est une j-blade:
R_{iθ)(A)=e^{-i θ/2} A e^{i θ/2}.       Rotation d'angle θ dans le plan i.
P_B(A)=(A.B)B^{-1}                      Projection orth. sur la blade B.
M_B(A)=(-1)^{j (k+1)} B A B^{-1}        Réflexion sur la k-blade B.
A.B = complément orthogonal dans B de P_B(A) la proj de A sur B.
[Macdonald, linear and geometric algebra:
f orthogonale s'écrit f(v)=(-1)^r VvV^{-1}, f antisymmétrique s'écrit
f(v)=v.Omega pour un bivecteur Omega unique]

Attention: P_B(A) est la projection orth de A dans B ssi A ne contient pas
de vecteur orthogonal à B, sinon on a P_B(A)=P_B(v_0) ∧ ...=0.
De même, A.B=0 si A contient un vecteur orthogonal à B.

L'angle θ entre deux blades vérifie cos θ=|P_B(A)|/|A|=|A.B|/|A||B|.

Fourier expansion: A=\sum_J a_J e_J, on a e_J=<e_J^{-1} A>_0.

* Geometric calculus
∇ = \sum e_j ∂_j. Si f est vectorielle, on a ∇^2 f=∇(∇f).
Equation de Maxwell: (∂_t + ∇)F = 0 où F=e+B, e electric field, B=-b*
magnetic bivector. En particulier le champ électro magnétique F satisfait
l'équation des ondes: (∂^2_t + ∇^2)F=0.

On généralise aux multivecteurs: ∇ = \sum e_J^{-1} ∂_J
où ∂_J F(X)= lim_{τ->0} [F(X+τ P_X(A))-F(X)]/τ

Intégrale: F(xx) multivector valued field on manifold m.
\int_M d^m xx F où d^m xx=I_m(x) d^mx, I_m(x)=pseudoscalar of the tangent
space of M at x, and d^mx=element of m-volume at M.

* Fundamental theorem of geometric calculus
  \int_M d^m xx ∂∇F = \int_∂M d^{m-1} xx F.

  Corollaires: formules de Cauchy, théorème des résidus,
  généralisation qui donne
  F(x_0) comme une intégrale sur V de ∇F et une sur ∂V de F,
  ∇ est invertible (ie on a des antidérivatives).

* Modèle homogène
  Une aire orientée PQR est représentée par le trivecteur p∧q∧r
  où p est l'image de P par l'application R^n -> R^{n+1}.
                                          (x,y,z)->(1,x,y,z)

  Join and meet: si A \cap B=0, alors join: Vec(A,B)=A∧B
  et le meet: A \cap B=A*.B où le * est pris relativement à Vec(A,B).

Autres références
-----------------

* Wikipedia

https://en.wikipedia.org/wiki/Geometric_algebra
     a b = a ⋅ b + a ∧ b, 
         =1/2(ab+ba) + 1/2(ab-ba)

Exterior product: C∧D:=<CD>_{r+s} pour une r-blade C et s-blade D, étendu par linéarité.
Commutator product: C×D:=1/2(CD−DC).
Regressive product (aka meet): AvB = [(AI^-1)∧(BI^-1)]I où I est la pseudo-unité de Vec(A,B).
Regressive and Exterior product are associative.

On a plusieurs "produits scalaires":
* The Inner Products of Geometric Algebra, Leo Dorst

Si B est un bivecteur, et A un multi-vecteur
BA=B.A + BxA + B∧A

On a la reversion: pour une blade A=a_1...a_n, A~=a_n...a_1 =
(-1)^{n(n-1)/2} A.   (A∧B)~ = B~ ∧ A~

Notation: A_r signifie blade de rang r, A signifie multivecteur quelconque.
Produit scalaire: A_r*B_s (A,B blades) = composante de degré 0 de AB
On a A*B=B*A, A~ * A = |A|^2 et si A_r et B_s n'ont pas le même grade, A*B=0.

Contractions:
(A∧B)*C = A*(B_|C).  Explicitement, A_r _| B_s =<AB>_{s-r}
C*(B∧A) = (C|_B)*A.  Explicitement, A_r |_ B_s =<AB>_{r-s}
On a (A_|B)~=B~|_A~

On peut définir le fat product A_r o B_s =<AB>_{|r-s|}
On a: si r<s, A_r _| B_s = A_r o B_s, et A_r |_ B_s = A_r * B_s = 0
      si r=s A_r _| B_s = A_r o B_s = A_r |_ B_s = A_r * B_s
      donc dans tous les cas A_|B+B|_A=AoB+A*B.

Projection: P_B(A)=(A _| B^-1)_|B=(A_|B^{-1})B
Join and meet: si A et B sont des blades, M le meet de A et B, et qu'on
écrit A=A'∧M=A'M et B=M∧B'=MB', on a le join J=A'∧M∧B'.
On a <AM^-1BJ^-1>_0=1, d'où on en déduit
J=A∧(M^{-1} _| B), M=(B_|J^{-1})_|A.

* Geometric Algebra for Subspace Operations
https://arxiv.org/pdf/math/0104102.pdf

- Si A est une blade, elle représente l'espace {x / x∧A=0}
- P_A(x)=(x_|A)A^-1. Si AB=A∧B, P_AB=P_A+P_B; si AB=A_|B, P_AB=P_B-P_A.
- Si A \subset B, A^{-1}B=A^{-1}_|B représente B\A (ie le complément
  orthogonal de A dans B)
- A Δ B est l'élément de plus haut degré de AB. (Ce n'est pas linéaire)

Join from meet: A+B=A∧(B\A^B)
Meet from join: (A(A+B))_|B
Linear join: A∧B. 0 when A^B \ne 0.
Linear meet: (AI)_|B. 0 when A+B \ne I.

Conformal mappings
==================

- https://en.wikipedia.org/wiki/Liouville%27s_theorem_(conformal_mappings)
Any smooth conformal mapping on a domain of R^n, where n > 2, can be expressed as a composition of translations, similarities, orthogonal transformations and inversions: they are Möbius transformations (in n dimensions)

- https://en.wikipedia.org/wiki/M%C3%B6bius_transformation

  Dimension 2 (C=R^2): f(z)=(az+b)/(cz+d), ad-bc \ne 0.
  Möbius transformations are exactly the bijective conformal maps from the Riemann sphere to itself, i.e., the automorphisms of the Riemann sphere as a complex manifold; alternatively, they are the automorphisms of CP^1 as an algebraic variety. The action of the Möbius group on the Riemann sphere is sharply 3-transitive.

  Can be written as a composition of z->z+a (translation), z->a.z
  (homotétie et rotation) and z->1/z (inversion and reflection with respect to the real axis). So they preserve angle and generalised circles.

  * Cross-ratios are invariant under Möbius transformations.
  (z1-z3)(z2-z4)/(z2-z3)(z1-z4); cross ratio=réel <=> generalised circle
  passing through z1, z2, z3, z4.

  * Classification: si M=(a b; c d), on normalise det M=1.
  - Cas parabolique: (tr M)^2=4. M =~ (1 1; 0 1), un point fixe.
    -> de la forme z->z+a.
    Cas non parabolique: M=diag(λ, λ^{-1}), deux points fixes (λ \ne 0,1,-1)
  - Cas elliptique: 0<=(tr M)^2<4. |λ|=1, M=(cos α -sin α; sin α cos α), α=e^{i λ}
    -> de la forme z-> e^iθ z où θ=2α, e^iθ=λ^2.
    Circular: tr M=0 => λ=i
  - Hyperbolic: (tr M)^2>4 et tr M réel <=> λ réel >0.
    -> de la forme z-> e^θz où e^θ=λ^2.
  - Loxodromic: (tr M)^2 \not \in [0,4] <=> |λ| \ne 1.
    -> de la forme z-> k z où k=λ^2.

  * Higher dimension:
  A Möbius transformation is a homeomorphism of R^n¯, the one-point compactification of R^n, which is a finite composition of inversions in spheres and reflections in hyperplanes.
    f(x) = b + αA(x−a)/|x−a|^ϵ,  A is an orthogonal matrix, and ϵ=0 or 2.
  Isomorphism of the Möbius group with the Lorentz group.

- https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation
Rotation d'axe u et d'angle theta:
 q=e^{\theta/2}}u_xi +u_yj+u_z\k)}=\cos{\theta/2)+(u_xi+u_yj+u_zk)\sin(\theta/2)
 p′ = q p q^{−1} (p imaginaire pur)
