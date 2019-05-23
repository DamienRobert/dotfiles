vim: ft=markdownlight fdm=expr

Tenseurs
========

https://en.wikipedia.org/wiki/Vector_calculus_identities
     ∇ × ( ∇ ϕ ) = 0
     ∇ ⋅ ( ∇ × A ) = 0
     ∇ × ( ∇ × A ) = ∇ ( ∇ ⋅ A ) − ∇^2 A

https://en.wikipedia.org/wiki/Exterior_derivative

https://en.wikipedia.org/wiki/Musical_isomorphism
  ⟨, ⟩ given by g = g_ij e^i ⊗ e^j
  X♭ := g_ij X^i e^j = X_j e^j.
  X♭(Y) = ⟨X,Y⟩
  ω♯ := g^ij ω_i e_j = ω^j e_j where g^ij are the elements of the inverse matrix to g_ij
  ⟨ω♯, Y⟩ = ω(Y)
https://en.wikipedia.org/wiki/Raising_and_lowering_indices
=> change a type (a, b) tensor to a (a + 1, b − 1) tensor (raise index) or to a (a − 1, b + 1) tensor (lower index)
  g_ij A^j = A_i
  g^ij A_j = A^i
  A^αβ = g^αγ g^βδ A_γδ
https://en.wikipedia.org/wiki/Exterior_algebra#Inner_product
     ⟨ v 1 ∧ ⋯ ∧ v k , w 1 ∧ ⋯ ∧ w k ⟩ = det ( ⟨ v i , w j ⟩ )
  With respect to the inner product, exterior multiplication and the interior product are mutually adjoint:
       ⟨ x ∧ v , w ⟩ = ⟨ v , i_{x♭} w ⟩

https://en.wikipedia.org/wiki/Levi-Civita_symbol

https://en.wikipedia.org/wiki/Hodge_star_operator
     Maps k-vector to n-k vectors such that
     α ∧ ⋆β = ⟨α, β⟩ ω 
     where ⟨ ⋅ , ⋅ ⟩ denotes the inner product on k-vectors and ω is the preferred unit n-vector.
     On en déduit: https://mathoverflow.net/questions/162366/distributing-the-hodge-map-over-the-wedge-product
     ∗ω=ι_{w♭} \Det (où Det est la n-forme volume canonique), ie *w est la contraction de Dét par w♭
     ∗(v∧w)=ι_{w♭} ∗v

     grad = d
     curl = ⋆d
     div = ⋆d⋆
    On retrouve curl grad = 0, div curl = 0
    Δ f = div grad f donc Δ=⋆d⋆d
    et si δ = (-1)^k ⋆^{-1}d⋆ la codifférentielle, c'est l'adjoint de d:
    ( η , δ ζ ) = ( d η , ζ )
    et Δ = ( δ + d )^2 = δ d + d δ (δf=0 donc on retrouve Δf=δd f)
Hodge decomposition: https://en.wikipedia.org/wiki/Hodge_theory
  A variant of the Hodge theorem is the Hodge decomposition. This says that any differential form ω on a closed Riemannian manifold can be uniquely written as the sum of three parts:
    ω = d α + δ β + γ where γ is harmonic: Δγ = 0.
In terms of the L2 metric on differential forms, this gives an orthogonal direct sum decomposition: Ω^k(M) ≅ im d_{k−1} ⊕ im δ_{k+1} ⊕ H_Δ^k(M).

https://en.wikipedia.org/wiki/Interior_product
The interior product is the unique antiderivation of degree −1 on the exterior algebra such that on one-forms α
    ι_X α = α(X) = ⟨ α , X ⟩
 => (i_X ω)( X_1 , … , X_k ) = ω ( X , X_1 , … , X_k )
Cartan magic formula: L_X ω = i_X dω + d(i_X ω).

Stokes
======

https://en.wikipedia.org/wiki/Stokes%27_theorem
     ∫_∂Ω ω = ∫_Ω dω.

https://en.wikipedia.org/wiki/Divergence_theorem
     ∭_V (∇⋅F)dV = ∬_S (F.n)dS

Kelvin-Stokes' theorem:
    ∮_Γ F ⋅ dΓ = ∬_S ∇ × F ⋅ dS

Corollaire: https://en.wikipedia.org/wiki/Green%27s_theorem
     ∮_C (Ldx+Mdy)=∬_D (∂M/∂x−∂L/∂y)dxdy
Cf https://en.wikipedia.org/wiki/Green%27s_identities pour le cas de surfaces

Immersions/Submersions
======================

Si f: R^n->R^m est différentiable et df localement de rang r, il existe des
coordonnées au départ et à l'arrivée telle que
f(x_1,...,x_n)=(x_1,...,x_r,0,...,0)

Si f:R^n->R^m est une immersion (resp submersion), il suffit pour avoir la
forme précédente de faire un difféo sur R^n (resp sur R^m)

Diffeo local
============

http://math.stackexchange.com/questions/860351/a-proper-local-diffeomorphism-between-manifolds-is-a-covering-map
http://math.stackexchange.com/questions/45990/when-is-a-local-homeomorphism-a-covering-map?lq=1

