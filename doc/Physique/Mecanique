vim: ft=markdownlight fdm=expr

# Newton
Newton's law: https://en.wikipedia.org/wiki/Newton's_laws_of_motion
  1) ∑F=0 ⇔ dv/dt = 0.
  2) F=dp/dt = d(mv)/dt=m dv/dt=ma.
  3) F_A=-F_B
Law of conservation: "Momentum, energy and angular momentum cannot be created or destroyed."

Invariants:
Moment linéaire: p=mv
Moment angulaire: r x p (cross product)
Energie: E=mv^2+E_p

## Moment angulaire
https://en.wikipedia.org/wiki/Angular_momentum

L=Iw où I moment d'inertie (I=r^2 m), w vitesse angulaire (w=r x v/|r|^2)
 =r x p
c'est le moment "Lagrangian" correspondant à la coordonnée angulaire \phi

Torque: τ=r x F (https://en.wikipedia.org/wiki/Torque#Definition_and_relation_to_angular_momentum)
Newton: τ=Iα où α=dw/dt accélération angulaire.

Moment d'inertie: I=\int r^2 dm (https://en.wikipedia.org/wiki/Moment_of_inertia)

# Courbes
https://en.wikipedia.org/wiki/Cycloid
    x=r(t−sin t)
    y=r(1−cos t)

https://en.wikipedia.org/wiki/Brachistochrone_curve
Curve of fastest descent (a cycloid)

https://en.wikipedia.org/wiki/Tautochrone_curve
The curve for which the time taken by an object sliding without friction in uniform gravity to its lowest point is independent of its starting point. The curve is a cycloid (it is the same curve as the Brachistochrone curve).

Equations
=========

https://en.wikipedia.org/wiki/Continuity_equation

https://en.wikipedia.org/wiki/Poisson%27s_equation
Gravity: ∇⋅g = −4πGρ.g=−∇ϕ => ∇^2ϕ=4πGρ, ie ϕ(r)=−Gm/r.
Electrostatics: ∇^2ϕ=-ρ/ε

Lagrangian/Hamiltonian
======================

https://en.wikipedia.org/wiki/Lagrangian_mechanics
https://en.wikipedia.org/wiki/Hamiltonian_mechanics
https://en.wikipedia.org/wiki/Lagrangian_(field_theory)
https://en.wikipedia.org/wiki/Generalized_coordinates
https://en.wikipedia.org/wiki/Poisson_bracket
https://www.quora.com/What-is-the-difference-between-a-Lagrangian-and-a-Hamiltonian
https://physics.stackexchange.com/questions/89035/whats-the-point-of-hamiltonian-mechanics
https://arxiv.org/pdf/1610.09718.pdf HAMILTONIAN  AND  SYMPLECTIC  SYMMETRIES:  AN  INTRODUCTION, ALVARO PELAYO

## Lagrange:
L=T-V=L(q_i, q'_i, t); p_i = ∂L/∂q'_i: moment généralisé
Euler–Lagrange equations: p'_i = ∂L/∂q_i (∂T/∂q_i: force de contrainte
généralisée, -∂V/∂q_i: force généralisée).
Autrement dit: d/dt ∂L/∂q'i = ∂L/∂q_i .

The momentum space Lagrangian L′ and the generalized coordinates derived from L′ are respectively
    L′ = L − ∑ (q_i p'_i + q'_i p_i) , −q'_i = ∂L′/∂p_i ,−q_i = ∂L′/∂p'_i.
Combining the last two equations gives the momentum space Euler–Lagrange equations: d/dt ∂L′/∂p'i = ∂L′/∂p_i .

https://en.wikipedia.org/wiki/Legendre_transformation
  (f*)'=(f')^{-1}. Déf: f∗(x∗) = sup x ∈ I ( x∗ x − f(x))

