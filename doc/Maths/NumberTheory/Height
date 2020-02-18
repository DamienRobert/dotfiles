vim: ft=markdownlight fdm=expr

Références:
- https://en.wikipedia.org/wiki/Height_function
- http://www.msri.org/attachments/workshops/301/HtSurveyMSRIJan06.pdf
An Introduction to Height Functions, Joseph H. Silverman

Mahler mesure
=============
- https://en.wikipedia.org/wiki/Mahler_measure

The Mahler measure M(p) of a polynomial p(z) with complex coefficients is defined as
    M(p) = |a_n| ∏ max (1, |α_i|)
The Mahler measure can be viewed as a kind of height function. Using Jensen's formula, it can be proved that this measure is also equal to the geometric mean of|p(z)| on the unit circle: M(p) = exp(1/2π ∫_0^2π  ln(|p(e^iθ)|)dθ).

Cf https://en.wikipedia.org/wiki/Height_function
pour des liens entre M(p) et H(p) où H(p)=max |a_i| est la hauteur de p.

Heights on projective space
===========================
Cf Silverman

P=(x0: ... : xN)
- Height: H_K(P) =∏_v max{‖x_0‖v, ... ,‖x_N‖v}.
- Absolute logarithmic height: h(P) =1/[K:Q] log H_K(P)

Exemple: si P=p/q dans Q, H_K(P)=H_K(p/q:1)=H_K(p:q)=max(‖p‖,‖q‖)
Si P a des coordonnées entières, H_K(P)=max(‖x_0‖,...,‖x_N‖)

Th (Northcott): there are only finitely many points of bounded height and
bounded degree in P^N(Qbar).

Corollary (Kronecker theorem)
Si α \in K*, H_K(α)=1 (ie h(α)=0) <=> α racine de l'unité
[Rappel: α unité ssi N_K/K0(α) unité, eg N_K/Q(α)=\pm 1]

Th (Schanuel) #{P \in P^N(K) | H_K(P)<=B} ~ C_K,N B^{N+1}

Theorem. Let φ:P^N→P^M be a morphism of degree d. Then
d h(P)−C1,φ ≤ h(φ(P)) ≤ d h(P)+C2,φ for all P∈P^N(Qbar).
(the upper bound holds if φ is a rational map)

* Height on projective variety
If D is very ample on X, we get an embedding φ_D into P^N, so a height function
h_D=h o φ_D on X(Qbar). 
- Changing the choice of sections generating L(D) only
changes h_D by a bounded function, ie h_D is defined up to O(1).
- If D ~ E, h_D=h_E + O(1)

* Weil height machine
There exists a unique homomorphism h: Pic(X) -> {Functions X(Qbar)->R, up
to O(1)}, D->h_D such that
- Normalization: h_D = h o φ_D for D very ample
- Functoriality: h_{X,φ*D}=h_Y,D o φ + O(1) for φ:X->Y
- Positivity: h_D >= O(1) for all points not in the base locus of D

* Height on abelian varieties
- If D is symmetric, [m]^∗D ∼ m^2D yields h_D([m]P)=m^2 h_D(P)+O(1).
- h_D(P+Q) + h_D(P−Q) = 2h_D(P) + 2h_D(Q) +O(1); comes from σ∗D+δ∗D ∼ 2π_1∗D+ 2π_2∗D où σ(P,Q)=P+Q et δ(P,Q)=P-Q .

- Canonical height: hhat_D(P)=lim 1/n^2 h_D([n]P)
  - hhat_D = h_D+O(1); 
  - les deux égalités précédentes deviennent exactes pour hhat_D (ie le terme en O(1) disparaît)
  - si D ample, hhat_D(P)=0 ssi P dans la Kbar torsion. 

Si D ample, hhat_D induit une forme quadratique définie positive sur
  A(K) \tens R =~ R^d où d est le rand de A(K).
On a donc un produit scalaire <P,Q>_D=hhat_D(P+Q)-hhat_D(P)-hhat_D(Q)
sur A(K) \tens R, et A(K)/A(K)_tors =~ Z^d est un réseau dans R^d.
Regulator(A/K)=R_A/K := volume de ce réseau.

Weil height machine
===================

H: P^n(Qbar)->R hauteur de Weil
H(x)=\prod_v max_i {||x_i||_v||^n_i}^{1/[K:Q]} où K=Q(x_i)
h=log H

\Phi: P^n(Qbar)->P^m(Qbar), deg \phi=d, alors
h(\Phi(P))<= d h(P) + O(1)

Plus généralement si \Phi=(f_0,...,f_m) défini un morphisme projectif sur
P^n \ Var(f_i); X fermé dedans, alors
h(\Phi(P)) = h(P)+O(1) pour P \in X. (?? et le d??)

Weil height machine:
Pour une variété X et C \in Div_X => h_C hauteur
Si f,g \in k(X) alors h(f(P))/h(g(P)) = deg f/deg g (1+o(1))

Hauteur canonique sur les variétés abéliennes
=============================================

Manin-Zarhin: |h(θ(P))-h^(θ(P))| <= c_0(g,K,h(A))
donc si T torsion, h^(T)=0 donc T est de hauteur bornée.

D'après Fabien c_0 ne dépend que du corps de définition de A, pas de celui
de T, cf David-Philioppon Comment-Helvet 2002

habt(P)=h(P)-1/2 h(A) + Σ σ_p(P) + o(g)
