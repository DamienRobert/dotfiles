vim: ft=markdownlight fdm=expr

Mesures
=======

Sigma algebra:
- http://www.math.uah.edu/stat/foundations/Other.html [Special Set Structures]
- http://www.fmf.uni-lj.si/~vidmarm/Dynkin_and_pi_systems.pdf [Dynkin (λ-) and π-systems; monotone classes – with some probabilistic corollaries]
Wikipedia:
- https://en.wikipedia.org/wiki/Pi_system
- https://en.wikipedia.org/wiki/Dynkin_system
- https://en.wikipedia.org/wiki/Monotone_class_theorem
- https://en.wikipedia.org/wiki/Sigma-algebra

Extension (et unicité) de mesure:
https://en.wikipedia.org/wiki/Carath%C3%A9odory%27s_extension_theorem

Résumé (par ordre croissant de propriétés):
- \pi-system: stable par intersection finie
- semi-ring: \empty \in T; stable par intersection finie et
  si A \subset B \in T; B \ A=\cup K_i; K_i \in T union disjoint finie
- ring: \empty \in T: stable par union finie et différence relative <=>
  stable par intersection et delta (ie 'x' et '+' dans l'algère P(X)).
  => stable par union et intersection finie
  [semi-ring => ring associé est simplement les unions disjointes des
  éléments du semi-ring]
- algebra/field: ring + X in T (ie stable par complément)
- sigma-algebra

- monotone class: stable par union dén croissante et intersection dén
  décroisante (ie monotone)
- lambda-system: \empty \in T; stable par complément et union dénombrable
  disjointe <=> X \in T; stable par différence relative et union
  dénombrable croissante
  [=> lambda= monotone class + différence relative + X \in T]

\sigma-algebra = \lambda+\pi = \algebra+monotone
Plus précisément: si T_1 \pi \subset T_2 \lambda; alors \sigma(T_1)\subset T_2
                  si T_1 algebra \subset T_2 monotone; ...

Radon: https://en.wikipedia.org/wiki/Radon_measure
K(X):=C_compact(X). Riesz–Markov–Kakutani representation theorem: each positive linear form on K(X) arises as integration with respect to a unique regular Borel measure. 
A real-valued Radon measure is defined to be any continuous linear form on K(X); they are precisely the differences of two Radon measures. This gives an identification of real-valued Radon measures with the dual space of the locally convex space K(X).
Attention: real-valued measures are more general than signed measures, cf
https://en.wikipedia.org/wiki/Signed_measure: an extended signed measure is the difference of two nonnegative measures, and a finite signed measure is the difference of two finite non-negative measures.

https://en.wikipedia.org/wiki/Lebesgue%27s_decomposition_theorem
Lebesgue's decomposition theorem states that for every two σ-finite signed measures μ on a measurable space (Ω,Σ), there exist two σ-finite signed measures ν_0 and ν_1 such that: ν = ν_0 + ν_1, ν_0 ≪ μ, ν_1 ⊥ μ
Et on peut décomposer v_1 en v_{1,continu}+v_{1,discret}.

Ensemble non borélien
---------------------
sciences.maths:20891
C'est faux, parce que tu confonds « mesurable » au sens de
« Lebesgue-mesurable » (i.e., pour un ensemble : appartient à la tribu
complétée ; et pour une fonction : l'image réciproque d'un ouvert /
borélien est dans cette tribu) et au sens de « borélien » :

On peut prouver l'existence d'un ensemble non _borélien_ de R sans
utiliser l'axiome du choix (sa fonction indicatrice est alors non
Borel-mesurable) ; en fait, on peut montrer l'existence d'un borélien
de R² dont la projection sur R n'est pas borélienne.  Ce n'est pas
super difficile, et c'est complètement explicite : c'est en gros un
argument diagonal à partir d'un truc universel.  D'ailleurs, c'est
fait dans le message 58 (<6v13fp$ovq$1@clipper.ens.fr>) de ce conti :
on peut vérifier assez facilement que la démonstration n'utilise pas
l'axiome du choix.

