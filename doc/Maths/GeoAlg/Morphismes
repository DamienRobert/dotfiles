vim: ft=markdownlight fdm=expr

Type de morphismes
==================

Résumé
------

* https://stacks.math.columbia.edu/tag/02WE
$ 62.4 Lists of useful properties of morphisms of schemes

Liste de propriétés stables par changement de base arbitraire, composition
(sauf marqué *), et fpqc local en la base (sauf marqué #)
  - f iso; f closed, open, and qc immersions; f immersion (#fppf local)
  - f qc, qs, separated
  - f monomorphism, surjective
  - f affine, quasi-affine
  - f proper, H-projective (#), (loc.) projective (*#)
  - f finite, integral
  - f (loc.) of finite type/prés, (loc.) quasi-finite, 
  - f loc. of finite type of rel. dim. d (*), loc. free of deg. d (*),
  - f flat, syntomic, smooth, unramified, G-unramified, étale, finite loc. free
  - f universally closed/open/submersive/injective/homeo.

* Local en la source pour
- f est τ-local en la source pour la τ-topologie (sauf pour fpqc)
- fpqc: f flat, OY,f(x)→OX,x est injectif
- fppf: f loc of finite pres, f loc of finite type,
        f open, f universellement open
- étale: f loc quasi-finite, f unramified, f G-unramified

* Εtale local on source-and-target:
- loc. of   finite presentation / finite type / quasi-finite,
  univ. open, flat, syntomic, smooth, étale, unramified, G-unramified.
- And as a property of germs: OS,s→OX,x is flat,
  the local ring OXs,x of the fibre has dimension d, trdeg_κ(s) κ(x)=r, dim_x(Xs)

* Descend par un morphisme fppf, au sens
  X->Y->S tel que p: X->Z a (P) et f: X->Y est fppf => q: Y->Z a (P):
  (loc.) finite presentation, (loc.) finite type, syntomic, smooth, étale.

  Descent pour la topologie fpqc pour F quasi-cohérent:
  type fini, prés. finie, de rang r, plat, fini localement libre, localement projectif.
  [Et si f: X->Y fini (+ de prés. finie), alors F est fini (de prés. finie) <=> f_* F est fini (de prés. finie)]

Propriétés de type affine local
--------------------------------
f: X->Y morphisme de schéma.

Les props suivantes sont affines locales sur la cible, ie si il existe un recouvrement ouvert de Y par des Y_i affine tels que f^-1(Y_i)->Y_i a P => f a P.
Rem:
- toutes ces propriétés se composent (ie f et g qc => gof qc, ...)
- toutes ces propriétés sont stable par pullback
- en fait la plupart de ces propriétés sont fpqc ou fppf locale sur la cible, cf plus bas.

* Qcqs:
- f quasicompact ssi la préimage d'un affine est qc (ie est union finie d'affines)
- f quasiséparé ssi la préimage d'un affine est quasiséparé
                = l'intersection de deux affines dans la préimage d'un affine est qc
                = diagonal map is qc
- f séparé = la diagonale est une immersion fermée
           = l'intersection de deux affines dans la préimage d'un affine est affine et OX(U)⊗OX(V)→OX(U∩V) is surjective. 

  Exemples:
  - X->Spec Z qs coincide avec la notion habituelle de qs, ie l'intersections de deux ouverts qc est qc
  - X noéthérien => f: X->Y qcqs; en effet tout ouvert de X est qc

  Plus de détails sur les morphismes qc qs: http://therisingsea.org/notes/ConcentratedSchemes.pdf et https://stacks.math.columbia.edu/tag/01KH $ 25.21 Separation axioms

* Finitude:
- f est loc. de type fini ssi pour tout affine B contenu dans la préimage
  d'un affine A, alors B est de type fini sur A
- f est de type fini ssi f est loc. de type fini et f est qc
  I.e. pour tout ouvert affine A, f^-1(Spec A) peut-être recouvert par un nombre fini de schémas affines de types finis sur A.
- f est loc de présentation finie ssi pour tout affine B contenu dans la
  préimage d'un affine A, B est une algèbre de présentation finie sur A.
- f est de présentation finie ssi elle est loc de présentation finie et qc
  *et* qs. 
  I.e. pour tout ouvert affine A, f^-1(Spec A) peut-être recouvert
  par un nombre fini de schémas affines de présentations finies sur A et
  d'intersection deux à deux qc.

  Exemple:
  - Si f est loc de type fini et Y loc noeth, X est loc noeth. Si f est de
  type fini et Y noeth, X est noeth.

* Entier, fini, quasi fini:
- f est finie ssi la préimage d'un affine A est un affine B fini sur A
  [ie locally B/A anneau fini] => affine
  Entier + loc. de type fini <=> fini.
- f est entier ssi la préimage d'un affine A est un affine B entier sur A
  (ie locally B/A anneau intégral ie tout élément de B est entier sur A)
  => affine
- f est (loc.) quasi finie si elle est (loc.) de type fini et les points
  sont isolés dans leur fibre

* Affine et propre:
- f est affine ssi la préimage d'un affine est affine
  => séparé et qc
- Propre = separated, of finite type, and universally closed
  Universally closed => qc https://stacks.math.columbia.edu/tag/04XU
* Immersions:
- immersion ouverte
  => loc. présentation finie
  Si Y qs et U \subset Y ouvert qc (ou si Y loc. noeth), alors U est rétrocompact, ie U->Y est qc, donc U->Y est de type fini.
- immersion fermée
  => affine, de type fini
- immersion = locally closed immersion = open o closed
  => qc si Y loc. noeth
  Note https://stacks.math.columbia.edu/tag/03DQ:
  Si X est réduit ou f qc, une immersion s'écrit aussi X -open> Xbar -closed> Y

* Régularité:
- f flat
- f syntomic = plat, loc. prés fini, à fibres intersection complète
- f smooth = plat, loc. prés fini, à fibres lisses
- f (G-)unramifed = loc. type (resp. prés) fini, à fibres non ramifiées
- f étale = plat, loc. prés fini, à fibres étales

Le fait d'être plat + loc. de prés fini permet de passer des fibres
intersection complète/lisses étales à localement f est standard
syntomic/lisse/étale.

*** Remarques:
- Les props suivantes sont de plus locales (ie locales en la source aussi):
  f loc of finite pres, f loc of finite type,
  f open, f universellement open
  f loc quasi-finite, f unramified, f G-unramified
- f iso/immersion ouverte, sont même des propriétés locales pour tout recouvrement ouvert, pas forcément affines, sur la cible

* Morphisme diagonal
Si f:U->X et g:V->X sont des morphismes au dessus de S, alors
U x_X V = (U x_S V) x_{X x_S X} X.
Ainsi si le morphisme diagonal est (P) et (P) stable par pullback, U x_X V ->
U x_S V est (P).

De plus, si f et g se factorisent par Y->X (mono), alors
U x_X V = U x_Y V (car U x_X V est l'équalisateur de U x V => Y->X donc par
définition d'un mono c'est aussi l'équalisateur de U x V => Y).
Donc si U et V sont au dessus d'un affine dans S, (U x_S V) est affine.

Exemples:
- f qs ssi la diagonale est qc => si U et V sont deux affines de X au
  dessus d'un affine W de S,  U x_X V est le pullback de l'affine U x_W V
  donc qc
- si la diagonale est affine, et f: U->X avec U est affine sur S, alors
  f est affine. En effet, si V est affine et V->X, le pullback
  U x_X V est le pullback de (U x_S V) qui est affine (car U->S est affine)
  par la diagonale qui est affine, donc est bien affine.

* Pullback des fibres
f: X->Y, si on a Y1, Y2->Y, X1 et X2 les pullbacks correspondant,
Y12= Y1 x_Y Y2, alors X12:= X x_Y Y12 = X1 x_X X2 = X1 x_Y1 Y12
Et donc si Z -> Y12, on a X x_Y Z= X12 x_Y12 Z.

Exemple: Y1=Y', Y2=y un point, Z=y' un point de Y' s'envoyant sur Y.
Alors X_Z=X_Y',y' la fibre de X_Y'->Y' en y' et X12=X_Y',y.
On voit que X_Y',y->Y'_y est un pullback de X_y -> y, et donc en écrivant
y' -> Y'_y -> Y', on voit que X_Y',y' -> y' est un pullback de X_y->y par
y'->y.

Ainsi des conditions sur les fibres comme géom réduit/intégre/connexe est
stable par pullback (car ces propriétés sont stables par extension de
corps).

* Application: Si Z est un fermé de Spec A localement définit par une
équation, alors son complémentaire est affine.
Pr: sur un ouvert affine Spec B assez petit, Z est défini par f, donc son
complémentaire est B_f est affine. Mais être affine est cible local, donc
le complémentaire de Z est affine.

Propriétés locales des morphismes sur les anneaux
-------------------------------------------------

Une propriété P "locale" sur les anneaux permet de définir une propriété
"loc. P" locale en la source et le but sur les morphismes de schémas:

* https://stacks.math.columbia.edu/tag/01SQ
$ 28.13 Types of morphisms defined by properties of ring maps
Une propriété P de morphisme est locale si
- P(X -> Y) => P(X_f -> Y_f) (où X=Spec S, Y=Spec R)
  ie P est stable par pullback d'ouvert canonique
- P(X -> Y_f) => P(X_a -> Y)
  ie P est stable par pre et postcomposition d'un ouvert canonique
- P(X -> Y_i) => P(X->Y) si Y=\union Y_i décomposition en ouverts canoniques

Dans ce cas on dit qu'un morphisme f:X->Y est loc. P si pour tout x il y a
des ouverts affines U et V tels que f:U->V a P.
Th: f loc. P (<=>)
- pour tout f:U->V affines, f est P (en tant que morphisme d'anneaux)
- il existe des recouvrements ouverts U_i et V_j de X et Y tels que
  f(U_i)->V_j est P
  (idem en demandant des recouvrements ouverts affines)
Autrement dit, "loc. P" est source et base Zariski-local.

Props:
- Si P est local et stable par composition, la composition de morphismes loc. P est loc. P.
- Si P est local et stable par pullback, un morphisme loc. P est stable par
  pullback.

Exemples:
- Finite presentation => "loc. de présentation finie":
  Si Y=Spec B est affine, alors f: X->Y est loc de type/prés fini ss'il
  existe un recouvrement affine de X par des A_i de types/prés finis sur B.
  Et donc dans le cas général, f est loc de type/prés fini ss'il existe un
  recouvrement de Y par des affines B_i tels que f^-1(B_i) est recouvert par
  des ouverts affines A_j de type/prés finis sur B_i.
  *Attention* Il existe des variétés quasi-affines (et donc de type fini) dont l'anneau des sections globales n'est pas de type fini.
  Pareil pour "finite type"
- (Isomorphism on local rings.) For every prime q of A lying over p⊂R the ring map R→A induces an isomorphism Rp→Aq. [stable par changement de base et composition]
- (Open immersion.) For every prime q of A there exists an f∈R, φ(f)∉q such that the ring map φ:R→A induces an isomorphism Rf→Af. [stable par changement de base et composition]
- (Reduced fibres.) For every prime p of R the fibre ring A⊗Rκ(p) is reduced.
- (Fibres of dimension at most n.) For every prime p of R the fibre ring A⊗Rκ(p) has Krull dimension at most n.
- (Locally Noetherian on the target.) The ring map R→A has the property that A is Noetherian. [stable par composition]

Propriétés locales pour les topologies
--------------------------------------

* https://stacks.math.columbia.edu/tag/02KN
$ 34.19 Properties of morphisms local on the target

τ∈{fpqc,fppf,syntomic,smooth,étale}

On dit qu'une propriété P de morphisme est locale en le but, si
f: X-> Y a P <=> pour tout τ-cover Y_i de Y, f: X_i:=X x_Y Y_i -> Y_i a P.
(En particulier si P est local, P est stable par pullback dans la topologie, car on peut toujours raffiner un morphisme en un recouvrement).

Autrement dit: If P is preserved under flat base changes and descends through flat surjective base changes, then we say P is flat local on the target.

Lemma 34.19.3: si P est locale en la cible et τ \ne fpqc, alors pour f:X->Y, il existe un plus grand ouvert W(f)\subset Y tel que X_W(f)->W(f) a P.

Preuve: On considère l'image W de tous les τ-morphismes Y'->Y tels que le
changement de base X'->Y' a P. Un τ-morphisme étant ouvert (c'est pour ça
qu'on exclue fpqc), W est ouvert.
En particulier W(f) est stable par changement de base dans τ:
si g:Y'->Y est dans τ, W(f')=g^{-1} W(f).

Lemma 34.19.4:
Prop: si P est locale (en la base) pour Zariski, préservé par pullback dans
la topologie, et descend pour un morphisme affine surjectif S'->S dans la
topologie, alors P est locale (en la base) pour la topologie tau.
[rem: pour τ syntomic, smooth ou étale on peut même supposer que S'->S
est standard]

- base local pour fpqc: f-qc, f-qs,
  f iso, f open/closed immersion, f immersion qc, f monomorphism,
  f (loc.) of finite type/presentation,
  f separated, f surjective,
  f proper, f affine, f quasi-affine,
  f integral, f finite, f (loc.) quasi-finite,
  f flat, f syntomic, f smooth, f unramifed, f G-unramified, f étale,
  f finite loc. free, f finite loc. free of deg d,
  f loc. of finite type of rel dim d,
  f universally-closed/open/submersive/injective/homeo.
- base local pour fppf: f immersion

* https://stacks.math.columbia.edu/tag/02KJ
$ 34.11 Descent of finiteness and smoothness properties of morphisms

Autres propriétés qui descendent au sens où X->Y->S est tel que
p: X->Z a (P) et f: X->Y est fppf => q: Y->Z a (P):
(loc.) finite presentation, (loc.) finite type, syntomic, smooth, étale.
[Note: dans le cas syntomic, on a même que f est syntomic]

Lemma 34.11.8. Let X→Y→Z be morphism of schemes. Let P be one of the following properties of morphisms of schemes: flat, locally finite type, locally finite presentation. Assume that X→Z has P and that {X→Y} can be refined by an fppf covering of Y. Then Y→Z is P.

* https://stacks.math.columbia.edu/tag/05AY
$ 35.7 Descent of finiteness properties of modules

On a les descente suivantes pour un module quasi-cohérent F pour la topologie
fpqc: type fini, présentation fini, de rang r, plat, fini localement libre, 
localement projectif.

Si f: X->Y fini (+ de prés. finie), alors F est fini (de prés. finie) <=> f_* F est fini (de prés. finie)

* https://stacks.math.columbia.edu/tag/036F
$ 34.23 Properties of morphisms local on the source

On dit que P est locale en la source, si f: X->Y a P <=> pour tout cover
X_i de X, f:X_i->Y a P.
(En particulier si P est local en la source, et g:Z->X est dans τ, fog a P car on peut toujours raffiner un morphisme en un recouvrement).

Note: dans ce cas (si τ \ne fqpc) il y a toujours un plus grand ouvert W(f) de X tel que W(f)->Y a P. [Lemma 34.23.3.]
Preuve: on prend W(f) l'image des X'->X dans τ tels que X'->X->Y a (P).
En particulier si g:X'->X est dans τ, W(X'->Y)=g^{-1} W(f).

Prop: si P est locale en la source et la base pour Zariski, préservée par
précomposition X'->X dans la topologie, et descend pour un morphisme
surjectif X'->X de schémas affines dans la topologie (pour f:X->Y affine),
alors f est locale en la topologie tau.

Note: f est τ-local en la source pour la τ-topologie (sauf pour fpqc, f est flat est local en la source, mais pas f qc). Eg: “f is syntomic” is syntomic local on the source.
- locale en la source pour fpqc: f flat, OY,f(x)→OX,x est injectif
- locale en la source pour fppf: f loc of finite pres, f loc of finite type,
  f open, f universellement open
- locale en la source pour étale: f loc quasi-finite, f unramified, f
  G-unramified

* https://stacks.math.columbia.edu/tag/04QW
$ 34.29 Properties of morphisms étale local on source-and-target

Definition 34.29.3. Let P be a property of morphisms of schemes. We say P is étale local on source-and-target if
  - (stable under precomposing with étale maps) if f:X→Y is étale and g:Y→Z has P, then g∘f has P,
  - (stable under étale base change) if f:X→Y has P and Y′→Y is étale, then the base change f′:Y′ ×_Y X→ Y′ has P, and
  - (locality) given a morphism f:X→Y (<=>)
    - f has P,
    - for every x∈X there exists a commutative diagram
      U -h-> V
      |a     |b (*)
      X -f-> Y
      with étale vertical arrows and u∈U with a(u)=x such that h has P.

Lemma 34.29.4. étale local on source-and-target =>
  - P is étale local on the source,
  - P is étale local on the target,
  - P is stable under postcomposing with étale morphisms: if f:X→Y has P and g:Y→Z is étale, then g∘f has P, and
  - P has a permanence property: given f:X→Y and g:Y→Z étale such that g∘f has P, then f has P.
Conversely [Lemma 34.29.6.] If
  - P is étale local on the source,
  - P is étale local on the target, and
  - P is stable under postcomposing with open immersions: if f:X→Y has P and Y⊂Z is an open subscheme then X→Z has P.
  Then P is étale local on the source-and-target.

Lemma 34.29.5. Si P est étale local on source-and-target, pour vérifier que
f:X->Y a P, il suffit (OU):
- de le vérifier localement sur X
- de le vérifier localement sur Y
- de combiner les deux: ie recouvrir Y par des Y_i, recouvrir X_i=f^{-1}
  Y_1:= X x_Y_i Y par X_ij tel que f: X_ij->Y_i a P
- de vérifier que pour tout x∈X on a un diagramme (*)
  idem en demandant que a soit surjectif
  et dans ce cas, pour tout diagramme (*), h a P.
  i.e. <=> for every x∈X the morphism of germs (X,x)→(Y,f(x)) has property P
  [cf https://stacks.math.columbia.edu/tag/04R5]

Exemples: flat, locally of finite presentation, locally finite type, universally open, syntomic, smooth, étale, locally quasi-finite, unramified, G-unramified.
And as a property of germ: OS,s→OX,x is flat, the local ring OXs,x of the fibre has dimension d, trdeg_κ(s) κ(x)=r, dim_x(Xs)=d
Note: pour ces 3 dernières propriétés, on se sert que dans (*), le morphisme des fibres U_v->X_y est étale, cf https://stacks.math.columbia.edu/tag/04NI

Lemma 34.29.9. Let P be a property of morphisms of schemes which is étale local on the source-and-target. Given a commutative diagram of schemes as in (*)
tel que a est étale en u et b étale en v, alors x∈W(f)⇔u∈W(h).

Lemma 34.29.11: le lemme précédent reste vrai si on suppose juste (P) étale
locale en la source, smooth-locale en la cible, et stable par
postcomposition avec une immersion ouverte; b lisse en v et U-> X x_Y V
étale en u.

Propriétés des morphismes
=========================

phi: Y->X induit par f:A->B

Par définition, f est local sur les germes, ie il induit un morphisme
f: k(phi(y)) -> k(y)

Intuitivement, à une section s de X, phi^*(s) est la section s o phi.

Anneaux locaux
--------------

Si f:(A,m) -> (B,n) morphisme d'anneaux locaux, on dit qu'il est local si
f(m) \subset n <=> f^-1(n)=m
Dans ce cas f induit un morphisme sur les corps résiduels:
f: k(m) -> k(n)
On dit que f est un morphisme local.

Topologie:
---------
- Var(I+J)=Var(I) \inter Var(J)
- Var(IJ)=Var(I \inter J)=Var(I) \union Var(J)
- Var(\inter I_i)= Adhérence(Union(Var(I_i)))
  Ainsi, p_i est dense ssi \inter p_i=Nilradical

Si D_f est un ouvert fondamental, on a
\intersection finie D_f_i = D_\prod f_i

Comme phi est continu, on a
adhérence(phi(\adhérence A)) = adhérence phi(A).
En particulier, si x est le point générique d'un fermé A, phi(x) est le
point générique du fermé adhérence phi(A).
Si les points fermés sont denses dans A, phi(x) est le point générique de
l'adhérence des phi(y), y fermé dans A.

Algèbre:
-------
- f^-1 f(I) contient I, donc f f^-1 f (I)=I
- f f^-1 (J) inclus dans J, donc f^-1 f f^-1 (J)=J

Préimage:
--------
-phi^-1 (Var I)=Var(f(I))
-phi^-1 (D_u)=D_f(u)

Image:
-----
- Adhérence(phi(Var J)) = Var(f^-1 J)

Donc f injectif => phi dominant <=> f^-1(0) inclus dans le nilradical de A
<=> f^-1(Nilrad B)=Nilrad A.
Dans ce cas si les premiers minimaux de B sont q_1, q_n, ceux de A sont
p_1, p_n avec p_i=phi(q_i)

Fibre:
-----
Il existe q dans la fibre de p <=> f^-1(f(p))=p.
[[ De plus (si p est dans l'image), alors si q est min dans S/pS ou max dans
S_p, il appartient à S_p/pS donc s'envoit sur p. !!This looks false!!]]

Preuve: - f^-1(f(p)) contient p et est inclus dans f^-1(q)=p

* https://stacks.math.columbia.edu/tag/00E6

Diagramme fondamental sur les fibres:
f: Y->X. Si x est un point, je note xbar le fermé, et {x} le stalk associé.
ie x=κ(p)=R_p/pR_p , xbar=R/p, {x}=R_p
   Y_x=S_p / p S_p, Y_xbar=S/pS, Y_{x}=S_p

 y  -> ybar   -> Y      y  -> {y}   -> Y
Y_x -> Y_xbar -> Y     Y_x -> Y_{x} -> Y
 x  -> xbar   -> X      x  -> {x}   -> X

et les morphismes horizontaux sont des homéomorphismes sur leur image.
En particulier, κ(y) est le même dans Y_x ou dans Y.

Produits d'idéaux
-----------------
- f^-1(I_1 \inter I_2)=f^-1(I_1) \inter f^-1(I_2)
Et donc phi(F_1 \union F_2)=phi(F_1) \union phi(F_2)

En revanche ça ne marche pas pour le produit, même si B/A est fidèlement
plat; ex: R[X]\subset C[X], I1=(X-i), I2=(X+i), f^-1(I1I2)=(X^2+1),
f^-1(I1)f^-1(I2)=(X^2+1)^2

- f(I1I2)=f(I1)f(I2)
Pr: les deux idéaux sont générés par f(i1)f(i2) où i1,i2 parcourt les
générateurs de I1,I2.

Donc f(I1) \inter f(I2) \supset f(I1 \inter I2) (= si B/A plat)
Mais le Nilrad est toujours égal. (ie: phi^-1(F1 \union F2)=phi^-1(F1)
\union phi^-1(F2))

Présentation finie
------------------

Th ("Si f est loc de prés finie, une prop vraie sur une germe s'étend en un
ouvert"):
f est loc de présentation fini ssi pour tout système projectifs de
Y-schémas affines S_i, on a
lim ind Hom(S_i,X)=Hom_Y( lim_proj S_i, X).

Rem: on utilise la construction suivante: si f:X -> Spec B est de
présentation finie, alors f est le pull back d'un morphisme de présentation
finie g: X'->Spec Z[x_1, ..., x_N]/I pour N assez grand.
De plus si F est quasicohérent de présentation finie sur X, on peut trouver
g tel que F soit le pullback de F' finiment présenté sur X' (bien sûr comme
X' est noéthérien, il suffit d'avoir g de type fini et F' cohérent).

Cor: si on a un morphisme d'une germe O_Z,z dans X de présentation finie, alors ce morphisme s'étend en un ouvert de Z.

Th: Soit f: X->Y dominant de type fini, génériquement fini entre schémas
intègres. Alors il y a un ouvert dense V \subset Y tel que f^-1(V)->V est
fini.

Pr: découle du Th précédent si f loc de prés finie, sinon voir Hartshorne
exo 3.7.

Conditions de finitude et approximation
=======================================

Rappel général catégorique: l.f.p. = commutes with "expected" limits (EGA IV3 , 8.14.2) [ie les limites filtrantes finies]

Structure des morphismes de type finis
--------------------------------------

* https://stacks.math.columbia.edu/tag/052D
$ 36.42 Application to the structure of finite type morphisms
Lemma 36.42.1. Let f:X→S be a morphism loc. of finite type. 
Let x∈X and set s=f(x), n=dim_x(X_s).
Alors on peut décomposer X <g- X' -π> Y -h> S
and a point x′∈X′ with g(x′)=x, y:=π(x′) /
  - h:Y→S is smooth of relative dimension n,
  - κ(y) is a purely transcendental extension of κ(s).
  - g:(X′,x′)→(X,x) is an elementary étale neighbourhood,
  - π is finite, and π^−1({y})={x′}, and
Moreover, if f is locally of finite presentation then π is of finite presentation.

Preuve: on peut supposer X et S affine, et donc par Noether on a
X->A^n_S->S où X->A^n_S est quasi-fini. On utilise alors
  https://stacks.math.columbia.edu/tag/04HF
  $ 36.36 Étale localization of quasi-finite morphisms
Lemma 36.36.1, qui montre que si f est quasi-fini en x∈X
alors on a un changement étale U->S, V ouvert dans X_U tel que
V->U est fini, il y a un unique point v qui s'envoit sur u dans U (où u->s,
où f(x)=s), et v->x avec k(v)=k(x).
On applique celà à X->A^n_S, on obtient X'->Y. De plus on a donc k(x')=k(x).

Lemma 36.42.2. On peut de plus décomposer X->S en 
  X <g- X' -π> Y -h> S' -e> S tel que
  - h: Y->S' vérifie les conditions plus haut (smooth of relative dim n,
    κ(y) is a purely transcendental extension of κ(')); et de plus
    all fibres of Y′→S′ are geometrically integral
  - e:(S′,s′)→(S,s) is an elementary étale neighbourhood.
  et on peut supposer S', Y', X' affines.

Preuve: on applique, https://stacks.math.columbia.edu/tag/057J de "$ Section 36.41: Application to morphisms with connected fibres" au morphisme Y->S qui est smooth, donc à fibres normales.

The significance of the property π−1({y′})={x′} is partially explained by the following lemma.

Lemma 36.42.4. Let π:X→Y be a finite morphism. Let x∈X with y=π(x) such that π−1({y})={x}. Then
  - For every neighbourhood U⊂X of x in X, there exists a neighbourhood V⊂Y of y such that π^−1(V)⊂U.
  - The ring map OY,y→OX,x is finite.
  - If π is of finite presentation, then OY,y→OX,x is of finite presentation.
  - For any quasi-coherent OX-module F we have F_x=π_∗F_y as OY,y-modules.
Preuve: On se ramène au cas affine. Then A→B is a finite ring map and y corresponds to a prime p of A such that there exists a unique prime q of B lying over p. Then B_q=B_p.

* https://stacks.math.columbia.edu/tag/05WM
$ 36.43 Application to the fppf topology

We can use the above étale localization techniques to prove the following result describing the fppf topology as being equal to the topology “generated by” Zariski coverings and by coverings of the form {f:T→S} where f is surjective finite locally free.

Quasi compact morphisms
-----------------------
* https://stacks.math.columbia.edu/tag/01K2
25.19 Quasi-compact morphisms

Quasi separated morphisms
-------------------------

* https://stacks.math.columbia.edu/tag/01KH
25.21 Separation axioms

Note: le morphisme diagonal est toujours une immersion.
f qs <=> la diagonale est qc
f séparé <=> la diagonale est une immersion fermée

Absolute approximation
----------------------

* EGA
IV.8 allow to pass to result from a projective limit to the limit.
Absolute approximation is to construct such absolute limits
Cf [Schemes#Limites projectives de schemas]

* https://stacks.math.columbia.edu/tag/01Z1
31.5 Absolute Noetherian Approximation

+ Cf the todo list for references:
Limits of Schemes: Absloute Noetherian approximation. Add a second proof
following Temkin's proof in [Relative RZ-spaces, section 1.1]. Look also
at David Rydh's paper [Noetherian approximation of algebraic spaces and
stacks]. In fact, using this method one gets a short proof of a more
general approximation result: $X$, $S$ qc and qs schemes, then $X \to S$
can be approximated as affine and finite presentation and if $X \to S$ is
of finite type then we can do closed immersion and finite presentation.

* http://math.stanford.edu/~conrad/papers/nagatafinal.pdf

Th 4.1 [Nagata]: f:X->S séparé de type fini, S qcqs, se factorise en une
immersion ouverte X->Xbar où Xbar->S est propre.

Le th ne suppose pas que X ou S soient Noeth. On se ramène au cas
de présentation finie puis au cas Noéthérien grâce aux:
1)  [TT, Thm. C.9]: si S est qcqs, S est limite projectives de schémas S_i
de type fini sur Z où les morphismes de transitions sont affines. Si X -> S est
de plus de présentation finie, alors il existe un i et un X_i0->S_i0 séparé
de type fini tel que X=X_i0 x_S S_i0.

2) Th 4.3: si f:X->S, S qcqs, f qs de type fini, alors il existe une immersion
fermée X->X' au-dessus de S tel que f':X'->S soit de présentation finie. Si
f est séparée, on peut prendre f' séparée. Si f finie, on peut prendre f'
finie (Th A.1, qui utilise Th 4.1)

* https://www.gwern.net/docs/math/1990-thomason.pdf
HIGHER  ALGEBRAIC  K-THEORY  OF  SCHEMES

An absolute approximation result for qcqs schemes
Appendix C, p172, Th C.9:
Si X/S est qcqs, S affine noeth.
Alors X=lim X_n, X_n de prés finie sur S, où les morphismes de transition
X_i->X_j sont affines et dominants.
Si X a un fibré ample, est semi-séparé, ou séparé, alors on peut exhiber
tous les X_i de même.

* https://arxiv.org/pdf/0804.2843.pdf
RELATIVE RIEMANN-ZARISKI SPACES MICHAEL TEMKIN

A decomposition theorem which asserts that any separated morphism between quasi-compact and quasi-separated schemes factors as a composition of an affine morphism and a proper morphism. In particular, we obtain a new proof of Nagatas compactification theorem

Lemma 1.1.1. A morphism of qcqs schemes f:Y→X is affine <=> Y ̃→ proj lim Yα, where Yα is a filtered family of X-affine finitely presented X-schemes.
Preuve: Y=Spec(lim inj Γ_X(Y_α))

Thomason: Y qcqs sur S affine est limite projective d'une famille affine
filtrante (= the transition morphisms are affines) de schémas de
présentation finie sur S.
=> reformulation of Thomason: S affine, Y->S qcqs => Y is affine over a S-scheme Y0 of finite presentation.

Theorem 1.1.2. Let f:Y→X be a (separated) morphism of qcqs schemes. Then f can be factored into a composition of an affine morphism Y→Z and a (separated) morphism Z→X of finite presentation.
[on retrouve Conrad: si f qs de type fini, f est affine de type fini sur
présentation finie, donc (en travaillant un peu pour recoller, cf Conrad),
f est une immersion fermée sur présentation finie]

Nagata proved that a finite type morphism f:Y→X of qcqs schemes is compactifiable (= Y -ouvert-> Z -proper-> X) if and only if it is separated.
Nagata’s theorem can be reformulated as follows: a finite type morphism is separated if and only if it can be represented as a composition of an affine morphism of finite type and a proper morphism.

Theorem 1.1.3. A morphism f:Y→X of quasi-compact quasi-separated schemes is separated if and only if it can be factored as a composition of an affine morphism Y→Z and a proper morphism Z→X.
[Note: on en déduit Nagata: si f:Y->X est de type fini, Y->Z est affine de
type fini, donc quasi-projectif de type fini, donc ouvert dans propre]

* Résumé:
- Thomason: f:X->Y, X,Y qcqs = relatively affine over finite presentation Y-scheme Z (Thomason-Trobaugh, Theorem C.9 cas Y affine; Temkin cas général). De plus Z est séparé si f séparée.
=> Mnemonic: (qcqs [+séparé]) = (finite presentation [+séparé]) ∘ (affine).
   Conrad: (type fini qs sur qcqs)=(finite présentation) ∘ (immersion fermée)
           (fini qs sur qcqs)=(fini) ∘ (immersion fermée)

- Temkin's factorization theorem: Let S be qcqs and f:X→S be qc, separated. Then there's a factorization X→Z→Y with the first being affine and the second proper.
=> Mnemonic: (separated + qc) = (proper) ∘ (affine).
   Nagata: (separated + finite type)=(proper) ∘ (open).

Approximation des stacks
------------------------

* https://arxiv.org/pdf/0904.0227.pdf
NOETHERIAN APPROXIMATION OF ALGEBRAIC SPACES AND STACKS DAVID RYDH

Full generalisation:
Abstract.We show that every scheme (resp. algebraic space, resp.algebraic stack) that is quasi-compact with quasi-finite diagonal can be approximated by a noetherian scheme (resp. algebraic space, resp.stack). More generally, we show that any stack which is  ́etale-locally a global quotient stack can be approximated. Examples of applications are generalizations of Chevalley’s, Serre’s and Zariski’s theorems and Chow’s lemma to the non-noetherian setting. We also show that everyquasi-compact algebraic stack with quasi-finite diagonal has a finite generically flat cover by a scheme.

TODO: absolute approximation of stacks

Th A (Completeness): every stack of approx. type is pseudo noeth
(pseudo noeth = qcqs et X'->X a la prop de complétude pour tout X'->X de prés. finie, ie QCoh(X') compactly generated)

Th B (Finite coverings): X qc stack with diagonale quasi finite séparé.
Alors il existe Z->X morphisme fini surjectif de prés finie, avec Z schéma
et Z->X plat (resp. étale si X DM) sur un ouvert U qc dense de X.

Th C (approximation of properties): passage à la limite
Th D (approximation): X->X0  affine, X0->S finiment présenté

Application:
Th 8.1 (Chevalley): si f:X->Y est un morphisme entier surjectif, X affine
et Y un espace algébrique, alors Y est affine.
Cor: si X est un espace algébrique, X_réd affine => X affine.

Th 8.3: si f:X->S est un morphisme univ. fermé, séparé et qc, avec X et S
des stacks qc avec diagonale séparée et quasi finie, alors f=X->X'->S où
X->X' est entier surjectif, et X'->S est propre avec diagonale finie.

Cor 8.4 (Chevalley) si f:X->S est un morphisme univ. fermé, séparé et qc, avec
diagonale finie, alors les fibres sont de dimension finie et dim f^{-1}s
est semi-continue supérieurement.

Th 8.5: un morphisme de stacks est entier ssi il est univ. fermé, séparé et
à fibres affines.

Th 8.6 (ZMT): Si f: X->S est un morphisme représentable, quasi fini et séparé de
stacks, alors
- on a X->X'->S où X->X' immersion ouverte et X'->S entier
- si S pseudo-noeth, on peut prendre X' fini (et de prés finie si f de prés
  finie)

Th 8.7 (Serre criterion) si f:X->S est un morphisme représentable qcqs,
avec S un stack de diagonale quasi affine, alors f est
affine ssi f_*: QCoh(X) -> QCoh(S) est exact (ssi f_* est fidèlement
exacte).

Th 8.8 (Chow's lemma): S espace qcqs, X stack qc avec diagonale séparée et
quasi-finie, f:X->S de présentation finie, alors on a
X'->X
P ->S
avec X' un schéma, P->S proj., X'->P propre surjectif et fortement
représentable, et X'->P fortement représentable étale (mais pas forcément
séparée). Si f est séparée, on peut prendre X'->P immersion ouverte.

Th 8.9 (Chow's lemma v2): Idem, avec X nombre fini de composantes
irréductibles et f de type fini, et X'->X satisfait de plus il existe U
ouvert dense de X tel que X'_U -> U est fini plat de présentation finie.

Th 8.10: préservation de propriétés à la limite dans les limites
projectives.
Prop 8.11: critère sur les morphismes de type constructifs.

Going down et going up
======================

* https://stacks.math.columbia.edu/tag/00HU
10.40 Going up and going down

Définitions (A->B):
- Going up: si p \subset p' dans A, et il existe q au dessus de p dans B,
alors il existe q' au dessus de p' dans B. Autrement dit, si p se
spécialise en p', et q est dans la préimage de p, q se spécialise en q' au
dessus de p.

- Going down: si p \subset p' dans A, et il existe q' au dessus de p' dans B,
alors il existe q au dessus de p dans B. Autrement dit, si p' se générise
en p, et q' est dans la préimage de p', q' se générise en q au dessus de p.

Examples:
- Si B/A plat, going down.
- Si B/A entier, going up. (Ex: B/A fini, B=A/I)
  Si de plus, A int clos et B intègre, going down; cf https://stacks.math.columbia.edu/tag/00H8

Caractérisation: Going down <=> pour tout p dans Spec A, pour tout q
minimal au dessus de pA, q \inter A = p
Rem: p \in Im Spec B -> Spec A <=> Phi^{-1}(Phi(p) B)=p

Topologie
---------

Going up <=> Spec B -> Spec A fermé

Spec B -> Spec A ouverte => Going down.
Réciproquement si B/A de présentation de type fini, Going down => Ouverte

Preuve: si E \subset Spec A est constructible, E stable par spécialisation
=> E fermé. E stable par générisation => E ouvert.
On conclut par Chevalley:
http://mathoverflow.net/questions/80707/chevalleys-theorem-on-constructible-sets
    Theorem (EGA IV, 1.8.4.) Let f:X→Y be a finitely presented morphism of
    schemes (any morphism between varieties over a field is of this type).
    Then the image of any constructible subset of X under f is a
    constructible subset of Y.

Attention: dans le cas général, loc. constructible signifie
Y=\union_finie U_i \ V_i où les U_i, V_i sont rétrocompacts dans X,
ie U_i -> X est qc. Si X noeth, tous les ouverts sont rétrocompacts,
donc loc. constructible = union de loc. fermés.

Dans le stack project, on a la version un peu plus fort suivante, cf
http://math.uchicago.edu/~amathew/ZMTfull.pdf:
Theorem 5.10 (Chevalley). Let f:X→Y be  a  quasicompact  morphism,  locally  of finite presentation.  Then if C⊂X is locally constructible, so is f(C)⊂Y.

Submersions
-----------

phi: Y->X est submersif si phi est surj et X a une topologie quotient de X
(ie F fermé ssi phi^{-1}F fermé).
Si phi: Spec B -> Spec A, avec A noéthérien, phi surjectif, going down
=> phi est submersif.

ex: B/A fidèlement plat, ou A \subset B, B intègre entier sur A, A intègralement clos

Théorème des fibres sur les anneaux locaux:
------------------------------------------

A -> B noethérien, q s'envoie sur p.
Alors codim q (=dim B_q) <= codim p (=dim A_p) + dim fibre spéciale (=B_q/pB_q)
Si going down, il y a égalité.

Réciproque: (A,B locaux noeth)
Si A régulier, B Cohen-Macauley et dim B = dim A + dim fibre spéciale,
alors B/A plat
Application: X,Y k-schémas irré, f:Y -> X /
- X régulier
- Y Cohen-Macauley
- f envoie les points fermés de Y sur les points fermés de X (ex: f propre)
- pour tout x \in X point fermé, f^-1(x) est de dimension dim Y - dim X
Alors f est plat.

Prop:
Si A -> B noéthérien, p_1 se spécialise en p_2
Si going-up, la dimension fibre en p_2 est plus grande que la fibre en p_1
Si going-down + B caténaire, la dimension de la fibre en p_1 est plus
grande que la fibre en p_2

Localisés
---------

Si p \subset R -> S. Supposons
(i) il y a un unique q \subset S au-dessus de p
(ii) Soit - Il y a going up
          - Going down et il y a au plus un premier dans S au dessus de
            chaque premier de R
Alors S_p = S_q

Immersions
==========

Attention, en geoalg une immersion c'est ce qu'on appelle plongement en
géodiff, et réciproquement. Cf
http://mathoverflow.net/questions/48527/why-open-immersion-rather-than-open-embedding

Immersions ouvertes
-------------------

* Déf: f: X->Y immersion ouverte ssi f induit un homéo sur un ouvert U de Y et X est isomorphe au schéma sur U.

Les immersions ouvertes sont stables par changement de base.
Être une immersion ouverte est une propriété affine locale sur la cible.

* Lemme important: si X_1 et X_2 sont deux ouverts affines de X, et x \in X_1
\inter X_2, alors il existe un ouvert affine x \in U \subset X_1 \inter X_2
tel que U soit un ouvert affine canonique (ie le localisé d'une fonction)
pour X_1 et pour X_2.
[Pr: prendre un ouvert canonique U_1 de X_1 inclus dans X_1 \inter X_2, et
un ouvert canonique U_2 de X_2 inclus dans U_1; U_2 est défini par une
section g de X_2 et U_2 et le lieu de non annulation de g; donc U_2 est
aussi le lieu de non annulation de g|U_1 donc U_2=(U_1)_g est canonique
pour X_1. En fait si f définit U_1, alors g=g'/f^n sur U_1 pour une
fonction g' définie sur X_1. Cf FOAG~5.3.1]

* Caractérisation des immersions ouvertes
- http://mathoverflow.net/questions/20782/ring-theoretic-characterization-of-open-affines
- stacks.math.columbia.edu/download/etale.pdf

Theorem 14.1. / EGA IV, 17.9.1 / https://stacks.math.columbia.edu/tag/025F
Let f : X → Y be a morphism of schemes. The following are equivalent:
(1) f is an open immersion,
(2) f is radicial [=univ. injective] and etale, and
(3) f is a flat monomorphism, locally of finite presentation.
[Cf aussi plus bas pour le critère d'avoir un monomorphisme]

Preuve:
  Un morphisme plat localement de presentation finie est ouvert, cf
  Matsumura, commutative algebra, theorem 8 du chapitre 2. Cf aussi EGA, ou
  il y a en plus un exemple de morphisme plat qui n'est pas ouvert (et qui
  n'est donc pas de presentation finie).

  Si f: Y->X est plat localement de presentation finie, son image Y'=f(Y) est
  ouvert dans X donc, et f: Y->Y' est fidelement plat (un morphisme
  fidelement plat est un morphisme plat surjectif). Comme l'a remarque Joel,
  si en plus f est un monomorphisme, f est un isomorphisme (ce qui se voit
  facilement par descente fidelement plate, ou encore parce qu'un morphisme
  fidèlement plat est un épi effectif, et les épi effectifs qui sont des
  monos sont des isos).

[ Cas particuliers:
Theorem 1: Let R be an integral domain with field of fractions K, and R→A a
homomorphism. Then Spec(A)→Spec(R) is an open immersion if and only if A=0
or R→K factors through R→A (i.e. A is birational over R) and A is flat and
of finite type over R.

Theorem 2: Spec(A)→Spec(R) is an open immersion if and only if R→A is flat,
of finite presentation and an epimorphism in the category of rings.

Theorem 3: There is the following characterisation. I don't think it's too
tautological. Let T⊆A be the set of f such that the induced map
A[f−1]→B[f−1] is an isomorphism. Then Spec(B)→Spec(A) is an open immersion
if and only if the image of T in B generates the unit ideal.
Cf aussi: https://mathoverflow.net/questions/230528/flat-locally-of-finite-presentation-monomorphism-open-immersion
]

Immersion fermée
----------------

f: X->Y est une immersion fermée ssi f est un homéo sur un fermé Z de Y et
O_Y -> f_* O_X est surjectif.
(Rem: dans ce contexte, f_* O_X est simplement l'extension de O_X par 0 à
tout Y).

Les immersions fermées sont stables par changement de base.

Rem: contrairement au cas des immersions ouvertes, il peut y avoir
différentes immersions fermées pour le même fermé Z.

ex: Il y a bijection entre les sous-schémas fermés de P^n_k et les idéaux
homogènes I de k[X_0,...,X_n] tels que I:(X_0,...,X_n)=I.

Th: soit f est une immersion fermée, et Q le module (idéal) quasi-cohérent
donné par le noyau de O_Y dans f_* O_X. Alors f est affine; plus précisément:
pour tout ouvert affine Spec A de Y,
X \inter Spec A est isomorphe à Spec(A/I) où I=Q(Spec A) est le noyau de
l'application (surjective) A-> Gamma(Spec A \inter X, f_* O_X).
Comme Q est quasi cohérent, on a de plus Q(A_f)=QA_f, et Q(A_P)=QA_P
En particulier, on a bijection entre les idéaux quasi-cohérents et les
immersions fermées.
[Autrement dit, si X \subset Y est fermé, et U=Spec A un ouvert affine de Y, U
\inter X est un ouvert affine de X de la forme Spec A/I où I est le noyau
de la restriction]

Th (être une immersion fermée est une propriété affine locale sur la cible):
f est une immersion fermée ssi on a une des conditions suivantes:
(i) Pour tout ouvert affine V de Y, U=f^-1(V) est affine et l'application
O_Y(V)->O_X(U) est surjective
(ii) Il y a un recouvrement affine de X par des V_i tels que
U_i=f^-1(V_i) est affine et l'application O_Y(V_i)->O_X(U_i) est surjective

Rem: Si Q est un O_X idéal, alors Y={y \in X, 1 \not in Q_y} est fermé dans
X, ie Y est le support de O_X/Q. (Y,O_X/Q) est un sous-schéma fermé ssi Q
est quasi-cohérent ssi
pour tout y\in X il y a un ouvert autour U et des sections s_i \in Q(U)
telles que Q|x=\sum res(s_i) O_X|x pour tout x dans U.

Prop: Si X est fermé dans Y, il existe une plus petite structure de schéma
Xréd sur X telle que Xréd se factorise par toute immersion fermée ayant
image X.
- Xréd est l'unique schéma fermé réduit de support X.
- Xréd est définie en recollant la construction suivante: si Y est fermé et X
correspond à un idéal I, Xréd=Spec(A/Radical(I))
(Remarque: U->Radical(O_X(U))=fonctions nilpotentes sur U, n'est pas un
faisceau si X n'est pas Noethérien, le faisceau associé est le faisceau des
fonctions localement nilpotentes. Par contre d'après Eisenbud et Harris, le
faisceau quotient associé est U->O_X(U)/Radical pour tout ouvert U, même
pas forcément affine.)
- Si X0 est un schéma fermé de support X, définit par un idéal I0, alors
  l'idéal Iréd définissant Xréd est Radical(I0)
  (ie pour tout ouvert affine, on prend le radical des sections de I0 sur
  cet ouvert)

Si f:X->Y est un morphisme, on appelle l'image schématique de f le schéma
fermé Z tel que f se factorise par Z, et si f se factorise par un schéma
fermé Z', alors Z->X se factorise par Z' également. Si X est réduit, Z est
simplement le schéma réduit sur la cloture de f(X).

Si Z est un sous-schéma localement fermé, sa cloture Zbar est le plus petit
schéma fermé contenant Z. Concrêtement, si Z est fermé dans l'ouvert U,
l'idéal de Zbar est donné par les fonctions régulières dont la restriction
à U s'annule sur Z.

* Caractérisation:
(1) f is a closed immersion,
(2) f is a proper monomorphism (2bis) f is a finite monomorphism
(3) f is proper, unramified, radicial.
Pr: https://mathoverflow.net/questions/45578/is-a-proper-monomorphism-of-schemes-necessarily-a-closed-immersion

Or par https://stacks.math.columbia.edu/tag/06ND
$ 40.7 Universally injective, unramified morphisms
Lemma 40.7.1. Let f:X→S be a morphism of schemes. (<=>)
  - f is unramified and a monomorphism,
  - f is unramified and universally injective,
  - f is locally of finite type and a monomorphism,
  - f is universally injective, locally of finite type, and formally unramified,
  - f is locally of finite type and Xy is either empty or Xy→y is an isomorphism for all y∈Y.
Cf plus bas, EGA IV qui montre aussi (<=>)
  a) f is a monomorphism.
  b) f is radicial and formally unramified.

Donc en particulier unramified + mono + univ closed => proper d'où d'autres
formulations, eg Lemma 40.7.2.
- f is universally closed, unramified, and universally injective

Monomorphismes et Epimorphismes
===============================

Monomorphismes
--------------

http://mathoverflow.net/questions/56591/what-are-the-monomorphisms-in-the-category-of-schemes

In EGA IV, 17.2.6 the following characterization of monomorphisms is given:
  Let f:X→Y be a morphism locally of finite type. Then the following conditions are equivalent:
  a) f is a monomorphism.
  b) f is radicial and formally unramified.
  c) For every y∈Y, the fiber f−1(y) is either empty or isomorphic to Spec(k(y)).

  [Rappels:
   - formally unramified+loc finite pres=unramified
   - radicial=universally injective ie X(K) → Y(K) is injective
   ie f is injective on the topological spaces and for every point x in X, the extension of the residue fields k(f(x)) ⊂ k(x) is radicial, i.e. purely inseparable.]

Also note that (due to the adjunction) a morphism between affine schemes is
a monomorphism (in the category of schemes) if and only if the associated
homomorphism of rings is an epimorphism (in the category of rings) and the
latter ones can be characterized in many ways. See, for example, this
Samuel seminar and this MO discussion. Monomorphisms of noetherian schemes
are treated in detail in Exposé 7 by Daniel Ferrand.

* Further examples:
1) Immersions are monomorphisms; this follows from the universal property
of a closed resp. open immersion.
2) A morphism X→Y is a monomorphism if and only if the diagonal X→X ×_Y X is
an isomorphism. In particular, every monomorphism is separated.
3) In EGA IV, 18.12.6 it is shown that proper monomorphisms are exactly the
   closed immersions.

Monomorphismes affines
----------------------
* http://mathoverflow.net/questions/109/what-do-epimorphisms-of-commutative-rings-look-like

No, not every epimorphism of rings is a composition of localizations and
surjections.
An epimorphism of commutative rings is the same thing as a monomorphism of
affine schemes. Monomorphisms are not only embeddings, e.g., any
localization is an epimorphism and the corresponding morphism of schemes is
not a locally closed embedding.

Example: Let C be the nodal affine cubic and let X be its normalization.
Pick any point x above the node. Then X\{x}->C is a monomorphism (see
Proposition below). The corresponding homomorphism of rings is injective
but not a localization.

Remark: A flat epimorphism A->B is a localization if A is normal and
Q-factorial. This is a result by D. Lazard and P. Samuel. [cf. Lazard
"Autour de la platitude" (IV, Prop 4.5)]

Remark: There was a seminar on epimorphisms of rings directed by P. Samuel in 1967-68.
-> http://www.numdam.org/numdam-bin/feuilleter?id=SAC_1967-1968__2_

Monomorphisme plat
------------------

Rappel: si f est un mono plat loc de prés fini alors c'est une immersion
ouverte.

 Généralisations:
 ---------------

* /home/dams/Papiers/Maths/GeoAlg/mono_plats.pdf
(Raynaud, un critère d'effectivité de descente)

Theorem: f est un mono plat ssi f est injectif et pour tout x \in X
O_Y,f(x) -> O_X,x est une bijection.

Si f:X->Y est mono plat qc (il n'est pas forcément ouvert car non loc pres
finie). Alors f induit toujours un iso de X sur f(X) (où f(X) est munie de
la structure annelée induite par Y).
- De plus f(X) est inclus dans un ouvert U tel que f:X->U soit affine.
- f est une immersion ouverte dans Z=Spec f_*(X) (qui est donc affine
  au-dessus de Y).
- Y\U= cloture de h(Z\X) où h est le morphisme Z->Y.
(Si je ne me trompe pas dans le cas f ouvert on a U=f(X)=X)

* /home/dams/Papiers/Maths/GeoAlg/monos_platsaffines.pdf
DANIEL LAZARD Autour de la platitude

Prop IV.2.5: Si A anneau, il y a bijection entre les épimorphismes plats
d'anneaux A->B et les parties de Spec A qui munies du faisceau induit sont
affines. Ces parties sont stables par générisation.
(et donc ouvertes si elles sont loc de prés finie, et on retrouve qu'un
mono plat loc de prés fini est ouvert)

Il montre ensuite:
- si A est noéth, K(A) (l'anneau des fractions totales)
est le plus grand anneau tel que A->K(A) soit un épi plat injectif,
ie si A->X est un épi plat injectif, alors X \subset K(A).
- si f:A->B est plat, K(f):K(A)->K(B) est plat,
si f inj alors K(f) est inj, si f épi plat inj alors K(f) est un iso.
- f:A->B est un épi plat ssi B \subset K(f(A))

Epimorphismes
-------------

(sciences.maths.avancees         Message  2478)

f: X->Y est épi ssi l'image schématique de f est Y.

Ex: si X->Y est surjectif (au niveau des points-au-sens-idéaux-premiers)
  et que Y est réduit, alors X->Y est un épimorphisme de schémas.

Ex: si f: X->Y est fidèlement plat, alors c'est un épi effectif universel.
Autrement dit dans la catégorie des anneaux, c'est un mono effectif, donc
si f: B->A est de plus épi (cf une localisation) c'est un iso.

 Attention:
 ---------

Si les morphismes surjectifs (au niveau des
points-au-sens-idéaux-premiers) sont stables par changement de base, les
épimorphismes de schémas, eux, _ne le sont pas en général_ (ou, si on
veut, il existe des épimorphismes qui ne sont pas des épimorphismes
universels).

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

http://mathoverflow.net/questions/56564/what-are-the-epimorphisms-in-the-category-of-schemes

It is easy to see that a morphism f:X→Y such that the underlying map |f| is
surjective and the homomorphism f#:O_Y→f∗ O_X is injective, is an epimorphism.
But there are other examples, too.

La réponse contient la preuve du fait suivant:
X is non-initial and every morphism from a non-initial object to X is an
epimorphism <=> X est le spectre d'un corps
(que ce soit dans la catégorie des schémas affines ou des schémas)

Morphismes finis et entiers, ZMT
================================

Definitions et propriétés des morphismes finis et entiers
---------------------------------------------------------

* Morphisme fini
(1) f est fini
(2) f est affine et propre
(3) f est propre et quasi-fini

Pr:  cf FOAG Th. 29.6.2 dans le cas f loc. de présentation finie (utilise
le ZMT), généralisé par Deligne au cas général, cf https://en.wikipedia.org/wiki/Finite_morphism, et https://stacks.math.columbia.edu/tag/0F2P plus bas.

* https://stacks.math.columbia.edu/tag/01WG
$ 28.42 Integral and finite morphisms

Definition 28.42.1. Let f:X→S be a morphism of schemes.
  - We say that f is integral if f is affine and if for every affine open Spec(R)=V⊂S with inverse image Spec(A)=f−1(V)⊂X the associated ring map R→A is integral.
  - We say that f is finite if f is affine and if for every affine open Spec(R)=V⊂S with inverse image Spec(A)=f−1(V)⊂X the associated ring map R→A is finite.
=> propriété locale sur la cible. En particulier ils sont affines, donc
séparés.

Lemma 28.42.4. A finite morphism is integral. An integral morphism which is locally of finite type is finite.

Let f:X→S be a morphism of schemes.

Lemma 28.42.7. <=>
  - f is integral, and
  - f is affine and universally closed.
Lemma 28.42.11. <=>
  - f is finite, and
  - f is affine and proper [proper=univ closed + separated finite type].
Lemma 28.42.15. <=> 
  - f is finite and a monomorphism
  - f is a closed immersion.
Lemma 28.42.16. A finite morphism is projective (and quasi-finite)

* https://stacks.math.columbia.edu/tag/03HX 
$ Section 29.46: Finite locally free morphisms

Lemma 29.46.2. Let f:X→S be a morphism of schemes. The following are equivalent:
  - f is finite locally free,
  - f is finite, flat, and locally of finite presentation.
If S is locally Noetherian these are also equivalent to
  - f is finite and flat.

Lemma 29.46.6. Let f:Y→X be a finite morphism with X affine. There exists a pullback diagram and Y′→Z′→X′ where
  - Y′→Y and X′→X are surjective finite locally free,
  - i:Y′→Z′ is a closed immersion,
  - Z′→X′ is finite locally free, and
  - Z′=⋃j=1,…,mZ′j is a (set theoretic) finite union of closed subschemes, each of which maps isomorphically to X′.

Lemma 29.46.7. Let f:Y→X be a finite morphism of schemes. Let T⊂Y be a
closed nowhere dense subset of Y. Then f(T)⊂X is a closed nowhere dense
subset of X.
Lemma 29.53.4. Let f:Y→X be a quasi-finite morphism of schemes. Let T⊂Y be a closed nowhere dense subset of Y. Then f(T)⊂X is a nowhere dense subset of X.

* https://stacks.math.columbia.edu/tag/0F2P
$ 36.39 Applications of Zariski's Main Theorem, I

Lemma 36.39.1. <=>
  - f is finite,
  - f is proper with finite fibres,
  - f is proper and locally quasi-finite,
  - f is universally closed, separated, locally of finite type and has finite fibres.

Corollaires:

Lemma 36.39.2. Let f:X→S be a morphism of schemes. Let s∈S. Assume that f is proper and f−1({s}) is a finite set. Then there exists an open neighbourhood V⊂S of s such that f|f−1(V):f−1(V)→V is finite. 
Preuve: utilise "l'astuce", on a f−1(V)→V quasi-finite proper donc fini.

Lemma 36.39.3. Consider a commutative diagram of schemes X->Y au dessus de S
Let s∈S. Assume
  - X→S is a proper morphism,
  - Y→S is separated and locally of finite type, and
  - the image of Xs→Ys is finite.
Then there is an open subspace U⊂S containing s such that X_U→Y_U factors through a closed subscheme Z⊂Y_U finite over U.

Morphisme quasi-fini
--------------------

Si X schéma de type fini sur k, x est isolé dans X ssi
- il y a un ouvert affine U tel que x isolé dans U
- x est à la fois fermé et générique
- dim_x X = 0
- O_X,x est fini sur k
- k⊂κ(x) est fini (=> x fermé) et dim(O_X,x)=0 (ie x générique dans X)

* https://stacks.math.columbia.edu/tag/00PJ
$  10.121: Quasi-finite maps
Lemma 10.121.1. Let k be a field. Let S be a finite type k algebra. Let q be a prime of S. (<=>)
  - q is an isolated point of Spec(S),
  - S_q is finite over k,
  - there exists a g∈S, g∉q such that D(g)={q},
  - dim_q Spec(S)=0,
  - q is a closed point of Spec(S) and dim(S_q)=0, and
  - the field extension k⊂κ(q) is finite and dim(S_q)=0.
In this case S=S_q×S′ for some finite type k-algebra S′. Also, the element g as in (3) has the property S_q=S_g.

Lemma 10.121.2. Let R→S be a ring map of finite type. Let q⊂S be a prime lying over p⊂R. Let F=Spec(S ⊗R κ(p)) be the fibre of Spec(S)→Spec(R), see Remark 10.16.8. Denote q¯∈F the point corresponding to q. (<=>)
  - q¯ is an isolated point of F,
  - S_q/pS_q is finite over κ(p),
  - there exists a g∈S, g∉q such that the only prime of D(g) mapping to p is q,
  - dim_q¯(F)=0,
  - q¯ is a closed point of F and dim(S_q/pS_q)=0, and
  - the field extension κ(p)⊂κ(q) is finite and dim(S_q/pS_q)=0.
Preuve: par 10.121.1, car S_q/pS_q=(S ⊗_R κ(p))_q¯

Lemma 10.121.4. Let R→S be a finite type ring map. Then R→S is quasi-finite if and only if for all primes p⊂R the fibre S ⊗_R κ(p) is finite over κ(p).

Preuve: en effet pour une k-algèbre A de type fini, être ensemblistement fini = 
être de dim 0 = A/k finie. Cf Lemma 10.60.3 + Noether normalisation lemma
Lemma 10.60.3. Let S be a nonzero finite type algebra over a field k. Then dim(S)=0 if and only if S has finitely many primes. 

* https://stacks.math.columbia.edu/tag/01TC
$ 28.19 Quasi-finite morphisms

Recall that a finite type ring map R→A is quasi-finite at a prime q if q defines an isolated point of its fibre, see Algebra, Definition 10.121.3.
Definition 28.19.1. Let f:X→S be a morphism of schemes.
  - We say that f is quasi-finite at a point x∈X if there exist an affine neighbourhood Spec(A)=U⊂X of x and an affine open Spec(R)=V⊂S such that f(U)⊂V, the ring map R→A is of finite type, and R→A is quasi-finite at the prime of A corresponding to x (see above).
    <=> loc of finite type at x + x isolated in its fibre [28.19.6]
  - We say f is locally quasi-finite if f is quasi-finite at every point x of X.
    <=> loc. finite type + the fibres X_s are discrete [28.19.8]
  - We say that f is quasi-finite if f is of finite type and every point x is an isolated point of its fibre.
    quasi-finite <=> loc. quasi finite + qc <=> finite type (=loc. finite type + qc) + finite fibres [28.19.9, 28.19.10]

Lemma 28.19.2:
- si κ(x)/κ(s) est algébrique, x est fermé dans sa fibre X_s
- si x fermé dans X_s et s est fermé => x est fermé.
Preuve: on utilise 10.34.9 qui utilise le fait que R entier sur k => R est un corps. https://stacks.math.columbia.edu/tag/00GA

The following lemma is a version of the Hilbert Nullstellensatz:
Lemma 28.19.3. If f loc. of finite type, x is a closed point of its fibre iff κ(s)⊂κ(x) is a finite field extension.
De plus [28.19.4] dans ce cas x' est fermé dans sa fibre X'_f'(x') pour tout base change S'->S.
=> [28.19.5] if f is quasi-finite at x, then the residue field extension κ(s)⊂κ(x) is finite. 

Lemma 28.19.6. If f loc. of finite type, (<=>)
  - The morphism f is quasi-finite at x.
  - The point x is isolated in X_s.
  - The point x is closed in X_s and there is no point x′∈X_s, x′≠x which specializes to x.
  - For any pair of affine opens Spec(A)=U⊂X, Spec(R)=V⊂S with f(U)⊂V and x∈U corresponding to q⊂A the ring map R→A is quasi-finite at q.

Lemma 28.19.8. If f is loc. of finite type. (<=>)
  - f is locally quasi-finite,
  - for every s∈S the fibre X_s is a discrete topological space, and
    Note: [29.19.7] If f−1({s}) is a finite set then since f is loc. of finite type, X_s is discrete and f is quasi finite at the points of X_s
  - for every morphism Spec(k)→S where k is a field the base change X_k has an underlying discrete topological space.

* https://stacks.math.columbia.edu/tag/02LQ
Lemma 36.38.3 (Zariski's Main Theorem) [cf plus bas]
Quasi fini séparé = entier o immersion ouverte qc
Quasi fini séparé sur qcqs = fini o immersion ouverte qc

En particulier, si f:X->Y quasi fini séparé, on a
X ouvert dans X' -g: entier> Y. Soit Z=X'\X fermé, g(Z) est donc fermé dans
Y, donc Y'=Y\g(Z) est ouvert (dense). X'|Y'=X|Y' donc X|Y'->Y' est entier.
(cf "l'astuce" plus bas)

On peut raffiner à tout morphisme quasi fini:
* https://stacks.math.columbia.edu/tag/0F2Q
$ 36.40 Applications of Zariski's Main Theorem, II

Lemma 36.40.2. Let f:X→Y be a quasi-finite morphism. There exists a dense open U⊂Y such that f|f−1(U):f−1(U)→U is finite.

Et on a une conclusion similaire si on est génériquement quasi-fini:
Lemma 29.49.1. Let X, Y be schemes. Let f:X→Y be locally of finite type qcqs. Let η∈Y be a generic point of an irreducible component of Y. The following are equivalent:
  - the set f−1({η}) is finite,
  - there exists an affine open V⊂Y, η∈V such that f−1(V)→V is finite.

Rappels sur les schémas Japonais et de Nagata
---------------------------------------------

* https://en.wikipedia.org/wiki/Krull%E2%80%93Akizuki_theorem

In algebra, the Krull–Akizuki theorem states the following: let A be a
one-dimensional reduced noetherian ring,[1] K its total ring of fractions.
If B is a subring of a finite extension L of K containing A and is not
Artinian, then B is a one-dimensional noetherian ring. Furthermore, for
every nonzero ideal I of B, B/I is finite over A.[2]

Note that the theorem does not say that B is finite over A [Note: c'est le
cas si L/K séparable]. The theorem does not extend to higher dimension. One
important consequence of the theorem is that the integral closure of a
Dedekind domain A in a finite extension of the field of fractions of A is
again a Dedekind domain. This consequence does generalize to a higher
dimension: the Mori–Nagata theorem states that the integral closure of a
noetherian domain is a Krull domain.

[ https://en.wikipedia.org/wiki/Krull_ring
Let A be an integral domain and let P be the set of all prime ideals of A of height one, that is, the set of all prime ideals properly containing no nonzero prime ideal. Then A is a Krull ring if
  - A_p is discrete valuation ring for all p in P
  - A is the intersection of these discrete valuation rings (considered as subrings of the quotient field of A).
  - Any nonzero element of A is contained in only a finite number of height 1 prime ideals.
Th: a Noetherian domain is Krull if and only if it is integrally closed.
Th: the closure of a noeth integral domain A in a finite algebraic
extension L of Frac A is Krull [attention, il n'est pas forcément noeth??]

* https://stacks.math.columbia.edu/tag/0BI1
$ 10.156 Japanese rings

Definition 10.156.1. Let R be a domain with field of fractions K.
  - We say R is N-1 if the integral closure of R in K is a finite R-module.
  - We say R is N-2 or Japanese if for any finite extension K⊂L of fields the integral closure of R in L is finite over R.

Lemma 10.156.8. Let R be a Noetherian normal domain with fraction field K. Let K⊂L be a finite separable field extension. Then the integral closure of R in L is finite over R.

=> Lemma 10.156.11. A Noetherian domain of characteristic zero is N-1 if and only if it is N-2 (i.e., Japanese).

* https://stacks.math.columbia.edu/tag/032E
$ 10.157 Nagata rings

Definition 10.157.1. Let R be a ring.
  - We say R is universally Japanese if for any finite type ring map R→S with S a domain we have that S is N-2 (i.e., Japanese).
  - We say that R is a Nagata ring if R is Noetherian and for every prime ideal p the ring R/p is N-2.

Th: a Nagata ring is universally Japanese:
Proposition 10.157.15 (Nagata). Let R be a ring. The following are equivalent:
  - R is a Nagata ring,
  - any finite type R-algebra is Nagata, and
  - R is universally Japanese and Noetherian.

Proposition 10.157.16. The following types of rings are Nagata and in particular universally Japanese:
  - fields,
  - Noetherian complete local rings,
  - Z,
  - Dedekind domains with fraction field of characteristic zero,
  - finite type ring extensions of any of the above.

* https://stacks.math.columbia.edu/tag/033R
$ 27.13 Japanese and Nagata schemes
Définition comme on pense à partir du cas affine

Lemma 28.17.2. The following types of schemes are Nagata.
  - Any scheme locally of finite type over a field.
  - Any scheme locally of finite type over a Noetherian complete local ring.
  - Any scheme locally of finite type over Z.
  - Any scheme locally of finite type over a Dedekind ring of characteristic zero.

Normalisation relative
----------------------

* https://stacks.math.columbia.edu/tag/0BAK
$ 28.51 Relative normalization

Lemma 28.51.1. Let X be a scheme. Let A be a quasi-coherent sheaf of OX-algebras. The subsheaf A′⊂A defined by the rule
U⟼{f∈A(U)∣f_x∈A_x integral over O_X,x for all x∈U}
is a quasi-coherent OX-algebra, the stalk A′_x is the integral closure of O_X,x in A_x, and for any affine open U⊂X the ring A′(U)⊂A(U) is the integral closure of O_X(U) in A(U).

Definition 28.51.3. Let f:Y→X be a quasi-compact and quasi-separated morphism of schemes. Let O′ be the integral closure of O_X in f_∗O_Y. The normalization of X in Y is the scheme ν:X′=Spec_X(O′)→X over X. It comes equipped with a natural factorization Y →f′ X′ →ν X of the initial morphism f.
Note: tout autre décomosition Y->Z->X avec Z->X entier se factorise en Y->X'->Z->X.

Lemma 28.51.9. Let f:Y→X be a quasi-compact and quasi-separated morphism of schemes. Let X′→X be the normalization of X in Y. Every generic point of an irreducible component of X′ is the image of a generic point of an irreducible component of Y.

Lemma 28.51.11. Let f:X→S be a quasi-compact, quasi-separated and universally closed morphisms of schemes. Then f_∗ O_X is integral over OS. In other words, the normalization of S in X is equal to the factorization
X⟶Spec_S(f_∗OX)⟶S of Constructions, Lemma 26.4.7. (see also Stein factorisation)

Lemma 28.51.13. Let f:Y→X be a quasi-compact and quasi-separated morphism of schemes. Let X′ be the normalization of X in Y. Assume
  - Y is a normal scheme,
  - quasi-compact opens of Y have finitely many irreducible components.
Then X′ is a disjoint union of integral normal schemes. Moreover, the morphism Y→X′ is dominant and induces a bijection of irreducible components.

Lemma 28.51.15. Let f:X→S be a morphism. Assume that
  - S is a Nagata scheme,
  - f is of finite type,
  - X is reduced.
Then the normalization ν:S′→S of S in X is finite.
(cf 28.51.15 ou 'f is of finite type' est remplacé par 'f qcqs et a de

* https://stacks.math.columbia.edu/tag/081J
$ 36.17 Normalization revisited

Lemma 36.17.1. Let f:Y→X be a smooth morphism of schemes. Let A be a quasi-coherent sheaf of OX-algebras. The integral closure of OY in f^∗A is equal to f^∗A′ where A′⊂A is the integral closure of OX in A.

Lemma 36.17.2 (Normalization commutes with smooth base change).
ie if f1: Y1->X1 is qcqs, and g: X2->X1 is smooth, f2:Y2->X2 le pullback de
f1 par g, alors X'2=X2 x_X1 X'1 où X'1 est la normalisation de f1:
Y1->X'1->X1 et X'2 de f2: Y2->X'2->X2.

Lemma 36.17.3 (Normalization and smooth morphisms). Let X→Y be a smooth morphism of schemes. Assume every quasi-compact open of Y has finitely many irreducible components. Then the same is true for X and there is a canonical isomorphism X^ν=X ×_Y Y^ν.

Lemma 36.17.4 (Normalization commutes with henselization).

Normalisation
-------------

* https://stacks.math.columbia.edu/tag/035E
$ 28.52 Normalization

Let X be a scheme such that every quasi-compact open has finitely many irreducible components (eg X loc. Noeth). Let X(0)⊂X be the set of generic points of irreducible components of X. Let f:Y=∐_{η∈X(0)} Spec(κ(η))⟶X
The normalization of X is the morphism ν:X^ν⟶X of the morphism f:Y⟶X above.

Propriétés:
- The normalisation Xν⟶X factors through the reduction X_réd Xν⟶X_réd⟶X
- the normalization X^ν is a disjoint union of integral normal schemes:
  X^ν=∐i∈I Z^ν_i→X where Z_i are the irreducible components of X (with
  their reduced structure).
- The morphism ν:X^ν→X is integral, surjective, and induces a bijection on irreducible components (ie have the same set of irreducible components).
- Let X be a reduced scheme with finitely many irreducible components. Then the normalization morphism X^ν→X is birational [en particulier X a un ouvert dense où il est normal]
- If X is integral Japanese, or Nagata, X^ν→X is finite
  (see https://stacks.math.columbia.edu/tag/033R for the definitions)

Propriété universelle:
- For any morphism Z→X with Z a normal scheme such that each irreducible component of Z dominates an irreducible component of X there exists a unique factorization Z→X^ν→X.
- For any integral morphism α:X′→X such that for U⊂X quasi-compact open the inverse image α^−1(U) has finitely many irreducible components and α|α^−1(U):α^−1(U)→U is birational there exists a factorization X^ν→X′→X and X^ν→X′ is the normalization of X′.

- Cas affine:
Si X réduit et U=Spec(A) est un ouvert affine, ν^{-1}(U) est bien la
normalisation de A dans l'anneau des fractions totales K(A/q_1)×…×K(A/q_t)
où q_1,…,q_t sont les premiers minimaux de A.
(A étant réduit on a bien (0)=q_1∩…∩q_t)

- Cas d'un point:
  These O_{X,x}-algebras are isomorphics:
  - the stalk (ν_∗ O_{X^ν})_x,
  - the integral closure of O_{X,x} in the total ring of fractions of (O_{X,x})red,
  - the integral closure of O_{X,x} in the product of the residue fields of the minimal primes of O_{X,x} (and there are finitely many of these).

* https://stacks.math.columbia.edu/tag/0C44
$ 32.40 Normalization of one dimensional schemes

Let X be a locally Noetherian scheme of dimension 1.
1. the fibres of ν are finite and the residue field extensions are finite,
2. X^ν is a disjoint union of integral normal Noetherian schemes and each affine open is the spectrum of a finite product of Dedekind domains. (Krull-Akizuki)

Donc avec les propriétés générales de la normalisation:
Lemma 32.40.1. Let X be a locally Noetherian scheme of dimension 1. Let ν:Xν→X be the normalization. Then
  - ν is integral, surjective, and induces a bijection on irreducible components,
  - there is a factorization Xν→Xred→X and the morphism Xν→Xred is the normalization of Xred,
  - Xν→Xred is birational,
  - for every closed point x∈X the stalk (ν∗OXν)x is the integral closure of OX,x in the total ring of fractions of (OX,x)red=OXred,x,
  - the fibres of ν are finite and the residue field extensions are finite,
  - Xν is a disjoint union of integral normal Noetherian schemes and each affine open is the spectrum of a finite product of Dedekind domains.

See https://mathoverflow.net/questions/83626/is-the-normalisation-of-an-integral-noetherien-dimension-one-ring-a-finite-morph
for exemples where the normalisation of an integral Noetherian ring of Krull dimension one which is always Noetherian by Krull-Akizuki is not finite.

Zariski main theorem
--------------------

* Références:
- http://en.wikipedia.org/wiki/Zariski%27s_connectedness_theorem
- https://en.wikipedia.org/wiki/Zariski%27s_main_theorem (Special case of Zariski's connectedness theorem when the two varieties are birational)
- https://en.wikipedia.org/wiki/Stein_factorization
- Cf aussi RedBook pour les liens entre les versions du ZMT.
- See http://mathoverflow.net/questions/78696/is-there-an-intuitive-reason-for-zariskis-main-theorem for an intuitive geometric meaning.
- Cf math.uchicago.edu/~amathew/ZMTfull.pdf pour un overview de la preuve.

### Stein factorisation et ZMT

* Stein factorisation: https://stacks.math.columbia.edu/tag/03GX
$ 36.48 Stein factorization
1. Soit f: X -> S un morphisme qcqs et universellement fermé.
   Alors la normalisation de S dans X donne une factorisation de f en
   f:X->S'->S où g:S'->S est entier et de plus S'=Spec_S(f_∗ O_X), donc
   f':X->S' est un O-morphisme (ie f'_* O_X = O_S') qcqs universellement fermé
   surjectif.
   Cette factorisation commute avec le changement de base plat.
2. Si f: X->S propre, alors f' est propre, et par ZMT, les
   fibres de f' sont géométriquement connexes.
   [Rappel: propre=universellement fermé, séparé de type fini]
   Si de plus S est loc. noeth, g: S'->S est fini.

Preuve:
- f univ fermé => qc par https://stacks.math.columbia.edu/tag/04XU
  Lemma 28.39.9. A universally closed morphism of schemes is quasi-compact.
- 1. est le Lemma 36.48.1:
  S′=Spec_S (f_∗ O_X); S' est alors la normalisation de S dans X, donc
  entière sur S.
- 2 est le Theorem 36.48.5 et Theorem 36.48.4, et découle du
  theorem on formal functions.
  g est fini dans le cas loc. noeth, car f étant propre sur S loc. noeth, f_∗OX is a coherent OS-module

* Grothendieck's form of ZMT:
$ 36.38 Zariski's Main Theorem
https://stacks.math.columbia.edu/tag/02LQ

Lemma 36.38.1.
Soit f:X→S un morphisme séparé de type fini, S′ la normalisation de S dans X.
  - X_0={points isolés dans leurs fibres} est ouvert (topologiquement)
  - f'|X_0 est une immersion ouverte

[Pr: le fait que X_0 soit ouvert découle par exemple de la semi-continuité
des dimensions des fibres, par Chevalley.]

Application:
- si f est quasi fini séparée, f':X->S' est une immersion ouverte qc (en
  particulier f est quasi-affine car S'->S est entière donc affine)
- si de plus S est qcqs, on a X->S'->T->S où X->T est une immersion ouverte qc
  et T->S est finie; et si f loc. de présentation finie, on peut prendre
  T->S de présentation finie

* Résumé
Soit f:X→S un morphisme séparé de type fini, S′ la normalisation de S dans X.
     f: X -f'->S'->S
1) - X_0={points isolés dans leurs fibres (pour f)} est ouvert (topologiquement)
   - f'|X_0 est une immersion ouverte
2) Si de plus f est propre, S'=Spec_S(f_∗ O_X) donc f' est un O-morphisme et
les fibres de f' sont géométriquement connexes.
   Et si de plus S est loc. noeth, g: S'->S est fini.

[Remarque:
- pour avoir S'=Spec_S(f_∗ O_X), il suffit que f soit qcqs univ fermé
- si f quasi finie X_0=X->S' immersion ouverte qc, et si S est qcqs, dans 1)
  on peut prendre X->S'->T->S où X->T est une immersion ouverte qc
  et T->S est finie
  (et même T->S de présentation finie si f loc. de prés finie)
  => ie quasi fini séparé sur qcqs = fini o ouvert.
Ainsi on a plein de cas où g: S'->S est fini:
- f propre et S loc. noeth
- S nagata
- et si f quasi fini séparée et S qcqs, dans le ZMT X->S'->S se
  factorise en X->T->S où T->S fini.

Pour retrouver la Stein factorisation, on a toujours X-> Spec(f_* O_X)->S,
pour montrer que Spec(f_* O_X) est la normalisation S' de S dans X quand f est
propre, il suffirait de montrer que Spec(f_* O_X) est propre, car étant
propre et affine il est entier, donc on aurait S'->Spec(f_* O_X) et il
faudrait montrer l'égalité...
Pareil, pour retrouver le ZMT, si on a juste X->T->S avec X ouvert dans T fini,
on peut regarder X->S'->T->S et il faudrait montrer que X est ouvert dans
S'. Soit g: S'->T, on veut montrer que g^{-1}(X)->X est un iso. Si X est
normal, S' est la cloture normale de Y dans k(X), et g^{-1}(X)->X est
birationnel surjectif sur X normal, donc un iso.]

### Generalised Stein factorisation
* https://arxiv.org/pdf/1011.5484.pdf, The Hilbert Stack

- Stein
Si f qcqs, X->S'->S Stein factorisation avec S'=Spec_S(f_* O_X)
Si S loc. noeth et f propre, S'->S est fini et X->S' est propre à fibres
géom connexes.

- Generalised Stein: Th 2.1. Si S loc. noeth, f séparée et loc. quasi propre (ie
  tout point x de X vit dans une composante connexe propre de la fibre
  X_f(x)), alors on a X->S'->S (unique compatible avec changement de base
  plat) tel que S'->S loc. quasi finie et X->S' propre et Stein (ie f_*
  O_X=O_X').

  Preuve: si Sbar est la cloture intègre de S dans f_* O_X, alors l'image
  de X dans Sbar est ouverte et est égale à S'.

### Versions moins fortes

* maths.avancees:766
EGA III.7.8.8: Si Y schéma localement noethérien, f:X->Y un morphisme
propre et plat / \Gamma(X_y, O_X_y)=k(y). Alors il existe un
voisinage ouvert U de y tel que l'homomorphisme canonique O_Y|U \to
f_*(O_X)|U soit bijectif. En particulier, si f est plat, projectif, de
présentation finie, à fibres géométriques intègres, f est un O-morphisme
universel. Cf aussi maths.avancees:792 qui dit que si f:X->Y (Y noeth
réduit) est propre surjectif à fibres géométriques réduites et connexes, alors 
f est un O-morphisme.
[Donc on a pas besoin de f plat, mais on a quand même:
À tout hasard, je rappelle aussi que si f:X->S est un morphisme dont
toutes les fibres ont la même dimension, avec S régulier et X
Cohen-Macaulay, alors f est automatiquement plat (EGA IV.6.1.5).]

* Thm (Grothendieck's form of ZMT) in FOAG:
Si f:X->Y est un morphisme propre (X,Y loc noeth), f':X->Y' le morphisme
O-connexe associé, g:Y'->Y le morphisme fini, alors
1) - L'image réciproque d'un point de Y' est connexe (non vide car f', et
     aussi f, est surjective).
   - Donc le nombre de composantes connexes de f^{-1}(y) est le cardinal de
     la fibre g^{-1}(y).
   - En particulier si X et Y variétés, f:X->Y morphisme propre surjectif,
     k(Y) sep clos dans k(X) (par ex f birational), alors si y est un point
     normal, l'image réciproque de y est connexe.
     [Pr: O_Y,y=O_Y',y' car Y' est fini sur Y mais k(Y) est sép clos dans
     k(X)=k(Y') et donc l'image réciproque de y est connexe.]
2) - X_0={points isolés dans leurs fibres} est ouvert (topologiquement)
   - f'|X_0 est une immersion ouverte
     Donc si X_0 est non vide, et X et Y sont irréductibles,
     dim X=dim X_0=dim Y'=dim Y et donc si X irréd k(X)=k(X_0)=k(Y') fini
     sur k(Y).

Th: Si f: X->Y (noeths) est séparé de type fini, alors par le th de
compatification de Nagata, f est une immersion ouverte dans X' propre sur
Y, donc on peut aussi appliquer le 2) du th précédent, cf FOAG Section
29.6.
En particulier, un morphisme quasi-fini est une composée d'une
immersion ouverte et d'un morphisme fini: si f:X->Y est un morphisme
séparé, quasi-fini, de présentation finie (et Y qc), alors f se factorise
comme immersion ouverte et morphisme fini.

Cor (Chevalley): f: X->Y (noeths) quasi-fini propre est fini.

Th: The Noetherian conditions in Theorem 29.6.1 can be relaxed (see
[Gr-EGA, IV3 .8.12.6] or [GW, Thm. 12.73]): if π : X → Y is a separated
morphism of finite type, and Y is quasicompact and quasiseparated, then the
set of points X0 isolated in their fiber is open in X, and for every
quasicompact open subset U of X0 , there is a factorization
such that β:Y'->Y is finite, γ|U is a quasicompact open embedding, and γ^−1
(γ(U)) = U.

Résumé: si f:X->Y (noeths) séparé de type fini, X0={points isolés dans
leurs fibres} est ouvert et on a une factorisation X0->Y'->Y où
X0->Y': immersion ouverte et Y'->Y: morphisme fini.
[on peut relaxer noeth en juste Y qcqs]
- En particulier si f est quasi-fini, X=X0 ie X ouvert de Y'.
- Si de plus f est birationnelle et Y normal (et X intègre), Y'=Y, ie X->Y est une immersion ouverte.
- Si de plus f est une bij, c'est un iso.
=> si f birationnelle + f propre: préimage d'un point normal de Y est connexe
       (+séparée)     + f quasi-fini, Y normal: f immersion ouverte
                      + f bijectif, Y normal: f iso

Pr: k(Y')=k(X)=k(Y) car f birationnelle. Si Y normal, Y' extension finie de
Y est donc égale à Y.

### Lien avec la normalisation

! Normalisation

Soit f:X->Y un morphisme séparé de type fini de schémas (avec les conditions de finitude pour que les normalisations existe, eg X, Y qc et chaque affine à un nombre fini de composantes irréductibles).
On a donc f:X -> Y' -> Y où Y' est la normalisation de Y dans X
D'où  X^ν -> Y^ν' -> Y^ν par les propriétés universelles.
       |      |        |
       X  ->  Y'  ->   Y
Probablement, Y^ν' la normalisation de Y^ν dans X^ν est la normalisation de
Y', ie Y^ν'=Y'^ν.

En tout cas c'est clair si X et Y sont intègres et f dominant: la
normalisation de Y^ν (ou même Y) dans X^ν c'est la normalisation dans k(X),
donc en particulier Y^ν' est normal (et son corps de fraction doit être la
cloture algébrique de κ(Y) dans κ(X)).
Note: X étant ouvert dans Y' il est birationnel à Y', et X^ν étant
birationnel aussi, X, Y', X^ν, X'^ν sont birationels.

- si X_0={points isolés} est non vide, c'est un ouvert de X.
  Donc si X, Y intègres et f dominant, on voit que ηX est isolé dans sa
  fibre, c'est donc le seul, ie X_ηY=ηX, et κ(X) est une extension finie de
  κ(Y). Donc κ(Y')=κ(X).
- si Y est normal et f birationnel, Y'->Y  est entier avec même corps de
  fractions, donc Y'=Y et X est ouvert dans Y, donc X est normale.
- Y' -> Y est entier, donc affine et univ. fermé
- Si Y est normal, Y' -> Y est de plus univ. ouvert car Y est unibranche et
  on a le going down (il faut sûrement rajouter qu'on est de présentation
  finie et que Y'->Y est dominante bien sûr).

! Si f quasi finie et dominante
- Si Y est normal, comme X est ouvert dans Y', f(X) est ouvert dans Y.

  De plus, le cardinal géométrique des fibres est semi-continu
  inférieurement [EGA IV.14.4.1], et donc, dans le cas de variétés
  intègres, de cardinal inférieur à [k(Y'):k(Y)]_s (qui est le cardinal
  géom de la fibre générique si on suppose f dominant), ie à [k(X):k(Y)]_s.

  De plus on a un ouvert où ce cardinal est atteint.
  (cf [Dimension#composantes connexes des fibres])

- Même si Y n'est pas normal, on a toujours un ouvert où ce cardinal de g:Y'->Y
  (=cardinal géométrique de la fibre générique) est atteint [Dimension#composantes connexes des fibres].

  1) Ici on peut donner une preuve directe, en remarquant que Y a un ouvert normal (je suppose ici X et Y intègres, donc réduites).

  On a l'astuce suivante: si U' est un ouvert de Y', g(Y'\U) est un fermé
  rare, donc Y\g(Y'\U) est un ouvert V de Y, et quitte à remplacer U par
  U=g^{-1}V \subset U' on a g:U=g^{-1}V->V.

  => Autrement dit, si f:Y'->Y est un morphisme fini, U' un ouvert de Y',
  il existe toujours un ouvert U de U' et V de Y tel que f^{-1}V=U, d'où f: U->V.

  Ainsi, si f est quasi finie, on peut appliquer ceci à X qui est ouvert
  dans Y'. On a un ouvert normal V de Y tel que f^{-1}V \subset X et le
  cardinal (géom) des fibres est contant, on réapplique l'astuce à un
  ouvert normal de f^{-1}(V), ce qui restreint V et on obtient:
    f: f^{-1} V=U \subset X ->V est entière, avec U et V normales,
    U étant donc la normalisation de V dans k(X),
    et le cardinal géom des fibres est constant.

  2) En fait, déjà si juste k(X)/k(Y) est fini, f est quasi fini au point
  générique, donc quasi finie sur un ouvert de X, qui par ZMT est aussi un
  ouvert d'un morphisme Y'->Y fini. En appliquant l'astuce, on obtient U->V
  un morphisme fini.
  Alors
  https://math.stackexchange.com/questions/341281/number-of-points-in-the-fibre-and-the-degree-of-field-extension
  donne une preuve élémentaire que sur un ouvert de V le cardinal des
  fibres est constant.

- Si Y est normal, f quasi finie et toutes les fibres de même cardinal géom n, alors X=Y'.
    En effet, f(X)=Y car n>0, donc g:Y'->Y a pour cardinal générique
    des fibres géom n (à cause de l'astuce précédente, on a un ouvert V de Y
    tel que f^{-1}V=X), mais si z \in Y'\X, f(z) a pour cardinal de sa fibre n+1.

  En particulier, si n=1 [k(X):k(Y)]_s=1 donc k(X) est radiciel sur k(Y) et
  X^ν->X->Y est bijectif et bicontinu car il est fermé surjectif,
  et [k(X^ν)=k(X):k(Y)_s]=1 donc il est injectif.

  En fait, si on a juste [k(X):k(Y)]_s=1, alors par semi-continuité
  inférieure du cardinal des fibres, f est injectif. On a X^ν->X->Y injectif,
  et Y'->Y bicontinu bijectif sur son image (ouverte).

- On peut remplacer la condition 'Y normal' par Y loc. noeth. unibranche,
  en effet alors f est univ open (car elle est quasi finie dominante) et
  donc n_X/Y est semi continue inférieurement. Et c'est de ça dont on a
  besoin pour l'item précédent sur les fibres de cardinal n.

* Résumé: 
Par ZMT si f: X->Y est quasi finie séparée dominante, on a f: X->Y'->Y avec X->Y' ouvert et  Y'->Y entier (et même fini sous de bonnes hypothèses de finitude).
- Si X et Y intègres, on a:
  f: f^{-1} V=U \subset X ->V est entière, avec U et V normales,
    U étant donc la normalisation de V dans k(X),
    et le cardinal géom des fibres est constant = à celui de la fibre générique.
- Si de plus Y unibranche (et loc. noeth)
  - le cardinal géom des fibres est au plus celui de la fibre géom,
    ie [k(X):k(Y)]_s si f morphisme dominant de variétés intègres
    (et par ce qui précède atteint sur un ouvert)
  - si le cardinal géom des fibres est toujours égal à n, X=Y'.
  - si f est bijectif, k(X) est radiciel sur k(Y) et X^ν->X->Y est bijectif et bicontinu.
  - si [k(X):k(Y)]_s=1, alors f: Y'-> f(Y') ouvert de Y est bijectif bicontinu
- Si de plus Y est normal alors Y' est normal et:
  - si f birationnel Y=Y' et X est ouvert dans Y

* Utilisation par Dieudonné, cf plus bas:
Soit f:X->Y un morphisme (séparé de type fini) quasi-fini, dominant de variétés
intègres (noeth.), ftilde: Xtilde->Ytilde le morphisme de normalisation
(Xtilde=cloture intégrale de X dans k(X)).

La factorisation de Stein donne:
Xtilde ouvert Ytilde' -fini-> Ytilde
  |           |               |
  X    ouvert Y'      -fini-> Y
- On vérifie que Ytilde' est la cloture intégrale de Ytilde (donc de Y) dans
k(X) (cf la remarque sur le Th 1 dans Dieudonné. En fait dans stack project
ils montrent en général que Y' est la cloture intégrale de Y dans X)
- De plus Ytilde'->Ytilde est fini sur Ytilde normal, donc est ouvert (car on
a le going up).
- Si de plus Y est normal et f bijectif (ou plus généralement si les fibres
  sont de même cardinal)
  => f fini, Xtilde=Ytilde' et [K(X):K(Y)]_s=card des fibres
  [cf Dieudonné plus bas]

### Dieudonné

* Dieudonné: Cours de géométrie algébrique, Chapitre 5, Points normaux et
normalisation [pour des variétés sur un corps alg clos]:
(J. Dieudonné, Cours de géométrie algébrique, tome 2, P.U.F., 1974; $5.3, Prop 5; $5.4 Cor 4, p. 134)

- Préliminaires:

Prop 3 [normalisation]: Si A intègre, X=Spec(A) est normale (ie les anneaux
locaux sont normaux) ssi A est int clos. 
Cor: Si X irréductible, son normalisé est birationnel à X, donc X contient
un ouvert normal.

Prop 4 [Version de Going-Down]: Si u:X->Y fini surjectif (X irréd, Y irréd
normale), pour tout x et W composante irréd contenant u(x), il existe une
composante irréductible x \in W' de u^{-1}(W) dominant W.

Cor: Si u:X->Y est dominant (X,Y irréd), il existe un ouvert V de Y (qui est normal), telle que le même résultat s'applique à
u^{-1}(V)->V.
[Par normalisation de Noether: il existe un ouvert V tel que l'image
réciproque est une union des U_i avec U_i->Vxk^m->V, le premier morphisme
étant surjectif, le second clairement ouvert. En restreignant pour que V soit normal, Vxk^m l'est aussi, donc on peut appliquer la Prop 4]

Prop 5+Cor: Définition de la cloture normale d'une variété irréductible X dans une extension algébrique; si X est complète/proj, Y aussi.

Prop 6 [version de la platitude générique]:
si u:X->Y est fini surjectif, (X,Y irréd, Y normale)
- le card de u^{-1}(y) est au plus [k(X):k(Y)]_s
- il existe un ouvert V de Y tel que u^{-1}(V) soit isomorphe à la normalisée de V dans k(X) et le card des fibres de V est [k(X):k(Y)]_s]

[Attention: en général la cloture normale n'est pas plate, donc il ne
suffit pas d'avoir que u^{-1}(V) soit isomorphe à la normalisée pour avoir
des fibres de même cardinal. De plus Dieudonné compte le nombre de points
sans la multiplicité, donc même la platitude n'est pas suffisant pour avoir
des fibres de card constantes. En fait c'est plutôt un aspect du fait que Y
normal est unibranche, et que donc u est univ. ouvert, donc le cardinal
géom est semi-continu inférieurement.
On a toujours un ouvert V où le card = au card (géométrique) de la fibre
générique. La preuve que Dieudonné donne est très semblable à
https://math.stackexchange.com/questions/341281/number-of-points-in-the-fibre-and-the-degree-of-field-extension.
Et on a un ouvert U' de U=u^{-1} V normal, quitte à retrancher
u(U \U') qui est un fermé rare, on peut supposer que u^{-1}(V) \subset U'
est normal, donc isomorphe à la normalisée de V dans k(X).]

- Section 5.4: théorème principal de Zariski.

Th 1: X, Y irréductibles, u: X->Y dominant. Si x est isolé dans la fibre
u^{-1}(u(x)) alors dim X=dim Y et localement en x et u(x), u se factorise
comme u: x \in U->V'->u(x) \in V, u=immersion ouverte \circ morphisme fini (donc surjectif). Si X est normale, on peut prendre V=Y et V'=normalisée de Y dans k(X).

[Rem: On sait même qu'on a la version plus forte du ZMT suivante:
Th: Si f: X->Y (noeths) est séparé de type fini, X_0 les points isolés dans
leur fibre, alors X_0 est une immersion ouverte dans Y', Y'->Y fini,
et de plus k(X) est fini sur k(Y) si X_0 non vide.
Dans le cadre de variétés, si X normal et irréd, Y irréd, on peut prendre
Y'=normalisé de Y dans k(X).
En effet la preuve du ZMT montre que X_0 est ouvert dans la cloture de Y
dans X, qui est la cloture normale de Y dans k(X) si X normal. Mais on peut
le redémontrer directement: soit Z la cloture normale de Y dans
k(X), comme Y'->Y est fini et k(Y')=k(X), on a un morphisme g:Z->Y' fini.
g^{-1}(X)->X est alors birationnel surjectif sur X normal, ie un iso, donc
on a une immersion ouverte de X dans Z]

Cor 1: Sous les mêmes hypothèses, on a <=>
(i) X est normale et tout x \in X est isolé dans sa fibre
(ii) k(X) est une ext finie de k(Y) et u:X->Y'->Y où Y' est la normalisée
de Y dans k(X), et X->Y' est une immersion ouverte. De plus il existe une
sous-variété normale V ouverte de Y telle que les fibres u^{-1}(v) sont de
cardinal [k(X):k(Y)]_s. [En effet pour le dernier point, cf le cor de la
Prop 3 et la Prop 6]
En particulier si de plus X est complète, alors Y est complète et X=Y'.

[Preuve: (ii)=>(i) est triviale, et (i)=>(ii) vient de ZMT]

Cor 2: Si X irréd, Y irréd normale, u birationnelle tel que tout point x de
X soit isolé dans sa fibre. Alors u est une immersion ouverte de X sur Y
(et donc X est normale). Si X est complète u est un iso.

[Preuve: trivial par le strong ZMT. Dieudonné applique le Cor 1 à Xtilde, la
normalisation de X pour montrer que Xtilde est isomorphe à un ouvert de Y,
via Xtilde->X->Y donc forcément X=Xtilde.]

Attention: même si X et Y sont normales et u birationnel, u peut ne pas
être quasi-fini, Dieudonné donne l'exemple du cône x1x3-(x1^2+x2^2)=0 qui
est une variété normale.

Cor 3: si X et Y irréd normales, u^{-1}(y) est fini de card n indépendant de
y \in Y, alors X est isomorphe à la normalisée Y' de Y dans k(X) et donc u
est fini.

[Pr: X étant ouverte dans Y' et Y'->Y étant fini, u(Y'\X) est fermé, et
donc V=Y\u(Y'\X) est ouvert (dense) et u^{-1}(V)=X. Donc la fibre générique
de Y'->Y est de cardinal n. Si y\in Y'\X, u^{-1}(u(y)) a pour cardinal n+1, ce qui contredit la proposition 6.]

Cor 4: Si X irréd, Y irréd normale, u bijectif, alors
- k(X)/k(Y) est radiciel, et si X' est la normalisée de X, X'->X->Y est
  bicontinu et bijectif (et X' est la normalisée de Y dans k(X))
[En particulier si X est normal, X s'identifie à la normalisée de O(Y) dans k(X), ie f:X->Y est fini et f est donc une bijection radicielle finie, Cf Polo, Chapitre 5, Th 15.14]
- Y complet => X complet
- X affine => Y affine

[Pr: comme u bijectif, [k(X):k(Y)]_s=1, donc k(X)/k(Y) est radiciel, et par
la prop 6 v:X'->X->Y est injectif, donc bijectif (car u est bijectif), donc
par le Cor 3, v est finie, donc fermée, donc bicontinue et X' est la
normalisée de Y dans k(X). On en déduit que si Y est complet, X' aussi,
donc X aussi. X affine => Y affine est plus dur.
C'est un cas particulier de Chevalley: f:X->Y morphisme entier surjectif, et X affine. Alors Y est affine.]

Cor 5: si X irréd, Y irréd normale, u dominant, et x isolé dans sa fibre,
alors l'image par u de tout voisinage de x dans X est un voisinage de u(x)
dans Y. En particulier si tous les points sont isolés dans leur fibres, u
est ouverte.

[Pr: on décompose en X->Y'->Y, X étant ouvert dans Y'. Comme Y'->Y est fini
et Y int. clos, par le going up c'est ouvert aussi. Dieudonné se ramène au
cas X normal et fait la même preuve.]

Prop 7 (Chevalley): si X irréd, Y irréd normale, u dominant, et x tel que
les composantes irréductibes contenant x dans sa fibre u^{-1}(u(x)) soient
toutes de dimension r=dim X-dim Y. Alors l'image par u de tout voisinage de
x dans X est un voisinage de u(x) dans Y. En particulier si les composantes
irréductibes des fibres (non vides) sont toutes de dim r, u est ouverte.

[Pr: en effet on se ramène à X->Y*k^r (quitte à localiser). Attention, il y
a un manque dans la preuve de Dieudonné, il est très important de supposer
x équidimensionel comme il fait pour avoir que X->Y*k^r reste dominant. Cf
[Dimension]. On a donc X->Y*k^r est quasi fini en x et dominant, donc
ouvert autour de x, et comme la projection est ouverte, l'image d'un voisinage est un voisinage.]

Prop 8 (Chevalley): X,Y irréds, u dominant, f \in k[X]. Si f est constante
sur chacune des fibres, alors f \in k(X) est radiciel sur k(Y).

#### Résumé [en utilisant les théorèmes de Zariski dus à Grothendieck plus forts sur les schémas]

Cor1: le dernier point sur le cardinal des fibres est vrai plus généralement par platitude générique [sauf qu'on comptant les multiplicités c'est [k(X):k(Y)] et non [k(X):k(Y)]_s]

Soit u:X->Y (X,Y irréd) tel que X_0=X.
Alors il existe Y' / X ouvert dans Y'->Y fini
On passe aux normalisés dans les corps de fractions:
utilde: Xtilde->Ytilde [todo: trouver une propriété universelle des
normalisés montrant que Xtilde->X->Y se factorise par Ytilde], on a
Xtilde_0=Xtilde [car Xtilde->X est fini]. Ici on peut prendre
Ytilde'=cloture de Ytilde (et donc de Y) dans k(X). On a le diagramme:

Xtilde ouvert Ytilde' -fini-> Ytilde
  |           |               |
  X    ouvert Y'      -fini-> Y
Comme k(Y')=k(X), et que Y'->Y est fini, on a un morphisme fini Ytilde'->Y'.

On a alors Cor2: si Y est normal et u birationnel, Ytilde'=Ytilde=Y'=Y et X est une immersion ouverte dans Y (et donc Xtilde=X)
Cor3: si le card des fibres de Xtilde->Ytilde est constant, Xtilde=Ytilde'
[Utiliser la prop 6. Et en fait la même preuve montre que si Y=Ytilde, ie
Y normal, et que le card des fibres de X->Y est constant, alors X=Y', ie
X->Y est fini, et du coup Xtilde la cloture normale de X est aussi la
cloture de Y, ie Xtilde=Ytilde']
Cor4: si u est bijectif et Y normal, alors utilde est bijectif
(trivialement surjectif, injectif via la prop 6), donc Xtilde=Ytilde' (et via la
prop 6 [k(X):k(Y)]_s=1 ie l'extension est radicielle)
Cor5: si u dominant, Y irréd normale, x \in X_0, alors l'image par u de tout voisinage de x dans X est un voisinage de u(x) dans Y.
[on peut travailler localement, il suffit de montrer que Xtilde->Ytilde=Y
est ouvert, et ça vient du going up pour les extensions normales.]


Fibre générique et morphisme génériquement fini
-----------------------------------------------

!! Fibre générique
* https://stacks.math.columbia.edu/tag/054V
$ 37.22 Generic fibres
pour du passage de props à la fibre générique à une prop sur un ouvert de
la base.
Si f:X->Y, Y irréd, f finite type, Z fermé, U ouvert de X alors
- (X_η)_red=(X_red)_η
- X_η=0 <=> X_V=0 pour un ouvert V de Y
- X_η!=0 <=> X_V->V surj pour un ouvert V de Y
- Z_η nowhere dense dans X_η, alors Z_y nowhere dense dans X_y pour y∈V
- U_η schem. dense dans X_η, alors U_y schem. dense dans X_y pour y∈V
- Si la fibre générique Xη=Z1,η∪…∪Zn,η recouvrement par des fermés, alors
  y=Z1,y∪…∪Zn,y for all y∈V (où Z_i est la cloture de Z_i,η)

!! Morphismes quasi finis
* Rappels: cf [#Morphisme quasifini, et #etale local structure of morphism]
- Si f:X->S est loc. de type fini, le lieu des points isolés dans leur
  fibre est ouvert (par semi continuité supérieure)

- Si f:X→S est quasi-fini (sans condition de finitude!), il existe un
  ouvert dense U⊂S / f|f−1(U):f−1(U)→U est fini.
  Un morphisme fini étant propre, f−1(U) est donc à la fois ouvert et fermé
  dans X.

- Si f est loc. de type fini et x isolé dans sa fibre X_s, il existe un
  ouvert étale élémentaire (U,u)→(S,s), et un ouvert V de X_U tel que
  V→U est fini et il y a un unique v qui s'envoie sur u, et v s'envoie sur
  x avec κ(x)=κ(v)
  [on peut même traiter plusieurs points isolés dans X_s en même temps]

- Si f est propre et f−1({s}) un ensemble fini, il existe un ouvert s \in V⊂S tel que f|f−1(V):f−1(V)→V est fini (36.39.2)

!! Génériquement quasi-fini:
* Si f:X->S est de type fini, η point générique d'image ν est isolé dans sa fibre (<=>)
  - f est quasi-fini en η (par définition)
  - η est fermé dans sa fibre
  - κ(ν)⊂κ(η) est fini
  [- O_X,η/νO_X,η est fini sur κ(ν)]
En particulier si X et S sont intègres et f dominant, η est isolé dans sa fibre (<=>)
  - la fibre générique est de dim 0 (<=> est finie, est discrète, ...)
  - η est l'unique point de la fibre générique
  - k(X)/k(S) est fini
  Et dans ce cas Spec k(X)=X_ν.

Et si ν est un point générique de S, la fibre générique X_ν=f^{-1}(ν) est finie
 (on l'a suppose non nulle) (<=>)
- elle est discrète, ou de dim 0, ou finie sur k(ν)
- il n'y a que des points génériques de X dedans
Et si X est réduit, X_ν=\prod k(η_i)

* ZMT: Si f:X->S est un morphisme dominant loc. de type fini de schémas
intégres à fibre générique finie, alors il existe un ouvert affine U de S
tel que f: X|U->U est fini [29.49.1], et donné A[t1,...,tn,x1,...,xm]/I où
t1, ..., tn base de transcendance de k(X)=k(S)(t_i)[x_j] et I est donné par
les mêmes polynômes annulateurs des x_j (cf la preuve de Joel plus bas).

* https://stacks.math.columbia.edu/tag/02NW
$ Generically finite morphisms

Lemma 29.49.1. Let X, Y be schemes. Let f:X→Y be locally of finite type. Let η∈Y be a generic point of an irreducible component of Y. The following are equivalent:
  - the set f−1({η}) is finite,
  - there exist affine opens Ui⊂X, i=1,…,n and V⊂Y with f(Ui)⊂V, η∈V and f−1({η})⊂⋃Ui such that each f|Ui:Ui→V is finite.
If f is quasi-separated, then these are also equivalent to
  - there exist affine opens V⊂Y, and U⊂X with f(U)⊂V, η∈V and f−1({η})⊂U such that f|U:U→V is finite.
If f is quasi-compact and quasi-separated, then these are also equivalent to
  - there exists an affine open V⊂Y, η∈V such that f−1(V)→V is finite.

Preuve: pour 1<=>2 on se ramène immédiatement au
Lemma 10.121.10. Let R→S be a ring map of finite type. Let p⊂R be a minimal prime. Assume that there are at most finitely many primes of S lying over p. Then there exists a g∈R, g∉p such that the ring map Rg→Sg is finite.
Pour 3 et 4 on utilise les props qcqs.

### Preuves élémentaires (sans le ZMT):
* Forum 1795 of ens.forum.sciences.maths.avancees

> Soit f:X -> Y un morphisme de type fini, dominant, et generiquement fini
> (i.e., la fibre generique est un ensemble fini) entre schemas
> integres. Montrer qu'il existe un ouvert U de X dense tel que f^{-1}(U) -> U
> soit un morphisme fini. On me conseille de montrer d'abord que K_X est une
> extension finie de K_Y, ce que je n'arrive en fait meme pas a faire (c'est
> la que doit jouer le fait que le morphisme est generiquement fini, mais je
> n'arrive pas a traduire cela algebriquement de maniere commode).

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

----

Réponse 1 : c'est une conséquence d'un principe général de géométrie
algébrique (au moins si on rajoute que f est de présentation finie) : le
schéma \eta_Y=\Spec K(Y) est la limite projective des ouverts non vides de
Y, le morphisme f est de présentation finie et f×_Y \eta_Y est fini, il
existe donc un ouvert non vide U tel que f×_Y U soit fini. Cf. EGA IV §8.

Réponse 2 : On montre facilement que X_{\eta_Y} est intègre. On a un
morphisme évident \eta_X -> X_{\eta_Y}. L'hypothèse dit que X_{\eta_Y} ->
\eta_Y est fini, [la fibre générique est ensemblistement finie + de type
finie, donc elle est finie par le Nullstellensatz]
donc X_\eta_Y est un Spec A avec A une K(Y)-algèbre finie.
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

* https://math.stackexchange.com/questions/341281/number-of-points-in-the-fibre-and-the-degree-of-field-extension

Let f:X→Y be a dominant morphism of integral algebraic varieties over C. Suppose [K(X):K(Y)]=n. Then there exists a dense open subset U of Y such that f−1(y) consists in n points for all y∈U

Proof. The first step is to reduce to the case when f is a finite morphism.
One can suppose X=Spec(B), Y=Spec(A) are affine. The dominant morphism f
corresponds to an injective homomorphism A→B. Write
Frac(B)=Frac(A)[t]
with t annihilating a polynomial P(T)∈K(Y)[T] of degree n (theorem of primitive element). Replacing A by a localization Aa (geometrically, replace Y by a principal open subset and X by the pre-image of this principal open subset), the element t becomes integral over A. As B is a finitely generated algebra over A, localizing further A, we can suppose A⊆B⊆A[t]
(because each element of B belongs to some Aa[t], it is enough to invert a common denominator for a system of generators of B over A). As B and A[t] have the same field of fractions and B is finite over A, it is easy to see that localizing again A, we find B=A[t]=A[T]/(P(T)).
Now we are almost done. The discriminant Δ∈A of P(T) belongs to A (we may need to localize A for this) and is non-zero because P(T) is separable in Frac(A)[T]. Let U be the principal open subset D(Δ)⊆Y. Then for any y∈Y, the fiber f−1(y) is given by the algebra k(y)[T]/(P¯(T)) where k(y)=C denotes the residue field at y and P¯(T)∈k(y)[T] is the canonical image of P(T). Its discriminant is Δ(y)≠0, so it has n (distinct) roots.

Remark. The statement remains true if Y is any integral scheme, f is of finite type, and the extension K(X)/K(Y) is finite separable. But in conclusion, n is the number of points in the geometric fiber Xy¯=(f−1(y))k(y)¯. The proof is exactly the same. Without the separability hypothesis, the conclusion is for all y∈U, Xy is given by a finite k(y)-algebra of vector dimension n. 

Application aux morphismes à fibres connexes (et réduites)
----------------------------------------------------------

!! Changement étale
* https://stacks.math.columbia.edu/tag/057H
$ 36.41 Application to morphisms with connected fibres

Si f:X->S est fpf avec des fibres geom réduites, alors on a un raffinement
étale où les fibres sont géom connexes (et réduites). Si de plus f normal,
les fibres seront géom intègres (car un schéma normal réduit est une union
disjointe de schémas intègres normaux, donc si la fibre est connexe elle est
intègre).

Cf Lemma 36.41.3. Let f:X→S be a morphism of schemes which is locally of finite presentation and flat with geometrically reduced fibres. Then there exists an étale covering {Xi→X}i∈I such that Xi→S factors as Xi→Si→S where Si→S is étale and Xi→Si is flat of finite presentation with geometrically connected and geometrically reduced fibres.

Lemma 36.41.4: si de plus f est normal, les fibres Xi->Si sont géom intègres.

!! Fibres géom connexe et f_*OX=OS.
* https://stacks.math.columbia.edu/tag/0AY8
$ 36.48: Stein factorization

Note: par la Stein facto si f: X->S est propre, et les fibres sont géom connexes
alors f_* O_X est radiciel sur O_S. En effet la facto de Stein donne X->S'->S, mais comme les fibres de f sont géom connexes, ça veut dire que S'->S est radiciel.
Cf https://mathoverflow.net/questions/281244/stein-factorisation-with-connected-fibres, S'->S est fini et a des fibres géom connexes donc est radiciel.

Donc si de plus les fibres sont géom réduites, on doit pouvoir en conclure que f_* O_X=O_S?
Voir par exemple: https://stacks.math.columbia.edu/tag/0E0L
Lemma 36.29.6. Let f:X→S be a morphism of schemes. Assume
  - f is proper, flat, and of finite presentation, and
  - the geometric fibres of f are reduced and connected.
Then f_∗OX=OS and this holds after any base change.

La preuve utilise: Lemma 36.29.5. Let f:X→S be a morphism of schemes. Assume
  - f is proper, flat, and of finite presentation, and
  - for all s∈S we have κ(s)=H^0(Xs,OXs).
Then we have
  - f∗OX=OS and this holds after any base change,
  - locally on S we have Rf_∗OX=OS⊕P in D(OS) where P is perfect of tor amplitude in [1,∞).
=> En particulier si f propre et plat, f_*OX=OS <=>H^0(Xs,OXs)=k(s) pour tout
s <= les fibres géométriques de f sont réduites et connexes.
  => les fibres géométriques de f sont connexes.

Et https://mathoverflow.net/questions/281244/stein-factorisation-with-connected-fibres,
Lemma. Suppose ϕ:X→Z is a dominant proper morphism of k-varieties with geometrically connected fibres, and Z is geometrically normal. If char k=0, then ϕ_∗OX=OZ.

!! Critère pour avoir des fibres géom connexes
Lemma 36.48.6. Let f:X→Y be a morphism of schemes. Assume
  - f is proper,
  - Y is integral with generic point ξ,
  - Y is normal,
  - X is reduced,
  - every generic point of an irreducible component of X maps to ξ,
  - we have H^0(X_ξ,O)=κ(ξ).
Then f_∗OX=OY and f has geometrically connected fibres.

Preuve: prendre la facto de Stein X->Y'->Y, et on montre que Y'=Y, car Y'
est entier sur Y et k(Y')=k(Y).

Corollaire: https://math.stackexchange.com/questions/3015330/special-fiber-is-geometrically-connected-if-the-generic-fiber-is-under-propernes/3015656
Si f:X->S smooth separated (S=Spec discrete dvr), X_η geom connected and
X_s proper non empty, then X is proper over S and by 36.48.6 X_s geom
connected.

* https://stacks.math.columbia.edu/tag/055J
$ Connected components of fibres
Slogan: A flat degeneration of a disconnected scheme is either disconnected or nonreduced. 
Lemma 36.26.7. Let f:X→S be a morphism of schemes. Assume that
  - S is the spectrum of a discrete valuation ring,
  - f is flat,
  - X is connected,
  - the closed fibre X_s is reduced.
Then the generic fibre X_η is connected. 

!! Critères pour avoir des fibres réduites
* https://stacks.math.columbia.edu/tag/09IJ
$ 37.57 Reduced fibre theorem

Theorem 37.57.1. Let A be a Dedekind ring with fraction field K. Let X be a scheme flat and of finite type over A. Assume A is a Nagata ring. There exists a finite extension K⊂L such that the normalized base change Y is smooth over Spec(B) at all generic points of all fibres.

!! Remplacement pour avoir une fibre générique géom irréductible
* https://stacks.math.columbia.edu/tag/054V
$ 37.22: Generic fibres

Lemma 37.22.7 et 37.22.8. f: X->Y, Y irréd, f de type fini.
- Alors il existe un ouvert V de Y, tel que X|V->V a un remplacement
f':X'->Y' où X′=(Y′×Y X)_red=(Y′×V X|V)_red,
Y' schéma affine intègre, et g:Y'->V finite univ. homéo (= f is integral, universally injective and surjective).
f' plat de présentation finie dont la fibré générique est géom. reduced
- Et il existe un ouvert V et un pullback f':X'->Y' de X|V->V tel que
Y' schéma affine irreductible et g:Y'->V et g':X'->X|V surjective finite étale
toutes les composantes irréd de la fibre générique de f' sont geom. irréd

Branches
--------

* Résumé (sous les bonnes hypothèses de finitudes, eg qc et nombre fini de
composantes irréd):
- Le nombre de branche (géom) est le nombre de composantes irréd de l'hensélization (stricte) en x
- C'est toujours inférieur  au nombre de composantes irréd de la
  complétion; et si A local et the formal fibres of A are geometrically normal (for example if A is excellent or quasi-excellent), then A is Nagata and the number of (geometric) branches of A and A∧ is the same.
- Lien avec la normalisation:
  - The number of branches of X at x is the number of inverse images of x in Xν. (la normalisation)
  - The number of geometric branches of X at x is ∑_{ν(x^ν)=x} [κ(x^ν):κ(x)]_s.
  En particulier si X normal en x, il est unibranche en x.
- Lien avec les voisinages étales (en utilisant que la hensélisation est le
  germe pour les voisinages étales):
  the number of (geom) branches of X at x is equal to the supremum of the number of irreducible components of U passing through u taken over elementary étale neighbourhoods (resp. étale neighbourhoods) (U,u)→(X,x),

Exemple: Si X→S smooth on a le même nombre de branche:
  - The number of geometric branches of X at x is equal to the number of geometric branches of S at s.
  - If κ(x)/κ(s) is a purely inseparable (it would suffice if κ(x) is geometrically irreducible over κ(s)) extension of fields, then number of branches of X at x is equal to the number of branches of S at s.

* https://stacks.math.columbia.edu/tag/06DT
$ 15.95 Local irreducibility
Definition 15.95.1.

Let A be a local ring. We say A is unibranch if the reduction Ared is a domain and if the integral closure A′ of Ared in its field of fractions is local. We say A is geometrically unibranch if A is unibranch and moreover the residue field of A′ is purely inseparable over the residue field of A.

Let A be a local ring. Here is an equivalent formulation
  - A is unibranch if A has a unique minimal prime p and the integral closure of A/p in its fraction field is a local ring, and
  - A is geometrically unibranch if A has a unique minimal prime p and the integral closure of A/p in its fraction field is a local ring whose residue field is purely inseparable over the residue field of A.

Lemma 15.95.3. Let A be a local ring. Let Ah be the henselization of A. The following are equivalent
  - A is unibranch, and
  - Ah has a unique minimal prime
Lemma 15.95.5. Let A be a local ring. Let Ash be a strict henselization of A. The following are equivalent
  - A is geometrically unibranch, and
  - Ash has a unique minimal prime.

Definition 15.95.6. Let A be a local ring with henselization Ah and strict henselization Ash. The number of branches of A is the number of minimal primes of Ah if finite and ∞ otherwise. The number of geometric branches of A is the number of minimal primes of Ash if finite and ∞ otherwise.

We spell out the relationship with Definition 15.95.1.
Lemma 15.95.7. Let (A,m,κ) be a local ring.
  - If A has infinitely many minimal prime ideals, then the number of (geometric) branches of A is ∞.
  - The number of branches of A is 1 if and only if A is unibranch.
  - The number of geometric branches of A is 1 if and only if A is geometrically unibranch.
Assume A has finitely many minimal primes and let A′ be the integral closure of A in the total ring of fractions of Ared. Then
  - the number of branches of A is the number of maximal ideals m′ of A′,
  - to get the number of geometric branches of A we have to count each maximal ideal m′ of A′ with multiplicity given by the separable degree of κ(m′)/κ.

Un morphisme smooth ne change pas le nombre de branches:
Lemma 15.95.8. Let A→B be a local homomorphism of local rings which is the localization of a smooth ring map.
  - The number of geometric branches of A is equal to the number of geometric branches of B.
  - If A→B induces a purely inseparable extension of residue fields, then the number of branches of A is the number of branches of B.

* https://stacks.math.columbia.edu/tag/0C27
$ 15.96 Branches of the completion

- The number of branches of A is at most the number of branches of A∧.
- The number of geometric branches of A is at most the number of geometric branches of A∧

Lemma 15.96.6. Let (A,m) be a Noetherian local ring. The punctured spectrum of A∧ is disconnected if and only if the punctured spectrum of Ah is disconnected. 

Lemma 15.96.7. Let (A,m) be a Noetherian local ring of dimension 1. Then the number of (geometric) branches of A and A∧ is the same. 

Lemma 15.96.8. Let (A,m) be a Noetherian local ring. If the formal fibres of A are geometrically normal (for example if A is excellent or quasi-excellent), then A is Nagata and the number of (geometric) branches of A and A∧ is the same.

* https://stacks.math.columbia.edu/tag/0BQ1
$ 27.15 Local irreducibility

Definition 27.15.1. Let X be a scheme. Let x∈X. We say X is unibranch at x if the local ring OX,x is unibranch. We say X is geometrically unibranch at x if the local ring OX,x is geometrically unibranch. We say X is unibranch if X is unibranch at all of its points. We say X is geometrically unibranch if X is geometrically unibranch at all of its points. 

Lemma 27.15.2. A normal scheme is geometrically unibranch.

Lemma 27.15.3. Let X be a Noetherian scheme. The following are equivalent
  - X is geometrically unibranch (Definition 27.15.1),
  - for every point x∈X which is not the generic point of an irreducible component of X, the punctured spectrum of the strict henselization OshX,x is connected.

Definition 27.15.4. Let X be a scheme. Let x∈X. The number of branches of X at x is the number of branches of the local ring OX,x as defined in More on Algebra, Definition 15.95.6. The number of geometric branches of X at x is the number of geometric branches of the local ring OX,x as defined in More on Algebra, Definition 15.95.6.

Lemma 27.15.5. Let X be a scheme and x∈X. Let Xi, i∈I be the irreducible components of X passing through x. Then the number of (geometric) branches of X at x is the sum over i∈I of the number of (geometric) branches of Xi at x.

Lemma 27.15.6. Let X be a scheme. Let x∈X.
  - The number of branches of X at x is 1 if and only if X is unibranch at x.
  - The number of geometric branches of X at x is 1 if and only if X is geometrically unibranch at x.

* https://stacks.math.columbia.edu/tag/0C3Z
$ 32.39 The number of branches

Lemma 32.39.1. Let X be a scheme. Assume every quasi-compact open of X has finitely many irreducible components. Let ν:Xν→X be the normalization of X. Let x∈X.
  - The number of branches of X at x is the number of inverse images of x in Xν.
  - The number of geometric branches of X at x is ∑_{ν(x^ν)=x} [κ(x^ν):κ(x)]_s.

Un base change par K/k ne change pas le nombre de branches géométriques (K,
k corps) [Lemma 32.39.2.], donc le fait d'être géom unibranche

* https://stacks.math.columbia.edu/tag/0CB2
$ 36.33 Étale neighbourhoods and branches

Lemma 36.33.2. Let X be a scheme and x∈X a point. Then
  - the number of branches of X at x is equal to the supremum of the number of irreducible components of U passing through u taken over elementary étale neighbourhoods (U,u)→(X,x),
  - the number of geometric branches of X at x is equal to the supremum of the number of irreducible components of U passing through u taken over étale neighbourhoods (U,u)→(X,x),
  - X is unibranch at x if and only if for every elementary étale neighbourhood (U,u)→(X,x) there is exactly one irreducible component of U passing through u, and
  - X is geometrically unibranch at x if and only if for every étale neighbourhood (U,u)→(X,x) there is exactly one irreducible component of U passing through u.
Lemma 36.33.3: version relative on the number of branches of the fibre Xs at x,
 en utilisant le lemme 36.31.6:
 Eg the number of branches of the fibre Xs at x is equal to the supremum of the number of irreducible components of the fibre Us passing through u taken over elementary étale neighbourhoods (U,u)→(X,x),

Lemma 36.33.4. Let X→S be a smooth morphism of schemes. Let x∈X with image s∈S. Then
  - The number of geometric branches of X at x is equal to the number of geometric branches of S at s.
  - If κ(x)/κ(s) is a purely inseparable (it would suffice if κ(x) is geometrically irreducible over κ(s)) extension of fields, then number of branches of X at x is equal to the number of branches of S at s.

Morphismes Affines
==================

Cf https://stacks.math.columbia.edu/tag/0EKF Proj and Spec

Relative Spec
-------------

* https://stacks.math.columbia.edu/tag/01LG
$ 26.2 Relative glueing
* https://stacks.math.columbia.edu/tag/01LL
$ 26.3 Relative spectrum via glueing
* https://stacks.math.columbia.edu/tag/01LQ
$ 26.4 Relative spectrum as a functor

S is a scheme and A is a quasi-coherent sheaf of O_S-algebras.

Th: Hom(T, Spec_S A)={f: T->S avec f^*A -> O_T un morphisme de O_T-algèbres}
(ce qui revient au même de se donner f^-1 A -> O_T un morphisme de f^-1 O_S
algèbres, ou encore A->f_* T un morphisme de O_S algèbres)

Propriétés:
- Stable par pullback:
  Cf Lemma 26.4.1. g:S'->S; alors Spec_S' g^* A = S' x_S Spec_S A (ie g* Spec_S A).
- f: Spec_S A -> S est affine.
  De plus si S affine, Spec_S A=Spec Γ(S,A), donc en général on peut
  construire Spec_S A en recollant ces Spec Γ(U,A) le long des affines U de S.
- A -> f_* O_{Spec_S A} est un iso de O_S-algèbres.
- Si f: X->S est qcqs, f_* O_X est un faisceau quasi-cohérent de
  O_S-algèbres et on a un morphisme canonique X->Spec_S(f_* O_X)
  qui est donné sur les ouverts par f^−1(U)⟶Spec(Γ(f^−1(U),OX))

Yoneda
------

* Si Y=Spec B, alors Hom(X,Y)=Hom(B, ΓX) = Hom(Spec ΓX, Y).
(ça marche pour X schéma ou même espace localement annelé)
I.e. le foncteur Spec est un adjoint à droite du foncteur sections globales
Γ:(loc ringed space)→(rings)^op.

Dans l'autre sens:
Hom(Y,X)=X(Y)=X(B) (=Hom(A,B) si X=Spec A) est le foncteur des points
(qui pour un anneau B représente l'ensemble des éléments de B satisfaisant
les "équations" de X)

Localisation des sections globales
----------------------------------
(Hartshorne, Lemme 5.14)

L fibré inversible sur X schéma, f \in \Gamma(X,L), X_f l'ensemble des
points tels que f ne s'annule pas en x (ie f_x \not \in m_x L_x), F
faisceau quasi-cohérent sur X.
(i) Si X quasi-compact et s \in \Gamma(X,F) est une section globale de
restriction 0 sur X_f, alors il existe n tel que f^n s=0 (où f^n s est une
section de L^n \tens F).
(ii) Si de plus X est recouvert par des affines U_i tels que L restreint à
U_i soit libre, et U_i \inter U_j quasi-compact. Etant donné une section t
\in Gamma(X_f,F), il existe n tel que f^n t \in Gamma(X_f, L^n \tens F)
s'étend en une section globale.

Exemple: avec L=O_X, si l'hypothèse de (ii) est vérifiée (quasi compacité
de X et des intersections d'un recouvrement affine, par exemple X affine!),
alors \Gamma(X_f,O_X_f) = \Gamma(X,O_X)_f

On en déduit le théorème:
Si X est qcqs et f \in Gamma(X,O_X), alors la flêche \Gamma(X,O_X)_f ->
\Gamma(X_f,O_X) est un isomorphisme.

Critères d'affinité
-------------------

* X est affine ss'il existe des sections globales f_1, ..., f_n qui engendrent l'idéal unité et telles que X_f_i soit affine.

* Chevalley: [critère pour qu'un morphisme entier soit affine]
f:X->Y morphisme entier surjectif, et X affine. Alors Y est affine.

[Preuve: cf Raynaud, un critère d'effectivité de descente, Prop 3.1,
qui le montre dans le cas Y normal intègre ou Y noéthérien.
En général, cf Cor A.2 de http://math.stanford.edu/~conrad/papers/nagatafinal.pdf, qui utilise une approximation noethérienne.
Sauf que A.2 suppose juste X->Y fini, pas entier, mais par approximation on
peut se ramener au cas fini, cf https://stacks.math.columbia.edu/tag/05YU
Cf David Rydh pour une généralisation aux espaces algébriques]

* https://ncatlab.org/nlab/show/Serre%27s+criterion+of+affineness
If f:X→Y is a quasicompact morphism of algebraic schemes and X is separated, then f is affine iff it is cohomologically affine, that is, the direct image functor f_* is exact.

Cf https://amathew.wordpress.com/2012/08/01/serres-criterion-for-affineness-as-morita-theory/
Let X be a quasi-compact, separated scheme. Then a criterion of Serre
asserts that X is affine if and only if H^i(X, F) =0 , i > 0 for all
quasi-coherent sheaves F on X: that is, affine schemes are characterized by
the vanishing of the higher cohomology of all quasi-coherent sheaves. The
purpose of this post is to explain an interpretation of Serre’s theorem (or
rather, the “if” direction) in terms of category theory. Namely, the idea
is that if X satisfies the cohomological vanishing condition, then the
functor
  Γ: \QCoh(X) \to Mod(Γ(X,O_X))
from the category of quasi-coherent sheaves on X to the category of modules
over Γ(X, O_X), turns out to be a symmetric monoidal equivalence for
formal reasons. A version of Tannakian formalism now shows that X is itself
isomorphic to Spec Γ(X, O_X): that is, the category QCoh(X) together
with its symmetric monoidal structure recovers X.

* https://stacks.math.columbia.edu/tag/01XE
$ 30.3: Vanishing of cohomology

Lemma 30.3.1. If X is a qc (qs) scheme / for every quasi-coherent sheaf of ideals I⊂OX (of finite type) we have H^1(X,I)=0. Then X is affine.
Lemma 30.3.4. Let f:X→Y be a quasi-compact morphism with X and Y quasi-separated. If R^1f_∗I=0 for every quasi-coherent sheaf of ideals I on X, then f is affine.

* https://www.math.columbia.edu/~dejong/wordpress/?p=4360

- Tag 02O0 A scheme whose underlying space is finite discrete is affine.
- Tag 01PV The nonvanishing locus of a section of a line bundle on an affine scheme is affine.
- Tag 0C3A Let Y be a locally closed subscheme of an affine scheme X and assume there is an affine open U of X such that Y ∩ U is affine and such that Y ∖ U is closed in X. Then Y is affine.
- Tag 04DE If X → Y is a homeomorphism onto a closed subset of the affine scheme Y then X is affine.
- Tag 01XF Vanishing of higher cohomology for quasi-coherent modules implies affine.
- Tag 0EBE If X is quasi-affine and H^i(X, O_X) = 0 for i > 0 then X is affine.
- Tag 0EBR Suppose you have a reflexive rank 1 module L over a local ring A and a section s of L such that s^n is contained in mA L[n]. Then the locus where s doesn’t vanish is affine. This generalizes the case of invertible modules mentioned above.
- Tag 05YU If X → Y is surjective and integral (for example finite) and X is affine, then Y is affine.
- Tag 09NL If a scheme X is the union of finitely many affine closed subschemes, then X is affine.
- Tag 0A28 If X is a curve and not proper, then X is affine.
- Tag 0F3R If f : X → Y is a morphism of affine schemes which has a positive weighting w, then the set V of points y of Y such that the total weight over y is maximal is an affine open of Y. For example, if f is etale, then V is the maximal open of Y over which f is finite etale. Other cases where one has a weighting are discussed in Lemmas Tag 0F3D and Tag 0F3E
- Tag 0EB7 The complement of a 1 dimensional closed subset of the spectrum of a 2 dimensional normal excellent Noetherian local ring is affine.
- Tag 0ECD Let f : X → Y be a finite type morphism of excellent affine schemes over a field with X normal and Y regular. Then the locus V in X where f is etale is affine. (This should be true without assuming Y to be over a field.) This result is a strengthening of purity of ramification locus which itself is a result of Gabber you can find in section Tag 0EA1.

Morphisme affine
----------------

* https://stacks.math.columbia.edu/tag/01S5 
$ 28.11 Affine morphisms

Un morphisme est affine ssi la réciproque d'un affine est affine ou encore
s'il existe un recouvrement affine de la cible dont les réciproques sont
affines.
- Un morphisme affine est séparé et qc.
- Stable par composition, changement de base.

Ex: un morphisme fini, une immersion fermée est affine
    Si L line bundle sur X, s une section, alors X_s -> X est affine

Th (global spec): 
  Soit Y un schéma et A un faisceau quasi-cohérent de O_Y algèbres.
  On peut définir un morphisme affine f: Spec A -> Y tel que A=f_* O_Spec A.
  Concrètement, si V \subset Y est affine, f^-1(V)=Spec A(V).
  Réciproquement, si f: X->Y est affine, X=Spec f_* O_X.
Ie on a une équivalence de catégorie entre les schémas affines sur Y et les
faisceau quasi-cohérents de O_Y algèbres.

Th: si f:X->Y est affine, X=Spec A, alors il y a équivalence de catégorie
entre les modules quasi-cohérents sur X et les A-modules quasi cohérents sur
Y.

Lemma 28.11.11. Suppose g:X→Y is a morphism of schemes over S.
  - If X is affine over S and Δ:Y→Y×SY is affine, then g is affine.
  - If X is affine over S and Y is separated over S, then g is affine.

* Global Spec
f:Y->X, S une O_X-algèbre.
Alors (à vérifier!) f^* Spec S = Spec f^* S.

Th: Soit a:X->S, b:Y->S un morphisme affine. Alors
    Hom_S(X,Y)=Hom_O_S(b_* O_Y, a_* O_X)

Pr: Localement, si U ouvert affine de S, V=b^-1(U) est affine dans Y, et si
W=a^-1(U) on sait que Hom(W,V)=Hom(\Gamma(V),\Gamma(W)). Il suffit ensuite
de recoller.

Morphisme quasi-affine
----------------------

* https://stacks.math.columbia.edu/tag/01P5
$ 27.18 Quasi-affine schemes

A scheme X is called quasi-affine (<=>)
- it is quasi-compact and isomorphic to an open subscheme of an affine scheme
- X⟶Spec(Γ(X,OX)) is a quasi-compact open immersion
- O_X est ample (https://stacks.math.columbia.edu/tag/01QD)

Note: comme Spec(A)=Proj(A[T]), quasi-affine => quasi-projectif.

* https://stacks.math.columbia.edu/tag/01SJ
$ 28.12 Quasi-affine morphisms

f: X->S quasi-affine si l'image inverse d'un affine est quasi-affine. => qc et séparé (<=> There exists an affine open covering S=⋃Wj such that each f−1(Wj) is quasi-affine.)
- stable par composition et changement de base

Ex: une immersion qc est quasi-affine.
    un morphisme quasi-affine de type fini est quasi-projectif (https://stacks.math.columbia.edu/tag/0B3H)

Th (Lemma 28.12.3). X->S quasi-affine <=> X -> Y -> S où Y->S est affine et X->Y
est une immersion ouverte qc <=> pareil avec Y=Spec_S f_* O_X.
<=> O_X est f-relativement ample (https://stacks.math.columbia.edu/tag/0891)

Lemma 28.12.8. Suppose g:X→Y is a morphism of schemes over S. If X is quasi-affine over S and Y is quasi-separated over S, then g is quasi-affine. In particular, any morphism from a quasi-affine scheme to a quasi-separated scheme is quasi-affine.
Attention: même si X est affine, g:X->Y n'est pas forcément affine. Par
contre g sera bien quasi-affine, si Y est qs.

Quasi affine=immersion dans A^n_S
Lemma 29.37.2. Let π:X→S be a morphism of schemes. Assume that X is quasi-affine and that π is locally of finite type. Then there exist n≥0 and an immersion i:X→A^n_S over S. [https://stacks.math.columbia.edu/tag/04II]

* https://stacks.math.columbia.edu/tag/01XO
$ 30.17: Ample invertible sheaves and cohomology 
Lemma 30.17.7. Let X be a scheme. Let L be an ample invertible OX-module. Let n0 be an integer. If H^p(X,L^⊗−n)=0 for n≥n0 and p>0, then X is affine.
Lemma 30.17.8. Let X be a quasi-affine scheme. If H^p(X,OX)=0 for p>0, then X is affine.

* https://stacks.math.columbia.edu/tag/0B7L
$  32.11: Characterizing affine schemes
Lemma 32.11.5. Let i:Z→X be a closed immersion of schemes inducing a homeomorphism of underlying topological spaces. Then X is quasi-affine if and only if Z is quasi-affine.

Morphismes Projectifs
=====================

[Old] La construction Proj
--------------------

* Proj Global

Si S est un A-anneau gradué, et f est homogène, alors
U=Proj S \ V(f) est ensemblistement l'ensemble des premiers homogènes
de S[1/f] ne contenant pas f (et donc l'idéal irrélevent S_+)
Cet ensemble est en bijection avec Spec S[1/f]_0
On munit U de la structure de schéma Spec S[1/f]_0

Les sous-schémas affines engendrés par les f_i recouvrent Proj S ssi
S_+=Radical(f_i)

Proj S est isomorphe à Proj S^(d) où S^(d) = \sommetens_n S_{dn)

* Relative Proj

f:Y->X, S une O_X-algèbre graduée.

Alors (à vérifier! [ok dans le stack project c'est dit explictement que
Proj commute au pullback]) f^* Proj S = Proj f^* S.

Rappel: si E est cohérent sur X, P(E)=Proj(Sym(E)).
Ex: si S est engendrée par S_1, alors Proj S -> P(S_1) est une immersion
fermée.

* Pullback

- f^* Proj S = Proj f^* S; en particulier
  f^* P(E) = P(f^* E) (à vérifier!)

* Morphismes dans l'espace projectif

Hom_X(Y,P(E)) = { épimorphismes f^* E -> L, L inversible sur Y }/{isomorphisms}

En effet, on a le diagramme commutatif suivant

P(L) -> P(f^* E)  --> P(E)
   \     |             |
    \    v             v
         Y        -->  X
Or si L est inversible, P(L) \iso Y

(Remarque: le fibré vectoriel associé à L est V(L)=Spec(S(L)) et P(L) est
le quotient projectif de V(L). En général, L localement libre de dim n+1
n'implique pas P(L) \iso P^n, mais c'est vrai pour n=1 car tout se recolle)

* Morphismes homogènes d'anneaux

A et B anneaux homogènes de type finis engendrés en degré 1.
f: A -> B morphisme homogène, induit un morphisme
phi: U -> Proj A où U est l'ouvert de Proj B complémentaire de
V+(f(A+)B).

phi est défini partout ssi B/A est fini.

En effet, si phi déf partout, \sqrt(f(A+)B)=B+ par Nullstellensatz.
Par Noeth, il existe n / B+^n \subset f(A+)B.
On en déduit:
- B_n=B_1^n \subset \sum_{i<n} f(A_i)B_{n-i}
  B_{n+1}=B_n B_1 \subset \sum f(A_{i+1}) B_{n-i}
  B_m \subset \sum f(A_{i+m-n}) B_{n-i}
Donc B \subset f(A)B_0 + ...+ f(A) B_{n-1}
B est entier sur A, ie phi est fini.

Géométriquement, si on a un morphisme de var proj Y->X de la forme
précédente, on peut le voir comme il existe L très ample sur Y
tel qu'on ait un morphisme phi^*(O_X(1)) -> L. Si le morphisme est déf
partout, alors L est engendré par les sections globales de phi^*(O_X(1))
et on peut montrer que phi est fini.

Réciproquement, si phi: Y=Proj B -> X=Proj A est fini
phi^*(O_X(1)) est ample, donc phi^*(O_X(1))^d=\phi^*(O_X(d)) est très
ample, et phi est induit par un morphisme
\Gamma_*(O_X(d))=A[d] -> \Gamma_*(phi^*(O_X(d)))

* Fibrés amples (FOAG, $16.6)
Si f:X->Y=Spec A proper
- L very ample => L base point free
- Si L, M inversibles sur X, générés par leurs sections globales
  L très ample => L \tens M très ample
- Si X noeth, L ample et (M ample ou généré par sections globales) => 
  L \tens M ample
- Si f:X->Y est qcqs, L ample sur X <=> L|y ample sur O_Y,y pour tout y

* http://math.mit.edu/~mckernan/Teaching/07-08/Autumn/18.735/l_3.pdf

Lemma 3.4.Let f:X→Y be a morphism of projective schemes. Let D be a Q-Cartier divisor on Y.
(1) If D is ample and f is finite then f^∗D is ample.
(2) If f is surjective and f^∗ D is ample (this can only happen if f is finite) then D is ample
Lemma 3.6:
(1) If D is semi ample then f^∗ D is semiample.
(2) If Y is normal, f is surjective and f^∗ D is semi ample then D is semiample
[D=semi ample := mD base point free pour m>>0]

Theorem 3.8 (Asymptotic Riemann-Roch). Let X be a normal projective variety and let D and E be two integral Weil divisors.
Then P(m) =χ(OX(mD+E)) =D^nm^n/n!+D^{n−1}·(K_X−2E)m^{n−1}/2(n−1)!+...
is a polynomial of degree at most n= dimX.

Theorem 3.9 (Nakai-Moishezon). Let X be a normal projective variety and let D be a Q-Cartier divisor. D is ample <=> For every subvariety V⊂X of dimension k, D^k·V >0

Theorem 3.10 (Kodaira vanishing).LetXbe a smooth projective variety and let D be an ample divisor. Then H^i(X,OX(K_X+D)) = 0, for i >0

Conjecture 3.11 (Fujita’s conjecture). Let X be a smooth projective variety of dimension n and let D be an ample divisor. Then
(1) K_X+(n+1) D is base point free.
(2) K_X+(n+2) D is very ample.

Definition 3.15. Let X be a normal projective variety and let D be a Q-Cartier divisor. We say that D isnef if D·C≥0 for all curves C⊂X.
=> D^k·V≥0 for all subvariety V of dim k [3.17]

Lemma 3.16.Let X be a normal variety and let D be a Q-Cartier divisor. If D is semiample then D is nef.

Lemma 3.18. Let X be a normal projective variety and let π:Y→X blow up a smooth point p of X. Then E^n=(−1)^{n−1} where E is the exceptional divisor.

Lemma 3.19 (Kodaira’s Lemma). Let X be a normal projective variety of dimension n and let D be a Q-Cartier divisor. (<=>)
(1) h^0(X,OX(mD))> αm^n, for some constant α>0, for any m which is sufficiently divisible.
(2)D∼QA+E, where A is an ample divisor and E≥0.
If further D is nef then these conditions are equivalent to (3) D^n>0.

Theorem 3.20 (Seshadri’s criteria). Let X be a normal projectivevariety and let D be a Q-divisor. <=>
(1) D is ample.
(2) For every point x∈X, there is a non-negative constant c(x)>0 such that for every curve C, D·C > c(x)mult_x C.

Definition 3.22.LetXbe a normal projective variety. The cone of curves of X, denoted NE(X), is the cone spanned by the classes[C]∈H^2(X,R)inside the vector space H^2(X,R). The closed cone of curves of X, denoted NE.(X), is the closure of NE(X) inside H^2(X,R).
Theorem 3.23 (Kleiman’s criterion). Let X be a normal projective variety. (<=>)
(1) D is ample.
(2) D defines a positive linear functional on NE.(X)−{0}→R^+ defined by extending the map [C]→H·C linearly. In particular NE.(X) does not contain a line and if H is ample then the set {α∈NE(X)|H·C≤k} is compact, where k is any positive constant.

Definition 3.24. Let f:X→Y be a morphism of varieties. We say that f is acontractionmorphism if f_∗OX=OY

A contraction morphism always has connected fibres; if Y is normal and f has connected fibres then f is a contraction morphism. If f is a constraction morphism, f(x)=f(y) iff there is a curve through x and y contracted to a point.

Proj of a Graded Ring
---------------------

* https://stacks.math.columbia.edu/tag/01M3
$ 27.8 Proj of a graded ring

Recall that Proj(S) has a basis of open sets D+(f), f∈Sd, d≥1
Si D+(g)⊂D+(f), alors on a S_f -> S_g, et S_(f) -> S_(g) et
  (S(f))_{g^deg(f)/f^deg(g)}≅S(g)

Lemma 27.8.4. Let S be a graded ring. Let M be a graded S-module. Let M˜ be the sheaf of OProj(S)-modules associated to M.
  - For every f∈S homogeneous of positive degree we have Γ(D+(f),O_Proj(S))=S_(f).
  - For every f∈S homogeneous of positive degree we have Γ(D+(f),M˜)=M_(f) as an S_(f)-module.
  - Whenever D+(g)⊂D+(f) the restriction mappings on O_Proj(S) and M˜ are the maps S_(f)→S_(g) and M_(f)→M_(g) from Lemma 27.8.1.
  - Let p be a homogeneous prime of S not containing S+, and let x∈Proj(S) be the corresponding point. We have O_Proj(S),x=S_(p).
  - Let p be a homogeneous prime of S not containing S+, and let x∈Proj(S) be the corresponding point. We have F_x=M_(p) as an S_(p)-module.
  - There is a canonical ring map S_0⟶Γ(Proj(S),S˜) and a canonical S_0-module map M_0⟶Γ(Proj(S),M˜) compatible with the descriptions of sections over standard opens and stalks above. [Attention, ce n'est pas un iso en général]
Moreover, all these identifications are functorial in the graded S-module M. In particular, the functor M↦M˜ is an exact functor from the category of graded S-modules to the category of O_Proj(S)-modules.

Props:
- Proj(S) est séparé
- Proj(S) est qc ssi exist finitely many homogeneous elements f1,…,fn∈S+ such that S+⊂√(f1,…,fn). In this case Proj(S)=D+(f1)∪…∪D+(fn).
- On a un morphisme canonique Proj(S)->Spec(S_0), et si S est de type fini
  sur S_0 ce morphisme est qc et universellement fermé, ie Proj(S)->Spec(S_0) est propre.

* https://stacks.math.columbia.edu/tag/01MJ
$ 27.9 Quasi-coherent sheaves on Proj

Le foncteur M -> Mtilde (modules sur S -> Proj S faisceaux quasi cohérents) commute aux produits tensoriels et à l'application canonique
M0⟶Γ(Proj(S),M˜)

Attention: M˜ ⊗_OX N˜⟶ M ⊗_S N˜ n'est pas un iso en général.

* https://stacks.math.columbia.edu/tag/01MM
$ 27.10 Invertible sheaves on Proj 

On a des map s OX(n)⊗_OX F(m)⟶F(n+m), S⟶⨁_{n≥0} Γ(X,OX(n)), M⟶⨁_{n∈Z} Γ(X,M(n)˜).
Attention, OX(n) n'est pas invertible et OX(n) ⊗_OX OX(m)⟶OX(n+m) n'est pas
un iso en général. Du coup OX(n) ⊗_OX F(m)⟶F(n+m) et M˜(n)=M˜ ⊗_OX
OX(n)⟶M(n)~ non plus.

En revanche, si f \in S_d, on a des isos sur D_+(f) (Lemma 27.10.2)
OX(nd) ⊗ F(m)⟶F(nd+m) et M˜(nd)=M˜ ⊗_OX OX(nd)⟶M(nd)~ 
et donc si X=Proj(S) est recouvert par des D_+(f) avec f de degré 1, par
ex. si S est engendrée par S_1 sur S_0, alors les O_X(n) sont invertibles
et toutes ces applis sont bien des isos, d'où une application M⟶ ⨁_{n∈Z}
Γ(X,M˜(n)) car M(n)~=M˜(n) (27.10.3).

Lemma 27.10.7. Let S be a graded ring. Set X=Proj(S). Let F be a
quasi-coherent OX-module. Set M=⨁_{n∈Z} Γ(X,F(n)) as a graded S-module,.
Then there is a canonical OX-module map M˜⟶F functorial in F such that the
induced map M0→Γ(X,F) is the identity.

[Et si S engendré en degré 1 normalement M˜ =~ F mais je ne trouve pas la réf dans stacks, ie on a M->Γ_*(M~) et Γ_*(F) -~> F.

Cf Hartshorne ou FOAG $15.4., th 15.4.2. Et Γ_*(M~) est la saturation de M, en particulier si S_0=k, S de type fini sur k, M fini, il est égal à M en degré assez grand. Et on a même une adjonction: 15.4.I. ⋆⋆ EXERCISE (Γ• AND ∼ ARE ADJOINT FUNCTORS). Et 15.4.J: S->Γ_*(O_X) induit un iso Proj Γ_*(O_X) =~ Proj(S).

Et si Z est fermé dans X=Proj(S), de 0->I_Z->O_X->O_Z->0 on tire
0->Γ_*(I_Z)->Γ_*(O_X)->Γ_*(O_Z). Et donc par exactitude O_Z=Γ_*(O_X)/Γ_*(I_Z) ~
= S/I ~ où I est l'image réciproque par S->Γ_*(O_X).

De plus on a le théorème de Serre $15.3.7: si F est cohérent, F(n) est globalement généré (ie base point free) pour n assez grand, d'où un morphisme O^N ->> F(n) d'où O^N(-n)->>F]

* https://stacks.math.columbia.edu/tag/01ND
$ 27.13: Projective space

Lemma 27.13.1. Let S=Z[T0,…,Tn] with deg(Ti)=1. The scheme P^n_Z=Proj(S) represents the functor which associates to a scheme Y the pairs (L,(s0,…,sn)) where
  - L is an invertible OY-module, and
  - s0,…,sn are global sections of L which generate L
up to the following equivalence: (L,(s0,…,sn))∼(N,(t0,…,tn)) ⇔ there exists an isomorphism β:L→N with β(si)=ti for i=0,…,n.

Functoriality of Proj
---------------------

* https://stacks.math.columbia.edu/tag/01MX
$ 27.11 Functoriality of Proj

A graded ring map ψ:A→B does not always give rise to a morphism of associated projective homogeneous spectra. The reason is that the inverse image ψ−1(q) of a homogeneous prime q⊂B may contain the irrelevant prime A+ even if q does not contain B+. The correct result is stated as follows.

Lemma 27.11.1. Let A, B be two graded rings. Set X=Proj(A) and Y=Proj(B). Let ψ:A→B be a graded ring map. Set U(ψ)=⋃_{f∈A+ homogeneous} D+(ψ(f))⊂Y.
Then there is a canonical morphism of schemes rψ:U(ψ)⟶X and a map of Z-graded O_U(ψ)-algebras θ:r^∗_ψ(⨁_{d∈Z} O_X(d))⟶⨁_{d∈Z} O_U(ψ)(d).
- For every d≥0 the diagram      A_d           -ψ->         B_d is commutative.
                            Γ(X,OX(d)) -θ-> Γ(U(ψ),OY(d)) <- Γ(Y,OY(d)) 
- For any f∈A+ homogeneous we have r^−1_ψ(D+(f))=D+(ψ(f)) and the restriction of r_ψ to D+(ψ(f)) corresponds to the ring map A_(f)→B_(ψ(f)) induced by ψ.

Lemma 27.11.3. With hypotheses and notation as in Lemma 27.11.1 above. Assume Ad→Bd is surjective for all d≫0 (resp. an iso). Then
  - U(ψ)=Y,
  - rψ:Y→X is a closed immersion (resp. an iso), and
  - the maps θ:r^∗_ψ OX(n)→OY(n) are surjective but not isomorphisms in general (even if A→B is surjective), but are isos if A is generated by A_1 over A_0 (resp. are iso)

Lemma 27.11.6. Proj commute aux pullbacks

Lemma 27.11.8. Let S be a graded ring. Let d≥1. Set S′=S(d) with notation as in Algebra, Section 10.55. Set X=Proj(S) and X′=Proj(S′). There is a canonical isomorphism i:X→X′ of schemes such that
  - for any graded S-module M setting M′=M(d), we have a canonical isomorphism M˜→i^∗M′˜,
  - we have canonical isomorphisms OX(nd)→i^∗OX′(n)
and these isomorphisms are compatible with the multiplication maps

* https://stacks.math.columbia.edu/tag/01N4
$ 27.12: Morphisms into Proj

Lemma 27.12.1. Let S be a graded ring, and X=Proj(S). Let d≥1 and U_d⊂X=⋃_{f∈Sd} D+(f). Let Y be a scheme. Let L be an invertible sheaf on Y. Let ψ:S(d)→Γ_∗(Y,L) be a graded ring homomorphism such that L is generated by the sections in the image of ψ|Sd:Sd→Γ(Y,L). Then there exists a morphism φ:Y→X such that φ(Y)⊂U_d and an isomorphism α:φ^∗O_Ud(d)→L such that ψ^d_φ agrees with ψ via α

Lemma 27.12.3. Let S be a graded ring generated as an S0-algebra by the elements of S1. In this case the scheme X=Proj(S) represents the functor which associates to a scheme Y the set of pairs (L,ψ), where
  - L is an invertible OY-module, and
  - ψ:S→Γ_∗(Y,L) is a graded ring homomorphism such that L is generated by the global sections ψ(f), with f∈S1
up to strict equivalence as above.
Cf Lemma 27.12.4 pour le cas général.

* https://stacks.math.columbia.edu/tag/01NJ
$ 27.14: Invertible sheaves and morphisms into Proj

Lemma 27.14.1. Let A be a graded ring. Set X=Proj(A). Let T be a scheme. Let L be an invertible O_T-module. Let ψ:A→Γ_∗(T,L) be a homomorphism of graded rings. Set U(ψ)=⋃_{f∈A+ homogeneous} T_ψ(f)
The morphism ψ induces a canonical morphism of schemes r_L,ψ:U(ψ)⟶X together with a map of Z-graded O_T-algebras θ:r^∗L,ψ(⨁_{d∈Z} OX(d))⟶⨁_{d∈Z} L^⊗d|U(ψ).
The triple (U(ψ),r_L,ψ, θ) is characterized by the following properties:
  - For f∈A+ homogeneous we have r^−1_L,ψ(D+(f))=T_ψ(f).
  - For every d≥0 the diagram is commutative.
       A_d     -ψ-> Γ(T,L^⊗d)
    Γ(X,OX(d)) -θ-> Γ(U(ψ),L^⊗d)
Moreover, for any d≥1 and any open subscheme V⊂T such that the sections in ψ(A_d) generate L^⊗d|V the morphism r_L,ψ|V agrees with the morphism φ:V→Proj(A) and the map θ|V agrees with the map α:φ^∗OX(d)→L^⊗d|V where (φ,α) is the pair of Lemma 27.12.1 associated to ψ|A(d):A(d)→Γ_∗(V,L^⊗d).

Relative Proj
-------------

* https://stacks.math.columbia.edu/tag/01NM
$ 27.15: Relative Proj via glueing

Situation 27.15.1. Here S is a scheme, and A is a quasi-coherent graded OS-algebra. In this section we outline how to construct a morphism of schemes Proj_S(A)⟶S by glueing the homogeneous spectra Proj(Γ(U,A)) where U ranges over the affine opens of S.

* https://stacks.math.columbia.edu/tag/01NS
$ 27.16: Relative Proj as a functor

Lemma 27.16.11. Let S be a scheme. Let A be a quasi-coherent sheaf of graded OS-modules generated as an A0-algebra by A1. In this case the scheme X=Proj_S(A) represents the functor F_1 which associates to a scheme f:T→S over S the set of pairs (L,ψ), where
  - L is an invertible O_T-module, and
  - ψ:f^∗A→⨁_{n≥0} L^⊗n is a graded O_T-algebra homomorphism such that f^∗A1→L is surjective
up to strict equivalence as above. Moreover, in this case all the quasi-coherent sheaves O_Proj(A)(n) are invertible O_Proj(A)-modules and the multiplication maps induce isomorphisms O_Proj(A)(n)⊗OProj(A) OProj(A)(m)=OProj_(A)(n+m).

Cf 27.16.5 pour le cas général

Lemma 27.16.9. Let S be a scheme and A be a quasi-coherent sheaf of graded OS-algebras. The morphism π:Proj_S(A)→S is separated.
(et satisfait au critère valuatif, donc est propre si de type fini)
Lemma 27.16.10. Le proj relatif commute aux pullbacks

* https://stacks.math.columbia.edu/tag/01O5
$ 27.17 Quasi-coherent sheaves on relative Proj

Let M=⨁_{n∈Z} M_n be a graded A-module, quasi-coherent as an OS-module. We are going to describe the associated quasi-coherent sheaf of modules on Proj_S(A)

Lemma 27.17.1. For any quasi-coherent sheaf of graded A-modules M on S, there exists a canonical associated sheaf of O_Proj_S(A)-modules M˜ with the following properties:
  - Given a scheme T and a quadruple (T→S,d,L,ψ) over T corresponding to a morphism h:T→Proj_S(A) there is a canonical isomorphism M˜T=h∗M˜ where M˜T is defined by (27.17.0.1).
  - The isomorphisms of (1) are compatible with pullbacks.
  - There is a canonical map π^∗ M0⟶M˜.
  - The construction M↦M˜ is functorial in M and exact.
  - There are canonical maps M˜ ⊗_OProj_S(A) N˜⟶M ⊗_A N˜ as in Lemma 27.9.1.
  - There exist canonical maps π^∗ M⟶⨁_{n∈Z} M(n)˜ generalizing (27.10.1.6).
  - The formation of M˜ commutes with base change.

* https://stacks.math.columbia.edu/tag/07ZF
$ 27.18: Functoriality of relative Proj

This section is the analogue of Section 27.11 for the relative Proj. Let S be a scheme. A graded OS-algebra map ψ:A→B does not always give rise to a morphism of associated relative Proj. The correct result is stated as follows.

Let ψ:A→B be a homomorphism of graded OS-algebras, X=Proj_S(A), Y=Proj_S(B). There is a canonical open U(ψ)⊂Y and a canonical morphism of schemes rψ:U(ψ)⟶X et une application r∗ψ(⨁d∈Z O_X(d))⟶⨁d∈Z O_U(ψ)(d) qui sur un ouvert affine W de S correspond au global proj.

Lemma 27.18.3. With hypotheses and notation as in Lemma 27.18.1 above. Assume Ad→Bd is surjective for all d≫0 (resp. an iso). Then
  - U(ψ)=Y,
  - rψ:Y→X is a closed immersion (resp. an iso), and
  - the maps θ:r^∗_ψ OX(n)→OY(n) are surjective but not isomorphisms in general (even if A→B is surjective), but are isos if A is generated by A_1 over A_0 (resp. are iso)

* https://stacks.math.columbia.edu/tag/01O8
$ 27.19 Invertible sheaves and morphisms into relative Proj

Let ψ:f^∗A→⨁_{d≥0} L^⊗d be a homomorphism of graded OX-algebra
Induit r_{L,ψ}:U(ψ)⟶Proj_S(A) via la construction précédente

* https://stacks.math.columbia.edu/tag/02NB
$ 27.20 Twisting by invertible sheaves and relative Proj

Let S be a scheme. Let A=⨁d≥0Ad be a quasi-coherent graded OS-algebra. Let L be an invertible sheaf on S. In this situation we obtain another quasi-coherent graded OS-algebra, namely B=⨁_{d≥0} A_d ⊗_OS L^⊗d

It turns out that A and B have isomorphic relative homogeneous spectra. [27.20.1]
Et l'iso commute comme on pense, eg on a un iso gradué:
θ:g^∗(⨁_{n∈Z} O_P′(n))⟶⨁_{n∈Z} O_P(n)⊗π∗^L^⊗n

* https://stacks.math.columbia.edu/tag/01OA
$ 27.21 Projective bundles

Definition 27.21.1. Let S be a scheme. Let E be a quasi-coherent OS-module. We denote π:P(E)=Proj_S(Sym(E))⟶S

According to Lemma 27.15.5 there are canonical OS-module homomorphisms
Sym^n(E)⟶π_∗OP(E)(n) equivalently π^∗Sym^n(E)⟶OP(E)(n)
for all n≥0. [Note: this is an isomorphism if E is locally free, but in general need not be an isomorphism.]
In particular, for n=1 we have
E⟶π_∗OP(E)(1) equivalently π^∗E⟶OP(E)(1)
and the map π^∗E→OP(E)(1) is a surjection by Lemma 27.16.11.

Functoriality: P(E) represents the functor which associates to f:T→S the set of O_T-module quotients of f^∗E which are locally free of rank 1.
Indeed if ψ:f∗E→L is a surjection where L is an invertible OT-module. The induced graded OT-algebra map is f^∗Sym(E)=Sym(f^∗E)→Sym(L)=⨁_{n≥0} L^⊗n

Note: je pense que si L est invertible sur S, Sym(E⊗L) est le twist de
Sym(E) par L, et donc OP(E⊗L)(1)=OP(E)⊗L

Properties of relative proj
---------------------------

! Propriétés pour A => prop pour Proj_S(A)
$ https://stacks.math.columbia.edu/tag/07ZW
* 30.30 Relative Proj

Lemma 31.30.1. Let S be a scheme. Let A be a quasi-coherent graded OS-algebra. Let p:X=Proj_S(A)→S be the relative Proj of A. If one of the following holds
  - A is of finite type as a sheaf of A0-algebras,
  - A is generated by A1 as an A0-algebra and A1 is a finite type A0-module,
  - there exists a finite type quasi-coherent A0-submodule F⊂A+ such that A+/FA is a locally nilpotent sheaf of ideals of A/FA,
then p is quasi-compact.

Lemma 31.30.2 à 5. Let S be a scheme. Let A be a quasi-coherent graded OS-algebra. Let p:X=Proj_S(A)→S be the relative Proj of A. 
- If A is of finite type as a sheaf of OS-algebras, then p is of finite type and OX(d) is a finite type OX-module.
- If OS→A0 is an integral algebra map1 and A is of finite type as an A0-algebra, then p is universally closed.
- If A0 is a finite type OS-module and A is of finite type as an A0-algebra (or equivalently as an OS-algebra), then p is locally projective and in particular proper.
- If A is generated by A1 over A0 and A1 is a finite type OS-module, then p is projective.
- If Ad is a flat OS-module for d≫0, then p is flat and OX(d) is flat over S. 
- If A is a finitely presented OS-algebra, then p is of finite presentation and OX(d) is an OX-module of finite presentation.

* https://stacks.math.columbia.edu/tag/084M
$ 31.31 Closed subschemes of relative proj

Lemma 31.31.1. Let i:Z→X be a closed subscheme. Denote I⊂A the kernel of the canonical map A⟶⨁_{d≥0} p_∗((i_∗OZ)(d))
If p is quasi-compact, then there is an isomorphism Z=Proj_S(A/I).

Example 31.31.2
  - Which ideals I are of the form I(Z)?
  - Can we describe the operation I↦I(V+(I))?
We will answer this when A is Noetherian.
First, assume that A is generated by A1 over A0. In this case, for any ideal I⊂A the kernel of the map A/I→⨁Γ(Proj(A/I),O) is the set of torsion elements of A/I, see Cohomology of Schemes, Proposition 30.14.4. Hence we conclude that
I(V+(I))={x∈A∣A_n x⊂I for some n≥0}
The ideal on the right is sometimes called the saturation of I. This answers (2) and the answer to (1) is that an ideal is of the form I(Z) if and only if it is saturated, i.e., equal to its own saturation.

Lemma 31.31.3. Let R be a UFD. Let Z⊂P^nR be a closed subscheme which has no embedded points such that every irreducible component of Z has codimension 1 in P^nR. Then the ideal I(Z)⊂R[T0,…,Tn] corresponding to Z is principal.

In case the closed subscheme is locally cut out by finitely many equations
we can define it by a finite type ideal sheaf of A; cf 31.3.4 et 31.3.5

Lemma 31.31.6. Let X be a scheme. Let E be a quasi-coherent OX-module. There is a bijection {sections σ of the morphism P(E)→X}↔{surjections E→L where L is an invertible OX-module}
In this case σ is a closed immersion and there is a canonical isomorphism
Ker(E→L)⊗_OX L^{⊗−1}⟶C_{σ(X)/P(E)}
Both the bijection and isomorphism are compatible with base change.

* https://stacks.math.columbia.edu/tag/0EKF
$ 36.46 Proj and Spec

Si A graded, B=⨁_{d≥0} A≥d, X=Spec A, Z=V(A+)=Spec(A/A+)=Spec(A0), U=X\Z
P=Proj(A), L=Proj(B), on a le diagramme commutatif
P->L et Spec_P(⨁_{m∈Z} OP(m)) -> L=Spec_P(⨁_{m≥0} OP(m)) -π-> P
Z->X             =U           ->          X               ->  Z

Quasi-projectif
---------------

* https://stacks.math.columbia.edu/tag/01VV
$ 28.38 Quasi-projective morphisms

Definition 28.38.1. Let f:X→S be a morphism of schemes.
 - We say f is quasi-projective if f is of finite type and there exists an f-relatively ample invertible OX-module (par déf ça implique f qc)
 - We say f is H-quasi-projective if there exists a quasi-compact immersion X→P^nS over S for some n
 - We say f is locally quasi-projective if there exists an open covering S=⋃Vj such that each f−1(Vj)→Vj is quasi-projective.
=> f séparée de type fini

Note: H-quasi-projectif => quasi-projectif (Lemma 28.38.5)
      loc quasi-proj <=> loc H-quasi-proj (Lemma 28.38.6)

Rappel sur les fibrés amples et très amples (cas f de type fini):
- Si la base est affine, L très ample <=> immersion i:X→P^n_S over S such that L≅i ∗O_P^n_S(1). [29.37.1]
- L f-ample <=> there exist an open covering S=⋃Vj, for each j an integers dj≥1, nj≥0, and immersions i_j:Xj=f^−1(Vj)=Vj ×_S X ⟶ P^nj_Vj over Vj such that L^{⊗d_j}|Xj ≅i∗_j O_P^nj_Vj(1) (et L très ample <=> les d_j=1)
- Si L f-ample et S qc, alors L^n est très ample pour n>>0, ie par définition on a une immersion i:X→P(E) over S such that L^n≅i^∗OP(E)(1) pour un quasi-coherent OS-module E 

* https://stacks.math.columbia.edu/tag/0B41
$ 36.44 Quasi-projective schemes

Lemma 36.44.1. Let S be a scheme which has an ample invertible sheaf. Let f:X→S be a morphism of schemes. (<=>)
  - X→S is quasi-projective,
  - X→S is H-quasi-projective,
  - there exists a quasi-compact open immersion X→X′ of schemes over S with X′→S projective,
  - X→S is of finite type and X has an ample invertible sheaf, and
  - X→S is of finite type and there exists an f-very ample invertible sheaf.
    (or a f-ample invertible sheaf)

Projectif
---------

* https://stacks.math.columbia.edu/tag/01W7
$ 28.41 Projective morphisms

Definition 28.41.1. Let f:X→S be a morphism of schemes.
  - We say f is projective if X is isomorphic as an S-scheme to a closed subscheme of a projective bundle P(E) for some quasi-coherent, finite type OS-module E.
  - We say f is H-projective if there exists an integer n and a closed immersion X→P^n_S over S.
  - We say f is locally projective if there exists an open covering S=⋃Ui such that each f^−1(Ui)→Ui is projective. [= loc. H-projective (29.41.4)]

- (H)-Projective => quasi (H)-projective (29.41.3, 29.41.10)
- stable par base change et composition [pour projectif stable par composition si S qcqs]
- Locally projective => proper (Lemma 28.41.5)
                     <= if there is an f-ample invertible sheaf (Lemma 28.41.6)

Lemma 28.41.12. Let f:X→S be a quasi-projective morphism with S quasi-compact and quasi-separated. Then f factors as X→X′→S where X→X′ is an open immersion and X′→S is projective. (Lemma 28.41.11: same for H-quasi-projective, sans conditions sur S)

Lemma 28.41.13. Let S be a quasi-compact and quasi-separated scheme. Let f:X→S be a morphism of schemes. Then
  - f is projective if and only if f is quasi-projective and proper
  - f is H-projective if and only if f is H-quasi-projective and proper.

Si on a juste un ample line bundle et qu'on est univ fermé (sans conditions
de finitude ou de qcqs sur S), on est quand même un Proj:
Lemma 29.41.17. Let f:X→S be a universally closed morphism. Let L be an f-ample invertible OX-module. Then the canonical morphism 
r:X⟶Proj_S(⨁_{d≥0} f_∗L^⊗d) of Lemma 29.35.4 is an isomorphism.

Si S a un ample line bundle, (quasi)-proj=H-(quasi)-proj
Lemma 28.41.16. Let S be a scheme which admits an ample invertible sheaf. Then
  - any projective morphism X→S is H-projective, and
  - any quasi-projective morphism X→S is H-quasi-projective.

* Résumé (f: X->S de type fini, S qcqs)
- quasi-projectif = il y a un fibré f-ample = il y a un fibré f-very-ample
- H-(quasi)-projectif => (quasi)-projectif
- (H)-quasi-projectif <=> f factors as X→X′→S where X→X′ is an open immersion and X′→S is (H)-projective
- (H)-projectif <=> (H)-quasi-projectif + proper. 
- Si S a un ample line bundle (=> S qc séparée), alors
  proj=H-proj, quasi-proj=H-quasi-proj=il y a un fibré ample

Fibrés amples
=============

* Résumé:
- L est ample sur X si X qc et les X_s (s section de L^n) forment une base de
  la topologie de X (dans ce cas les X_s affines suffisent à former une base)
  <=> L^n ample
  <=> X->Proj(S) est une immersion ouverte où S=Γ_*(L)
      (et dans ce cas le morphisme est qc d'image dense), donc X séparé
- L f-ample si f:X->S qc et L|f^-1(V) est ample pour tout V affine. C'est une
  notion locale en la base <=> L^n f-ample
  <=> Il existe ψ:f^∗A → ⨁_{d≥0} L^⊗d qui induit une immersion X->Proj_S A.
  Dans ce cas f est séparé, on peut prendre A=f_∗(⨁_{d≥0} L^⊗d) et X->Proj_S A est une immersion ouverte.
  Exemple: f est quasi-affine <=> O_X est f-ample.
- L f-very ample si il existe une immersion i:X→P(E) sur S / L≅i∗OP(E)(1).
  <=> il existe ψ:f^∗A→⨁_{n≥0} L^⊗n où A engendré en degré 1 et f^∗A_1→L est
  surjective et induit une immersion X→Proj_S(A) (E est alors A_1).
  Dans ce cas, f est séparé, ψ:f^∗f_∗L→L est surjective, on peut prendre E=f_∗L.
  [Et on peut prendre A=f_∗(⨁_{d≥0} L^⊗d) mais attention qu'il n'est pas forcément engendré en degré 1, on n'est pas forcément projectivement normal]
  => L est f-ample si f qc. Réciproquement, si S qc et f de type fini, L f-ample <=> L^d f-very ample pour d>>0.

* Plongement dans l'espace projectif, si f:X->S de type fini
- L is f-relatively ample, <=> there exist an open covering S=⋃Vj, for each j an integers dj≥1, nj≥0, and immersions i_j:Xj=f^−1(Vj)=Vj ×_S X ⟶ P^nj_Vj over Vj such that L^{⊗d_j}|Xj ≅i∗_j O_P^nj_Vj(1)
  Et L f-relatively very ample <=> d_j=1
- si S affine, L très ample <=> on peut prendre E=S^n, ie on a une immersion i:X→P^n_S tel que L =~ i^∗ OP^n_S(1)
- si L ample sur X [ici il suffit f:X->S loc de type fini], alors on a une immersion i:X→P^n_S tel que L^⊗d≅i^∗O_P^n_S(1)
Note: si S a un fibré ample, alors si L f-ample il existe M ample sur X
[Attention, même si L≅i∗OP(E)(1), ie L très ample, si E n'est pas généré par un nombre fini de sections globales, L n'est pas de la forme i^∗ OP^n_S(1). Mais si M est ample sur S, alors E⊗_OS M^m est généré par un nombre fini de sections globales pour m>>0 (et ils sont le même proj), donc on peut prendre L'=i∗OP(E':=E⊗_OS M^m)(1) très ample. Et O^⊕nS→E' induces a closed immersion P(E')⟶P(O^⊕nS)=P^n_S et L'⊗f^*M est ample]

* Stabilité:
- si L est f-ample et M g-ample (et S qc) alors L⊗ f^∗M^⊗a est g∘f-ample for a≫0. 
  si L est f-ample et M ample alors L⊗ f^∗M^⊗a est f-ample for a≫0. 
- Or f quasi-affine <=> O_X est ample, on en déduit:
  If M is ample and f quasi-affine, then f^∗M is ample.
  If M is g-ample (et S qc) and f quasi-affine, then f^∗M is g∘f-ample.
- f: X->S, f type fini, S qc, L f-ample => N⊗_OX L^⊗d is f-very ample for all d≫1. [29.37.8]
- Si f:X->Y propre de prés. finie, le lieu E où L|y est f_y-ample est ouvert, 
  et L|f^{-1}E est ample (EGA IV3, 9.6.4 et 9.6.5)

* Cas f:X->Y=Spec A proper
L ample (<=>) [caractérisation cohomologique]
- for every coherent OX-module F there exists an n0≥0 such that H^p(X,F⊗L^⊗n)=0 for all n≥n0 and p>0, and
- for every quasi-coherent sheaf of ideals I⊂OX, there exists an n≥1 such that H^1(X,I⊗L^⊗n)=0.

FOAG:
- L very ample => L base point free
- Si L très ample et M base point free => L⊗M très ample
- Si L ample et (M ample ou base point free) => L⊗M ample

Fibré ample
-----------

* https://stacks.math.columbia.edu/tag/01CR
$ 17.23 Invertible modules
Definition 17.23.1. Let (X,OX) be a ringed space. An invertible OX-module is a sheaf of OX-modules L such that the functor Mod(OX)⟶Mod(OX),F⟼L⊗OXF

Lemma 17.23.2. Let (X,OX) be a ringed space. Let L be an OX-module. Equivalent are
  - L is invertible, and
  - there exists an OX-module N such that L⊗_OX N≅OX.
In this case L is locally a direct summand of a finite free OX-module and the module N in (2) is isomorphic to Hom_OX(L,OX).

Lemma 17.23.4. Let (X,OX) be a ringed space. Any locally free OX-module of rank 1 is invertible. If all stalks OX,x are local rings, then the converse holds as well (but in general this is not the case).

* https://stacks.math.columbia.edu/tag/01PR
$ 27.26 Ample invertible sheaves

Recall from Modules, Lemma 17.22.10 that given an invertible sheaf L on a locally ringed space X, and given a global section s of L the set Xs={x∈X∣s∉mxLx} is open. A general remark is that Xs∩Xs′=Xss′, where ss′ denote the section s⊗s′∈Γ(X,L⊗L′).
Note: si U affine dans X, U∩Xs est un ouvert affine de U (Lemma 27.26.4)

Definition 27.26.1. Let X be a scheme. Let L be an invertible OX-module. We say L is ample if
  - X is quasi-compact, and
  - for every x∈X there exists an n≥1 and s∈Γ(X,L^⊗n) such that x∈Xs and Xs is affine.

Proposition 27.26.13. Let X be a quasi-compact scheme. Let L be an invertible sheaf on X. Set S=Γ∗(X,L). The following are equivalent:
 1) L is ample,
 2) the open sets Xs, with s∈S+ homogeneous, cover X and the associated morphism X→Proj(S) is an open immersion, [=> de plus le morphisme est qc et d'image dense. En particulier, si X->S est univ fermé, X =~ Proj(S), et X_s->S est affine, cf https://stacks.math.columbia.edu/tag/01W7]
 3) the open sets Xs, with s∈S+ homogeneous, form a basis for the topology of X,
 4) the open sets Xs, with s∈S+ homogeneous, which are affine form a basis for the topology of X,
 5) for every quasi-coherent sheaf F on X the sum of the images of the canonical maps Γ(X,F ⊗_OX L^⊗n)⊗_Z L^⊗−n ⟶ F with n≥1 equals F,
 6) same property as (5) with F ranging over all quasi-coherent sheaves of ideals,
 7) X is quasi-separated and for every quasi-coherent sheaf F of finite type on X there exists an integer n0 such that F ⊗_OX L^⊗n is globally generated for all n≥n0,
 8) X is quasi-separated and for every quasi-coherent sheaf F of finite type on X there exist integers n>0, k≥0 such that F is a quotient of a direct sum of k copies of L⊗−n, and
 9) same as in (8) with F ranging over all sheaves of ideals of finite type on X.

Note (cf Lemma 27.26.9). Si L est ample, soit f:X->Y:=Proj(S) où S=Γ∗(X,L)
associé par le lemme plus haut.
- f^{-1}(D_+(s))=X_s pour s  \in S_+ homogène
- on a une application compatible avec la multiplication: f^* O_Y(n) -> L^n
  et S_n→Γ(Y,OY(n))→Γ(X,L^⊗n) est l'identité.
- for every x∈X there is an integer d≥1 and an open neighbourhood U⊂X of x such that f^∗ OY(dn)|U → L^⊗dn|U is an isomorphism for all n∈Z. 

=> - Si L ample sur X, X est séparée
   - L ample <=> L^⊗n est ample
   - Si i:X->Y est une immersion qc et L ample sur Y, i*L ample sur X.
   - Si L est ample sur X, M ample sur Y, X,Y S-schémas avec S qs, alors
   p1* L \tens p2* M est ample sur X x_S Y. En particulier si X=Y=S, L \tens M est ample sur X.

* https://stacks.math.columbia.edu/tag/01XO
$ 30.17 Ample invertible sheaves and cohomology

Lemma 30.17.1. Let R be a Noetherian ring. Let f:X→Spec(R) be a proper morphism. Let L be an invertible OX-module. The following are equivalent
  - L is ample on X (this is equivalent to many other things, see Properties, Proposition 28.26.13 and Morphisms, Lemma 29.37.4),
  - for every coherent OX-module F there exists an n0≥0 such that H^p(X,F⊗L^⊗n)=0 for all n≥n0 and p>0, and
  - for every quasi-coherent sheaf of ideals I⊂OX, there exists an n≥1 such that H1(X,I⊗L^⊗n)=0.

Lemma 30.17.2. Let R be a Noetherian ring. Let f:Y→X be a morphism of schemes proper over R. Let L be an invertible OX-module. Assume f is finite and surjective. Then L is ample if and only if f^∗L is ample.

H^p_∗(X,L,F):=⨁_{n∈Z} H^p(X,F ⊗_OX L^⊗n)
Lemma 30.17.3. Let X be a scheme. Let L be an invertible sheaf on X. Let s∈Γ(X,L). Let F be a quasi-coherent OX-module. If X is quasi-compact and quasi-separated, the canonical map H^p_∗(X,L,F)(s)⟶H^p(Xs,F) which maps ξ/s^n to s^−nξ is an isomorphism.

* https://stacks.math.columbia.edu/tag/09MW
Lemma 32.11.4. Let i:Z→X be a closed immersion of schemes inducing a homeomorphism of underlying topological spaces. Let L be an invertible sheaf on X. Then i^∗L is ample on Z, if and only if L is ample on X. 

Fibrés amples relatifs
----------------------

* https://stacks.math.columbia.edu/tag/01VG
$ 28.35 Relatively ample sheaves
Déf: f-ample = f:X→S is quasi-compact, and if for every affine open V⊂S the restriction of L to the open subscheme f−1(V) of X is ample.
=> f séparé
Notion stable par pullback (Lemma 28.35.9.)

Th (Lemma 28.35.4). Let f:X→S be a quasi-compact morphism of schemes. Let L be an invertible sheaf on X. The following are equivalent:
  - The invertible sheaf L is f-ample. [ie f est qc et localement sur S L|f−1(V) est ample]
  - There exists an open covering S=⋃Vi such that each L|f−1(Vi) is ample relative to f−1(Vi)→Vi.
  - There exists an affine open covering S=⋃Vi such that each L|f−1(Vi) is ample.
  - There exists a quasi-coherent graded O_S-algebra A and a map of graded OX-algebras ψ:f^∗A → ⨁_{d≥0} L^⊗d such that U(ψ)=X and
      r_L,ψ:X ⟶ Proj_S(A)
    is an open immersion (see Constructions, Lemma 26.19.1 for notation).
  - The morphism f is quasi-separated and part (4) above holds with A=f_∗(⨁_{d≥0} L^⊗d) and ψ the adjunction mapping. [f qs c'est pour que A soit quasi-cohérent]
  - Same as (4) but just requiring rL,ψ to be an immersion.

Stabilité:
Lemma 28.35.5. Si S affine, L f-relatively ample <=> L ample.
Lemma 28.35.7. Let f:X→Y be a morphism of schemes, M an invertible OY-module, and L an invertible OX-module.
  - If L is f-ample and M is ample, then L⊗f^∗M^⊗a is ample for a≫0.
  - If M is ample and f quasi-affine, then f^∗M is ample.
Lemma 28.35.8. Let g:Y→S and f:X→Y be morphisms of schemes. Let M be an invertible OY-module. Let L be an invertible OX-module. If S is quasi-compact, M is g-ample, and L is f-ample, then L⊗ f^∗M^⊗a is g∘f-ample for a≫0. 
Lemma 28.35.10. Let g:Y→S and f:X→Y be morphisms of schemes. Let L be an invertible OX-module. If L is g∘f-ample and f is quasi-compact then L is f-ample.

Fibré très ample
----------------

* https://stacks.math.columbia.edu/tag/01VL
$ 28.36 Very ample sheaves

Definition 28.36.1. Let f:X→S be a morphism of schemes. Let L be an invertible OX-module. We say L is relatively very ample or more precisely f-relatively very ample, or very ample on X/S, or f-very ample if there exist a quasi-coherent OS-module E and an immersion i:X→P(E) over S such that L≅i^∗OP(E)(1).
=> f séparé [29.36.6], L très ample stable par pullback [29.36.8]

f qc + L relatively very ample => relatively ample [29.36.2]

To arrive at the correct converse of this lemma we ask whether given a relatively ample invertible sheaf L there exists an integer n≥1 such that L^⊗n is relatively very ample? In general this is false. There are several things that prevent this from being true:
- Even if S is affine, it can happen that no finite integer n works because X→S is not of finite type, see Example 28.36.4.
- The base not being quasi-compact means the result can be prevented from being true even with f finite type. Namely, given a field k there exists a scheme Xd of finite type over k with an ample invertible sheaf OXd(1) so that the smallest tensor power of OXd(1) which is very ample is the dth power. See Example 28.36.5. Taking f to be the disjoint union of the schemes Xd mapping to the disjoint union of copies of Spec(k) gives an example.

Lemma 29.36.7. Let f:X→S be a morphism of schemes. Let L be an invertible sheaf on X. Assume f is quasi-compact. The following are equivalent
  - L is relatively very ample on X/S,
  - there exists an open covering S=⋃Vj such that L|f−1(Vj) is relatively very ample on f−1(Vj)/Vj for all j,
  - there exists a quasi-coherent sheaf of graded OS-algebras A generated in degree 1 over OS and a map of graded OX-algebras ψ:f^∗A→⨁_{n≥0} L^⊗n such that f^∗A1→L is surjective and the associated morphism r_{L,ψ}:X→Proj_S(A) is an immersion, and
  - f is quasi-separated, the canonical map ψ:f^∗f_∗L→L is surjective, and the associated map r_{L,ψ}:X→P(f_∗L) is an immersion.

* https://stacks.math.columbia.edu/tag/02NO
$ 28.37 Ample and very ample sheaves relative to finite type morphisms

Si on est absolument ample, alors on a une immersion dans P^n_S:
Lemma 29.37.3. Let f:X→S be a morphism of schemes. Let L be an invertible sheaf on X. Assume that
  - the invertible sheaf L is ample on X, and
  - the morphism X→S is locally of finite type.
Then there exists a d0≥1 such that for every d≥d0 there exists an n≥0 and an immersion i:X→P^n_S over S such that L^⊗d≅i^∗O_P^n_S(1). [Et réciproquement, L^⊗d est très ample, donc L ample.]

Lemma 28.37.5. Let f:X→S be a morphism of schemes. Let L be an invertible OX-module. Assume S quasi-compact and f of finite type. (<=>)
  - L is f-ample,
  - L^⊗d is f-very ample for some d≥1,
  - L^⊗d is f-very ample for all d≫1.
Si de plus S affine, alors on a en plus (<=>) (cf Lemma 28.37.4.):
  - L is ample (ie f-ample <=> ample)
  - for some d≥1 (resp. for all d>>0), there exist n≥1 and an immersion i:X→P^n_S such that L^⊗d =~ i^∗ OP^n_S(1)
  Et L est f-very ample <=> there exists an n≥0 and an immersion i:X→P^n_S over S such that L≅i^∗OP^n_S(1) (28.37.1) [ie on peut prendre E libre. Du coup dans le cas général je pense qu'on pend prendre E loc. libre]

Lemma 28.37.7. Let f:X→S be a morphism of schemes. Let L be an invertible sheaf on X. Assume f is of finite type. (<=>)
  - L is f-relatively ample, and
  - there exist an open covering S=⋃Vj, for each j an integers dj≥1, nj≥0, and immersions i_j:Xj=f^−1(Vj)=Vj ×_S X ⟶ P^nj_Vj
    over Vj such that L^{⊗d_j}|Xj ≅i∗_j O_P^nj_Vj(1)
(et L relativement très ample <=> on peut prendre les d_j=1, cf 28.37.6)

Morphismes Propres
==================

* https://stacks.math.columbia.edu/tag/01W0
$ 28.39 Proper morphisms

Definition 28.39.1. Let f:X→S be a morphism of schemes. We say f is proper if f is separated, finite type, and universally closed.

Lemma 29.39.10. Assume
  - X→S is a universally closed (for example proper) morphism, and
  - Y→S is separated and locally of finite type.
Then the scheme theoretic image Z⊂Y of h is proper over S and X→Z is surjective.

* https://mathoverflow.net/questions/193/when-is-fiber-dimension-upper-semi-continuous

Theorem. Let f:X→Y be a separated morphism of finite type between noetherian schemes such that (1) X is irreducible, (2) Y is irreducible and normal, (3) f has proper non-empty fibers, and (4) the generic fiber of f is geometrically connected. Then f is proper (and so satisfies upper-semicontinuity of fiber dimension). – David Rydh Sep 28 '15 at 17:42

Proof. There exists a generalized Stein factorization X→X′→Y
(Thm 2.1, Hall-Rydh, The Hilbert stack, Adv. Math. 253, 2014) where X→X′ is proper, surjective, with geom. connected fibers and X′→Y is quasi-finite, separated and birational (or K(X')/K(Y) purely inseparable in positive characteristic). The latter is thus an open immersion by ZMT, hence an isomorphism (or finite purely inseparable in pos. char.).

Universellement fermé
---------------------

* https://stacks.math.columbia.edu/tag/05JW
$ 32.14 Universally closed morphisms

Lemma 32.14.2. Let f:X→S be a quasi-compact morphism of schemes. The following are equivalent
  - f is universally closed,
  - for every morphism S′→S which is locally of finite presentation the base change XS′→S′ is closed, and
  - for every n the morphism An×X→An×S is closed.

Chow
----

Chow's lemma: Let S be qcqs and f:X→S separated finite type. Then there exists a projective, surjective S-morphism X¯→X which is an isomorphism on a dense subset and where X¯→S is quasi-projective. Moreover X is proper iff X¯ is projective, and if X is reduced X¯ can be chosen to be so as well.
=> Mnemonic: reasonable schemes have quasi-projective "replacements" and proper schemes have projective "replacements".

Cf http://math.stanford.edu/~conrad/papers/nagatafinal.pdf Cor 2.6
où Conrad montre qu'on peut prendre U n'importe quel ouvert qc dense de X
quasi-projectif sur S: q: X¯->X est construit comme étant un U-blowup, ie q
est projectif, surjectif, q^{-1}(U) \iso U et U-> X¯ est quasi-compact; et
X¯ est quasi-projectif, ie on a X¯->Xbar une immersion ouverte dense avec
Xbar->S projectif.

* https://stacks.math.columbia.edu/tag/0200
$ 30.18: Chow's Lemma
Lemma 30.18.1. Let S be a Noetherian scheme. Let f:X→S be a separated morphism of finite type. Then there exists an n≥0 and a diagram 
X <π- X′ -> P_S^n au dessus de S
where X′→PnS is an immersion, and π:X′→X is proper and surjective. Moreover, we may arrange it such that there exists a dense open subscheme U⊂X such that π−1(U)→U is an isomorphism.

Compatification de Nagata
-------------------------
Voir aussi [#Absolute Approximation]

* http://math.stanford.edu/~conrad/papers/nagatafinal.pdf

Th 4.1: f:X->S séparé de type fini, S qcqs, se factorise en une immersion
ouverte X->Xbar où Xbar->S est propre.

Remarque: s'étend aux espaces algébriques, cf l'intro de Temkin.

Note: si on pose S'=S \ f(Xbar \ X), S' est ouvert dans S, et on a
X|S'=Xbar|S'. Donc on peut ainsi étendre des résultats sur les morphismes
propres à des morphismes séparé de type fini (quitte à se restreindre à un
ouvert de la base).

Morphismes Plats
================
Réf: Matsumura et Eisenbud

* Geometric intuition for flatness
http://mathoverflow.net/questions/75317/flatness-in-complex-analytic-geometry
http://mathoverflow.net/questions/6789/why-are-flat-morphisms-flat

Propriétés
----------

* https://stacks.math.columbia.edu/tag/0250
$ 40.9 Flat morphisms

Definition 40.9.1. Flatness of modules and rings.
  - A module N over a ring A is said to be flat if the functor M↦M⊗AN is exact.
  - If this functor is also faithful, we say that N is faithfully flat over A.
  - A morphism of rings f:A→B is said to be flat (resp. faithfully flat) if the functor M↦M⊗AB is exact (resp. faithful and exact).

Here is a list of facts with references to the algebra chapter.
  - Free and projective modules are flat. This is clear for free modules and follows for projective modules as they are direct summands of free modules and ⊗ commutes with direct sums.
  - Flatness is a local property, that is, M is flat over A if and only if Mp is flat over Ap for all p∈Spec(A). See Algebra, Lemma 10.38.18.
  - If M is a flat A-module and A→B is a ring map, then M⊗AB is a flat B-module. See Algebra, Lemma 10.38.7.
  - Finite flat modules over local rings are free. See Algebra, Lemma 10.77.4.
  - If f:A→B is a morphism of arbitrary rings, f is flat if and only if the induced maps Af−1(q)→Bq are flat for all q∈Spec(B). See Algebra, Lemma 10.38.18
  - If f:A→B is a local homomorphism of local rings, f is flat if and only if it is faithfully flat. See Algebra, Lemma 10.38.17.
  - A map A→B of rings is faithfully flat if and only if it is flat and the induced map on spectra is surjective. See Algebra, Lemma 10.38.16.
  - If A is a noetherian local ring, the completion A∧ is faithfully flat over A. See Algebra, Lemma 10.96.3.
  - Let A be a Noetherian local ring and M an A-module. Then M is flat over A if and only if M⊗AA∧ is flat over A∧. (Combine the previous statement with Algebra, Lemma 10.38.8.)

Before we move on to the geometric category, we present Grothendieck's theorem, which provides a convenient recipe for producing flat modules.

Theorem 40.9.2. Let A, B be Noetherian local rings. Let f:A→B be a local homomorphism. If M is a finite B-module that is flat as an A-module, and t∈m_B is an element such that multiplication by t is injective on M/m_AM, then M/tM is also A-flat.

Definition 40.9.3. (See Morphisms, Definition 28.24.1). Let f:X→Y be a morphism of schemes. Let F be a quasi-coherent OX-module.
  - Let x∈X. We say F is flat over Y at x∈X if Fx is a flat OY,f(x)-module. This uses the map OY,f(x)→OX,x to think of Fx as a OY,f(x)-module.
  - Let x∈X. We say f is flat at x∈X if OY,f(x)→OX,x is flat.
  - We say f is flat if it is flat at all points of X.
  - A morphism f:X→Y that is flat and surjective is sometimes said to be faithfully flat.

Once again, here is a list of results:
  - The property (of a morphism) of being flat is, by fiat, local in the Zariski topology on the source and the target.
  - Open immersions are flat. (This is clear because it induces isomorphisms on local rings.)
  - Flat morphisms are stable under base change and composition. Morphisms, Lemmas 28.24.8 and 28.24.6.
  - If f:X→Y is flat, then the pullback functor QCoh(OY)→QCoh(OX) is exact. This is immediate by looking at stalks.
  - Let f:X→Y be a morphism of schemes, and assume Y is quasi-compact and quasi-separated. In this case if the functor f^∗ is exact then f is flat. (Proof omitted. Hint: Use Properties, Lemma 27.22.1 to see that Y has “enough” ideal sheaves and use the characterization of flatness in Algebra, Lemma 10.38.5.)

* https://stacks.math.columbia.edu/tag/0254
$ 40.10 Topological properties of flat morphisms

Theorem 40.10.1. Let Y be a locally Noetherian scheme. Let f:X→Y be a morphism which is locally of finite type. Let F be a coherent OX-module. The set of points in X where F is flat over Y is an open set. In particular the set of points where f is flat is open in X.

Theorem 40.10.2. Let Y be a locally Noetherian scheme. Let f:X→Y be a morphism which is flat and locally of finite type. Then f is (universally) open.

Theorem 40.10.3. A faithfully flat quasi-compact morphism is a quotient map for the Zariski topology.

Local criteria for flatness
---------------------------
[Rappel: le lieu de flatness est ouvert]

* http://mathoverflow.net/questions/99266/on-the-geometric-interpretation-of-the-local-criterion-for-flatness

- Version usuelle: Let ϕ:(A,m)→(B,m′) be a local morphism of local Noetherian rings, and M a finitely generated B-module. If x∈m is a non zero-divisor on M then M is flat over A iff M/xM is flat over A/xA.

- If f:X→Y is a morphism of finite type S-schemes (S being noetherian), and if X,Y are flat, then f is flat if and only if each of the maps fs:Xs→Ys are flat.
  Vient de la version locale suivante: If B→C is a morphism of local noetherian rings both local and flat over the local noetherian ring (A,𝔪), then B→C is flat if and only if the fiber B/𝔪B→C/𝔪C is flat. 

- Version Tor^1: https://en.wikipedia.org/wiki/Flat_module
    Let R be a local noetherian ring, S a local noetherian R-algebra with m_R S \subset m_S, and M a finitely generated S-module. Then M is flat over R if and only if Tor_1^R(M, R/m_R) = 0. 

- Corollaire (cf Matsumura):
Si (B,n) est local et contient un corps k, soit x_1,...,x_n une suite
B-régulière de n. Alors A=k[x_1,...x_n] \subset B est isomorphe à une algèbre
de polynômes et B/A plat.

* https://stacks.math.columbia.edu/tag/039A
$ 36.16 Critère de platitude par fibres

Theorem 36.16.2. Let S be a scheme. Let f:X→Y be a morphism of schemes over S. Let F be a quasi-coherent OX-module. Assume
  - X is locally of finite presentation over S,
  - F an OX-module of finite presentation, and
  - Y is locally of finite type over S.
Let x∈X. Set y=f(x) and let s∈S be the image of x in S. If Fx≠0, then the following are equivalent:
  1. F is flat over S at x, and Fs is flat over Ys at x, and
  2. Y is flat over S at y and F is flat over Y at x.
Moreover, the set of points x where (1) and (2) hold is open in Supp(F).

Corollaire (Lemma 36.16.4). 
Let S be a scheme. Let f:X→Y be a morphism of schemes over S. Assume
  - X is locally of finite presentation over S,
  - X is flat over S,
  - for every s∈S the morphism fs:Xs→Ys is flat, and
  - Y is locally of finite type over S.
Then f is flat. If f is also surjective, then Y is flat over S.

Lemma 36.16.5. Let S be a scheme. Let f:X→Y be a morphism of schemes over S. Let F be a quasi-coherent OX-module. Assume
  - X is locally of finite presentation over S,
  - F an OX-module of finite presentation,
  - F is flat over S, and (cas particulier, F=OX, X plat sur S)
  - Y is locally of finite type over S.
Then the set U={x∈X∣F flat at x over Y}. is open in X and its formation commutes with arbitrary base change.

Fidèle platitude (Stack Project)
----------------

f: A->B, M B-module
- M fidèlement plat sur A => f^{-1}_* (Supp M)=Spec A
- Si M/B fini; M/A plat et f^{-1}_* (Supp M)=Spec A <=> M fidèlement plat sur A

Application:si phi: Y->X est plat, Y est fidèlement plat sur phi(Y).

ex: dans un morphisme local (=morphisme d'anneaux locaux, qui envoie
l'idéal max sur l'idéal max), plat <=> fidèlement plat

Flatness and Hilbert polynomial
-------------------------------

On rappelle que le polynôme de Hilbert de F (faisceau sur un espace
projectif) est donné en s par P_{F⊗k(s)}(m) = χ(F(m)⊗k(s))

* ~/Papiers/Maths/GeoAlg/MIT18_726s09_lec20_hilbpoly.pdf

Th: Soit T un schéma loc noéth, connexe et réduit; X un schéma projectif
sur T; F un faisceau cohérent sur X. Alors F est plat sur T ssi
t->HilberPoly(F|t) est constant. (En général F plat => HilbertPoly
constant, mais on n'a pas la réciproque si T non réduit par ex).

Cor: Si T intègre loc noeth, alors si X/T est plat les fibres sont
équidimensionelles de dim n, la dimension de la fibre générique. Si n=0,
alors le degré de chaque fibre est égal à d, le degré de la fibre
générique.

! Autre référence (avec un contreexemple pour the converse if S is not reduced):
http://math.stackexchange.com/questions/564680/flatness-hilbert-polynomial-and-reduced-schemes
Let f:X→S be a projective morphism of schemes and F a coherent OX-module. We have that if F is S-flat then the Hilbert polynomial P(Fs) is locally costant as a function of s∈S. (Huybrechts_D., Lehn_M., The_Geometry_of_Moduli_Spaces_of_Sheaves, Second_Edition, Cambridge_Mathematical_Library, 2010, proposition 2.1.2). The converse is true if S is reduced.

Voir aussi:
http://mathoverflow.net/questions/16465/flatness-over-non-reduced-schemes
http://math.uchicago.edu/~amathew/semicontinuity.pdf

* Cas d'un module de type fini.

forum.maths.avancees:1343:
> Soit M un module de type fini sur un anneau noéthérien. Je suppose que le
> rang des fibres M_p/pM_p est constant.
> Est-ce que M est un module projectif?

C'est faux. Pour des raisons évidentes, il faut au moins supposer que
l'anneau est réduit. Il me semble que cette question avait déjà été posée
récemment, j'ai la flemme de retrouver. Alors, comme c'est trivial, je le
refais : par EGA 4 §8, on peut supposer que l'anneau A est local. Soit r
l'entier tel que M tenseur k(p) soit de dimension r pour tout idéal
premier p. Par Nakayama, on trouve un morphisme surjectif f:A^r -> M ; pour
tout idéal premier p de A, la flèche induite k(p)^r -> M tenseur k(p) est
surjective, mais comme M tenseur k(p) est de dimension r, c'est aussi
injectif ; cela implique que le noyau de f est contenu dans p^r ; ceci
est vrai pour tout idéal premier, l'intersection des idéaux premiers de A
est le nilradical, qui est nul, l'intersection des p^r est donc 0, f est
injective.

Rebelote sur forum.maths:12323:
> M est projectif <=> il est localement libre (au sens libre sur des
> ouverts affines assez petits, pas au sens libre sur les germes [bien que ce
> soit aussi vrai]), en particulier, le rang r est continu.
> Il me semble qu'on a la réciproque, cad (quitte à se ramener à une
> composante connexe) que si r est constant, alors M est projectif.

Il faut faire des hypothèses supplémentaires. Si A n'est pas réduit, on
peut prendre M=A/Nilradical, ce n'est pas un A-module projectif.
Maintenant, supposons A réduit. Avec Nakayama et les sorites sur les
modules de présentation finie (EGA 4 §8), quitte à passer aux ouverts
d'un recouvrement, on peut supposer que l'on a un morphisme surjectif
A^r -> M tel que les flèches induites après tensorisation avec k(p) soient
bijectives pour tout idéal premier p. Notons K le noyau de A^r -> M ;
dire que A^r tenseur k(p) -> (A^r/K) tenseur k(p) est injectif, cela
revient à demander que K tenseur k(p) -> A^r tenseur k(p) soit nul, si je
ne m'abuse, cela signifie que K est contenu dans (p)^r. On applique cela
à tous les idéaux premiers pour dire que K est contenu dans
l'intersection des (p)^r, c'est-à-dire (Nilradical)^r qui est nul par
hypothèse, cela montre que K=0, M est donc libre de rang r.

[Rappel: Continuité des fibres = flatness pour un morphisme projectif (sur un schéma réduit), cf Hilbert Polynomial]

Modules Projectifs
------------------

* Résumé: Flatness vs Projective

M proj => M projectif sur les germes
       <= (si M de prés finie) [Rem: M proj + fini => prés finie]
M proj sur A local <=> M libre (même si M non de type fini)

M plat <=> M plat sur les germes (même si M non de type fini)
M plat sur A local <= M libre
                    => (si M de prés fini)

On retrouve si M de prés fini, M proj <=> M plat <=> M libre sur les germes

! Modules projectifs de type finis, idéaux fractionnaires inversibles

* https://en.wikipedia.org/wiki/Projective_module

- Projectif = facteur direct d'un module libre
- Projectif => plat
- over a local ring, every projective module is free
- free => projective => flat => torsion-free
       <= (local ring or pid)
                     <= (perfect ring)
                             <= (dedekind)
Note: Right or left Artinian rings, and semiprimary rings are known to be right-and-left perfect

Projective modules over commutative rings have nice properties.
- The localization of a projective module is a projective module over the localized ring. A projective module over a local ring is free. Thus a projective module is locally free (in the sense that its localization at every prime ideal is free over the corresponding localization of the ring).
- The converse is true for finitely generated modules over Noetherian rings: a finitely generated module over a commutative noetherian ring is locally free if and only if it is projective.

For finitely presented modules M over a commutative ring R (in particular if M is a finitely generated R-module and R is noetherian), the following are equivalent.
- M is flat.
- M is projective.
- M_m is free as R_m-module for every maximal ideal m of R.
- M_p is free as R_p-module for every prime ideal p of R.
- There exist f_1,\ldots,f_n \in R generating the unit ideal such that M[f_i^{-1}] is free as R[f_i^{-1}]-module for each i.
- \widetilde{M} is a locally free sheaf on \operatorname{Spec}R.

Moreover, if R is a noetherian integral domain, then, by Nakayama's lemma, these conditions are equivalent to
- The dimension of the k(p)–vector space M \otimes_R k(p) is the same for all prime ideals \p of R. That is to say, M has constant rank.
[plus généralement si R noeth réduit, pour M de type fini, projectif <=> rang des fibres est continu, cf plus bas]

Quillen-Suslin: if A pid, M projective over A[X_1,...,X_n] iff A is free

Ex [cf aussi GeoAlg/Divisors_PicardGroup]:
- http://math.stackexchange.com/questions/132154/ideal-as-a-projective-module
  If R is a domain, then a nonzero ideal I is projective iff it is invertible.
  If R is a UFD, then a nonzero ideal I is projective iff it is principal.
  All ideals are projective <=> R is Dedekind
- http://math.stackexchange.com/questions/162679/a-characterization-of-invertible-fractional-ideals-of-an-integral-domain
  Let A be an integral domain, K its field of fractions. Let M be a fractional ideal of A. M finitely generated is invertible if and only if MA_P is a principal fractional ideal of A_P for every maximal ideal P of A.
[Proof:
Reminder A non zero fractional ideal is invertible if and only if it is projective , and then it has rank one.
a) If M is invertible it is projective and non-zero. Hence MP is also non-zero and projective of rank one over AP, hence free of rank one because AP is local and thus a principal fractional ideal for AP.
b) Here I assume that M is finitely generated over A.
If MP is principal fractional it certainly is free of rank one, hence projective of rank one .
Since this is true for all maximal P , the module M is (non-zero) projective: this is where I use that M is finitely generated .
Hence M is an invertible fractional ideal of A, according to the Reminder.
]

Platitude générique
-------------------

* https://stacks.math.columbia.edu/tag/0529
Proposition 28.26.2 (Generic flatness, reduced case).
Let f:X→S be a morphism of schemes. Let F be a quasi-coherent sheaf of OX-modules. Assume
  - S is reduced,
  - f is of finite type, and
  - F is a finite type OX-module.
Then there exists an open dense subscheme U⊂S such that X_U→U is flat and of finite presentation and such that F|XU is flat over U and of finite presentation over O_XU. 

Ie Si f:X->Y un morphisme de schéma de type fini, F cohérent sur X, Y
réduit. Alors il existe un ouvert dense V de Y tel que le pullback de f à
U=f^-1(V) soit plat de présentation finie, et F|U soit plat de présentation
finie.

### Corollaire de la platitude générique (cf Polo, Chapitre 4, Section 13.6)

Soit X une variété algébrique irréductibre sur k alg clos, A=k[X] et
K=k(X) [je crois que tout ce qui suit se généralise à A intègre noeth, en
remplaçant les dim par les longueurs]

1) Si M A-module fini, il existe f \in A\{0} tel que M_f soit libre de rang
   r sur A_f
2) Pour tout x \in X, dim_k M(x) >= r. Il y a égalité ssi M_x est libre, et
   le lieu des tels x est ouvert.

Pr: platitude générique + semi-continuité des fibres

Corollaire: Si f: M->N morphismes de modules finis
1) Si f_K est injective, le lieu des x tels que M_x et N_x soient libres,
   et f(x) injective est un ouvert non vide
2) Si N_x est libre et f(x) injective, alors M_x est libre et f_K est
   injective

Pr: Considérons la suite exacte 0->K->M->N->C->0. 
  1) Si f_K est injective, dim_K C_K=n-m
  Si M_x et N_x sont libres (ça forme un ouvert), alors si C_x est libre la
  suite exacte est scindée donc K_x=0 [car K(x)=0] et f(x) est injective.
  Or C_x est libre exactement quand C(x) est de dim n-m, ie exactement
  quand f(x) est injective (Car C(x) reste le coker) [du coup on n'a pas
  besoin de la première étape].
  2) Si N_x est libre et f(x) injective, alors n=dim N(x)=dim M(x)+dim C(x)
     >= m + (n-r), où r=dim_K C_K. D'où égalité, r=m, M_x et C_x sont
     libres et donc f_K (et f_x) injective

Rem: pour la surjectivité c'est plus simple:
1) Si f_K est surjective, f_x est surjective sur un ouvert (car C_K nul
   implique C_x nul sur un ouvert), or f_x surjective <=> f(x) surjective
   par Nakayam
2) Réciproquement si f(x) est surjective, f_x l'est et donc f_K qui est un
   localisé l'est

Autour de la platitude
----------------------

* Valuative criterion for flatness over a reduced base:
  (EGA IV3, 11.8.1 in noetherian case with dvr's, 4.2.10 in Part I of Raynaud-Gruson in general)

  Th: f: X->Y lfp, F de présentation finie sur X, f(x)=y, O_y réduit.
  F est f-plat en x si pour tout morphisme local Spec A->Y avec A de valuation (discrète si O_y noeth), F' est f'-plat en tous les x' (au dessus de x et y').

* Si on a un morphisme fplpf X->S (ie un cover flat l.f.p.), il admet une
  section S'->X au-dessus de g:S'->S fplpf et loc. quasi-finite. (EGA IV4, 17.16.2) 
  De plus, si f qc on peut prendre S' affine et s if qcqs => on peut prendre g quasi finie.

* Un morphisme plat de présentation fini est fini ssi il est quasi-fini + séparé + rang loc. constant. (II, 1.19 Deligne-Rapoport in noetherian case)

Preuve: on veut prouver que f est propre, par le critère valuatif de
propreté on peut supposer que S est un trait, d'après ZMT X est ouvert dans
Xbar fini sur S, et on peut supposer Xbar plat. En comparant les rangs des
fibres spéciales et génériques de X et Xbar on a X=Xbar.
[Rappel: un morphisme fini sur une base réduite dont le rang des fibres est
constant est plat. Mais c'est pas clair que ça marche encore si on suppose
juste f quasi fini, en effet f n'est plus propre dans ce cas...]

* Critères des fibres

Par EGA IV.8 on a le métathéorème suivant: si on est de présentation
finie, on peut passer des stalks à un petit ouvert de Zariski et
réciproquement.
De plus, en général, si on est plat, on peut passer des fibres aux stalks.

Exemples: si f est plat de présentation finie,
- f lisse = les fibres sont lisses
- f étale = les fibres sont étales
- f l.c.i. = les fibres sont l.c.i. (cf morphismes syntomiques)

Autres exemples:
- si on est plat, dominant/dense = dominant/dense dans les fibres:
  [universal schematic dominance/density is fibral under "expected" flatness
  hypotheses (EGA IV3, 11.10.9, 11.10.10)]
  -> ie si f_i: Z_i->X, avec X loc. noeth et Z_i plat sur S, (f_i)
  universellement schématiquement dominante ssi les (f_i,s) soit dominante pour
  tout s \in S.
  -> Et si X->S est plat lfp, U ouvert de X est universellement
  schématiquement dominant ssi U_s \subset X_s est dense, ie Ass(O_Xs)
  \subset Us.

Notes: on a aussi les résultats fibraux suivants:
- Relative ampleness for a proper fp map is fibral (EGA IV3, 9.6.5)
- Un morphisme est entier ssi il est univ fermé, séparé (eg propre) et à fibres affines (elles seront donc entières) (David Rydh)

Local complete intersection
===========================

* Rappel sur intersection complète:
regular/smooth => loc. complete intersection => Cohen-Macauley.

- https://mathoverflow.net/questions/27197/local-complete-intersections-which-are-not-complete-intersections
- https://math.stackexchange.com/questions/726937/what-does-it-mean-geometrically-for-a-variety-to-be-locally-a-complete-intersect
  -> If a variety is locally a complete intersection does it mean that every point has an affine open neighborhood which is isomorphic to a variety Y⊂Am with Y a complete intersection?

Ex: a reduced curve is l.c.i.
    Cf https://warwick.ac.uk/fac/sci/maths/people/staff/fbouyer/ag4nt/ag_for_nt_10.pdf Curves over a field are l.c.i except if they have an embedded point

Schéma l.c.i
-------------

* https://stacks.math.columbia.edu/tag/00S8
$ Local complete intersection

Definition 10.134.1. Let k be a field. Let S be a finite type k-algebra.
  - We say that S is a global complete intersection over k if there exists a presentation S=k[x1,…,xn]/(f1,…,fc) such that dim(S)=n−c.
  - We say that S is a local complete intersection over k if there exists a covering Spec(S)=⋃D(gi) such that each of the rings Sgi is a global complete intersection over k.
=> l.c.i => Cohen-Macauley

Lemma 10.134.4: Si S=k[x1, ..., xn]/I, alors S est d'intersection complète
(localement autour de q) ssi the ideal Iq′ can be generated by a regular
sequence in the regular local ring k[x1,…,xn]q′ (où q' est q vu dans
k[x1...xn]).

Definition 10.134.5. Let k be a field. Let S be a local k-algebra essentially of finite type over k. We say S is a complete intersection (over k) if there exists a local k-algebra R and elements f1,…,fc∈mR such that
  - R is essentially of finite type over k,
  - R is a regular local ring,
  - f1,…,fc form a regular sequence in R, and
  - S≅R/(f1,…,fc) as k-algebras.

Cette définition coincide avec la précédente pour une k-algèbre locale:
Lemma 10.134.7. Let k be a field. Let S be a local k-algebra essentially of finite type over k. The following are equivalent:
  - S is a complete intersection over k,
  - for any surjection R→S with R a regular local ring essentially of finite presentation over k the ideal Ker(R→S) can be generated by a regular sequence,
  - for some surjection R→S with R a regular local ring essentially of finite presentation over k the ideal Ker(R→S) can be generated by dim(R)−dim(S) elements,
  - there exists a global complete intersection A over k and a prime a of A such that S≅Aa, and
  - there exists a local complete intersection A over k and a prime a of A such that S≅Aa.

Et donc si S est une k-algèbre être lci <=> les stalks sont lci:

Lemma 10.134.8. Let k be a field. Let S be a finite type k-algebra. Let q be a prime of S. The following are equivalent:
  - The local ring Sq is a complete intersection ring (Definition 10.134.5).
  - There exists a g∈S, g∉q such that Sg is a local complete intersection over k.
  - There exists a g∈S, g∉q such that Sg is a global complete intersection over k.
  - For any presentation S=k[x1,…,xn]/I with q′⊂k[x1,…,xn] corresponding to q any of the equivalent conditions (1) – (5) of Lemma 10.134.4 hold.

Lemma 10.134.9. Let k be a field. Let S be a finite type k-algebra. The following are equivalent:
  - The ring S is a local complete intersection over k.
  - All local rings of S are complete intersection rings over k.
  - All localizations of S at maximal ideals are complete intersection rings over k.

* https://stacks.math.columbia.edu/tag/09PY
$ 23.8 Local complete intersection rings
Etend la notion l.c.i sur un anneau noethérien

Let (A,m) be a Noetherian complete local ring. By the Cohen structure theorem (see Algebra, Theorem 10.155.8) we can write A as the quotient of a regular Noetherian complete local ring R. Let us say that A is a complete intersection if there exists some surjection R→A with R a regular local ring such that the kernel is generated by a regular sequence. The following lemma shows this notion is independent of the choice of the surjection.

On peut alors définir l.c.i. pour A noeth:
Definition 23.8.5. Let A be a Noetherian ring.
  - If A is local, then we say A is a complete intersection if its completion is a complete intersection in the sense above.
  - In general we say A is a local complete intersection if all of its local rings are complete intersections.

C'est une notion locale:
Lemma 23.8.7. Let A be a Noetherian ring. Then A is a local complete intersection if and only if Am is a complete intersection for every maximal ideal m of A.

Si A=R/I où I régulier, on retrouve la définition 10.134.5 (cf aussi Lemma 23.8.8. qui montre que les deux notions coincident pour une k-alg de type fini):
The following lemma is the analogue of Algebra, Lemma 10.134.4.
Lemma 23.8.3. Let R be a regular ring. Let p⊂R be a prime. Let I⊂p be an ideal. Set A=(R/I)p=Rp/Ip. The following are equivalent
  - the completion of A is a complete intersection in the sense above,
  - Ip⊂Rp is generated by a regular sequence,
  - the module (I/I2)p can be generated by dim(Rp)−dim(A) elements,
Lemma 23.8.8. Let S be a finite type algebra over a field k.
  - for a prime q⊂S the local ring Sq is a complete intersection in the sense of Algebra, Definition 10.134.5 if and only if Sq is a complete intersection in the sense of Definition 23.8.5, and
  - S is a local complete intersection in the sense of Algebra, Definition 10.134.1 if and only if S is a local complete intersection in the sense of Definition 23.8.5.
Preuve: en effet S_q = k[x_1, ..., x_n]_p / I or k[x_1, ..., x_n]_p est
régulière.

Dévissage:
Lemma 23.8.9. Let A→B be a flat local homomorphism of Noetherian local rings. Then the following are equivalent
  - B is a complete intersection,
  - A and B/mAB are complete intersections.

* Résumé: A noeth
- On dit que A est l.c.i. si tous ses stalks sont l.c.i. (il suffit de
  regarder les points maximaux)
- (A,m) local est l.c.i. := sa complétion est l.c.i ie Ahat=Rhat/I où I
  est donné par une séquence régulière.
  Si A est déjà de la forme R/I, c'est équivalent à demander que I soit
  donné par une séquence régulière.
  Et ça ne dépend pas de la présentation.
- Si (A,m) est une algèbre essentiellement de type fini sur k, on peut
  toujours l'écrire A=R/I (par exemple avec R=k[x_1,...x_n] localisé).
  Donc (A,m) est l.c.i. ssi I est donné par une séquence régulière.
- Si A/k de type fini, A l.c.i. signifie que loc. pour la topologie de
  Zariski A est globalement intersection complète, ie
  A=k[x1,…,xn]/(f1,…,fc) avec dim(A)=n−c.
  (car c'est équivalent avec le fait que f1,...,fc soit régulier dans
  l'anneau régulier k[x1,...,xn])
- f est syntomique si elle est flat, loc. of finite prés et les fibres sont
  l.c.i. Si f est syntomique en x (ie sur l'anneau local), alors f est
  syntomique localement autour de x, et localement f est intersection
  complète globale relative.

Morphismes l.c.i.
-----------------

* https://stacks.math.columbia.edu/tag/00SK
$ 10.135 Syntomic morphisms

Definition 10.135.1. A ring map R→S is called syntomic, or we say S is a flat local complete intersection over R if it is flat, of finite presentation, and if all of its fibre rings S⊗_R κ(p) are local complete intersections, see Definition 10.134.1.

Lemma 10.135.9. Suppose that A is a ring, and P(x)=xn+b1xn−1+…+bn∈A[x] is a monic polynomial over A. Then there exists a syntomic, finite locally free, faithfully flat ring extension A⊂A′ such that P(x)=∏i=1,…,n(x−βi) for certain βi∈A′. 

! Définition de relative global intersection
Definition 10.135.5. Let R→S be a ring map. We say that R→S is a relative global complete intersection if we are given a presentation S=R[x1,…,xn]/(f1,…,fc) such that every nonempty fibre has dimension n−c.

! Relative global intersection is stable by base change and localisation
Lemma 10.135.10. Let S=R[x1,…,xn]/(f1,…,fc) be a relative global complete intersection over R.
  - For any R→R′ the base change R′⊗RS=R′[x1,…,xn]/(f1,…,fc) is a relative global complete intersection.
  - For any g∈S which is the image of h∈R[x1,…,xn] the ring Sg=R[x1,…,xn,x_{n+1}]/(f1,…,fc,hx_{n+1}−1) is a relative global complete intersection.
  - If R→S factors as R→Rf→S for some f∈R. Then the ring S=Rf[x1,…,xn]/(f1,…,fc) is a relative global complete intersection over Rf.

! If the codimension is c (at a point or over a point or over a closed subscheme), we are (locally) global intersection.
Lemma 10.135.11. Let R be a ring. Let S=R[x1,…,xn]/(f1,…,fc). We will find h∈R[x1,…,xn] which maps to g∈S such that Sg=R[x1,…,xn,xn+1]/(f1,…,fc,hx_{n+1}−1)
is a relative global complete intersection over R in each of the following cases:
  - Let I⊂R be an ideal. If the fibres of Spec(S/IS)→Spec(R/I) have dimension n−c, then we can find (h,g) as above such that g maps to 1∈S/IS.
  - Let p⊂R be a prime. If dim(S⊗Rκ(p))=n−c, then we can find (h,g) as above such that g maps to a unit of S⊗Rκ(p).
  - Let q⊂S be a prime lying over p⊂R. If dimq(S/R)=n−c, then we can find (h,g) as above such that g∉q.

! Relative global complete intersection => syntomic
Lemma 10.135.13. Let R be a ring. Let S=R[x1,…,xn]/(f1,…,fc) be a relative global complete intersection. For every prime q of S, let q′ denote the corresponding prime of R[x1,…,xn]. Then
  - f1,…,fc is a regular sequence in the local ring R[x1,…,xn]q′,
  - each of the rings R[x1,…,xn]q′/(f1,…,fi) is flat over R, and
  - the S-module (f1,…,fc)/(f1,…,fc)2 is free with basis given by the elements fimod(f1,…,fc)2.
=> Lemma 10.135.14. A relative global complete intersection is syntomic, i.e., flat.

! Syntomic = locally relative global complete intersection
Lemma 10.135.15. Let R→S be a ring map. Let q⊂S be a prime lying over the prime p of R. The following are equivalent:
  - There exists an element g∈S, g∉q such that R→Sg is syntomic.
  - There exists an element g∈S, g∉q such that Sg is a relative global complete intersection over R.
  - There exists an element g∈S, g∉q, such that R→Sg is of finite presentation, the local ring map Rp→Sq is flat, and the local ring Sq/pSq is a complete intersection ring over κ(p) (see Definition 10.134.5).

! Relévement: si X est syntomique au dessus de Z fermé dans Y, alors Zariski
localement X_i=Xtilde_i|Z_i où Xtilde_i->Y_i est syntomique (Y=\union Y_i)
[Lemma 10.135.18]

* https://stacks.math.columbia.edu/tag/01UB
$ 28.29 Syntomic morphisms
= flat local complete intersection morphism.

An algebra A over a field k is called a global complete intersection over
k if A≅k[x1,…,xn]/(f1,…,fc) and dim(A)=n−c. (=> flat)
An algebra A over a field k is called a local complete intersection if
Spec(A) can be covered by standard opens each of which are global complete
intersections over k. See Algebra, Section 10.134.
Recall that a ring map R→A is syntomic if it is of finite presentation,
flat with local complete intersection rings as fibres, see Algebra, Definition 10.135.1.

A global relative complete intersection (which we used to define standard syntomic ring maps) is in particular flat. In More on Morphisms, Section 36.54 we will consider morphisms X→S which locally are of the form
   Spec(R[x1,…,xn]/(f1,…,fc))→Spec(R).
for some Koszul-regular sequence f1,…,fr in R[x1,…,xn]. Such a morphism will be called a local complete intersection morphism. Once we have this definition in place it will be the case that a morphism is syntomic if and only if it is a flat, local complete intersection morphism.

* https://stacks.math.columbia.edu/tag/068E
$ 36.54 Local complete intersection morphisms

Definition 36.54.2. Let f:X→S be a morphism of schemes.
  - Let x∈X. We say that f is Koszul at x if f is of finite type at x and there exists an open neighbourhood and a factorization of f|U as π∘i where i:U→P is a Koszul-regular immersion and π:P→S is smooth.
  - We say f is a Koszul morphism, or that f is a local complete intersection morphism if f is Koszul at every point.
[Note: si S loc. noeth, Koszul-regular <=> regular]

Ca ne dépend pas de la factorisation, cf
* https://stacks.math.columbia.edu/tag/07CY
$ 15.32 Local complete intersection maps
Lemma 15.32.1. Let A→B be a finite type ring map. If for some presentation α:A[x1,…,xn]→B the kernel I is a Koszul-regular ideal then for any presentation β:A[y1,…,ym]→B the kernel J is a Koszul-regular ideal.

Morphismes radiciels, étales, non ramifiés, lisses
==================================================

Idée générale pour syntomic, lisse, étale:
si X->Y affine de prés fini (localement en x), x est 'foo' si O_Y,y ->
O_X,x est plat et la fibre O_X,x/pOX,x en y est 'foo' sur κ(y). 

Alors il y a un ouvert U autour de x tel que U->Y est 'foo', ie U->Y est de
prés fini, plat, et dont toutes les fibres sont 'foo' (essentiellement car
le lieu 'foo' est ouvert).

De plus on peut même supposer U est 'standard foo' (inversement 'standard
foo' => 'foo').
- standard syntomic = relative complete intersection: 
  S=R[x1,…,xn]/(f1,…,fc) such that every nonempty fibre has dimension n−c
- standard smooth: S=R[x1,…,xn]/(f1,…,fc) such that g=det(∂fi/∂xj) (1 <= i,j <=c) maps to an invertible element in S.
- standard étale: S=R[x]_g/(f) avec f' invertible dans R[x]_g.
Standard 'foo' est stable par pullback et composition (sauf la composition pour standard étale).

On se ramène à vérifier des fibres, ie X 'foo' sur un corps k.
On a les critères suivant
- syntomic: les stalks sont l.c.i. ou X est loc. intersection complète au
  sens ou Zariski-localement X est intersection complète
  S=k[x1,…,xn]/(f1,…,fc) avec f_i régulier
- smooth: smooth at q = dim_κ(q) Ω_S/k ⊗_S κ(q) ≤ dim_x X (on a alors égalité)

Radicial morphism
-----------------

* http://en.wikipedia.org/wiki/Radicial_morphism
  In algebraic geometry, a morphism of schemes
      f: X → Y
  is called radicial or universally injective, if, for every field K the
  induced map X(K) → Y(K) is injective. (EGA I, (3.5.4)) This is a
  generalization of the notion of a purely inseparable extension of fields
  (sometimes called a radicial extension, which should not be confused with a
  radical extension.)
  It suffices to check this for K algebraically closed.

  This is equivalent to the following condition: f is injective on the topological spaces and for every point x in X, the extension of the residue fields
      k(f(x)) ⊂ k(x)
  is radicial, i.e. purely inseparable.

  It is also equivalent to every base change of f being injective on the
  underlying topological spaces. (Thus the term universally injective.)

* https://stacks.math.columbia.edu/tag/02LB
$ 34.22 Application of fpqc descent of properties of morphisms

Lemma 34.22.3. Let f:X→Y be a morphism of schemes. Let X0 denote the set of generic points of irreducible components of X. If
  - f is flat and separated,
  - for ξ∈X0 we have κ(f(ξ))=κ(ξ), and
  - if ξ,ξ′∈X0, ξ≠ξ′, then f(ξ)≠f(ξ′),
then f is universally injective.

* Critère valuatif de Mochizuki:
(Ch. I, sec. 2.4 of his book on p-adic Teichmuller theory in noetherian case)

X, Y de type fini sur S noeth.
A de val discrète, x, η point fermé et générique, pour tout
x,η ->    X  alors on a un unique lift Spec A -> X
Spec A -> Y
<=> f:X->Y est une radimmersion, ie X->U finite radicial et U->Y ouvert.

Corollaire: f:X->Y qc. séparée est une immersion <=> monic + Mochizuki's valuative criterion

Formally foo morphism
---------------------

* https://en.wikipedia.org/wiki/Formally_%C3%A9tale_morphism
a morphism of schemes f : X → Y is formally étale if for every affine Y-scheme Z, every nilpotent sheaf of ideals J on Z with i : Z0 → Z be the closed immersion determined by J, and every Y-morphism g : Z0 → X, there exists a unique Y-morphism s : Z → X such that g = si.[3]

Formally smooth: il existe un lift Z->X. Formally unramfied: il existe au
plus un lift Z->X.

Formally foo + loc. finite presentation <=> foo.

* http://mathoverflow.net/questions/46058/whats-the-intuition-between-formal-smoothness-etaleness-and-unramifiedness
(Rappel: étale=flat+unramified = smooth of dim 0
formally smooth/étale/unramified + loc of finite presentation=smooth/étale/unramified where finite pres = finite pres of algebra, ex: https://math.stackexchange.com/questions/706058/formally-smooth-vs-smooth
formally unramified <=> Kahler sheaf differentials \Omega_X/Y=0

Cf comments by BCrn, ZMT => formally etale implies Zariski-locally looks like open in Spec((R[t]/(f))[1/f′])→ Spec(R) for some monic f∈R[t] and hence flat by inspection, formally smooth implies Zariski-locally etale over an affine space, and formally unramified implies "etale-locally" a closed immersion
cf http://en.wikipedia.org/wiki/Formally_unramified
)

Étale morphism
--------------

* https://en.wikipedia.org/wiki/%C3%89tale_morphism

Let f : X → Y be a morphism of schemes. We say that f  f is étale if and only if it has any of the following equivalent properties:
  - f is flat and G-unramified.[2]
  - f is a smooth morphism and unramified.[2]
  - f is flat, locally of finite presentation, and for every y in Y, the fiber f^−1(y) is the disjoint union of points, each of which is the spectrum of a finite separable field extension of the residue field κ(y).[2]
  - f is flat, locally of finite presentation, and for every y in Y and every algebraic closure k′ of the residue field κ(y), the geometric fiber f^−1(y)⊗κ(y) k′ is the disjoint union of points, each of which is isomorphic to Spec k′.[2]
  - f is a smooth morphism of relative dimension zero.[3]
  - f is a smooth morphism and a locally quasi-finite morphism.[4]
  - f is locally of finite presentation and is locally a standard étale morphism, that is,
      For every x in X, let y=f(x). Then there is an open affine neighborhood Spec R of y and an open affine neighborhood Spec S of x such that f(Spec S) is contained in Spec R and such that the ring homomorphism R → S induced by f is standard étale.[5] ie S =~ (R[x]/fR[x])_g avec f' une unité dans S_g.
  - f is locally of finite presentation and is formally étale.[2]
  - f is locally of finite presentation and is formally étale for maps from local rings, that is:

### Étale ring maps

* https://stacks.math.columbia.edu/tag/00U0
$ 10.142 Étale ring maps

An étale ring map is a smooth ring map whose relative dimension is equal to zero. This is the same as the following slightly more direct definition.

Definition 10.142.1. Let R→S be a ring map. We say R→S is étale if it is of finite presentation and the naive cotangent complex NLS/R is quasi-isomorphic to zero. Given a prime q of S we say that R→S is étale at q if there exists a g∈S, g∉q such that R→Sg is étale.

Lemma 10.142.2. Any étale ring map is standard smooth. More precisely, if R→S is étale, then there exists a presentation S=R[x1,…,xn]/(f1,…,fn) such that the image of det(∂fj/∂xi) is invertible in S.

! En particulier on peut lifter:
Lemma 10.142.10. Let R be a ring and let I⊂R be an ideal. Let R/I→S¯ be an étale ring map. Then there exists an étale ring map R→S such that S¯≅S/IS as R/I-algebras. 

Lemma 10.142.11. Consider a commutative diagram 
0 -> J -> B′ -> B ->0
0 -> I -> A′ -> A -> 0
with exact rows where B′→B and A′→A are surjective ring maps whose kernels are ideals of square zero. If A→B is étale, and J=I⊗AB, then A′→B′ is étale.

! En spécialisant le cas smooth, on obtient:
Lemma 10.142.3. Results on étale ring maps.
  - The ring map R→Rf is étale for any ring R and any f∈R.
  - Compositions of étale ring maps are étale.
  - A base change of an étale ring map is étale.
  - The property of being étale is local: Given a ring map R→S and elements g1,…,gm∈S which generate the unit ideal such that R→Sgj is étale for j=1,…,m then R→S is étale.
  - Given R→S of finite presentation, and a flat ring map R→R′, set S′=R′⊗RS. The set of primes where R′→S′ is étale is the inverse image via Spec(S′)→Spec(S) of the set of primes where R→S is étale.
  - An étale ring map is syntomic, in particular flat.
  - If S is finite type over a field k, then S is étale over k if and only if ΩS/k=0.
    if and only if S is isomorphic as a k-algebra to a finite product of finite separable extensions of k.
  - Any étale ring map R→S is the base change of an étale ring map R0→S0 with R0 of finite type over Z.
  - Let A=colimAi be a filtered colimit of rings. Let A→B be an étale ring map. Then there exists an étale ring map Ai→Bi for some i such that B≅A⊗AiBi.
  - Let A be a ring. Let S be a multiplicative subset of A. Let S−1A→B′ be étale. Then there exists an étale ring map A→B such that B′≅S−1B.

Exemple du résultant: Example 10.142.12
Si on écrit symboliquement x^{n+m}+a_1x{n+m−1}+…+a_n+m=(x^n+b_1x^{n−1}+…+b_n)(x^m+c_1x^{m−1}+…+c_m) l'application R=Z[a1,…,an+m]⟼S=Z[b1,…,bn,c1,…,cm] qui en résulte est une relative globale intersection complète, les fibres étant de dim 0.
La matrice des dérivées partielles est la matrice de Sylvester, son
déterminant est donc le résultant Res_x(g,h) (écrit formellement).
Et donc R→S is étale at q <=> Δ=Res_x(g,h)∉q <=> the images g¯,h¯∈κ(q)[x] of the polynomials g,h are relatively prime in κ(q)[x].

! Standard étale:

Definition 10.142.13. Let R be a ring. Let g,f∈R[x]. Assume that f is monic and the derivative f′ is invertible in the localization R[x]_g/(f). In this case the ring map R→R[x]_g/(f) is said to be standard étale.

Lemma 10.142.14. Let R→R[x]_g/(f) be standard étale.
  - The ring map R→R[x]_g/(f) is étale.
  - For any ring map R→R′ the base change R′→R′[x]_g/(f) of the standard étale ring map R→R[x]_g/(f) is standard étale.
  - Any principal localization of R[x]_g/(f) is standard étale over R.
  - A composition of standard étale maps is not standard étale in general.
    (alors que la composition de standard smooth est standard smooth)

Proposition 10.142.16. Let R→S be a ring map. Let q⊂S be a prime. If R→S is étale at q, then there exists a g∈S, g∉q such that R→Sg is standard étale.

Lemma 10.142.19: si f \in R[x] monic se factorise en g¯ h¯ dans κ(p)[x] tel que gcd(g¯,h¯)=1 alors quitte à remplacer R par une extension étale on peut lifter la factorisation.

### Étale neighbourhoods
* https://stacks.math.columbia.edu/tag/02LD
$ 36.31 Étale neighbourhoods

Definition 36.31.1. Let S be a scheme. Let s∈S be a point.
  - An étale neighbourhood of (S,s) is a pair (U,u) together with an étale morphism of schemes φ:U→S such that φ(u)=s.
  - A morphism of étale neighbourhoods f:(V,v)→(U,u) of (S,s) is simply a morphism of S-schemes f:V→U such that f(v)=u.
  - An elementary étale neighbourhood is an étale neighbourhood φ:(U,u)→(S,s) such that κ(s)=κ(u).

Ca se comporte bien: 
- If κ(s)⊂k be a finite separable field extension. Then there exists an étale neighbourhood (U,u)→(S,s) such that the field extension κ(s)⊂κ(u) is isomorphic to κ(s)⊂k.
- deux voisinages étales U_1 et U_2 peuvent se raffiner en U->U1, U->U2
- deux applications h1,h2:U->U' qui coincident sur k(u')->k(u) peuvent se raffiner en U"->U->U'.
- Hensélisation: O^h_S,s=colim O(U), U voisinage étale élémentaire

We can lift étale neighbourhoods of points on fibres to the total space:
Lemma 36.31.6. Let X→S be a morphism of schemes. Let x∈X with image s∈S. Let (V,v)→(Xs,x) be an étale neighbourhood. Then there exists an étale neighbourhood (U,u)→(X,x) such that there exists a morphism (Us,u)→(V,v) of étale neighbourhoods of (Xs,x) which is an open immersion.

* https://stacks.math.columbia.edu/tag/0CAT
$ 36.32 Étale neighbourhoods and Artin approximation

In this section we prove results of the form: if two pointed schemes have isomorphic complete local rings, then they have isomorphic étale neighbourhoods

On a besoin sur la base: OS,s is a G-ring.

### Structure des morphismes étales

* https://stacks.math.columbia.edu/tag/024J
$ 40 Étale Morphisms of Schemes

* https://stacks.math.columbia.edu/tag/024L
$ 40.3 Unramified morphisms

Unramified homomorphism of local rings = comme unramified, mais on demande
juste que B/A soit essentiellement de type fini plutôt que de type fini.

C'est la version stalk local d'être non ramifié:
Lemma 40.3.2. Let A→B be of finite type with A a Noetherian ring. Let q be a prime of B lying over p⊂A. Then A→B is unramified at q if and only if Ap→Bq is an unramified homomorphism of local rings.
[on a besoin d'être noeth pour que B/A essentiellement de type fini soit
essentiellement de prés fini]

Definition 40.3.5. (See Morphisms, Definition 28.33.1 for the definition in
the general case.) Let Y be a locally Noetherian scheme. Let f:X→Y be
locally of finite type. Let x∈X.
  - We say f is unramified at x if OY,f(x)→OX,x is an unramified homomorphism of local rings.
  - The morphism f:X→Y is said to be unramified if it is unramified at all points of X.

Lemma 40.3.3. Let A, B be Noetherian local rings. Let A→B be a local homomorphism.
  - if A→B is an unramified homomorphism of local rings, then B∧ is a finite A∧ module,
  - if A→B is an unramified homomorphism of local rings and κ(mA)=κ(mB) (or is separably closed), then A∧→B∧ is surjective,
  - if A and B are complete discrete valuation rings, then A→B is an unramified homomorphism of local rings if and only if the uniformizer for A maps to a uniformizer for B, and the residue field extension is finite separable (and B is essentially of finite type over A).
Et A->B unramified <=> A∧→B∧ l'est.

* https://stacks.math.columbia.edu/tag/0257
$ 40.11 Étale morphisms

A local homomorphism f:A→B is said to be an étale homomorphism of local rings if it is flat and an unramified homomorphism of local rings.

C'est aussi la version stalk local d'être étale:
Lemma 40.11.2. Let A→B be of finite type with A a Noetherian ring. Let q be a prime of B lying over p⊂A. Then A→B is étale at q if and only if Ap→Bq is an étale homomorphism of local rings.

A->B étale <=> A∧→B∧ l'est et dans ce cas B∧ est libre sur A de rang n fini.

Rappel des propriétés:
  - An étale morphism is unramified. (Clear from our definitions.)
  - Étaleness is local on the source and the target in the Zariski topology.
  - Étale morphisms are stable under base change and composition. See Morphisms, Lemmas 28.34.4 and 28.34.3.
  - Étale morphisms of schemes are locally quasi-finite and quasi-compact étale morphisms are quasi-finite. (This is true because it holds for unramified morphisms as seen earlier.)
  - Étale morphisms have relative dimension 0. See Morphisms, Definition 28.28.1 and Morphisms, Lemma 28.28.5.
  - A morphism is étale if and only if it is flat and all its fibres are étale. See Morphisms, Lemma 28.34.8.
  - Étale morphisms are open. This is true because an étale morphism is flat, and Theorem 40.10.2.
  - Let X and Y be étale over a base scheme S. Any S-morphism from X to Y is étale. See Morphisms, Lemma 28.34.18.

! Structure theorems:

Standard étale: R->R[t]_g/(f) où
a) f is a monic polynomial, and
b) f′=df/dt is invertible in the localization R[t]_g/(f).

Theorem 40.12.1. Let f:A→B be an étale homomorphism of local rings. Then there exist f,g∈A[t] such that
  - B′=A[t]g/(f) is standard étale – see (a) and (b) above, and
  - B is isomorphic to a localization of B′ at a prime.

Theorem 40.12.2. Let f:A→B be an unramified morphism of local rings. Then there exist f,g∈A[t] such that
  - B′=A[t]_g/(f) is standard étale – see (a) and (b) above, and
  - B is isomorphic to a quotient of a localization of B′ at a prime.

Theorem 40.12.3. Si f:X->Y est étale à x, on peut trouver x \in U -> V
affines tels que f se décompose en U -ouverte> Spec(R[t]_f′/(f)) -> Spec R=V.
où le dernier membre est standard étale (ie l'application est bien
Spec(R[t]_f′/(f)) -> Spec R[t]=A^1_V -> Spec R).
Si f est unramified en x, pareil sauf que j:U->Spec(R[t]_f′/(f)) est une
immersion plutôt qu'une immersion ouverte.

Theorem 40.13.1. Let φ:X→Y be a morphism of schemes. Let x∈X. If φ is smooth at x, then there exist an integer n≥0 and affine opens V⊂Y and U⊂X with x∈U and φ(U)⊂V such that there exists a commutative diagram U -étale-> A^n_R -> Spec R.

* https://stacks.math.columbia.edu/tag/025F
$ 40.14 Topological properties of étale morphisms
Lemma 40.14.2. Let π:X→S be a morphism of schemes. Let s∈S. Assume that
  - π is finite,
  - π is étale (resp. unramified),
  - π−1({s})={x}, and
  - κ(s)⊂κ(x) is purely inseparable.
Then there exists an open neighbourhood U of s such that π|π−1(U):π−1(U)→U is an isomorphism (resp. a closed immersion https://stacks.math.columbia.edu/tag/04DG, Lemma 40.7.3)

* https://stacks.math.columbia.edu/tag/06NE
$ 40.15 Topological invariance of the étale topology

Theorem 40.15.2 (Une equivalence remarquable de catégories).
Let S be a scheme. Let S0⊂S be a closed subscheme with the same underlying topological space (for example if the ideal sheaf of S0 in S has square zero). The functor X⟼X0=S0×SX defines an equivalence of categories 
{schemes X étale over S}↔{schemes X0 étale over S0}

Généralisation: https://stacks.math.columbia.edu/tag/04DZ
Theorem 56.45.2. Let f:X→Y be a morphism of schemes. Assume f is integral, universally injective and surjective (<=> f is a universal homeomorphism, see Morphisms, Lemma 28.43.5). The functor V⟼V_X=X ×_Y V defines an equivalence of categories
{schemes V étale over Y}↔{schemes U étale over X}

* https://stacks.math.columbia.edu/tag/025J
$ 40.16 The functorial characterization

Etale (<=>)
  - as a smooth morphism of relative dimension 0,
  - as locally finitely presented, flat, and unramified morphisms,
  - using the structure theorem, and
  - using the functorial characterization (ie formally étale + loc. finite
    présentation)

### Étale locale structure des morphismes

* Résumé:
- si f:X->S est loc de type finie, et x_i isolés (resp. unramified / étale)
  dans la fibre X_s, alors étale localement U->S on a V_i -> U fini (resp.
  immersion fermée / iso).
  En particulier, si f: X->S est finie et unramified (resp. étale),
  X_U=∐j Vj such that each Vj→U is a closed immersion (resp. iso)
- si f:X->S est fppf avec des fibres geom réduites, alors on a un
  raffinement étale où les fibres sont géom connexes (et réduites). Si de
  plus f normal, les fibres seront géom intègres.
  [cf #Zariski]
- si f:X->S est loc. de type fini, et n=dim_x X_s, alors on a
  X<-X'->Y'->S'->S où X'->X est élémentary étale en x, X'->Y' fini et x'
  seul point dans sa fibre, Y'->S' smooth of rel dim n à fibres géom
  intègres et κ(y') est purement transcendantal sur κ(s') et S'->S
  élémentairement étale.
  [cf #Structure des morphismes de type fini; essentiellement on applique
  les deux résultats précédents à une normalisation de Noether]

* https://stacks.math.columbia.edu/tag/04HF 
$ 36.36 Étale localization of quasi-finite morphisms

Lemma 36.36.2. Let f:X→S be a morphism of schemes. Let x1,…,xn∈X be points having the same image s in S. Assume that
  - f is locally of finite type, and
  - xi∈Xs is isolated for i=1,…,n.
Then there exist
  - an elementary étale neighbourhood (U,u)→(S,s),
  - for each i an open subscheme Vi⊂XU,
such that for each i we have
  - Vi→U is a finite morphism,
  - there is a unique point vi of Vi mapping to u in U, and
  - the point vi maps to xi in X and κ(xi)=κ(vi).

If we allow a nontrivial field extension κ(s)⊂κ(u), i.e., general étale neighbourhoods, then we can split the points as follows.
Lemma 36.36.3. Sous les mêmes hypothèses
Then there exist
  - an étale neighbourhood (U,u)→(S,s),
  - for each i an integer mi and open subschemes Vi,j⊂XU, j=1,…,mi
such that we have
  - each Vi,j→U is a finite morphism,
  - there is a unique point vi,j of Vi,j mapping to u in U with κ(u)⊂κ(vi,j) finite purely inseparable,
  - if vi,j=vi′,j′, then i=i′ and j=j′, and
  - the points vi,j map to xi in X and no other points of (XU)u map to xi.
ie en prenant une extension séparable, on split v_i en v_ij inséparables sur κ(u)

Dans le cas séparé où f est séparé, on peut décomposer totalement (37.36.4, 37.36.5):
 - there exists an elementary étale neighbourhood (U,u)→(S,s) and a decomposition U ×S X=W⨿V1⨿…⨿Vn into open and closed subschemes such that the morphisms Vi→U are finite, the fibres of Vi→U over u are singletons {vi}, each vi maps to xi with κ(xi)=κ(vi), and the fibre of W→U over u contains no points mapping to any of the xi.
 - there exists an étale neighbourhood (U,u)→(S,s) and a decomposition U ×_S X=W⨿ ∐i=1,…,n ∐j=1,…,mi Vi,j into open and closed subschemes such that the morphisms Vi,j→U are finite, the fibres of Vi,j→U over u are singletons {vi,j}, each vi,j maps to xi, κ(u)⊂κ(vi,j) is purely inseparable, and the fibre of W→U over u contains no points mapping to any of the xi. 

The following version may be a little easier to parse.

Lemma 36.36.6. Let f:X→S be a morphism of schemes. Let s∈S. Assume that
  - f is locally of finite type,
  - f is separated, and
  - X_s has at most finitely many isolated points.
Then there exists an elementary étale neighbourhood (U,u)→(S,s) and a decomposition U×SX=W⨿V into open and closed subschemes such that the morphism V→U is finite, and the fibre Wu of the morphism W→U contains no isolated points. In particular, if f−1(s) is a finite set, then Wu=∅.

* https://stacks.math.columbia.edu/tag/04HG
$ 40.17 Étale local structure of unramified morphisms

Reprend la décomposition précédente, dans le cas f unramified en les x_i
(=> quasi fini en les x_i), on peut en appliquant Lemma 40.7.3 supposer de plus:
Vi,j→U is a closed immersion passing through u
et donc si f séparé, on a: X_U=W⨿ ∐Vi,j où Vi,j→U is a closed immersion passing through u.

Cas particulier:
Lemma 40.17.3. Let f:X→S be a finite unramified morphism of schemes. Let s∈S. There exists an étale neighbourhood (U,u)→(S,s) and a finite disjoint union decomposition X_U=∐j Vj such that each Vj→U is a closed immersion.

Proof. Since X→S is finite the fibre over s is a finite set {x1,…,xn} of points of X. Apply Lemma 40.17.2 to this set (a finite morphism is separated, see Morphisms, Section 28.42). The image of W in U is a closed subset (as XU→U is finite, hence proper) which does not contain u. After removing this from U we see that W=∅ as desired.

* https://stacks.math.columbia.edu/tag/04HK
$ 40.18 Étale local structure of étale morphisms

Pareil, sauf que cette fois Vi,j→U is an isomorphism,
en effet on a vu qu'on peut prendre Vi,j→U une immersion fermée, mais comme
f est étale, Vi,j->U aussi, donc c'est une immersion ouverte. En remplaçant
U par l'intersection des images des Vi_j on a gagné.

Lemma 41.18.3. Let f:X→S be a finite étale morphism of schemes. Let s∈S. There exists an étale neighbourhood (U,u)→(S,s) and a disjoint union decomposition
XU=∐jVj such that each Vj→U is an isomorphism.

Unramified morphism
-------------------

* https://en.wikipedia.org/wiki/Unramified_morphism

In algebraic geometry, an unramified morphism is a morphism f:X→Y schemes such that (1) it is locally of finite presentation and (2) for each x∈X, it satisfies the following two conditions: for y=f(x)
  - The residue field k(x) is a separable algebraic extension of k(y).
  - f^#(m_y)O_x,X=m_x

Note: dans le stack project, G-unramified = (2) + loc. of finite presentation
                             unramified = (2) + loc. of finite type

Si f: X->Y loc. of finite presentation (<=>)
  - f is unramified.
  - The diagonal map δf : X → X ×_Y X is an open immersion.
  - The relative cotangent sheaf Ω_X/Y is zero.

* Intuition sur les morphismes non ramifiés: https://ayoucis.wordpress.com/2014/04/06/unramified-morphisms/
https://faculty.missouri.edu/~edidind/EquivariantAlgebraicGeometry/RyanRicheySmoothGroups.pdf
- Smooth: analogues of submersions between manifolds (the induced derivative map on tangent vectors is surjective at every point) + flatness
- Unramified: analogues of immersions in differential geometry (the induced derivative map is injective on tangent vectors)
- Etale: analogue  of  local  diffeomorphisms, which is equivalent (by the inverse function theorem) to the induced morphism on tangent spaces being an isomorphism

### Définitions et propriétés

* https://stacks.math.columbia.edu/tag/00US 
$ 10.148 Unramified ring maps

Definition 10.148.1. Let R→S be a ring map.
  - We say R→S is unramified if R→S is of finite type and Ω_S/R=0.
  - We say R→S is G-unramified if R→S is of finite presentation and Ω_S/R=0.

Lemma 10.148.8. Let R→S be a ring map. (<=>)
  - R→S is étale,
  - R→S is flat and G-unramified, and
  - R→S is flat, unramified, and of finite presentation.

Proposition 10.148.9. Let R→S be a ring map. Let q⊂S be a prime. If R→S is unramified at q, then there exist
  - a g∈S, g∉q,
  - a standard étale ring map R→S′, and
  - a surjective R-algebra map S′→S_g.

* https://stacks.math.columbia.edu/tag/02G3
$ 28.33 Unramified morphisms

Lemma 28.33.2. Let f:X→S be a morphism of schemes. Then
  - f is unramified if and only if f is locally of finite type and ΩX/S=0, and
  - f is G-unramified if and only if f is locally of finite presentation and ΩX/S=0.

Lemma 28.33.11. Fibres of unramified morphisms.
  - Let X be a scheme over a field k. The structure morphism X→Spec(k) is unramified if and only if X is a disjoint union of spectra of finite separable field extensions of k.
  => If f is unramified then for any x∈X the field extension κ(f(x))⊂κ(x) is finite separable.
  - If f:X→S is an unramified morphism then for every s∈S the fibre X_s is a disjoint union of spectra of finite separable field extensions of κ(s).
    => quasi finite
  - And conversely, if all X_s are of this type and f loc. of finite type
    (resp. finite présentation), X is unramified (resp. G-unramified)

Lemma 28.33.13. Let f:X→S be a morphism.
  - If f is unramified, then the diagonal morphism Δ:X→X×SX is an open immersion.
  - If f is locally of finite type/prés and Δ is an open immersion, then f is unramified/G-unramified

Lemma 28.33.14. Let f:X→S be a morphism of schemes. Let x∈X. Set s=f(x). Assume f is locally of finite type (resp. locally of finite presentation). The following are equivalent:
  - The morphism f is unramified (resp. G-unramified) at x.
  - The fibre Xs is unramified over κ(s) at x.
  - The OX,x-module Ω_X/S,x is zero.
  - The OXs,x-module Ω_Xs/s,x is zero.
  - The κ(x)-vector space Ω_Xs,x ⊗_OXs,x κ(x)=Ω_X/S,x ⊗O_X,x κ(x) is zero.
  - We have m_s OX,x=m_x and the field extension κ(s)⊂κ(x) is finite separable.

Smooth morphisms
----------------

* https://stacks.math.columbia.edu/tag/01V4
$ 28.32 Smooth morphisms
Lemma 28.32.3. Let f:X→S be a morphism of schemes. If f is flat, locally of finite presentation, and all fibres Xs are smooth, then f is smooth. 

* https://en.wikipedia.org/wiki/Smooth_morphism
    (i) it is locally of finite presentation
    (ii) it is flat, and
    (iii) for every geometric point s → S the fiber X_s is regular

Let f : X → S be locally of finite presentation. (<=>)
  - f is smooth.
  - f is formally smooth
  - f is flat and the sheaf of relative differentials Ω_{X/S} is locally free of rank equal to the relative dimension of X/S.
  - For any x ∈ X, there exists a neighborhood Spec⁡B  of x and a
    neighborhood Spec A of f(x) such that B=A[t1,…,tn](P1,…,Pm) and the
    ideal generated by the m-by-m minors of (∂Pi/∂tj) is B.
  - Locally, f factors into X →_g A_S^n → S where g is étale.
  - Locally, f factors into X →_g A_S^n → A_S^{n−1} → ⋯ → A_S^1 → S } where g is étale.
  - NL_X/S is quasi-isomorphic to a finite projective O_S-module placed in degree 0. [qui sera donc Ω_X/S, et dans ce cas Ω_X/S est loc libre de rang dim_x(X_f(x))]
  - L_X/S is quasi-isomorphic to a finite projective O_S-module placed in degree 0.

* Lisse en un point
Stack project: (f loc. of finite presentation)
f est lisse en x si f: U->S est lisse pour un ouvert U contenant x. (<=>)
  - on a un ouvert U contenant x tel que f est standard smooth
  - f est plat en x et X_s est lisse sur s
  - f est plat en x et Ω_X/S,x can be generated by at most dim_x(X_f(x)) elements.
  - H_1(L_X/S)_x=0 and Ω_X/S,x is a projective O_X,x-module (or same with flat)

* Lisse sur un corps
Si X schéma de type fini sur un corps, X smooth en x <=>
- dim_κ(x) Ω_X/k ⊗_X κ(x)≤dim_x X.
- dim_κ(x) Ω_X/k ⊗_X κ(x)=dim_x X.

Et donc X est lisse sur k ssi Ω_X/k loc. libre de rang dim_x X.
(ça implique automatiquement que X->k est plat. On pourrait le voir en
remarquant que standard smooth => le polynôme de Hilbert est loc. constant,
donc f est plat)

Et si X est réduit sur un corps parfait, X smooth <=> Omega_X/k locally free.

### Smooth ring maps

#### Smooth ring maps
* https://stacks.math.columbia.edu/tag/00T1
$ 10.136 Smooth ring maps

Let us motivate the definition of a smooth ring map by an example. Suppose R is a ring and S=R[x,y]/(f) for some nonzero f∈R[x,y]. In this case there is an exact sequence S→Sdx⊕Sdy→Ω_S/R→0
/where the first arrow maps 1 to ∂f/∂xdx+∂f∂ydy see Section 10.133. We conclude that ΩS/R is locally free of rank 1 if the partial derivatives of f generate the unit ideal in S. In this case S is smooth of relative dimension 1 over R. But it can happen that ΩS/R is locally free of rank 2 namely if both partial derivatives of f are zero. For example if for a prime p we have p=0 in R and f=x^p+y^p then this happens. Here R→S is a relative global complete intersection of relative dimension 1 which is not smooth. Hence, in order to check that a ring map is smooth it is not sufficient to check whether the module of differentials is free. The correct condition is the following.

Definition 10.136.1. A ring map R→S is smooth if it is of finite presentation and the naive cotangent complex NL_S/R is quasi-isomorphic to a finite projective S-module placed in degree 0.

In particular, if R→S is smooth then the module Ω_S/R is a finite projective S-module. Moreover, by Lemma 10.136.2 the naive cotangent complex of any presentation has the same structure. Thus, for a surjection α:R[x1,…,xn]→S with kernel I the map I/I^2⟶Ω_R[x1,…,xn]/R ⊗_R[x1,…,xn] S
is a split injection. In other words ⨁Sdxi≅I/I2⊕Ω_S/R as S-modules. This implies that I/I^2 is a finite projective S-module too!

Props:
- Stable par changement de base et localisation.
- => l.c.i. over a field

! Déf: standard smooth
S=R[x1,…,xn]/(f1,…,fc) is a standard smooth algebra over R if the polynomial
g=det(∂fi/∂xj) (1 <= i,j <=c) maps to an invertible element in S.

Lemma 10.136.7. Let S=R[x1,…,xn]/(f1,…,fc)=R[x1,…,xn]/I be a standard smooth algebra. Then
  - the ring map R→S is smooth,
  - the S-module Ω_S/R is free on dx_{c+1},…,dx_n,
  - the S-module I/I^2 is free on the classes of f1,…,fc,
  - for any g∈S the ring map R→S_g is standard smooth,
  - for any ring map R→R′ the base change R′→R′⊗_R S is standard smooth,
  - if f∈R maps to an invertible element in S, then R_f→S is standard smooth, and
  - the ring S is a relative global complete intersection over R.
  - A composition of standard smooth ring maps is standard smooth. 

Exemple: Set S=R[x1,…,xn+1]/(f1,…,fc,x_{n+1}h−1), où h=dét(∂fi/∂xj).
This is an example of a standard smooth algebra, except that the
presentation is wrong and the variables should be in the following order:
x1,…,xc,xn+1,xc+1,…,xn. 

! Smooth = locally standard smooth
Lemma 10.136.10. Let R→S be a smooth ring map. There exists an open covering of Spec(S) by standard opens D(g) such that each Sg is standard smooth over R. In particular R→S is syntomic.

! Smoothness on a point (=il y a un ouvert D(g) contenant ce point tel que S_g->R smooth) = Ω_S/R,q loc. free + H_1(L_S/R)_q=0
Lemma 10.136.12. Let R→S be of finite presentation. Let q be a prime of S. The following are equivalent
  - R→S is smooth at q,
  - H_1(L_S/R)_q=0 and Ω_S/R,q is a projective Sq-module (or same with flat)

! Smooth = smooth at every point
Lemma 10.136.13. Let R→S be a ring map. Then R→S is smooth if and only if R→S is smooth at every prime q of S. => composition of smooth is smooth.

! Smoothness of global complete intersection = maximal rank of the Jacobian
Lemma 10.136.15. Let R be a ring. Let S=R[x1,…,xn]/(f1,…,fc) be a relative global complete intersection. Let q⊂S be a prime. Then R→S is smooth at q if and only if there exists a subset I⊂{1,…,n} of cardinality c such that the polynomial
g_I=det(∂fj/∂xi)_j=1,…,c, i∈I. does not map to an element of q.
(ie le rang est maximal)

Preuve: S étant intersection complète, le cotangent complex naïf est donné
par ⨁ S⋅f_j ⟶ ⨁ S⋅dx_i,  f_j ⟼ ∑ ∂f_j/∂x_i dx_i, car (f_j) est une base de I/I^2.

! Smooth <=> flat finite presentation and smooth fibers:
Lemma 10.136.16. Let R→S be a ring map. Let q⊂S be a prime lying over the prime p of R. Assume
  - there exists a g∈S, g∉q such that R→Sg is of finite presentation,
  - the local ring homomorphism Rp→Sq is flat,
  - the fibre S⊗Rκ(p) is smooth over κ(p) at the prime corresponding to q.
Then R→S is smooth at q.

! Set of smooth points is stable under flat base change (Lemma 10.136.17.)

! Relèvement: si X est lisse au dessus de Z fermé dans Y, alors Zariski
localement X_i=Xtilde_i|Z_i où Xtilde_i->Y_i est lisse (Y=\union Y_i)

#### Smooth algebras over fields

*** Sur un corps
* https://stacks.math.columbia.edu/tag/00TQ
$ 10.139 Smooth algebras over fields

Warning: The following two lemmas do not hold over nonperfect fields in general.

! Cas alg clos
Lemma 10.139.1. Let k be an algebraically closed field. Let S be a finite type k-algebra. Let m⊂S be a maximal ideal. Then
  dim_κ(m) Ω_S/k ⊗_S κ(m)=dim_κ(m) m/m^2.

Proof. Consider the exact sequence m/m^2→Ω_S/k ⊗_S κ(m)→Ω_κ(m)/k→0
Then the first map is an isomorphism.

Lemma 10.139.2. Let k be an algebraically closed field. Let S be a finite type k-algebra. Let m⊂S be a maximal ideal. The following are equivalent:
  - The ring S_m is a regular local ring.
  - We have dim_κ(m) Ω_S/k ⊗_S κ(m)≤dim(S_m).
  - We have dim_κ(m) Ω_S/k ⊗_S κ(m)=dim(S_m).
  - There exists a g∈S, g∉m such that Sg is smooth over k. In other words S/k is smooth at m.

! Cas général
Lemma 10.139.3. Let k be any field. Let S be a finite type k-algebra. Let X=Spec(S). Let q⊂S be a prime corresponding to x∈X. (<=>)
  - The k-algebra S is smooth at q over k.
  - We have dim_κ(q) Ω_S/k ⊗_S κ(q)≤dim_x X.
  - We have dim_κ(q) Ω_S/k ⊗_S κ(q)=dim_x X.
  => S_q is regular (et <= si κ(q) is separable over k, Lemma 10.139.5]
Et en carac 0, <=> the Sq-module Ω_S/k,q is (finite) free. [10.139.7]

Lemma 10.139.4. Let k be a field. Let R be a Noetherian local ring containing k. Assume that the residue field κ=R(m)/m is a finitely generated separable extension of k. Then the map d:m/m^2⟶Ω_R/k ⊗_R κ(m) is injective.

Ceci étend 10.139.1 ainsi: on a alors une suite exacte 0→m/m^2→Ω_R/k ⊗_R κ(m) → Ω_κ(m)/k→0 en particulier si κ(m)/k est étale, on a bien m/m^2=Ω_R/k ⊗_R κ(m).

Lemma 10.139.5. Let k be a field. Let S be a finite type k-algebra. Let q⊂S be a prime. Assume κ(q) is separable over k. (<=>)
  - The algebra S is smooth at q over k.
  - The ring Sq is regular.

Lemma 10.139.9. Let R→S be an injective finite type ring map with R and S domains. Then R→S is smooth at q=(0) if and only if the induced extension L/K of fraction fields is separable.

[Proof. Assume R→S is smooth at (0). We may replace S by Sg for some nonzero g∈S and assume that R→S is smooth. Then K→S⊗RK is smooth (Lemma 10.136.4). Moreover, for any field extension K⊂K′ the ring map K′→S⊗RK′ is smooth as well. Hence S⊗RK′ is a regular ring by Lemma 10.139.3, in particular reduced. It follows that S⊗RK is a geometrically reduced over K. Hence L is geometrically reduced over K, see Lemma 10.42.3. Hence L/K is separable by Lemma 10.43.1.
Conversely, assume that L/K is separable. We may assume R→S is of finite presentation, see Lemma 10.29.1. It suffices to prove that K→S⊗RK is smooth at (0), see Lemma 10.136.17. This follows from Lemma 10.139.5, the fact that a field is a regular ring, and the assumption that L/K is separable.]

Attention: on a donc X->S est lisse au point générique, mais ça ne veut pas
dire que la fibre générique est lisse (juste qu'un ouvert de la fibre
générique est lisse)

#### Formally smooth and summary
*** Formally smooth
* https://stacks.math.columbia.edu/tag/00TH
$ 10.137 Formally smooth maps

Proposition 10.137.8. Let R→S be a ring map. Consider a formally smooth R-algebra P and a surjection P→S with kernel J. The following are equivalent
  - S is formally smooth over R,
  - for some P→S as above there exists a section to P/J^2→S,
  - for all P→S as above there exists a section to P/J^2→S,
  - for some P→S as above the sequence 0→J/J^2→Ω_P/R⊗S→Ω_S/R→0 is split exact,
  - for all P→S as above the sequence 0→J/J^2→Ω_P/R⊗S→Ω_S/R→0 is split exact, and
  - the naive cotangent complex NL_S/R is quasi-isomorphic to a projective S-module placed in degree 0.
=> les suites exactes classiques  sont split exactes:
0→Ω_B/A⊗B C→Ω_C/A→ΩC/B→0 (si B->C formally smooth)
0→J/J^2→Ω_B/A⊗B C→Ω_C/A→0 (si A->C formally smooth et C=B/J)
0→I/I^2→J/J^2→Ω_B/A⊗B B/J→0 (si A->B formally smooth)

Proposition 10.137.13. Let R→S be a ring map. The following are equivalent
  - R→S is of finite presentation and formally smooth,
  - R→S is smooth.

Lemma 10.137.12. Let R→S be a ring map. Let I⊂R be an ideal. Assume
  - I^2=0,
  - R→S is flat, and
  - R/I→S/IS is formally smooth.
Then R→S is formally smooth.

It turns out that smooth ring maps satisfy the following strong lifting property:
Lemma 10.137.17. Let R→S be a smooth ring map. Given a commutative solid diagram S->A/I; R->A where I⊂A is a locally nilpotent ideal, a dotted arrow exists which makes the diagram commute.

*** Résumé
* https://stacks.math.columbia.edu/tag/00TZ
$ 10.141 Overview of results on smooth ring maps

Here is a list of results on smooth ring maps that we proved in the preceding sections.
  - A ring map R→S is smooth if it is of finite presentation and the naive cotangent complex of S/R is quasi-isomorphic to a finite projective S-module in degree 0, see Definition 10.136.1.
  - If S is smooth over R, then ΩS/R is a finite projective S-module, see discussion following Definition 10.136.1.
  - The property of being smooth is local on S, see Lemma 10.136.13.
  - The property of being smooth is stable under base change, see Lemma 10.136.4.
  - The property of being smooth is stable under composition, see Lemma 10.136.14.
  - A smooth ring map is syntomic, in particular flat, see Lemma 10.136.10.
  - A finitely presented, flat ring map with smooth fibre rings is smooth, see Lemma 10.136.16.
  - A finitely presented ring map R→S is smooth if and only if it is formally smooth, see Proposition 10.137.13.
  - If R→S is a finite type ring map with R Noetherian then to check that R→S is smooth it suffices to check the lifting property of formal smoothness along small extensions of Artinian local rings, see Lemma 10.140.2.
  - A smooth ring map R→S is the base change of a smooth ring map R0→S0 with R0 of finite type over Z, see Lemma 10.137.14.
  - Formation of the set of points where a ring map is smooth commutes with flat base change, see Lemma 10.136.17.
  - If S is of finite type over an algebraically closed field k, and m⊂S a maximal ideal, then the following are equivalent
    - S is smooth over k in a neighbourhood of m,
    - S_m is a regular local ring,
    - dim(S_m)=dim_κ(m) Ω_S/k ⊗_S κ(m).
    see Lemma 10.139.2.
  - If S is of finite type over a field k, and q⊂S a prime ideal, then the following are equivalent
    - S is smooth over k in a neighbourhood of q,
    - dim_q(S/k)=dim_κ(q) Ω_S/k ⊗_S κ(q).
    see Lemma 10.139.3.
  - If S is smooth over a field, then all its local rings are regular, see Lemma 10.139.3.
  - If S is of finite type over a field k, q⊂S a prime ideal, the field extension k⊂κ(q) is separable and Sq is regular, then S is smooth over k at q, see Lemma 10.139.5.
  - If S is of finite type over a field k, if k has characteristic 0, if q⊂S a prime ideal, and if ΩS/k,q is free, then S is smooth over k at q, see Lemma 10.139.7.

Some of these results were proved using the notion of a standard smooth ring map, see Definition 10.136.6. This is the analogue of what a relative global complete intersection map is for the case of syntomic morphisms. It is also the easiest way to make examples. 

### Smooth morphisms

* https://stacks.math.columbia.edu/tag/01V4
$ 28.32 Smooth morphisms

Smoothness on a point, smooth = smooth at all points, c'est une notion Zarsiki locale (ie O_S(V)→O_X(U) doit être smooth pour tout U->V affines),
= flat, locally of finite presentation, and all fibres Xs are smooth

Lemma 28.32.12. Let f:X→S be a morphism of schemes. Assume f is smooth. Then the module of differentials Ω_X/S of X over S is finite locally free and rank_x(Ω_X/S)=dim_x(X_f(x)) for every x∈X.

Lemma 28.32.14. Let f:X→S be a morphism of schemes. Let x∈X. Set s=f(x). Assume f is locally of finite presentation. The following are equivalent:
  - The morphism f is smooth at x.
  - The local ring map O_S,s→O_X,x is flat and X_s→Spec(κ(s)) is smooth at x.
  - The local ring map O_S,s→O_X,x is flat and the O_X,x-module Ω_X/S,x can be generated by at most dim_x(X_f(x)) elements.
  - The local ring map O_S,s→OX,x is flat and the κ(x)-vector space Ω_Xs/s,x ⊗_OXs,x κ(x)= Ω_X/S,x ⊗_OX,x κ(x) can be generated by at most dim_x(X_f(x)) elements.
  - There exist affine opens U⊂X, and V⊂S such that x∈U, f(U)⊂V and the induced morphism f|U:U→V is standard smooth.
  - There exist affine opens Spec(A)=U⊂X and Spec(R)=V⊂S with x∈U corresponding to q⊂A, and f(U)⊂V such that there exists a presentation A=R[x1,…,xn]/(f1,…,fc) with g=det(∂fi/∂xj) mapping to an element of A not in q.
  [Note: standard smooth est plus fort, on veut g inversible dans A]

Note: la condition Ω_X/S,x ⊗_OX,x κ(x) can be generated by at most dim_x(X_f(x))
montre que X_f(x) est lisse en x par le Lemma 10.139.3.
IE sur un corps X/k il suffit de vérifier que Ω_X est de rang dim_x(X) pour
être lisse en x. Dans ce cas il est automatiquement libre. Il faut faire
attention en revanche que Ω_X peut être localement libre sans que X soit
lisse, si X non réduit ou k non parfait.
On a besoin de la condition de platitude de f en x pour montrer que X est lisse en x.
IE lisse en x = la fibre est lisse en x *et* on est plat en x.

### Schémas lisses au dessus d'un corps
* https://stacks.math.columbia.edu/tag/04QM
$ 32.25 Schemes smooth over fields

Lemma 32.25.2. X/k loc of finite type, k perfect, X reduced.
X smooth <=> Omega_X/k locally free.
Note: Lemma 32.25.1. Si k car 0, pas besoin de supposer X réduit.

In positive characteristic there exist nonreduced schemes of finite type whose sheaf of differentials is free, for example Spec(Fp[t]/(t^p)) over Spec(Fp). If the ground field k is nonperfect of characteristic p, there exist reduced schemes X/k with free Ω_X/k which are nonsmooth, for example Spec(k[t]/(t^p−a) where a∈k is not a pth power

Lemma 32.25.7. Let X be a scheme over a field k. If X is locally of finite type and geometrically reduced over k then X contains a dense open which is smooth over k.

Lemma 32.25.8. Let k be a perfect field. Let X be a locally algebraic reduced k-scheme, for example a variety over k. Then we have
{x∈X∣X→Spec(k) is smooth at x}={x∈X∣OX,x is regular}
and this is a dense open subscheme of X.

Lemma 32.25.9. Let k be a field. Let f:X→Y be a morphism of schemes locally of finite type over k. Let x∈X be a point and set y=f(x). If X→Spec(k) is smooth at x and f is flat at x then Y→Spec(k) is smooth at y. In particular, if X is smooth over k and f is flat and surjective, then Y is smooth over k.

### Smooth vs Regular
- https://mathoverflow.net/questions/344746/smooth-vs-regular-vs-non-singular
  - "regular" is a property of a scheme (or a ring, or local ring), and "smooth" is a property of a morphism of schemes.
  - "Regular" means exactly that at every point, the dimension of the (Zariski) tangent space is equal to the (Krull) dimension (of the local ring at that point).
  - A map f:X→Y is smooth if the fibers over geometric points of Y are regular, and f is locally of finite presentation and flat.
  - a regular scheme over a perfect field is necessarily smooth over that field, but for an imperfect field this fails
  - smooth schemes over non-regular bases can clearly fail to be regular, but smooth schemes over regular bases will be regular

- Smooth => Regular (over a regular base): https://mathoverflow.net/questions/207595/when-a-smooth-algebra-is-regular
  Cf https://stacks.math.columbia.edu/tag/04QM
  Lemma 32.25.3. (slogan) Let X→Spec(k) be a smooth morphism where k is a field. Then X is a regular scheme.

- Un exemple ou régulier n'implique pas smooth quand le corps n'est pas parfait:
  https://mathoverflow.net/questions/12688/nonsingular-normal-schemes
  => l=k[t]/P(t), P inséparable, H la courbe y^2=P(t) est régulière mais pas
  lisse, car sur kbar P a des racines multiples.

Résumé:
- X/k lisse => X/k régulier.
            <= si k parfait
- Comme la lissité est stable par pullback, si X/k lisse, X_kbar/kbar est
  lisse aussi, autrement dit elle est géométriquement lisse/régulière.
  Par contre régulier n'implique pas forcément géom régulier (si k non
  parfait).
=> Donc la condition de lissité c'est les fibres sont lisses (et flat, loc.
finite pres), ou encore les fibres géométriques sont lisses/régulières.

### Generic smoothness

- https://math.stackexchange.com/questions/894369/sards-theorem-for-algebraic-varieties
=> Cf FOAG, $25.3

25.3.1. Theorem (generic smoothness on the source). — Let k be a field of characteristic 0, and let f: X->Y be a dominant morphism of integral k-varieties. Then there is a nonempty (=dense) open set U \subset X such that f|U is smooth of dimension dimX-dimY.

Pr: K(X)/K(Y) est séparemment engendré de degré de transcendance n, donc
Omega_X/Y est de rang n au point générique; par semicontinuité supérieure
du rang, Omega_X/Y est de rang n sur un ouvert U, et comme Y réduit ça
implique Omega_X/Y loc. libre de rang n. Par platitude générique on peut
supposer U plat sur Y, donc f|U est lisse.

Si je ne me trompe pas cette preuve marche en car p dès que f est lisse au
point générique (ie K(X)/K(Y) séparable) et Y réduit.
[cf https://mathoverflow.net/questions/260730/generic-smoothness-in-positive-characteristic]

25.3.3. Theorem (generic smoothness on the target). — Let k be a field of characteristic 0, and let f: X->Y be a morphism of k-varieties and X/k smooth. Then there is a dense open set U \subset Y such that f|f^{-1}(U) is smooth.
[Note that f-1(U)may be empty! Indeed, if f is not dominant, we will have to take such a U]

* Contre exemples en carac p:
- Le Frobenius A^1->A^1 n'est pas lisse (génériquement en la source)
- https://mathoverflow.net/questions/218908/a-criterion-for-generic-smoothness
  Let f:X→Y be a dominant morphism between smooth projective varieties over an algebraically closed field k.
  If k has characteristic zero, then f is generically smooth in the sense that there exists a non-empty open subset of Y over which f is smooth.
  In general, if I assume furthermore that f is proper and f∗OX=OY, so that f cannot factor through a purely inseparable morphism Y′→Y, does generic smoothness still hold ?
  => No, this is not true. A typical example are quasi-elliptic fibrations in characteristic 2 or 3. They are morphisms f:X→Y from a surface to a curve, satisfying your hypotheses, but whose general fibers are cuspidal curves of arithmetic genus 1
- https://mathoverflow.net/questions/230937/generic-smoothness-type-of-results-in-positive-characteristic
  Let f:X→Y be a surjective morphism between two projective varieties over a field of characteristic p>0. Also assume that f∗OX=OY, and X is smooth.
  => a des exemples ou la fibre générique est non réduite.

### Bertini

* Bertini: FOAG $12.4.2: si X est une sous-variété projective lisse de P^n_k,
alors pour un hyperplan général H, H \cap X est lisse de codimension 1.
Rem: en considérant le plongement de Veronèse de degré d, ça reste vrai si
on intersecte X avec une hypersurface générale de degré d.

25.3.7. The Kleiman-Bertini Theorem
En carac 0, si X est une G-variété homogène, f:Y->X et g:Z->X (où Y et Z
lisses sur k), alors il existe un ouvert U de G tel que
(G x_k Y) x_X Z -> G soit lisse de dimension relative dim Y+dim Z - dim X
sur U.

Ex: si Y et Z sont des sous-variétés lisses de X, Z va rencontrer un
translaté générique de Y transversalement.

Exo 25.3.D: Si V est un espace de sections d'un fibré invertible L sur Z
variété lisse sur k, V sans point base, alors un élément général de V donne
un sous-espace régulier de Z.

Purity
------

* Zariski-Nagata purity theorem: Let f:X→Y be a dominant and quasi-finite
  morphism between integral schemes. Suppose that X is normal and Y is
  regular and locally noetherian, and let Z be the set of points of X where
  f is not étale. Then either X=Z or Z is of pure codimension 1. (See SGA1,
  Exposé X, Théorème 3.1) 

=> Mnemonic: "the ramification locus of quasi-finite dominant morphisms is a divisor if the base is smooth" 

Cf https://stacks.math.columbia.edu/tag/0BMB
$ 56.21 Purity of branch locus

Lemma 55.21.4 (Purity of branch locus). Let f:X→Y be a morphism of locally Noetherian schemes. Let x∈X and set y=f(x). Assume
  - OX,x is normal,
  - OY,y is regular,
  - f is quasi-finite at x,
  - dim(OX,x)=dim(OY,y)≥1
  - for specializations x′⇝x with dim(OX,x′)=1 our f is unramified at x′.
Then f is étale at x.

* https://stacks.math.columbia.edu/tag/0EA1
$ 56.28 Purity of ramification locus [Gabber]
Lemma 55.28.3 (Purity of ramification locus).
Let f:X→Y be a morphism of locally Noetherian schemes. Let x∈X and set y=f(x). Assume
  - OX,x is normal of dimension ≥1,
  - OY,y is regular,
  - f is locally of finite type, and
  - for specializations x′⇝x with dim(OX,x′)=1 our f is étale at x′.
Then f is étale at x

Version plus forte dans le cas excellent (il est conjecturé que ça reste
vrai dans le cadre du lemme plus haut):
* https://stacks.math.columbia.edu/tag/0ECD
$ 56.29 Affineness of complement of ramification locus

Theorem 55.29.3. Let Y be an excellent regular scheme over a field. Let f:X→Y be a finite type morphism of schemes with X normal. Let V⊂X be the maximal open subscheme where f is étale. Then the inclusion morphism V→X is affine. 

On en déduit la purité du ramification locus par:
* https://stacks.math.columbia.edu/tag/0BCU
Lemma 31.16.4. Let X be a locally Noetherian scheme. Let U⊂X be an open subscheme such that the inclusion morphism U→X is affine. For every generic point ξ of an irreducible component of X∖U the local ring OX,ξ has dimension ≤1. If U is dense or if ξ is in the closure of U, then dim(OX,ξ)=1.

Morphismes universellement ouverts
==================================

Th: Critère de Chevalley pour les morphismes universellement ouverts
f:X->Y loc de type fini, y \in Y, x un point max de la fibre X_y. Supposons
y géométriquement unibranche (c'est le cas si O_Y,y est int. clos par ZMT).
Alors (<=>)
i) f est universellement ouvert en x
ii) si Y0 est l'unique composante irréductible de Y contenant y et de point
générique \eta, il existe Z irréductible dans X dominant Y0 et contenant x
tel que dim(Z_y)=dim(Z_eta) (Z/Y0 est donc équidimensionnelle en x car les
dimensions des fibres sont >= dim générique)
iii) (Si Y loc Noeth) f est ouvert en x.

Cas particulier:
* https://stacks.math.columbia.edu/tag/0F30
$ Universally open morphisms

Lemma 36.66.2. Let f:X→Y be a morphism of schemes. If
  - f is locally quasi-finite,
  - Y is unibranch and locally Noetherian, and
  - every irreducible component of X dominates an irreducible component of Y,
then f is universally open.

Valuative criterions
====================

Voir aussi: [#autour de la platitude] pour un critère valuatif de la platitude
Et le critère valuatif suivant pour une immersion: qc separated map is immersion iff monic + Mochizuki's valuative criterion [#Radicial morphism]

Anneaux de valuations
---------------------

* https://stacks.math.columbia.edu/tag/00IA
$ 10.49 Valuation rings

Definition 10.49.1. Valuation rings.
  - Let K be a field. Let A, B be local rings contained in K. We say that B dominates A if A⊂B and mA=A∩mB.
  - Let A be a ring. We say A is a valuation ring if A is a local domain and if A is maximal for the relation of domination among local rings contained in the fraction field of A.
Remarque: A valuation
    <=> pour tout x de K, soit x est dans A, soit x^{-1} est dans A (ou les deux)
    => A est normal intègre.

Lemma 10.49.2. Let K be a field. Let A⊂K be a local subring. Then there exists a valuation ring with fraction field K dominating A.

Lemma 10.49.7. Let K⊂L be an algebraic extension of fields. If B⊂L is a valuation ring with fraction field L and not a field, then A=K∩B is a valuation ring and not a field.

Lemma 10.49.11. A is the intersection of all valuation rings in K containing A and if A is local, then A is the intersection of all valuation rings in K dominating A.

Valuation: Γ=K^∗/A^∗, groupe abélien totalement ordonné par γ≥γ′ if and only if γ−γ′ is in the image of A−{0}→Γ
Et réciproquement à une valuation sur K on peut définir A={x∈K∣x=0 or
v(x)≥0} anneau de valuation.

Lemma 10.49.15. Let A be a ring. The following are equivalent
  - A is a valuation ring,
  - A is a local domain and every finitely generated ideal of A is principal.

Lemma 10.49.18. A valuation ring is Noetherian if and only if it is a discrete valuation ring or a field.

* https://stacks.math.columbia.edu/tag/00P7
$ 10.118 Around Krull-Akizuki

One application of Krull-Akizuki is to show that there are plenty of discrete valuation rings. More generally in this section we show how to construct discrete valuation rings dominating Noetherian local rings. 

Lemma 10.118.7. Let A be a ring. The following are equivalent.
  - The ring A is a discrete valuation ring.
  - The ring A is a valuation ring and Noetherian.
  - The ring A is a regular local ring of dimension 1.
  - The ring A is a Noetherian local domain with maximal ideal m generated by a single nonzero element.
  - The ring A is a Noetherian local normal domain of dimension 1.
In this case if π is a generator of the maximal ideal of A, then every element of A can be uniquely written as uπ^n, where u∈A is a unit.

Lemma 10.118.12 (Krull-Akizuki). Let R be a domain with fraction field K. Let K⊂L be a finite extension of fields. Assume R is Noetherian and dim(R)=1. In this case any ring A with R⊂A⊂L is Noetherian. 

Lemma 10.118.13. Let R be a Noetherian local domain with fraction field K. Assume that R is not a field. Let K⊂L be a finitely generated field extension. Then there exists discrete valuation ring A with fraction field L which dominates R.

Critères valuatifs pour les schémas
-----------------------------------

* https://stacks.math.columbia.edu/tag/01KA
$ 26.20 Valuative criterion for universal closedness

Lemma 26.20.4. Let S be a scheme. Let s′⇝s be a specialization of points of S. Then
  - there exists a valuation ring A and a morphism Spec(A)→S such that the generic point η of Spec(A) maps to s′ and the special point maps to s, and
  - given a field extension κ(s′)⊂K we may arrange it so that the extension κ(s′)⊂κ(η) induced by f is isomorphic to the given extension.

* https://stacks.math.columbia.edu/tag/0BX4
$ 29.40 Valuative criteria
f:X->Y, A de valuation, K=Frac A
Spec K -> X on cherche un lift A->X.
  A    -> Y
- séparé <=> lift unique [<= demande que f soit qs]
- univ. fermé <=> lift existe [<= demande que f soit qc]
- propre <=> lift existe uniquement [si f qs de type fini]

On a la version raffinée suivante [Lemma 29.40.2]
Si il existe un lift unique pour tout Spec K -> U -h-> X avec h (et f) qc
et h(U) dense deans X, f est univ fermée. Si de plus f qs f est séparée.

* https://stacks.math.columbia.edu/tag/0CM1
$ 32.15 Noetherian valuative criterion

Lemma 32.15.1. Let f:X→Y be a morphism of schemes. Assume f finite type and Y locally Noetherian. Let y∈Y be a point in the closure of the image of f. Then there exists a commutative diagram
Spec(K) -> X
Spec(A) -> Y
where A is a discrete valuation ring and K is its field of fractions mapping the closed point of Spec(A) to y. Moreover, we can assume that the image point of Spec(K)→X is a generic point η of an irreducible component of X and that K=κ(η).

Note: https://stacks.math.columbia.edu/tag/02JQ dans le cas non noethérien
(et f: X->Y qc), ça marche encore avec A non discret. En particulier tout
point de l'image schématique Z de f est une spécialisation d'un point de f(X).

Corollaires:
Si S loc. noeth et f de type fini,
f séparé/propre/univ fermé <=> lift unique/existe et unique/existe pour les anneaux de valuations discrètes 
- De plus dans le cas séparé/propre, on peut même se restreindre à K=κ(η) pour chaque point générique de X
- Ou encore de la forme Spec K -> U -h-> X où h:U->X est un morphisme fixé de type fini et d'image dense.

Critères valuatifs pour les espaces et stacks algébriques
---------------------------------------------------------

*** Espaces

* https://stacks.math.columbia.edu/tag/03IW
$ 64.41 Valuative criteria

L'existence d'un lift est un peu relaxée: on demande qu'il existe une
extension K'/K de corps et A'/A d'anneaux de valuations tels qu'on ait un lift A'->X.

Si tel est le cas on peut supposer que K'/K est séparable.
De plus si f:X->Y est représentable ou séparé on peut supposer K'=K.

* https://stacks.math.columbia.edu/tag/03K9
$ 64.42 Valuative criterion for universal closedness
* https://stacks.math.columbia.edu/tag/03KT
$ 64.43 Valuative criterion of separatedness
* https://stacks.math.columbia.edu/tag/0CKZ
$ 64.44 Valuative criterion of properness]

- f qc et a l'existence des lifts => f univ. fermé; f univ fermé + qs => les lifts (faibles) existent [Lemma 64.42.2.]
  (On a aussi la réciproque si X descent space, cf https://stacks.math.columbia.edu/tag/06NP, ou f decent https://stacks.math.columbia.edu/tag/03M6)
- f séparé => lift unique; lift unique + f qs => f séparé
- si f qcqs, f est séparée univ fermé <=> le lift existe et est unique (et dans ce cas on a la version usuelle, ie K'=K, de l'existence).
  De plus on a la version raffinée avec Spec K -> U -h-> X où h dense, cf https://stacks.math.columbia.edu/tag/089G
- f qcqs de type fini: f est propre <=> lift existe et est unique

*** Cas noéthérien pour les espaces
* https://stacks.math.columbia.edu/tag/0ARI
$ 66.19 Noetherian valuative criterion

Si Y loc. noeth, f qs loc. of finite type, l'unicité pour les anneaux de
valuation discrètes <=> f séparé
Si Y loc. noeth, f of finite type, l'existence (au sens faible ou fort) et unicité pour les anneaux de valuation discrètes <=> f propre
Et on peut même se restreindre à A valuation discrète complet et de corps
résiduel un corps algébriquement clos.

Versions raffinées avec Spec K -> U -h-> X où h dense
* https://stacks.math.columbia.edu/tag/0CMB
$ 67.21 Noetherian valuative criterion

L'idée est d'utiliser:
Lemma 67.21.1. Let S be a scheme. Let f:X→Y be a morphism of algebraic spaces over S. Assume f finite type and Y locally Noetherian. Let y∈|Y| be a point in the closure of the image of |f|. Then there exists a commutative diagram
Spec(K)->X
Spec(A)->Y 
where A is a discrete valuation ring and K is its field of fractions mapping the closed point of Spec(A) to y. Moreover, we can assume that the point x∈|X| corresponding to Spec(K)→X is a codimension 0 point and that K is the residue field of a point on a scheme étale over X.

*** Stacks

* https://stacks.math.columbia.edu/tag/0CL9
$ 98.38 Valuative criteria

On a une catégorie de lifts possibles, qui peut dépendre du choix de
2-morphisme qui fait commuter le diagramme (mais ça ne se passera pas dans
les bons cas, par exemple Y séparé sur un espace algébrique, donc on n'aura
pas besoin de vérifier que tout se 2-compose de la bonne manière).

Lemma 98.38.2. In the situation of Definition 98.38.1 the category of dotted arrows is a groupoid. If Δf is separated, then it is a setoid.

-> uniqueness: the category of dotted arrows is either empty or a setoid with exactly one isomorphism class
-> existence: = au sens faible après une extension K'/K, la catégorie des
dotted arrows est non vide
Attention: contrairement au cas des espaces, même si f est séparé on ne peut pas supposer K'=K.

* https://stacks.math.columbia.edu/tag/0CQL
$ 98.39 Valuative criterion for second diagonal

If the category of dotted arrows is always a setoid, then Δf is separated.

* https://stacks.math.columbia.edu/tag/0CLS
$ 98.40 Valuative criterion for the diagonal
* https://stacks.math.columbia.edu/tag/0CLV
$ 98.41 Valuative criterion for universal closedness
* https://stacks.math.columbia.edu/tag/0CLY
$ 98.42 Valuative criterion for properness

- f séparé => lift unique; lift unique + f qs => f séparé
- f qc + lift existe => univ fermé; f univ fermé + qs => lift existe
- f qc de type fini: f propre <=> lift existe et est unique

*** Cas noethérien
* https://stacks.math.columbia.edu/tag/0CQL
$ 103.11 Noetherian valuative criterion
Donne la liste complète des critères précédents.

Si Y loc. noeth, f qs loc. of finite type, l'unicité pour les anneaux de
valuation discrètes <=> f séparé
Si Y loc. noeth, f of finite type, l'existence (au sens faible) et unicité pour les anneaux de valuation discrètes <=> f propre
+ versions raffinées habituelles

Résumé
======
Cf https://mathoverflow.net/questions/234469/useful-non-trivial-general-theorems-about-morphisms-of-schemes

Immersions
----------
Let f : X → Y be a morphism of schemes.

* Monomorphismes:
  a) f is a monomorphism.
  b) f is radicial and formally unramified.
  c) For every y∈Y, the fiber f^−1(y) is either empty or isomorphic to Spec(k(y)).

* Immersion ouverte:
(1) f is an open immersion,
(2) f is radicial and etale, [étale=plat+unramified]
(3) f is étale + monic (EGA IV4, 17.9.1)
(4) f is a flat monomorphism, locally of finite presentation.

* Immersion fermée
(1) f is a closed immersion,
(2) f is a proper monomorphism (EGA IV4, 18.12.6)
(2b) f is a finite monomorphism
(3) f is proper, unramified, radicial.

Factorisation
-------------

- Stein factorization: (proper) = (integral) ∘ (proper with connected geometric fibers)

- Zariski's Main Theorem: f:X→Y be separated, quasi-finite sur Y qcqs. Then there is a factorization X→Z→Y where the first map is a qc open immersion and the second is finite. 
=> Mnemonic: (quasi-finite+séparé) ∼ (finite) ∘ (open immersion)

- Thomason: f:X->Y, X,Y qcqs = relatively affine over finite presentation Y-scheme Z (Thomason-Trobaugh, Theorem C.9 cas Y affine; Temkin cas général). De plus Z est séparé si f séparée.
=> Mnemonic: (qcqs [+séparé]) = (finite presentation [+séparé]) ∘ (affine).
   Conrad: (type fini qs sur qcqs)=(finite présentation) ∘ (immersion fermée)
           (fini qs sur qcqs)=(fini) ∘ (immersion fermée)

Compactification
---------------

- Nagata's compactification theorem: Let S be qcqs and f:X→S be separated, finite type. Then X densely embeds into a proper S-scheme.
=> Mnemonic: non-horrible schemes have compactifications

- Temkin's factorization theorem: Let S be qcqs and f:X→S be qc, separated. Then there's a factorization X→Z→Y with the first being affine and the second proper.
=> Mnemonic: (separated + qc) = (proper) ∘ (affine).
   Nagata: (separated + finite type)=(proper) ∘ (open).

- Chow's lemma: Let S be qcqs and f:X→S separated finite type. Then there exists a projective, surjective S-morphism X¯→X which is an isomorphism on a dense subset and where X¯→S is quasi-projective. Moreover X is proper iff X¯ is projective, and if X is reduced X¯ can be chosen to be so as well.
=> Mnemonic: reasonable schemes have quasi-projective "replacements" and proper schemes have projective "replacements".

Smoothness
----------

- f: X->Y is smooth of relative dim d iff locally on X it is of the form U-étale-> A^d_Y -> Y.
=> Mnemonic: smooth morphisms have étale coordinates.

- Smooth/étale morphisms can be lifted (Zariski-locally on the source) along closed immersions (EGA IV_4, 18.1.1).

- l.f.p. map is unramifed iff etale-locally a closed immersion (EGA IV4, 17.7.1, 18.8.3, https://stacks.math.columbia.edu/tag/04HG)

Affine / Proper
---------------
* Quasi-affine: immersion ouverte -> affine
              si f:X->Y, f quasi-affine <=> O_X est f-ample
* Quasi-projectif: immersion ouverte -> projectif
              = on a un fibré en droite L f-ample

* Relative ampleness for a proper fp map is fibral (EGA IV3, 9.6.5)

* Morphisme entier = affine + universallement fermé
  (EGA IV4, 18.12.8, https://stacks.math.columbia.edu/tag/01WG Lemma 28.42.7)
    = univ fermé, séparé et à fibres affines (David Rydh)

* Morphisme fini
(1) f est fini
(2) f est affine et propre
(3) f est propre et quasi-fini

# Descent

La descente Galoisienne est un cas particulier de descente fppf, qui elle
même est un cas particulier de descente monadique.
Cf [Categorie/Categorie#Fibrations/Descent]

* https://stacks.math.columbia.edu/tag/08WE
$ 34.4 Descent for universally injective morphisms
The proof turns out to be entirely category-theoretic, and consequently can be put in the language of monads (and thus applied in other contexts); see [janelidze-tholen].

f:R→S is an effective descent morphism for modules iff f is a universally injective in the category of R-modules, that is, for any R-module M, the map 1_M⊗f:M→M⊗_R S must be injective.

Ca généralise le cas fpqc et split épi.

Galois Descent
--------------

* Références:
- http://www.sphere.univ-paris-diderot.fr/IMG/pdf/Descent_theory_torsors.pdf
Galois Descent theory, descent along fppf topology and the fact that they
form a stack.

- http://www.tac.mta.ca/tac/volumes/23/5/23-05.pdf
(Monadic descent rather than Grothendieck descent)
MONADIC APPROACH TO GALOIS DESCENT AND COHOMOLOGY
FRANCIS BORCEUX, STEFAAN CAENEPEEL AND GEORGE JANELIDZE

We describe a simplified categorical approach to Galois descent theory.  Itis well known that Galois descent is a special case of Grothendieck descent,  and thatunder mild additional conditions the category of Grothendieck descent data coincideswith the Eilenberg-Moore category of algebras over a suitable monad.  This also suggestsusing monads directly, and our monadic approach to Galois descent makes no referenceto Grothendieck descent theory at all.  In order to make Galois descent constructionsperfectly clear, we also describe their connections with some other related constructionsof categorical algebra, and make various explicit calculations, especially with 1-cocyclesand 1-dimensional non-abelian cohomology, usually omitted in the literature.

- http://www.math.uconn.edu/~kconrad/blurbs/galoistheory/galoisdescent.pdf
Elementary introduction to Galois descent

* https://stacks.math.columbia.edu/tag/0CDQ
$ 35.6 Galois descent for quasi-coherent sheaves

Galois descent for quasi-coherent sheaves is just a special case of fpqc
descent for quasi-coherent sheaves:
Let k′/k be a finite Galois extension with Galois group G=Gal(k′/k). Then there are k-algebra isomorphisms k′ ⊗_k k′⟶∏_{σ∈G} k′, a⊗b⟶∏ aσ(b)

A slightly more general case of the above is the following. Suppose we have a surjective finite étale morphism X→Y and a finite group G together with a group homomorphism G^opp→Aut_Y(X),σ↦f_σ such that the map G×X⟶X ×_Y X,(σ,x)⟼(x,f_σ(x))
is an isomorphism. Then the same result as above holds.
[Le cas Galoisien est k'/k fini Galoisien, Y/k et X=Y_k']

Lemma 35.6.2. Let X→Y, G, and f_σ:X→X be as above. The category of quasi-coherent OY-modules is equivalent to the category of systems (F,(φσ)σ∈G) where
  - F is a quasi-coherent OX-module,
  - φ_σ:F→f^∗_σF is an isomorphism of modules,
  - φ_στ=f^∗_σ φ_τ∘φ_σ for all σ,τ∈G.

Faithfully flat descent
-----------------------

The fibered category of quasi-coherent sheaves is a stack on the fpqc site.

* https://stacks.math.columbia.edu/tag/023A
$ 35.2: Descent data for quasi-coherent sheaves

Les données de descente pour la topo de Zariski sont effectives

* https://stacks.math.columbia.edu/tag/023F
$ 35.3: Descent for modules

Une donnée de descente pour R->A se traduit par φ:N ⊗_R A→ A ⊗_R N
tel qu'on ait la condition de cocycle pour 
N ⊗_R A ⊗_R A, A ⊗_R A ⊗_R N, A ⊗_R N ⊗_R A

De manière équivalente, on a une algèbre cosimpliciale A/R∙
  A => A⊗RA => A⊗RA⊗RA.
Si on a une donnée de descente N, on peut donc lui associer un module
cosimplicial N∙: N→A⊗RN→A⊗RA⊗RN→…
Si M est un module sur R, on donnée de descente canonique
associé à M ⊗_R A et donc un module cosimplicial, on vérifie que c'est M
⊗_R (A/R)∙

Lemma 35.3.7. Let R→A be a faithfully flat ring map. Let (N,φ) be a descent datum. Then (N,φ) is effective if and only if the canonical map A ⊗_R H^0(s(N∙))⟶N is an isomorphism.
Et dans ce cas (35.3.6), si N descend en M, le complexe étendu 0->M->s(N∙)= 0→M→A⊗RM→A⊗RA⊗RM→ est exact.

Proposition 35.3.9. Let R→A be a faithfully flat ring map. Then
  - any descent datum on modules with respect to R→A is effective,
  - the functor M↦(A⊗RM,can) from R-modules to the category of descent data is an equivalence, and
  - the inverse functor is given by (N,φ)↦H^0(s(N∙)).

Remark 35.3.10. Let R be a ring. Let f1,…,fn∈R generate the unit ideal. The ring A=∏_i R_fi is a faithfully flat R-algebra. We remark that the cosimplicial ring (A/R)∙ has the following ring in degree n:
    ∏_i0,…,in R_fi0…fin
Hence the results above recover Algebra, Lemmas 10.23.2, 10.23.1 and 10.23.5 (=descente pour la topo de Zariski). But the results above actually say more because of exactness in higher degrees. Namely, it implies that Čech cohomology of quasi-coherent sheaves on affines is trivial. Thus we get a second proof of Cohomology of Schemes, Lemma 30.2.1.

Remark 35.3.11. Let R be a ring. Let A∙ be a cosimplicial R-algebra. In this setting a descent datum corresponds to an cosimplicial A∙-module M∙ with the property that for every n,m≥0 and every φ:[n]→[m] the map M(φ):Mn→Mm induces an isomorphism Mn ⊗_{An,A(φ)} Am⟶Mm.
Let us call such a cosimplicial module a cartesian module. In this setting, the proof of Proposition 35.3.9 can be split in the following steps
  - If R→R′ and R→A are faithfully flat, then descent data for A/R are effective if descent data for (R′⊗RA)/R′ are effective.
  - Let A be an R-algebra. Descent data for A/R correspond to cartesian (A/R)∙-modules.
  - If R→A has a section then (A/R)∙ is homotopy equivalent to R, the constant cosimplicial R-algebra with value R.
  - If A∙→B∙ is a homotopy equivalence of cosimplicial R-algebras then the functor M∙↦M∙⊗A∙B∙ induces an equivalence of categories between cartesian A∙-modules and cartesian B∙-modules.

* https://stacks.math.columbia.edu/tag/023R
$ 35.5 Fpqc descent of quasi-coherent sheaves

S schéma, U={φi:Ui→S} an fpqc covering,
Fpqc descent is effective et on a une équivalence de catégorie entre les
O_S-modules quasi-cohérents et les données de descente.

* https://stacks.math.columbia.edu/tag/023P
$ 35.10 Fpqc coverings are universal effective epimorphisms

Lemma 35.10.2. Let {fi:Xi→X}i∈I be a family of morphisms of affine schemes. The following are equivalent
  - for any quasi-coherent OX-module F we have Γ(X,F)=Equalizer(∏_{i∈I} Γ(Xi,f^∗iF) => ∏_{i,j∈I} Γ(Xi ×_X Xj,(fi×fj)^∗F))
  - {fi:Xi→X}i∈I is a universal effective epimorphism (Sites, Definition 7.12.1) in the category of affine schemes.

Lemma 35.10.7. Let {Ti→T} be an fpqc covering, see Topologies, Definition 34.9.1. Then {Ti→T} is a universal effective epimorphism in the category of schemes, see Sites, Definition 7.12.1. In other words, every representable functor on the category of schemes satisfies the sheaf condition for the fpqc topology, see Topologies, Definition 34.9.12.

[En effet, V->U est effectif si V x_U V => V->U est un coéq, ie
Mor_C(U,X)->∏_{i∈I} Mor_C(Ui,X) => ∏(i,j)∈I^2 Mor_C(Ui ×U Uj,X) est un éq
mais c'est exactement la sheaf condition pour les morphismes.
Autrement dit se donner T->X est la même chose que se donner T_i->X avec
les bonnes conditions de compatibilité, ie h_X(T)=T->X est un sheaf.

Note: dans une catégorie avec pullback, regular épi=effective épi, et descent morphism <=> stable regular épi.
Ainsi les morphismes fpqc sont de descente, donc le foncteur pullback est
pleinement fidèle.
Autrement dit, les morphismes X->Y au dessus de T correspondent aux
morphismes
]

* https://stacks.math.columbia.edu/tag/03O6
$ 56.16 Faithfully flat descent
[résumé rapide de la preuve de 35.5.2)

Definition 56.16.1. Let U={ti:Ti→T}i∈I be a family of morphisms of schemes with fixed target. A descent datum for quasi-coherent sheaves with respect to U is a family (Fi,φij)i,j∈I where
  - for all i, Fi is a quasi-coherent sheaf on Ti, and
  - for all i,j∈I the map φij:pr∗0Fi≅pr∗1Fj is an isomorphism on Ti×TTj such that the diagrams
  - pr∗0Fi -pr∗01φij-> pr∗1Fj 
     \ pr∗02φik pr∗12φjk /
            pr∗2Fk 
    commute on Ti×TTj×TTk.

This descent datum is called effective if there exist a quasi-coherent sheaf F over T and OTi-module isomorphisms φi:t∗iF≅Fi satisfying the cocycle condition, namely φij=pr∗1(φj)∘pr∗0(φi)−1.

Theorem 56.16.2. If V={Ti→T}i∈I is an fpqc covering, then all descent data for quasi-coherent sheaves with respect to V are effective.

In other words, the fibered category of quasi-coherent sheaves is a stack on the fpqc site. The proof of the theorem is in two steps. The first one is to realize that for Zariski coverings this is easy (or well-known) using standard glueing of sheaves (see Sheaves, Section 6.33) and the locality of quasi-coherence. The second step is the case of an fpqc covering of the form {Spec(B)→Spec(A)} where A→B is a faithfully flat ring map. This is a lemma in algebra, which we now present.

Proof: Descent of modules.
If A→B is a ring map, we consider the complex (B/A)∙:B→B⊗AB→B⊗AB⊗AB→…
Lemma 56.16.3. If A→B is faithfully flat, then the complex (B/A)∙ is exact in positive degrees, and H^0((B/A)∙)=A, and (B/A)∙⊗AM is exact in positive degrees, and H^0((B/A)∙⊗AM)=M.

Definition 56.16.5. Let A→B be a ring map and N a B-module. A descent datum for N with respect to A→B is an isomorphism φ:N ⊗_A B ≅ B ⊗_A N of B⊗_A B-modules such that the diagram of B⊗AB⊗AB-modules
N⊗_AB⊗_AB -φ01> B⊗_AN⊗_ABφ12
  φ02 \            / φ12
         B⊗_AB⊗_AN
commutes where φ01=φ⊗idB and similarly for φ12 and φ02.

Theorem 57.16.7. If A→B is faithfully flat then descent data with respect to A→B are effective.

Autres références:
* http://pub.math.leidenuniv.nl/~zomervruchtw/docs/ffdesc.pdf
Faithfully flat descent, Wouter Zomervrucht, November 6, 2013

- QCoh is an fpqc stack, ie every descent datum is effective for
quasi-coherent sheaves on the fpqc topology
- representable functors are fpqc sheaves:
  if U->S is an fpqc covering and we have a morphism f:U->Xx_S U
  such that the pullbacks on Ux_S U coincide then f comes from a
  g:S->X

Remarque: si f:Y->X est fidèlement plate de prés finie; alors f est ouverte
(f est submersif); le polynôme de Hilbert des fibres est constant.
Exemple: extension des scalaires

* Application: http://math.stackexchange.com/questions/424758/a-question-on-faithfully-flat-extension
Let B be a faithfully flat extension of A. Can I claim that b⊗1=1⊗b in B⊗AB if and only if b∈A?

Réponse oui: par descente on peut tensoriser par B, et demander si c'est
vrai pour B'/B où B'=B\tens_A B. Mais on a une section de \Spec B'->\Spec B
donnée par B'->B: x \tens y=xy, ie on peut supposer B'=B \somme I; donc
B' \tens_B B'=B + I + I + I \tens_B I.
The general philosophy behind this kind of argument is that for answering these kinds of questions when A→B is faithfully flat, it is usually no loss of generality to assume in addition that A is a direct summand of B as an A-module.

* https://math.stackexchange.com/questions/187058/why-should-faithfully-flat-descent-preserve-so-many-properties

Descent of schemes
------------------
Les modules descendent pour la topologie fpqc, mais pas forcément les
schémas (pour ça il faut travailler avec les espaces algébriques ou les
stacks). Mais dans certains cas on a descente effective sur les schémas.

* https://stacks.math.columbia.edu/tag/023U
$ 34.31 Descent data for schemes over schemes
Définitions de données de descente pour un schéma

Se donner une donnée de descente pour une famille X_i->S <=> se la donner
pour X=∐i∈I Xi -> S.

35.31.6: Si on a un diagramme commutatif X'->X au dessus de S'->S, on a un
foncteur pullback de données de descentes (qui ne dépent pas du choix de
X'->X qui fait commuter le diagramme)

* https://stacks.math.columbia.edu/tag/0248
$ 81.27 Descent in terms of simplicial schemes
Lemma 81.27.5. Let f:X→S be a morphism of schemes. The construction
category of cartesian schemes over (X/S)∙⟶ category of descent data relative to X/S of Lemma 81.27.4 is an equivalence of categories.

En effet, il suffit de se restreindre au simplexe tronqué [2]=>[1]->[0].

* https://stacks.math.columbia.edu/tag/02W4
$ 35.36 Descent data in terms of sheaves

Lemma 35.36.1. Let τ∈{Zariski,fppf,e´tale,smooth,syntomic}1. Let Sch_τ be a big τ-site. Let S∈Ob(Sch_τ). Let {Si→S}_i∈I be a covering in the site (Sch/S)_τ. There is an equivalence of categories
{descent data (X_i,φ_ii′) such that each X_i∈Ob((Sch/S)_τ)}↔{sheaves F on (Sch/S)τ such that each h_Si×F is representable}.
Moreover,
  - the objects representing h_Si×F on the right hand side correspond to the schemes Xi on the left hand side, and
  - the sheaf F is representable if and only if the corresponding descent datum (Xi,φii′) is effective.

Remark 35.36.2. In the statement of Lemma 35.36.1 the condition that _hSi×F is representable is equivalent to the condition that the restriction of F to (Sch/S_i)_τ is representable.

* https://stacks.math.columbia.edu/tag/02VV
$ 34.32 Fully faithfulness of the pullback functors

It turns out that the pullback functor between descent data for fpqc-coverings is fully faithful. In other words, morphisms of schemes satisfy fpqc descent.
[la section brode autour du fait que c'est vrai parce qu'un morphisme fpqc
est un épi effectif universel (ie stable), donc est de descente. La section
regarde le cas flat surjectif, ou on est juste fidèle plutôt que pleinement
fidèle]

Lemma 35.32.1. A surjective and flat morphism is an epimorphism in the category of schemes.
Lemma 35.32.2. Let h:S′→S be a surjective, flat morphism of schemes. The base change functor Sch/S⟶Sch/S′,X⟼S′ ×_S X is faithful. Lemma 35.32.3. And the pullback functor of descent data is faithful.

Lemma 35.32.4. In the situation of Lemma 35.31.6 assume
  - {f:X′→X} is an fpqc covering (for example if f is surjective, flat, and quasi-compact), and
  - f×f:X′ ×S′ X′→X ×S X is surjective and flat [this follows from 1. if S'=S]
Then the pullback functor is fully faithful.

Lemma 35.32.8. Let f:X→X′ be a morphism of schemes over a base scheme S. Assume {X→S} is an fpqc covering (for example if f is surjective, flat and quasi-compact) (resp. flat surjective). Then the pullback functor of Lemma 35.31.6 is a fully faithful (resp. faithful) functor from the category of descent data relative to X′/S to the category of descent data relative to X/S.

Let U={Ui→S}i∈I, and V={Vj→S}j∈J, be families of morphisms with target S.
- Si U est un Zariski-raffinement de V, descent data relative to V⟶descent data relative to U is an equivalence of categories (35.32.10)
- Si U et V sont fpqc, et U est un raffinement de V, descent data relative to V⟶descent data relative to U est fully faithfull (35.32.11)

Lemma 35.32.11. Let S be a scheme. Let U={Ui→S}i∈I, and V={Vj→S}j∈J, be fpqc-coverings of S. If U is a refinement of V, then the pullback functor descent data relative to V⟶descent data relative to U is fully faithful. In particular, the category of schemes over S is identified with a full subcategory of the category of descent data relative to any fpqc-covering of S.

Remark 35.32.12. Lemma 35.32.11 says that morphisms of schemes satisfy fpqc descent. In other words, given a scheme S and schemes X, Y over S the functor
  (Sch/S)^opp⟶Sets, T⟼Mor_T(X_T,Y_T)
satisfies the sheaf condition for the fpqc topology.
[ie se donner X->Y au dessus de S revient à se donner X_T->Y_T pour un
recouvrement, avec les bonnes conditions de compatibilité]
The simplest case of this is the following. Suppose that T→S is a surjective flat morphism of affines. Let ψ_0:X_T→Y_T be a morphism of schemes over T which is compatible with the canonical descent data. Then there exists a unique morphism ψ:X→Y whose base change to T is ψ_0. In fact this special case follows in a straightforward manner from Lemma 35.32.4. And, in turn, that lemma is a formal consequence of the following two facts: (a) the base change functor by a faithfully flat morphism is faithful, see Lemma 35.32.2 and (b) a scheme satisfies the sheaf condition for the fpqc topology, see Lemma 35.10.7.

* https://stacks.math.columbia.edu/tag/02W1
$ 34.33 Descending types of morphisms

In the following we study the question as to whether descent data for schemes relative to a fpqc-covering are effective. The first remark to make is that this is not always the case. We will see this in Algebraic Spaces, Example 61.14.2. Even projective morphisms do not always satisfy descent for fpqc-coverings, by Examples, Lemma 106.58.1.

On dit qu'une prop P satisfait la descente pour la τ-topologie si les
données de descente qui ont en plus P sont effectives.

Note that in each of the cases we have already seen that the functor from schemes over S to descent data over U is fully faithful (Lemma 34.32.11 combined with the results in Topologies that any τ-covering is also a fpqc-covering). We have also seen that descent data are always effective with respect to Zariski coverings (Lemma 34.32.10).

Lemma 34.32.1: Si
- P est stable par changement de base, et
- for any surjective morphism of affines X→S which is flat, flat of finite presentation, étale, smooth or syntomic depending on whether τ is fpqc, fppf, étale, smooth, or syntomic, any descent datum (V,φ) relative to X over S such that P holds for V→X is effective,
alors P satisfait la descente pour les τ-coverings.

* https://stacks.math.columbia.edu/tag/0244
$ 34.34 Descending affine morphisms
“affine morphisms satisfy descent for fpqc-coverings”.

* https://stacks.math.columbia.edu/tag/0246
$ 34.35 Descending quasi-affine morphisms
“quasi-affine morphisms satisfy descent for fpqc-coverings”.

* https://stacks.math.columbia.edu/tag/02W7
$ 36.49 Descending separated locally quasi-finite morphisms
Separated locally quasi-finite morphisms satisfy descent for
fppf-coverings:
Lemma 36.49.1. Let S be a scheme. Let {Xi→S} be an fppf covering. Let
(Vi/Xi,φij) be a descent datum relative to {Xi→S}. If each morphism Vi→Xi
is separated and locally quasi-finite, then the descent datum is effective.

