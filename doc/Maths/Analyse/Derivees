vim: ft=markdownlight fdm=expr

Points de dérivabilité
======================

Liens:
http://mathoverflow.net/questions/167323/everywhere-differentiable-function-that-is-nowhere-monotonic
http://math.stackexchange.com/questions/112067/how-discontinuous-can-a-derivative-be

https://groups.google.com/forum/#!msg/sci.math/dZB-nWYPCCg/JMCoHhvkS4EJ
 HISTORICAL ESSAY ON CONTINUITY OF DERIVATIVES

https://groups.google.com/forum/#!msg/sci.math/gLKVOmePExU/H3EQ0HVpoj4J
 Set of discontinuities of a derivative

https://groups.google.com/forum/#!msg/sci.math/JSZiDgWxlPk/jolpTO7A2wUJ
 References for Continuity Sets

https://groups.google.com/forum/#!msg/sci.math/8vp1XK0-KNg/UOmRLJmd0xsJ
 ESSAY ON NON-DIFFERENTIABILITY POINTS OF MONOTONE FUNCTIONS

https://groups.google.com/forum/#!msg/sci.math/ZBCCYjtCSMA/19OUtU88RwAJ
 HISTORICAL ESSAY ON F_SIGMA LEBESGUE NULL SETS

We say a real-valued function f is Baire one if f is the
pointwise limit of some sequence of continuous functions.
Examples of Baire one functions are functions with countably
many points of continuity, semi-continuous functions,
derivatives, and functions f:R^2 --> R that are separately
continuous in each variable (but not necessarily functions
from R^n to R for n > 2). A function is Baire two if it is
a pointwise limit of Baire one functions.

Given a function f:R --> R, we let C(f) and D(f) denote the sets
of continuity and discontinuity points, respectively, of f.

cf https://groups.google.com/forum/#!msg/sci.math/JSZiDgWxlPk/jolpTO7A2wUJ

--------------------------------------------------------------
THEOREM 1:  If f:R --> R is monotone (or even of
            bounded variation), then D(f) is countable.

THEOREM 1': If E is any countable subset of R, then
            there exists a strictly increasing function
            f:R --> R such that D(f) = E.

THEOREM 2:  If f:R --> R is an arbitrary function, then
            D(f) is an F_sigma subset of R.

THEOREM 2': Given any F_sigma subset E of R, then there
            exists a Baire two function f:R --> R such that
            D(f) = E.

REMARK: Very few, if any, of the references point out that
        f can be chosen to be a Baire two function, but the
        actual constructions are clearly Baire two functions.

THEOREM 3:  If f:R --> R is a Baire one function, then D(f)
            is an F_sigma meager (= first category) subset of R.

REMARK: This implies that, for each Baire one function,
        C(f) is dense in R, c-dense in R, and even co-meager
        in every open interval.

THEOREM 3': Given any F_sigma meager subset E of R, then
            there exists a Baire one function such that
            D(f) = E. In fact, f can be chosen to be
            semi-continuous or to be a bounded derivative.

REMARK: A meager F_sigma set can be c-dense in R, have a
        measure zero complement, or to even have a Haudsorff
        h-measure zero complement for any pre-assigned measure
        function h.

THEOREM 4:  If f:[a,b] --> R is Riemann integrable, then
            D(f) is an F_sigma meager & measure zero subset
            of R.

THEOREM 4': Given any F_sigma meager & measure zero subset E
            of [a,b], then there exists a Riemann integrable
            function f:[a,b] --> R such that D(f) = E.

--------------------------------------------------------------

PROOFS OF 4 & 4':

References omitted because this follows from Theorem 2
and the fact -- whose proof can be found in most any real
analysis text -- that a bounded function f:[a,b] --> R is
Riemann integrable if and only if D(f) has measure zero.

Regarding our more precise (and apparently stronger for one
direction) version, note that any F_sigma measure zero set
is a countable union of closed measure zero sets, and hence
a countable union of nowhere dense sets.

Interestingly, despite the ease in which this more precise
version follows from results in virtually every graduate
level real analysis text, I have not seen this more precise
version explicitly stated outside of a handful of research
papers. Rooij/Schikhof [44] comes the closest that I've seen.

Their Exercise 6.I (p. 42) asks the reader to verify that every
F_sigma measure zero set is meager and their Theorem 7.5 (p. 44)
implies that D(f) is F_sigma. Even Oxtoby [40], which gives
an extensive overview of various measure and category analogs,
doesn't mention that D(f) is meager for a Riemann integrable f,
despite having (1) a proof of the Riemann integrability
continuity condition (pp. 33-34), (2) a proof that any D(f)
set is F_sigma (p. 31), and (3) the observation that any
F_sigma Lebesgue measure set is meager (bottom of p. 51).
What makes this result more interesting is that for a Riemann
integrable function f, D(f) is actually "infinitely smaller
than" some meager-and-measure-zero sets. More precisely, there
exists a set E such that E is meager and E has measure zero
such that E cannot be covered by countably many F_sigma measure
zero sets (the latter being the discontinuity sets of Riemann
integrable functions). Thus, not only is it an understatement
to describe the size of the discontinuity sets of Riemann
integrable functions by saying they have measure zero (because
they are also small in the Baire category sense), but it's even
an understatement to describe their size by saying they are
simultaneously measure zero and meager! For more about the size
classification that discontinuity sets of Riemann integrable
functions belong to, see the following post.
HISTORICAL ESSAY ON F_SIGMA LEBESGUE NULL SETS
http://groups.google.com/group/sci.math/msg/00473c4fb594d3d7

Dini
====

Définitions
-----------

D^+ F: dérivée supérieure droite
D_+ F: dérivée inférieure droite
D^- F: dérivée supérieure gauche
D_- F: dérivée inférieure gauche

Propriétés faciles
------------------

- D^+ F >= D_- F et D^- F >= D_+ F à peu près partout.
Application: l'ensemble des x tels que F est dérivable à gauche et à
droite, de dérivées différentes, est dénombrable.
- {x/ D^+ F =-infty} est de mesure nulle

(De même, lim sup F(x) > lim sup droite F(x) au plus sur un ens
dénombrable)

Denjoy-Young-Saks
-----------------

pour toute fonction, on a presque partout un des cas suivants:
- Les 4 dérivées de Dini coincident, F est donc dérivable (F est de mesure
  angulaire 0 en x)
- D^+ F(x)= +infty, D_-F(x)= -infty, D_+ F(x)=D^-F(x)
  (F est de mesure angulaire 180° dans le sens trigo)
- D^- F(x)= +infty, D_+F(x)= -infty, D_- F(x)=D^+ F(x)
  (F est de mesure angulaire 180° dans le sens antitrigo)
- D^+ F(x)=D^- F(x)= +infty, D_+ F(x) = D_-F(x)= -infty,
  (F est de mesure angulair 360°)

Le même théorème est vrai si on remplace dérivée par dérivée approximative
et Dini par Dini approximatif. Si de plus f est mesurable, dans ce cas on a
presque partout soit (i) (le cas 0° approximatif) ou (iv) (le cas 360°
approximatif)

Dini et continuité
------------------

Si F est continue, les bornes de D^+ F (ou de tout autre dérivée de Dini)
sont égales aux bornes des quotiens (F(x)-F(y))/(x-y) pour x,y dans [a,b]

Application: si F est continue et que D^+ F est continue en x_0, alors les
dérivées de Dini sont égales en x_0 donc F est dérivable en x_0

Soit F est continue sur R, alpha \in R. Si {x / D^+ F(x) >= alpha} est
dense, et qu'il existe un point x_0 avec D^+ F(x_0)<alpha, alors l'ensemble
{x / D^+ F(x)=alpha} est de cardinal C.
Avec alpha=0 ça donne une condition de monotonie.

Denjoy (forum)
==============

https://en.wikipedia.org/wiki/Khinchin_integral

From madore@clipper.ens.fr Tue Jan 17 17:36:59 2006
Article: 1260 of ens.forum.sciences.maths.avancees
Path: eleves!not-for-mail
From: madore@clipper.ens.fr (Gro-Tsen)
Newsgroups: ens.forum.sciences.maths,ens.forum.sciences.maths.avancees
Subject: integrale de Denjoy-Khintchine
Followup-To: ens.forum.sciences.maths.avancees
Date: Tue, 17 Jan 2006 16:36:59 +0000 (UTC)
Organization: Le forum de l'ENS.
Lines: 126
Sender: madore@clipper.ens.fr
Message-ID: <dqj6fb$elb$1@clipper.ens.fr>
NNTP-Posting-Host: clipper.ens.fr
X-Trace: clipper.ens.fr 1137515819 15019 129.199.129.1 (17 Jan 2006 16:36:59 GMT)
X-Complaints-To: forum@clipper.ens.fr
NNTP-Posting-Date: Tue, 17 Jan 2006 16:36:59 +0000 (UTC)
X-Newsreader: Flrn (0.5.0pre1 - 03/04)
X-Start-Date: 17 Jan 2006 15:04:30 GMT
Xref: eleves ens.forum.sciences.maths:12837 ens.forum.sciences.maths.avancees:1260

