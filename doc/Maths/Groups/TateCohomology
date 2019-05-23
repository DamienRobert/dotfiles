vim: ft=markdownlight fdm=expr

Cohomologie
===========

La cohomologie vient du foncteur exact à gauche "Invariants sous l'action de G"
On peut aussi définir H^i(G,A)=Ext^i_\Z[G](Z,A); on retrouve
H^0(G,A)=Hom_Z[G](Z,A)=A^G.

Z^1: f:G->M tel que f(gh)=f(g) g.f(h)
Cobord: f(g)=g.a - a
Donc si G=<g> on voit que H^1(G,M)={x de trace nulle}/g-Id

Homologie
=========

L'homologie vient du foncteur exact à droite "covariants", ie
M -> M/<g.m -m>
http://en.wikipedia.org/wiki/Group_cohomology#Group_homology
On peut aussi définir H_i(G,A)=Tor^i_\Z[G](Z,A); on retrouve
H_0(G,A)=Z[G]\tens_Z A.
Or 0->I_G -> Z[G]-> Z->0 où I_G est l'idéal d'augmentation, ie <g-1>;
d'où Z[G] \tens_Z A=A/I_G A= A/<g-1>A

Cohomologie de Tate
===================

http://en.wikipedia.org/wiki/Tate_cohomology_group

La cohomologie de Tate relie tout ça dans une chaîne indicée par \Z
(pour la longue suite exacte induite par une suite exacte)

-    \hat H^n(G,A) = H^n(G,A) for n≥ 1.
-    \hat H^0(G,A)= quotient of H^0(G,A) by trace
-    \hat H^{-1}(G,A)= quotient of trace 0 elements of H^0(G,A) by principal trace 0 elements (ie de la forme g.m-m)
-    \hat H^n(G,A) = H_{-(n+1)}(G,A) for n≤ −2.

The zeroth Tate cohomology group of A is
    (Fixed points of G on A)/(Obvious fixed points of G acting on A)
where by the "obvious" fixed point we mean those of the form Σ g(a). In other words, the zeroth cohomology group in some sense describes the non-obvious fixed points of G acting on A.

Cas d'un groupe cyclique
------------------------
http://math.stackexchange.com/questions/107243/cohomology-of-finite-cyclic-groups

Si G est cyclique engendré par g, on peut calculer la cohomologie de Tate
via le complexe
... -> M -> M -> M -> ...
        Tr_G  g-1

Où Tr_G=1+g+g^2+...+g^{n-1}

La cohomologie de Tate est donc cyclique de période 2, avec
\hat H^0(G,M)=Invariants / Traces
\hat H^1(G,M)= Traces 0 / g-1

Exemple: si G est cyclique d'ordre n et agit trivialement, alors Tr_G=[n] et
\hat H^0(G,M)=M/nM
\hat H^1(G,M)= M[n]
et donc
http://groupprops.subwiki.org/wiki/Group_cohomology_of_finite_cyclic_groups
H^p(G;M) = - M (p=0)
           - M/nM (p pair)
           - M[n] (p impair)

http://amathew.files.wordpress.com/2009/12/notes_cohomology.pdf
http://en.wikipedia.org/wiki/Herbrand_quotient
Define the Herbrand quotient as h(A) := card(\hatH^0(G,A))/card(\hatH^1(G,A)).
We can view the Herbrand quotient as an Euler-Poincare characteristic.
Indeed, if 0 → A → B → C → 0 is a short exact sequence, then the usual long
exact sequence becomes an exact hexagon, it follows at once that the
Herbrand quotient is multiplicative.
Note that h(A) = 1 if A is finite. Indeed, we have an exact sequence
0 → A^G → A → A → A/I_G A → 0,
where the second map is multiplication by s − 1 for s a generator of G. We
see that A^G and A_G=A/I_GA have the same cardinality if A is finite.

Inflation restriction
---------------------
http://en.wikipedia.org/wiki/Inflation-restriction_exact_sequence

Specifically, let G be a group, N a normal subgroup, and A an abelian group
which is equipped with an action of G, i.e., a homomorphism from G to the
automorphism group of A. The quotient group G/N acts on A^N = { a \in A : na
= a for all n \in N}. Then the inflation-restriction exact sequence is:

    0 → H^1(G/N, A^N) → H^1(G, A) → H^1(N, A)^G/N → H^2(G/N,A^N) → H^2(G,A)

In this sequence, there are maps

    inflation H^1(G/N, A^N) → H^1(G, A)
    restriction H^1(G, A) → H^1(N, A)G/N
    transgression H^1(N, A)^G/N → H^2(G/N, A^N)
    inflation H^2(G/N, A^N) → H^2(G, A)

The inflation and restriction are defined for general n:
    inflation H^n(G/N, A^N) → H^n(G, A)
    restriction H^n(G, A) → H^n(N, A)^G/N
The transgression is defined for general n
    transgression H^n(N, A)^G/N → H^{n+1}(G/N, A^N)
only if H^i(N, A)^G/N = 0 for i ≤ n-1.

Example: if L/K is Galois, we have
 0→H^1(Gal(L/K),M(L)) →_inf H^1 (K,M) →_res H^1(L,M)^Gal(L/K) →H^2(Gal(L/K),M(L))→_inf H^2(K,M)

Application: (Schaefer, Tate pairing)
Soit k un corps fini, G le groupe de Galois et M un G-module qui est aussi
un Z/lZ-ev de dim finie (l \ne p). [en fait tout ça se généralise
facilement à M fini en prenant l=ppcm des facteurs directs.]
Alors si L est l'espace de définition des points de M, et L_l l'extension
de degré l de L, alors l'application de restriction H^1(K,M)->H^1(L_l,M)
est triviale (restreindre à L, la restriction à L_l devient alors la
multiplication par l).
D'où H^1(K,M)=H^1(Gal(L_l/K),M)
Or Gal(L_l/K) est cyclique, et d'autre part la trace correspond ici à la
norme de L/K composée avec la multiplication par l, elle est donc triviale.
On a donc H^1(K,M)=M(Kbar)/Fr-1 et H^0(K,M)=M(K) (=\hat H^0(K,M))
(de plus comme le quotient de Herbrant est 1, ces deux groupes ont la même
dimension sur Z/lZ).