## Hamiltonian: 
dp/dt = − ∂H/∂q , dq/dt = +∂H/∂p
 où H=L*=\sum q'_i p_i -L = q'.p - L=T+V (car T=p^2/2m=q'.p/2)
On a alors dp/dt=-∂H/∂q, dq/dt=∂H/∂p.

* https://en.wikipedia.org/wiki/Hamiltonian_vector_field
Si w est symplectique, il est non dégénéré donc induit un iso
T*M -> TM. On a donc un champ de vecteur X_H lié à H, comme l'image de dH
par cet iso: dH(Y)=w(X_H,Y).
Localement, w est canonique: w=\sum dq^i ^ dp_i, et alors X_H=J dH=(∂H/∂p, -∂H/∂q). Donc une courbe (q(t), p(t)) vient du flot X_H ssi elle satisfait les équations d'Hamilton.
=> - Hamiltonian H is constant along the integral curves
   - More generally, if two functions F and H have a zero Poisson bracket (cf. below), then F is constant along the integral curves of H, and similarly, H is constant along the integral curves of F. This fact is the abstract mathematical principle behind Noether's theorem
   - The symplectic form ω is preserved by the Hamiltonian flow. Equivalently, the Lie derivative L_X_H ω = 0.
Poisson bracket: { f , g } = ω ( X_g , X_f ) =dg(X_f)=L_X_f(g). On a: X_{f,g}= [X_f,X_g]

* https://en.wikipedia.org/wiki/Symplectomorphism
The infinitesimal version of symplectomorphisms gives the symplectic vector fields. A vector field X ∈ Γ^∞(TM) is called symplectic if L_X ω = 0.
Also, X is symplectic iff the flow ϕ_t : M → M. These vector fields build a Lie subalgebra of Γ^∞(TM).
Examples of symplectomorphisms include the canonical transformations of classical mechanics and theoretical physics, the flow associated to any Hamiltonian function, the map on cotangent bundles induced by any diffeomorphism of manifolds, and the coadjoint action of an element of a Lie Group on a coadjoint orbit.
(The change of variable between one set of canonical coordinates and another is a canonical transformation; et p q sont canoniques quand θ = ∑_i p_i dq^i; où w=-dθ est la forme symplectique; cf [GeoDiff])
(Note: la notion de transformation canonique est essentiellement la même
que symplectomorphism, au moins localement, cf
https://physics.stackexchange.com/questions/105613/which-transformations-are-canonical
https://physics.stackexchange.com/questions/197496/for-an-infinitesimal-transformation-in-phase-space-what-functions-are-allowed-f/197538#197538
https://physics.stackexchange.com/questions/48605/canonical-transformation-and-hamiltons-equations
https://physics.stackexchange.com/questions/391216/can-any-symplectomorphism-1-definition-of-canonical-transformation-be-represen)

## Jacobi equation
* https://en.wikipedia.org/wiki/Hamilton%E2%80%93Jacobi_equation

To derive the HJE, we choose a generating function G2(q, P, t) in such a way that, it will make the new Hamiltonian K = 0. Hence, all its derivatives are also zero, and the transformed Hamilton's equations become trivial
    P˙ = Q˙ = 0
so the new generalized coordinates and momenta are constants of motion.
On peut faire ça en utilisant l'action
 S(q,t):=∫^{(q,t)} L dt
On a alors p=∂S/∂q et Hamilton donne: ∂S/∂t=-H.

* Comparison with other formulations of mechanics
The HJE is a single, first-order partial differential equation for the function S of the N generalized coordinates q1...qN and the time t. The generalized momenta do not appear, except as derivatives of S. Remarkably, the function S is equal to the classical action.

For comparison, in the equivalent Euler–Lagrange equations of motion of Lagrangian mechanics, the conjugate momenta also do not appear; however, those equations are a system of N, generally second-order equations for the time evolution of the generalized coordinates. Similarly, Hamilton's equations of motion are another system of 2N first-order equations for the time evolution of the generalized coordinates and their conjugate momenta p1...pN. 

Simon Malham, An introduction to Lagrangian and Hamiltonian mechanics
=====================================================================

## Euler-Lagrange

Trouver la courbe y(x) qui optimise l'intégrale
J(y)=\int_a^b F(x,y,y_x) dx, où y_x=dy/dx

Th: une courbe y(x) extrêmale satisfait
  ∂F/∂y-d/dx(∂F/∂y_x)=0
ou de manière équivalente
  ∂F/∂x-d/dx(F-y_x ∂F/∂y_x)=0

Cas particulier:
- F=F(y_x) => y_xx=0, ie y(x)=a+bx
- F(y,y_x)=f(y)(1+y_x^2)^{1/2} (cas typique d'un potentiel)
  => solution vérifie: f(y)=constante*(1+y_x^2)^{1/2}
  Ex: Brachistochrone de (x1,y1) à (0,0) minimise J(y)=\int_x1^0 \sqrt{(1+y_x^2)/(2g(y1-y)} => y_x=\sqrt{(b+y)/(a-y)} => la courbe est une cycloïde
- Si F=F(x,y,y_x,y_xx), la solution vérifie
    ∂F/∂y-d/dx(∂F/∂y_x)+d^2/dx^2 ∂F/∂y_xx=0
- Si y(x) est un vecteur dans R^n, on a une équation pour chaque composante:
    ∂F/∂y_i-d/dx(∂F/∂y'_i)=0
- Si x est un vecteur, on a comme équation:
    ∂F/∂y − ∇·(∇_{y_x} F)  = 0.
  Exemple: équation de Laplace, J(ψ)=\int |∇ψ|^2 dx
    => ∇^2 ψ=0, ie ψ est harmonique.

### Lagrange multipliers

Optimiser f(x) en respectant les contraintes g(x)=0, x \in R^N, g(x) \in \R^m
=> L(x,λ):=f(x)+\sum λ_i g_i(x) the Lagrangian function (N+m variables)
   (L=f on the constraint manifold so they have the same stationary points)
Les points extrémaux de L vérifient g_i(x)=0 et ∂f/∂x_j+\sum_i λ_i ∂g_i/∂x_j=0.

Optimiser J(y)=\int F(x,y,y_x) où la courbe y(x) vérifie G(x,y)=0, y(x) \in R^N
=> le Lagrangian va remplacer F par 
   FF(x,y,y_x,λ)=F(x,y,y_x)+\sum λ_i(x) G_i(x,y)
   et l'équation d'Euler Lagrange donne
   - G(x,y)=0
   - ∂FF/∂y_i-d/dx(∂FF/∂y'_i)=0
 Note: si G est de la forme \int g(x,y)dx=0 on peut utiliser
   FF(x,y,y_x,λ)=F(x,y,y_x)+\sum λ_i G_i(x,y)
   où les λ_i sont des constantes plutôt que des fonctions cette fois.
 Exemple: optimiser l'aire d'une surface à périmètre fixé revient à
 optimiser
   1/2 \int_0^2\pi (xy'-yx') sous la contrainte \int_0^2\pi \sqrt{x'^2+y'^2}=l
   et la solution donne un cercle

## Lagrange

On a un système physique à N composants r_i(t) soumis à m contraintes
holonomes g_j(r_i(t))=0. On a donc n=3N-m coordonnées indépendantes
q_1,...q_n.

Soit p_i=m_i v_i le moment de la particule i, v_i=r'_i(t)
L'équation de Newton donne p'_i(t)=F_i^ext+F_i^contrainte

- On suppose que le travail des contraintes est nulle, ie
\sum F_i^contrainte dr_i=0 (c'est le cas pour des contraintes holonomes)
On obtient l'équation d'Alembert:
  \sum (p'_i(t)-F_i^ext).dr_i=0
Or \sum F_i^ext dr_i=\sum Q_j dq_j où Q_j=\sum_i F_i^ext ∂r_i/∂q_j,
donc \sum p'_i(t).dr_i=\sum Q_j dq_j
  Q_j peut se voir comme une force généralisée agissant sur q_j
- On suppose que le travail effectué par Q_j ne dépend pas du chemin, ie que
les forces généralisées viennent d'un potentiel V(q): Q_j=-∂V/∂q_j.
  (On dit que les forces sont conservatives; le théorème de Lagrange
  s'étend au cas où on a seulement un potentiel généralisé: 
  Q_j=-∂V/∂q_j+d/dt(∂V/∂q'_j))
  On pose T=\sum 1/2 m_i |v_i|^2 l'énergie cinétique
  et L=T-V the Lagrangian.

Th (si les contraintes sont holonomes): d/dt(∂L/∂q'_j)-∂L/∂q_j=0
On reconnaît les équations d'Euler-Lagrange pour l'intégrale définissant
l'action: A(q)=\int_t1^t2 L(q,q',t)dt

Remarques: 
- l'équation du mouvement ne change pas si on remplace L par L+d/dt f(q,t)
- si les q_i ne sont pas libres mais satisfont des contraintes holonomes
  G(q_i,t)=0, les multiplicateurs de Lagrange nous donnent comme équations:
  d/dt(∂L/∂q'_j)-∂L/∂q_j=0=\sum_i λ_i(t) ∂G_i(x,y)/∂q_j
  où \sum_i λ_i(t) ∂G_i(x,y)/∂q_j s'interprètent comme des forces de
  contraintes généralisées.

## Hamilton

Moment généralisé: p_j=∂L/∂q'_j
Comme Q_j=-∂V/∂q_j est une force généralisée, on peut interpréter
∂T/∂q_j comme une force de contrainte généralisée, et l'équation de
Lagrange est donc une reformulation de Newton:
p'(t)=F^ext+F^contrainte

Hamiltonian: H=transformée de Legendre de L
             H(q,p,t)=q'.p-L(q,q',t) où q'=q'(q,p,t)

Th: - q'_i= ∂H/∂p_i
    - p'_i=-∂H/∂q_i

Remarques: 
- dH/dt=∂H/∂ti
- si L ne dépend pas de t, H non plus
=> dans ce cas le calcul de dH/dt plus haut montre que H est constante
   Si l'énergie kinétique T est une fonction quadratique homogène
   en q' alors H est même l'énergie du système: H=T+V.
- p'_i=-∂H/∂q_i=∂L/∂q_i, donc si q_i n'apparaît pas dans L, il n'apparaît
  pas dans H et p_i est constante.

## Algèbre de Lie

"Poisson bracket": [u,v]=\sum (∂u/∂qi ∂v/∂pi-∂u/∂pi ∂v/∂qi)
p_i et q_i sont symplectiques pour []:
[qi,qj]=0, [pi,pj]=0 and [qi,pj]=δij
=> ∂u/∂qi = [u, pi],
   ∂u/∂pi = −[u, qi],

Les variables "conjuguées" q_i et p_i vérifient:
  df/dt=∂f/∂t+[f,H].
=> équations d'Hamilton se reformulent en:
  dq/dt=[q,H]
  dp/dt=[p,H]

Lemme: [] est invariant sous transformation canonique (cf p66):
  [U,V]_{Q,P}=[u,v]_{q,p}

Note: si u(q,p) est une constante du mouvement (ie du/dt=0),
alors du/dt=0 <=> ∂u/∂t(=0)=[H,u] <=> [H,u]=0
Rappel Jacobi: [u,[v,w]]+[v,[w,u]]+[w,[u,v]]=0
Donc si [H,u]=[H,v]=0, [H,[u,v]]=0, ie [u,v] est une constante du
mouvement (ce résultat s'étend même si u=u(q,p,t) dépend explicitement de t)

## Géodésiques:

Sur une variété Riemannienne M, si q est une courbe lisse, on a la longueur
l(q)=\int_a^b ||q'(t)|| dt et l'énergie: E(q)=1/2 \int_a^b ||q'(t)||^2 dt.

Si on prend une paramétrisation proportionnelle à la longueur d'arc (ie
q'=constante), l'égalité dans Cauch-Schwarz donne l(q)^2=2|b-a|E(q).
Trouver la géodésique revient à minimiser l'énergie pour la fonctionnelle
L(q,q')=1/2 \sum_i,j g_ij q'_i q'j (où g_ij sont les coeffs de la matrice définissant le produit scalaire)
et les équations d'Euler Lagrange donnent les équas diff:
q"_i+\sum_j,k A^i_jk q'_j q'_k
où A^i_jk est le symbole de Christoffel = \sum_l g_il/2*(∂g_lj/∂q_k + ∂g_kl/∂q_j−∂g_jk/∂q_l)

Par Nash M admet un plongement dans R^N. La géodésique q minimisant
l'énergie \int 1/2 ||q'(t)||; par équivalence des équations de Lagrange avec le principe d'Alembert on déduit que q'' est orthogonal au plan tangent à M, T_q M.
Intuitivement: les forces de contraintes agissent de manière normale à la
variété pour garantir que q reste sur la variété.

Exemple: équations d'Euler pour un flot incompressible
u(x,t) dénote l'évolution du flux de vélocité:
- ∂u/∂t + (u · ∇)u = −∇p où p(x,t) dénote la pression
- ∇ · u = 0.
- u.n=0 sur le bord, où n est un vecteur normal au bord.

Si q_t(x)=q(x,t) est la trajectoire des particules, on a donc
- q"_t= −∇p(q_t,t)
- dét ∇q=1 ie q_t \in SDiff={diffeomorphismes préservant la mesure}

L'équation se réinterprète ainsi: la courbe q:t->q_t \in SDiff est une
géodésique, ie q'' \orth T_q SDiff, où la métrique sur SDiff vient de la métrique L^2.
