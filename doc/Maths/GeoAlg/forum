vim: ft=markdownlight fdm=expr

sciences.maths:19065 topologie de Zariski : des premiers aux maximaux, continuite sur le spectre
  (Des questions un peu zarb de Name Sage sur les schémas, pas sûr que ce
  soit très intéressant...)

Corps des fractions
===================

Anneau des fractions totales
-----------------------------

Allforum (?:Aide):[D]sciences.maths.avancees         Message   606/ 2860 ( 2607)

Soit A un anneau noéthérien. Je note K(A) son anneau des fractions
totales (je ne sais pas si c'est le terme canonique), à savoir A localisé
en les non-diviseurs de zéros. Si A est intègre on retombe bien sûr sur
l'anneau des fractions, plus généralement K(A) est le plus grand localisé
tel que A s'injecte dedans.

Bon, maintenant cette opération ne commute pas à la localisation, en
effet on a: K(A[U^-1]) = K( K(A)[U^-1] )
Cependant, ça marche dans le cas A réduit.

 Preuve:
 ------

0 est l'intersection des ideaux premiers minimaux, ce qui nous fournit une
decomposition primaire minimale de 0 dans A donc
- les assassins sont exactement les premiers minimaux, l'union de ces
  ideaux est exactement les diviseurs de zero de A
- P etant minimal sur ann A=0, P est donc la composante P-primaire de
  zero dans A, c'est a dire le noyau de la fleche A->A_P.
  Autrement dit, A_P est un corps, c'est le corps de fraction de A/PA
  (qui s'injecte dans A_P/PA_P=A_P par ce qui précède).

Mais K(A) est artinien réduit, donc isomorphe à un produit de corps. Par ce qui
précède, on voit que K(A) est isomorphe au produit des A_P, pour P premier
minimal.
Autrement dit on a les injections suivantes:
A -> Prod A/PA -> Prod Frac(A/PA) = Prod A_P = K(A).

 Application
 -----------

Si A noethérien réduit, x et y dans A qui sont des les mêmes premiers minimaux,
ils différent d'un élément inversible de K(A), i.e il existe u et v dans A non
diviseurs de zero tels que ux=vy.

Corps des fractions d'un produit
--------------------------------
sciences.maths                  Message 13722

>> Soit A et B deux k-algèbres intègres, telles que A¤B soit intègre.
>> Quel rapport y a-t-il entre Frac(A¤B) et Frac(A)¤Frac(B) ?

> Je dirais, à vue de nez, que Frac(A) x Frac(B) a pour corps des fractions
> Frac(A x B), mais qu'on n'a pas forcément égalité.

Il me semble aussi.

Le mieux est de le voir par propriété universelle: Frac A -> C c'est
l'ensemble des morphismes A -> C qui envoit A sur des éléments
inversibles de C. A * B -> C c'est A->C x B->C.

Donc Frac A * Frac B -> C, c'est les morphismes f: A->C et g:B->C, tel
que tout élément de f(A) et g(B) soit inversible, alors que Frac(A*B) ->
C, c'est les morphismes f:A->C et g:B->C, tel que tout élément de
_l'anneau_ engendré par f(A) et g(B) soit inversible.

En particulier, il me semble que Frac A * Frac B, c'est le localisé de
A*B par les éléments de la forme a*b (ie par les tenseurs principaux).
_Donc_ Frac A * Frac B est intègre (car on localise A*B supposé
intègre), et on a bien Frac (Frac A * Frac B) = Frac(A * B).

> Par exemple, pour un
> produit de droites A = k[X] et B = k[Y], on veut comparer
> k(X) x k(Y) avec k(X,Y), et il me paraît clair (sans vraiment pouvoir le
> démontrer rigoureusement), que 1/(X+Y) n'est pas dans le produit des
> localisés, tout en étant dans le localisé du produit.

Bah tu prends C=k(T), tu considère le morphisme qui envoit X sur T et Y sur
-T, alors dans k(X)*k(Y), X+Y est envoyé sur 0, donc X+Y n'est pas
inversible.

>> Géométriquement, je suis entrain de regarder le point générique alpha de
>> Spec A, bêta de Spec B, et le rapport entre le point générique de Spec A x
>> Spec B et alpha x bêta....

Le point générique de Spec A x Spec B est le point générique de
alpha x beta, donc.

< Bon, ça me rassure. J'avais bien l'impression que tu avais des flèches
< [point générique de Spec A x Spec B] -> alpha x beta -> Spec A x Spec B
< et donc, en considérant les adhérences, hop c'était bon. La seule question
< qui me gênait était: au niveau ensembliste, alpha x beta -> Spec A x Spec B
< st-elle vraiment une inclusion.

On peut voir aussi de manière géométrique: Spec alpha x beta -> Spec A x
Spec B est l'image d'un point qui a pour adhérence toute la variété. Pour
montrer que c'est un point générique il suffit de montrer que c'est une
immersion, mais \Spec alpha -> A et \Spec beta -> B sont des immersions
(car ce sont des points), et il me paraît clair que le produit respecte les
immersions.

Diviseurs Rationels
===================

From madore@clipper.ens.fr Mon Oct  9 23:55:02 2006
Article: 1681 of ens.forum.sciences.maths.avancees
Path: eleves!not-for-mail
From: madore@clipper.ens.fr (Gro-Tsen)
Newsgroups: ens.forum.sciences.maths.avancees
Subject: Pic(X) et Pic(Xbar)^G (was: Re: diviseurs sur un corps...)
Supersedes: <egdns5$fp9$5@clipper.ens.fr>
Date: Mon, 9 Oct 2006 14:55:02 +0000 (UTC)
Organization: Le forum de l'ENS.
Lines: 51
Sender: madore@clipper.ens.fr
Message-ID: <egdnuf$fp9$6@clipper.ens.fr>
References: <egbq1t$1ri$1@clipper.ens.fr>
NNTP-Posting-Host: clipper.ens.fr
X-Trace: clipper.ens.fr 1160405775 16169 129.199.129.1 (9 Oct 2006 14:56:15 GMT)
X-Complaints-To: forum@clipper.ens.fr
NNTP-Posting-Date: Mon, 9 Oct 2006 14:56:15 +0000 (UTC)
X-Newsreader: Flrn (0.5.0pre1 - 03/04)
X-Start-Date: 09 Oct 2006 14:31:28 GMT
X-Supersedes-Reason: petit conflit de notations (p sert pour deux choses)
Xref: eleves ens.forum.sciences.maths.avancees:1681

Si X est une variété sur un corps k que je vais supposer parfait pour
ne pas avoir à me poser de questions, Xbar la même variété montée à la
clôture algébrique kbar, et G=Gal(kbar/k) le groupe de Galois absolu
de k, alors le groupe Div(X) des diviseurs sur X est canoniquement
identifiable à Div(Xbar)^G (groupe des diviseurs de Xbar invariants
par G).


En revanche, si on considère le groupe de Picard Pic(X) des classes de
diviseurs modulo équivalence linéaire, il n'est plus vrai que Pic(X)
s'identifie à Pic(Xbar)^G : il y a une flèche évidente de Pic(X) vers
Pic(Xbar)^G, mais en général elle n'est ni injective ni surjective.


Pour y voir plus clair, on applique la suite spectrale de Leray (?) au
morphisme f : X -> Spec k et au faisceau G_m sur X : on a

	E_2^{p,q} = H^p (k, R^q f_* G_m) => H^n (X, G,m)

ce qui donne pour la suite exacte habituelle 0 -> E_2^{1,0} -> E^1 ->
E_2^{0,1} -> E_2^{2,0} -> E_1^2 -> E_2^{1,1} -> E_2^{3,0} :

0 -> H¹(G,kbar[X]^*) -> Pic(X) -> Pic(Xbar)^G -> H²(G,kbar[X]^*)
-> ker[Br(X)->Br(Xbar)^G] -> H¹(G,Pic(Xbar)) -> H³(G,kbar[X]^*)

(Je rappelle que Pic(X) = H¹(X,G_m) en cohomologie étale, et j'ai noté
de même Br(X) = H²(X,G_m) le groupe de Brauer cohomologique.)

Si X est propre, kbar[X]^* = kbar^* et par Hilbert 90 on a
H¹(G,kbar^*)=0, donc la suite exacte en question devient

0 -> Pic(X) -> Pic(Xbar)^G -> Br(k) -> ker[Br(X)->Br(Xbar)^G] ->
H¹(G,Pic(Xbar)) -> H³(G,kbar^*)

Si en outre X a un point sur k, les choses se simplifient encore
plus : la flèche Br(k)->Br(X) est injective (parce qu'elle admet une
section, l'évaluation sur le point dont on a supposé l'existence) donc
la suite exacte ci-dessus se coupe en

	Pic(X) -> Pic(Xbar)^G  est un isomorphisme

et

	0 -> Br(k) -> Br_1(X) -> H¹(G,Pic(Xbar)) -> 0

où on a noté Br_1(X) = ker[Br(X)->Br(Xbar)^G].

-- 
David, qui que, comme la moitié des raisonnements de Colliot-Thélène
commencent par dire exactement ce que je viens de dire, même en étant
nul en cohomologie, j'ai fini par retenir un peu ce truc-là. :-)

Déterminant
===========

Thread sciences.maths:10489 Le déterminant est irréductible

Preuve: La variété X: Dét=0 est l'image de M_n*M_n via l'application
(P,Q) -> P.matrice_diagonale(1,...,1,0).Q., or M_n * M_n est irréductible,
donc X aussi. Comme A[X_1, ... X_n^2] est factoriel, ça prouve que Dét est
une puissance d'un polynôme irréductible (sinon X aurait plusieurs
composantes). Mais il est facile de trouver point où Dét est lisse, donc il
est irréductible.

[Autres manières de le vérifier:
- Regarder le degré par rapport à une variable
- Si ton polynôme est une puissance k-ième
d'un autre, dans son écriture comme combinaison linéaire de monômes, il y
en a au moins un qui est lui-même une puissance k-ième d'un autre monôme
(c'est facile à vérifier: tu prends un ordre total sur les monômes
compatible avec le produit (par exemple l'ordre lexicographique), et si P
est de la forme (somme_i c_i M_i)^k, si M_1 est minimal pour ton ordre, P
est somme de c_1^k M_1^k et d'une combinaisons linéaires de monômes
strictement supérieurs à M_1^k). Or il est clair que ce n'est pas le cas
pour P=det...
- plus géométriquement, si V est une variété algébrique, Z un sous-schéma
fermé, pour qu'une fonction f sur V s'écrive g^i avec i>=2, il faut que
ce soit le cas de la restriction de f à Z ; ici, on applique cela à V=M_n
et Z le sous-espace affine formé par les matrices diagonales dont la
diagonale est (X,1,...,1). La restriction du déterminant à Z est X qui
n'est pas une puissance non triviale.
]

On peut même se passer de la factorialité dans la preuve:
si on a un anneau intègre R et un élément D de R (penser que R est l'anneau
des polynômes à n² variables et D le déterminant), en notant (D) l'idéal
engendré, il est vrai sans supposer R factoriel (c'est tout à fait trivial,
même) que si R/(D) est intègre, c'est-à-dire si D engendre un idéal
premier, alors D est irréductible (au sens « si D=PQ dans R, alors soit P
soit Q est une unité ») ; le problème ici est qu'on sait simplement que le
réduit de R/(D) (soit R quotienté par le radical de (D)) est intègre, et
par ailleurs D n'est pas une puissance non triviale (ou multiple par une
unité d'une puissance non triviale).  Mais on a de plus que
R/(D) a un point lisse lisse (parce que le déterminant a une
différentielle non triviale quelque part) et, pour le coup, ça suffit
à montrer que R/(D) est intègre.

Preuve: Si on considère Spec A/(f), où A est intègre et intégralement
clos et f un élément de A, alors ça marche : {f=0} définit un diviseur
de Cartier, donc en particulier un diviseur de Weil, effectifs, sur
Spec A, qui s'écrit comme une combinaison à coefficients dans N de
sous-schémas intègres de codimension 1, et puisqu'on suppose le truc
réduit et lisse quelque part, il n'y a qu'une seule composante et elle
a multiplicité 1, donc c'est bien intègre.  (Il y a certainement une
meilleure façon de dire ça...)

Génériquement fini
==================

cf sciences.maths.avancees         Message  1794

Sam:
Soit f:X -> Y un morphisme de type fini, dominant, et generiquement fini
(i.e., la fibre generique est un ensemble fini) entre schemas integres.
Montrer qu'il existe un ouvert U de X dense tel que f^{-1}(U) -> U soit un
morphisme fini. On me conseille de montrer d'abord que K_X est une
extension finie de K_Y, ce que je n'arrive en fait meme pas a faire (c'est
la que doit jouer le fait que le morphisme est generiquement fini, mais je
n'arrive pas a traduire cela algebriquement de maniere commode).

----------
Gro-tsen:
J'allais répondre, mais d'autres m'ont précédé.  Je rajoute juste une
précision : tu as fait l'hypothèse que la fibre générique est
*ensemblistement* finie, et par ailleurs elle est de type fini (sur le
point générique de la cible) puisque f l'est, il faut donc utiliser le
fait qu'un schéma ensemblistement fini et de type fini sur un corps
est (schématiquement) fini.

----------
Sophie:

Je vais peut-être écrire des conneries, parce que je fais plutôt de la
théorie des groupes adéliques (formule des traces d'Arthur, la version
stable, en plus, autant dire l'horreur absolue) que de la géométrie
algébrique en ce moment, mais : Si ton morphisme est dominant, il envoie
le point générique de Y sur le point générique de X. Donc K_Y, qui est
juste le corps résiduel en le point générique de Y, est contenu dans une
algèbre finie sur K_X (là tu utilises que la fibre en le point générique
est finie), donc K_Y est une extension finie de K_X.

Ensuite, tu prends un ouvert affine non vide de X, disons U=Spec(A), et
tu notes V son image inverse. D'abord, tu montres que, pour tout ouvert
affine Spec(B) de V, quitte à inverser un nombre fini d'éléments de A
(ie à remplcer U par un ouvert affine non vide plus petit), B est fini
sur A. Remarque que A est un sous-anneau de K_X tel que K_X soit le
corps des fractions de A, et que B est un sous-anneau de K_Y tel que K_Y
soit le corps des fractions de B. De plus, B est de type fini sur A (car
le morphisme est de type fini), donc il existe une famille finie (b_i)
de B qui engendre B comme A-algèbre. Les b_i sont algébriques sur K_X
(car K_Y est fini sur K_X), donc, quitte à inverser quelques
dénominateurs de coefficients (qui sont des éléments de A), tu peux
supposer que les b_i sont entiers sur A. Tu obtiens que B est une
A-algèbre engendrée par un nombre fini d'éléments entiers sur A, et ceci
implique que B est fini sur A.

Ceci suffirait si je savais que V est affine, mais je ne le sais pas.
Comme mon morphisme est de type fini, je peux recouvrir V par un nombre
fini d'ouverts affines Spec(B_i), et, d'après le paragraphe ci-dessus,
quitte à remplacer U par un ouvert affine non vide un peu plus petit, je
peux supposer que tous les B_i sont finis sur A. Maintenant, il faut que
je montre que, quitte à inverser encore quelques éléments de A (en
nombre fini, bien sûr), tous les B_i sont égaux (ce sont des
sous-anneaux de K_Y, donc ce que j'écris a un sens). Comme il n'y a
qu'un nombre fini de B_i, il suffit de traiter le cas où il y en a deux,
disons B_1 et B_2. Le A-module B_2 est engendré par un nombre fini
d'éléments, et je veux montrer que, quitte à inverser un nombre fini
d'éléments de A, ces éléments qui engendrent B_2 sont dans B_1. Il
suffit de traiter le cas où B_2 est engendré par un élément, disons c.
Comme K_Y est le corps des fractions de B_1, tu as c=b'/b, avec b et b'
dans B_1. Comme de plus B_1 est fini sur A, b est entier sur A, donc
j'ai une équation : b*P(b)+a=0, avec a un élément non nul de A et P un
polynôme à coefficients dans A (je peux supposer a non nul car tous mes
anneaux sont intègres). Si je remplace A par A[1/a], l'élément b de B
devient inversible dans B, donc c=b'/b est dans B, et j'ai gagné.

Pour finir, il suffit de remarquer que tout ouvert non vide de X est
dense (en particulier l'ouvert U=Spec(A)), parce que X est irréductible.

----------------
Joel

> Soit f:X -> Y un morphisme de type fini, dominant, et generiquement fini
> (i.e., la fibre generique est un ensemble fini) entre schemas
> integres. Montrer qu'il existe un ouvert U de X dense tel que f^{-1}(U) -> U
> soit un morphisme fini.

Réponse 1 : c'est une conséquence d'un principe général de géométrie
algébrique (au moins si on rajoute que f est de présentation finie) : le
schéma \eta_Y=\Spec K(Y) est la limite projective des ouverts non vides de
Y, le morphisme f est de présentation finie et f×_Y \eta_Y est fini, il
existe donc un ouvert non vide U tel que f×_Y U soit fini. Cf. EGA IV §8.

>                         On me conseille de montrer d'abord que K_X est une
> extension finie de K_Y, ce que je n'arrive en fait meme pas a faire (c'est
> la que doit jouer le fait que le morphisme est generiquement fini, mais je
> n'arrive pas a traduire cela algebriquement de maniere commode).

Réponse 2 : On montre facilement que X_{\eta_Y} est intègre. On a un
morphisme évident \eta_X -> X_{\eta_Y}. L'hypothèse dit que X_{\eta_Y} ->
\eta_Y est fini, donc X_\eta_Y est un Spec A avec A une K(Y)-algèbre finie.
Mais A doit être intègre, donc A est un corps. \eta_X -> X_{\eta_Y} étant
l'inclusion du point générique de X_{\eta_Y}, c'est un isomorphisme.

On sait maintenant que K(X) est fini sur K(Y). Pour simplifier les
notations, je vais supposer qu'il existe un élément primitif t de
l'extension K(X)/K(Y). Il existe un polynôme unitaire P à coefficients dans
K(Y) tel qu'on ait un isomorphisme K(Y)[T]/(P) -> K(X) où T est envoyé sur
t. On peut supposer Y affine. Les coefficients de P sont des éléments du
corps des fractions de l'anneau de Y, quitte à inverser les dénominateurs
de ces coefficients (donc remplacer Y par un ouvert non vide), on peut
supposer que les coefficients de P sont des fonctions régulières sur Y.
Soit V un ouvert non vide affine de X sur lequel l'élément t soit une
section régulière. Posons Y=Spec A, V=Spec B. On a un morphisme évident
A[T]/(P) -> B. Ce sont deux anneaux intègres qui ont le même corps de
fractions K(X) et ce morphisme est tel que si on tensorise avec K(Y) sur A,
on trouve un isomorphisme. Le morphisme A[T]/(P) -> B est injectif. On peut
supposer qu'il est surjectif : il suffit que son image contienne un
ensemble fini de générateurs de B comme A-algèbre, ce qui peut se faire en
remplaçant Y par un ouvert affine plus petit.
Finalement, on peut supposer que Y=Spec A et que X contient un ouvert non
vide V isomorphe à Spec A[T]/P. Spec A[T]/P est fini sur Spec A, donc
propre, Spec A[T]/P est donc fermé dans X, d'où X=Spec A[T]/P.

Je préfère la réponse 1...

Immersions
==========

From david+forum@madore.org Fri May 29 16:26:40 2009
Article: 2478 of ens.forum.sciences.maths.avancees
Path: eleves!not-for-mail
From: Gro-Tsen <david+forum@madore.org>
Newsgroups: ens.forum.sciences.maths.avancees
Subject: monomorphismes et epimorphismes de schemas (was: Re: epimorphismes plats d'anneaux)
Supersedes: <gvorb0$ii6$1@clipper.ens.fr>
Date: Fri, 29 May 2009 14:26:40 +0000 (UTC)
Organization: Le forum de l'ENS.
Lines: 69
Sender: madore@quatramaran.ens.fr
Message-ID: <gvorbl$ii6$2@clipper.ens.fr>
References: <gvo6k2$m7c$2@clipper.ens.fr> <gvoasl$13a$2@clipper.ens.fr> <gvokg4$5l7$1@clipper.ens.fr>
NNTP-Posting-Host: quatramaran.ens.fr
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Trace: clipper.ens.fr 1243607221 19014 129.199.129.64 (29 May 2009 14:27:01 GMT)
X-Complaints-To: forum@clipper.ens.fr
NNTP-Posting-Date: Fri, 29 May 2009 14:27:01 +0000 (UTC)
X-Newsreader: Flrn (0.9.1 - 05/04)
X-Start-Date: 29 May 2009 13:24:17 GMT
Xref: eleves ens.forum.sciences.maths.avancees:2478

Dam's in litteris <gvokg4$5l7$1@clipper.ens.fr> scripsit:
> D'accord, il est donc isomorphe à son image ouverte (car il est fidèlement
> plat sur son image, vu que c'est un monomorphisme c'est un isomorphisme par
> ce que vient de dire Joël). J'imagine que c'est ce que tu voulais dire par
> immersion ouverte, mais je précise car une application étale n'est pas
> forcément un isomorphisme local.

« Immersion ouverte » est un terme standard pour les morphismes de
schémas : c'est un morphisme f:X->Y tel qu'il existe un ouvert U de Y
pour lequel f se factorise comme composée de l'immersion ouverte
canonique U->Y par un isomorphisme X->U.  C'est bien ce que tu as
l'air d'avoir compris, mais je ne vois pas bien pourquoi tu parles de
morphisme étale (un monomorphisme étale est, à plus forte raison qu'un
monomorphisme plat, une immersion ouverte) : voulais tu peut-être que
je précisasse « de Zariski » après ouvert, pour souligner qu'on ne
parlait pas d'un « ouvert étale » ?

> Est-ce que plus généralement on a une caractérisation "géométrique" d'un
> monomorphisme?

Pas spécialement, je crois.  Il faut garder à l'esprit des exemples
comme Spec(k×k[t,t^-1]) -> Spec(k[t]) (c'est-à-dire, au niveau des
anneaux, le morphisme k[t] -> k×k[t,t^-1] où la première composante
évalue en 0 et la seconde est l'inclusion des polynômes dans les
polynômes de Laurent), qui est un monomorphisme un peu déplaisant
(c'est aussi un épimorphisme et pourtant ce n'est pas un isomorphisme)
et qui sert tout le temps à fabriquer des contre-exemples.

>		 (Pour les épimorphismes, ce sont simplement les morphismes
> X->Y tels que l'image schématique de X est Y).

Je ne suis pas sûr de savoir ce qu'est l'« image schématique ».
J'imagine que tu veux dire, en l'occurrence, que X->Y ne se factorise
par aucun sous-schéma strict de Y.  Mais la notion d'« image
schématique » ainsi définie est peu agréable, parce que :

* si X->Y est surjectif (au niveau des points-au-sens-idéaux-premiers)
  et que Y est réduit, alors X->Y est un épimorphisme de schémas, là
  il n'y a pas de problème à dire que l'image du morphisme est Y ;

* cependant, si les morphisme surjectifs (au niveau des
  points-au-sens-idéaux-premiers) sont stables par changement de base,
  les épimorphismes de schémas, eux, _ne le sont pas en général_ (ou,
  si on veut, il existe des épimorphismes qui ne sont pas des
  épimorphismes universels).

Cette dernière affirmation fait que la notion d'image schématique ne
peut pas se comporter de façon agréable par changement de base.

L'exemple standard d'un épimorphisme dans la catégorie des schémas qui
n'est pas universel, c'est X = la réunion Spec(k[x]×k[y]) de deux
droites et Y = deux droites qui se coupent Spec(k[x,y]/(xy)) avec X->Y
le morphisme évident (qui identifie les origines des deux droites).
C'est bien un épimorphisme de schémas, mais si on coupe les deux
droites transversalement, c'est-à-dire qu'on tire par Z->Y donné par
k[x,y]/(xy) -> k[h]/(h²) qui envoie x et y tous deux sur h, alors on
obtient le morphisme qui envoie deux points réduits Spec(k²) sur un
point épaissi Z=Spec(k[h]/(h²)), et c'est certes surjectif au niveau
des points-au-sens-idéaux-premiers mais ce n'est pas un épimorphisme.
Donc si la notion d'« image schématique » fait que X->Y a pour image
Y, en revanche, en tirant par Z->Y l'image devient Z^red qui est plus
petit que Z : c'est peu plaisant, comme notion.

Je ne connais pas de caractérisation des épimorphismes universels de
schémas : être fidèlement plat ou bien admettre une rétraction sont
des conditions suffisantes - mais j'ai l'impression qu'un éclatement
(disons du plan affine à l'origine) est un épimorphisme universel,
auquel cas il montre que la disjonction de ces deux conditions n'est
pas nécessaire pour être un épimorphisme universel.

Est-ce qu'un sous-schéma affine d'un schéma affine est une localisation?
========================================================================

sciences.maths.avancees: 1832 et thread associé.
  Exemples très intéressant de sous-ouvert affine d'une variété affine qui
  n'est pas une localisation, et que ça ne peut pas se produire si A est
  factoriel:
    J'ai retrouvé la référence. C'est SGA 6 II 2.2.6 qui dit que si X est
    un schéma localement noethérien, U un ouvert tel que U -> X soit un
    morphisme affine, alors les composantes irréductibles de X-U sont de
    codimension 0 ou 1
    [l'idée est de montrer que si A est un anneau local noethérien de
    dimension >=2, alors le complémentaire du point fermé dans Spec A n'est
    pas un schéma affine (en montrant qu'il a de la cohomologie
    cohérente)].
    Si A est un anneau noethérien et intègre, pour que tout ouvert affine de
    Spec A soit de la forme D(f), il suffit donc que A soit factoriel.

* sciences.maths.avances:1830

Rémy, dans le message (sciences.maths.avancees:1828), a écrit :
> Si le schéma d'arrivée admet un point générique, mettons, tu as un morphisme
> naturel de R dans l'anneau de fractions de A en raison des inclusions
> Spec (Frac A) -> Spec R -> Spec A. Est-ce que à partir de là R n'est pas
> forcément une localisation de A ?

Non, c'est faux. Si A est un anneau de Dedekind (anneau intègre noethérien
de dimension 1 dont les localisés en les idéaux maximaux sont des anneaux
de valuation discrète), alors tout ouvert de Spec A est affine (ce serait
un peu long à justifier proprement, mais en gros, c'est trivial à vérifier
pour les localisés de A (anneaux de valuation discrète), par EGA 4 §8, cela
s'étend à des vrais voisinages ouverts). Il reste à trouver un anneau de
Dedekind A et un ouvert de Spec A qui ne soit pas de la forme D(f) pour f
dans A. Prenons un anneau de Dedekind dont le groupe de Picard ne soit pas
de torsion (prendre une courbe elliptique sur C et enlever un point), soit
m un idéal maximal dont la classe dans le groupe de Picard soit d'ordre
infini. Spec A - {m} est un ouvert de Spec A, mais ce n'est pas un ouvert
de la forme D(f). Si c'était le cas, le lieu des zéros (i.e. le diviseur de
f) ne contiendrait que m, div f serait un multiple de m, ce qui
impliquerait qu'il existerait un entier n>=0 tel que div f = m^n, ce qui
contredirait le fait que m^n ne soit pas principal.

>                                   En tout cas, ça a l'air de marcher pour
> l'espace affine.

Pour l'espace affine, cela doit être bon. Je n'ai plus la référence précise
en tête (peut-être rechercher "pureté de Zariski-Nagata" dans un SGA), mais
il me semble que sous des hypothèses convenables, le fermé complémentaire
d'une immersion ouverte affine est purement de codimension 1. Si U est un
ouvert affine d'un espace affine A^n, U est le complémentaire de la réunion
d'un nombre fini de sous-variétés de codimension 1 dans A^n. Comme
k[T_1,...,T_n] est factoriel, toute telle sous-variété est une hypersurface
i.e. un Z(f_i), l'ouvert U est alors D(f_1...f_k).

* sciences.maths.avancees:1832

Rémy, dans le message (sciences.maths.avancees:1831), a écrit :
> Hum, j'imagine que ça se généralise à beaucoup de choses localement
> factorielles... Si tout est, mettons, lisse, on a le résultat ?

Euh, j'utilise la factorialité de façon globale.

J'ai retrouvé la référence. C'est SGA 6 II 2.2.6 qui dit que si X est un
schéma localement noethérien, U un ouvert tel que U -> X soit un morphisme
affine, alors les composantes irréductibles de X-U sont de codimension 0 ou
1 [l'idée est de montrer que si A est un anneau local noethérien de
dimension >=2, alors le complémentaire du point fermé dans Spec A n'est pas
un schéma affine (en montrant qu'il a de la cohomologie cohérente)].

Si A est un anneau noethérien et intègre, pour que tout ouvert affine de
Spec A soit de la forme D(f), il suffit donc que A soit factoriel.

* cf aussi /home/dams/Papiers/Maths/GeoAlg/monos_platsaffines.pdf
DANIEL LAZARD Autour de la platitude
Chapitre IV.5.

Th: Soit U un ouvert d'un schéma affine noethérien Spec(A). Si \Gamma(U)
est un A-module plat, alors Spec(\Gamma(U)) s'identifie à un ouvert affine
de Spec(A) contenant U.

Morphismes de présentation finis
================================

Allforum (?:Aide):[D]sciences.maths.avancees         Message  1354/ 2860 ( 2596)
Newsgroups: ens.forum.sciences.maths.avancees
Sender: jriou@clipper.ens.fr
Message-Id: <dsfvhl$cc5$1@clipper.ens.fr>                               /o-o-o
Content-Type: text/plain; charset=iso-8859-1                           o-@-o-o
Content-Transfer-Encoding: 8bit
X-Start-Date: Thu, 09 Feb 2006 18:25:41 +0100
Date: Thu Feb 9 18:52:53 2006
Auteur: Joel Riou (joel.riou) [jriou]
Réponse à: Gabriel Giabicani (giabican) [1352]
-Sujet: Re: voisinage d'un point d'un schéma

Gabriel Giabicani, dans le message (sciences.maths.avancees:1352), a
 écrit :
> La question est la suivante: si je prend x point de X un schéma, on a
> une application naturelle Spec O_x ->X. Qu'est-ce qu'on peut dire de ce
> morphisme? En particulier, est-ce qu'il y a une structure de sous-schéma
> de X sur Spec O_x? On parle de voisinage infinitémisal, mais j'ai à peu
> près réussi à me convaincre que ca n'était pas un vrai voisinage.

Voisinage infinitésimal, cela désigne une notion très différente. Si Z
est un sous-schéma fermé d'un S-schéma X ; un épaississment de Z dans X,
c'est une factorisation Z -> Z' -> X où Z -> Z' est une immersion fermée
nilpotente ; le "voisinage infinitésimal", cela doit être le système
inductif de tous ces épaississements que l'on peut modéliser comme étant
la limite projective des A/I^n si X=Spec A et Z défini par l'idéal I
(enfin, c'est quelque chose comme ça), c'est-à-dire le complété de A par
rapport à I.

Spec O_x n'est pas un ouvert en général : prendre X = Spec Z, x le point
générique. Les ouverts sont les spectres des localisés Z[1/n], alors que
O_x = Q (utiliser le fait qu'il existe une infinité de nombres premiers).
Mais, moralement, il est raisonnable de penser à Spec O_x comme un tout
petit ouvert (les "ouverts Nisnevich ou étales" sont encore plus petits,
et les voisinages "complétés" sont infiniment plus petits encore...).

> Question liée: j'ai l'impression que se donner une application
> rationnelle de X dans Y, si X est irréductible, c'est à peu près pareil
> que se donner une flèche Spec K(X) -> Y, mais je n'arrive pas à écrire
> proprement le lien...

Sous des hypothèses de type finitude raisonnable, c'est bien vrai. La
référence absolue pour ce genre de question est EGA 4 §8 où il est établi
que si S est un schéma de base (quasi-compact quasi-séparé probablement),
Y un schéma de présentation finie, X_a un système projectif de S-schémas
affines indexé par un ensemble ordonné filtrant, alors on peut définir
la limite projective X de X_a, et alors se donner un S-morphisme X -> Y,
c'est pareil que se donner un S-morphisme X_a -> Y pour a suffisamment
grand (EGA 4 8.13.1). On applique cela avec (X_a) le système des
voisinages ouverts affines du point générique x, la limite projective
des X_a est le spectre du corps K(X). Le point-clef ici, c'est que si
f:Spec K(X) -> Y est un morphisme, l'image de f est contenue dans un
ouvert affine Spec A, avec A une algèbre de présentation finie, f
correspond à un morphisme A -> K(X). Si U=Spec B est un ouvert affine
non vide de X, A -> K(X) est un morphisme A -> Frac(B), comme A est de
présentation finie, cela se factorise en A -> B[1/x_1,...,1/x_n] ->
Frac(B) pour un certain ensemble fini d'éléments non nuls x_1,...,x_n de
B...

------------------

Dam's, dans le message (sciences.maths.avancees:1355), a écrit :
>> référence absolue pour ce genre de question est EGA 4 §8 où il est établi
>> que si S est un schéma de base (quasi-compact quasi-séparé probablement),
>> Y un schéma de présentation finie, X_a un système projectif de S-schémas
>> affines indexé par un ensemble ordonné filtrant, alors on peut définir
>> la limite projective X de X_a, et alors se donner un S-morphisme X -> Y,
>> c'est pareil que se donner un S-morphisme X_a -> Y pour a suffisamment
>> grand (EGA 4 8.13.1).
>
> Hum, je n'ai pas du comprendre grand chose, car je ne vois pas où tu
> appliques le théorème :(

Ce résultat dit précisément que la limite inductive des
Hom(X_a,Y) s'identifie à Hom(lim.proj X_a, Y) où lim.proj X_a, c'est
le spectre de la limite inductive des anneaux associés à X_a,
c'est-à-dire Spec K(X).

> Et là, pourquoi est-ce que tu as besoin de supposer A de présentation
> finie pour avoir la factorisation voulue? A de type finie n'est pas
> suffisant?

Je parle du point-clef de la démonstration, que j'aurais pu insérer ans
n'importe quel rant sur EGA 4 §8. Dans le cas précis où le système
projectif de schémas est formé des ouverts affines non vides d'un schéma
irréductible, il suffit en effet de demander que A soit de type fini. Si
A est présentée sous la forme C[T_1,...,T_n]/I où C est un anneau de base
et I un idéal, si on a un morphisme C[T_1,...,T_k]/I -> K(X), on peut
relever cela en C[T_1,...,T_k] -> B[1/x_1,...,1/x_n] en ajoutant
suffisamment de dénominateurs, les éléments de I sont automatiquement
envoyés sur zéro puisque B[1/x_1,...,1/x_n] s'injecte dans K(X). Dans une
situation plus générale où K(X) serait une limite inductive filtrante un
peu plus abstraite d'anneaux B_a, on obtiendrait un relèvement
C[T_1,...,T_k] -> B_a, mais a priori, les relations données par les
éléments de I ne seraient pas forcément satisfaites, il faudrait composer
avec B_a -> B_a' pour a'>=a suffisamment grand pour annuler une relation
donnée par un élément de I ; si I est un idéal de type fini, on peut
trouver un a' qui marche pour tous les éléments d'un système de
générateurs, ce qui donnerait le morphisme voulu C[T_1,..,T_k]/I ->
B_{a'} pour a' suffisamment grand. En outre, si g,g':C[T_1,...,T_k]/I ->
B_a sont deux morphismes, les composés C[T_1,...,T_k]/I -> B_a -> limite
inductive des B_a coïncident si et seulement s'il existe un a' >= a tel
que les composés C[T_1,...,T_k]/I -> B_a -> B_a' coïncident, etc. Bref,
la bonne hypothèse à retenir dans ce genre de passages à la limite, c'est
« de présentation finie » ; il se trouve que là, cela fonctionne avec
simplement « de type fini ».

Produits
========

Si X et Y sont deux variétés intègres sur k alg clos, alors leur produit
est une variété intègre (si X est recouvert par les Spec A_i et Y par les
Spec B_j, alors XxY est recouvert par les Spec A_i \tens Spec B_j), et O_(x,y)
est le localisé de O_x \tens O_y en l'idéal maximal m_x O_y + m_y O_x.
De plus, si x est dans Spec A et y dans Spec B, alors la cloture de (x,y)
correspond à l'idéal du noyau A \tens B -> O_(x,y)/m_x,y

Sciences.maths.avancees         Message  1160
Date: Wed Dec 7 22:52:34 2005
Auteur: Joel Riou (joel.riou) [jriou]
Réponse à: Dam's (robert) [1160]                                        /o-o-o
(suite) -Sujet: Re: produit de schemas irreductibles/connexes/[...]    o-@

Dam's, dans le message (sciences.maths.avancees:1160), a écrit :
> Géométriquement, c'est assez clair, mais je ne sais pas trop quel genre
> d'arguments utiliser. Et algèbriquement je n'y arrive pas...

Le problème avec « irréductible », « connexe » et « réduit », c'est que
ce sont des notions absolues, pas des propriétés des morphismes de
schémas, ou moins incompréhensiblement, des schémas au-dessus d'une base
donnée. De fait, la théorie de Galois donne des contre-exemples aux
énoncés X/k et Y/k irréductible (resp. connexe) => X ×_k Y irréductible
(resp...), dès que k n'est pas séparablement clos. Pour k=F_p ou k=Q, le
produit fibré sur k ou le produit « absolu » (i.e. sur Spec Z), c'est
pareil. Yves a donné un contre-exemple pour réduit.

David avait proposé une définition de morphisme « connexe », pour en
faire une propriété relative [il s'agissaitt plutôt d'une notion relative
de « connexe et non vide »]. Tautologiquement, si on avait X -> Spec Z
connexe et Y -> Spec Z un morphisme quelconque, on avait X × Y -> Y
connexe, et la composée X × Y -> Spec Z était connexe si Y -> Spec Z
était aussi supposé connexe.

> D'ailleurs ça me fait penser à ceci: j'ai envie de dire qu'un anneau A est
> réduit ssi il est réduit en chaque localisé (par un idéal maximal).
>
> Algébriquement, on peut voir ça comme ça: je suppose de plus A
> noéthérien. Alors son nilradical peut s'écrire comme intersection finie
> des idéaux premiers minimaux. Comme les intersections finies commutent à
> la localisation (car la localisation est un produit tensoriel), on voit
> que Nilrad_(m) = Intersection des idéaux premiers minimaux contenus dans
> m (car les autres donnent lieu à tout A_(m))= Nilrad de A_(m).
>
> Donc Nilrad est nul ssi il est nul dans tous les localisés (car il est de
> type fini) ssi tout localisé est réduit.
>
> (tiens géométriquement on pourrait dire ça comment? IL est assez clair
> qu'une fonction qui est nilpotente localement est nilpotente globalement
> par quasi-compacité, qu'une fonction nilpotente est nilpotente
> localement, et son germe est non nul en au moins un point, donc il y a un
> localisé qui est non réduit, et enfin si un localisé est non réduit, on
> trouve une fonction nilpotente au voisinage D(f) d'un point, on peut
> l'étendre en la multipliant par f^n en une section globale, mais rien ne
> nous dit que la section obtenue est nilpotente globalement...).

Tu as un élément de la forme s/f^n qui est nilpotent dans A[1/f], cela
veut dire qu'on a, pour un certain entier N, s^N/f^{nN} = 0 dans A[1/f],
ce qui signifie qu'il existe r tel que f^r s^N = 0 dans A, (s.f^?) pour
une bonne valeur de ? est nilpotent et non nul puisque diffère de s par
une unité dans A[1/f].

> Question subsidiaire: que se passe t'il maintenant si je regarde les
> produits au-dessus d'un autre schéma (affine)?

Les contre-exemples évidents pour irréductible/connexe sont au-dessus
d'une base. Pour réduit, on peut aussi en fabriquer si on considère un
corps imparfait k, E une extension algébrique finie qui n'est pas
séparable, il existe alors une extension k'/k finie telle que E tenseur
k' ait des éléments nilpotents (la négation de cette assertion est une
caractérisation des algèbres étales sur k, E ne l'est pas puisqu'elle est
inséparable).

Maintenant, au-dessus d'un corps algébriquement clos k (ce qui est un
sens possible de l'adverbe « géométriquement »), le produit sur k de deux
schémas X et Y irréductibles (resp. réduits, connexes) est itou ; c'est
classique, mais non « trivial », cela doit utiliser le Nullstellensatz
quelque part... Pour « irréductible » et « connexe », cela se voit bien
quand on sait que X peut être décrit en termes de la topologie de Zariski
sur X(k) ; pour « réduit », c'est un exercice. [On peut généraliser ce
cas au cas des morphismes X -> S « à fibres géométriquement réduites
(resp...) », un produit au-dessus de S de deux schémas vérifiant cette
condition relative satisfait encore cette propriété.]

Schémas réduits
===============

Remarque sur les schémas réduits: sciences.maths.avancees  Message  670

Soit X un schéma.
On définit le schéma réduit Xréd comme étant le sous-schéma fermé de X
induit par le faisceau quasi-cohérent qui a U associe le nilradical de
O(U). (enfin on va dire X schéma noéthérien pour être sûr que ce machin
là est bien un faisceau).

Donc le faisceau structural de Xréd associe à un ouvert _affine_ U l'anneau
O(U)/Nilrad (de O(U)) (car le foncteur section globales est exact sur les
ouverts affines). Est-ce que c'est également vrai pour n'importe quel ouvert?

Réponse: a priori non, mais le contreexemple de Joel est pour un idéal qui n'est pas le Nilradical.

Rem: si X n'est pas noethérien:
si on note I(U)=nilradical de O(U), on obtient un préfaisceau qui n'est pas
forcément est faisceau : le bon Idéal est l'idéal Nilrad qui à U associe
l'ensemble des éléments de O(U) qui sont *localement* nilpotents (en effet, sur
l'union disjointe des Spec Z[X]/X^n, la section globale qui vaut « X » sur
chaque composante, donne 0 dans le schéma réduit associé, mais n'est pas
nilpotente au départ).

Math Overflow
=============

Intersection: http://mathoverflow.net/questions/52665/survey-article-on-intersection-theory

* Divisors
http://math.stackexchange.com/questions/120935/divisor-associated-to-a-rational-map

http://mathoverflow.net/questions/77691/properties-of-morphisms-induced-by-divisors-on-curves

There are a few properties from Hartshorne IV on curves that I am trying to
verify. Let D be an effective divisor on a curve (integral scheme of
dimension 1, proper over k, regular) X, dim|D|=1, and f the induced
morphism to P1.

The degree of D is the degree of f, where deg(f)=[K(X):K(P1)].
In lemma IV.4.2, Hartshorne seems to claim that all points in the support
of D are in the same fiber.
Again in lemma IV.4.2, Hartshorne seems to claim that if [K(X):K(P1)] is
Galois, then an automorphism of the Galois group permutes elements of the
fiber.

Your first question is already answered. For the second, by definition,
f(P)=D′ where D′ is the unique effective divisor linearly equivalent to D
with D′≥P. So it is clear that f(P)=D if P is in the support of D. The
third question is similarly straightforward. – Felipe Voloch Oct 10 '11 at
17:54
Ah this makes so much more sense! I was not aware of the "definition" you
mentioned; if it's in Hartshorne then I missed it. So for the third, the
action of a Galois element fixes the elements of P1, which I'm identifying
with effective divisors linearly equivalent to D. Since these divisors also
define the fibers of my map, it must be that the fibers are permuted. –
rghthndsd Oct 11 '11 at 17:38

* On finite covers

http://mathoverflow.net/questions/72328/about-maps-induced-for-a-divisor-d-in-p1?rq=1

* Points

Point générique vs point général:
- http://math.stackexchange.com/questions/713061/on-the-use-of-generic-and-general-in-algebraic-geometry
- http://www.konradvoelkel.com/2012/11/schematic-points/

Sur les points génériques au sens de Weil:
- http://www.ams.org/notices/199908/fea-raynaud.pdf
- http://mathoverflow.net/questions/36979/some-arithmetic-terminology-universal-domain-specialization-chow-point
- http://mathoverflow.net/questions/117107/independent-generic-general-points-over-some-prime-field
    In Weil's "Foundations", for each characteristic we fix a universal domain: an abstract field K of infinite transcendence degree over the prime field. A "field" by definition is a subfield k of K over which K has infinite transcendence degree. For Weil, if X is a geometrically integral (and separated) k-scheme of finite type then a point of X is an element x∈X(K) (a k-morphism x:Spec(K)→X). Denoting by [x] the image in X of this k-morphism, Weil says x is generic over X if [x] is its generic point. 
