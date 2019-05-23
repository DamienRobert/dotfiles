vim: ft=markdownlight fdm=expr

Topologie
=========

(Références: stack project)

Irreducible
-----------

Si Y \subset X, Y irréductible <=> Ybar est irréductible.
Si X irréductible, les ouverts de X sont irréductibles.

Si U est un ouvert de X, il y a bijection entre les irréductibles de U et
les irréductibles de X rencontrant U (explicitement via les applications Y
\subset U -> Ybar, Y \subset X -> Y \inter U)

L'image d'un irréductible par une fonction continue est irréductible,
l'image d'un point générique par une fonction continue est un point
générique.

Quasi-Compact
-------------

f: X->Y est quasi compact si l'image réciproque d'un qc est qc.
Un sous-ensemble Z de X est rétrocompact si l'inclusion est qc. Ca veut
dire que l'intersection de Z avec tout qc de X est qc.
f: X->Y est quasi séparé si la diagonale (=le morphisme diagonal) est
quasi-compacte (pour un morphisme de schéma, séparé <=> la diagonale est
une immersion fermée => quasi-séparé)

Ex: un fermé qc est rétrocompact.

Soit f:X->Y continue. X qc => f(X) qc; f qc => f(X) rétro compact.

Lemme: Soit X un espace T0 (aka espace de Kolmogorov, aka pour tout point
x, y, il existe un ouvert contenant x mais pas y. Example: les schémas sont
T0) non vide et qc. Alors l'ensemble des points fermés de X est non vide et
qc.

Déf: un espace est localement quasi-compact ssi tout point a des voisinages
quasi compacts. Il est dit quasi séparé si l'intersection de deux qc
ouverts est qc.

Rem: si on a une base d'ouverts qc, il suffit de vérifier que
l'intersection de ces ouverts est qc pour être qs.

Example: un schéma est localement qc, car tout affine est qc. S'il est
séparé, l'intersection de deux affines est affines, donc il est
quasi-séparé. En fait quasi séparé <=> l'intersection de deux ouverts
affines est l'union d'un nombre fini d'affines.

Lemme: soit X un espace qs qui a une base d'ouverts qc. Alors
- X est localement qc
- Un ouvert U qc est rétrocompact.
  De plus il existe un système cofinal de recouvrements finis de U par des
  ouverts qc (dont les intersections sont qc par qs).

Composantes connexes:
--------------------
Soit X un espace qc, qui a une base d'ouverts qc (ex: localement qc) et qs.
Alors T est fermé dans X, union de composantes connexes <=> T est
intersection d'ensembles ouvers fermés dans X. De plus la composante
connexe de x \in X est l'intersection des ouverts fermés contenant x.

Noetherian
----------

In mathematics, a Noetherian topological space is a topological space in
which closed subsets satisfy the descending chain condition.

The Noetherian condition can be seen as a strong compactness condition:
- Every Noetherian topological space is quasi-compact.
- A topological space X is Noetherian if and only if every subspace of X is
  quasi-compact. (i.e. X is hereditarily compact).

Si X est noethérien, tout sous-espace de X est noéthérien. De plus X est
l'union d'un nombre fini d'espaces irréductibles maximaux (qui ne sont donc
pas inclus dans l'union des autres par maximalité).

Si X est noéthérien, X est qc et tout sous-espace de X est rétrocompact.
X noéthérien <=> X est loc noéthérien et qc <=> X est recouvert par un
nombre fini d'ouverts noéthériens.

Espaces constructibles
----------------------

E \subset X est constructible si E= Union finie U \inter complémentaire de
V, où U et V sont des ouverts rétrocompacts. Il est localement
constructible s'il existe un recouvrement ouvert par des X_i tels que
E\inter X_i est constructible.
(Dans la terminologie des EGA, constructible => globalement constructible,
localement constructible => constructible)

- L'espace des constructibles est fermé par complémentaire, unions finies et
intersections finies.
- Si E est constructible et U ouvert, E\inter U est constructible dans U.
- Si f est continue et la préimage d'un rétro compact est rétro compact,
  alors la préimage d'un constructible est constructible.
- Si X=union finie des X_i, X_i ouvert rétrocompact, alors E constructible
  <=> E \inter X_i constructible dans X_i pour tout i.