Je me propose dans ce message de décrire de façon très synthétique,
pour ceux qui n'y connaissent rien (comme moi, jusqu'à un moment), ce
que c'est que l'intégrale de Denjoy-Khintchine (parfois appelée par un
des deux noms seulement, mais, attention, il y a deux intégrales de
Denjoy : celle de Denjoy-Perron et celle de Denjoy-Khintchine, cette
dernière étant plus générale).

Je parlerai uniquement de fonctions réelles de la variable réelle.  Et
je vais me placer sur des intervalles bornés, juste pour éviter
d'avoir à écrire L¹_{loc} (j'écrirai juste L¹).

Voici les observations de base (qui servent à motiver ce qu'on veut
faire) :

* Si F définie sur [a;b] est une fonction absolument continue (ce qui
signifie que pour tout epsilon>0 il existe eta>0 tel que si [a_i;b_i]
est une famille finie de segments _deux à deux disjoints_ dans [a;b]
tels que la somme des longueurs |b_i-a_i| soit inférieure à eta alors
la somme des |F(b_i)-F(a_i)| est inférieure à epsilon ; c'est aussi,
je crois, équivalent à dire que F, vue comme distribution, a une
dérivée qui est une fonction L¹) alors (1) F est presque partout
dérivable (de dérivée finie), (2) sa dérivée f=F' (définie presque
partout) est L¹, et (3) F est l'intégrale, au sens de Lebesgue, de sa
dérivée f (cette intégrale ayant un sens, justement, parce que f est
L¹).  Et « réciproquement », si f est L¹, alors son intégrale F (pour
l'intégrale de Lebesgue) est absolument continue de dérivée presque
partout égale à f (donc f détermine F).

* Si F est une fonction dérivable (partout, sauf éventuellement sur un
ensemble dénombrable, et de dérivée finie), il n'est pas forcément
vrai que sa dérivée, f, soit L¹, ni que F soit absolument continue
(ces deux choses sont équivalentes).  En revanche, si f _est_ L¹,
alors F est bien l'intégrale, au sens de Lebesgue, de f.  Et dans le
cas général, la donnée de f suffit bien à déterminer F à constante
près (théorème des accroissements finis).

* Si F est une fonction dérivable (de dérivée finie) presque partout,
sans condition supplémentaire, il n'est pas forcément vrai que la
donnée de f suffit à déterminer F : il existe des fonctions presque
partout dérivable et de dérivée nulle partout où elle est définie,
mais qui ne sont pas constantes.

Pour résumer, une intégrale de Lebesgue donne une fonction absolument
continue, et une intégrale au sens « primitive » donne une fonction
dérivable.  Il n'y a pas d'implication entre ces deux notions, et on
veut essentiellement trouver une généralisation commune : l'approche
naïve consistant à dire « on va prendre toutes les fonctions
dérivables presque partout » n'est pas bonne, parce que ces fonctions
ne sont pas déterminées par leur primitive presque partout.

Donc, on définit une fonction ACG (« absolument continue au sens
généralisé ») comme une fonction F qui est continue et dont le domaine
de définition peut s'écrire comme réunion au plus dénombrable de
parties sur chacune desquelles F est absolument continue.  (Pour une
partie qui n'est pas un intervalle, il n'y a pas de difficulté
particulière à définir l'absolue continuité : on demande que les
intervalles [a_i;b_i] aient des extrémités dans le domaine de
définition.)

L'idée, c'est que les intégrales de Denjoy-Khintchine donneront des
fonctions ACG.  On pourrait espérer qu'une fonction ACG soit dérivable
presque partout - comme l'est une fonction absolument continue.  Ce
n'est pas le cas, donc il faut introduire la dérivée approximative,
qui généralise la dérivée.

Rappelons qu'un point x d'un ensemble mesurable E est appelé « point
de densité » de E lorsque la limite quand h tend vers 0 de µ(E inter
]x-h;x+h[) / 2h existe et vaut 1 (il suffit, bien sûr, de demander que
la limite inf vaille 1).  Moralement, E occupe presque toute la mesure
tout près de x.  Un théorème dont on ne connaît pas bien le nom (voir
le thread du message <b0p278$cq2$2@clipper.ens.fr> aka maths:7206 pour
une discussion à son sujet) affirme que presque tout point de E est un
point de densité de E.

Une fonction réelle (définie sur un mesurable E) est dite
approximativement continue, resp. approximativement dérivable, en x
(un point de E) lorsqu'il existe une partie E' de E dont x soit un
point de densité, et telle que la restriction de f à E' soit continue,
resp. dérivable, en x.  On devine facilement le sens de la « dérivée
approximative » d'une fonction approximativement dérivable en x.

Théorème : toute fonction mesurable est approximativement continue
presque partout (et réciproquement).

Théorème : toute fonction ACG est approximativement dérivable presque
partout.  Bonus : si sa dérivée approximative est positive ou nulle,
la fonction est croissante (et par conséquent, si sa dérivée
approximative est nulle, la fonction est nulle).

Théorème : toute fonction dérivable partout (sauf éventuellement sur
un ensemble dénombrable ; de dérivée finie) est ACG (elle est même
quelque chose de plus fort, dite ACG*, mais je ne veux pas en parler).

D'après tout ce qui précède, on comprend l'intérêt de définir :

Une fonction mesurable f (définie sur un intervalle [a;b]) est dite
intégrable au sens de Denjoy-Khintchine ssi il existe une fonction F
qui est ACG et dont la dérivée approximative est, presque partout,
égale à f.  Dans ce cas, l'intégrale de Denjoy-Khintchine de f entre a
et b sera, par définition, F(b)-F(a) (ce qui a un sens puisque F est
déterminée à constante près par f, cf. ci-dessus).

Il résulte de ce qui précède que toute fonction L¹ est intégrable au
sens de Denjoy-Khintchine, et l'intégrale de Denjoy-Khintchine
coïncide alors avec l'intégrale de Lebesgue.  Idem, la dérivée de
n'importe quelle fonction dérivable (partout, de dérivée finie) est
intégrable au sens de Denjoy-Khintchine, et l'intégrale de
Denjoy-Khintchine coïncide alors avec la primitive.

Par ailleurs, une fonction intégrable au sens de Denjoy-Khintchine est
mesurable et, si elle est positive, elle est intégrable au sens de
Lebesgue (L¹, quoi, puisque je me place sur des intervalles bornés).

Je vous passe tous les théorèmes afférents, mais voici pour
l'intégration par parties : si f est intégrable au sens de
Denjoy-Khintchine, et si G est à variations bornées (= différence
d'une fonction croissante et d'une fonction décroissante : c'est plus
faible que absolument continu) alors fG est encore intégrable au sens
de Denjoy-Khintchine et, si on note F l'intégrale de f, l'intégrale de
fG est FG moins l'intégrale de F par rapport à dG (où dG est la mesure
évidente : celle qui donne à un intervalle [x;y] la mesure G(y)-G(x)).

En particulier, bien sûr, toute fonction f intégrable au sens de
Denjoy-Khintchine définit une distribution, à savoir la dérivée au
sens des distributions de la fonction F intégrale de f (et qui, elle,
est certainement une distribution puisqu'elle est continue...).

Type de fonctions
=================

Théorème fondamental
--------------------

https://en.wikipedia.org/wiki/Fundamental_theorem_of_calculus

- f AC => f' L1 et f=\int f'
- Réciproquement si f L1, F=\int f est AC et F'=f ae (de plus F'(x) existe et égal à f(x) si x point de continuité de f)

- f VBG* => f dérivable a.e.
  Si de plus f ACG*, f est l'intégrale (de Denjoy) de sa dérivée.
- Réciproquement si f est Denjoy-intégrable, son intégrale g est ACG* et
  g'=f pp

- f VBG + mesurable => f approx dérivable a.e.
  Si de plus f ACG, f est l'intégrale (de Khintchin) de sa dérivée
  approximative.
- Réciproquement si f est Denjoy-intégrable, son intégrale g est ACG et
  g'_ap=f pp

Variation bornée
----------------
V_a,b(f)=sup \sum_partitions |f(x_i+1)-f(x_i)|
        = \int |f'(x)|
Bounded variation => "dérivée" qui est une mesure

Rappel: si f dérivable à peu près partout, |f(b)-f(a)|<=\int |f'(x)|
Si f' L1 on a f(b)-f(a)=\int f'(x)

Si f dérivable partout, f' est Darboux
Si f est localement lipschitz, D^+ F finie.