Ce qui est consistant avec ZF (si on admet la consistance d'un
cardinal inaccessible) c'est que toute partie de R est
Lebesgue-mesurable.  Remarquons, et ce n'est pas trivial, que la
projection d'un borélien de R² (ou l'image d'un borélien par une
fonction continue) est Lebesgue-mesurable.

Fonctions Mesurables
====================

Approcher des fonctions mesurables par des fonctions continues
--------------------------------------------------------------

http://math.stackexchange.com/questions/67055/are-there-lebesgue-measurable-functions-non-continuous-almost-everywhere
Lusin's Theorem. If f:[a,b]→ℂ is measurable, then for every ϵ>0 there exists a compact E⊆[a,b] such that f|E is continuous and μ(E^c)<ϵ.

http://en.wikipedia.org/wiki/Luzin%27s_theorem
Let (X,\Sigma,\mu) be a Radon measure space and Y be a second-countable topological space, let
    f: X \rightarrow Y
be a measurable function. Given ε > 0, for every A\in\Sigma of finite measure there is a closed set E with µ(A \ E) < ε such that f restricted to E is continuous. If A is locally compact, we can choose E to be compact and even find a continuous function f_\varepsilon: X \rightarrow Y with compact support that coincides with f on E.
Informally, measurable functions into spaces with countable base can be approximated by continuous functions on arbitrarily large portion of their domain.

http://math.stackexchange.com/questions/38989/nearly-but-not-almost-continuous
The characteristic function of a fat Cantor set gives an example (or any closed set with positive measure and empty interior). If C is such a set, and A is any null set, then ℝ∖A contains an element x of C. Every neighborhood of x intersects ℝ∖C in a set of positive measure (because nonempty open sets have positive measure), so for all δ>0, (x−δ,x+δ)∖A contains elements of ℝ∖C. This implies that the restriction of χC to ℝ∖A is discontinuous at x.

Rappel: cf forum/maths/integrale_denjoy

Théorème : toute fonction mesurable est approximativement continue
presque partout (et réciproquement).

Théorème : toute fonction ACG est approximativement dérivable presque
partout.  Bonus : si sa dérivée approximative est positive ou nulle,
la fonction est croissante (et par conséquent, si sa dérivée
approximative est nulle, la fonction est nulle).

Espaces L^p
===========

* https://en.wikipedia.org/wiki/Riesz%E2%80%93Markov%E2%80%93Kakutani_representation_theorem
Theorem. Let X be a locally compact Hausdorff space. For any positive linear
functional ψ on Cc(X), there is a unique regular Borel measure μ on X such that
    ψ(f) = ∫_X f(x)dμ(x) for all f in Cc(X). 

Historical remark: In its original form by F. Riesz (1909) the theorem
states that every continuous linear functional A[f] over the space C([0,
1]) of continuous functions in the interval [0,1] can be represented in the
form A[f] = ∫_0^1 f(x)dα(x)
where α(x) is a function of bounded variation on the interval [0, 1], and the
integral is a Riemann–Stieltjes integral. Since there is a one-to-one
correspondence between Borel regular measures in the interval and functions of
bounded variation (that assigns to each function of bounded variation the
corresponding Lebesgue–Stieltjes measure, and the integral with respect to the
Lebesgue–Stieltjes measure agrees with the Riemann–Stieltjes integral for
continuous functions ), the above stated theorem generalizes the original
statement of F. Riesz.

Theorem. Let X be a locally compact Hausdorff space. For any continuous
linear functional ψ on C0(X), there is a unique regular countably additive
complex Borel measure μ on X such that
    ψ(f) = ∫_X f(x) dμ(x)
for all f in C0(X). The norm of ψ as a linear functional is the total
variation of μ, that is ‖ψ‖=|μ|(X).
Finally, ψ is positive if and only if the measure μ is non-negative.

One can deduce this statement about linear functionals from the statement
about positive linear functionals by first showing that a bounded linear
functional can be written as a finite linear combination of positive ones.

* https://twitter.com/gro_tsen/status/1106614230659272704 L^∞(ℝ;ℝ)