### Densité

Soit E constructible et Z irréductible. Alors on a <=>
(i) E \inter Z est dense dans Z
(ii) E \inter Z contient un ouvert (forcément dense) de Z
(iii) Si Z a un point générique z, E\inter Z contient z.

### Noethériannité

Rappel: l'intersection d'un ouvert et d'un fermé <=> localement fermé.
Si X noéthérien, constructible <=> union finie de loc fermés.

Prop: Si X noeth,
- E constructible <=> pour tout fermé irréductible Z de X, E \inter Z soit n'est pas dense, soit contient un ouvert (forcément dense) de Z.
- Si E constructible, E contient un voisinage de X <=> E \inter Z est dense
  dans Z pour tout fermé irréducible Z contenant X.
- E est ouvert <=> pour tout fermé irréductible Z de X, E \inter Z soit est
  vide, soit contient un ouvert de Z.

Th: X noeth, E constructible
- E ouvert <=> E stable par générisation
- E fermé <=> E stable par spécialisation

Th: Si f:X->Y est un morphisme de type fini de schémas noéth, alors f
envoit un constructible sur un constructible. En particulier, f(X) est
constructible, et par la prop précédente, il contient un ouvert de sa
cloture.

Extension au cas de prés finie: si f est de prés finie, f envoie un loc
constructible sur un loc constructible.

Rem: une union finie de qc est qc. Donc si X est qc + loc noeth, il est
noeth (en tant qu'espace topologique). Si X est loc noeth, alors tout
sous-ensemble Y de X est rétrocompact.

Pr: soit K qc dans X, K est donc dans l'union finie de X_i ouverts noeths.
K \inter X_i est donc noeth, donc Y \inter K \inter X_i est qc. Mais Y
\inter K est l'union de ces ensembles, donc est quasi-compact.

Spécialisations
---------------

f: X->Y morphisme de schéma. 
Going down <=> f lifte les spécialisations;
Going up <=> f lifte les générisations.

f: X->Y application continue.
Si f est fermée, f lifte les spécialisations.
Si f est ouverte, X noéthérien et sobre, Y T0, alors f lifte les
générisations.

Evitement
---------

Lemme 3.3 d'Eisenbud:
Si J inclus dans l'union des I_j, et soit l'anneau R contient un corps
infini, soit au plus 2 I_j ne sont pas premiers, alors J est inclus dans un
I_j.

Application: soit E={P_i}, F={P_j} deux ensembles d'idéaux premiers, tels
que P_i n'est pas inclus dans P_j.
Alors il existe un élément qui est dans chaque P_i et n'est dans aucun P_j.

Pr: Sinon l'intersection des P_i serait contenu dans l'union des P_j,
et donc par évitement dans un des P_j0, donc P_j0 contiendrait un
P_i0, contradiction.

* Interprétation géométrique

si E et F sont une collection d'espaces irréducibles d'un schéma affine, et
qu'un espace dans E ne contient pas un espace dans F, alors il existe un
ouvert affine élémentaire qui intersecte chaque élément de F, mais aucun
élément de E.

Rem: (on n'a pas besoin que E soit composé d'idéaux premiers/resp d'espaces
irréducibles). Ce qui donne:

Th: soit X un schéma affine, et Y un fermé de X. Soit Z_i \subset X un ens
fini de fermés qui ne sont pas inclus dans Y. Alors il existe un ouvert
élémentaire disjoint de Y qui a une intersection non nulle avec chaque Z_i.

Cor: X est T0. (ce qui est trivial à vérifier directement...)

Faisceaux
=========

Base d'ouverts
--------------

Soit X un espace topologique, T la topologie de Grothendieck naturelle
dessus. Si X a une base fondamentale d'ouverts, soit U la topologie de
Grothendieck associée à cette base.

Alors il y a équivalence entre les U-faisceaux et les T-faisceaux. En
particulier, si F est un T-préfaisceau, le T-faisceau associé ne dépend que de
la restriction de F à U. Donc:
- Deux préfaisceaux sur T qui sont égaux sur U ont le même faisceau
  associé.
- Deux faisceaux sur T qui sont égaux sur U sont égaux.
- Si F est un préfaisceau égal à un faisceau G sur U, alors le faisceau
  associé à F est G.

On peut recoller des faisceaux.

Germes
------

Les faisceaux de modules forment une catégorie abélienne (donc tout
mono/épi est effectif, ie est un noyau/conoyau).

Un morphisme de faisceau est mono/épi/bij ssi c'est le cas en chaque germe.
Le foncteur Ker/Coker/Im/Coim commute avec les germes.

Le foncteur faisceau associé à un préfaisceau est exact à gauche (ie envoit
un mono sur un mono) et conserve les germes.
Le foncteur section globales est exact à gauche.

Soit f:F->G.
- Im f = F/Ker f; coker f=G/Im f
- f monomorphisme équivaut à F(U) \subset G(U) pour tout U. Ex: im(f) ->
G est toujours un monomorphisme.
- f épi ss'il l'est sur les sections locales d'un recouvrement ouvert.
- Si f est mono, on a une suite exacte 0->F->G->H->0 où H=G/F.
  Réciproquement, si on a une telle suite exacte, F est un sous faisceau de
  G et H est le quotient associé.

Limite inductive de faisceau: ce n'est pas forcément un faisceau (c'est le cas s'il s'agit d'une limite directe), ie il faut prendre le faisceau associé.
La limite proj de faisceau est un faisceau.

Si s est une section globale de F, son support est fermé.

Faisceaux flasques
------------------

Un faisceau est flasque ssi pour tout V \subset U, F(U)->>F(V).
- Si 0->F->G->H->0 est exact et H flasque, alors pour tout ouvert U
  0->F(U)->G(U)->H(U)->0 est exact, ie un faisceau flasque est
  cohomologiquement trivial.
- Si F et H sont flasques, G aussi.
- L'image directe d'un faisceau flasque est flasque.
- Tout faisceau F s'inclut dans un faisceau flasque G (le faisceau des
  sections discontinues, où on prend X l'espace étalé de F que l'on munit
  de la topo discrète).

