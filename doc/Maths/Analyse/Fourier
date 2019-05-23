vim: ft=markdownlight fdm=expr

Convergence
===========

Séries de Fourier des fonctions continues sur le cercle unité T (le disque
unité est noté D)

Unicité
-------

Si f est une fonction périodique L1 dont les coefficients de Fourier sont nuls, alors f=0. [Zygmund (I.6.2) ; Katznelson (I.2.7).] Plus généralement (par dualité), ceci vaut pour une mesure borélienne signée finie (coefficients de Fourier-Stieltjes) [Katznelson (I.7.1)] ou une distribution.

- Si \sum a_n e^(inθ) converge simplement vers f L_1, alors cette série est
  la série de Fourier de f [Zygmund (IX.3.1.ii), forum.maths:20425]

Modes de convergence
--------------------
http://en.wikipedia.org/wiki/Convergence_of_Fourier_series

### Convergence simple

- Si f est L_p, p>1, convergence pp et convergence en L_p si p<\infty (il
  existe f dans L_1 qui ne converge nulle part, et il existe des f L1 ne
  convergent pas en norme L1, même pas faiblement).

- En particulier, f continue => converge pp Cependant: il existe un Gdelta
  dense dans C^0 tel que pour tout f de G la série de Fourier de f diverge
  en les points d'un ensemble dense.

- Si f est bounded variation, convergence partout (et convergence uniforme
  locale aux points de continuités)
- Si f bounded variation+continue, convergence uniforme (ex: f holderienne,
  ou abs continue)

- Convergence absolue: c'est une algèbre (de Wiener), et si f est dans
  l'algèbre, et que 1/f est définie, alors 1/f est dans l'algèbre de
  Wiener. (De plus on a bien sûr convergence uniforme, donc f est continue)

  Ex: f holderienne alpha>1/2, ou holderienne et bounded variation.

### Série de Fourier de la fonction limite

Si une série trigonométrique converge en tout point du cercle vers une
limite qui définit une fonction L1, alors la série est bien la série de
Fourier de la fonction ; et en particulier, si une série trigonométrique
converge en tout point vers 0 alors elle est identiquement nulle (Du
Bois-Reymond). [Zygmund, (IX.3.1.ii), forum.maths:20425] Mais ce dernier
énoncé n'est pas vrai si on remplace "en tout point" par "presque partout".
[Zygmund, (IX.6.14).]

(En revanche, pour des séries trigonométriques réelle, une fonction réelle,
même continue et bornée a une infinité de séries trigo qui convergent vers
elle.)

### Convergence au sens de Césaro:

- Sn f(t) -> f(t) si f continue en t
- Si f a une limite à gauche et à droite en t,
  Sn f(t) -> demi-somme limite à gauche et à droite (Fejér)
- Convergence uniforme pour f continue
- Convergence en norme L_1 et pp pour f L_1

### Noyau de poissson

- L'intégrale de Poisson est une isométrie de norme 1 de L_p sur h_p
  (1<p<\infty) et des mesures sur h_1. Si f L_\infiny, pas de convergence
  en norme infini sauf si f continue. Par contre convergence préfaible (par
  rapport au dual L_1 de L_infinity)

  [Explicitement, si p>1, f \in h_p tend non tangentiellement (et donc
  radialement) pp vers F dans L_p (de même norme), et f est le noyau de
  Poisson de F. f \in H_p ssi F \in L_p et les coeffs de Fourier négatifs
  sont nuls.]

  Le noyau de poisson d'une fonction continue sur T (dont
  les coeffs de Fourier negatifs sont nuls) est continue sur le disque
  fermé (et holomorphe sur D).