- ✱(A) L^∞(ℝ;ℝ) can be identified (as an ordered and normed vector space) with the space C(X;ℝ) of CONTINUOUS functions on the Stone space (=space of ultrafilters) of the (complete!) Boolean algebra of Borel sets modulo measure zero sets in ℝ

- This space X (which as a Stone space is compact Hausdorff totally disconnected — even extremally disconnected) is interesting on its own but hard to visualize. It is the “Gleason space” of the density topology on ℝ

- It (X) is the projective limit of Stone-Čech compactifications of open dense sets of the density topology, cf https://mathoverflow.net/questions/178806/is-the-absolute-of-a-compact-space-the-projective-limit-of-the-stone-%c4%8cech-compac

- Seeing L^∞(ℝ;ℝ) as C(X;ℝ) lets us describe (in a way…) the dual of L^∞, namely (via the Riesz-Markov-Kakutani representation theorem) as the set of regular Borel measures on X.

- ✱(B) But L^∞(ℝ;ℝ) can also be seen as the set of “approximately normal lower semicontinuous” functions on ℝ (not equivalence classes! real functions!).

- Normal lower semicontinuous” means f(x) equals the lim.inf for y→x
  of the lim.sup for z→y of f(z). And “approximately” means “for the
  density topology on ℝ rather than the usual topology (at the source)”
  when taking limits.

- Approximately normal lower semicontinuous functions are not a vector
  space, but still, it's remarkable that every class in L^∞(ℝ;ℝ) is
  represented by a unique such function. And we get one from any (bounded)
  function by taking the apprx.lim.inf of the apprx.lim.sup. 

- ✱PS: Very similar stuff can be said about bounded Borel functions modulo
  meager sets instead of measure zero, using the usual topology on ℝ
  instead of the density topology (and picture the Stone space of
  Borel/meager as “possibilities of generic reals”).

* https://twitter.com/gro_tsen/status/1101508688068730880
The (topological, i.e., continuous) dual (ℓ^∞)′ of the space ℓ^∞ of bounded
sequences is identifiable with the "ba" space of (signed) bounded FINITELY
ADDITIVE measures on all subsets of ℕ. https://en.wikipedia.org/wiki/Ba_space
But the same space (ℓ^∞)′ is ALSO identifiable (via the
Riesz-Markov-Kakutani representation theorem) with the space of all
(signed) finite (countably additive!) Borel measures on the Stone-Čech
compactification βℕ of ℕ


* https://twitter.com/gro_tsen/status/1088194783435210760

The "density topology" on ℝ is a topology that is finer (=has more open
sets) than the usual topology: E⊆ℝ is density-open iff E is measurable for
the Lebesgue measure μ, and for each x∈E we have μ(E∩[x−ε,x−ε])/(2ε)→1 when
ε→0 (read "E has density 1 at x"). 
Equivalently, a density-neighborhood of x∈ℝ is a set containing a
measurable E∋x having density 1 at x. It is not quite obvious but true that
this defines a topology (Hausdorff, even completely regular, but not
normal); clearly all the usual-open sets are density-open.
To give a hopefully enlightening example, if we remove from ℝ the union C of
all the intervals [1/n, 1/n + 1/n²], the resulting ℝ\C is not a
neighborhood of 0 for the usual topology, but it is for the density
topology (in fact, C is density-closed).
In some ways, the density topology looks like the usual topology: for
example, ℝ is connected for it (and the connected subsets are precisely the
intervals), which is quite remarkable given how fine it is.
But in other ways, it is completely different: it is not metrizable, and
in fact, every countable set (or more generaly, of Lebesgue measure
zero) is closed and discrete so no sequence can converge non-trivially.
The Borel sets of the density topology are the Lebesgue-measurable sets.
The continuous functions from the density top. on ℝ to the usual top. on ℝ
are the "approximately continuous" functions from analysis (e.g., any
bounded approximately continuous function is a derivative).
Despite knowing all this, I still struggle to form a mental picture of
the density topology. I visualize it as ℝ somehow "made more porous" (or
made more tolerant of porosity, as in C above?), but I'm not sure this is
accurate. Anyway, a nice topological space, worth knowing.


Intégrale de Riemann
====================