Adjonction
----------

Hom_X(f^-1 G,F)=Hom_Y(G,f_* F).

Ouverts et fermés
-----------------

Soit X un espace topo, Z un fermé, U son complémentaire ouvert, i,j les
inclusions.

- Si F est un faisceau sur Z, alors i_*(F) a pour germe F_P si P \in Z, 0
  sinon. On dit qu'on étend F par 0 en dehors de Z.
- Si F faisceau sur U, on note j!(F) le faisceau associé au préfaisceau
  V->F(V) si V \subset U, 0 sinon. Alors les germes de j!(F) sont F_P si P
  \in U, 0 sinon; j!(F) est l'unique faisceau ayant cette prop dont la
  restriction à U soit F, on l'appelle aussi l'extension de F par 0.
Si F faisceau sur X, on a la suite exacte
0->j!(F|U)->F->i_*(F|Z)->0

Sous-faisceau des supports
--------------------------

Si F faisceau sur X, on définit H^0_Z(F) le faisceau qui à un ouvert V
associe l'ensemble des F(V) dont le support est dans F \inter V. C'est bien
un faisceau, et on a une suite exacte
0->H^0_Z(F)->F->j_*(F|U)
Si de plus F est flasque, c'est exact à droite.

Dans le cas des modules quasi-cohérents, si Z est défini localement sur un
ouvert affine U par l'idéal I,
H^0_Z(F) est défini comme le sous-module (0:I^\infty) du module F(U).
Cf PrimaryDecomposition/EmbeddedPrimes ou Hartshorne Exo II.5.6

Espaces Géométriques
====================

Def: un espace géométrique est un espace topologique localement annelé.
La catégorie des espaces géométriques admet les limites inductives et
projectives.

Th: - le foncteur section globales a un adjoint à droite: 'Spec'
    Hom(X,Spec A)=Hom(A,O(X))
    - O(Spec A)=A donc A -> Spec A est un plongement pleinement fidèle

On a donc plongé la catégorie (opposée) des anneaux dans une catégorie
géométrique. Un autre plongement est donné par Yoneda dans les Z-foncteurs
(= foncteurs de la catégorie des anneaux dans les ensembles).
Essentiellement, les schémas viennent de l'intersection de ces deux
catégories.