- Si f est dans h_p (p>=1), convergence radiale (et même non tangentielle)
  pp par ce qui précède (Césaro => conv non tangentielle). En particulier,
  si f est le noyau de poisson d'une fonction L_1, alors f est dans h^1 et
  converge radialement pp et même non tangentiellement pp.

  En fait on a plus fort: si f est dans h_1 par rapport à un arc θ_0
  θ_1, (ie on se restreint à la limite quand r->1 de l'intégrale de f
  le long de l'arc), alors f=f0+f1, avec f0 le noyau de poisson d'une
  fonction L_1, et f1 qui tend uniformément vers 0 dans tout intervalle
  (θ0+eps, θ1-eps). En particulier f a une convergence non
  tangentielle pp dans l'arc.

  Preuve si $f \in H_p$ (p>=1), ie si f holomorphe:
    si f est dans H_p (p>=1), f=BF ou B est le produit de Blockshe des zéros,
    F ne s'annule nulle part. On a |f|=|F| pour la norme H_p. De plus B
    converge radialement partout vers 1, et B est dans H_infini.
    Donc si f est holomorphe dans H_p avec p>0, alors f converge non
    tangentiellement pp. (Car F^p/2 ou F est la fonction précédente est
    alors dans H^2 donc dans h^2 et pour la fonction de bord L^2 on sait
    que la série de Fourier converge simplement pp, donc non
    tangentiellement pp).

### Magnitude

- Si φ est une distribution sur le cercle, alors les coefficients de Fourier de φ sont à croissance au plus polynomiale
- Si μ est une mesure borélienne signée finie sur le cercle, ses coefficients de Fourier-Stieltjes sont bornés
- Si f est une fonction périodique L1, alors ses coefficients de Fourier tendent vers 0 (Riemann-Lebesgue)
- Si f est une fonction périodique L^p pour 1≤p≤2 et q l'exposant conjugué à p, alors les coefficients de Fourier de f sont ℓ^q
- Si f est de variation bornée, \hat{f}(n)=O(1/n)
- Si f est absolument continue \hat{f}(n)=o(1/n)
- Si f est holderienne alpha, \hat{f}(n)=O(1/n^\alpha)
- Si f est C^p, \hat{f}(n)=o(1/n^p)

- Si f est une fonction périodique höldérienne d'exposant 0<α≤1, alors les
  sommes partielles Sn[f] de sa série de Fourier convergent uniformément
  vers f avec ‖f−Sn[f]‖∞ = O(n^{−α}·log(n)) [Zygmund, (II.10.8)] ; et les
  moyennes de Cesàro MSn[f] des Sn[f] vérifient ‖f−MSn[f]‖∞ = O(n^{−α})
  [Zygmund, (III.3.15)].
- Si f est une fonction périodique höldérienne d'exposant 0<α≤1, alors les
  coefficients de Fourier de f sont ℓ^p pour tout p>1/(α+½). [Zygmund,
  (VI.3.10).] En particulier, si f est une fonction périodique höldérienne
  d'exposant α>½ alors la série de Fourier de f converge absolument
  (Bernstein). [Zygmund, (VI.3.1) ; Katznelson (I.6.3).] Ceci n'est pas
  vrai en général pour α=½.
- Si f est une fonction périodique höldérienne d'exposant 0<α≤1 et à
  variations bornées, alors les coefficients de Fourier de f sont ℓp pour
  tout p>1/(½α+1). [Zygmund, (VI.3.13).] En particulier, si f est une
  fonction périodique höldérienne d'exposant α>0 et à variations bornées
  alors la série de Fourier de f converge absolument (Zygmund). [Zygmund,
  (VI.3.6) ; Katznelson (I.6.4).]

### Remarques divers

- Si les a_n sont monotones décroissantes, on a des résultats sur la
  convergence simple d'une série trigo.
  Ex: $na_n$ tend vers 0 implique conv uniforme sur tout intervalle qui ne
  contient pas 0

- si la série de Fourier converge en tout point, que peut-on dire de la
  fonction résultante? A priori rien, elle n'est meme pas bornée (par
  exemple si on demande juste la convergence radiale, il suffit de prendre
  le noyau de poisson d'une fonction non bornée).
  
- si f est continue sur le disque fermé, holomorphe sur le disque ouvert,
  est-ce que la série de Fourier converge simplement? (à priori non hors
  hypothèse Taubérienne). La série va converger au sens de Césaro, donc par
  radialité, mais pas forcément simplement.

### Résumé

- Si f L^1, convergence en Césaro L^1 et pp et donc convergence non tangentielle pp
- Si f L^p (p>1) convergence en L^p (p < \infinity) et convergence pp
- Si f est une fonction périodique admettant en x une limite à gauche et
  une limite à droite, alors les moyennes de Cesàro des sommes partielles
  de sa série de Fourier convergent en x vers la demi-somme entre la limite
  à gauche et la limite à droite de f en x (Fejér). 
- Si f continue, alors convergence uniforme en Césaro
- Si f est à variation bornée, alors convergence partout (et convergence uniforme locale aux points de continuités)
- Si f holderienne alpha>1/2, ou holderienne et bounded variation, alors convergence absolue


Fonctions holomorphes et méromorphes sur le disque unité
========================================================

- Convergence non contrôlée: pour tout g continue, et tout ensemble maigre E,
  il existe f holomorphe sur D telle que f(t)-g(t) tend vers 0 radialement
  pour θ dans E (Zygmund).

  Application: il existe une fonction holomorphe non nulle qui converge
  radialement vers 0 pp (prendre g=0 et E maigre de mesure pleine).

- Principe de Lindelof: si f holomorphe et bornée sur D, convergence
  radiale implique convergence non tangentielle.
  Cf http://www.ctr.maths.lu.se/media/literature/hardy-spaces-lecture-notes_2.pdf
  [Rem: si f est bornée sur D elle est dans H_infini, donc dans H_1 donc f
  converge non tangentiellement pp]

  Plus généralement, pour tout chemin de Jordan qui finit en θ, même de
  manière tangentielle, si f a une limite suivant ce chemin, elle a une
  limite non tangentielle (de même limite)

Zygmund:
- Si f méromorphe sur D a une limite non tangentielle nulle sur
  E de mesure > 0, alors f=0.
- Si f est holomorphe bornée et tend radialement vers 0 sur un ensemble de mesure non nul, alors f est nulle (en effet Lindelof => convergence non tangentielle)
- Si f méromorphe, alors pour presque tout θ, soit f converge
  non tangentiellement en θ, ou alors f de tout voisinage non
  tangentiel est dense
- Si f est harmonique sur D, et E tel que pour tout θ dans E, f est borné
  sur un voisinage non tangentiel, alors f a une limite non tangentielle
  pour presque tout point de E. (Voisinage non tangentiel = ouvert
  triangulaire avec pointe en θ).

Luzin: https://www.encyclopediaofmath.org/index.php/Luzin_theorem
- Si f est une fonction analytique sur D, et qui envoie un ouvert V de
frontière Gamma \subset le cercle unité T sur un ensemble de mesure finie,
alors f converge en presque tout point de Gamma (ce qui améliore Zygmund
1). 
- Il existe une fonction $f$ holomorphe bornée sur D telle que
  pour tout θ de T, f(ouvert O touchant T en θ) est de mesure infinie!

Résumé:
- si f est harmonique sur D, alors pp borné sur un voisinage non tangentiel
  => limite non tangentielle
- si f méromorphe sur D, alors pp soit f converge non tangentiellement, soit
  f(voisinage non tangentiel) est dense
- si f est holomorphe sur D et que l'image d'un ouvert V de frontière Gamma est
  de mesure finie, alors f converge pp sur Gamma
- si f est holomorphe bornée, alors convergence radiale => convergence non tangentielle

- Si une fonction méromorphe sur D a une limite non tangentielle nulle sur
  un ensemble de mesure non nulle, alors f=0.
- Si f est holomorphe bornée et tend radialement vers 0 sur un ensemble de mesure non nul, alors f est nulle.

Transformée de Fourier sur R
============================

- F envoie L_p sur L_q avec 1/p+1/q=1 pour 1 <= p <= 2
- f est la transformée de Fourier inverse de F(f). 
- |F(f)|_q <= |f|_p.

- Sur L_1, F(f) est uniformément continue et tend vers 0 en l'infini.
- Sur L_p (p>2) il y a des transformées de Fourier (au sens des
  distributions temperees) qui ne sont pas des fonctions.

Rappel: Inégalité de Holder
  si sum 1/p_i = 1/r (p_i peut etre +infty mais pas r), la norme L_r du
  produit des f_i est plus petite que le produit des normes L_p_i de f_i.

Bessel
======

Si 1<p< infty on a L_p = F_p,2^0
Si 0<p< infty on a h_p = F_p,2^0, ou h_p est l'espace de Hardy réel
(donc h_p = L_p si p>1)

Si 1<p< infty on a H_p^s = F_p,2^s ou H_p est l'espace de Bessel
  (Sobolev a coefficient pas forcément entiers, où on étend sur la
  fréquence)
Si 1<p< infty on a W_p^m = F_p,2^m ou W_p est l'espace de Sobolev a
  coefficient m entier
Si 1<=p< infty on a W_p^s = F_p,p^s = B_p,p^s ou W_p est l'espace de Slobodeckij et le coefficient s n'est pas entier (c'est une généralisation des espaces de holder, sauf qu'on met une norme L_p plutôt que L_infty. C'est donc Sobolev en m, et la partie rationelle une norme L_p dessus)
Si 1<=p< infty, 1<=q<=infty on a Lambda_p,q^s =  B_p,q^s ou
  Lambda est l'espace de Besov vu comme principe  variationnel un peu comme
  Slobedeckij. On prend la norme W_p^m sur la partie entière de s, et sur
  la partie fractionnaire la norme L_q, mais de Delta^2 (donc sur u(x+y) +
  u(x-y) -2u(x)) plutôt que sur l'équivalent de Holder

On a C^s = B_\infty,\infty^s ou C^s est l'espace de Holder, s non entier
On a C'^s = B_\infty,\infty^s ou C'^s est l'espace de Sigmund, pour tout s
(Zygmund, c'est comme Holder sauf qu'on utilise Delta^2 comme dans Lambda.
Le truc c'est que pour m entier, on dérive m-1 fois et on utilise Delta^2)

Enfin l'espace de Besov B et de Triebel-Lizorkin F sont des conditions de
convergence de la réciproque de Fourier de la transformée de Fourier
tronquée sur des couronnes croissantes. (Pour Besov on prend la norme L_q
de la tronquée, et on prend la norme l_p de ces normes. Pour Triebel on
prend la norme l_q des tronquées, que l'on intègre via la norme L_p (en
normalisant les trucs par rapport à la taille des couronnes: on prend une
courronne de référence, on tronque aux fréquences 2^j, et on normalise en
multipliant par 2^js (ou le s donne la dérivée))

David Madore
============

http://www.madore.org/~david/weblog/2012-10.html#d.2012-10-25.2084

Je donne cette année un cours d'Analyse en première année à
l'école-qui-s'appelait-ENST. Je ne suis pas du tout analyste, mais j'en profite
pour essayer de me cultiver un peu sur le sujet, et apprendre à mettre dans
leur contexte les résultats somme toute assez basiques que je leur enseigne.
Aujourd'hui j'ai fait cours sur les séries de Fourier, et comme je voulais
essayer de mettre au clair les différents résultats relatifs à la convergence
et à l'estimation de séries de Fourier, j'ai commencé à essayer de me faire une
liste systématique, et je suis tombé sur ce que j'aime appeler un "labyrinthe
de petits théorèmes tordus, tous semblables" (le terme est une référence geek
célèbre).

Ce que je veux dire par là est qu'on a un phénomène mathématique sur lequel on
montre une propriété, qui suggère quelques nouvelles questions, auxquelles on
répond par de nouveaux théorèmes ou des contre-exemples, mais ceux-ci suggèrent
encore des questions, et le processus ne converge pas (ou du moins, ne converge
pas dans les limites de la patience ou de la mémoire dont je dispose), et à la
fin je me retrouve avec une masse de théorèmes que je confonds et où je ne vois
plus rien. C'est loin d'être le seul cas où ce me soit arrivé, mais les séries
de Fourier sont un exemple assez frappant (et le fait qu'un M. Zygmund ait
réussi à écrire deux tomes de 350 pages chacun sur le sujet sans réussir à
faire le tour non pas de toutes les questions mais de toutes celles que je me
pose naturellement, suggère qu'il y a vraiment un labyrinthe). Petit apercu
(tout ceci étant dit pour les fonctions périodiques d'une variable réelle) :

    Si f est une fonction périodique L1 dont les coefficients de Fourier sont nuls, alors f=0. Plus généralement (par dualité), ceci vaut pour une mesure borélienne signée finie (coefficients de Fourier-Stieltjes) ou une distribution.
    Les coefficients de Fourier définissent un isomorphisme entre l'espace de Hilbert des fonctions périodiques L2 et l'espace de Hilbert des suites ℓ2 (Parseval-Riesz).
    Si f est une fonction périodique L1, alors ses coefficients de Fourier tendent vers 0 (Riemann-Lebesgue).
    Si μ est une mesure borélienne signée finie sur le cercle, ses coefficients de Fourier-Stieltjes sont bornés (évident).
    Si μ est une mesure borélienne signée finie sur le cercle, alors μ est sans atome si et seulement si ses coefficients de Fourier-Stieltjes tendent vers 0 en densité (i.e. pour tout ε>0 l'ensemble des coefficients de valeur absolue >ε est de densité nulle) (Wiener).
    Si f est une fonction périodique dont les coefficients de Fourier sont ℓ1 (la série de Fourier de f converge absolument), alors f est continue.
    Si f est une fonction périodique Lp pour 1≤p≤2 et q l'exposant conjugué à p, alors les coefficients de Fourier de f sont ℓq (Hausdorff-Young). Ceci n'est pas vrai en général pour p>2.
    Dualement : si 1≤p≤2 et q l'exposant conjugué à p, alors toute suite ℓp est la suite des coefficients de Fourier d'une fonction périodique Lq. Ceci n'est pas vrai en général pour p>2.
    Si f est une fonction périodique Lp pour 1<p<∞, alors les sommes partielles de sa série de Fourier convergent vers f au sens Lp (i.e., en norme). Ceci n'est vrai ni pour p=1 (Kolmogorov) ni pour p=∞ (évident).
    Si f est une fonction périodique L1, alors les moyennes de Cesàro des sommes partielles de sa série de Fourier convergent vers f au sens L1. (Vrai en remplaçant L1 par Lp pour n'importe quel 1≤p<∞, mais c'est redondant avec le point précédent.)
    Si f est une fonction périodique L1, alors les moyennes de Cesàro des sommes partielles de sa série de Fourier convergent vers f presque partout (Lebesgue).
    Si f est une fonction périodique Lp pour p>1, alors les sommes partielles de sa série de Fourier convergent vers f presque partout (Carleson-Hunt — très difficile). Ceci n'est vrai ni pour p=1 (Kolmogorov) : il existe même une fonction L1 dont la série de Fourier ne converge en aucun point.
    Si f est une fonction périodique admettant en x une limite à gauche et une limite à droite, alors les moyennes de Cesàro des sommes partielles de sa série de Fourier convergent en x vers la demi-somme entre la limite à gauche et la limite à droite de f en x (Fejér).
    Si f est une fonction périodique continue, alors les moyennes de Cesàro des sommes partielles de sa série de Fourier convergent uniformément vers f.
    Si f est une fonction périodique à variations bornées, alors les sommes partielles Sn[f] de sa série de Fourier convergent en chaque point x vers la demi-somme entre la limite à gauche et la limite à droite de f en x (qui existent toujours pour une fonction à variations bornées). De surcroît, aux points x de continuité de f, cette convergence est uniforme en x (au sens où Sn[f](y)→f(x) quand (n,y)→(∞,x)) : en particulier, si f est une fonction périodique continue à variations bornées, alors les sommes partielles de sa série de Fourier convergent uniformément vers f.
    Si f est une fonction périodique höldérienne d'exposant 0<α≤1, alors les sommes partielles Sn[f] de sa série de Fourier convergent uniformément vers f avec ‖f−Sn[f]‖∞ = O(n−α·log(n)) ; et les moyennes de Cesàro MSn[f] des Sn[f] vérifient ‖f−MSn[f]‖∞ = O(n−α).
    Si f est une fonction périodique höldérienne d'exposant 0<α≤1, alors les coefficients de Fourier de f sont ℓp pour tout p>1/(α+½). En particulier, si f est une fonction périodique höldérienne d'exposant α>½ alors la série de Fourier de f converge absolument (Bernstein). Ceci n'est pas vrai en général pour α=½.
    Si f est une fonction périodique höldérienne d'exposant 0<α≤1 et à variations bornées, alors les coefficients de Fourier de f sont ℓp pour tout p>1/(½α+1). En particulier, si f est une fonction périodique höldérienne d'exposant α>0 et à variations bornées alors la série de Fourier de f converge absolument (Zygmund).
    Si f est une fonction périodique à variations bornées, alors les coefficients de Fourier de f sont O(n−1). Si f est une fonction périodique absolument continue, alors les coefficients de Fourier de f sont o(n−1).
    Si f est une fonction périodique Cr, alors les coefficients de Fourier de f sont o(n−r).
    Si φ est une distribution sur le cercle, alors les coefficients de Fourier de φ sont à croissance au plus polynomiale, et réciproquement, toute suite à croissance au plus polynomiale est la suite des coefficients de Fourier d'une (unique) distribution sur le cercle.
    Si les coefficients de Fourier d'une fonction périodique L1 sont O(n−1), alors la convergence des moyennes de Cesàro des sommes partielles de la série de Fourier entraîne la convergence (vers la même limite) des sommes partielles elles-mêmes, et la même chose vaut pour la convergence uniforme (théorème taubérien de Hardy).
    Si une série trigonométrique converge en tout point du cercle vers une limite qui définit une fonction L1, alors la série est bien la série de Fourier de la fonction ; et en particulier, si une série trigonométrique converge en tout point vers 0 alors elle est identiquement nulle. Mais ce dernier point n'est pas vrai si on remplace "en tout point" par "presque partout".

Pfiou ! Et encore, je ne dis rien sur le noyau de Poisson ou la fonction conjuguée, ni sur rien d'autre que les fonctions périodiques d'une variable réelle (et notamment rien sur la transformée de Fourier). Et malgré ça, il y a quantité de questions qui me semblent profondément naturelles et dont je n'ai toujours vu aucune mention dans les livres. Du genre :

    Si f est une fonction périodique L1, est-il vrai que les sommes partielles de la série de Fourier de f convergent vers f faiblement dans L1, c'est-à-dire que ∫(f−Sn[f])·h tendrait vers 0 pour toute fonction h L∞ sur une période. (On me fait remarquer que cela équivaut plus ou moins à demander si, pour g la convolée d'une fonction L1 et d'une fonction L∞, les sommes partielles de la série de Fourier de g convergent ponctuellement vers g.) Ajout : la réponse est négative.
    Existe-t-il des séries trigonométriques qui convergent en tout point du cercle mais dont la limite ne soit pas une fonction L1 ou même, qui ne soient pas la série de Fourier-Stieltjes d'une mesure borélienne signée finie ? (J'imagine que oui, peut-être dans l'esprit des intégrales de Denjoy/Khintchine en dérivant la série de Fourier d'une fonction dérivable non absolument continue.)
    Existe-t-il des séries entières de rayon de convergence 1 admettant en tout point du cercle une limite nontangentielle (i.e., sommables en tout point au sens d'Abel), cette limite étant nulle partout, sans pour autant que la série soit nulle ? (Ajout : la réponse est non, cf. le commentaire de "Damien".) Et si la réponse est non, admettant en tout point du cercle une limite nontangentielle sans pour autant être la série de Fourier d'une distribution (i.e., à croissance au plus polynomiale) ?
    Existe-t-il des mesures boréliennes signées finies sur le cercle dont les coefficients de Fourier-Stieltjes sont O(n−½), voire o(n−½), et qui ne sont pas l'intégrale d'une fonction L1 (i.e., ne sont pas absolument continues par rapport à la mesure de Lebesgue) ? (J'imagine que oui, il n'y a pas de raison.)

Je pourrais poser ces questions sur MathOverflow, mais chacune demandrait que
j'y réfléchisse préalablement (pour m'assurer que ce n'est pas une question
profondément idiote) sans doute plus que ce que je suis prêt à faire.

Alors on pourra me rétorquer que c'est normal, c'est comme ça que la science
fonctionne : toute réponse suggère d'autres questions. C'est peut-être un joli
slogan, mais ce n'est pas toujours le cas : il y a des domaines dont on a
l'impression d'avoir fait le tour de façon assez nette (parfois cette
impression est trompeuse, c'est vrai), ou du moins qui ne suggèrent pas des
questions naturelles et évidentes à foison mais plutôt des questions dont on a
d'emblée le sentiment qu'elles sont difficiles et riches. Ce que j'appelle un
labyrinthe de petits théorèmes tous semblables, c'est quand les questions
viennent plus vite que je n'ai le temps de les formuler, et quand les livres
regorgent déjà de résultats qui partent dans tous les sens et qui sont rarement
présentés de façon systématique et synthétique.

(Au sujet de l'ordre d'exposition des résultats, c'est d'ailleurs peut-être un
problème sérieux de contradiction entre l'orthodoxie logique qui veut qu'on
présente les théorèmes dans l'ordre dans lequel ils découlent les uns des
autres, et la clarté pédagogique : dans l'énumération des énoncés que j'ai
faite ci-dessus, certains des faits annoncés sont quasi triviaux et d'autres
sont des théorèmes assez profonds, notamment le théorème de Carleson, donc
aucun bouquin ne les listerait comme ça, et c'est bien dommage, parce que je
trouve que ça aide à s'y retrouver dans le labyrinthe.)

Mes commentaires
----------------
http://www.madore.org/cgi-bin/comment.pl/showcomments?href=http%3a%2f%2fwww.madore.org%2f~david%2fweblog%2f2012-10.html%23d.2012-10-25.2084

Tiens c'est marrant, moi aussi je m'étais noté des résultats amusants sur les séries de Fourier:
- Si f est continue sur le cercle unité, elle est L^2 donc elle converge presque partout vers sa série de Fourier. Cependant on peut construire des fonctions continues telles que la série de Fourier diverge sur un ensemble dense.
- L'ensemble des fonctions telles que la série de Fourier converge absolument forme une algèbre (de Wiener), et si f est dans cette algèbre et que 1/f est bien définie, alors 1/f y est aussi. Exemple: les fonctions Holderiennes d'exposant alpha > 1/2 ou les fonctions holderiennes et à variations bornées sont dans cette algèbre comme tes exemples le montrent.

Il y a pleins de choses rigolotes sur les convergences radiales/non tangentielles:
- L'intégrale de Poisson donne une isométrie de L^p (1<p<\infty) sur h^p (les fonctions harmoniques sur le disque telle que l'intégrale L^p de la norme sur des cercles de rayon tendant vers 1 soit bornés), et des mesures signées sur h^1.
- En particulier, comme Césarro implique convergence non tangentielle, si f est dans h^p (p>1) ou si f est l'intégrale de Poisson d'une fonction L^1, alors f converge non tangentiellement presque partout. On a le théorème plus fort suivant (qui est dans le Zygmund il me semble): si f est dans h^1 pour un arc (theta_0,theta_1) (ie on demande juste que l'intégrale de |f| sur les bouts d'arcs d'angle theta_0 theta_1 soient bornées en faisant tendre r vers 1), alors f=f_0 + f_1 où f_0 est le noyau de Poisson d'une fonction L_1 et f_1 tend vers 0 uniformément vers 0 le long d'un arc (theta_0+epsilon, theta_1-epsilon). En particulier, f converge non tangentiellement pp le long de l'arc (theta_0, theta_1)

Une série de labyrinthes de théorèmes tordus :)
- Si f est harmonique sur le disque unité D, et E partie du cercle unité est tel que pour tout theta dans E, f est bornée le long d'un voisinage non tangentiel, alors f admet une limite pp theta dans E
- Si f est méromorphe sur D, pour preque tout theta, soit f converge non tangentiellement en theta, ou alors f de tout voisinage non tangentiel de theta est dense
- Si f est holomorphe bornée, alors pour presque tout theta, convergence radiale => convergence non tangentielle. On a même mieux: pour presque tout theta, convergence le long d'un chemin de Jordan qui finit en theta (même de manière tangentielle) => convergence non tangentielle (de même limite)

Dans le même genre:
- Si f est méromorphe sur D, et a une limite non tangentielle nulle sur un ensemble de mesure non nul, alors f=0 (ce qui répond à une de tes questions). De plus par ce qui précède, si f est holomorphe bornée et tend radialement vers 0 sur un ensemble de mesure non nul, alors f est nulle.
- En revanche, pour tout g continue et tout ensemble maigre, il existe une fonction holomorphe sur D telle que f(t)-g(t) tend radialement vers 0 pour theta dans E. (En particulier, le point précédent est faux si on remplace convergence non tangentielle par convergence radiale)

Enfin, ceci n'est pas dans le Zygmund (il faudrait que je retrouve la référence, mais par exemple www.math.nyu.edu/faculty/varadhan/harmonic/lecture5.ps), mais si f est dans H^p (ie f est holomorphe et dans h^p), alors f=FB où B est le produit de Blockshe des zéros et F ne s'annule pas. On a |f|=|F| en norme H^p, et B est dans H^\infty et converge non tangentiellement pp vers une limite de norme 1 (je ne me souviens plus si on n'a pas même une limite radiale partout). Application: si f est dans H^p (p>0), alors f converge non tangentiellement partout (car on peut appliquer ce qui précède à F^{2/p} qui est bien définie).

Ouf!

Forum
=====

From vigneron@clipper.ens.fr Thu May 26 19:09:25 2005
Article: 11658 of ens.forum.sciences.maths
Path: eleves!not-for-mail
From: vigneron@clipper.ens.fr (Francois Vigneron)
Newsgroups: ens.forum.sciences.maths
Subject: Re: series de Fourier et classe de Holder
Date: Thu, 26 May 2005 17:09:25 +0000 (UTC)
Organization: Le forum de l'ENS.
Lines: 58
Sender: vigneron@clipper.ens.fr
Message-ID: <d74vs5$als$1@clipper.ens.fr>
References: <d6v4ob$eio$1@clipper.ens.fr> <d6vkdd$n3r$1@clipper.ens.fr> <d71cbm$kc9$1@clipper.ens.fr> <d71ug1$eoq$1@clipper.ens.fr> <d74nod$cqg$3@clipper.ens.fr>
NNTP-Posting-Host: clipper.ens.fr
X-Trace: clipper.ens.fr 1117127365 10940 129.199.129.1 (26 May 2005 17:09:25 GMT)
X-Complaints-To: forum@clipper.ens.fr
NNTP-Posting-Date: Thu, 26 May 2005 17:09:25 +0000 (UTC)
X-Newsreader: Flrn (0.5.0pre1 - 03/04)
Xref: eleves ens.forum.sciences.maths:11658

Gro-Tsen, dans le message (sciences.maths:11656), a écrit :
> Tu ne voudrais pas nous faire un petit résumé succinct et synthétique
> sur ce qu'on peut dire sur les implications et équivalences entre
> conditions sur les coefficients de la série de Fourier, la
> décroissance d'iceux et la convergence de la série, d'une part, et la
> régularité de la fonction d'autre part ?  Je pense que les agrégatifs
> t'en seraient très reconnaissants et ça me plairait de rafraîchir un
> peu ma mémoire sur des choses que j'ai sues dans une vie antérieure.

Bon, l'essentiel de ce que je peux dire est dans le message 9209 de ce
conti. C'est la théorie R^n ; pour faire le lien avec les séries de
Fourier, je dis ceci :

Si u est une distribution sur [0,1], on en fait une distribution
périodique en sommant ces translatés : v = \sum_{n\in Z} u(x-n).
C'est une distribution tempérée. Sa transformée de Fourier vérifie
     ( e^{2\pi (x|\xi)} - 1 )  \hat{v}(\xi) = 0
donc elle est à support dans les zéros du premier facteur, i.e.
    \hat{v} = \sum c_{n,\alpha} \partial^\alpha Dirac_{\xi=n}
Il me semble qu'on peut éliminer les dérivées de Dirac ; intuitivement,
je dirais qu'on peut écrire  v(x) = \sum x^k v_k(x)
où k correspond à la somme pour |\alpha|=k ; les v_k sont périodiques,
mais pas les x^k v_k, sauf si k=0. Bref, je fais comme si c_{n,\alpha}=0
si |\alpha|>0.
Les c_{n,0} sont les coefficients de Fourier.

On a le résultat suivant : une fonction u : R -> R est höldérienne
d'exposant \alpha (avec 0<\alpha<1) ssi la suite :

            2^{q\alpha} \norme[L^\infty]{ \Delta_q u }

est bornée, l'opérateur \Delta_q étant la troncature autour de la
fréquence 2^q c'est à dire

         Delta_q u = Fourier^{-1} [ \phi(2^{-q} \xi) Fourier[u](\xi) ]

avec \phi une fonction régulière à support dans R^d\{0}, égale à 1 sur la
couronne unité.

Pour une fonction périodique, ca ne se traduit pas directement sur ces
coefficients de Fourier, mais sur la norme L^\infty des paquets de type
           \sum_{n \approx 2^q} e^{2\pi n x} c_n.

Je ne sais pas si on peut faire exactement un lien avec la décroissance des
coefficients de Fourier...

Quand aux questions de la convergence de la série de Fourier, j'ai
toujours voulu savoir, mais je n'ai jamais vraiment fait l'effort
d'apprendre :(  J'ai honte.  Je me souviens seulement qu'il y a un
lien historique profond avec la théorie des opérateurs d'intégrale
singulière et des contre-exemples pathologiques....


PS: je note \norme[<espace>]{<fonction>} les normes en LaTeX.

--
François

====================================================================

From vigneron@clipper.ens.fr Sat Mar 13 17:26:18 2004
Article: 9209 of ens.forum.sciences.maths
Path: eleves!not-for-mail
From: vigneron@clipper.ens.fr (Francois Vigneron)
Newsgroups: ens.forum.sciences.maths
Subject: Re: conti de maths pour tous
Followup-To: ens.forum.sciences.maths
Date: Sat, 13 Mar 2004 16:26:18 +0000 (UTC)
Organization: Forum.
Lines: 133
Sender: vigneron@clipper.ens.fr
Message-ID: <c2vcna$14d$1@clipper.ens.fr>
References: <c2601q$lu3$1@clipper.ens.fr> <c2sp1d$epj$1@clipper.ens.fr> <c2spbc$kn5$1@clipper.ens.fr> <c2sqa3$pub$1@clipper.ens.fr> <c2t724$c9u$1@clipper.ens.fr> <c2th6q$i7v$1@clipper.ens.fr>
NNTP-Posting-Host: clipper.ens.fr
X-Trace: clipper.ens.fr 1079195178 1165 129.199.129.1 (13 Mar 2004 16:26:18 GMT)
X-Complaints-To: forum@clipper.ens.fr
NNTP-Posting-Date: Sat, 13 Mar 2004 16:26:18 +0000 (UTC)
X-Newsreader: Flrn (0.5.0pre1 - 03/04)
Xref: eleves ens.forum.sciences.maths:9209

Gro-Tsen, dans le message (alt.bavardage.maths:1736), a écrit :
>> Bof, c'est juste dire que les dérivées d'ordre 6 
>> vérifient |v(x)-v(y)|<C|x-y|^{2/3}, non ?
> Mais c'est équivalent, ou pas, à une condition de décroissance sur la
> transformée de Fourier ?

Oui.

Pour énoncer précisément, j'ai besoin de \phi \in D(Rd\{0}) égale à 1 au
voisinage d'une couronne de référence C_0. L'opérateur de troncature
à la fréquence |\xi|~2^q est défini de façon naturelle par :
\Delta_q = \phi(2^{-q}D) = fourier^{-1}( \phi(2^{-q}\xi) \fourier(u)(\xi) )

On a le résultat suivant :
  Pour 0<s<1, la classe de Hölder d'ordre s :
              u bornée et |u(x)-u(y)|<C|x-y|^s
  est égale (avec équivalence des normes) à la classe C^s des
  distributions tempérées telles que :
    (*)       |\Delta_q u|_{L^\infty} < C 2^{-qs}

Pour comprendre ce que (*) veut dire, il est bon de rappeler l'estimation:
|v|_{L^infty} < |\fourier(v)|_{L^1}. Il suffit donc que
(**)    \int_{\lambda C_0} |\fourier(u)| décroisse comme \lambda^{-s}
pour assurer (*).
Bien sûr, c'est un sens assez faible de la décroissance à l'infini.

Pour les dérivées d'ordre supérieur, c'est pareil :
  La classe de Hölder C^{k,s} (ie k dérivées continues et la k-ième est
  s-holderienne) s'identifie à l'espace C^{k+s} défini par (*).

Avant de donner une idée de la preuve, il y a une remarque très
importante :

La constante d'équivalence de norme est en [s(1-s)]^{-1} ; du coup,
la classe C^s définie par (*) et s entier n'est _pas_ la classe usuelle
des fonctions s fois différentiables.  Le point qui pose problème c'est
qu'on n'a aucune caractérisation non tautologique de ce qu'est l'espace
\fourier(L^\infty). L'espace C^s obtenu alors est noté C^s_* pour éviter
la confusion (classe de Zygmund). On a une caractérisation exacte de
C^1_* ; c'est dire :    |u(x+y) + u(x-y) - 2u(x)| < C |y|,
donc C^1 est clairement inclu dans C^1_*, mais sans réciproque.


Au point où on en est, il est très facile de généraliser
aux classes de sobolev W^{s,p} pour 0<s<1 et p\in[1,\infty].
Je rappelle que : u\in W^{s,p} signifie que u est L^p et que
            (  /     /       |u(x+z) - u(x)|^p          dz   )^{1/p}
|u|_{s,p} = (  |     |      ------------------- dx     ----- )
            (  /Rd   /Rd          |z|^{ps}             |z|^d )
est finie (d=dimension ambiante).
Une généralisation facile, c'est de prendre un indice r\in[1,\infty] et
d'intercaller une norme L^r :

              ( /     (  /     |u(x+z) - u(x)|^p      )^{r/p}   dz   )^{1/r}
|u|_{s,p,r} = ( |     (  |    ------------------- dx  )        ----- )
              ( /Rd   (  /Rd        |z|^{ps}          )        |z|^d )

Pour r=p, on trouve exactement W^{s,p}. La caractérisation en fourier
de ce truc est très facile :

   (#)    |\Delta_q u|_{L^p}  < 2^{-qs} c_q   avec  \sum (c_q)^r finie.

On dit que c'est l'espace de Besov B^s_{p,r}.

Reste à prouver tout ca ; bon, je vais pas le faire en détail, mais
l'important de comprendre l'idée.

- |u|_{déf par taux d'accroissement} < |u|_{déf fréquentielle}
  ------------------------------------------------------------

 Il faut estimer la norme L^p de |u(.+z)-u(.)| ; pour ca, on dit que
u = \sum \Delta_q u  et il suffit d'avoir un contrôle à fréquence donnée.
(je rappelle que \Delta_q commute avec la translation en fourier, est
simplement la multiplication par e^{-iz\xi}.)

 Pour les hautes fréquences, ie lorsque 2^q > 1/|z|, on controle
simplement par 2*|\Delta_q u|, c'est à dire, on ne fait rien.

 Pour les basses fréquences, on écrit taylor à l'ordre 1 avec reste
inégral ; on obtient (j'appelle T_z la translation de -z) :
 |\Delta_q [T_z - Id] u(x)| = z \int_[0,1] \gradient \Delta_q u (x+tz) dt
Le calcul de \gradient \Delta_q est instructif ; on sort une puissance
2^q et il reste un opérateur de multiplication en Fourier à support
autour de la couronne 2^q C_0 ; c'est aussi une convolution avec un truc
qui a le scaling de L^1 donc c'est un opérateur borné sur L^p et on a
donc : 
\gradient\Delta_q = 2^q (borné sur L^p) o (\Delta_{q-1} + .. + \Delta_{q+1})

 Ensuite, pour r=p=infty (le cas qui nous intéressait au départ), on
s'appercoit qu'on a l'estimation qu'on voulait.
Pour les autres cas, on utilise une estimation de Hölder avec poids
pour la série, typiquement : 
 | \sum_{q>N} c_q 2^{-qs} |^r < (2^{-Ns}/s)^{r/r'} sum_{q>N} c_q ^r 2^{-qs}
On remarque que la fréquence de coupure est choisie précisément pour que
2^{-N} soit égal à |z|.
Alors, on ne touche plus à rien et on écrit l'intégrale en dz
par dessus. On obtient donc une somme de deux intégrales sur ZxRd,
correspondant aux domaines (q,z) tels que 2^q < ou >  |z|^{-1}.
On fait un coup de Fubini pour calculer l'intégrale en dz d'abord
et c'est gagné.

- |u|_{déf fréquentielle} < |u|_{déf par taux d'accroissement}
  ------------------------------------------------------------

  L'idée pour réintroduire un taux d'accroissement quand on part de la
caractérisation fréquentielle est simple : \Delta_q est une multiplication
en Fourier par une fonction nulle au voisinage de \xi=0, donc \Delta_q(P)=0
pour tout polynôme P. En particulier, on peut retrancher à u son
développement de Taylor à n'importe quel ordre. Pour 0<s<1, il suffit
de retracher la valeur ponctuelle ; on écrit donc :
   \Delta_q [u] (x) = \Delta_q [u - u(x)] (x)

  Bon, pour simplifier, je vais finir pour r=infty, puisque c'est le cas
qui nous intéressait au départ.
  Il suffit d'écrire alors que U_q = \Delta_q [u - u(x)] c'est \fourier^{-1}
en x de \phi(2^{-q}\xi) \fourier[u-u(x)]. On a donc deux intégrales
superposées ; on change u(y)-u(x) en u(x+z)-u(x) et on introduit de force
la puissance de |z| qui va  bien ( 1 = |z|^\alpha * |z|^{-\alpha}, avec
alpha = s+d/r).
Cette double intégrale donne la valeur ponctuelle de Delta_q u(x) ; pour
estimer la norme L^p, on prend v dans L^p' et on rajoute une troisième
intégrale. On termine alors par une simple estimation de Hölder, l'uniformité
par rapport à q sortant juste du calcul de la norme L^r' de
|z|^alpha 2^qd h(2^q .) .
  Et voila...


Bon, si ca intéresse  quelqu'un de lire quelques bouts de formules en
TeX, je laisserai quelques temps le fichier besov.dvi sur mon compte sur
clipper.

-- 
François, qui pardon je voulais vraiment pas faire peur aux scrit's...