- f est Riemann-intégrable si elle est intégrable au sens de Lebesgue et si
les points de discontinuités de f sont de mesure nulle.

Ex: 1_Q est Lebesgue intégrable (d'intégrale 0), mais pas Riemann
intégrable, tout point est un point de discontinuité.

- f est réglée si elle est limite uniforme de fonctions en escalier.
Th: f réglée <=> pour tout x, f admet une limite à droite en x et une
limite à gauche en x.
Si f est réglée, f est Riemann-intégrable
Ex: f croissante (et donc f VB) => f réglée

Ex: p/q->1/q, irrationel->0 n'est pas réglée (car pas de limite à g/d en un
rationnel), mais est Riemann-intégrable (car les points de discontinuités
sont les rationnels, ie de mesure nulle)

Intégrale de Henstock and Kurzweil
==================================

= intégrale de Denjoy-Perron

Cf https://en.wikipedia.org/wiki/Henstock%E2%80%93Kurzweil_integral
http://www.tjsullivan.org.uk/pdf/2011-08-12-gauge.pdf
R. G. Bartle. “Return to the Riemann integral.” Amer. Math. Monthly 103 (8):625–632, 1996.
R. G. Bartle. A Modern Theory of Integration. Graduate Studies in Mathematics, 32. American Mathematical Society, Providence, RI, 2001

- Si f est gauge intégrable sur [a,b]; elle est intégrable sur tout
sous-intervalle [a',b'] et \int_a'^b' f -> \int_a^b f quand a'->a, b'->b.
- Convergence dominée si g <= f_n <= h, avec g, h gauges-intégrables
- Si f est gauge intégrable, F=\int_a^x f; alors |f| est gauge intégrable
  ssi F est VB, et \int |f| = VB(f, [a,b])