Plus précisément:
Th: le foncteur S: Espaces géométriques -> Z-foncteur
                     X -> (A -> Hom(Spec A, X))
    a un adjoint à à gauche |.| dit de 'réalisation géométrique'
      Hom(|F|,X)=Hom(F,SX)

Pr: Un foncteur F est toujours isomorphe à la limite inductive de la
catégorie /F (ie des anneaux au-dessus de F). Autrement dit on prend la
limite inductive des x \in F(A), où l'on voit un tel x comme un morphisme
A->F via Yoneda. On pose alors |F|=lim inductive le long de ces x de Spec
A. L'équivalence de Catégorie résulte alors plus ou moins formellement de
l'adjonction entre O et Spec précédente.

Th: On appelle schémas la sous-catégorie où S et |.| induisent une
équivalence de catégorie. Au niveau des espaces géométriques un schéma est
un espace localement affine. Au niveau des foncteurs, un schéma est un
foncteur local (=faisceau sur le site de Zariski) recouvert par des schémas
affines (où recouvert se voit sur la catégorie des corps)

Rem: Via la définition du foncteur |.|, on voit que les schémas (dans la
catégorie géométrique ) sont limites inductives de schémas affines. En fait
ce sont même les plus petites telle limites. En effet, l'image de |.| est
par construction donnée par des limites inductives de schémas affines, et
être un schéma signifie (pour un espace X) X=|S X|, ie X=lim inductive des
Spec A -> X (en général pour un espace géom X quelconque, lim inductive des
Spec A -> X s'envoit dans X mais peut ne pas être isomorphe).

Commentaire sur le blog de David
--------------------------------
cf aussi:
http://www.madore.org/cgi-bin/comment.pl/showcomments?href=http%3a%2f%2fwww.madore.org%2f~david%2fweblog%2f2013-09.html%23d.2013-09-21.2160

@Cargo du Mystère

Étant donné que ma définition définit les mêmes objets, c'est bien
"essentiellement" la même suivant le niveau de poussière que l'on se permet
de cacher sous le tapis ;) (poussière consistant en la démonstration que
les deux notions sont bien équivalentes).

> Le problème avec la définition purement fonctorielle des schémas c'est que
> l'on ne comprend pas pourquoi parmi tous les foncteurs, la sous catégorie
> des schémas est intéressante.

En introduisant la catégorie ESP des espaces localement annelés, on peut
motiver ça de la façon suivante:
- on a un foncteur Spec, adjoint du foncteur section globale O. Comme
  O(Spec A)=A, la catégorie (opposée) des anneaux se plonge dans ESP.
- On a un autre plongement canonique de la catégorie (opposée) des anneaux
  dans Z-FONCTEURS via Yoneda.
- La catégorie des schémas est "l'intersection" de ces deux catégories.
  De manière plus précise:
  via le plongement précédent, en prenant Yoneda de ESP restreinte à la
  sous-catégorie (opposée) des anneaux, on a un foncteur S de ESP dans
  Z-FONCTEURS.

  Th: Le foncteur S admet un adjoint à gauche R (réalisation géométrique)
  Pr: Si on a un Z-foncteur F, alors F est la limite inductive de la
  catégorie /F, ie on prend les x \in F(A) où on voit x \in F(A) via un
  morphisme de R dans F.
  On pose alors R(F)=limite inductive des Spec A.

  Déf: Les schémas sont la sous-catégorie de ESP (ou Z-FONCTEURS) où R et S
    forment une équivalence de catégorie.

