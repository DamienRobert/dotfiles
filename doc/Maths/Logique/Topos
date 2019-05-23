vim: ft=markdownlight fdm=expr

https://en.wikipedia.org/wiki/Topos#Elementary_topoi_(topoi_in_logic)

forum
=====

Topos
-----

From madore@clipper.ens.fr Fri Nov  4 14:58:55 2005
Article: 1109 of ens.forum.sciences.maths.avancees

S. MacLane & I. Moerdijk, *Sheaves in Geometry and Logic*, Springer.

J. Lambek & P. J. Scott, *Introduction to Higher-Order Categorical
Logic*, CUP.

P. Taylor, *Practical Foundations of Mathematics*, CUP.


Un topos, il me semble que tu sais ce que c'est : une catégorie
cartésienne close (= admet les limites finies - certains demandent
toutes les petites limites, mais peu importe - et des exponentielles,
i.e., (A,B)->A×B a un adjoint à droite par rapport à une de ses
variables) dans laquelle il existe un classificateur de sous-objet,
i.e., le foncteur « ensemble des sous-objets » (un sous-objet étant
une classe d'équivalence de monomorphismes) est représentable par un
objet Omega, dit objet des valeurs de vérité.  Par exemple, la
catégorie des faisceaux sur un espace topologique (ou, plus
généralement, sur une topologie de Grothendieck) est un topos (l'objet
des valeurs de vérité est le faisceau « parties ouvertes ») ; il y a
deux constructions fondamentales de topoï, à savoir le topos des
faisceaux sur une topologie de Lawvere-Tierney (généralise
Grothendieck : en gros, Grothendieck c'est Lawvere-Tierney sur le
topos des préfaisceaux) et le topos des cogèbres sur une comonade
exacte à gauche (ou à droite, je ne sais jamais).

Le rapport avec la logique, c'est que quand tu as un topos T tu peux
considérer le langage (je crois que ça doit s'appeler le langage de
Mitchell-Bénabou) qui est le calcul des prédicats du 1er ordre typé
par les objets de T et tu as une interprétation naturelle dans T des
énoncés de ce langage (disons que par récurrence sur la complexité tu
associes à tout énoncé ayant des variables libres de types U_1,...,U_n
(objets de T) une flèche U_1×...×U_n -> Omega, i.e., un sous-objet de
U_1×...×U_n, en gros l'« ensemble des valeurs où l'énoncé est vrai »).
Cette sémantique, dans le cas du topos des faisceaux sur une catégorie
de Grothendieck, s'exprime de façon assez élégante par une relation de
forcing (sémantique dite de Kripke-Joyal, page 8 de mon mémoire de
magistère <URL: http://www.madore.org/~david/math/rapp_mag.ps.gz >)
qui généralise le forcing classique à la Cohen.  Donc au moins tout ce
qu'on peut faire avec le forcing classique est faisable avec de
forcing intuitionniste ; mais on peut aussi montrer d'autres résultats
d'indépendance avec, par exemple de l'axiome de Brouwer (« toute
fonction réelle est continue » : c'est vrai dans le tropos des
faisceaux sur le « gros site » des espaces topologiques).


Cf. aussi le thread partant du message <a58lsv$jkm$1@clipper.ens.fr>
aka maths:5928, ainsi sans doute que plein d'autres messages que j'ai
dû écrire à plein d'endroits différents...

Topologies de Lawvere-Tierney
-----------------------------

From madore@clipper.ens.fr Sat Feb 23 19:09:35 2002
Article: 5928 of ens.forum.sciences.maths

Bon, les enfants, puisque forum semble tout à fait mort ce week-end (y
aurait-il par hasard des vacances la semaine prochaine ?) et puisque
j'ai mentionné ça récemment, papa Gro-Tsen va vous parler des
topologies au sens de Lawvere-Tierney (comme la topologie du non-non).

Que nul n'entre ici s'il ne vérifie au moins deux des trois conditions
suivantes : (a) être géomètre (algébriste, bien sûr, mais y en a-t-il
d'autres ?), (b) être logicien, (c) être catégoricien.  Bon, en fait,
c'est pas vrai, les autres peuvent rentrer, mais c'est à leurs risques
et périls.  En théorie, seules des connaissances minimales de théorie
des catégories sont nécessaires pour comprendre ce post ; en pratique,
on risque de ne pas voir grand-chose à « ce qui se passe ».


Alors ça commence avec Grothendieck qui a défini les topologies de
Grothendieck et les catégories de faisceaux pour celles-ci.
Résumons : si C est une catégorie, un préfaisceau sur C est simplement
un foncteur contravariant de C vers les ensembles (et le lemme de
Yoneda nous dit qu'on peut identifier C comme la sous-catégorie pleine
des préfaisceaux représentables) ; mais pour définir un faisceau il
faut savoir quand une famille de flèches ayant un même but sont
censées couvrir ce but, c'est-à-dire permettre la descente sur le
candidat-faisceau.

Grothendieck définit les cribles de but X (où X est un objet de C)
comme les familles de flèches de but X stables par composition à
droite quand cela a un sens ; en termes sophistiqués, un crible de but
X est un sous-objet du préfaisceau représenté par X.  Moralement, un
crible de but X, c'est un candidat à recouvrir X ; notons que si S est
un crible de but X et h une flèche Y->X, on peut tirer S par h (en un
crible h^*S de but Y) en disant qu'une flèche de but Y est dans h^*S
ssi sa composée par h est dans S.

Une topologie de Grothendieck sur C, c'est la donnée pour tout objet X
de C d'un ensemble J(X) de cribles de but X, dits « cribles
(re)couvrant X » tels que (i) le crible de toutes les flèches de but X
recouvre X (i.e. est dans J(X)), (ii) si S est un crible couvrant de
but X (i.e. S est dans J(X)) et h:Y->X une flèche quelconque, alors
h^*S est un crible couvrant de but Y, et (iii) si S est un crible
couvrant de but X, et R un crible de but X tel que pour tout élément h
de S (qui est donc une flèche de but X, disons de source Y) le crible
h^*R soit couvrant (pour son but Y) alors le crible R est couvrant (de
but X).

Exercice : pour toute topologie de Grothendieck, on a les propriétés
(iv) tout crible plus fin qu'un crible couvrant (i.e. contenant un
crible couvrant) est couvrant, et (v) l'intersection de deux cribles
couvrants de même but X et couvrante.

On dira qu'une flèche h:Y->X est couverte par un crible S de but X
lorsque h^*S (qui est un crible de but Y) recouvre Y : cette
définition permet de reformuler les axiomes (i), (ii) et (iii) sous
une forme un peu plus parlante.  À savoir (ia) un crible couvre toute
flèche qu'il contient, (iia) si S couvre une flèche h:Y->X alors il
couvre hg pour toute flèche g:Z->Y, et (iiia) si S couvre une flèche h
et que R est un crible couvrant toute flèche de S, alors R couvre h.

Moralement, (i) dit que X est recouvert par lui-même ; (ii) dit qu'un
pullback d'un recouvrement est encore un recouvrement ; et (iii) dit
que si X est recouvert par des machins qui sont eux-mêmes recouverts
par des bidules, alors X est recouvert par les bidules pour commencer.

Toute famille de flèches ayant un but commun engendre un crible, à
savoir toutes les composées à droite d'une flèche de la famille par
une flèche quelconque (ayant pour but la source de la flèche de la
famille).  On dira bien sur qu'une famille de flèches ayant un même
but recouvre ce but (resp. recouvre une autre flèche ayant ce but)
lorsque le crible qu'elles engendrent a cette propriété.  Là,
Grothendieck part dans des délires sur les prétopologies et suppose
sans aucune bonne raison que ses catégories admettent des produits
fibrés ou je ne sais quoi du genre : passons, c'est sans intérêt.

Une fois qu'on a la notion de topologie de Grothendieck, donc de
recouvrement, on peut définir les faisceaux : un faisceau F sur C
(muni d'une topologie de Grothendieck J) est un préfaisceau sur C
(rappelons que c'est juste un foncteur contravariant de C vers les
ensembles) qui a la propriété que pour tout crible S couvrant un objet
X, le diagramme de descente habituel (qui envoie l'ensemble F(X) des
sections de F sur X sur le produit des F(dom f) avec f dans S et de
deux façons différentes sur le produit des F(dom g) avec g une flèche
de but dom f et f dans S ; dom f désigne la source de la flèche f) est
exact.  Autrement dit, F est un faisceau ssi les sections de F sur X
correspondent exactement aux matching families de F pour le crible S,
et ce, pour tout crible S couvrant un objet X.  De façon plus
sophistiquée (i.e. ne lisez pas la fin de cette phrase si vous n'êtes
pas un Gentil Guignol), on peut voir qu'un crible S de but X n'est
autre qu'un sous-objet du préfaisceau « yonedesque » Hom(·,X)
représenté par X, une matching family n'est autre qu'une
transformation naturelle S->F de S (vu comme préfaisceau sur la
catégorie C) et F, et un préfaisceau F est un faisceau ssi la
transformation naturelle S->Hom(·,X) d'inclusion induit un
isomorphisme F(X)=Hom(Hom(·,X),F)->Hom(S,F).

Bon, tout ça c'est du Grothendieck, donc si vous vous appelez Luc
Illusie ou Joël Riou, vous savez déjà.


Ce qui a complètement échappé à Grothendieck, en revanche (et il
paraît qu'il a été vert quand on le lui a signalé), mais que Lawvere
et Tierney ont vu, c'est l'importance du faisceau Omega, également
appelé le classificateur de sous-objet.

Commençons par le cas des faisceaux sur un ensemble topologique tout
bête, euh, appelons-le U.  Alors Omega est le faisceau qui à un ouvert
V de U associe l'ensemble des ouverts W de V (i.e. des ouverts W de U
inclus dans V) ; et l'application de restriction est ce qu'on pense :
si V' est un ouvert inclus dans V, on envoie Omega(V) dans Omega(V')
en intersectant W dans Omega(V) avec V'.  La fait que Omega est un
faisceau est clair : si V est recouvert par des ouverts V_i, et que
dans chaque V_i on se donne un ouvert W_i avec W_i\inter V_j =
V_i\inter W_j, il est clair qu'il existe un unique ouvert W de V
(viz. l'union des W_i) qui intersecté avec chaque V_i donne W_i.  Si G
est un sous-faisceau d'un faisceau F sur U, on peut lui associer une
flèche F->Omega comme ceci : si s est une section de F sur un ouvert V
de U, on envoie s sur le plus grand ouvert W inclus dans V pour lequel
la restriction de s à W soit une section de G.  Moralement, donc,
Omega est le faisceau des ouverts de U, et la flèche F->Omega est la
flèche « sur quel ouvert est-il vrai que G coïncide avec F ? ».

Passons à la catégorie des préfaisceaux sur une catégorie C.  Cela
revient au même que la catégorie des faisceaux pour la topologie
grossière (celle pour laquelle seul le crible plein recouvre son but).
Alors Omega est un préfaisceau sur C qui associe à tout objet X de C
l'ensemble des cribles de but X ; et à toute flèche h:Y->X
l'application qui envoie un crible S sur X vers le crible h^*S sur Y.
Si G est un sous-préfaisceau d'un préfaisceau F, on peut lui associer
une flèche F->Omega qui envoie une section s de F sur un objet X de C
sur le crible S sur X dont les éléments sont les h:Y->X la restriction
de s auxquelles est dans G.

Plus généralement, si on se donne une catégorie C munie d'une
topologie de Grothendieck J, on appelle « crible J-clos » un crible
qui contient toute flèche qu'il recouvre : autrement dit, si S est un
crible de but X, il est dit J-clos lorsque pour h:Y->X, si h^*S
recouvre Y alors h est dans S.  En particulier, le seul crible J-clos
(de but X) qui recouvre X est le crible plein.  Manifestement, tout
crible engendre un crible J-clos (en rajoutant à S toutes les flèches
qu'il recouvre : l'axiome (iiia) nous assure qu'on n'a pas à répéter
l'opération).  Moralement, les cribles J-clos sur X sont les
« ouverts » de X pour la topologie de Grothendieck J.  Et justement,
Omega envoie un objet X sur l'ensemble des cribles J-clos de X (et une
flèche h:Y->X sur la flèche h^*, qui si je ne déconne pas trop
transforme un crible J-clos en un autre crible J-clos).  À nouveau, si
G est un sous-faisceau d'un faisceau F, on peut définir une flèche
F->Omega qui envoie une section s de F sur X sur le crible S comme
pour les préfaisceaux, qui a le bon goût d'être J-clos (puisque G est
un faisceau).

La raison de l'importance fabuleuse de cet objet Omega, c'est qu'il
classifie les sous-objets.  Précisément, si T est une catégorie, on
dit qu'un objet Omega de T, muni d'un morphisme *->Omega (où * est
l'objet terminal de T, ce qui sous-entend qu'il existe), est un
« classificateur de sous-objet » lorsque pour tout monomorphisme G->F
dans T il existe une unique flèche F->Omega telle que la flèche G->F
soit pull-back de la donnée *->Omega par la flèche F->Omega (i.e. plus
précisément, le diagramme évident obtenu en mettant la flèche G->* qui
est la seule possible, est cartésien).  On dit que la flèche *->Omega
est « le vrai » (pour une topologie de Grothendieck, elle correspond
au choix du crible plein, qui est J-clos).  Alors Hom(F,Omega) est
naturellement isomorphe à Sub(F) (l'ensemble des sous-objets de F,
i.e. des monomorphismes G->F à isomorphisme près).  Lorsque G->F est
classifié par F->Omega on dit encore que cette dernière flèche est la
« fonction indicatrice » de G dans F.

Lawvere et Tierney appellent « topos élémentaire » une catégorie T
possédant les limites finies, un Hom interne (i.e. on se donne un
foncteur qui à deux objets X et Y de T associe un _objet_ HOM(Y,X)
avec un isomorphisme naturel Hom(Z,HOM(Y,X))->Hom(Z×Y,X)) et un
classificateur de sous-objet comme défini ci-dessus.  La catégorie des
faisceaux sur une catégorie C munie d'une topologie de Grothendieck
(un « site ») est un topos élémentaire.  (Note : dans un topos
élémentaire, donné un objet X, on a un objet HOM(X,Omega) appelé
« l'ensemble des parties de X ».)

Si C est une catégorie munie d'une topologie de Grothendieck J, à un
crible S de but X (un objet de C) on peut associer le crible J-clos
qu'il engendre (défini ci-dessus).  Ceci définit un morphisme
j:Omega->Omega, où Omega est, attention, non le classificateur de
sous-objet pour le topos des faisceaux sur (C,J) mais le
classificateur de sous-objet pour le topos des *préfaisceaux* sur C
(comme on l'a expliqué, pour ce topos, Omega envoie X sur l'ensemble
des cribles de but X ; et j(S) est juste le crible J-clos engendré par
S).  C'est précisément ça une topologie de Lawvere-Tierney.

Pour être précis, si T est un topos élémentaire dont Omega est le
classificateur de sous-objet, une topologie de Lawvere-Tierney sur T
est la donnée d'un morphisme j:Omega->Omega, vérifiant les trois
propriétés suivantes (qui correspondent exactement aux trois axiomes
des topologies de Grothendieck, cf. *supra*) : (iLT) j·vrai=vrai, où
vrai:*->Omega est le vrai (défini ci-dessus avec le classificateur de
sous-objet), (iiLT) j·j=j, et (iiiLT) j·&=&·(j×j), où &:Omega²->Omega
est le morphisme « et » qui peut être défini de diverses façons
(cf. plus bas), par exemple en disant que le sous-objet de Omega²
qu'il classifie est le produit de vrai:*->Omega avec lui-même (dans le
cas d'un topos de préfaisceaux, &:Omega²->Omega fait juste
l'intersection de deux cribles de même but, et la propriété (iiiLT)
traduit le fait que la J-clôture d'une intersection de deux cribles
est l'intersection des J-clôtures).

Donnée une topologie de Lawvere-Tierney j:Omega->Omega sur un topos T,
on appelle j-clôture d'un sous-objet H->G d'un objet G de T le
sous-objet de G dont la fonction indicatrice est la composée
G->Omega->Omega de celle de H avec j ; la j-clôture H' factorise le
monomorphisme H->G en H->H'->G ; on dira que le monomorphisme H->G est
j-couvrant lorsque H'->G est l'identité (enfin, est un isomorphisme) ;
ainsi, tout monomorphisme se H->G se factorise en H->H'->G avec H->H'
un monomorphisme j-couvrant et H'->G un monomorphisme j-clos.  Et on
dira qu'un objet F de T est un faisceau pour la topologie de
Lawvere-Tierney j lorsque pour tout monomorphisme j-couvrant H->H'
dans T l'application Hom(H',F)->Hom(H,F) obtenu par composition est
une bijection.

Le fait important est que si T est un topos (élémentaire) muni d'une
topologie de Lawvere-Tierney j, la sous-catégorie pleine formée des
faisceaux pour la topologie j est elle-aussi un topos ; et le foncteur
d'inclusion de cette sous-catégorie vers T, admet un adjoint a gauche
(appelé foncteur « faisceau associé »), lequel est exact à gauche (en
plus d'être exact à droite).  Le classificateur de sous-objet du topos
des faisceaux du topos T est l'égalisateur des flèches j:Omega->Omega
et id:Omega->Omega.  De plus, si T est le topos des préfaisceaux sur
une catégorie C, alors (a) les topologies de Lawvere-Tierney sur T
correspondent exactement aux topologies de Grothendieck sur C, (b) les
faisceaux pour une topologie de Lawvere-Tierney sur T sonc exactement
les préfaisceaux qui se trouvent être des faisceaux pour la topologie
de Grothendieck associée sur C, et (c) le foncteur faisceau associé
est le même (ce qui est clair vue sa définition comme adjoint à gauche
du foncteur d'inclusion).  Ouf !


Si T est un topos élémentaire et Omega son classificateur de
sous-objet, on peut définir des flèches sur Omega correspondant aux
connecteurs logiques.  Il y a plein de façons de faire ça.  Par
exemple, puisque Omega classifie les sous-objets, il suffit en gros de
faire les opérations sur les sous-objets : l'opération d'intersection
(i.e. de produit fibré) définit ainsi le « et » logique Omega²->Omega
(noté « & » ci-dessus).  Le « vrai » (*->Omega) est donné par
hypothèse.  Pour l'implication, je peux par exemple dire que « p=>q »
signifie « (p&q)=p », où bien sûr le « = »:Omega²->Omega est la
fonction indicatrice de la diagonale Omega->Omega².  Pour le « faux »
(*->Omega), voici une façon démoniaque de procéder : je prends la
fonction constante Omega->Omega de valeur « vrai » (soit
Omega->*->Omega où la 2e flèche est le « vrai »), qui me détermine une
flèche *->HOM(Omega,Omega) par la propriété universelle du Hom
interne ; de même j'ai une flèche *->HOM(Omega,Omega) déterminée par
l'identité Omega->Omega ; et je prends à nouveau l'égalité de ces
flèches, c'est-à-dire que la diagonale HOM(Omega,Omega) ->
HOM(Omega,Omega) a une fonction indicatrice HOM(Omega,Omega)²->Omega
et appliquée aux deux flèches *->HOM(Omega,Omega) construites
j'obtiens *->Omega qui est justement le « faux ».  Une façon plus
« morale » de construire le « faux » est de dire que T a forcément un
objet initial, 0, et que l'unique morphisme 0->* a une fonction
indicatrice *->Omega appelée le « faux » (mais ça demande de montrer
que T a un objet initial, ce qui n'est certes pas dur, mais en fait
c'est en gros ce que j'ai fait dans la démonstration précédente).  De
même, il y a une façon diabolique et d'autres moins diaboliques pour
construire le « ou », je vous l'épargne ainsi que les quantificateurs.
Muni de ces diverses opérations (le vrai, le faux, le et, le ou, et
l'implication), Omega constitue ce qu'on appelle une algèbre de
Heyting complète interne dans la catégorie T (une algèbre de Heyting
est à la logique intuitionniste ce qu'une algèbre de Boole est à la
logique classique).  Le « non » logique se définit comme « implique
faux » (i.e. « ~x » = « x=>faux »), ou, ce qui revient au même, comme
« égal faux ».

Une fois qu'on a défini non:Omega->Omega, on a en particuler la
composée de cette flèche avec elle-même, soit non·non:Omega->Omega.
Le fait fondamental est le suivant :

		    La flèche non·non:Omega->Omega
			  est une topologie
		   (au sens de Lawvere et Tierney)

(et le topos des faisceaux pour cette topologie est « booléien »,
c'est-à-dire que tout monomorphisme G->F y est scindé : il existe un
monomorphisme G'->F pour lequel G+G'->F est un isomorphisme).

Ça peut être utile de dérouler les définitions dans le cas d'un espace
topologique U.  Dans ce cas, comme je l'ai signalé, si V est un ouvert
de U, alors Omega(V) est l'ensemble des ouverts de V.  On vérifie
facilement que vrai:*->Omega est l'ouvert U tout entier, que
faux:*->Omega est l'ouvert vide, que &:Omega²->Omega est l'opération
d'intersection, que non:Omega->Omega associe à un ouvert W de V le
plus grand ouvert de V disjoint de W, et donc que non·non:Omega->Omega
associe à un ouvert W de V l'intérieur de l'adhérence de W dans V.  Et
si j=non·non, les monomorphismes *->Omega qui sont j-clos sont les
ouverts réguliers de U.  Ainsi, un faisceau F sur U est un faisceau
pour la topologie du non-non lorsque, donné un ouvert V de U, et V'
l'intérieur de son adhérence, la flèche de restriction F(V')->F(V) est
une bijection.  On retrouve le fait (bien connu ?) que l'ensemble des
ouverts d'un espace topologique forme une algèbre de Heyting complète
et l'ensemble des ouverts réguliers une algèbre de Boole complète qui
est universelle pour je ne sais quelle propriété par rapport à
l'algèbre de Heyting de tous les ouverts.

L'importance fondamentale de la topologie du non-non, c'est tout
simplement que c'est elle qui permet de retrouver la notion de forcing
« classique » à partir de la logique interne des topoi (sémantiques de
Kripke-Joyal, que je n'ai pas vraiment envie de redéfinir ici, je l'ai
fait d'autres fois).

--
David, qui vient de résumer un bout important de ce que j'aurais voulu
traiter dans mon groupe de travail d'il y a trois ans.

--------------------------------------------------------------------------\

From madore@clipper.ens.fr Sat Mar  9 16:21:48 2002
Article: 6001 of ens.forum.sciences.maths

129.199.72.99 in litteris <a6aad4$r3r$2@clipper.ens.fr> scripsit:
> Gro-Tsen, dans le message (sciences.maths:5928), a écrit :
>> Grothendieck part dans des délires sur les prétopologies et suppose
>> sans aucune bonne raison que ses catégories admettent des produits
>> fibrés ou je ne sais quoi du genre : passons, c'est sans intérêt.
>
> Mais, qu'est-ce qu'il t'a fait Grothendieck ? Déjà si Joël dit que ça
> a un intérêt technique, il doit avoir raison :-). Mais c'est vrai que
> pédagogiquement, c'est quand même mieux de parler de prétopologies
> d'abord. Moralement, le site c'est la catégorie des ouverts où l'on fait
> des identifications un peu plus étranges que pour un espace topologique
> quelconque. Dans un premier temps, il serait quand même bon de supposer
> que ces ouverts sont stables par intersection finie, ce qui est exactement
> la stabilité par produits fibrés, surtout que la condition de faisceaux
> fait explicitement intervenir l'intersection. La stabilité par réunion
> quelconque correspond, elle, plus ou moins précisément à la notion de
> recouvrement.

Mon objection ne concerne pas la présentation elle-même, mais le fait
d'introduire la terminologie « prétopologie » au lieu de parler
bêtement de la topologie engendrées par telles familles couvrantes.

Mais, bon, passons, ce débat n'a vraiment pas d'intérêt.

>> Passons à la catégorie des préfaisceaux sur une catégorie C.  Cela
>> revient au même que la catégorie des faisceaux pour la topologie
>> grossière (celle pour laquelle seul le crible plein recouvre son but).
>
> Tiens pourquoi on appelle ça la « topologie grossière » ? Comme me l'a
> fait remarquer Vincent, pour les espaces topologiques, cela ne correspond
> pas à la topologie grossière telle qu'on la connaît. Je suis d'accord que
> c'est celle qui fait en sorte que tous les préfaisceaux sont en fait des
> faisceaux mais le nom n'est-il pas mal choisi ?

Oui, ce nom est parfaitement mal choisi, nous sommes d'accord.  Il
s'agit ici de la difficulté qu'il y a à couvrir des choses, ce qui est
très différent du nombre d'ouverts (ce que mesure la « discrètude » au
sens topologique habituel).  Il vaudrait sans doute mieux parler de la
topologie la plus large et la plus étroite, ou quelque chose comme ça.

(À l'autre extrême, on a d'une part la topologie pour laquelle tout
recouvre tout, y compris le crible vide, et alors le seul faisceau est
le préfaisceau singleton ; et d'autre part la topologie, que MacLane
et Moerdijk appellent « atomique » pour laquelle toute flèche recouvre
son but, autrement dit les cribles _non vides_ sont tous couvrants, ce
qui est quand même un peu moins violent, et alors, si la catégorie est
faiblement connexe (et non vide), je pense, les seuls faisceaux sont
les préfaisceaux constants.  Or, justement, les préfaisceaux constants
sont précisément les faisceaux sur un espace topologique _grossier_
(non vide).  Bref, c'est un peu l'autre extrême qui ressemble.  Enfin,
bon, je peux me tromper, c'est un peu pénible de raisonner sur ces cas
dégénérés.)

> Oui, bon soit... Je ne vois pas trop la moralité du HOM mais bon, si
> tu le dis.

Le HOM interne est absolument fondamental.

Il faut se dire qu'un topos, c'est censé être ce qui ressemble à une
théorie des ensembles intuitionniste.  Or une des constructions
fondamentales de la théorie des ensembles, c'est de prendre l'ensemble
des fonctions de X vers Y.  Ce qui peut éventuellement se définir à
l'aide de l'ensemble des parties, mais on peut faire pareil dans un
topos : il suffit de pouvoir construire P(X)=HOM(X,Omega) pour tout X
pour pouvoir construire HOM(X,Y) pour tous X et Y (en gros, HOM(X,Y)
peut se voir comme une « partie », c'est-à-dire un sous-objet, de
P(X×Y), les graphes des relations entre X et Y, qui vérifient la
condition d'être une fonction) ; donc HOM(X,Y) et P(X) se construisent
mutuellement.

L'autre chose, c'est que tu as de toute façon un Hom externe (un topos
est une catégorie) et ce serait très bizarre que les morphismes de X
vers Y ne pussent pas se représenter par un objet dans le topos.  Ça
contredirait la censée stabilité du topos par toutes sortes
d'opérations naturelles.  Tu peux bien regarder Hom(X×U,Y) et faire
varier U, et c'est quand même très naturel de se demander si c'est
représentable, et, sinon, c'est vraiment qu'il y a un problème.

Par ailleurs, les HOM internes sont très sympathiques.  On a bien sûr
des morphismes de composition HOM(X,Y)×HOM(Y,Z)->HOM(X,Z) et toutes
sortes de choses comme ça.  Et pour définir un objet en groupes dans
un topos, tu fais quoi ?  Tu fais exactement la définition pour les
ensembles : un groupe est un ensemble G muni d'une loi de composition
G×G->G, d'un neutre *->G et d'une loi inverse G->G vérifiant ce qu'il
faut ; donc un objet en groupes est un objet G dans le topos qui
possède les flèches correpondantes ; mais ces flèches, tu peux encore
les voir comme des flèches de * (l'objet terminal) vers HOM(G×G,G), G
et HOM(G,G) respectivement ; et ensuite tu vois qu'en fait la
définition d'un objet en groupe est complètement interne, et
exactement semblable à celle sur les ensembles.  Autrement dit, le HOM
assure que tout se passe parfaitement bien.

Avec un point de vue plus abstrait et fumé, le Hom dans une catégorie
permet de parler de flèches dans cette catégorie, tandis que le HOM
interne permet de parler de flèches ayant des variables libres dans la
catégorie.  En tout cas, l'existence du HOM interne est nécessaire
pour donner un sens aux sémantiques de Kripke-Joyal (qui déterminent
une valeur de vérité aux affirmations de la logique du premier ordre
intuitionniste dans un topos).

> Tiens, sinon je pense que si on prend des faisceaux non pas à valeurs
> dans la catégorie des ensembles mais dans une catégorie quelconque
> admettant des limites projectives finies pour avoir les bonnes hypothèses,
> ça n'a pas l'air de marcher et justement à cause de ce HOM combiné au
> classification de sous-objets ? Je raconte n'importe quoi ou pas ?

C'est bien ça.  Les topoi sont censés émuler la théorie des ensembles,
pas n'importe quelle catégorie.  Comme les groupes ne forment pas un
topos, il est clair que les faisceaux de groupes ne vont pas former un
topos.  En revanche, on peut prendre les objets en groupe(s?) dans un
topos, et ça forme une catégorie qui correspond aux faisceaux de
groupes si le topos était le topos des faisceaux d'ensembles sur un
certain site.

(Donc, bien sûr, les faisceaux de groupes pour une topologie de
Lawvere-Tierney, ce sont les objets en groupes du topos des faisceaux
(« d'ensembles », whatever that means) pour la topologie de
Lawvere-Tierney en question.)

Quand on veut raisonner sur les faisceaux de groupes, il suffit de
raisonner sur les groupes en logique intuitionniste.

> D'accord... donc comme tu l'as dit moralement Omega explique ce que sont
> les ouverts, j explique comment on les réunit et & comment on les
> intersecte, c'est bien ça ? Les propriétés que tu donnes sont ma foi
> très naturelles, j'admets.

Disons qu'en gros le terme de « topologie de Lawvere-Tierney » est
peut-être mal adapté.  La topologie c'est le topos.  L'idée de
Lawvere-Tierney, c'est qu'on peut oublier tout ce qui est topologie de
Grothendieck, recouvrement, etc, et ne garder que le topos et
travailler dedans.  La topologie de Lawvere-Tierney, elle sert à
_passer_ d'un topos à un autre, si on veut, à passer d'une topologie à
une topologie moins grossière (modulo le fait que ce terme est très
inadapté comme je l'ai expliqué ci-dessus).  Grothendieck, il ne fait
que passer d'un topos de préfaisceaux à un topos de faisceaux, alors
que Lawvere-Tierney fait des passages plus généraux d'un topos à un
autre.

Le & et le Omega ce sont des données d'un topos.  Le Omega correspond
aux ouverts et le & correspond à faire des intersections (finies)
d'ouverts.  On peut aussi définir des unions d'ouverts avec le ou
logique, que j'ai vaguement expliqué.

Le j, lui, c'est la topologie de Lawvere-Tierney, donc ce n'est pas
inclus dans la donnée d'un topos, c'est un truc qu'on peut lui
rajouter pour former un deuxième topos, un topos de faisceaux.  Ça
correspond à restreindre (à quotienter, quelque chose comme ça) les
valeurs de vérité, donc à admettre plus de recouvrement que le topos
de départ n'en admettait.  Le j prend donc un ouvert (de l'« ancien »
topos, whatever that means) et te donne un autre ouvert (du
« nouveau ») qui est ce qui est recouvert par cet ouvert dans le
nouveau topos.

Hum, il faudrait quand même que je me pose la question de savoir si on
a forcément j(x)>=x pour tout x dans Omega, pour j une topologie de
Lawvere-Tierney quelconque sur un topos quelconque.  (Il y a bien sûr
une relation d'ordre interne dans Omega, qui est une algèbre de
Heyting complète interne dans le topos (enfin, attention quand même,
les relations d'ordre c'est un peu pénible en logique intuitionniste
parce que le passage de >= à > ne préserve pas l'information) ;
c'est-à-dire une partie >= de Omega², i.e. un morphisme
Omega²->Omega...)  Cela voudrait dire que tout ouvert recouvre plus
dans le « nouveau » topos que dans l'« ancien ».

Remarque supplémentaire à la con, pour les logiciens : les axiomes
d'une topologie de Lawvere-Tierney veulent dire précisément que j est
un modalisateur idempotent commutant aux conjonctions finies sur la
logique interne du topos.

> Enfin, je trouverais encore mieux de donner le & a priori plutôt que ces
> limites projectives mais bon peut-être pas en fait, je ne sais pas.

Je ne suis pas sûr de comprendre ce que tu veux dire, mais il est
clair qu'il y a quarante-deux façons de définir un topos
(élémentaire), et dans certaines le &:Omega²->Omega se construit à
partir du reste tandis que dans certaines il est donné.

>> Le fait important est que si T est un topos (élémentaire) muni d'une
>> topologie de Lawvere-Tierney j, la sous-catégorie pleine formée des
>> faisceaux pour la topologie j est elle-aussi un topos ; et le foncteur
>> d'inclusion de cette sous-catégorie vers T, admet un adjoint a gauche
>> (appelé foncteur « faisceau associé »), lequel est exact à gauche (en
>> plus d'être exact à droite).
>
> D'accord, il y a une façon simple de décrire cet adjoint ?

Ça dépend de ta définition de « simple ».  Disons que rien de tout ça
n'est vraiment difficile, mais ça devient quand même de l'Abstract
Nonsense à un niveau suprêmement élevé, et ce n'est pas forcément
facile à écrire ou à lire.

>> 		    La flèche non·non:Omega->Omega
>> 			  est une topologie
>> 		   (au sens de Lawvere et Tierney)
>
> Ah oui c'est sans doute d'une importance hors du commun, tellement
> impressionnante qu'elle ne m'atteint pas :-)... Tu peux un peu détailler
> pour les pauvres petits comme moi qui ne maîtrise pas totalement le
> forcing classique et intuitionniste ?

Si B est une algèbre de Boole complète, le forcing classique (revu par
Solovay) consiste à considérer des « modèles de ZF[C] à valeurs dans
B », chose qu'on peut créer notamment en partant de V_0 = le vide et
en itérant transfiniment la construction V_{alpha+1} = fonctions de
V_{alpha} vers B, puis en donnant une valeur de vérité (dans B) à
« x\in y » et à « x=y » (ce dernier implique de quotienter un peu si
on veut que « x=y » ait valeur Vrai lorsque x est vraiment égal à y)
pour x et y dans cette construction.  Ensuite, tu peux retrouver, si
tu veux, un « vrai » modèle de la théorie des ensembles en quotientant
B par un ultrafiltre générique blablabla, mais déjà au niveau du
modèle à valeurs dans B tu peux prouver tous tes résultats
d'indépendance.

La construction faisceautique de ça, c'est de partir de B (toujours
une algèbre de Boole complète) et de remarquer que B est l'algèbre des
ouverts réguliers d'un certain espace topologique X au sens banal
(rappel : un ouvert régulier est une partie d'un espace topologique
qui est égale à l'intérieur de son adhérence ; l'ensemble des ouverts
réguliers de n'importe quel espace topologique forme toujours une
algèbre de Boole et même probablement complète si je ne délire pas
trop).  Cet espace doit même se construire de façon pas trop difficile
à partir de B.  Ensuite, on part du topos T1 des faisceaux sur X (qui
se déduit de T0 le topos des préfaisceaux sur X par une topologie de
Lawvere-Tierney qui est une topologie au sens habituel) et on
construit T2 le topos des faisceaux sur T1 muni de la topologie du
non-non.  Alors, *en gros*, les objets de T2 doivent correspondre aux
éléments du modèle à valeurs dans B défini ci-dessus (en tout cas, au
moins, ils sont élémentairement équivalents en un sens convenable).

Pour en dire plus, il faudrait définir précisément le forcing dans les
deux cas (forcing classique, et forcing topossique), et quand on le
fait l'analogie saute aux yeux.

-----------------------------------------------------------------------

From madore@clipper.ens.fr Mon Mar 11 16:27:28 2002
Article: 6010 of ens.forum.sciences.maths
Subject: morphismes geometriques, completude, et topoi classifiants (was: Re: Lawvere Tierney)

Plus ou moins.  Personnellement, je trouve que les histoires de points
sur les topoi sont assez pipo et inintéressantes (et largement
introduites parce que Grothendieck n'a inventé que les topologies de
Grothendieck, qui conduisent assez naturellement à privilégier le
topos des ensembles par rapport aux autres topoi élémentaires), mais
je peux quand même dire quelque chose là-dessus.

D'abord, il y a la notion de théorie géométrique (une notion dont je
n'ai jamais vraiment compris l'intérêt, mais il paraît que c'est Super
Important).  Un prédicat géométrique, par définition, c'est une
formule formée (dans un langage quelconque sur la logique du premier
ordre) à partir du vrai, du faux, de la conjonction (finie,
évidemment), de la disjonction (ditto) et de la quantification
_existentielle_ (et, bien sûr, des formules atomiques).  Une théorie
géométrique, c'est une théorie dont tous les axiomes sont de la forme
« pour tous x1,...,xn (P(x1,...,xn) => Q(x1,...,xn)) », où P et Q sont
des prédicats géométriques.  Exemple : les théories des groupes, des
anneaux, sont manifestement géométriques (on n'a même pas besoin de
l'implication, c'est-à-dire du P(...) ci-dessus).  Même la théorie des
anneaux locaux est géométrique, puisqu'on peut l'écrire comme « pour
tous x et y (x+y=1 => x est inversible ou y est inversible) » (et « u
est inversible » est un prédicat géométrique car c'est « il existe v
tel que u·v=1 »).  La théorie des corps (i.e. l'axiome qui affirme
qu'un anneau est un corps) peut s'exprimer de plusieurs façons
différentes qui ne sont pas équivalentes en logique intuitionniste,
dont certaines sont géométriques et d'autres pas, mais aucune ne
marche bien (celles qui sont géométriques ne sont, en gros, jamais
satisfaites de façon intéressante).  En fait, dans ces exemples, les
variables ne sont pas typées (toutes sont de la même sorte, viz. les
éléments du groupe, de l'anneau, de l'anneau local, whatever), mais on
peut admettre des théories avec plusieurs sortes de variables, ça ne
change rien au problème.  Bref.

Lorsque T est une théorie (pas forcément géométrique, d'ailleurs), et
E un topos, on peut définir les modèles de T dans E comme des objets X
(ou des n-uplets d'objets si on admet plusieurs sortes de variables
dans la théorie) de E munis d'autant de données que prescrites par le
langage de T (par exemple, une fonction X²->X si on a une fonction
binaire dans le langage de T) qui satisfont tous les axiomes de T.
Par exemple, si T est la théorie des groupes, respectivement des
anneaux, respectivement des anneaux locaux, on a la notion de groupe
(i.e. objet en groupes), respectivement d'anneau, respectivement
d'anneau local, dans E.  On peut définir un T-morphisme entre ces
objets comme un morphisme (dans E ; ou un n-uplet de morphisme si on
admet plusieurs sortes de variables) qui commute à l'interprétation
des relations, fonctions, etc, de T.  On a donc une catégorie, disons
Mod(T,E) des modèles de T dans E.  Par exemple, on a une catégorie des
objets en groupes dans un topos, des objets en anneaux, des objets en
anneaux locaux.

Si T est géométrique, ce qui est sympathique, c'est que lorsqu'on a un
morphisme (« géométrique ») de topoi F->E (c'est-à-dire un couple de
foncteurs adjoints, l'adjoint à gauche, noté f^* et appelé foncteur
image inverse, allant de E vers F, et l'adjoint à droite, noté f_* et
appelé foncteur image directe, allant de F vers E, avec la propriété
que l'adjoint à gauche est exact à gauche), si on prend un modèle de T
dans E, son image inverse dans F est encore un modèle de T de façon
naturelle.  Par exemple (rappelons que le foncteur fibre en un point,
pour un faisceau sur un espace topologique au sens banal, est un
morphisme « géométrique » de topoi), la fibre en un point d'un
faisceau en groupes est un groupe, la fibre d'un faisceau en anneaux
est un anneau, la fibre d'un faisceau en anneaux locaux est un anneau
local.  (Oui, ce sont des trivialités ; mais ce que ça veut dire c'est
qu'on peut commodément définir les faisceaux de groupes, d'anneaux,
d'anneaux locaux, et que les choses se passent bien, parce que les
théories des groupes, des anneaux, des anneaux locaux, sont
géométriques.)

Maintenant, si on se donne une théorie géométrique T (mais cette fois
on ne se donne pas un topos), on peut définir une catégorie B(T) dite
catégorie syntaxique pour T : en gros, il s'agit formellement de tous
les sous-objets définissables possibles d'un modèle de T (ou de ses
puissances finies) dans un topos quelconque.  C'est-à-dire que les
objets de B(T) sont simplement des prédicats dans le langage de T (on
notera [P] l'objet de B(T) associé à un prédicat P : il s'agit
« moralement » de « l'ensemble des n-uplets d'éléments (d'un modèle de
T) qui vérifient P »).  Et les flèches, disons de [P(x)] vers [Q(y)]
sont les prédicats à deux variables R(x,y) tels que dans T il soit
démontrable (en logique intuitionniste, bien sûr) que si R(x,y)
implique P(x) et Q(y) et que si R(x,y) et R(x,y') alors y=y'.  On met
de plus sur B(T) une topologie de Grothendieck en déclarant qu'une
famille de flèches, disons R_i(y) de but [Q(y)], recouvrent le but,
lorsqu'il est démontrable dans T que la disjonction des R_i(y)
implique Q(y) (je vous laisse rendre ça précis et notamment remettre
les sources des flèches comme il faut).  Blablabla c'est bien un site
blablabla on peut prendre le topos associé, disons EB(T), blablabla
par construction il est clairement noethérien (MacLane dit
« cohérent », au fait).

Ce topos EB(T) est ce qu'on appelle un « topos classifiant » en ce
sens que les morphismes (« géométriques ») d'un topos F quelconque
vers le topos EB(T) sont (à équivalence de catégorie près) précisément
les modèles de T dans le topos F.  Wow.  (Et en plus, il existe adns
EB(T) un « modèle universel » de la théorie T.  En gros, si on prend
pour T la théorie des anneaux locaux, on trouve pour EB(T) le topos de
Zariski sur les anneaux de présentation finie ou quelque chose de pas
très loin de ça, et l'anneau universel c'est Z[t].)

Pourquoi je raconte tout ça, moi, au fait ?  Ah oui, on applique le
théorème de Deligne au topos EB(T), ça nous dit qu'il a suffisamment
de points.  Or un point d'un topos c'est par définition un morphisme
(« géométrique ») depuis le topos des ensembles ; mais un tel
morphisme, par la propriété d'être classifiant de EB(T), c'est (à
équivalence près, lala, lala) un modèle de T dans les ensembles.  Et
quand on regarde ce que signifie le fait d'avoir « suffisamment » de
points, le théorème de Deligne nous dit, finalement, que :

THÉORÈME.  Soit T une théorie géométrique.  Alors une implication
« pour tous x1,...,xn (P(x1,...,xn) => Q(x1,...,xn)) » de prédicats
géométriques est démontrable dans T (et même démontrable en logique
intuitionniste !), c'est-à-dire en gros que [P] recouvre [Q] dans
B(T), si et seulement si elle est vraie dans tout modèle de T dans les
ensembles.

On peut dire que c'est le théorème de complétude de Gödel.  Seulement,
(a) ça ne vaut que pour les théories géométriques, mais (b) ça dit
nettement plus : que la logique intuitionniste et la logique
classique, ici, ne font pas de différence.  Et je trouve par ailleurs
monstrueusement pipo de dire que c'est le théorème de Deligne qui
donne ça : c'est surtout toute la construction, notamment du topos
syntaxiques EB(T), et la démonstration du fait que ce dernier est
classifiant, qui donnent le résultat.  Le théorème de Deligne, c'est
un gadget assez trivial.

On va dire que le résultat lui-même ne présente guère d'intérêt - il
me semble.  Mais moralement, il est très important et il nous éclaire
beaucoup.  Par exemple on peut dire que le fait que le topos de
Zariski soit (« moralement ») le topos classifiant de la théorie des
anneaux locaux, « explique » pourquoi toutes les questions locales en
géométrie algébrique se ramènent, justement, à des questions sur des
anneaux locaux.  (Et je suppose que pour la topologie étale il doit y
avoir une façon « géométrique » au sens ci-dessus de dire qu'un anneau
est hensélien.)

Logique intuitionniste
----------------------

From madore@clipper.ens.fr Tue Dec 17 15:37:39 2002
Article: 7074 of ens.forum.sciences.maths
Subject: elements de mathematiques intuitionnistes

Bonjours les enfants !  Ça faisait longtemps que tonton David ne vous
avait pas pondu un super-long rant dans forum maths sur un sujet qui
n'intéresse personne, n'est-ce pas ?  (Tous en choeur : « Ouiii... »)
Eh bien aujourd'hui je vais vous parler de mathématiques
intuitionnistes (tous en choeur : « choueeette ! »).  Vous pouvez donc
me laisser ranter et taper sur la touche 'k' (ou équivalent) de votre
newsreader.

Aucune connaissance préalable de théorie des topoï n'est nécessaire
pour lire le présent message, mais ce sera utile pour comprendre les
tenants et les aboutissants de tout ça (pour ceux qui ne connaissent
vraiment pas, les topoï sont des catégories qui constituent des sortes
de modèles de la logique intuitionniste).  En fait, il n'est même pas
nécessaire de savoir ce qu'est un faisceau d'ensembles sur un espace
topologique pour comprendre les raisonnements, mais je m'en servirai
pour donner les exemples et contre-exemples (c'est-à-dire que je
considérerai un type particulier de topos, le topos des faisceaux
d'ensembles sur un espace topologique X ; cependant, je ne vais pas
réexpliquer en toute généralité comment fonctionne la sémantique sur
ce topos - je vais juste l'illustrer dans des cas particuliers - pour
cela, voir d'autres messages que j'ai déjà postés, ou bien mon mémoire
de magistère).

Mon but n'est pas d'expliquer des choses très profondes ou très
compliquées, mais de reprendre des choses que tout le monde sait dans
le cas de la logique classique (enfin, tout le monde à partir du DEUG,
disons) et voir ce qu'elles deviennent quand on passe à la logique
intuitionniste : théorie très naïve des ensembles, quelques structures
algébriques, nombres réels, un peu de fonction réelle de la variable
réelle, rien de plus loin que ça.

Enfin, je ne tenterai pas de formaliser, parce que ce n'est
intéressant pour personne.  Je ne décrirai donc pas exactement quels
axiomes je prends et quelles constructions j'autorise.  Ce n'est
cependant pas très difficile de formuler des théories précises dans
lesquelles tout ce que je dis sera justifié.

Notamment, je n'expliquerai pas exactement ce qu'on autorise ou pas en
logique intuitionniste : ceux qui veulent une définition formelle
chercheront le schéma d'axiomes de Hilbert, par exemple, et retireront
la règle (~~A)=>A où ~A signifie « non A » et peut d'ailleurs être
défini comme A=>Faux.  En revanche, A=>(~~A) est toujours valable
puisque si A est vrai alors à partir de A=>Faux on peut déduire Faux
par un simple modus ponens, c'est-à-dire que (A=>Faux)=>Faux sous
l'hypothèse A, bref A=>((A=>Faux)=>Faux), ce qui signifie exactement
A=>(~~A).

Comme on s'en doute, on ne peut plus prouver A\/~A (où ici « \/ »
signifie « ou »).  Ce qui est peut-être plus inattendu, c'est que
(~A)\/(~~A) n'est pas non plus prouvable, et il est par ailleurs tout
à fait possible que (~A)\/(~~A) soit universellement vrai sans pour
autant que la logique soit classique (on pourra parler de logique
quasi-classique dans ce cas), alors que A\/~A pour tout A signifie
précisément que la logique est classique.

Pour ce figurer précisément ce qui est valable et ce qui ne l'est pas,
le mieux est de considérer les ouverts d'un espace topologique X, en
interprétant le \/ comme la réunion, le /\ comme l'intersection, le
Vrai comme X tout entier, le Faux comme l'ensemble vide, et
l'implication A=>B comme la réunion de tous les ouverts U dont
l'intersection avec A est contenue dans B - notamment, la négation
s'interprète comme « le plus grand ouvert disjoint », c'est-à-dire
l'intérieur du complémentaire.  L'axiome A\/~A pour tout A signifie
alors que tout ouvert est fermé, i.e. que X est
discret-à-séparation-près ; tandis que l'axiome (~A)\/(~~A) signifie
que X est extrêmement discontinu (l'adjérence d'un ouvert est un
ouvert).

En gros, sur les raisonnements, il faut se faire à l'idée qu'on a le
droit de distinguer deux cas lorsqu'on a une hypothèse du genre A\/B
(selon que A est vrai ou que B l'est) mais on ne peut pas distinguer
deux cas selon que A est vrai ou faux, et on ne peut pas raisonner par
l'absurde.

En logique intuitionniste, il reste vrai que A /\ (B\/C) = (A/\B) \/
(A/\C), et que A \/ (B/\C) = (A\/B) /\ (A\/C).  En revanche, avec des
opérations infinies il faut faire plus attention : dire que A /\ (il
existe un x tel que B(x)) équivaut à dire qu'il existe un x tel que
(A/\B(x)), mais dire que A \/ (pour tout x on a B(x)) implique
seulement que pour tout x on a (A\/B(x)).  Bien sûr, ~(B\/C) équivaut
à (~B) /\ (~C) mais ~(B/\C) est plus _faible_ que (~B) \/ (~C).  Et
pour les quantificateurs, ~(il existe un x tel que B(x)) équivaut à
pour tout x ~B(x), mais ~(pour tout x B(x)) ne permet pas de conclure
l'existence d'un x tel que ~B(x).

Bon, maintenant passons à quelques ensembles.

Commençons par jeter un coup d'oeil à l'ensemble vide, que je noterai
0 : celui-ci n'est absolument pas différent en logique intuitionniste
de ce qu'il est en logique classique.  En vertu de ce que j'ai
expliqué ci-dessus, dire qu'aucun x n'appartient à 0 (i.e. il est faux
qu'il existe un x appartenant à 0), ou dire que pour tout x il est
faux que x appartient à 0, cela revient au même.  Par ailleurs, 0 peut
se caractériser par le fait que pour tout ensemble F, il existe une
unique fonction 0->F (c'est la propriété universelle du vide).  Et 0 a
une seule partie, à savoir 0 lui-même, qui est à la fois partie vide
et partie pleine.

Maintenant, regardons le singleton.  (Je ne dis pas le singleton de
quoi c'est, parce que je fais de la théorie structurée des ensembles
et pas de la théorie bien-fondée des ensembles, donc tous les
singletons sont isomorphes et je n'ai pas lieu de les distinguer -
cette remarque, bien sûr, est complètement sans rapport avec le fait
que je travaille en logique intuitionniste.)  Le singleton, que je
note 1, peut se caractériser par deux axiomes : (i) il existe un
élément x de 1, et (ii) pour tous éléments x et y de 1, on a x=y.  On
peut aussi le caractériser par le fait que pour tout ensemble E, il
existe une unique fonction E->1.  On peut d'ailleurs dire que 1 est
l'ensemble des parties de 0 (je dirais plus de choses sur les
ensembles de parties dans un moment).

On peut aller plus loin et considérer 2=1+1, la somme directe (= union
disjointe = coproduit) de deux copies de 1.  Cet ensemble a deux
éléments globalement bien définis, et qui sont différents :
c'est-à-dire, il existe x et y de 2 tels que ~(x=y) et que pour tout z
dans 2 on a z=x ou z=y, et cela caractérise 2.

Maintenant, revenons un peu en arrière, et considérons les ensembles A
qui vérifient la propriété que j'ai déjà énoncée à propos de 1, à
savoir (ii) pour tous éléments x et y de A on a x=y.  Autrement dit,
ce sont les ensembles ayant _au plus_ un élément.  Cette condition se
traduit encore en disant que l'unique fonction A->1 est injective :
autrement dit, les ensembles en question sont les parties du
singleton.  Manifestement, il existe au moins l'ensemble vide et le
singleton.  Mais y en a-t-il d'autres ?  Ce n'est certainement pas
nécessaire, car en logique classique, pour tout A de la sorte, soit il
existe x dans A et dans ce cas A est un singleton comme on l'a vu,
soit il n'existe pas x dans A et dans ce cas A est l'ensemble vide.
Mais en logique intuitonniste il se peut qu'il y ait beaucoup de tels
ensembles A ayant au plus un élément.

À ce point-là j'illustre ce que j'ai raconté jusqu'à présent par la
théorie des faisceaux sur un espace topologique X (comme je l'ai
prévenu, la lecture de ce paragraphe et des autres de ce genre n'est
donc pas indispensable).  Une valeur de vérité (globale) correspond à
un ouvert de X, et j'ai expliqué comment s'interprétaient les
connecteurs logiques.  L'ensemble vide s'interprète comme le faisceau
vide sur X, qui à tout ouvert non vide de X associe l'ensemble vide
(et à l'ensemble vide le singleton, comme tout faisceau doit le
faire) ; le singleton s'interprète comme le faisceau singleton sur X,
qui à tout ouvert de X associe un singleton.  Un ensemble ayant au
plus un élément s'interprète comme un faisceau qui à tout ouvert
associe un ensemble soit vide soit ayant un élément ; et dans ce cas,
il existe un plus grand ouvert U de X sur lequel le faisceau a une
section, et il a exactement une section sur tout ouvert dans U, et
aucune sur tout ouvert qui n'est pas inclus dans U.  De façon
formelle, on peut dire qu'un tel faisceau est le faisceau représenté
par l'ouvert U (c'est là un phénomène assez particulier au topos des
faisceaux sur un espace topologique que les faisceaux représentables
correspondent à des ensembles ayant au plus un élément).  L'ensemble 2
à deux éléments, lui, il correspond au faisceau constant de valeur 2
sur X, c'est-à-dire le faisceau des fonctions continues (donc
localement constantes) de X vers l'ensemble à deux éléments muni de la
topologie discrète - et si X est connexe, ce faisceau n'a que deux
sections globales.

Revenons maintenant aux parties d'un singleton (ensembles ayant au
plus un élément) : on peut vouloir les collecter en un ensemble, qui
sera donc l'ensemble P(1) des parties d'un singleton.  Finalement, se
donner une partie A du singleton 1, dont x (disons) sera l'unique
élément, cela revient à se donner la valeur de vérité de « x
appartient à A », c'est-à-dire que les parties d'un singleton sont en
correspondance bijective avec les valeurs de vérité, la valeur de
vérité associée à A étant celle de « il existe un x (nécessairement
unique) dans A ».  On appelle Omega cet ensemble P(1) des valeurs de
vérité.

Cet ensemble Omega des valeurs de vérité est extrêmement important.
En logique classique, on a Omega=2, les deux valeurs de vérité étant
Vrai et Faux.  En logique intuitionniste, on a une flèche (une
application) 2->Omega, qui envoie un élément sur Vrai (correspondant à
la partie pleine 1 de 1) et l'autre sur Faux (correspondant à la
partie vide 0 de 1) : cette flèche est injective (est un
monomorphisme), puisqu'on a ~(Vrai=Faux), mais n'est surjective que
lorsque la logique est classique.  Il est même possible que le
cardinal de Omega (dans un sens que je n'essaierai pas de rendre
précis, parce que les cardinaux en logique intuitionniste c'est
quelque chose de très compliqué) soit très très grand - disons, qu'il
ne soit pas « au plus dénombrable » (je veux rester vague ici sur le
sens de ce terme) : c'est là la première surprise que nous réserve la
logique intuitionniste, que l'ensemble des parties d'un singleton peut
être énorme.

À ce point-là je veux faire deux digressions.  La première est pour
dire que ce que je viens d'expliquer n'est pas trivial.  On pourrait
dire qu'il est clair qu'en rajoutant des valeurs de vérité (et c'est
là l'éternel slogan que je répète sans arrêt : le forcing, classique
ou intuitionniste, c'est simplement rajouter des valeurs de vérité à
la logique) on augmente la taille de l'ensemble des parties d'un
singleton, donc on peut le rendre très gros.  Mais il y a une
subtilité : s'il est évident qu'on peut rendre cet ensemble Omega=P(1)
très gros _du point de vue externe_, il n'est pas du tout clair que
_du point de vue interne_ on le puisse.  D'ailleurs, en logique
classique, c'est-à-dire quand on fait du forcing classique, on peut
remplacer Omega par une grosse algèbre de Boole complète (imaginer
comme cas trivial les faisceaux sur un espace X discret mais gros -
dans ce cas, toute partie de X est une valeur de vérité, donc en
externe on en a plein) : mais tant qu'on garde la logique classique,
il sera toujours vrai en interne que A\/~A pour tout A, c'est-à-dire
que toute partie du singleton est soit le vide soit le singleton -
parce que quand on grossit P(1), on grossit 2 en même temps, si j'ose
dire.

La deuxième digression est pour faire remarquer que, quand même,
quelque part, le forcing a toujours pour rôle de grossir les ensembles
de parties.  Ici on grossit P(1) ; dans le forcing classique tel qu'il
a d'abord été introduit par Cohen, il s'agit de grossir P(N)
l'ensemble des parties de l'ensemble des naturels (pour casser
l'hypothèse du continu), mais les deux cas procèdent d'une démarche
semblable.

Revenons maintenant à Omega.  Un des phénomènes qui fait tout son
intérêt est celui de la fonction indicatrice (ou caractéristique) : si
E est un ensemble quelconque, et E' une partie de E, c'est-à-dire
qu'on se donne une flèche (une fonction, une application) injective
E'->E, alors il lui correspond une fonction E->Omega, dite fonction
indicatrice, qui envoie un x de E sur l'image réciproque de {x} par
E'->E, ensemble ayant au plus un élément puisque la fonction E'->E est
injective, donc pouvant être vu comme un élément de Omega ; ou,
simplement, la fonction indicatrice E->Omega de E'->E associe à un x
de E la valeur de vérité de « x est dans E' ».  En termes plus
catégoriques, E'->E est le pull-back du monomorphisme Vrai:1->Omega
(qui associe Vrai à l'unique élément de 1) par la fonction indicatrice
E->Omega : en ce sens, Omega classifie les sous-objets.  Ceci nous
permet de définir l'ensemble des parties P(E), pour n'importe quel
ensemble E, comme l'ensemble des applications de E vers Omega.

Prenons quelques exemples de fonctions indicatrices.  La fonction
indicatrice de l'identité 1->1 (i.e. de la partie pleine du singleton)
est la flèche Vrai:1->Omega.  La fonction indicatrice de l'unique
flèche 0->1 (i.e. de la partie vide du singleton) est la flèche
Faux:1->Omega.  Plus généralement, la fonction indicatrice de la
partie pleine ou vide de n'importe quel ensemble est la fonction
constante de valeur Vrai ou Faux respectivement.  L'ensemble des
parties de 2, bien sûr, est l'ensemble Omega² des couples d'éléments
de Omega : une valeur de vérité pour savoir si le premier élément
appartient à la partie définie, et une autre pour savoir si le second
y appartient.  Maintenant, j'ai déjà parlé du sous-ensemble
{Vrai,Faux} de Omega, et on a donc un sous-ensemble {Vrai,Faux}² de
Omega² : il a quatre éléments (au sens où il est isomorphe à l'union
disjointe 1+1+1+1 de quatre copies de 1), et il correspond aux
fonctions indicatrices des quatre parties 0->2 (ensemble vide), 1->2
(singleton du premier élément), 1->2 (singleton du second élément) et
2->2 (partie pleine) de 2 ; mais il y en a bien sûr d'autres.

Évidemment, un ensemble qui a plein de parties intéressantes, c'est
Omega lui-même.  Par définition, le singleton du Vrai, soit
Vrai:1->Omega, est un monomorphisme (une application injective), dont
la fonction indicatrice est l'identité Omega->Omega (en clair, la
valeur de vérité de « p=Vrai » est p elle-même, pour toute valeur de
vérité p).  Mais on a aussi définit le Faux, soit Faux:1->Omega, qui
est la fonction indicatrice de la partie vide du singleton ; or cette
application Faux:1->Omega est encore un monomorphisme donc elle a
elle-même une fonction caractéristique, appelée Non:Omega->Omega ou
bien « ~ » (la valeur de vérité de « p=Faux » est ~p).  Évidemment, on
peut composer la fonction Non:Omega->Omega avec elle-même pour obtenir
Non·Non:Omega->Omega, qui n'est pas l'identité en général (c'est
l'identité exactement lorsque la logique est classique).  Par
ailleurs, la fonction (Vrai,Vrai):1->Omega² (le singleton du couple
(Vrai,Vrai) de Omega²) est injective, donc cette partie a une fonction
caractéristique, Omega²->Omega, qui s'appelle le « Et » logique,
Et:Omega²->Omega, et ceci permet de définir l'intersection de deux
parties en prenant le « Et » logique de leurs fonctions indicatrices.

Parlons d'ailleurs de l'égalité.  Si E est un ensemble quelconque, on
peut définir une application « diagonale » E->E² (qui envoie un x de E
vers (x,x) dans E²).  Cette application est toujours injective : elle
définit donc une partie de E² appelée « diagonale » ; la fonction
indicatrice E²->Omega de cette partie s'appelle la relation d'égalité.
Remarquons par exemple que E a au plus un élément si et seulement si
cette relation d'égalité E²->Omega tombe dans le singleton {Vrai} de
Omega (c'est-à-dire se factorise par le Vrai : ceci est simplement une
façon de dire qu'un ensemble E a au plus un élément si et seulement si
x=y pour tous x et y de E).  Il peut être opportun de définir une
notion un peu plus générale : je dirai qu'un ensemble E est « précis »
(ce terme est de moi) lorsque l'égalité E²->Omega ne peut prendre que
les valeurs Vrai ou Faux, ou, plus précisément, tombe dans
{Vrai,Faux}, c'est-à-dire se factorise par la flèche 2->Omega dont
j'ai déjà parlé ; cela équivaut encore à dire que pour tous x et y de
E, on a soit x=y soit ~(x=y).  Les ensembles précis sont utiles parce
qu'on peut distinguer le cas où deux éléments sont égaux et le cas où
ils sont différents ; on verra plus loin que l'ensemble des naturels,
celui des entiers relatifs, et celui des rationnels (mais pas celui
des réels !) sont des ensembles précis.  En attendant, les ensembles
0, 1 et 2, et plus généralement toute partie de ces ensembles (et
notamment tout ensemble ayant au plus un élément), sont précis.  En
revanche, Omega n'est certainement pas précis en général (déjà la
valeur de vérité de « p=Vrai » est p, donc si ce ne peut être que Vrai
ou Faux, c'est que nous sommes en logique classique).

Pour ne pas me couper complètement de la réalité, je donne les
traductions de tout cela, comme d'habitude dans le topos des faisceaux
d'ensembles sur un espace topologique X.  Dans ce cas, Omega est le
faisceau qui à un ouvert U de X associe l'ensemble des ouverts de U
(et la restriction Omega(U)->Omega(V), pour V ouvert de U, intersecte
un ouvert de U avec V pour obtenir un ouvert de V).  La flèche
2->Omega envoie une section du faisceau constant 2 (le faisceau des
fonctions continues de X vers {Vrai,Faux}) sur l'ensemble des points
de X où elle vaut Vrai.  Dire qu'un faisceau F est précis signifie
que, données deux sections x et y de F, l'ensemble des points de X en
lesquels x et y ont même germe, qui, en toute généralité, est un
ouvert, est aussi un fermé (i.e. son complémentaire est un ouvert) :
c'est manifestement le cas de tout faisceau constant.

Si E' est une partie d'un ensemble E, on appelle complémentaire E'' de
E' la partie de E dont la fonction indicatrice est obtenue en
composant celle, E->Omega, de E', par la fonction Non:Omega->Omega.
Il se peut, bien sûr, que le complémentaire du complémentaire ne soit
pas l'ensemble de départ.  *Même* si cela est le cas (que le
complémentaire de E'' est de nouveau E'), il se peut que E ne soit pas
réunion de E' et E''.  Lorsque E' est le complémentaire de son
complémentaire, ce qui revient à demander que E' est le complémentaire
de quelque chose, on dira que E' est « bien complémenté (dans E) ».
Lorsque E est la réunion (évidemment disjointe) de E' et de son
complémentaire E'', on dira que E' est « bien découpé (dans E) » (et
dans ce cas E est isomorphe à la réunion disjointe de E' et E'', de
sorte qu'on peut dire que E' et E'' découpent E) : cela est
manifestement plus fort que de dire que E' est bien complémenté dans
E.  Précisément, E' est bien découpé dans E si et seulement si sa
fonction indicatrice E->Omega est à valeurs dans {Vrai,Faux} (i.e. se
factorise par la flèche canonique 2->Omega) : notamment, un ensemble E
est précis si et seulement si la diagonale est bien découpée dans E².
Et une partie E' de E est bien complémentée ssi sa fonction
indicatrice tombe dans l'image de Non:Omega->Omega, qui est encore
l'ensemble des p de Omega tels que p=Non(Non(p)) (on parlera de
valeurs de vérité « régulières », parce que l'analogie avec les
ouverts d'un espace topologique donne précisément les ouverts
réguliers pour ces valeurs de vérité).  J'ai dit que toute partie bien
découpée est bien complémentée ; il n'est pas vrai que toute partie
bien complémentée est bien découpée : en revanche, il est vrai que si
_toute_ partie d'un ensemble E est bien complémentée, alors toute
partie est bien découpée (exercice trivial : si tout ouvert d'un
espace topologique X est régulier, alors tout ouvert de X est fermé).

Pour essayer d'y voir un peu plus clair, introduisons un ordre sur
Omega.  C'est très simple : si p et q sont deux éléments de Omega,
correspondant, donc, à deux valeurs de vérité, on leur associe p=>q
(« p implique q »), qui est une autre valeur de vérité, et ceci
définit une fonction Omega²->Omega, c'est-à-dire une relation binaire
sur Omega, qui est p<=q.  C'est assez navrant pour la notation en
ASCII que p<=q (p\leq q, quoi, p inférieur ou égal à q) soit défini
comme p=>q (p implique q), mais je n'y suis pour rien !  Au niveau des
ensembles à au plus un élément, bien sûr, c'est juste l'ordre
d'inclusion.  Par ailleurs, toute partie de Omega possède, pour cet
ordre, une borne inférieure et une borne supérieure : avec des
vérifications diverses que je vous épargne, on dit que Omega est une
algèbre de Heyting complète (interne, si on se place du point de vue
d'un topos - mais ici je suis tout du long du point de vue interne, et
d'ailleurs ce n'est qu'à ce prix que je peux dire qu'il y a deux
applications 1->2, alors que du point de vue externe in peut y en
avoir plein comme sections globales du faisceau constant de valeur 2,
mais je digresse, là).

Bon, à ce stade, si jamais quelqu'un me lisait encore, il est
tellement dégoûté de Omega qu'il arrête, normalement.  Je vais donc
parler d'autre chose.  Dans un prochain post.

(À suivre, donc.)

------------------------------------------------------------------------

From madore@clipper.ens.fr Tue Dec 17 19:25:23 2002
Article: 7076 of ens.forum.sciences.maths
Subject: Re: elements de mathematiques intuitionnistes

Gro-Tsen in litteris <atncrj$c81$1@clipper.ens.fr> scripsit:
> (À suivre, donc.)

Je continue, donc, en parlant de choses un peu plus intéressantes.

D'abord, de structures algébriques en logique intuitionniste.  Une
structure algébrique, c'est, par exemple, un monoïde : un monoïde est
un ensemble M muni d'une application 1->M (un élément de M, quoi)
appelée l'élément neutre et d'une application M²->M appelée
multiplication, qui vérifient les propriétés qu'on imagine (neutralité
de l'élément neutre, et associativité de la multiplication).  Il n'y a
aucune subtilité quand il s'agit de définir ça en logique
intuitionniste.  De même, un groupe, qui est un monoïde G muni d'une
application G->G appelée inverse, qui vérifie ce qu'on sait, ne pose
aucun problème en logique intuitionniste.  Ou encore un groupe
abélien, ou un anneau non nécessairement commutatif, ou un anneau
commutatif, ou un module sur un anneau.

En revanche, s'il s'agit de définir un corps, je suis ennuyé.  Parce
que je pourrais vouloir dire, par exemple, qu'un corps est un anneau
dans lequel tout élément est égal à zéro ou exclusif inversible pour
la multiplication (auquel cas on sait bien que son inverse est unique,
d'ailleurs).  Mais si on dit ça, on impose *ipso facto* que l'ensemble
soit précis (rappel : un ensemble E est dit précis ssi pour tous x et
y de E on a (x=y)\/~(x=y), c'est-à-dire que E² est réunion
(nécessairement disjointe) de la diagonale et du complémentaire de
celle-ci ; et un groupe est précis ssi le singleton de son élément
neutre est bien découpé dedans en ce sens que sa fonction indicatrice
est à valeurs dans {Vrai,Faux}).  Bref, ce n'est pas sympathique,
parce que je pourrais vouloir mettre des structures de corps sur des
ensembles qui ne sont pas précis.  (On verra plus loin que l'ensemble
des rationnels est un corps avec cette définition, et notamment il est
précis ; l'ensemble des réels, cependant, n'est pas précis.)  Je peux
aussi appeler corps un anneau dans lequel tout élément non nul est
inversible et dans lequel 0 n'est pas égal à 1 (cela revient à
demander que zéro ne soit pas inversible), mais ce n'est pas très
satisfaisant non plus.  Ce n'est pas non plus pareil que de dire qu'un
élément différent est nul si et seulement si il n'est pas inversible :
voilà une troisième définition possible, dont je ne sais pas très bien
ce qu'elle vaut (mais je crois que les nombres réels forment un corps
pour cette définition).  Laissons donc tomber les corps.

En revanche, on sera peut-être surpris d'apprendre que la notion
d'anneau (commutatif) local se définit de façon très simple et très
naturelle.  Il suffit de dire qu'un anneau est local lorsque x+y=1
implique que soit x est inversible soit y l'est.  (On est obligé
d'admettre l'anneau nul comme anneau local : ce n'est pas très
agréable, mais il y a des raisons profondes à ça, et on ne peut pas
s'en débarrasser de façon simple.)  On verra qu'avec cette définition
l'anneau des réels sera un anneau local.

On peut définir des sous-structures de façon assez habituelle.  On
peut définir, par exemple, un idéal I d'un anneau (commutatif) A comme
un sous-groupe additif (i.e. il contient 0 et est stable par addition
et par opposé) tel que I·A soit contenu dans I (i.e. xy est dans I
pour tous x dans I et y dans A).  Et on peut quotienter sans trop de
surprise.  Par exemple, si I est un idéal d'un anneau (commutatif) A,
on définit une application h:A->P(A), où P(A)=Omega^A est l'ensemble
des parties de A, qui envoie x dans A sur x+I : on vérifie que
h(x)=h(y) si et seulement si x-y est dans I ; l'image de h peut alors
s'appeler A/I, et est munie d'une structure d'anneau comme on le
croit.

Par exemple, si A est un anneau local dans le sens précisé ci-dessus,
et si 0 n'est pas égal à 1, alors l'ensemble I des éléments de A qui
ne sont pas inversibles est un idéal de A (la seule vérification qui
n'est pas évidente est la suivante : si x et y ne sont pas
inversibles, alors x+y ne l'est pas non plus ; en effet, si x+y était
inversible, on aurait u(x+y)=1 pour un certain u, donc ux+uy=1, et par
définition d'un anneau local on aurait ux inversible ou uy inversible,
or ux inversible implique manifestement x inversible et uy inversible
implique y inversible, dans les deux cas on a une contradiction ;
notez que ce n'est pas un raisonnement par l'absurde parce qu'on
cherche à montrer que x+y _n'est pas_ inversible, ce qui signifie
précisément que si x+y est inversible on a une contradiction).  Le
quotient A/I est alors un anneau local qui a de plus la propriété que
tout élément qui n'est pas inversible est nul (et réciproquement, 0
n'est pas inversible).  Peut-être est-ce là un bon argument en faveur
d'une des définitions de « corps », mais je n'en suis pas complètement
convaincu non plus.

(Ah, c'est l'heure du pot.  À+...)

--------------------------------------------------------------------------


From madore@clipper.ens.fr Tue Dec 17 22:05:58 2002
Article: 7077 of ens.forum.sciences.maths
Subject: Re: elements de mathematiques intuitionnistes

Gro-Tsen in litteris <atnq6j$f59$1@clipper.ens.fr> scripsit:
> (Ah, c'est l'heure du pot.  À+...)

Où en étais-je ?  Je ne sais plus.  Bon, alors je vais vous parler des
entiers naturels, des entiers relatifs, des rationnels et des réels.

Les entiers naturels sont définis, en gros, par les axiomes de Peano :
en termes sophistiqués, N est l'objet qui représente le foncteur
d'oubli de la catégorie des monoïdes vers la catégorie des ensembles
(c'est ça le contenu moral des axiomes de Peano - un fait bien connu
depuis les babyloniens) ; de façon moins sophistiquée, N est équipé
d'un élément zéro:1->N et d'une fonction succ:N->N de sorte que pour
n'importe quel ensemble M muni de ces données il existe une unique
flèche N->M qui fasse commuter le diagramme évident.  De façon encore
moins sophistiquée : succ est une injection, et N est précisément
l'union disjointe de zéro et de succ, et de plus toute partie de N qui
contient zéro et est stable par succ est N tout entier.

L'interprétation faisceautique de la chose, c'est que l'ensemble des
naturels se représente comme le faisceau constant de valeur l'ensemble
des naturels (comme quoi le monde est bien fait).

Une récurrence triviale (la plus simple qui soit, même ; ou bien la
définition de N, selon la variante qu'on a prise) montre que tout
entier naturel est soit zéro soit un successeur.  On peut alors
récurrer sur une autre variable et montrer que si x et y sont deux
naturels, on a soit x=y soit ~(x=y).  C'est-à-dire, avec la
terminologie que j'avais introduite, que N est un ensemble précis.

On peut définir des opérations d'addition et de multiplication sur les
naturels avec les formules usuelles, ainsi qu'un ordre, strict ou
large (il n'y a pas de subtilité à ce niveau, justement, puisque N est
précis).

Va pour les entiers naturels.  Pour les entiers relatifs, on utilise
la construction habituelle : Z est défini comme un quotient de N² par
la relation d'équivalence (x,y)<R>(x',y') ssi x+y'=x'+y, et ainsi de
suite.  Il n'y a pas de subtilité liée à la logique intuitionniste à
ce niveau-là.  De même, les relatifs se définissent comme le quotient
de Z × (Z \ {0}) par la relation (x,y)<R>(x',y') ssi xy'=x'y.  Alors Z
et Q sont des ensembles précis, et leur interprétation faisceautique
est les faisceau constants qu'on pense.

Il faut en particulier noter, pour les entiers comme pour les
rationnels, que donnés deux nombres x et y quelconques, on a soit x<y
soit x=y soit x>y.  (Et évidemment x<y comme x>y impliquent ~(x=y), et
réciproquement ~(x=y) implique (x<y)\/(x>y) d'après ce que je viens de
dire.)

On est alors prêt à définir les réels : ceux-ci se voient comme des
coupures de Dedekind.  Précisément, un réel est un couple (A,B), où A
et B sont des parties de Q (l'ensemble des rationnels) vérifiant les
propriétés suivantes :

* A n'est pas borné inférieurement, et B n'est pas borné
  supérieurement : pour tout x dans Q il existe y<x tel que y soit
  dans A, et pour tout x dans Q il existe y>x tel que y soit dans B ;

* A n'a pas de plus grand élément, et B n'a pas de plus petit
  élément : pour tout x dans A il existe y>x tel que y soit dans A, et
  pour tout x dans B il existe y<x tel que y soit dans B ;

* A est stable par diminution et B par augmentation : si x est dans A
  et y<x est dans Q alors y est dans A, et si x est dans B et y>x est
  dans Q alors y est dans B ;

* A est complètement en-dessous de B : pour tout x dans A et tout y
  dans B on a x<y ;

* A et B ratent au plus un seul rationnel : pour tous x<y dans Q, soit
  x est dans A soit y est dans B.

Je pense que je n'ai rien oublié.  On appelle ensemble R des réels
l'ensemble des coupures de ce genre.  Si x est un rationnel, le couple
donné par A={y|y<x} et B={y|y>x} est une coupure, et l'application
Q->R ainsi définie est injective : on identifiera donc Q à son image
dans R, et on gagne au passage la fonction R->Omega indicatrice des
rationnels.

L'interprétation faisceautique est très heureuse : l'ensemble des
réels s'interprète comme le faisceau des fonctions continues à valeurs
réelles (pour la topologie usuelle).  Ceci est fort utile pour générer
exemples et contre-exemples.

Les réels s'ajoutent de façon bien sympathique : (A,B)+(A',B') =
(A+A',B+B'), où A+A' est l'ensemble des x+y avec x dans A et y dans
A'.  L'opposé est trivial à définir.  Pour la multiplication, je vous
laisse le soin de la définir - il ne faut pas tomber dans le piège de
penser qu'on peut distinguer pour un réel le cas où il est positif et
le cas où il est négatif (cf. ci-dessous), cependant, pour un
rationnel, c'est légitime.  Bref, on met sur R une structure d'anneau.

On dira qu'un réel (A,B) est « inférieur au sens large » à un autre
(A',B') si et seulement si A est contenu dans A', ou, ce qui revient
au même, B' est contenu dans B.  On notera x<=y ou x>=y pour dire
qu'un réel x est inférieur au sens large à y ; attention, il ne faut
pas dire « inférieur ou égal », parce que, justement, ce n'est pas
pareil (cf. plus bas).  On a bien sûr x<=y si et seulement si y-x>=0,
si et seulement si x-y<=0, et par ailleurs x=0 si et seulement si x<=0
et x>=0.

On dira qu'un réel (A,B) est strictement supérieur à 0 lorsque 0 (le
rationnel) appartient à A, ou, ce qui revient au même, il existe un
rationnel strictement positif qui appartient à A.  Plus généralement,
on dira qu'un réel (A,B) est strictement inférieur à un autre (A',B')
si et seulement si il existe un rationnel appartenant simultanément à
B et A' (attention, cela ne signifie pas que B inter A' n'est pas vide
- c'est plus fort de demander qu'il a un élément).  On notera x<y ou
y>x pour dire que x est strictement inférieur à y.  On a bien sûr x<y
si et seulement si y-x>0 si et seulement si x-y<0, et par ailleurs x<0
et x>0 sont mutuellement exclusifs.  On note x<>y pour dire que x<y ou
y>x.

Malheureusement, il n'est pas vrai que x<>y équivaut à ~(x=y).  Il
n'est pas non plus vrai que pour tous x et y on ait x<=y ou x>=y ; pas
plus qu'il n'est vrai que x<=y équivale à x<y ou x=y _ni même_ que x<y
équivale à x<=y et ~(x=y) - en revanche il est évidemment vrai que x<y
équivaut à x<=y et x<>y.  Je n'essaierai pas de définir ce que peut
être un « ordre total » ou de savoir si l'ordre sur R en est un (ou,
en fait, ce qu'est un ordre du tout...).

On peut dire que Q est dense dans R en ce sens que si x et y sont deux
réels qui vérifient x<y, alors il existe un rationnel z tel que x<z<y.

Par ailleurs, on peut définir un inverse pour certains nombres réels ;
en fait, il n'est guère difficile de voir qu'un réel x est inversible
_si et seulement si_ x<>0.  Ensuite, R est archimédéen en ce sens que
si x et y sont deux réels et y>0 alors il existe un entier naturel n
tel que ny>x.  Et notamment N est cofinal dans R en ce sens que pour
tout réel x il existe un naturel n tel que n>x.

On peut définir une fonction valeur absolue sur les réels : la valeur
absolue d'une coupure (A,B) est la coupure (A',B') où A' est la
réunion de A et -B et B' l'intersection de -A et B - si je ne me
trompe pas ça marche bien.  On a alors x>=0 si et seulement si x=|x|,
et x<=0 si et seulement si x=-|x|, et dans tous les cas |x|>=0.

Voici de plus une propriété importante des réels : comme je l'ai dit,
on ne peut pas dire que pour tout x on a x>=0 ou x<=0 ; en revanche,
il est vrai que pour tout x on a x>=0 ou x<=1, et, plus généralement,
pour tous rationnels r et s tels que r<s, pour tout réel x on a x>=r
ou x<=s.

Maintenant, quid des fonctions réelles de la variable réelle ?  Il est
consistant qu'elles sont toutes continues (i.e. que pour tout f:R->R
et tout x de R, pour tout eps>0 il existe eta>0 tel que si
x-eta<y<x+eta alors f(x)-eps<f(y)<f(x)+eps) - cf. mon mémoire de
magistère à ce sujet.  En revanche, il n'est pas vrai qu'elles sont
toutes dérivables, et, même, il y en a qui ne sont pas dérivable en
tel point : la fonction valeur absolue, par exemple, n'est pas
dérivable en 0 (parce que son taux d'accroissement, |x|/x, défini pour
les x tels que x<>0, vaut 1 pour ceux où x>0 et -1 pour ceux où x<0,
et manifestement il n'existe pas de m tel que |x|/x tende vers m quand
x tend vers 0, en quelque sens raisonnable que ce soit).

Si je ne me trompe pas, il est aussi consistant qu'il existe une
fonction f:[-1;1]->R continue telle que f(-1)=-1, f(1)=1 et qu'il
n'existe aucun c de [-1;1] pour lequel f(c)=0.  Pour le prouver, il
suffit, par exemple, de construire une fonction, *classique* cette
fois, F:[-1;1]×R->R continue telle que F(-1,·)=-1, F(1,·)=1 et pour
laquelle il n'existe aucune fonction C:U->R continue, avec U un
(intervalle) ouvert non vide de R, vérifiant F(C(t),t)=0 pour tout t
de U ; or il me semble vaguement que j'arriverais à construire une
telle chose, ce qui garantirait la possibilité de construire un
contre-exemple dans le topos adéquat (précisément, le topos des
faisceaux d'ensembles sur X=R, où f:R->R est la fonction qui envoie
une section s définie sur un ouvert U de R du faisceau des fonctions
continues à valeurs dans [-1;1] vers la section F(s(t),t)).

Ceci constitue, si je ne me trompe pas, une violation assez massive du
théorème des valeurs intermédiaires.  Ça peut surprendre, parce que sa
démonstration habituelle (par dichotomie, disons) n'a pas l'air de
faire intervenir le principe du tiers exclu, et elle a même l'air
constructive.  En fait, le problème est de tester si f(x)>=0 ou
f(x)<=0 : c'est dans cette division-là que réside la faillite
intuitionniste du TVI.

--------------------------------------------------------------------------

From madore@clipper.ens.fr Mon Dec 23 18:48:41 2002
Article: 7109 of ens.forum.sciences.maths
Subject: Re: elements de mathematiques intuitionnistes

Joël Riou in litteris <au7acn$jha$1@clipper.ens.fr> scripsit:
> Si X=[0,1], que l'on considère le topos des faisceaux d'ensembles sur X
> et que l'on interprête les Réels comme les fonctions continues X -> R,

Déjà, c'est un fait, et un résultat à mes yeux remarquable, prouvé
dans le MacLane & Moerdijk, que dans le topos des faisceaux sur un
espace topologique quelconque, ou bien sur le gros topos des faisceaux
sur (tous) les espaces topologiques (avec pour recouvrement les
recouvrements ouverts comme on le pense), l'objet des Nombres Réels
(défini par des coupures de Dedekind de rationnels au sens où je l'ai
ébauché) est bien le faisceau des fonctions continues à valeurs
réelles (c'est-à-dire le faisceau qui à un ouvert - i.e. un objet du
site - associe l'ensemble des fonctions réelles continues sur cet
ouvert - qui est un espace topologique).  (Les Rationnels, de même,
s'interprètent comme les fonctions localement constantes à valeurs
rationnelles - là, pour le coup, c'est presque immédiat, c'est un
faisceau constant.)

> alors effectivement, une suite décroissante et minorée de Réels n'est
> pas forcément convergente : soit u_n = x -> x^n. Si la suite des Réels
> u_n admettait une limite (disons sur un voisinage ouvert de 1 [car on
> est en logique intuitionniste]), alors la limite ne pourrait être que la
> limite simple de la suite de fonctions (u_n), or celle-ci n'est pas un
> nombre Réel (la limite simple n'étant pas continue en 1).

C'est bien l'exemple auquel je pensais.  Il faut quand même faire un
tout petit peu attention que, en principe, les Naturels par lesquels
on indice la Suite ne sont pas les naturels intuitifs mais les
fonctions localement constantes dans les naturels : donc, la Suite est
en fait le morphisme de faisceaux qui à une fonction localement
constante n définie sur un ouvert U de X associe la fonction réelle
x->x^(n(x)) définie et continue sur U ; simplement, ici, ça ne change
rien du tout.

La borne inférieure d'une famille de fonctions continues sur X est
semi-continue supérieurement, comme c'est le cas ici, mais pas
forcément inférieurement.  On peut intuiter (il faudrait vérifier
précisément) que les bornes inférieures de Parties non vides minorées
des Rationnels définiraient des « Réels Supérieurs » (donnés par une
demi-coupure supérieure) et que les bornes supérieures de Parties non
vides majorées définiraient des « Réels Inférieurs » ; la définition
des Réels par deux demi-coupures (la demi-coupure supérieure de x
étant l'Ensemble des Rationnels r tels que r>x, et la demi-coupure
inférieure celle des r tels que r<x) assure donc à la fois la
semi-continuité inférieure et supérieure : dans un certain sens, les
Réels devraient être l'intersection des Réels Supérieurs et des Réels
Inférieurs.

> D'ailleurs, il me semble vrai que, si on travaille dans le topos des
> faisceaux d'ensembles sur un espace topologique, alors si une suite de
> Réels (u_n) converge vers une limite l, alors la famille de fonctions
> u_n converge "uniformément localement" vers l [et que si X est
> localement compact, la réciproque est vraie].

Déjà, essentiellement par unicité de la limite, si on a une Suite u_n
de réels (i.e. de fonctions continues X->R), dire qu'Il Existe une
Limite l, c'est bien dire qu'il existe une fonction l:X->R continue
vérifiant (certaines choses) (a priori, il pourrait simplement y avoir
un recouvrement ouvert de X et sur chaque ouvert U un l:U->R vérifiant
(certaines choses), mais en fait, les choses en question assurent
qu'aux intersections c'est bien le même l, donc le problème potentiel
ne se pose pas).

La notion de Convergence Topossique (de u_n vers l) est alors la
suivante : pour tout ouvert U de X et toute fonction eps:U->R continue
partout strictement positive, il existe un recouvrement ouvert de U
et, pour chaque ouvert V de ce recouvrement, un entier naturel n (qui
n'est pas obligé de coïncider sur les intersections) tel que pour tout
k>=n on ait |u_k(x)-l(x)|<eps(x) pour tout x dans V.  Manifestement,
cela équivaut à la même condition exigée seulement pour les fonctions
eps constantes (et même à valeur rationnelle si on veut : ce qui est
sensé parce que, même en logique intuitionniste, pour exiger un machin
de ce genre pour tout Réel eps>0 il suffit de l'exiter pour tout
Rationnel eps>0).  Finalement, u_n converge topossiquement vers l ssi
pour tout réel (au sens naïf, sans majuscule) eps>0 et tout x de X il
existe un voisinage V de x et un entier k (toujours au sens naïf) tel
que |u_k(x)-l(x)|<eps pour tout x dans V.

Cette notion de convergence d'une suite de fonctions continues semble
assez naturelle (et donne, en effet, la notion de convergence uniforme
sur tout compact sur un espace topologique localement compact), mais
je ne lui connais pas de nom en général.

-----------------------------------------------------------------------

From madore@clipper.ens.fr Mon Dec 23 22:20:07 2002
Subject: Re: elements de mathematiques intuitionnistes

Joël Riou in litteris <au7q53$37u$1@clipper.ens.fr> scripsit:
>			Dans mon cours de prépa, on appelait cette
> convergence la " convergence uniforme locale ".

Oui, ça semble raisonnable.  J'ai cherché dans Bourbaki, je n'ai pas
trouvé - curieux.

> Joël, légèremement confusé par la définition intuitionniste de " il existe"

(Tu veux parler de l'interprétation du « il existe » dans la
sémantique des faisceaux de Kripke-Joyal, en fait.)

C'est effectivement confusogène : si F est un faisceau sur un espace
topologique X (ou sur un site X), dire « il existe un s de F
(vérifiant foobar) » signifie non pas qu'il existe une section globale
s de F (vérifiant foobar), mais qu'il existe un recouvrement ouvert de
X sur chaque ouvert duquel il existe une section s (vérifiant foobar).

Si le quantificateur existentiel est en fait existentiel-unique, alors
les choses se passent bien, parce que l'unicité permet précisément de
recoller.  En revanche, il n'y a pas de façon d'exprimer, dans le
langage interne, l'existence d'une section globale.  (Et pour cause :
il est possible que F et G soient « internement isomorphes » en ce
sens que le langage interne affirme qu'« il existe » un isomorphisme
entre eux, de sorte qu'il ne peut plus les distinguer, sans qu'il
existe globalement un tel isomorphisme, et F peut très bien avoir des
sections globales sans que G en ait.)  Cela (= le fait d'exprimer
l'existence de sections globales dans le langage interne) serait
possible en enrichissant le langage de nouvelles constructions (un
modalisateur, ou bien un nouveau quantificateur, ou quelque chose de
ce genre), mais je ne sais pas si c'est possible de façon vraiment
intelligente.  (Idéalement, il s'agirait, par exemple, de fournir une
définition _interne_ de la cohomologie de Cech des faisceaux, ou
quelque chose de la sorte.)

----------------------------------------------------------------------

Univers de Grothendieck
-----------------------

Rémy in litteris <ds57bl$5pk$1@clipper.ens.fr> scripsit:
> Une question pour les spécialistes : est-ce que la théorie des
> catégories et des foncteurs est exprimable par une théorie du premier
> ordre sur les ensembles ? Par exemple, la propriété "le foncteur foobar
> est représentable/pleinement fidèle/exact à droite" ?

Ça dépend qui est <foobar>, bien sûr...

Mettons que tu veuilles dire « le foncteur d'oubli de la catégorie des
groupes vers la catégorie des ensembles admet un adjoint à gauche, qui
est le foncteur "groupe libre" ».

Évidemment, ni la catégorie de( tous le)s groupes ni la catégorie des
ensembles ne sont des ensembles, pour des bêtes raisons de
cardinalité.  Ni le foncteur d'oubli G de l'une vers l'autre, ni le
foncteur « groupe libre », F, dans l'autre sens.  Ni, et il faut s'en
souvenir aussi, la transformation naturelle µ:Hom(F·,·)->Hom(·,G·) qui
témoigne de l'adjonction.

Il faut se souvenir quand même que ZFC peut « manipuler » (avec les
précautions de rigueur autour de ce mot) des choses qui ne sont pas
des ensembles (mais des classes propres) tant qu'on les désigne
explicitement par une formule (et éventuellement, quitte à énoncer une
infinité de formules, on peut quantifier universellement - comme dans
la formulation de l'axiome de sélection, qui dit que « l'interesction
d'une classe est d'un ensemble est un ensemble »).  Parce que, après
tout, il est tout à fait possible dans ZFC de faire un énoncé sur tous
les ensembles (commencer par « pour tout x,... ») bien que les
ensembles ne forment pas un ensemble mais une classe ; ou tous les
groupes, tous les ordinaux, tous les morphismes entre schémas,
whatever.

Donc on peut tout à fait dire « la transformation naturelle µ traduit
le fait que le foncteur F est adjoint à gauche du foncteur G » bien
que µ, F, G, la catégorie des ensembles et la catégorie des groupes ne
soient pas des ensembles.  Il n'y a pas plus de mystère là-dedans que
dans le fait d'écrire « toute algèbre à division finie est
commutative » bien que la classe des algèbres à division finies n'est
pas un ensemble mais une classe propre.  Donc en pratique on
remarquera qu'on a une formule « <machin> est (le codage d')un
groupe », « <bidule> est l'ensemble sous-jacent à <machin> (qui est un
groupe) » - c'est-à-dire « <bidule>=G(<machin>) », « <chose> est le
groupe libre sur <truc> », « <blurb> est le morphisme de groupes de
<chose> vers <machin> associé, par la transformation naturelle µ, au
morphisme d'ensembles de <truc> vers <bidule> », etc.  Ensuite, on
écrit juste tout ce qu'il faut pour dire que tous les diagrammes
commutent et tout et tout.  Donc, pas de souci, là.

Ce qu'on ne peut pas (*a priori*) écrire, c'est « (il existe une
transformation naturelle µ qui fait que) le foncteur F est adjoint à
gauche du foncteur G » (il _faut_ donner explicitement µ).  Ce n'est
pas forcément grave, parce qu'une des leçons de la théorie des
catégories c'est, justement, qu'il ne faut jamais dire « <foo> et
<bar> sont isomorphes » mais bien « <ceci> est un isomorphisme entre
<foo> et <bar> » et ainsi de suite.

On peut, en revanche, écrire (si on y tient vraiment) quelque chose
comme « G n'a pas d'adjoint à droite » : ça se dit par une infinité de
formules (un schéma, comme disent les logiciens) qui traduisent, pour
n'importe quel foncteur T et n'importe quelle transformation naturelle
h, que T n'es pas adjoint à droite de G par la transformation
naturelle h.

Si on trouve que cette forme d'expressivité n'est pas assez grande, on
peut toujours se dire, bon, ben j'ai vraiment besoin de parler de
classes, je ne me contenterai pas d'ensembles et de pseudo astuces
pour parler quand même de classes.

Ce serait, par exemple, passer à la théorie des ensembles de
Gödel-Bernays (ou de Bernays, ou de von Neumann-Bernays, je crois
qu'elles reviennent plus ou moins au même), ce qui n'est d'ailleurs
pas un saut conceptuel très fort parce qu'elle est équiconsistante
avec ZF et elle a même ceci de rassurant qu'elle prouve exactement les
mêmes énoncés _parlant uniquement d'ensembles_ que ZF(C) - donc a
priori, tout ce qu'on peut faire dans GB(C), qui, au final, ne va
donner que des choses sur les ensembles, peut se faire dans ZF(C).  Il
faut noter que la restriction importante de ces théories « Bernays »,
c'est que quand on définit une classe, la classe des ensembles x tels
que P(x), on ne peut avoir _aucun quantificateur portant sur des
classes dans l'écriture de P_ (en revanche, il peut y avoir des
variables libres de classes, si besoin est, ça ce n'est pas grave).
Si on assouplit cette contrainte, on obtient la théorie des ensembles
dite de Quine-Morse (je crois), qui, elle, est strictement plus
puissante que ZFC (elle prouve des énoncés sur les ensembles que ZFC
ne prouve pas, et pour commencer le fait que ZFC est consistant, ce
qui est même un énoncé sur les entiers naturels...).

Bon, alors, là, maintenant, on essaie de prendre un peu de recul et on
se demande : est-ce que j'ai vraiment besoin de faire ça ?

Parce que, après tout, les classes, c'est pas quelque chose de
vraiment nouveau.  Pensons à la hiérarchie V_alpha, par exemple
(rappel : V_0 est l'ensemble vide, V_{alpha+1} est l'ensemble des
parties de V_alpha, autrement dit, les ensembles dont tous les
éléments sont dans V_alpha, et aux ordinaux delta limite, V_delta est
la réunion des V_alpha pour tout alpha<delta, autrement dit, les
ensembles qui sont déjà dans un V_alpha plus petit).  Moralement (et
tout devient rigoureux si on se place en logique du second ordre),
l'univers des ensembles est juste un V_kappa pour kappa (un cardinal)
très très grand qui est le plus petit auquel on ne peut pas accéder,
et parler de classes c'est juste considérer V_{kappa+1}.  Donc en un
certain sens, parler de classes est un caprice pour dire « tu me
permets d'aller jusqu'à kappa, ouin !, j'ai justement envie d'aller un
cran plus loin ».  Manque de chances, entre nos caprices et les
ordinaux, ce sont les ordinaux qui sont les plus forts et qui vont
plus loin.  Mais a-t-on vraiment besoin de considérer la classe de
tous les ensembles ?

Grothendieck, pour remédier à ces difficultés, a introduit la notion
d'« univers », qui sont des ensembles clos par tout ce qu'on a envie
de faire comme opérations (enfin, selon lui, Grothendieck).  Postuler
l'existence d'univers revient (enfin presque, mais je ne veux pas trop
rentrer dans les détails) à postuler l'existence de cardinaux
(fortement) inaccessibles (rappel : un cardinal kappa est dit régulier
ssi il n'est pas la limite de strictement moins que lui ordinaux (ou
cardinaux, peu importe) plus petit, et il est dit fortement limite ssi
il est strictement plus grand que 2^lambda pour tout cardinal lambda
strictement plus petit ; fortement inaccessible veut dire à la fois
régulier et fortement limite).  En tout cas, V_kappa est un univers au
sens de Grothendieck ssi kappa est un cardinal fortement inaccessible,
et un axiome que Grothendieck fait souvent, à savoir que tout ensemble
est contenu dans un univers, est équivalent à postuler que tout
ordinal/cardinal est majoré par un cardinal inaccessible (les
cardinaux inaccessibles sont « cofinaux » dans les ordinaux ; donc
désormais j'appellerai cet axiome de Grothendieck « la cofinalité des
inaccessibles »).

L'idée, ensuite, c'est que, certes, la catégorie des ensembles n'est
pas un ensemble, mais la catégorie des U-ensembles, pour U un univers
donné, en est un, et cet ensemble vit dans un univers V plus gros que
U.  Si on préfère avec les V_kappa (moi je préfère), on dit que la
catégorie des ensembles qui sont dans V_kappa (on dit aussi « de rang
inférieur à kappa ») est un ensemble et elle vit dans V_lambda avec
lambda le prochain cardinal inaccessible.  Du coup, on va énoncer les
résultats de théorie des catégories en fixant un univers (mais sur
lequel tout sera, au final, quantifié universellement - ça s'applique
à *tout* univers) et en passant quand c'est nécessaire à un univers
plus gros (par l'axiome de Grothendieck de cofinalité des
inaccessibles).  C'est comme ça que font Grothendieck et ses disciples
dans les SGA (et documents apparentés).

Tout est pour le mieux dans le meilleur des mondes ?  Non, moi j'ai
deux objections à la façon de procéder de Grothendieck.  Primo, il
rajoute un postulat qui n'est pas dans ZFC - la cofinalité des
inaccessibles - et qui est strictement plus fort que lui, donc même
s'il démontre au final un résultat sur les *entiers naturels* avec son
postulat, on n'a pas la garantie que cet énoncé sera démontrable dans
ZFC (exemple : s'il démontre Consis(ZF))...  Secundo, ce postulat
n'est pas vraiment nécessaire (je vais expliquer pourquoi dans un
instant).  Tertio, il n'est pas clair qu'il soit suffisant pour « tout
ce qu'on veut faire » : après tout, il est en train de me dire que je
peux trouver plein d'univers, mais si je commence à vouloir parler des
univers eux-mêmes, je vais sans doute avoir envie de trouver des
choses closes par l'opération de « trouver un univers qui contient »,
et là il faudrait des super-univers qui sont clos par cette opération,
ce qui revient logiquement à introduire les cardinaux
superinaccessibles (ou hyper-, je ne sais plus...) et on pourrait
demander la cofinalité des superinaccessibles....  Beurk.

Alors moi je propose de nous demander si on a vraiment besoin d'une
clôture aussi forte que ce que Grothendieck demande pour les univers,
et qui revient à considérer les cardinaux inaccessibles.  Car en
pratique, quand on fait des mathématiques, on n'a jamais besoin de
toute la force de ZF(C) : dans quasiment tous les cas, par exemple, on
se passe très bien de l'axiome de Remplacement, ce qui revient à
travailler dans la théorie plus faible, Z(C), dont ZF(C) fournit sans
problème des modèles (V_{omega·2} en est déjà un ! d'ailleurs, _tous_
les objets mathématiques considérés classiquement vivent sans problème
dans V_{omega·2}).  Mais bon, je n'ai pas l'intention d'affaiblir non
plus la théorie des ensembles.

Donc, ce que je propose, c'est de formuler des énoncés pour des
V_alpha suffisamment clos mais pas autant que pour kappa inaccessible.
Par exemple, si alpha est cardinal régulier indénombrable, ou même
simplement un ordinal de cofinalité indénombrable (ce sera l'hypothèse
de base ; rappelons que « de cofinalité indénombrable » veut dire que
toute suite dedans est bornée), on peut prendre des paires, des
produits cartésiens, des ensembles de parties, ce genre de choses, et
aussi faire librement des opérations avec des suites (puisque alpha
est de cofinalité indénombrable) et tant qu'on n'utilise pas un axiome
de remplacement indénombrable (ce qui, en pratique, n'arrive *jamais*,
ne serait-ce que parce qu'aucun mathématicien non logicien ne sait
faire ça ;-), on est saufs.  Donc en première approximation je propose
de remplacer « fixons un univers » dans ce qu'écrit Grothendieck par
« fixons un V_alpha où alpha est un ordinal de cofinalité
indénombrable », ce qui a l'avantage de ne nécessiter aucun axiome
supplémentaire à la théorie des ensembles.  Et si d'aventure ça ne
devait pas suffire ?  Eh bien la théorie des ensembles a une arme
secrète : le théorème de réflexion.

Le théorème de réflexion dit, en gros, que si vous faites n'importe
quel raisonnement dans la théorie des ensembles (et donc, n'utilisant
qu'un nombre fini d'axiomes, puisque, de toute façon, une
démonstration mathématique est forcément finie donc n'utilise qu'un
nombre fini de l'infinité d'axiomes que compte ZF(C)), ce raisonnement
sera valable dans « plein » des V_alpha (« plein » voulant dire
techniquement que ça marche dans une classe close cofinale, qu'on peut
explicitement écrire, mais peu importe).  Donc quelles que soient les
opérations et les démonstrations que vous ayez envie de faire
mathématiquement, quels que soient les gros ensembles sur lesquels
vous ayez envie de travailler, il y aura toujours plein de V_alpha
assez gros pour que ça marche.  Et ça c'est un théorème de ZF(C), pas
besoin d'axiomatique supplémentaire (on a besoin d'ajouter des
axiomes, àla Mahlo, si on veut, par exemple, que alpha puisse être un
cardinal régulier - c'est pour ça que ci-dessus j'ai pris pour
hypothèse de base « ordinal de cofinalité indénombrable » plutôt que
« cardinal régulier indénombrable », mais dans la pratique on n'a pas
besoin de ce genre de choses).

Donc la morale de l'histoire c'est qu'un résultat de la théorie des
catégories peut toujours se voir comme un énoncé de ZF de la forme
« si alpha est un ordinal de cofinalité indénombrable (vérifiant
éventuellement quelques autres propriétés de clôture), alors on a
<zorglub> » où <zorglub> est l'énoncé de théorie des catégories
relativisé à V_alpha (et si on a besoin de monter plus haut, ben on
monte à un V_beta plus grand, ayant toujours les bonnes propriétés de
clôture, etc. : par exemple, pour parler de la catégorie des ensembles
vue comme objet de la catégorie des catégories, en fait on parlera de
la catégorie des V_alpha-ensembles vue comme objet de la catégorie des
V_beta-catégories avec beta>alpha).  C'est bien ce que Grothendieck
fait avec les univers, sauf que j'explique qu'on n'a pas besoin
d'axiome fort (grâce au théorème de réflexion), on peut tout faire
vraiment dans ZF(C), et en plus on a des meilleurs propriétés de
clôtures (puisque le théorème de réflexion permet de réfléchir
*n'importe quelle* démonstration valable dans ZF(C), même si elle
utilise elle-même abondamment le théorème de réflexion ! alors que les
univers de Grothendieck ne permettent pas vraiment de parler d'univers
dans les catégories).

-- 
David, qui a surtout écrit ce post pour m'éclaircir moi-même les idées
(à force de dire à tout le monde que « Grothendieck faisait des
bêtises en parlant d'univers », il fallait bien que je finisse par
savoir au juste ce que je proposais à la place...).

Réels dans un topos
-------------------

From david+forum@madore.org Sun Mar 17 00:34:04 2019
Article: 2948 of ens.forum.sciences.maths.avancees
From: Gro-Tsen <david+forum@madore.org>
Newsgroups: ens.forum.sciences.maths.avancees
Subject: reels dans le topos d'un espace topologique, et faisceaux non-non
Date: Sat, 16 Mar 2019 23:34:04 -0000 (UTC)

Bon, puisque Dam's me fait lire des longs rants sur les topos, moi
aussi j'ai le droit de jouer à ça :

Le rant ci-dessous parle de deux topoï particuliers, à savoir celui T
des faisceaux d'ensembles sur un espace topologique X, et celui des
faisceaux « pour la topologie du ¬¬ » sur T, et tente de décrire les
réels dans ces deux topoï.  J'aimerais bien qu'on me confirme que ce
que je dis ci-dessous semble correct.  Mais bon, il n'y a pas beaucoup
de valeurs de « on » que ceci a une chance d'intéresser (Dam's, je
suppose, et peut-être Fabrice ?), donc j'ai conscience de parler un
peu dans le vide...  M'enfin, ça m'aide au moins de m'obliger à écrire
tout ça un peu précisément.

Pour commencer, soit X un espace topologique (séparé,) complètement
régulier et ayant la propriété de Baire.  (Peut-être que j'ai besoin
d'autres hypothèses aussi, mais je crois que c'est ça.)

Je m'intéresse à deux topoï particuliers :

- le topos T = Sh(X) des faisceaux d'ensembles sur X,

- le topos T' = Sh(T,¬¬) des faisceaux pour la topologie du ¬¬ sur T
  (au sens de <URL:
  http://ncatlab.org/nlab/show/Lawvere-Tierney%20topology >), et il me
  _semble_ (première question donc : ai-je raison ?) que ce sont les
  faisceaux d'ensembles F sur X tels que pour chaque ouvert U de X et
  chaque ouvert dense V de U la restriction F(U)->F(V) soit une
  bijection.

(Le topos T' est un topos booléen, c'est-à-dire que sa logique interne
est la logique classique.  Je suppose que c'est, en un certain sens,
le plus gros topos booléen qui se plonge dans T ou quelque chose de ce
goût-là, mais peu importe.)

On a un « plongement géométrique » T'->T dont la partie image directe
est le foncteur d'inclusion consistant à voir T' comme sous-catégorie
pleine de T, et la partie image réciproque (l'adjoint à gauche -
foncteur de ¬¬-faisceautisation) envoie un faisceau d'ensembles F sur
X sur le faisceau qui à un ouvert U associe la limite inductive des
F(V) pour tous les ouverts denses V de U.  (Deuxième question : est-ce
bien ça ?)

Le classificateur de sous-objet (« objet des valeurs de vérité », ou
ensemble des parties d'un singleton) du topos T est le faisceau qui à
un ouvert U de X associe l'ensemble des ouverts qu'il contient.  Celui
de T' est le faisceau qui à un ouvert U de X associe l'ensemble des
ouverts _réguliers_ de U (= égaux à l'intérieur de leur adhérence) :
il se trouve que si V est une partie dense de U, alors l'opération
« intersecter avec V » définit une bijection entre les ouverts
réguliers de U et ceux de V [cf. corollaires 1.13 et 1.15 de la thèse
de Hardy mentionnée plus bas] donc ceci définit bien un objet de T',
et il me semble bien que c'est son classificateur de sous-objet
(troisième question...) et qu'il s'agit du ¬¬-faisceautisé du
classificateur de sous-objet de T (quatrième question...).

(C'est d'ailleurs peut-être un fait général que quand on a un
morphisme géométrique T'->T (ou en tout cas un plongement
géométrique ?), le classificateur de sous-objet de T' s'obtient en
appliquant la partie image réciproque du morphisme au classificateur
de sous-objet de T.  Je ne sais pas (cinquième question...) et c'est
insupportablement pénible de chercher ce genre de choses.)

Maintenant, ce qui est plus rigolo, c'est de considérer l'objet
« réels de Dedekind » des topos T et T' :

L'objet de T définissant les réels de Dedekind, si je ne m'abuse
(sixième question...  mais bon, là je suis assez sûr de moi) est donné
par les fonctions réelles continues, i.e., par le faisceau qui à un
ouvert U de X associe l'ensemble des fonctions réelles continues U->R
(où R est la droite réelle usuelle), avec la restriction évidente.
Notons que si je m'intéresse à l'intervalle [-1;1] (de l'objet en
question ; c'est-à-dire les réels de Dedekind qui sont >=-1 et <=1),
il est défini par les fonctions continues à valeurs dans [-1;1].

Maintenant, je voudrais voir l'objet des réels de Dedekind dans T'.
J'ai un candidat, mais pour éviter des problèmes de non-bornitude qui
me tracassent je commence par un candidat pour l'intervalle [-1;1]
dans T' :

Mon candidat peut être plusieurs manières différentes : pour le lien
entre elles je renvoie principalement à la thèse de Kenneth Hardy,
"Rings of Normal Functions" (McGill 1968), parties I à III, <URL:
http://digitool.library.mcgill.ca/thesisfile73726.pdf
 >, que j'ai d'ailleurs trouvée très agréable à lire.  Je décris juste
les sections globales sur X, mais tout est fonctoriel par passage à un
ouvert :

- Comme les fonctions continues à valeurs dans [-1;1] sur l'espace de
  Stone E de l'algèbre de Boole (complète !) des ouverts réguliers de
  X, ou ce qui revient au même, des boréliens modulo les ensembles
  maigres.  (Ce E est d'ailleurs aussi la limite projective des
  compactifiés de Stone-Cech des ouverts denses de X : cf. <URL:
  http://mathoverflow.net/questions/178806/is-the-absolute-of-a-compact-space-the-projective-limit-of-the-stone-%C4%8Cech-compac
  >.)

  *** Remarque : On peut se demander du coup (septième question) si T'
      n'est pas tout simplement le topos Sh(E) des faisceaux
      d'ensembles sur E.  Comme E est « extrêmement discontinu »,
      c'est-à-dire que l'adhérence d'un ouvert est un ouvert, le topos
      des faisceaux d'ensembles sur E est booléen, donc au moins ça
      part bien.  Mais je crois quand même que la réponse est non, et
      je vais expliquer pourquoi plus bas.

- Comme les fonctions réelles « normales semicontinues
  inférieurement » X->[-1;1] (enfin, U->[-1;1] pour les sections sur
  un ouvert U), en rappelant qu'une fonction réelle h est dite
  semicontinue inférieurement (s.c. infrt.) lorsque h(x) =
  lim.inf(h(y) pour y->x) (notons que j'inclus x dans ses voisinages,
  donc l'inégalité >= est triviale), et « normale s.c. infrt. »
  lorsque h(x) = lim.inf(lim.sup(h(z) pour z->y) pour y->z) (cette
  dernière formule définit une fonction normale s.c. infrt. quelle que
  soit la fonction h).  Notons d'ailleurs qu'une partie de U est un
  ouvert ssi sa fonction indicatrice est s.c. infrt., et un ouvert
  régulier ssi elle est normale s.c. infrt.  Notons que la restriction
  à un ouvert d'une fonction [normale] s.c. infrt. a la même
  propriété, et que la restriction à un ouvert dense définit une
  bijection (l'extension s'obtient simplement en prenant la limite
  inf, cf. 1.14 et 1.16 de la thèse de Hardy).

- Comme la limite inductive des ensembles des fonctions continues
  G->[-1;1] où G parcourt tous les G_delta denses, c'est-à-dire les
  intersections dénombrables d'ouverts denses, de X.  (Cf. 1.22 et
  1.23 de la thèse de Hardy, et comparer aussi avec 5.2-5.3.)

- Comme les fonctions boréliennes X->[-1;1] modulo égalité sur le
  complémentaire d'un ensemble maigre.  (Bon, je n'ai pas de référence
  vraiment satisfaisante pour l'équivalence entre cette description et
  les précédentes, mais il me semble bien que c'est vrai.)

J'espère (huitième question !) que toutes ces description donnent bien
le même objet de T, qui est en fait dans T'.  Là, je suis quand même
raisonnablement sûr de moi.

Je crois bien que ceci définit l'objet des réels entre -1 et 1 dans
T' ; mon argument est un peu « if not this, what else? », ce qui est
foireux, mais j'ai plein de raisons de l'imaginer.  Noatamment, il est
connu que l'objet que je viens de décrire est complet pour l'ordre
donné par la comparaison ponctuelle (cf. l'article de Dilworth de
1950, « The Normal Completion of the Lattice of Continuous Functions »
dont la thèse de Hardy est une sorte de prolongement).  Par ailleurs,
c'est une description connue des réels dans « l'univers ensembliste à
valeurs booléennes » pour, en l'occurrence, l'algèbre booléenne des
ouverts réguliers de X : cf. le livre
/books/genesis/Kusraev_Kutateladze-1999-Boolean_Valued_Analysis.pdf
notamment 5.1.7(6 et 7) et §5.2 ou alentours, et/ou la §4.3 (et
notamment le lemme 1 de celle-ci) de l'article de Solovay,
« Real-Valued Measurable Cardinals » qu'on peut trouver dans
/books/vrac/Scott_ed-Axiomatic_Set_Theory-Los_Angeles-1967-part_1.djvu
(page 397, soit 403 dans le DjVu).

[Plus exactement, le livre dit:
(6) Take a topological space Q and denote by Bor(Q) := Bor(Q,R) the set of
all Borel functions from Q to R with addition, multiplication, and order
introduced pointwise. Then Bor(Q,R) is a Kσ-space.
By N we denote the set of such Borel functions f ∈ Bor(Q) that {t ∈ Q :
f(t) != 0} is a meager set (i.e., a set of the first category). Let B(Q)
stand for the factor space Bor(Q)/N with the operations and order induced
from Bor(Q).
Then B(Q) is a K-space whose base is isomorphic to the Boolean algebra of
Borel subsets Q modulo meager sets.
If Q is a Baire space (i.e., every nonempty open subset of Q is not
meager), then the base Base(B(Q)) is isomorphic to the Boolean algebra of
all regular open (or regular closed) subsets of Q. Each of the spaces
Bor(Q) and B(Q) is a faithful f-algebra. The identically one function
serves as an order and ring unity in these spaces. Replacing R with C, we
arrive at the complex K-space B(Q).
(7) Let Q be a topological space again. Denote by C(Q) the space of
continuous real functions on Q. Then C(Q) is a sublattice and subalgebra of
Bor(Q). In particular, C(Q) is a faithful Archimedean f-algebra. Generally
speaking, C(Q) is not a K-space. The Dedekind completeness property of C(Q) amounts to the extremal disconnectedness property of Q (see 1.2.5). In the case of a uniformizable space Q the base of C(Q) is isomorphic to the algebra of regular open sets.
We now let LSC(Q) stand for the set of (the cosets of) lower semicontinuous
functions f : Q → R := R∪{±∞) such that f −1(−∞) is nowhere dense whereas
the interior of the set f −1([−∞,∞)) is dense in Q. As usual, two functions
are equivalent if they agree on the complement of a meager set. The sum f +
g (the product f ·g) of f,g ∈ LSC(Q) is defined as the lower semicontinuous
regularization of the pointwise sum t → f(t) + g(t) (t ∈ Q0) (the
pointwise product t → f(t) · g(t) (t ∈ Q0)) where Q0 is some dense subset
of Q on which f and g are both finite.
We this make LSC(Q) into a universally complete K-space and an f-algebra,
with the base of LSC(Q) isomorphic to the algebra of regular open sets.
Hence, if Q is Baire then B(Q) and LSC(Q) are isomorphic K-spaces; if Q is
uniformizable then C(Q) is an (order) dense sublattice of LSC(Q).

 ==> Fonctions de Borel (modulo équivalence sur un maigre) = lower
 semicontinuous function.

Et l'article dit que si X est un finite measure space with measure algebra
l'algèbre de Boole complète B, alors R^(B) (ie R vu par B) est équale à la
classe des fonctions X->R modulo équivalence pp. Note: le livre parle
d'ensembles maigres alors qu'ici on regarde les ensembles de mesure 0, mais
un ensemble de mesure 0 va être maigre pour la topologie densité, donc ça
fait le lien

Et enfin la thèse dit
BN(X) and LN(X) are the subalgebras of bounded and locally bounded normal
functions. We consider normal functions on the Stone space K of the
Boolean algebra of all regular open sets in X. Then BN(X) is isomorphic
with, C*(K) and LN(X) is isomorphic with C(E), where E is the dense
subspace of K consisting of fixed regular open ultrafilters. 
]

Bref, neuvième question : est-ce que ceci définit bien l'objet « réels
entre -1 et 1 » de T' ?

Maintenant, pourquoi est-ce que je me suis limité aux réels entre -1
et 1 ?  Parce que les descriptions ci-dessus, si elles coïncident bien
dans ce contexte, ou dans le contexte des fonctions bornées,
deviennent plus chiantes à comparer sans cette hypothèse (comme
l'espace de Stone E est compact, une fonction E->R est automatiquement
bornée, et comme je vais le dire je ne crois pas que ce soit la bonne
description des réels dans T').

Évidemment, je peux considérer tanh:Rbar->[-1;1] où Rbar = R union
{±infty}, et du coup définir les éléments de Rbar dans T' comme ceux
de [-1;1] via cette bijection d'ensembles bien-ordonnés.  Cela revient
à considérer les fonctions dans Rbar en prenant l'arctangente
hyperbolique d'une fonction à valeurs dans [-1;1].

Mais « être un réel » ?  Ça doit veut dire que la valeur de vérité de
« ne pas être ±infty » est vraie, i.e., que la valeur de vérité de
« être ±infty » est fausse (le topos T' est booléen !, donc on peut
raisonner en logique classique dessus).  Donc je crois que ça
correspond aux fonctions normales semicontinues inférieurement X->Rbar
qui prennent des valeurs finies sur une partie dense...  (ce que la
thèse de Hardy appelle DN(X)... je crois que le complémentaire de la
partie dense est alors automatiquement maigre) ; et au niveau de
l'espace de Stone E, aux fonctions E->Rbar qui sont finies sur un
ouvert dense (cf. 3.14 de la thèse de Hardy).  Dans les deux dernières
descriptions ci-dessus je crois qu'il suffit de remplacer [-1;1] par
R, mais je suis loin d'être sûr de moi.  Dixième question : est-ce
correct ?

*** Du coup, si c'est correct, T' _n'est pas_ le topos Sh(E) des
    faisceaux d'ensembles sur E, bien que ce dernier soit booléen.  En
    effet, (l'ensemble des sections globales de) l'objet des réels de
    Dedekind de Sh(E) est donné par les fonctions continues E->R, qui
    sont automatiquement bornées (par un réel usuel...) puisque E est
    compact, alors que pour l'objet que je définis ci-dessus, on
    obtient les fonctions continues E->Rbar qui sont finies sur une
    partie dense, et qui ne sont en général pas bornées.

Mais un autre truc qui me surprend, c'est que je m'attendais un peu à
ce que les réels de T' s'obtiennent en ¬¬-faisceautisant les réels de
T (comme pour le classificateur de sous-objet).  Or _ce n'est pas le
cas_ : la ¬¬-faisceautisation de l'objet des réels de T est (enfin, a
pour sections globales) la limite inductive des fonctions réelles
continues V->R pour tous les ouverts denses V, tandis que les réels de
T' ont l'air (d'après ce qui précède) définis par la limite inductive
des fonctions réelles continues G->R pour tous les G_delta denses G.

Bon, je suppose que ce n'est pas si surprenant, puisque après tout si
Y'->Y est un sous-espace d'un espace topologique, il n'est pas vrai en
général que les fonctions continues Y'->R (objet des réels dans
Sh(Y')) soient les restrictions des fonctions continues Y->R (image
réciproque par Y'->Y du faisceau précédent).

Mais ça explique plus ou moins pourquoi à divers endroits, par exemple
dans
/books/vrac/Fine_Gillman_Lambek-1965-Rings_of_Quotients_of_Rings_of_Functions-2005_retyped.pdf
apparaissent l'un ou l'autre des deux objets « limite inductive des
fonctions réelles continues V->R pour tous les ouverts denses V de X »
et « limite inductive des fonctions réelles continues G->R pour tous
les G_delta denses G de X ».  Ce double truc m'avait toujours confusé.


From david+forum@madore.org Sun Mar 17 12:38:56 2019
Article: 2949 of ens.forum.sciences.maths.avancees
Path: eleves!.POSTED.forum.salle-s.org!not-for-mail
From: Gro-Tsen <david+forum@madore.org>
Newsgroups: ens.forum.sciences.maths.avancees
Subject: Re: reels dans le topos d'un espace topologique, et faisceaux non-non

Gro-Tsen  in litteris <q6k15c$d20$1@gellei.salle-s.org> scripsit:
>   *** Remarque : On peut se demander du coup (septième question) si T'
>       n'est pas tout simplement le topos Sh(E) des faisceaux
>       d'ensembles sur E.  Comme E est « extrêmement discontinu »,
>       c'est-à-dire que l'adhérence d'un ouvert est un ouvert, le topos
>       des faisceaux d'ensembles sur E est booléen,

Hum, je ne sais pas pourquoi j'avais ça en tête, je dois venir d'un
univers parallèle, mais il n'est pas vrai que le topos des faisceaux
d'ensembles sur un espace topologique extrêmement discontinu soit
booléen.  (Aucun espace topologique T1 non discret ne peut avoir un
topos de faisceaux qui soit booléen, puisque si {x} est un singleton
non isolé, son complémentaire est un ouvert dense différent de
l'espace tout entier, ce qui donne une valeur de vérité qui n'est pas
stable par ¬¬.)

Bon ce topos vérifie quand même la condition que ¬U \/ ¬¬U est plein
(quel que soit la valeur de vérité / l'ouvert U), et il paraît que ça
s'appelle un topos de De Morgan et qu'il y a une topologie qui définit
la Demorganisation (Olivia Caramello, *De Morgan classifying
toposes*), donc c'est peut-être intéressant quand même.

Mais par ailleurs, le bon espace à considérer n'était sans doute pas
l'espace de Stone de l'algèbre de Boole des ouverts réguliers sur X
(que j'ai appelé E et c'était sans doute une mauvaise idée parce que
la thèse de Hardy appelle E non pas cet objet mais le suivant...) mais
l'« absolu » (d'Iliadis, mais pour un espace régulier c'est aussi
l'absolu de Banachewski ; ou « recouvrement projectif ») P de X, qui
est[#] le sous-espace de l'espace de Stone formé des ultrafiltres
d'ouverts réguliers qui ont une limite dans X (ceci donne une
application continue P->X).  Si je lis bien la thèse de Hardy
(spécifiquement, 3.25), les fonctions réelles continues sur P
coïncident avec les fonctions normales s.c. infrt. localement bornées
sur X, donc je soupçonne qu'il y a une construction « topossique » de
ce P.

[#] Une construction intuitivement plus parlante est de considérer,
pour chaque ensemble fini d'ouverts réguliers deux à deux disjoints
dans X et dont la réunion est dense dans X (i.e., une partition de X
dans l'algèbre de Boole de ses ouverts réguliers), l'espace
topologique Z formé de la réunion disjointe des adhérences de ces
ouverts réguliers (intuitivement, c'est donc une façon de « séparer »
ceux-ci) avec une flèche évidente continue Z->X, puis de prendre la
limite projective de tous ces Z le long du système de tous les
ensembles finis de tels ouverts réguliers.

Voir
/books/vrac/Porter_Woods-1988-Extensions_and_Absolutes_of_Hausdorff_Spaces.djvu
pour les détails et notamment l'exercice 6Z (page 521, 535 dans le
djvu) pour l'explication de la note [#] ci-dessus.

-- 
David, qui se sert de forum comme bloc-notes.