- f est gauge intégrable sur [a,b] et F(x)=\int_a^x f <=>
  F ACG* sur [a,b], F(a)=0 et F'(x)=f(x) pp.
  F ACG* <=> F' existe pp et est gauge intégrable d'intégrale F.
  [intuitivement, F est l'intégrale de f si F'=f pp et sur le lieu où ce
  n'est pas vrai F est de variation bornée arbitrairement petite, cf https://www.maa.org/sites/default/files/pdf/upload_library/22/Ford/Bartle625-632.pdf]
- f est lebesgue intégrable ssi f et |f| sont gauge-intégrables

Limite dans les intégrales
==========================

## Lemme de Fatou
http://en.wikipedia.org/wiki/Fatou%27s_lemma

Pour des fonctions positives mesurables f_n, on a
\int lim_inf f_n <= lim_inf \int f_n

## Lebesgue's monotone convergence theorem
http://en.wikipedia.org/wiki/Monotone_convergence_theorem

Si la suite f_n (de fonctions mesurables à valeurs dans [0,\infinity]) est
croissante, alors
\int lim f_n = lim \int f_n

## Théorème de Fatou-Lebesgue
http://en.wikipedia.org/wiki/Fatou%E2%80%93Lebesgue_theorem

Soit f_n une suite de fonctions mesurables réelles dominées par g
(positive) intégrable, alors
\int lim_inf f_n <= lim_inf \int f_n <= lim_sup \int f_n <= \int lim_sup f_n

Rem: comme |lim_inf f_n| <= g et pareil pour lim_sup, les fonctions lim_inf
et lim_sup sont bien intégrables.

## Théorème de convergence dominée
http://en.wikipedia.org/wiki/Dominated_convergence_theorem

Soit f_n une suite de fonctions mesurables réelles dominées par g
(positive) intégrable. Si f_n converge simplement vers f alors f est
intégrable et
  lim \int |f_n - f| = 0
en particulier
  lim \int f_n = \int lim f_n = \int f

Rem: dans tous ces théorèmes, on peut remplacer les conditions par des
conditions presque partout.

## Théorème de convergence de Vitali
http://en.wikipedia.org/wiki/Vitali_convergence_theorem
[Dans un espace de mesure bornée, on peut remplacer la convergence dominée
par la condition d'intégrabilité uniforme]

Dans un espace de mesure borné, si f_n est une suite de fonctions
uniformément intégrables qui convergent presque partout vers f (f(x) <
\infinity presque partout), alors f est intégrable et
  lim \int |f_n - f| = 0

## Vitali pour le cas de l'intégrale de Riemann:
http://www.math.washington.edu/~morrow/335_13/dominated.pdf

Th (Arzela):
soit f_n une suite de fonctions Riemann-intégrables qui convergent
simplement vers f Riemann-intégrable sur [a,b]. Si les f_n sont unif
bornées, alors
lim \int |f_n - f|=0.

Rem: la grande différence avec le théorème de convergence dominée c'est que
f, bien qu'intégrable au sens de Lebesgue, ne l'est pas forcément au sens
de Riemann. Cependant si les f_n convergent unif vers f, alors f est
bien intégrable au sens de Riemann.
Convergence
===========

http://math.stackexchange.com/questions/138043/does-convergence-in-lp-implies-convergence-almost-everywhere

Convergence dans L_p n'implique pas convergence ae mais c'est vrai si on
extrait une sous-suite.

Application: si p>=1 les fonctions continues sont denses dans L_p; on peut
même supposer qu'on a une suite qui converge ae.

cf: www.maths.bris.ac.uk/~matmj/mtandIsec7.pdf
Theorem 7.5. Let (f_n ) be a sequence of R-valued, measurable functions,
which is Cauchy in measure. Then there is a subsequence of f_n , which
converges μ-a.e. and in measure to a R-valued, measurable function f .

Theorem 7.11. Let (f_n) converge to f in measure. Then there is a
subsequence that converges almost uniformly to f.

Theorem 7.13. (Egorov’s Theorem)
Suppose μ(X) < ∞. Let (f_n) be a sequence of measurable, R-valued func-
tions which converges almost everywhere to a measurable, R-valued function
f. Then (f_n) converges almost uniformly to f.

http://terrytao.wordpress.com/2010/10/02/245a-notes-4-modes-of-convergence/
et les cours de Terrence:
http://terrytao.wordpress.com/category/teaching/245a-real-analysis/
http://terrytao.wordpress.com/category/teaching/245b-real-analysis/page/2/
http://terrytao.wordpress.com/category/teaching/245c-real-analysis/

Convolution
===========

Translation
------------

https://math.stackexchange.com/questions/458230/continuity-of-l1-functions-with-respect-to-translation
Si f est Lp (p<infty), t->f_t est continue:

The translations τ_t, where τ_t(f)(x)=f(x−t) are isometries of L1 (more
general, any Lp). Thus the family T={τ_t:t∈R^n} is equicontinuous. For
f∈Cc(Rn), we have lim t→0 τ_(f)=f in Lp by the uniform continuity of f. For
1⩽p<∞, Cc(Rn) is dense in Lp.
By the theorem of Ascoli (-Bourbaki), on a family F of equicontinuous
functions φ:X→Y, the topology of pointwise convergence on X, the topology
of pointwise convergence on a (fixed) dense subset of X and the topology of
uniform convergence on compact subsets of X coincide.
Hence not only lim t→0 τ_t(f)=f for all f∈Lp [p<∞, again], the convergence
is even uniform on all compact subsets of Lp.

Application aux suites régularisantes
-------------------------------------
https://fr.wikipedia.org/wiki/Suite_r%C3%A9gularisante
https://en.wikipedia.org/wiki/Mollifier

Soit T une distribution et (φ_n) une suite régularisante. Alors la suite des distributions régulières associées aux fonctions T ∗ φ_n  converge vers T dans D′, autrement dit : ∀ f ∈ D, φ_n ∗ f → f dans D. Plus généralement:

Théorème — Pour toute suite régularisante (φ_n) sur R^d:
  - si X est l'un des espaces D^m(R^d), E^m(R^d) (0 ≤ m ≤ ∞) ou Lp(ℝ^d) (1 ≤ p < ∞) alors ∀ f ∈ X, φ_n ∗ f → f dans X
  - pour toute fonction f mesurable bornée sur R^d et continue sur un compact K, φ_n ∗ f → f uniformément sur K.