Remarque: la catégorie ESP admet limite inductive et projective. Comme Spec
est adjoint à droite, les Spec sont stables par limite projective, mais pas
par limite inductive. De manière amusante, via la définition précédente on
peut voir que les schémas sont 'les plus petites limites inductives de
Spec'. Dans le sens qu'un espace géométrique X est un schéma si et
seulement si X=R(S(X)), ie non seulement X est limite inductive de schémas
affines (car dans l'image de R), mais même X est isomorphe à la limite
inductive de la catégorie des schémas affines/X.

@David

Si je ne me trompe pas, comme l'espace topologique d'un espace localement
annelé X est uniquement donné par les X(K), où K est un corps, pour la
définition de recouvrement il suffit de demander que X(K)=\cup
U_{\alpha}(K) pour tout corps K.

Intuition géométrique
---------------------

si f:X->Y (schéma), on voit le morphisme des faisceaux comme la "composée
avec f". Donc on voit bien que c'est un morphisme d'anneau local: si
\phi s'annule en y=f(x), f* \phi "=" \phi o f s'annule en x
(ie f*(m) \subset n), ou encore si \phi est une fonction sur Y telle que f*
\phi=0 sur x, alors \phi=0 sur f(x), ie f*^{-1}(n)=m.
- Si Z est une partie fermée de Y, elle est uniquement caractérisée
par l'idéal I=Id(Z) (car Y est un schéma). On a f*: O(Y) -> O(X), et si x \in
X, f(x) \in Z ssi f*(I) s'annule sur x, ie f^-1(Z)=Var(f* I).
- De même, si T est une partie fermée de X d'idéal J, l'adhérence de
  f(T) est donné par Var(f*^{-1} J).
  [En effet on peut aussi regarder ça sur le point générique de T, ça vient
  du fait que le morphisme est local]
- f^{-1}(u \ne 0)={ f*(u) \ne 0 }

Schémas
=======

http://www.madore.org/~david/weblog/2013-09-21-definition-schema.html#d.2013-09-21.2160.definition-schemas

1) Foncteurs
   =========

