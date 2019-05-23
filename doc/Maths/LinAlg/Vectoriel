vim: ft=markdownlight fdm=expr

Matroid: http://en.wikipedia.org/wiki/Matroid

Formes linéaires
================
F \subset E, alors dim F^\perp = dim E-dim F; F^perp^perp=F car E**=E
canoniquement.

E ev de dim n, f_1 ... f_r formes linéaires sur E (engendrant un espace de
rang r_0); on a l'application évaluation: ev E-> k^r
son noyau est (f_i)^\perp de dim n-r_0; donc son image est de dim r_0.
Donc ev surjective <=> f_i libres; ev injective <=> f_i générateurs
Et dim<f_i>=dim <ev(base canonique)>

Cor: f \in Vect(f_i) <=> Ker f \supset \cap Ker f_i
Preuve: Ker f \supset \cap Ker f_i <=> l'orthogonal ne change pas de dim
<=> l'espace engendré par les f et f_i ne change pas de dim.

     Dim ev(F)=dim F - (f_i)^\perp \cap F, donc si les f_i sont génératrices dim F=dim ev(F)

Ex: sur E=k[X]_d; les formes P->P(x_i) avec les x_i des points distincts
sont libres tant que r<=d+1 et forment une base quand r=d+1, dont la base
duale est donnée par les polynômes de Lagrange. Ca marche aussi quand les
x_i ne sont pas distincts, si on sous entend par ex que si x_1 est répété
trois fois alors les formes sont P(x_1), P'(x_1) et P"(x_1) (cf polynôme
d'Hermite).
En effet si P s'annule en x_i à l'ordre n_i alors P est divisible par
(x-x_i)^n_i, donc si \sum n_i>=d+1 l'orthogonal de nos formes est {0} donc
elles sont génératrices.
Corollaire: P_i,m=\prod (x-x_j)^n_j / (x-x_i)^m (avec m<=n_i) forment une
base de k[X]_d si \sum n_i=d+1.
En effet ev(P_i) forme une matrice triangulaire supérieure inversible, donc
dim ev(P_i)=d+1 donc dim(P_i)=d+1

Alg linéaire
============

AX=B: X est une préimage de la fonction d'évaluation des formes linéaires
composant A.
Rang A=Rang des lignes (ie dim <f_i>)=Rang des colonnes (=dim ev(base
canonique)) [ce que l'on peut voir aussi comme la caractérisation du plus
grand mineur r*r non nul.]

https://en.wikipedia.org/wiki/Rouch%C3%A9%E2%80%93Capelli_theorem
Le système a une solution ssi rang(A)=rang(A|B) (et dans ce cas les sols
forment un espace affine de dim n-rang(A)).
Autrement dit on a une solution ssi tout mineur de taille rang(A)+1 est nul.
Comme rajouter une colonne à A augment le rang d'au plus 1; pour vérifier
ça il suffit d'extraire une famille libre de rang r=rang(A) des formes
linéaires puis de vérifier que pour toute r+1 lignes de (A|B) contenant ces
r formes alors le rang reste bien r, ie la ligne rajoutée est combinaison
des r-premières.

Prolongement
============

v:U->V; w:U->W; alors il existe f:V->W faisant commuter ssi Ker v \subset Ker w
v:V->U; w:W->U; alors il existe f:W->V faisant commuter ssi Im w \subset Im v

Formes bilinéaires
==================

E espace vectoriel de dim finie, b symétrique

- dim F^orth >= dim E-dim F.
- Si b est non dégénérée, dim F+dim F^orth=dim E.
- Si b|F est non dégénérée, E=F \somme F^orth

Preuve: si G \subset E, on a l'application B|G,F
G->E*->F*
x -> b(x,.)|F de noyau G \cap F^orth
Donc:
- dim F^orth=dim E-rang B|E,F >= dim E -dim F*=dim E-dim F
- Si b non dégénéré, b réalise un iso E->E* et donc B|E,F est surjective,
  ie dim F^orth=dim E-dim F
- si b|F est non dégénéré (<=> F \cap F^orth=0), B|F,F est un iso donc B|E,F est surjective et dim F^orth=dim E-dim F

Cartan-Dieudonné
-----------------

Every orthogonal transformation in an n-dimensional symmetric bilinear
space can be described as the composition of at most n reflections.

Witt
----

http://en.wikipedia.org/wiki/Witt%27s_theorem

Let (V, b) be a finite-dimensional vector space over an arbitrary field k together with a nondegenerate symmetric or skew-symmetric bilinear form. If f: U→U' is an isometry between two subspaces of V then f extends to an isometry of V.

Witt's theorem implies that the dimension of a maximal totally isotropic subspace (null space) of V is an invariant, called the index or Witt index of b,[1] and moreover, that the isometry group of (V, b) acts transitively on the set of maximal isotropic subspaces. This fact plays an important role in the structure theory and representation theory of the isometry group and in the theory of reductive dual pairs.