\lambda_f: c'est l'inf des variations de f sur les full subcovers
\lambda_f*: pareil pour les fine subcovers
on a \lambda_f*<=\lambda f, égalité si f a la propriété de Vitali (on peut
montre que c'est équivalent à f VBG*)
- \lambda f(E) <= \lambda_f(E)
- Si f continue croissante stricte, \lambda f(E)=\lambda_f(E)

Zéro Variation
--------------
(dans tout ce qui suit, on considère des fonctions sur [a,b] à valeur dans R.
Zéro variation: \lambda_f = 0, où \lambda_f est la mesure de Stielje

Si F dérivable et F'=0 sur E, F a zéro variation sur E.
F a zéro variation sur E => F'(x) = 0 a.e. sur E, et de plus mu(F(E))=0
(Attention: f continue => zéro variation si E dénombrable, mais pas
forcément si E de mesure nulle. Il faut être lambda-AC pour ça, par ex
ACG*)

Si F différentiable et mu(F(E))=0, alors F'(x)=0 a.e. sur E.

ex: -F(x)=x a zéro variation sur E ssi E de mesure nulle
    - on dit que F est lambda-AC si F a
      zéro variation sur les ensembles E de mesures nulles
    - On dit que F a la condition (N) de Luzin si F(E) à mesure zéro
      lorsque E a mesure 0. lambda-AC => (N) par ce qui précède.

Relations entre AC, VB, ...
---------------------------

Th: AC => (i) unif cont (ii) VB (iii) lambda-AC (iv) (N)
Réciproquement, (i)+(ii)+[ (iii) ou (iv) ] => AC.
(Thomson, théorie de l'intégrale)

AC => VB+ACG*, VB=>VBG*, AC* => VB*, ACG => VBG, ACG* => VBG* (trivial)
ACG* <=> unif continue + lambda-AC (Thomson, théorie de l'intégrale)
f continue ou localement VB => VBG*; VBG* <=> f a la Vitali property (ie
pour calculer \lambda_f on peut prendre des fine ou full cover)

Remarque: la variation de f sur [a,b] est égale à la mesure de Stilje
(celle qui définit VB*) de f sur (a,b)+celle sur {a} et sur {b}.

VB* sur E => VB* sur cloture de E
C'est vrai aussi pour BV, AC, AC* si F continue sur la cloture de E.

Saks, si E est fermé:
AC=VB+continue+(N)
ACG=VBG+continue+(N)
AC*=VB* + AC
ACG*=VBG* + ACG

Notations: (ACG), c'est la condition AC sur une réunion dénombrable
d'ensembles. [ACG] c'est quand on peut trouver ces ensembles fermés.
ACG, c'est (ACG) + continu (ou [ACG]+continu, ça revient au même)

VBG et dérivée approximative
----------------------------
(Saks)

f mesurable <=> f approx continue a.e.

- f VBG + mesurable => f approx dérivable a.e. (et f(E) est de mesure nulle
  où E est l'ensemble des points où f n'est pas approx dérivable).
  Si de plus f ACG, f est l'intégrale (de Khintchin) de sa dérivée
  approximative.
- A rapprocher du th de Lebesgue: f VB => f dérivable a.e (et f(E) est de
  mesure nulle si E est l'ensemble des points où f n'est pas dérivable).
  Si f AC c'est l'intégrale de sa dérivée (qui est sommable).
- Et pour l'intégrale de Denjoy, on a la même chose pour f ACG*
  (ie f VBG* => f dérivable a.e, et si f ACG* c'est l'intégrale de Denjoy
  de sa dérivée)

Réciproquement, si f continue + approx dér à peu près partout, f est ACG
(et est l'intégrale de Khintchin de sa dérivée approx).
Si f est continue et dérivable à peu près partout, f est ACG*

- Si D^sup F<infty  ou D_inf F >-infty n.e. sur E F est VBG* sur E.
- Si D^+ F<infty et D_+ F >-infty n.e. sur E, F vérifie les conditions ACG*
sur E, donc est ACG* sur E si de plus F continue.
(En particulier, dans les deux cas, F est dérivable a.e sur E, donc les
points ou F a une dérivée infinie est de mesure nulle).

- Si D^+ F<infty ou D_+ F >-infty ou D^- F < infty ou D_- F > -infty
ou D^sup,ap F < infty ou D_inf,ap F > -infty n.e. sur E
alors F est VBG sur E
(et donc F est approx dérivable a.e sur E, et la dérivée approx est presque
partout égale au dini fini)
- Si D^+,ap F<infty et D_+,ap F >-infty n.e. sur E, F vérifie les conditions ACG sur E, donc est ACG sur E si de plus F continue.
(Saks, chapitre VII $10)

Application: si F continue et D^+F existe partout, alors F est ACG et
F'_ap = D^+ F a.e (ça doit même marcher si F est de variation nulle là où
D^+F n'existe pas, car là F'=0 a.e)
Cf aussi Monotonicity theorem de Thomson, ou Bruckner Th 1.2 Chapitre X.

Propriété des dérivées approximatives
-------------------------------------

On suppose que F est approx dérivable sur [a,b]
- F'_ap est Baire 1 Darboux.
- Si F'_ap(x)<=G'(x) pour G dérivable, ou F croissante, alors en fait F est
  dérivable.
En général, il existe un ouvert dense tel que F est dérivable.

Le théorème des valeurs intérmédiaires marche pour les dérivées
approximatives. (ie F(b)-F(a)/b-a = F'_ap(c))

Dini et condition (N)
---------------------
Saks, Chapitre XI

Refinements de Denjoy-Youg-Saks:
- Si D^+F existe en tout point de E, alors l'ensemble X des points où ce
  n'est pas égal à D_- F est de mesure nulle, et F(X) est de mesure nulle
- Si sur E F a deux dérivées Dini du même côté finies, ou une dérivée sup ou
inf finie, alors F est presque partout dérivable, et si X est l'ens des
points où elle n'est pas dérivable, le graphe de F sur X est de mesure
nulle.

- Si |D^+F|<=M sur E, \mu(F(E))<=M \mu(E)
Applications:
- si en tout point de E F a une de ses Dini finie, alors F satisfait la
  condition (N).
-  Si D^+F est finie n.e. sur E, alors \mu(F(E)) <= \int_E D^+F et
   \mu(graphe de F sur E)<= \int_E [1+D^+F^2]^1/2
- Si une des Dini s'annule en tout point de E, \mu(F(E))=0
  Si F est Darboux sur E, ça impose F est constante sur E.

Banach conditions
-----------------

(T1)/(T2): almost every value of F is assumed at most a finite/denumbrable
number of time.

Th: Si F continue, F T1 sur I <=> F{x/ F non dérivable, même infinie en x} est
de mesure 0
Application:
- F continue VBG* => T1, F continue VBG => T2
(En fait on peut montrer que F VB => T1, et donc que F VBG => T2)
- F continue+(N) => T1 (cf Saks IX.7.3)

- Si F continue, La variation de F est égale à l'intégrale du nombre
d'antécédants de F.
- Si F continue+T2, -\mu F[N]<=F(b)-F(a)<=\mu F[P] où N est l'ensemble des points où
F a une dérivée négative ou nulle, et P celle où la dérivée est positive ou
nulle. (Et N union P est non dénombrable)
- Si F continue + T2, g L1 et |F'(x)|<=g(x) n.e. x où F'(x) existe (ou plus
  généralement si l'ens E où ce n'est pas le cas vérifie \mu F(E)=0), alors
  F est VB et F(b)-F(a) <= \int_a^b F'(x).
  Si g est Denjoy-integrale, alors on a la même conclusion, sauf que F est
  VBG* seulement.

Conditions (S)
--------------

Condition (S): pour tout epsilon, il existe eta tel que si mu(E)<eta,
mu(F(E)) < epsilon. (S) => (N) (et \lambda-AC il me semble)
(S) <=> (N)+(T1)

Théorème (Saks IX.7.7)
F continue. Alors F AC <=> F est (N) et \int F'(x) < \infty, où l'intégrale
se fait le long des points où F'(x)>=0 (et existe).
(Plus généralement, si g(x)=F'(x), 0 si F' n'existe pas est intégrale au
sens de Denjoy, F est ACG*)

Application:
- si F continue+(N), de dérivée positive ou nulle a.e. points où
elle est dérivable, alors F est croissante.
- si F continue+(N), alors elle est dérivable sur un ens de mesure >0

Conditions (D)
--------------

Si F mesurable, condition (D) en x_0: \exist N tel que x_0 n'est pas un
point de dispersion pour l'ensemble {x / |F(x)-F(x_0)|<=N (x-x_0)}

Th: - si une des dérivées de Dini approximatives est finie en x_0, F a (D) en
x_0.
    - Si F satisfait (D) sur un ens E, F satisfait (N) sur E.
Application:
  - Si F est continue sur E *fermé*, et n.e. dans E, F a deux dini du même
    côté finis ou une dérivée sup/inf finie, F est ACG* sur E.
  - Si F est continue sur E *fermé*, et n.e. dans E, F a un dini fini,
    ou une dérivée approx sup/inf finie, ou deux dini approximatifs du même
    côté fini, alors F est ACG sur E.
Corollaire:
  - Si f est n.e égale à une dérivée sup/inf d'une fonction continue F,
    alors f est intégrale au sens de Denjoy
  - Si f est n.e égale à une dérivée approx sup/inf ou une Dini d'une
    fonction continue F, alors f est intégrale au sens de Denjoy-Khintchin

Résumé
------

VBG et dérivée
- f VBG + mesurable => f approx dérivable a.e.
  Si de plus f ACG, f est l'intégrale (de Khintchin) de sa dérivée
  approximative.
- f VBG* => f dérivable a.e.
  Si de plus f ACG*, f est l'intégrale (de Denjoy) de sa dérivée.
  f' L1 <=> f AC (et alors f est l'intégrale de Lebesgue de f')

Dérivée et VBG
- Si n.e x \in E, f a une Dini finie, ou une dérivée extrème approx finie, f
  est VBG sur E.
- Si n.e x \in E, f a deux Dini approx du même côté finis alors f est [ACG]
  sur E.
  Si E fermé, f continue sur E et n.e x \in E, f a un Dini fini, ou une
  dérivée extrème approx finie, ou deux Dini approx du même côté finis,
  alors f est ACG sur E.
  Corollaire: si F continue + approx dérivable (ou d'un Dini fini) n.e.
  alors F ACG sur E (et de dérivée approx égale au truc fini a.e.)
- Si n.e x \in E, f a une dérivée extrème finie, f est VBG* sur E.
- Si n.e x \in E, f a deux Dini du même côté finis alors f est [ACG*] sur E.
  Si E fermé, f continue sur E et n.e x \in E, f a une dérivée extrème finie,
  ou deux Dini du même côté finis, alors f est ACG* sur E.
  Corollaire: si F continue + dérivable n.e. alors F ACG* sur E.

Conditions de Banach
- F a un Dini approx nul en x_0 => F a (D) en x_0
- F a (D) sur E => F a (N) sur E
- F a un Dini nul sur E => \mu(F(E))=0
- (S) = (N)+(T1)

- VBG => (T2). VB ou (continu+VBG*) ou (continu+(N)) => (T1)
- Si F continue, F (T1) <=> \mu({F(x), F non dérivable, même infinie, en x})=0
- Si F continue+(T2) alors
  * -\mu F[N]<=F(b)-F(a)<=\mu F[P] où N est l'ensemble des points où
      F a une dérivée négative ou nulle, et P celle où la dérivée est
      positive ou nulle.
  * Si |F'(x)|<=g(x) n.e. x où F'(x) existe (ou plus généralement si l'ens
    E où ce n'est pas le cas vérifie \mu F(E)=0), avec g intégrable au sens
    de Denjoy, alors F est VBG* et F(b)-F(a) <= \int_a^b F'(x).
    Si g est L1, F est VB.
- Si F continue, alors
  * F ACG* <=> F a (N) et g(x)=F'(x) là où F dérivable, et 0 sinon est
    Denjoy intégrale
  * F ACG <=> F a (N) et g(x)=F'(x) là où F dérivable de dérivée >=0, et 0
    sinon est Lebesgue intégrale

Monotonie
=========

Quelques contre exemples
------------------------
(On positive derivatives and monotonicity, Casey, Holzsager)

- La fonction de Cantor (l'escalier du diable) est strictement croissante,
continue, de dérivée nulle presque partout.
Ca permet de construire des fonctions F continues, telles que F'(x)>0 a.e
et F(b) < F(a).
En fait, si F est continue, l'ensemble des x tels que F'(x)<=0 (ou n'existe
pas) est un borel. S'il est non dénombrable, il contient un parfait, et
avec l'ex de Cantor on voit que F n'est pas forcément croissante. Par
contre si F dénombrable, c'est ok.
- Pour tout epsilon, il existe une fonction C^infty strictement croissante,
  de dérivée nulle hors un ensemble de mesure epsilon. Si on suppose juste
  la différentiabilité, on a la même conclusion avec en plus l'ensemble des
  points ou F'(x)=0 est dense dans [a,b]

Intégrale de la jauge
---------------------
Résultats de croissance "élémentaires" venant de l'intégrale de la Jauge et
des partitions.
(Recovering a function from a dini derivative, de Hagood et Thomson)

On peut voir l'intégrale de Denjoy comme l'intégrale de la jauge
(Henstock–Kurzweil), en particulier définir des int^sup et int_inf comme
les sup (resp inf) des sommes de Riemann des partitions respectant les
jauges.

Theorem: On a, si F continue à gauche
- D^+ F >= g(x) pour tout x => F(b)-F(a) >= int_inf g(x)
- D_+ F <= g(x) pour tout x => F(b)-F(a) <= int_sup g(x)
Corollaire:
- F(b)-F(a) est compris entre int_inf et int_sup de D^+F.
- si D_+ F <= g <= D^+ F et que g est intégrale (au sens de Denjoy), alors
  F(b)-F(a)=int g(x) (et donc F est ACG*)

Rem: on peut remplacer la condition D^+F>=g(x) partout par a.e. si F a zéro
variation là où D^+F = -infty.

Dans l'autre sens:
si D_inf F >= g(x) pour tout x, alors F(b)-F(a) >= int_sup g(x)
Ca marche aussi pour D_+ F si on remplace l'intégrale de la jauge par
l'intégrale définie sur des partitions "orientées à droite".

En particulier, on a  int_inf D^+ F <= int_droite_inf D^+ F = F(b)-F(a) <=
int_sup D^+F. Une autre manière de retrouver F à partir de D^+ F et via
l'intégrale de Denjoy-Khintchin: si D^+ F existe partout, F est ACG et
D^+F=F'_ap a.e. donc F est l'intégrale de Khintchin de D^+F.

Mixer les dérivées
------------------

Toujours avec des partitions (orientées à droites) et le lemme de Cousin,
on peut mixer les dérivées.

Ex: (an extension of two basic results in real
analysis dorin ervin dutkay, constantin p. niculescu, and florin popovici)

Si F et phi sont C^0, et que [a,b]=A \cup B \cup C avec
- F, phi zéro var sur A
- ||F'_droite || <= D^+ phi sur B
- ||F'_gauche || <= D_- phi sur C
Alors ||F(b)-F(a)|| <= phi(b)-phi(a)

Si F C^0 et f intégrale au sens de Denjoy, avec
- F zéro var sur A et f=0 sur A (où mu(A)=0)
- F'_droite = f sur B, F'_gauche = f sur C
Alors F(b)-F(a) = \int f(x)

Croissance
----------
(S'il n'y a pas de référence, c'est dans le Bruckner)

Théorème naif:
- F est différentiable
- F'>=0,
Alors F est croissante

Th standard de Lebesgue:
- F est AC
- F'>=0 a.e
=> F croissante
(En fait s'étend à F ACG*)

Goldowski and Tonelli:
- F est continue
- F' existe (finie ou infinie) excepté dans un ens dénombrable,
- F'>=0 a.e
Alors F est croissante.

Tolstoff
- F est approx continue
- F'_ap existe (finie ou infinie) excepté dans un ens dénombrable,
- F'_ap >=0 a.e
Alors F est croissante.

Dans le même ordre d'idée (Goldowski/Tonelli vs Lebesgue), on a (Khintchin):
- F est ACG
- F'_ap >=0 a.e
Alors F est croissante.

On peut même généraliser l'intégrale de Denjoy en une intégrale
approximative grâce au théorème de Kubota:
- F est [ACG] et approx continue
- F'_ap >=0 a.e
Alors F est croissante.
Gordon généralise ça à F VBG+approx continue+(N)
(cf Kubota: integrals of Lusin type)

Rem: [ACG]  signifie AC sur un recouvrement dénombrable de fermés, mais on
n'impose pas la condition f continue. ACG signifie AC sur un recouvrement
dénombrable d'ensembles pas forcément fermés, et suivant les auteurs f
continue ou non...
D'après Saks, VBG+(N)+continue => ACG
par contre [VBG]+(N)+approx continue ne donne pas [ACG], cf
ON THE APPROXIMATELY CONTINUOUS INTEGRALS OF BURKILL AND KUBOTA - D. N. Sarkhel
qui montre que [VBG]+(N) => (PAC).

Zahorski:
- F est Darboux
- F' existe (finie ou infinie) hors un ensemble dénombrable,
- F'>=0 a.e
Alors F est croissante.

Théorème général de Bruckner:
----------------------------
Si F est Darboux Baire 1 VBG, il existe une union d'intervalles I_n dont
l'union est dense et tels que F est Continue VB sur chaque I_n
Application: si une propriété (*) est telle qu'une fonction continue BV ayant
(*) est croissante, et qu'une fonction Darboux Baire 1 ayant (*) est VBG,
alors toute fonction Darboux Baire 1 ayant (*) est croissante.

Appliqué à Tolstoff:
- Si F est Darboux Baire 1 (ex approx continue)
- F'_ap existe (finie ou infinie) excepté dans un ens dénombrable,
- F'_ap >=0 a.e
Alors F est croissante (et continue car elle est Darboux).
(Ceci généralise aussi Zahorski, car les conditions impliquent que F est
Baire1)

On a la même chose si on remplace la dérivée approximative par la dérivée
qualitative, prépondérante, sélective, dérivée à droite.

Autre exemple:
- si F est Darboux Baire 1 VBG
- F est croissante dans un voisinage de x pour tout x point de continuité
  et de variation bornée locale
Alors F est croissante

Dérivée extrémale approximative
-------------------------------
- Si F est mesurable
- F'_inf,ap >=0 a.e.
- F'_inf,ap > -infty pour tout x
Alors F est croissante

Dini
----
On suppose que F est continue, ou simplement lim sup à gauche <= F(x) <= lim inf à droite (#).
Soit E l'ens des x où D^+F(x)<=0. Si F(E) est d'intérieur vide, alors F est
croissante.

Application:
- Si F satisfait (#),
- D^+F>=0 a.e
- D^+F >-\infty en dehors d'un ensemble dénombrable,
Alors f est croissante
(Comme dans la plupart du temps, on peut remplacer la condition D^+F> -infiny
par f est de variation nulle là où D^+ F <0.).

Remarques:
- par le th de Bruckner, comme les fonctions continues satisfont (#), on
  peut remplacer F satisfait (#) par F Darboux Baire 1 VBG.
- Si on remplace D^+ F >-infty en dehors d'un ensemble dénombrable par D^+
  F est Baire 1 (+ F satisfait #, et D^+F >=0 a.e), alors F est croissante.
  Mais en général, même pour F continue, D^+F est seulement Baire 2.

Dans le même ordre d'idée:
Kubota: on the approximately continuous denjoy integral
- Si F est approx continue et [ACG]
- D^+F>=0 a.e
Alors F est croissante.

O'Malley:
cf Kubota, Integrals of Lusin type, Th 8.5
- lim sup approx à gauche <= F(x) <= lim supp approx à droite + F Baire 1.
- Si E = l'ens des x où D^+_ap F(x)<=0, F(E) est d'intérieur vide.
Alors F est croissante.

On en déduit (si je ne me trompe pas, vu qu'une fonction est de type (N) là
où 0>=D^+F>-infty):
- Si F est approx continue,
- D^+F_ap >=0 a.e
- D^+F_ap >-\infty en dehors d'un ensemble dénombrable
Alors f est croissante

Darboux
-------

Théorème de Lee: http://dml.cz/dmlcz/128181 (Lemma 6.2)
- Soit F une fonction Darboux qui satisfait (N).
- Si F'(x)>=0 pour presque tout point où F est différentiable
Alors F est croissante et AC

Vient du théorème 7.7 Chapitre IX de Saks:
- F continue + (N),
- g=F'(x) là où ça existe et 0 sinon, g intégrale au sens de Denjoy
Alors F est ACG*. Si de plus g est sommable (au sens de Lebesgue), alors F
est AC. (Apparemment ça s'étend au cas Darboux).
Et donc si la dérivée est a.e >=0 là où F est différentiale, la dérivée est
intégrale, donc F est AC, donc F est croissante par le th de Lebesgue.

Convexité
---------

On note F^11= lim [F(x+h)+F(x-h)-2F(x)]/h^2 (la dérivée seconde
symétrique), et F^11_inf la dérivée seconde symétrique inférieure.

- Si F est continue sur [a,b], et F^11_inf(x)>=0 à l'intérieur de [a,b],
  alors F est convexe.

Bruckner: si une propriété (*) est suffisamment forte pour impliquer qu'une
fonction continue BV ayant (*) soit convexe, alors c'est le cas aussi pour
les fonctions Darboux VBG* (note: une fonction VBG* n'a qu'un nombre
dénombrable de points de discontinuité donc est Baire 1)

On a
- Si F est Darboux VBG*
- F^11_inf(x) >= a.e
- F^11_inf > -infty partout
Alors F convexe

De même,
- Si F est Darboux VBG*
- F^11_sup(x) >= 0 partout
Alors F est convexe.


Quelques autres références
--------------------------

### Saks

http://matwbn.icm.edu.pl/ksiazki/mon/mon02/mon0209.pdf
(chapitre du livre la théorie de l'intégrale)

http://www.mathunion.org/ICM/ICM1928.2/Main/icm1928.2.0253.0254.ocr.pdf
(dérivée fort = dérivée approximative)
     On démontre que si une fonction F(x) admet en chaque point d'un inter-
valle (excepté au plus, une infinité dénombrable de points) un dérivé fort
fini, F(x) vérifie dans cet intervalle la condition (N) (2). Il s'en suit, en
vertu du théorème 3, le suivant
     T H é O R è M E 4. - Si une fonction continue F(x) admet en tout point d'un
intervalle (a, b) (excepté, au plus, un ensemble dénombrable de points) un
dérivé fort A(x) fini et intégrable au sens de MM. Denjoy-Khintchine,  on
                                   F(b)-F(a) =  \int_a,b A(x)dx,
ou l'intégrale est prise au même sens.
     Cette proposition est évidemment analogue au théorème connu qu'on obtient
en y remplaçant le terme « un dérivé fort » par « un dérivé médian quel-
conque, mais d'un côté fixe », et la notion de l'intégrale de MM. DENJOY-
KHINTCHINE par ceUe de MM. DENJOY-PERRON.

### Denjoy-Youg-Sak theorem

http://www.dm.unipi.it/~alberti/files/ricerca/2000-02/derivatives.pdf
    We note that the restriction of any measurable mapping f:RRn
    to the set of points at which it possesses a finite approximate derived
    number maps Lebesgue null sets to sets of zero linear measure. As a
    corollary we deduce an optimal version of Denjoy-Young-Saks's theorem
    for approximate derivatives valid up to exceptional sets of zero linear
    measure in the graph.

### General monoticity theorems

PATH DERIVATIVES:       A UNIFIED VIEW OF CERTAIN
            GENERALIZED DERIVATIVES
BY A. M. BRUCKNER1, R. J. O'MALLEY1 AND B. S. THOMSON2
http://www.ams.org/tran/1984-283.../S0002-9947-1984-0735410-1/

4.7 Theorem. Let E = {Ex: x E R] be a system of paths that is bilateral and
satisfies the intersection condition. Then, in order for a function F to be
nondecreasing on an interval [a, b], either of the following suffice:
(4.7.1) D_inf F(x) >= 0 a.e. and D_inf F > -oo everywhere in [a, b], or
(4.7.2) D_inf F = D^sup F n.e. and D_inf F(x) >= 0 a.e. in [a, b] with F in the
first class of Baire and satisfying the Darboux property.

Monotonicity property: F'_E exist and is >=0 a.e on [a,b].
6.6 Theorem. Let E = {Ex: x E R} be a system of paths and let F be a function.
If y of the following hold, then F has the monotonicity property relative to E:
(6.6.1) E is bilateral and satisfies the intersection condition, and F is
E-differentiable.
(6.6.2) E satisfies the intersection condition and F is Darboux and [ACG].
(6.6.3) F is bilateral and satisfies the intersection condition, and F is Darboux Baire 1 with F'_inf,E(x) = F'_sup,E(x) n.e.
(6.6.4) F is bilateral (or merely unilateral but from an invariable side), and F is continuous with finite E-derivates n.e.

   Proof.   For (6.6.1) the monotonicity property follows directly from Theorem
(4.7.1), and for (6.6.3) it follows from (4.7.2).
  For (6.6.4) we need only apply a classical monotonicity theorem for the Dini
derivatives of a continuous function (see, for example, [4, p. 189]).
  Finally, (6.6.2) follows from a monotonicity result of Ellis [12], since in
the presence of an intersection condition, a derivative FE(x) will only differ
from the derivative Fa'p(x) on the set where they both exist at a denumberable
number of points (this follows from Theorem 4.2).

MONOTONICITY THEOREMS B. S. THOMSON

Si D_inf f >= 0 a.e, D_inf f > -infty sauf sur un ensemble N, avec
- N vide
- ou N dénombrable + f continu en tout point de N
- ou N de mesure 0 et f ACG*
- ou \mu(f(N))=0 et f continue + VBG*
alors f est croissante.

Rem: Cf plus bas pour une idée de la preuve. L'idée est que si f ACG*, f a
(N), et f+\epsilon x aussi, fonc f+\epsilon x (N) est de mesure nulle. Si f
VBG* et que f(N) est de mesure nulle, f+\epsilon x (N) est aussi de mesure
nulle.

De même pour la dérivée approximative (avec N vide, qu'en est-il des autres
cas?)

Résumé
------

Résumés (th puissants -> cas particuliers plutôt que l'inverse comme plus
haut)

Plus on impose de régularité à F, moins on a besoin de conditions sur la
dérivée.

* Pour un système de dérivation bilatéral (ex dérivée, dérivée approx,
prépondérante, qualitative, séléctive...)
- D_inf F > -infty partout
- D_inf F >=0 a.e
=> F croissante

- F Darboux Baire 1
- D_inf F = D^sup F n.e. (ie F "dérivable" n.e.)
- D_inf F >=0 a.e
=> F croissante
(Ce dernier th marche aussi pour la dérivée à droite)

* Cas F approx continu:
- Il faut et suffit que  F({x/ D^+_ap x <= 0 } soit d'intérieur vide.
On en déduit:
- F approx continue
- D^+ ap F > -infty n.e OU F [ACG]
- D^+_ap F >= 0 a.e.
=> F croissante
Rem: [ACG] => dérivable approx a.e, donc la condition
D^+_ap F >=0 a.e se lit F'_ap >= 0 a.e

La démo est: si D^+_ap F >=0 a.e, alors G=F+\epsilon x F satisfait E={x/
D^+_ap x <=0} est de mesure nulle. Dans le premier cas, E est même
dénombrable, donc G(E) est de mesure nulle. Dans le second cas, G satisfait (N),donc G(E) est aussi de mesure nulle, donc d'intérieur nul.
ATTENTION: F continue + (N) n'implique pas forcément que G satisfait (N),
c'est là que VBG entre en jeu.

(En fait on peut prouver, cf Kubota integrals of Lusin type, $10:
- F upper closed monotone (ex: Darboux) et lower [ACG]
- D^sup F >=0 a.e
=> F croissante)

* Cas continu
- Si F continue, il faut et suffit que  F({x/ D^+ x <= 0 } soit d'intérieur
  vide. (On voit qu'avec plus de régularité, on a besoin de moins de
  condition, car D^+ >= D^+_ap)
On en déduit:
- F continue (ou Darboux Baire 1 VBG)
- D^+ F > -infty n.e OU F [ACG*]
- D^+ F >= 0 a.e.
=> F croissante
Rem: [ACG*] => dérivable a.e, donc la condition
D^+ F >=0 a.e se lit F' >= 0 a.e

* Condition (N)
- Soit F une fonction Darboux qui satisfait (N).
- Si F'(x)>=0 pour presque tout point où F est différentiable
=> F croissante + AC

forum
-----

From damien.robert__forum  Wed Jan 23 22:25:10 2013
Article: 2854 of ens.forum.sciences.maths.avancees
Path: eleves!not-for-mail
From: Dam's
Newsgroups: ens.forum.sciences.maths.avancees
Subject: Conditions de monotonie
Supersedes: <kdpkfm$jg$1@clipper.ens.fr>
Date: Wed, 23 Jan 2013 21:25:10 +0000 (UTC)
Organization: Le forum de l'ENS.
Lines: 528
Message-ID: <kdqtu4$9dd$1@clipper.ens.fr>
References: <dqj6fb$elb$1@clipper.ens.fr>
NNTP-Posting-Host: phare.normalesup.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Trace: clipper.ens.fr 1359018756 9645 129.199.129.80 (24 Jan 2013 09:12:36 GMT)
X-Complaints-To: forum@clipper.ens.fr
NNTP-Posting-Date: Thu, 24 Jan 2013 09:12:36 +0000 (UTC)
X-Newsreader: Flrn (0.9.20070704)
X-Start-date: Wed, 23 Jan 2013 20:35:21 +0100
X-supersedes: il faut que j'arrete de poster des trucs en vitesse, pleins de typos
Xref: eleves ens.forum.sciences.maths.avancees:2854

Dans ce message je vais exposer quelques résultats qui garantissent qu'une
fonction f:[a,b] -> R est croissante. Comme d'habitude en analyse, on tombe
sur un labyrinthe de petits théorèmes tous semblables :-)
Je serai assez laconique dans mon message (il n'y aura pas de preuve), si
je ne précise pas, les références de mon message sont dans le
Bruckner (Differentiations of Real Functions), qui contient *vraiment*
pleins de choses rigolotes.

L'idée est de partir du théorème naif:
- F est différentiable
- F'>=0,
Alors F est croissante. Par exemple parce qu'on sait que
[F(b)-F(a)]/[b-a]=F'(c) pour un c dans [a,b].

Ce théorème implique le théorème des accroissements finis (si |F'|<=phi',
alors |F(b)-F(a)|<=phi(b)-phi(a)) et l'unicité de la primitive (de
"Newton": il y a une unique fonction F à une constante près telle que
F'(x)=g(x) sur [a,b]). En effet, si F est de dérivée nulle partout, alors F
est croissante par le théorème précédent, mais -F est aussi croissante,
donc F est constante. En général j'énoncerai juste le théorème de monocité,
les théorèmes d'unicité de la primivitive et des accroissements finis qui
en découlent étant immédiat.

Un dernier point: si F est croissante et que F(x)=F(y), alors F est
constante sur [x,y] donc de dérivée nulle là-dessus. Autrement dit, si F'
ne s'annule pas sur un intervalle, F est strictement croissante. Une autre
formulation équivalente qui marche même si on ne suppose pas que F' existe
partout: si F est croissante et que l'ensemble des points où F'(x) != 0 ou
n'existe pas est dense, alors F est strictement croissante.

L'exemple de l'escalier du diable de Cantor (ou plutôt de son opposé), montre
que si on suppose juste
- F'>=0 a.e
n'implique pas F croissante.

Par contre, on sait par Lebesgue que si de plus F est AC, alors F est bien
croissante. En général, des théorèmes de monotonie vont permettre de définir
des intégrales en termes de primitives.

Par exemple l'intégrale de Denjoy pour les fonctions ACG*: on montre que si
F est ACG* de dérivée F'>=0 presque partout, alors F est croissante. Comme
les fonctions dérivables à peu près partout sont ACG*, ça permet d'étendre
à la fois la notion de primitive de Newton et d'intégrale de Lebesgue.
(Application: si f est dérivable à peu près partout, f est l'intégrale de
Denjoy de sa dérivée. Si f' est sommable, f est donc l'intégrale de Lebesgue de
sa dérivée. On retrouve le fait (bien connu?) qu'une fonction dérivable à peu
près partout de dérivée nulle presque partout est constante).

On va essayer d'étendre ça à des résultats encore plus généraux (bien sûr si au
final  on montre que f est croissante, alors on sait que f est dérivable
presque partout, et si on montre que f est constante elle est dérivable
partout, mais on veut obtenir ce genre de résultat sans savoir qu'on peut faire
ces hypothèses a priori).

Si on impose peu de régularité à f, on va devoir imposer pas mal de
condition sur la dérivée (par exemple la dérivée inférieure est >=0
partout) pour obtenir la croissance. Inversement si on impose de la
régularité à f, on va pouvoir obtenir des conditions plus faibles sur la
dérivée (du genre la dérivée droite supérieure est >=0 a.e.)

 Définitions
 ===========

Je réponds au message de David car il contient la définition des fonctions
ACG. VBG c'est comme ACG par rapport à AC mais pour variation bornés (VB).
AC* c'est comme AC sauf qu'on regarde l'oscillation de F sur [a_i,b_i]
plutôt que |F(b_i)-F(a_i)|. Ca conduit à définir ACG*. Dans ACG et ACG*, on
ajoute implicitement que F est continue. Ces notions se définissent pour
toute sous partie de [a,b], pas seulement des sous-intervalles.

On dit que F est à variation nulle sur E si pour tout epsilon, on peut
trouver une jauge telle que toute partition de E respectant la jauge donne
une variation inférieure à epsilon.

Enfin, on dit qu'une propriété est vraie à peu près partout (nearly everywhere)
si elle est vraie en dehors d'un ensemble dénombrable.

==============================================================================

Première partie: quelques propriétés des fonctions VBG et des dérivées approximatives.

 Zéro Variation
 ==============

(dans tout ce qui suit, on considère des fonctions sur [a,b] à valeur dans R.

Si F'=0 sur E, F a zéro variation sur E.
F a zéro variation sur E => F'(x) = 0 a.e. sur E, et de plus mu(F(E))=0
(Attention: f continue => zéro variation si E dénombrable, mais pas
forcément si E de mesure nulle. Il faut être lambda-AC pour ça, par ex
ACG*)

Si F différentiable et mu(F(E))=0, alors F'(x)=0 a.e. sur E.

ex: -F(x)=x a zéro variation sur E ssi E de mesure nulle
    - on dit que F est lambda-AC si F a
      zéro variation sur les ensembles E de mesures nulles
    - On dit que F a la condition (N) de Luzin si F(E) à mesure zéro
      lorsque E a mesure 0. lambda-AC => (N) par ce qui précède.

Th: AC => (i) unif cont (ii) BV (iii) lambda-AC (iv) (N)
Réciproquement, (i)+(ii)+[ (iii) ou (iv) ] => AC.

AC => BV, AC* => BV*, ACG => BVG, ACG* => BVG* (trivial)
ACG* <=> unif continue + lambda-AC

 VBG et dérivée approximative
 ============================

f mesurable <=> f approx continue a.e.
f VBG + mesurable => f approx dérivable a.e.
Si de plus f ACG, f est l'intégrale (de Khintchin) de sa dérivée approximative
- A rapprocher du th de Lebesgue: f VB => f dérivable a.e (et f(E) est de
  mesure nulle si E est l'ensemble des points où f n'est pas dérivable).
  Si f AC c'est l'intégrale de sa dérivée (qui est sommable).
- Et pour l'intégrale de Denjoy, on a la même chose pour f ACG*

Réciproquement, si f continue + approx dér à peu près partout, f est ACG
(et est l'intégrale de Khintchin de sa dérivée approx).
Si f est continue et dérivable à peu près partout, f est ACG*

En fait on a même, si F continue et D^+F existe partout, alors F est ACG et
F'_ap = D^+ F a.e (ça doit même marcher si F est de variation nulle là où
D^+F n'existe pas, car là F'=0 a.e)
Plus généralement:
- si D^sup f > -infty ou D_inf f < +infty pour à peu près tout point de X, f
est VBG sur X.
- si à la fois D^sup f et D_inf f sont finis sur tout point de X, f est ACG.
(le dernier énoncé est moins fort que celui avec D^+ F fini partout, mais
en fait les deux énoncés sont vrais aussi avec des dérivées approximatives
sup et inf, cf monotonicity theorem de Thomson, ou Bruckner Th 1.2 Chapitre X)

 Propriété des dérivées approximatives
 =====================================

On suppose que F est approx dérivable sur [a,b]
- F'_ap est Baire 1 Darboux.
- Si F'_ap(x)<=G'(x) pour G dérivable, ou F croissante, alors en fait F est
  dérivable.
  En général, il existe un ouvert dense tel que F est dérivable.
Le théorème des valeurs intérmédiaires marche pour les dérivées
approximatives. (ie F(b)-F(a)/b-a = F'_ap(c))

============================================================================

Deuxième partie: les dérivées de Dini

Les dérivées de Dini sont les dérivées supérieures droites (D^+ F), resp
supérieures gauches (D^- F), resp dérivées inférieures doite (D_+ F), resp
inférieures gauches (D_- F)

 Propriétés faciles
 ------------------

- D^+ F >= D_- F et D^- F >= D_+ F à peu près partout.
Application: l'ensemble des x tels que F est dérivable à gauche et à
droite, de dérivées différentes, est dénombrable.
- {x/ D^+ F =-infty} est de mesure nulle

 Denjoy-Young-Saks
 -----------------

pour toute fonction (pas forcément mesurable!), on a presque partout un des
cas suivants:
- Les 4 dérivées de Dini coincident, F est donc dérivable (F est de mesure
  angulaire 0 en x)
- D^+ F(x)= +infty, D_-F(x)= -infty, D_+ F(x)=D^-F(x)
  (F est de mesure angulaire 180° dans le sens trigo)
- D^- F(x)= +infty, D_+F(x)= -infty, D_- F(x)=D^+ F(x)
  (F est de mesure angulaire 180° dans le sens antitrigo)
- D^+ F(x)=D^- F(x)= +infty, D_+ F(x) = D_-F(x)= -infty,
  (F est de mesure angulair 360°)

Le même théorème est vrai si on remplace dérivée par dérivée approximative
et Dini par Dini approximatif. Si de plus f est mesurable, dans ce cas on a
presque partout soit (i) (le cas 0° approximatif) ou (iv) (le cas 360°
approximatif)

 Dini et continuité
 ------------------

Si F est continue, les bornes de D^+ F (ou de tout autre dérivée de Dini)
sont égales aux bornes des quotiens (F(x)-F(y))/(x-y) pour x,y dans [a,b]

Application: si F est continue et que D^+ F est continue en x_0, alors les
dérivées de Dini sont égales en x_0 donc F est dérivable en x_0

Soit F est continue sur R, alpha \in R. Si {x / D^+ F(x) >= alpha} est
dense, et qu'il existe un point x_0 avec D^+ F(x_0)<alpha, alors l'ensemble
{x / D^+ F(x)=alpha} est de cardinal C.
Avec alpha=0 ça donne une condition de monotonie.

===========================================================================

Troisième partie: conditions de monotonie venant de conditions type intégrale
de Riemann.

Si une fonction F dérivable satisfait F'(x) >= 0 partout, on sait que pour tout
epsilon, sur un intervalle autour de x on a F(t)-F(s)/(t-s)>-epsilon. En
considérant des intervalles avec cette propriété, on a ce qu'on appelle un
"cover", et le Lemme de Cousin dit qu'on peut en extraire une partition de
[a,b] (considérer le sup des c tels qu'on peut partionner [a,c]). En faisant la
somme des F(a_i)-F(b_i) d'une telle partition, puis en faisant tendre epsilon
vers 0, on retrouve que F(b)>=F(a).

Plus généralement, si D^+F(x)>=0, alors il existe un t arbitrairement proche de
x tel que [F(t)-F(x)]/(t-x) > -epsilon. Si de plus F est continue à gauche, on
peut étendre ça à un s<x (qui dépend de t et x). On a ce qu'on appelle un right
cover, et en extrayant une partition on montre ainsi que F est croissante
si D^+F>=0 partout.

En fait avec ce type de technique, on va retrouver des conditions du type si
D^+F >= g avec g intégrale au sens de Riemann, alors F(b)-F(a) >= l'intégrale
de g, et plus généralement le même genre de chose appliqué à l'intégrale de
Henstock–Kurzweil. (Il s'agit d'une intégrale qui donne la même intégrale que
celle de Denjoy (Perron), mais définie comme l'intégrale de Riemann, en faisant
des sommes de Riemann supérieure et inférieure non plus sur des partitions de
même tailles, mais données par une jauge. Voir la page de wikipedia à ce
sujet qui explique ça très bien. On voit bien qu'avec ce genre de
définition par ce que j'ai expliqué avant on va obtenir des résultats de
monotonicité).

Par exemple: Recovering a function from a dini derivative, de Hagood et
Thomson explique très bien ce procédé. On pourra aussi consulter "An
extension of two basic results in real analysis, Dorin Ervin Dutkay,
Constantin p. Niculescu, and Florin popovici", "A note on the
Denjoy-Bourbaki theorem" des mêmes auteurs, ou encore "On positive
derivatives and monotonicity", Casey, Holzsager qui appliquent ce genre de
méthode. (Par exemple il y a une preuve du théorème de Goldowski/Tonelli
mentionné plus tard dans ce dernier article).

L'avantage de l'intégrale de Henstock-Kurzweil, c'est que ça donne un moyen
"effectif" (en terme de somme de Riemann) de calculer une primitive "de
Denjoy". Avec les théorèmes plus généraux que je donnerai ensuite, ça devient
moins constructif.

 Intégrale de la jauge
 =====================
(Recovering a function from a dini derivative, de Hagood et Thomson)

On peut voir l'intégrale de Denjoy comme l'intégrale de la jauge
(Henstock–Kurzweil), en particulier définir des int^sup et int_inf comme
les sup (resp inf) des sommes de Riemann des partitions respectant les
jauges.

Theorem: On a, si F continue à gauche
- D^+ F >= g(x) pour tout x => F(b)-F(a) >= int_inf g(x)
- D_+ F <= g(x) pour tout x => F(b)-F(a) <= int_sup g(x)
Corollaire:
- F(b)-F(a) est compris entre int_inf et int_sup de D^+F.
- si D_+ F <= g <= D^+ F et que g est intégrale (au sens de Denjoy), alors
  F(b)-F(a)=int g(x) (et donc F est ACG*)

Rem: on peut remplacer la condition D^+F>=g(x) partout par a.e. si F a zéro
variation là où D^+F = -infty.

Dans l'autre sens:
si D_inf F >= g(x) pour tout x, alors F(b)-F(a) >= int_sup g(x)
Ca marche aussi pour D_+ F si on remplace l'intégrale de la jauge par
l'intégrale définie sur des partitions "orientées à droite" (right cover).

En particulier, on a  int_inf D^+ F <= int_droite_inf D^+ F = F(b)-F(a) <=
int_sup D^+F. Une autre manière de retrouver F à partir de D^+ F et via
l'intégrale de Denjoy-Khintchin: si D^+ F existe partout, F est ACG et
D^+F=F'_ap a.e. donc F est l'intégrale de Khintchin de D^+F.

 Mixer les dérivées
 ==================

Toujours avec des partitions (orientées à droites) et le lemme de Cousin,
on peut mixer les dérivées.

Ex: (an extension of two basic results in real
analysis, dorin ervin dutkay, constantin p. niculescu, and florin popovici)

Si F et phi sont C^0, et que [a,b]=A \cup B \cup C avec
- F, phi zéro var sur A
- ||F'_droite || <= D^+ phi sur B
- ||F'_gauche || <= D_- phi sur C
Alors ||F(b)-F(a)|| <= phi(b)-phi(a)

Si F C^0 et f intégrale au sens de Denjoy, avec
- F zéro var sur A et f=0 sur A (où mu(A)=0)
- F'_droite = f sur B, F'_gauche = f sur C
Alors F(b)-F(a) = \int f(x)

==================================================================

Quatrième partie

Pour l'instant on a supposé pas mal de régularité dans nos fonctions. Avant de
faire la liste de théorèmes plus généraux qu'on obtient, voici quelques
fonctions pathologiques.

 Quelques contre exemples
 ========================
(On positive derivatives and monotonicity, Casey, Holzsager)

- La fonction de Cantor (l'escalier du diable) est strictement croissante,
continue, de dérivée nulle presque partout.
Ca permet de construire des fonctions F continues, telles que F'(x)>0 a.e
et F(b) < F(a).
En fait, si F est continue, l'ensemble des x tels que F'(x)<=0 (ou n'existe
pas) est un borel. S'il est non dénombrable, il contient un parfait, et
avec l'ex de Cantor on voit que F n'est pas forcément croissante. Par
contre si F dénombrable, c'est ok.
- Pour tout epsilon, il existe une fonction C^infty strictement croissante,
  de dérivée nulle hors un ensemble de mesure epsilon. Si on suppose juste
  la différentiabilité, on a la même conclusion avec en plus l'ensemble des
  points ou F'(x)=0 est dense dans [a,b]

Juste pour le fun, des exemples de comportements pathologiques (cf le Bruckner):
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
  nécessaire à l'existence de g dérivable).

=========================================================================

Cinquième partie: théorèmes de monotonie.
(S'il n'y a pas de référence, c'est dans le Bruckner)

Théorème naif:
- F est différentiable
- F'>=0,
Alors F est croissante

Th standard de Lebesgue:
- F est AC
- F'>=0 a.e
=> F croissante
(En fait s'étend à F ACG*)

Goldowski and Tonelli:
- F est continue
- F' existe (finie ou infinie) excepté dans un ens dénombrable,
- F'>=0 a.e
Alors F est croissante.

Tolstoff
- F est approx continue
- F'_ap existe (finie ou infinie) excepté dans un ens dénombrable,
- F'_ap >=0 a.e
Alors F est croissante.

Dans le même ordre d'idée (Goldowski/Tonelli vs Lebesgue), on a (Khintchin):
- F est ACG
- F'_ap >=0 a.e
Alors F est croissante.
On peut même généraliser l'intégrale de Denjoy en une intégrale
approximative (ie pour une fonction approximativement continue et (ACG), où
(ACG) signifie AC sur un recouvrement dénombrable de fermés, mais on
n'impose plus la condition f continue) grâce au théorème de Kubota:
- F est (ACG) et approx continue
- F'_ap >=0 a.e
Alors F est croissante.
Gordon généralise ça à F BVG+approx continue+(N)
(cf Kubota: integrals of Lusin type)

Zahorski:
- F est Darboux
- F' existe (finie ou infinie) hors un ensemble dénombrable,
- F'>=0 a.e
Alors F est croissante.

Zahorski impose moins de régularité à F que Tolstoff, mais demande des
conditions plus fortes (F' plutôt que F'_ap)
Mais on a un théorème très général de Bruckner:
Si F est Darboux Baire 1 VBG, il existe une union d'intervalles I_n dont
l'union est dense et tels que F est Continue VB sur chaque I_n

Application: si une propriété (*) est telle qu'une fonction continue BV ayant
(*) est croissante, et qu'une fonction Darboux Baire 1 ayant (*) est VBG,
alors toute fonction Darboux Baire 1 ayant (*) est croissante.

Appliqué à Tolstoff:
- Si F est Darboux Baire 1 (ex approx continue)
- F'_ap existe (finie ou infinie) excepté dans un ens dénombrable,
- F'_ap >=0 a.e
Alors F est croissante (et continue car elle est Darboux).
(Ceci généralise aussi Zahorski, car les conditions impliquent que F est
Baire1)

On a le même théorème si on remplace la dérivée approximative par la dérivée
qualitative, prépondérante, sélective, ou la dérivée à droite.

Autre exemple d'application:
- si F est Darboux Baire 1 VBG
- F est croissante dans un voisinage de x pour tout x point de continuité
  et de variation bornée locale
Alors F est croissante

 Dérivée extrémale approximative
 -------------------------------
- Si F est mesurable
- F'_inf,ap >=0 a.e.
- F'_inf,ap > -infty pour tout x
Alors F est croissante

 Dini
 ----
On suppose que F est continue, ou simplement lim sup à gauche <= F(x) <= lim inf à droite (#).
Soit E l'ens des x où D^+F(x)<=0. Si F(E) est d'intérieur vide, alors F est
croissante.

Application:
- Si F satisfait (#),
- D^+F>=0 a.e
- D^+F >-\infty en dehors d'un ensemble dénombrable,
Alors f est croissante
(Comme pour la plupart des cas, on peut remplacer la condition D^+F> -infiny à peu près partout par f est de variation nulle là où D^+ F <0.).

Remarques:
- par le th de Bruckner, comme les fonctions continues satisfont (#), on
  peut remplacer F satisfait (#) par F Darboux Baire 1 VBG.
- Si on remplace D^+ F >-infty en dehors d'un ensemble dénombrable par D^+
  F est Baire 1 (+ F satisfait #, et D^+F >=0 a.e), alors F est croissante.
  Mais en général, même pour F continue, D^+F est seulement Baire 2.

Dans le même ordre d'idée:
Kubota: on the approximately continuous denjoy integral
- Si F est approx continue et (ACG)
- D^+F>=0 a.e
Alors F est croissante.

O'Malley:
- lim sup approx à gauche <= F(x) <= lim supp approx à droite + F Baire 1.
- Si E = l'ens des x où D^+_ap F(x)<=0, F(E) est d'intérieur vide.
Alors F est croissante.

On en déduit (si je ne me trompe pas, vu qu'une fonction est de type (N) là
où 0>=D^+F>-infty):
- Si F est approx continue,
- D^+F_ap >=0 a.e
- D^+F_ap >-\infty en dehors d'un ensemble dénombrable
Alors f est croissante

 Darboux
 -------

Théorème de Lee: http://dml.cz/dmlcz/128181 (Lemma 6.2)
- Soit F une fonction Darboux qui satisfait (N).
- Si F'(x)>=0 pour presque tout point où F est différentiable
Alors F est croissante et AC

 Convexité
 ---------

Tant que j'y suis, des théorèmes similaires qui imposent la convexité d'une
fonction.

On note F^11= lim [F(x+h)+F(x-h)-2F(x)]/h^2 (la dérivée seconde
symétrique), et F^11_inf la dérivée seconde symétrique inférieure.

- Si F est continue sur [a,b], et F^11_inf(x)>=0 à l'intérieur de [a,b],
  alors F est convexe.

Bruckner: si une propriété (*) est suffisamment forte pour impliquer qu'une
fonction continue BV ayant (*) soit convexe, alors c'est le cas aussi pour
les fonctions Darboux VBG* (note: une fonction VBG* n'a qu'un nombre
dénombrable de points de discontinuité donc est Baire 1)

On a
- Si F est Darboux VBG*
- F^11_inf(x) >= a.e
- F^11_inf > -infty partout
Alors F convexe

De même,
- Si F est Darboux VBG*
- F^11_sup(x) >= 0 partout
Alors F est convexe.


=====================================================================

Références:

Outre le Bruckner que j'ai mentionné, il y a le livre standard de Saks (théorie de l'intégrale), dont une version traduite en anglais se retrouve sur le web:
http://matwbn.icm.edu.pl/ksiazki/mon/mon02/mon0209.pdf

Pour ceux qui ont la flemme de lire tout le Bruckner, il y a un papier
de A. M. Bruckner; J. L. Leonard (Derivatives) qui contient un résumé de ce qu'on peut trouver sur le livre (grosso modo)
http://classicalrealanalysis.info/documents/andy1966.pdf

J'ai déjà mentionné aussi
Recovering a function from a dini derivative, de Hagood et Thomson sur les
covering et les jauge.

Thomson a aussi fait un bouquin Theory of the Integral très lisible qui est
disponible gratuitement sur son site.
http://classicalrealanalysis.info/Theory-of-the-Integral.php

Kubota, "integral of Lusin" type explique comment les théorèmes garantissant
l'unicité d'une "primitive" permet de définir pleins d'intégrales.

Dans l'autre sens, des thèorèmes qui s'appliquent à plein de notions généralisées de dérivées:

 General monoticity theorems
 ==========================

PATH DERIVATIVES:       A UNIFIED VIEW OF CERTAIN
            GENERALIZEDDERIVATIVES
BY A. M. BRUCKNER1, R. J. O'MALLEY1 AND B. S. THOMSON2
http://www.ams.org/tran/1984-283.../S0002-9947-1984-0735410-1/

4.7 Theorem. Let E = {Ex: x E R] be a system of paths that is bilateral and
satisfies the intersection condition. Then, in order for a function F to be
nondecreasing on an interval [a, b], either of the following suffice:
(4.7.1) D_inf F(x) >= 0 a.e. and D_inf F > -oo everywhere in [a, b], or
(4.7.2) D_inf F = D^sup F n.e. and D_inf F(x) >= 0 a.e. in [a, b] with F in the
first class of Baire and satisfying the Darboux property.

MONOTONICITY THEOREMS B. S. THOMSON

Si D_inf f >= 0 a.e, D_inf f > -infty sauf sur un ensemble N, avec
- N vide
- ou N dénombrable + f continu en tout point de N
- ou N de mesure 0 et f ACG*
- ou \mu(f(N))=0 et f continue + VBG*
alors f est croissante.
De même pour la dérivée approximative (avec N vide, qu'en est-il des autres
cas?)