Si f: M->M' est un difféomorphisme local et propre de variétés
différentielles connexes, alors f est un revêtement
Si de plus M' est simplement connexe, alors f est un difféomorphisme global

Preuve: si f est propre, comme la topologie de M est localement compacte f
est fermée. On peut montrer que si f:X->Y [X, Y Hausdorff] est fermée et un homéo local, alors f est un revêtement (si Y connexe)

For y∈Y, let {x1,…,xn}=f^−1(y) (the xi all being different points [ici on suppose X compact]). Choose pairwise disjoint neighborhoods U1,…,Un of x1,…,xn, respectively (using the Hausdorff property).
By shrinking the Ui further, we may assume that each one is mapped homeomorphically onto some neighborhood Vi of y.
Now let C=X∖(U1∪⋯∪Un) and set V=(V1∩⋯∩Vn)∖f(C). Then V is an evenly covered nbh of y: f is a closed map (compactness+hausdoff), C is closed so f(C) is closed, so V is open, and f−1(y)⋂C=∅ so y∈V, and so it's indeed an open nbh of y. f^−1(V)⊂U1∪…∪Un by definition, and so f−1(V)=(U1∩f−1(V))∪…∪(U1∩f−1(V)) where Ui∩f^−1(V)≅V. 

Vector Fields
=============

https://math.stackexchange.com/questions/790626/equivalent-definitions-of-vector-field
https://en.wikipedia.org/wiki/Vector_field
https://en.wikipedia.org/wiki/Vector_flow

Si v est un vecteur tangent en x, on peut définir D_v f comme le vecteur dérivé
de (goc)'(0) pour tout courbe c passant par x en 0 avec c'(0)=t
Si X est un champ de vecteur, D_X g reste smooth.

On a bijection entre dérivations ponctuelles et vecteur tangents; et
bijection entre dérivations globales et champs de vecteurs.

Si X=\sum X^i est un champ de vecteur, on note L_X la dérivation associée:
L_X = \sum X^i \delta_i (où \delta_i est la dérivée directionnelle).
On a (L_Xf)(x)=T_x f . X_x, ie la dérivée de Lie d'une fonction scalaire
est la dérivée directionnelle; c'est donc aussi la dérivée en t=0 de
fo\phi(t,x).

Crochet de Lie: [X,Y] est le champ Z=\delta_X Y - \delta_Y X=\sum Z^i \delta_i 
où Z^i= \sum_j (X^j \delta_j Y^i - Y^j \delta_j X^i)
associé à la dérivation L_X L_Y - L_Y L_X

Le flot associé \phi à X vérifie \phi_0=Id sur M et d/dt \phi(t)=X_\phi(t); on
a \phi_{s+t}=\phi_s o \phi_t.
Réciproquement un groupe de difféo à un paramètre h est le flot associé au
champ de vecteur d/dt h(t=0,x).

On a L_X(Y)=d/dt (\phi^Y_t_* X |t=0) = [X,Y]
           =d/dt (\phi^X_{-t}_* Y |t=0)
           =d/dt (\phi^X_{t}^* Y |t=0)
Note: les définitions avec la dérivée du flot est valide pour tout tenseur Y.
En dérivant en t=0 $\phi_t*^Z[X,Y]=[\phi_t*^Z, \phi_t*^Z Y]$, on retombe
sur l'identité de Jacobi: [[X,Y],Z]=[[X,Z],Y]+[X,[Z,Y]]
De plus: L_[X,Y](T)= L_X L_Y T - L_Y L_X T pour tout tensor field T.
  https://en.wikipedia.org/wiki/Lie_derivative
  Considering vector fields as infinitesimal generators of flows (i.e.
  one-dimensional groups of diffeomorphisms) on M, the Lie derivative is
  the differential of the representation of the diffeomorphism group on
  tensor fields,

Plus généralement, L_X T pour T un tensor field est défini par les 4
axiomes:
- L_X f=X(f)
- L_X( S \tens T)=L_X(S) \tens T + S \tens L_X(T)
- Leibniz: L_X(T(Y_1,…,Y_n) ) = (L_XT)(Y_1,…,Y_n) + T((L_X Y_1 ),…,Y_n)+ ⋯ + T(Y_1,…,(L_X Y_n))
- [L_X,d]=0
En particulier, comme df(Y)=L_Y(f), on retrouve L_X L_Y(f) =X(Y(f))−Y(X(f))

Différentielles
===============

Tautological one form on the cotangent bundle
---------------------------------------------

https://en.wikipedia.org/wiki/Tautological_one-form

In mathematics, the tautological one-form is a special 1-form defined on the cotangent bundle T*Q of a manifold Q. The exterior derivative of this form defines a symplectic form giving T*Q the structure of a symplectic manifold