Un foncteur (covariant) X des k-algèbres vers les ensembles (encore appelé préfaisceau [sur les k-schémas affines]), est une donnée qui à toute k-algèbre A associe un ensemble X(A) et à tout morphisme φ:A→B (de k-algèbres) une application X(φ):X(A)→X(B), de sorte que X(idA)=idX(A) (en notant id l'identité), et que si φ:A→B et ψ:B→C sont deux morphismes alors X(ψ∘φ)=X(ψ)∘X(φ).

Si R est une k-algèbre, on définit un foncteur noté Homk(R,—) ou Spec(R), qui à une k-algèbre A associe l'ensemble Homk(R,A) des morphismes R→A de k-algèbres, et à un morphisme φ:A→B la composition par φ. On dit qu'il s'agit du foncteur représenté par R ou du spectre de R ; un foncteur qui est de cette forme (ou isomorphe à un tel foncteur, cf. plus loin) est appelé foncteur représentable [par une k-algèbre] ou schéma affine (sur k).

Remarque : Si X est un foncteur (covariant des k-algèbres vers les ensembles) et φ:A→B un morphisme de k-algèbres, et ξ∈X(A), on notera souvent abusivement φ(ξ) pour l'image de ξ par l'application X(φ).

Si X et Y sont deux foncteurs (covariants des k-algèbres vers les ensembles), une transformation naturelle ou morphisme de foncteurs u:Y→X est une donnée qui à toute k-algèbre A associe une application u(A):Y(A)→X(A), et qui vérifie la condition (de « naturalité ») suivante : si φ:A→B est un morphisme (de k-algèbres) alors les deux composées X(φ)∘u(A) (soit Y(A)→X(A)→X(B)) et u(B)∘Y(φ) (soit Y(A)→Y(B)→X(B)) coïncident.

Si u:Y→X et v:Z→Y sont deux morphismes de foncteurs, leur composée u∘v est définie comme le morphisme de foncteurs Z→X qui à chaque k-algèbre A associe l'application composée u(A)∘v(A). On dit par ailleurs d'un morphisme de foncteurs u:X→Y qu'il est un isomorphisme lorsque chaque application u(A) est une bijection, auquel cas les bijections réciproques définissent un isomorphisme de sens inverse avec lequel la composée est l'identité ; on peut dire alors que les foncteurs X et Y sont isomorphmes.

Remarque : Si u:Y→X et ξ∈X(A), on notera souvent abusivement u(ξ) pour l'image de ξ par l'application u(A).

Si λ:R→S est un morphisme de k-algèbres, il se déduit un morphisme λ*:Spec(S)→Spec(R) entre les foncteurs représentés par R et R de la manière suivante : pour toute k-algèbre A, l'application λ*(A) de l'ensemble Homk(S,A) (des morphismes S→A) vers l'ensemble Homk(R,A) (des morphismes R→A) est simplement la composition par λ.

Plus généralement, si X est un foncteur (covariant des k-algèbres vers les ensembles) et S une k-algèbre, de tout ξ∈X(S), on déduit un morphisme Spec(S)→X, qu'on notera également ξ* : pour toute k-algèbre A, l'application ξ*(A) de l'ensemble Homk(S,A) (des morphismes S→A) vers l'ensemble X(A) est celle qui envoie un morphisme σ:S→A sur l'image de ξ par X(σ).

Lemme de Yoneda : Les morphismes de foncteurs Spec(S)→Spec(R) entre deux foncteurs représentables sont exactement les λ* pour λ un morphisme λ:R→S (c'est-à-dire que λ* détermine uniquement λ et que tous les morphismes sont de cette forme). Plus généralement, les morphismes Spec(S)→X sont exactement les ξ* pour ξ∈X(S).

2) Morphismes
   ==========

Si u:Y→X est un morphisme entre foncteurs (covariants des k-algèbres vers les ensembles), on dit que u est un monomorphisme lorsque u(A):Y(A)→X(A) est une injection pour toute k-algèbre A ; on dit aussi que Y est vu comme un sous-foncteur de X (c'est-à-dire comme la donnée d'un sous-ensemble Y(A) de chaque X(A) qui soit préservé par les morphismes).

Si X et Y sont deux foncteurs, on définit un foncteur X×Y (produit cartésien de X et Y) comme le foncteur qui à tout A associe le produit cartésien de X(A) et Y(A) (l'action des morphismes se faisant composante par composante). Si de plus on a deux morphismes de foncteurs u:X→Z et v:Y→Z vers un même foncteur Z, on définit le produit fibré de X et Y au-dessus de Z, noté X×ZY, comme le sous-foncteur de X×Y qui à A associe l'ensemble formé des couples (x,y)∈X(A)×Y(A) tels que u(x)=v(y) dans Z(A).

La projection X×ZY → X sur la première coordonnée définit un morphisme qu'on appelle le tiré en arrière ("pullback") de v le long de u (et symétriquement, la seconde projection est le tiré en arrière de u le long de v). Il est évident que le tiré en arrière d'un monomorphisme est encore un monomorphisme.

(On remarquera que le produit cartésien est un cas particulier du produit fibré où Z est le foncteur {*}=Spec(k) qui à toute k-algèbre A associe un singleton.)

Fait : Si X=Spec(R) et Y=Spec(S) ainsi que Z=Spec(T) sont tous les trois représentables(=affines), alors le produit fibré X×ZY est représentable : la k-algèbre qui le représente est notée R⊗TS et appelée produit tensoriel des algèbres R et S au-dessus de T.

Soit Ω le foncteur qui à une k-algèbre A associe l'ensemble de ses idéaux (et à un morphisme φ:A→B associe l'application envoyant un idéal de A sur l'idéal engendré par son image dans B). Soient 0 et 1 les sous-foncteurs de Ω qui choisissent l'idéal nul et l'idéal unité respectivement, c'est-à-dire : 0:Spec(k)→Ω envoie (pour toute k-algèbre A) l'unique élément du singleton Spec(k) sur l'idéal nul de A, tandis que 1:Spec(k)→Ω l'envoie sur l'idéal A tout entier.

On dit qu'un morphisme de foncteurs Y→X (nécessairement un monomorphisme) est une immersion fermée (resp. ouverte) lorsqu'il s'obtient en tirant en arrière le morphisme 0 (resp. 1) par un certain morphisme X→Ω. (Et lorsqu'on considère les tirés en arrière de 0 et 1 par le même morphisme X→Ω on peut dire qu'on a affaire à des immersions ouverte et fermée complémentaires.)

[[  En particulier, si Y→X est une immersion fermée, alors pour toute k-algèbre R et tout ξ∈X(R), il existe un idéal I de R tel que le tiré en arrière de Y→X le long de ξ*:Spec(R)→X soit Spec(R/I)→Spec(R) (ou plus concrètement : pour tout morphisme φ:R→A, on a φ(ξ)∈Y(A) si et seulement si φ s'annule sur I) ; et en fait, cette propriété peut servir de définition d'une immersion fermée : une immersion fermée est un morphisme de foncteurs qui, quand on le tire en arrière par un Spec(R)→X, est représentable par l'immersion fermée définie par un quotient Spec(R/I)→Spec(R). Comme le quotient détermine complètement l'idéal I, on peut voir ainsi que le morphisme X→Ω qui définit une immersion fermée est uniquement déterminé par celle-ci ; on peut (un peu abusivement) l'appeler le faisceau d'idéaux définissant cette immersion fermée.

Une immersion ouverte U→Spec(R) est définie par un idéal I de R : mais contrairement à l'immersion fermée Spec(R/I)→Spec(R) dont elle est complémentaire, qui envoie une k-algèbre A sur le sous-ensemble des morphismes R→A qui s'annulent sur I, l'immersion ouverte U→Spec(R) définie par I envoie A sur le sous-ensemble U(A) des morphismes φ:R→A tels que φ(I) engendre l'idéal unité de A. Un cas particulièrement important, où l'immersion ouverte est affine, est celui où I est engendré par un unique élément f∈R (i.e., principal) ]]

3) Topologie
   =========

Si R est une k-algèbre, et f∈R, on désigne par R[1/f] (et on appelle localisation de R inversant f) le quotient R[z]/(z·f−1) de l'anneau R[z] des polynômes en une indéterminée z sur R par son idéal engendré par z·f−1 (ce qui fait de z un inverse de f) ; on notera g/fi l'image de zi·g dans ce quotient (et tous les éléments de R[1/f] sont de cette forme).

Les morphismes R[1/f]→A (vers une k-algèbre A quelconque) s'identifient naturellement aux morphismes φ:R→A tels que φ(f) soit inversible. Autrement dit, Spec(R[1/f])→Spec(R) est une immersion ouverte (associée à l'idéal principal engendré par f). On dit que Spec(R[1/f]) est l'ouvert principal défini par f.

Il est opportun de remarquer que R[1/f][1/f′] s'identifie à R[1/(f·f′)].

Soit X un foncteur (covariant des k-algèbres vers les ensembles). Si A est une k-algèbre et si f1,…,fr sont des éléments de A qui engendrent l'idéal unité de A, on appelle famille compatible d'éléments xi∈X(A[1/fi]) une famille telle que xi et xj aient la même image dans X(A[1/(fi·fj)]). Remarquons que tout élément x∈X(A) définit (si on appelle xi son image par la flèche X(A)→X(A[1/fi]) de fonctorialité) une telle famille compatible.

On dit que X est un faisceau [pour la topologie] de Zariski lorsque (pour toute k-algèbre A et toute famille f1,…,fr d'éléments A qui engendrent l'idéal unité), l'application qui à un x∈X(A) associe la famille compatible qu'il définit, est une bijection. Si cette application est seulement une injection, on dit que X est un préfaisceau séparé pour la topologie de Zariski.

Fait : Les foncteurs représentables Spec(R) (ainsi que le foncteur Ω) sont des faisceaux de Zariski. Par ailleurs, si X, Y et Z sont des faisceaux, alors X×ZY en est aussi un.

4) Schémas
   =======

Un schéma [sur k] est un foncteur (covariant des k-algèbres vers les ensembles) X tel que :

    - ce foncteur X est un faisceau pour la topologie de Zariski, et
    - il existe une famille d'immersions ouvertes Uα→X telles que :
        * chaque Uα soit un schéma affine (Uα=Spec(Rα)), et
        * pour toute k-algèbre A, tout élément x∈X(A) appartient « localement » à un des Uα, au sens où il existe f1,…,fr engendrant l'idéal unité dans A tel que l'image de x dans chaque X(A[1/fi]) soit dans l'image d'un Uα(A[1/fi])
    (on dit encore que les Uα recouvrent X).

Il revient au même de demander qu'il existe une famille d'immersions ouvertes Uα→X telles que X soit le faisceautisé de la réunion des Uα dans X.

[Ajout : On peut aussi exprimer le dernier point (b2) de la façon suivante : pour tout corps K (qui soit une k-algèbre), l'ensemble X(K) est la réunion des Uα(K).]