In canonical coordinates, the tautological one-form is given by
    θ = ∑_i p_i dq^i
  On a w=-dθ=\sum dq^i ^ dp_i (cf [Mecanique#Hamilton])
Si m \in cotangent C, on défini θ_m=m o d\pi, où \pi est la projection de
l'espace cotangent sur sa manifold M, d\pi: TC->TM et m es vu comme
TM_\pi(m)->R.
Note:  canonical coordinates are coordinates q_i and p_i phase space that are used in the Hamiltonian formalism. The canonical coordinates satisfy the fundamental Poisson bracket relations: { q_i , q_j } = 0, { p_i , p_j } = 0, { q_i , p_j } = δ_ij

Solder form
-----------

https://en.wikipedia.org/wiki/Frame_bundle#Solder_form

On a aussi une forme tautologique sur le frame bundle FM qui vient de
id:TM->TM, cf plus bas.

Inversement:
https://en.wikipedia.org/wiki/Solder_form
Let M be a smooth manifold, and G a Lie group, and let E be a smooth fibre bundle over M with structure group G. Suppose that G acts transitively on the typical fibre F of E, and that dim F = dim M. A soldering of E to M consists of the following data:
    A distinguished section o : M → E.
    A linear isomorphism of vector bundles θ : TM → o*VE from the tangent bundle of M to the pullback of the vertical bundle of E along the distinguished section.
In particular, this latter condition can be interpreted as saying that θ determines a linear isomorphism
    θ x : T_x M → V_o(x) E

### Vector bundle
However, for a vector bundle there is a canonical isomorphism between the vertical space at the origin and the fibre V_o E ≈ E. Making this identification, the solder form is specified by a linear isomorphism
    T M → E
In other words, a soldering on an affine bundle E is a choice of isomorphism of E with the tangent bundle of M. 

    As a special case, for instance, the tangent bundle itself carries a canonical solder form, namely the identity.
    If M has a Riemannian metric (or pseudo-Riemannian metric), then the covariant metric tensor gives an isomorphism g : T M → T∗ M from the tangent bundle to the cotangent bundle, which is a solder form.
    In Hamiltonian mechanics, the solder form is known as the tautological one-form, or alternately as the Liouville one-form, the Poincaré one-form, the canonical one-form, or the symplectic potential.

### Principal bundles

In the language of principal bundles, a solder form on a smooth principal G-bundle P over a smooth manifold M is a horizontal and G-equivariant differential 1-form on P with values in a linear representation V of G such that the associated bundle map from the tangent bundle TM to the associated bundle P×G V is a bundle isomorphism. (In particular, V and M must have the same dimension.)

A motivating example of a solder form is the tautological or fundamental form on the frame bundle of a manifold.

Groupe de Lie
=============

Si G groupe de Lie, g son algèbre de Lie, on peut voir g
comme les champs de vecteurs invariants par multiplication à gauche
(si X est dans l'espace tangent, on définit X_g=L_g* X).

Alors 
- [X,Y] est simplement le Lie bracket des champs de vecteurs
- exp tX est le flot issu du champ de vecteur X passant en e pour t=0
  Alternativement, c'est l'unique sous-groupe à paramètre c(t) (ie
  c(t+s)=c(t)c(s)) tel que c'(0)=X.

Adjoint: Ad: G \to Aut(g)
  via Ad_g =(dΨ_g)_e : T_e G → T_e G où Ψ_g(h)=ghg^{-1}.
  ie Ad_g(X)= d/dt Ψ_g(exp(tX))
  d'où en dérivant: ad: g \to Lie(Aut(g))=~Der(g) \subsent End(g)
  qui vérifie ad_{x}(y)=[x,y].

Donc dans Gl_n: Ad_g(X)= gXg^{−1}, ad(X,Y)=XY-YX

Jacobi implique 
- ad_z([x,y]=[ad_z x, y]+[x, ad_z y]
  qui montre bien que ad_z est une dérivation de Lie.
- [ad_x, ad_y]=ad_[x,y]
  qui montre que ad: g -> Der(g) est un morphisme d'algèbre de Lie.

Théorie des groupes de Lie
--------------------------

Cf Lafontaine, Chapitre IV.

Séparabilité: Si G est est un groupe topologique, G séparé <=> {e} est
fermé

Quotient:
Si H sous-groupe de G, G->G/H est une application ouverte, G/H séparé <=> H
fermé, si H ouvert => H fermé et G/H est discret. Si H et G/H sont
connexes, G aussi (G->G/H est une fibration de fibre H, et une fibration
est connexe dès que la base et la fibre le sont).

Composante neutre: G_0 est engendré par tout ouvert V contenant e et
symmétrique; en particulier si G est un groupe de Lie G_0 est engendré par
exp g.

Revêtements:  p: G->X est un revêtement <=> X=G/\Gamma
où \Gamma es un sous-groupe discret de G. De plus \Gamma est
automatiquement fermé, et dans le centre de G s'il est distingué (càd si
X=H est un groupe de Lie), donc \pi_1(G) est abélien.

Théorème de Lie: si g est une algèbre de Lie de dim finie, il existe un
unique groupe de Lie simplement connexe G lui correspondant; et si H a g
pour algèbre de Lie alors G est le revêtement universel de H.
Plus généralement G -> Lie(G) est une équivalence de catégorie des groupes
de Lie simplement connexes vers les algèbres de Lie de dim finie; donc à
une sous-algèbre de Lie h de g correspond un sous-groupe de Lie H (engendré
par exp h), et à un morphisme g->g' correspond un morphisme G->G'. En
revanche si G n'est pas simplement connexe, H est en général juste une
immergé dans G, et f:G->G' juste défini sur un voisinage de e (où il est
multiplicatif).

Groupe de Lie commutatif: G commutatif (connexe) <=> []=0 sur g, donc exp est un
morphisme g->G qui est un difféo local, donc est surjectif (G est engendré par un sous-groupe ouvert) et d'où aussi le noyau est un réseau: G=g/\Lambda.
Ex: A connected compact complex Lie group A is abelian, so a torus.


Exponentielles
--------------

Tout morphisme continu de R dans G est de la forme h(t)=exp tX pour un
unique X dans g.

https://en.wikipedia.org/wiki/Exponential_map_(Riemannian_geometry)#Relationships_to_exponential_maps_in_Lie_theory
In the case of Lie groups with a bi-invariant metric—a pseudo-Riemannian metric invariant under both left and right translation—the exponential maps of the pseudo-Riemannian structure are the same as the exponential maps of the Lie group. In general, Lie groups do not have a bi-invariant metric, though all connected semi-simple (or reductive) Lie groups do. The existence of a bi-invariant Riemannian metric is stronger than that of a pseudo-Riemannian metric, and implies that the Lie algebra is the Lie algebra of a compact Lie group; conversely, any compact (or abelian) Lie group has such a Riemannian metric. 

https://en.wikipedia.org/wiki/Exponential_map_(Lie_theory)
Comparison with Riemannian exponential map

If G is compact, it has a Riemannian metric invariant under left and right translations, and the Lie-theoretic exponential map for G coincides with the exponential map of this Riemannian metric.

For a general G, there will not exist a Riemannian metric invariant under both left and right translations. Although there is always a Riemannian metric invariant under, say, left translations, the exponential map in the sense of Riemannian geometry for a left-invariant metric will not in general agree with the exponential map in the Lie group sense. That is to say, if G is a Lie group equipped with a left- but not right-invariant metric, the geodesics through the identity will not be one-parameter subgroups of G.

Other equivalent definitions of the Lie-group exponential are as follows:
    It is the exponential map of a canonical left-invariant affine connection on G, such that parallel transport is given by left translation. That is, exp(X) = γ(1) where γ the unique geodesic with the initial point at the identity element and the initial velocity X (thought of as a tangent vector).
    It is the exponential map of a canonical right-invariant affine connection on G. This is usually different from the canonical left-invariant connection, but both connections have the same geodesics (orbits of 1-parameter subgroups acting by left or right multiplication) so give the same exponential map.
    The Lie group–Lie algebra correspondence also gives the definition: for X in g, t ↦ exp ( t X ) is the unique Lie group homomorphism corresponding to the Lie algebra homomorphism t ↦ t X. (note: Lie(R)=R)

Connections, courbure, torsion
==============================

https://en.wikipedia.org/wiki/Connection_(mathematics)
https://en.wikipedia.org/wiki/Riemann_curvature_tensor
https://en.wikipedia.org/wiki/Torsion_tensor
https://en.wikipedia.org/wiki/Affine_connection
https://en.wikipedia.org/wiki/Exponential_map_(Riemannian_geometry)

Connection:
- http://pi.math.cornell.edu/~goldberg/Notes/AboutConnections.pdf
- https://arxiv.org/pdf/1401.8272.pdf The works of Charles Ehresmann on connections: from Cartan connections to connections on fibre bundles
- http://www.math.wichita.edu/~pparker/research/lcg.pdf
  Lectures on connection geometry
- https://www.math.ucdavis.edu/~osserman/math/connections.pdf
  CONNECTIONS, CURVATURE, AND p-CURVATURE BRIAN OSSERMAN
- https://math.stackexchange.com/questions/1495630/different-definition-of-connection-on-bundle
- https://williewong.files.wordpress.com/2014/09/bundlesandderivatives.pdf
  DERIVATIVES: A GEOMETRIC SUPPLEMENT, WILLIE WAI-YEUNG WONG
+ https://arxiv.org/pdf/gr-qc/0611154.pdf
  MacDowell–Mansouri Gravity and Cartan Geometry
  [Une très bonne exposition didactique d'une connection de Cartan]
- https://www.mat.univie.ac.at/~michor/cartan
  DIFFERENTIAL  GEOMETRY  OF  CARTAN  CONNECTIONS
  Dmitri V. Alekseevsky Peter W. Michor

Torsion:
http://mathoverflow.net/questions/20493/what-is-torsion-in-differential-geometry
-intuitively
sciences.physique:7064 => Élie Cartan (¶36 de
<URL: http://www.numdam.org/item/ASENS_1923_3_40__325_0 >[#]) :
  # En, définitive à tout contour fermé infiniment petit partant d'un
  # point m et y revenant, est associé un déplacement affine infiniment
  # petit (du second ordre) dont les composantes, par rapport au système
  # de référence attaché au point de départ m, sont les éléments
  # d'intégrales doubles \Omega^i, \Omega_i^j.  Les premières
  # composantes \Omega^i définissent une *translation* les autres une
  # *rotation* (affine) autour de m.
  # La translation révèle la *torsion* la rotation révèle la *courbure*
  # de la variété donnée.

Symboles de Christoffel
-----------------------

Dérivée directionnelle: ∇ est bilinéaire et satisfait la règle de Leibniz
∇_X(fY)=D_X f. Y + f. ∇_X(Y)
Elle est convariante si de plus ∇_{f.X}(Y)=f.∇_X(Y)

Note: si ∇_X est covariante, la valeur en un point p ne dépend que de X(p).

Christoffel:
The covariant derivative of a vector field V^m is
     ∇_l V^m = ∂ V^m/ ∂ x_l + Γ^m_kl V^k.

(pour une variété Riemannienne): The Christoffel symbols can be derived from the vanishing of the covariant derivative of the metric tensor g_ik: 
 0=g_{ik;l}=g_{ik,l}-g_{mk} Γ^m_il-g_im Γ^m_kl.

Connection de Koszul
--------------------

Let E → M be a smooth vector bundle over a differentiable manifold M. Denote the space of smooth sections of E by Γ(E). A connection on E is an ℝ-linear map
    ∇ : Γ(E) → Γ(E⊗T∗M)
such that the Leibniz rule
    ∇(σf) = (∇σ)f + σ⊗df
holds for all smooth functions f on M and all smooth sections σ of E.

If X is a tangent vector field on M (i.e. a section of the tangent bundle TM) one can define a covariant derivative along X
    ∇_X : Γ(E) → Γ(E)
by contracting X with the resulting covariant index in the connection ∇ (i.e. ∇_Xσ = (∇σ)(X)). The covariant derivative satisfies the following properties:
    ∇_X(σ1+σ2) = ∇_X σ1 + ∇_X σ2 
    ∇_{X1+X2} σ = ∇_X1 σ + ∇_X2 σ
    ∇_X ( f σ ) = f ∇_X σ + X(f) σ
    ∇_{fX} σ = f ∇_X σ.
Conversely, any operator satisfying the above properties defines a connection on E and a connection in this sense is also known as a covariant derivative on E.

Quand E=TM, on dit qu'on a une connection affine.
An affine connection may also be defined as a principal GL(n) connection ω on the frame bundle FM or GL(M) of a manifold M.

Given a connection ∇ on E there is a unique way to extend ∇ to a covariant exterior derivative or exterior covariant derivative
    d^∇ : Ω^r(E) → Ω^{r+1}(E).
    où Ω^r(E)=E⊗T^r∗M.

Sur E=TM, on peut définir une notion de transport parrallèle le long d'une
courbe c en disant qu'on a un champ de vecteur X tel que ∇_c'(t)X=0 (ie X
est horizontal); et alors X transporte X_c(0) en X_c(1).

### Connection affine

https://en.wikipedia.org/wiki/Affine_connection

Note: affine connection = connection sur TM = principal GL(n) connection ω on the frame bundle FM.

From the Cartan connection point of view, the curvature is the failure of the affine connection η to satisfy the Maurer–Cartan equation
    d η + 1/2 [ η ∧ η ] = 0,
where the second term on the left hand side is the wedge product using the Lie bracket in aff(n) to contract the values. By expanding η into the pair (θ, ω) and using the structure of the Lie algebra aff(n), this left hand side can be expanded into the two formulae [note: θ est la solder form, w la connection affine]
    dθ + ω ∧ θ and dω + ω ∧ ω ,
where the wedge products are evaluated using matrix multiplication. The first expression is called the torsion of the connection, and the second is also called the curvature.
These expressions are differential 2-forms on the total space of a frame bundle. However, they are horizontal and equivariant, and hence define tensorial objects. These can be defined directly from the induced covariant derivative ∇ on TM as follows.

The torsion is given by the formula
    T^∇(X,Y)= ∇_X Y − ∇_Y X − [X, Y].
If the torsion vanishes, the connection is said to be torsion-free or symmetric.
The curvature is given by the formula
    R_{X,Y}^∇ Z = ∇_X ∇_Y Z − ∇_Y ∇_X Z − ∇_[X,Y] Z.
Note that [X, Y] is the Lie bracket of vector fields
    [X , Y] = (X^j ∂_j Y^i − Y^j ∂_j X^i) ∂_i

### The Levi-Civita connection

If (M, g) is a Riemannian manifold then there is a unique affine connection ∇ on M with the following two properties:
  - the connection is torsion-free, i.e., T∇ is zero;
  - parallel transport is an isometry, i.e., the inner products (defined using g) between tangent vectors are preserved.


https://en.wikipedia.org/wiki/Metric_connection
In mathematics, a metric connection is a connection in a vector bundle E equipped with a bundle metric; that is, a metric for which the inner product of any two vectors will remain the same when those vectors are parallel transported along any curve.[1] Other common equivalent formulations of a metric connection include:
    A connection for which the covariant derivatives of the metric on E vanish.
    A principal connection on the bundle of orthonormal frames of E.

### Geodesics

A smooth curve γ : I → M is an affine geodesic if γ̇ is parallel transported along γ
 τ_t^s{γ˙}(s)=γ˙(t)
In terms of the infinitesimal connection ∇, the derivative of this equation implies ∇_γ˙(t) γ˙(t) = 0.

Connection d'Ehresmann
----------------------

### Lifts horizontaux

Si E->M est un fiber bundle de fibres F, on définit les vecteurs tangents
verticaux dans T_u E comme ceux qui sont tangents à F_\pi(u), ie dans le noyau
de d\pi_i: T_u E -> T_\pi u M.

Connection d'Ehresmann: u -> H_u \subset T_u E qui est C^\infty et tel que
H_u soit un supplémentaire de V_u.
Autrement dit, on veut un projecteur v: TE->TE tel que Im v_u=V_u; alors
H_u=Ker v_u.

Localement, E=FxM, TE=TF \oplus TM, V_u=T_u F donc on peut prendre H_u:=T_u
M: la connection triviale. On dit qu'une connection est plate si elle est
localement triviale.

Une connection induit un iso d\pi: H_u -> T_\pi u M; donc tout vecteur
tangent à M à un unique lift horizontal.

Théorème: pour toute courbe c dans M, et choix d'un lift de c(0), il y a un unique lift horizontal (local) cc de c, ie tel que les vecteurs tangents de cc sont horizontaux.

### Principal bundle

Si P->M est un G-principal bundle, une connection principale est une
connection telle que H est préservé par la G-action:
H_{g.u}=(d g.)_u(H_u).

Si X est un élément de l'algèbre de Lie g, il induit un champ de vecteur XX
sur P via XX_u=d/dt exp tX.u
On a alors une 1-forme sur P à valeur dans g (la forme connection) w telle que
- w(XX)=X
- g^*.w=Ad_{g^-1}ow
telle que H_u:=ker w_u.
En effet, V_u s'identifie à l'espace des {XX_u}, donc si v \in T_u P on
définit w_u(v) comme étant l'unique X \in g tel que la composante verticale
de v soit XX_u.

Th: avec une connection principale, on peut lifter une courbe lisse c:[0,1]
-> M globalement à P (de manière horizontale)
On a en particulier une application de transport parallèle: 
\tau_t: P_p -> P_c(t), qui commute avec l'action de G, et donc qui induit
un iso sur les fibres.

### Associated bundle

Maintenant, si G agit sur F, alors E:=P x_G F est un fiber bundle sur M de
fibre F, et si on a une connection principale sur P, on peut l'étendre
horizontalement sur P x F puis la projeter sur E.

Si G=GL_n, F=V un espace de dim n, alors E est un vecteur bundle.
Inversement, si E est un vecteur bundle, alors si P est son frame bundle on
a E=P x_GL_n V où V est une fibre de E.
Cf https://en.wikipedia.org/wiki/Frame_bundle: A vector bundle E and its frame bundle F(E) are associated bundles.

Une connection sur un vector bundle E qui vient de son frame bundle est
linéaire: https://en.wikipedia.org/wiki/Ehresmann_connection#Vector_bundles_and_covariant_derivatives
et dans ce cas on peut toujours lifter globalement les chemins,
et les application \tau_t sont des isomorphismes linéaires sur les fibres.

Réciproquement, à une connection linéaire, on peut lifter une courbe dans
M au frame bundle en transportant chaque base d'une frame le long d'un lift de
la courbe à E; les éléments horizontaux sont les vecteurs tangents à cette
courbe liftée, et la connection sur E est bien la connection associée à celle
qu'on vient de définir sur Frame E.

### Dérivée covariante

On peut alors définir une dérivation de Koszul via, si σ: M->E est une
e section et X un champ de vecteur sur M,
    ∇_X(σ)(p)=d/dt((\tau_c(t)^{-1} σ(c(t))-σ(p))/t)
ie la dérivée habituelle où on a transporté le vecteur tangeant à c(t) en
un vecteur tangent à c(0)=p.

Autre construction: si j'ai une connection principale sur Frame(E), alors à
une section σ correspond une unique section Σ invariante à droite sur
Frame(E), et X^H(Σ) (où X^H est le lift horizontal de X sur Frame(E)) est
une section invariante qui correspond à ∇_X(σ).

σ est parallèle en X si ∇_X(σ)=0, et σ est parallèle si elle est parallèle
à tout X.
Th: σ est parallèle <=> si on a une courbe c sur M, alors
\tau_t(σ(c(0))=σ(c(t)) pour tout t <=> (dσ)_p(T_p M) \subset T_p E est
horizontal.

Ainsi on peut retrouver une connection linéaire d'Ehresmann à partir d'une
connection de Koszul.

G-structure
-----------

G-structure: https://en.wikipedia.org/wiki/G-structure_on_a_manifold
Given a principal G-bundle P over X, a reduction of the structure group (from G to H) is an H-bundle Q and an isomorphism ϕ : Q ×_H G → P of the associated bundle to the original bundle.
In differential geometry, a G-structure on an n-manifold M, for a given structure group[1] G, is a G-subbundle of the tangent frame bundle FM (or GL(M)) of M.

Une G-structure est plus fort que juste un G-principal bundle.
In detail, suppose that Q is the principal bundle of a G-structure. If Q is realized as a reduction of the frame bundle of M, then the solder form is given by the pullback of the tautological form of the frame bundle along the inclusion. Abstractly, if one regards Q as a principal bundle independently of its realization as a reduction of the frame bundle, then the solder form consists of a representation ρ of G on R^n and an isomorphism of bundles θ : TM → Q ×ρ R^n.

https://en.wikipedia.org/wiki/Frame_bundle#Solder_form
Let x be a point of the manifold M and p a frame at x, so that
    p : R^n → T_x M
is a linear isomorphism of R^n with the tangent space of M at x. The solder form of FM is the R^n-valued 1-form θ defined by
    θ_p(ξ)= p^{−1} dπ(ξ)
where ξ is a tangent vector to FM and dπ is the differential of the projection map π : FM → M. The solder form is horizontal in the sense that it vanishes on vectors tangent to the fibers of π and right equivariant in the sense that
    R_g^∗θ = g^{−1} θ
where Rg is right translation by g ∈ GL(n, R). A form with these properties is called a basic or tensorial form on FM. Such forms are in 1-1 correspondence with TM-valued 1-forms on M which are, in turn, in 1-1 correspondence with smooth bundle maps TM → TM over M. Viewed in this light θ is just the identity map on TM.

En effet, cf https://en.wikipedia.org/wiki/Vector-valued_differential_form#Tensorial_forms
Let E → M be a smooth vector bundle of rank k over M and let π : F(E) → M be the (associated) frame bundle of E, which is a principal GLk(R) bundle over M. The pullback of E by π is canonically isomorphic to F(E) ×ρ R^k via the inverse of [u, v] →u(v), where ρ is the standard representation. Therefore, the pullback by π of an E-valued form on M determines an R^k-valued form on F(E). It is not hard to check that this pulled back form is right-equivariant with respect to the natural action of GLk(R) on F(E) × R^k and vanishes on vertical vectors (tangent vectors to F(E) which lie in the kernel of dπ). Such vector-valued forms on F(E) are important enough to warrant special terminology: they are called basic or tensorial forms on F(E).

### G-connection

https://en.wikipedia.org/wiki/Ehresmann_connection#Associated_bundles

A G-connection on E is an Ehresmann connection such that the parallel
transport map τ : Fx → Fx′ is given by a G-transformation of the fibers.

Given a principal connection on P, one obtains a G-connection on the associated fiber bundle E = P ×G F via pullback.

Conversely, given a G-connection on E it is possible to recover the principal connection on the associated principal bundle P. To recover this principal connection, one introduces the notion of a frame on the typical fiber F. Since G is a finite-dimensional[7] Lie group acting effectively on F, there must exist a finite configuration of points (y1,...,ym) within F such that the G-orbit R = {(gy1,...,gym) | g ∈ G} is a principal homogeneous space of G. One can think of R as giving a generalization of the notion of a frame for the G-action on F. Note that, since R is a principal homogeneous space for G, the fiber bundle E(R) associated to E with typical fiber R is (equivalent to) the principal bundle associated to E. But it is also a subbundle of the m-fold product bundle of E with itself. The distribution of horizontal spaces on E induces a distribution of spaces on this product bundle. Since the parallel transport maps associated to the connection are G-maps, they preserve the subspace E(R), and so the G-connection descends to a principal G-connection on E(R).

In summary, there is a one-to-one correspondence (up to equivalence) between the descents of principal connections to associated fiber bundles, and G-connections on associated fiber bundles. For this reason, in the category of fiber bundles with a structure group G, the principal connection contains all relevant information for G-connections on the associated bundles. Hence, unless there is an overriding reason to consider connections on associated bundles (as there is, for instance, in the case of Cartan connections) one usually works directly with the principal connection.

### Curvature form

https://en.wikipedia.org/wiki/Curvature_form

The curvature form of a principal G-connection ω is the g-valued 2-form Ω defined by
    Ω = dω + 1/2 [ ω ∧ ω ] = Dω (D=dérivée extérieure covariante)

It is G-equivariant and horizontal, hence corresponds to a 2-form on M with values in g_P. The identification of the curvature with this quantity is sometimes called the second structure equation.

Note: pour une connection principale v, on peut aussi voir
la courbure comme étant
   R=1/2 [v,v], ie R(X,Y) = [ X_H , Y_H ]_V où _H et _V sont les composantes horiz et vert où [] est le Frölicher–Nijenhuis bracket
cf https://en.wikipedia.org/wiki/Fr%C3%B6licher%E2%80%93Nijenhuis_bracket
 L_K=[d,i_K] et L_[K,L] = [L_K, L_L].
Rem: Every derivation of Ω*(M) can be written as i_L + L_K

### Connections on frame bundles and torsion

If the principal bundle P is the frame bundle, or (more generally) if it has a solder form, then the connection is an example of an affine connection, and the curvature is not the only invariant, since the additional structure of the solder form θ, which is an equivariant R^n-valued 1-form on P, should be taken into account. In particular, the torsion form on P, is an R^n-valued 2-form Θ defined by

    Θ = dθ + ω ∧ θ.

Θ is G-equivariant and horizontal, and so it descends to a tangent-valued 2-form on M, called the torsion. This equation is sometimes called the first structure equation.

### Bianchi identities
If θ is the canonical vector-valued 1-form on the tangent frame bundle, that is, the solder form, the torsion Θ of the connection form ω is the vector-valued 2-form defined by the structure equation
    Θ = d θ + ω ∧ θ = D θ
The first Bianchi identity takes the form
    D Θ = Ω ∧ θ.
The second Bianchi identity takes the form
    D Ω = 0
and is valid more generally for any connection in a principal bundle.

Cartan connection
-----------------

https://en.wikipedia.org/wiki/Affine_connection
https://en.wikipedia.org/wiki/Cartan_connection
https://ncatlab.org/nlab/show/Cartan+connection
https://mathoverflow.net/questions/229569/intuition-for-the-cartan-connection-and-rolling-without-slipping-in-cartan-geo

Affine frames and the flat affine connection

An affine frame for A consists of a point p ∈ A and a basis (e1,… en) of the vector space T_pA = R^n. The general linear group GL(n) acts freely on the set FA of all affine frames by fixing p and transforming the basis (e1,… en) in the usual way, and the map π sending an affine frame (p; e1,… en) to p is the quotient map. Thus FA is a principal GL(n)-bundle over A. The action of GL(n) extends naturally to a free transitive action of the affine group Aff(n) on FA, so that FA is an Aff(n)-torsor, and the choice of a reference frame identifies FA → A with the principal bundle Aff(n) → Aff(n)/GL(n).

### Definition via absolute parallelism

Let M be a manifold, and P a principal GL(n)-bundle over M. Then an affine connection is a 1-form η on P with values in aff(n) satisfying the following properties
- η is equivariant with respect to the action of GL(n) on P and aff(n);
- η(Xξ) = ξ for all ξ in the Lie algebra gl(n) of all n × n matrices;
- η is a linear isomorphism of each tangent space of P with aff(n).

The last condition means that η is an absolute parallelism on P, i.e., it identifies the tangent bundle of P with a trivial bundle (in this case P × aff(n)). The pair (P, η) defines the structure of an affine geometry on M, making it into an affine manifold.

The affine Lie algebra aff(n) splits as a semidirect product of Rn and gl(n) and so η may be written as a pair (θ, ω) where θ takes values in Rn and ω takes values in gl(n). Conditions 1 and 2 are equivalent to ω being a principal GL(n)-connection and θ being a horizontal equivariant 1-form, which induces a bundle homomorphism from TM to the associated bundle P ×GL(n) Rn. Condition 3 is equivalent to the fact that this bundle homomorphism is an isomorphism. (However, this decomposition is a consequence of the rather special structure of the affine group.) Since P is the frame bundle of P ×GL(n) Rn, it follows that θ provides a bundle isomorphism between P and the frame bundle FM of M; this recovers the definition of an affine connection as a principal GL(n)-connection on FM.

The 1-forms arising in the flat model are just the components of θ and ω.

### Definition as a principal affine connection

An affine connection on M is a principal Aff(n)-bundle Q over M, together with a principal GL(n)-subbundle P of Q and a principal Aff(n)-connection α (a 1-form on Q with values in aff(n)) which satisfies the following (generic) Cartan condition. The Rn component of pullback of α to P is a horizontal equivariant 1-form and so defines a bundle homomorphism from TM to P ×GL(n) Rn: this is required to be an isomorphism.

### Relation to the motivation

Since Aff(n) acts on A, there is, associated to the principal bundle Q, a bundle A = Q ×Aff(n) A, which is a fiber bundle over M whose fiber at x in M is an affine space Ax. A section a of A (defining a marked point ax in Ax for each x ∈ M) determines a principal GL(n)-subbundle P of Q (as the bundle of stabilizers of these marked points) and vice versa. The principal connection α defines an Ehresmann connection on this bundle, hence a notion of parallel transport. The Cartan condition ensures that the distinguished section a always moves under parallel transport.

## Gauss-Manin connection

https://en.wikipedia.org/wiki/Gauss%E2%80%93Manin_connection
https://mathoverflow.net/questions/55238/analytic-vs-algebraic-gauss-manin-connection
Lecture:  Gauß-Manin Connections: http://www.math.uchicago.edu/~bloch/Beijing_lectures_hypergeometric_161028.pdf
http://algant.eu/documents/theses/barrientos.pdf The Gauss-Manin connection andregular singular points.
http://www.math.univ-angers.fr/~pol/memoirem2.pdf Connexion de Gauss-Manin

https://en.wikipedia.org/wiki/Ehresmann%27s_lemma
a smooth mapping f : M → N where M and N are smooth manifolds such that f
is
  - a surjective submersion, and
  - a proper map, (in particular, this condition is always satisfied if M is compact),
is a locally trivial fibration. 

G-structure
===========

https://en.wikipedia.org/wiki/G-structure
https://en.wikipedia.org/wiki/Riemannian_manifold
https://en.wikipedia.org/wiki/K%C3%A4hler_manifold
https://en.wikipedia.org/wiki/Hodge_theory
https://en.wikipedia.org/wiki/Exterior_derivative

Cohomologie
===========

H^k_DR =~ H^k_Sing
Hodge theorem: on a des représentants donnés par des formes harmoniques.

Hodge decomposition (X kahlerienne):
     H^r(X,C) = ⨁_{p+q=r} H^{p,q} (X).
(Preuve: une r-forme w se décompose en (p,q)-forme, qui sont harmoniques si
w est harmonique)
     De plus: H^{p,q}(X)=H^q(X,\Omega^p)
