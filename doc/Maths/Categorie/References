vim: ft=markdownlight fdm=expr
Références détaillées

Topos
=====

Espace classifiant d'un groupoide continu
-----------------------------------------

### André Joyal, Myles Tierney (1984): An Extension of the Galois Theory of Grothendieck

  Le papier qui prouve que les applications les applications ouvertes
  surjectives de locales ou de topos sont de descente effective, et que du
  coup tout topos peut être vu comme le topos des faisceaux dans G_0 muni
  d'une action de G_1, pour un groupoïde G_1=>G_0 dans Space:=Frame.

  Cas particulier: any connected atomic topos with a point is equivalent to
  the topos of continuous G-sets for G a spatial group. [En effet le point
  induit un morphisme ouvert surjectif.]
  On retrouve la théorie de Galois classique qui dit que le topos étale
  d'un corps k (qui est le topos classifiant de la théorie des extensions
  separables closes) et égale à G-set ou G est le groupe de Galois absolu.

###  Moerdisk (1988): The classifying topos of  a continuous groupoid.
 
https://www.ams.org/journals/tran/1988-310-02/S0002-9947-1988-0973173-9/S0002-9947-1988-0973173-9.pdf
THE CLASSIFYING TOPOS OF  A CONTINUOUS GROUPOID. IIEKE MOERDIJK (1988)

  Si G est un groupoïde continu dans Space, construit BG ainsi:
  NG le nerf de G est un espace simplicial, Sh(NG) est un topos simplicial,
  et BG est la colimite de Sh(NG).

  La colimite existe par Th1: All (small) indexed colimits of Grothendieck toposes exist, and  are computed as  indexed limits of the  underlying categories and  inverse image functors.

$ 1 Généralités sur les locales:
  f:X->Y est étale si on a un recouvrement ouvert de X par des U_i tels que
  f:U_i->f(U_i) est un iso; c'est équivalent à f et \Delta_f: X->X x_Y X
  sont ouverts. Sh(X) =~ espaces étales sur X.

  Topos=Grothendieck topos.
  If f:F->E, on a une adjonction p_! -| p^# (spaces)_E <=> (spaces)_F
  On a une réflection de f vers un topos spatial Sh_E(X)->E (où Sh_E(X) est
  la catégorie des faisceaux internes à E pour un espace dans E),
  réflection stable par pullback et qui préserve les produits.

$ 2 Prouve le th1

$ 3 Simplicial toposes and  descent.
  Etudie les topos simpliciaux.
  Si E_. est un topos simplicial, alors on peut considérer L(E_.) sa
  colimite, mais aussi Des(E_.) le cocone de descente universel, où un
  cocone de descente est un morphisme géométrique g: E_0 -> F avec une
  transformation naturelle gd_1 => gd_0 qui satisfont aux conditions de
  descente classique pour le simplexe tronqué E_2 ≡> E_1 => E_0, avec s la
  section E_0->E_1.
  
  Concrètement Des(E_.) est la catégorie des objets (X,f) de E_0, avec f un
  isomorphisme d_1*(X) =~ d_2*(X) tel que s*(f)=Id et d_0*(f) o
  d_2*(f)=d_1*(f), autrement dit c'est la colimite E_2 ≡> E_1 => E_0 ->
  Desc(E).

  Alors L(E_.) et Des(E_.) sont des topos équivalents; en effet se donner
  un cocone pour E_. revient à se donner un cocone tronqué.

  Localisation lemma: si (X,f) \in Des(E_.), alors Desc(E_./(X,f))=Desc(E_.)/(X,f).

  Theorem: si p:E_0->Desc(E_.), alors p est une surjection.
  - Si d_1, d_0: E_1=>E_0 sont ouvertes, alors p aussi
  - Si d_1, d_0: E_1=>E_0 sont loc. connected (resp. atomic), et E_2 ≡> E_1
    ouverts) alors p aussi
  Corollaire: on en déduit des conditions pour Desc(E_.) d'être ouvert,
  loc. connected, atomic, ...

$ 4 The classifying topos of  a  continuous groupoid.

  Construit BG comme colimite de Sh(N. G)=N. Sh(G)
  Par Joyal-Tierney, tout topos peut être vu comme BG, où on peut même
  demander que G1=>G0 soient loc. connected et connected (donc ouvertes).
  En particulier tout topos atomic connected est de la forme BG avec G
  groupe, et une étendue est de la forme BG avec G étale groupoid.

  La proposition 4.6 étudie les propriétés du morphisme BG->BH en fonction
  du morphisme G->H, et le cor 4.7 donne les propriétés de BG en fonction
  de celles de G.

$ 5 G-spaces and étale G-spaces.

  Construit BG comme l'espace des G-actions. Ici on suppose G ouvert.

  Rappel des définitions: un groupoid est donné par G_1=>G_0 avec d0 et d1
  les domain/codomain map, une unit map s:G0->G1 et une multiplication
  m: G_1 x_G0 G_1 -> G_1. L'existence d'un inverse i:G1->G1 peut s'écrire
  comme le fait que (m,\pi_2) et (\pi_1, m): G1 x_G0 G1 -> G1 x_G0 G1
  sont des isomorphismes au dessus de G1.

  phi: G->H groupoids continus est:
  - ouverte si phi_1:G_1->H_1 est ouverte (phi_0 est alors ouverte également)
  - essentiellement surjective si d1 pi_2: G0 x_H0 H1 -> H0 est une surjection ouverte
  - full si G1 -> H1 x_{H0xH0} (G0xG0) est une surjection ouverte
  - fully faithfull si [G1, H1; G0xG0, H0xH0] est un pullback dans space.

  A G-space est un espace p:E->G0 muni d'une action E x_G0 G1 -> E
  En logique interne: pour tout h:z->y et g:y->x dans G1, et e \in
  p^{-1}(x), alors p(e.g)=y, e.s(x)=e, (e.g).h=e.(goh).

  Prop: BG est équivalente à la catégorie des G-espaces étale
  Note: E->G0 étale ssi E->G0 et Delta: E->E x_G0 E sont ouvertes.

  Localisation: Si E est un G-space, E xG0 G1 => E définit un groupoide E_G, et
  G-space/E =~ E_G-space, et la bijection est stable par pullback.
  En se restreignant aux espaces étales: BG/E =~ B E_G, bijection stable
  par pullback.

  Th 5.12: si f:G->H open and full, E->E' morphisme de H-space, alors
  B f*E'_G -> B f*E_G est un diagramme commutatif.
  B E'_H -> B E_H

  5.15.  SUMMARY.   Let G —> H  be a continuous map  of groupoids, with induced geometric morphism BG-►BH.
   (i)  If  phi_0: G0 —> H0  is open, then BG—►BH  is open.
   (ii) If phi is  essentially surjective then BG—►BH is  surjective.
   (iii) If phi is  essentially surjective and full then BG—►BH is connected.
   (iv)  If phi is open and full,  then BG-►BH is atomic.
   (v) If phi is open, fully faithful and  essentially surjective, then BG-► BH is  an equivalence of topos

$ 6 The Stability Theorem.
  Etudie les pullbacks: Si f: F->E est un morphisme géométrique de
  topos, et G un groupoide continu ouvert dans E, alors B(F,p^# G)=F x_E B(E,G).
  On a aussi stabilité sur les produits: \prod_E B(E,G^i)=B(E, \prod G^i).

  Corollaire 6.9: si G est un groupoïde au dessus d'un espace T, et \pi G est
  le coéq de G_1=>G_0 au dessus de T, alors il est stable par pullback et
  produit (fibrés sur T).
  Preuve: G est un groupoïde continu dans Sh(T), et \pi(G) est la
  réflection de BG->Sh(T) vers les espaces au dessus de T.
  Comme la réflection est préservée par pullback et produit, on en déduit
  le théorème des théorèmes sur BG.

$ 7 Toposes as  a  localization of  continuous groupoids.
  Montre que la catégorie des topos est 1-équivalente à la catégorie des
  groupoïdes continus localisés en la classe des weak-équivalence
  (en se restreignant aux groupoïdes étale complète)
  [Cf DORETTE A. PRONK Etendues and stacks as bicategories of fractions plus
  haut pour construire une équivalence de bicatégories, Moerdijck ne
  considère que les 2-morphismes inversibles ici]

### Moerdijk (1988): The classifying topos of a continuous groupoid II
http://www.numdam.org/article/CTGDC_1990__31_2_137_0.pdf

[Note: étend essentiellement ce qu'il a fait dans le cas des groupes aux
groupoides:
cf Moerdijk (1988): Morita equivalence for continuous groups
https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/morita-equivalence-for-continuous-groups/E509444A2F2637B2BCE5BDB0EA355F9F

Def: M(G)=lim G/U est le monoide continu Gc, qui est l'anneau des endomorphismes du point canonique S->BG
(cf Remark 1.10)

Déf: si P est un flat M(G)-M(H) bispace, Phat=lim P/N_U. Phathat=P; on dit
que P est un torseur si Phat=P (l'article Toposes and groupoids appelle ça
un bispace complet). On défini P \tensh Q=(P \tens Q)hat

Theorem 4.3: Hom_S(BG, BH) =~ Tor(MG, MH), et Prop 4.7: cette équivalence
est stable par pullback.

Theorem 4.4: the category of atomic connected topos with a point (ie =BG G
groupe localic) is dual to the category of complete flat bimodules, which
is called a torsor here.

Corollaire 4.6 (Morita equivalence)
BG and BH are equivalent <=> there exist invertible (resp flat) M(G)-M(H)
bispace P et M(H)-M(G) bispace Q tel que P \tens_M(H) Q=M(G) et Q
\tens_M(G) P=M(H).

Cor 4.8: 'BG classifies MG-torsors': Hom_E(F, B(E,G)) =~ Tor_F(M(f^# G))
où Tor_E(M(G)):=Tor_E(M(G),M(1)); est-ce que ça redonne la notion de
torseur usuelle??

Theorem 5.1: Hom(M(H), M(G)) =~ Top[BH,BG].
(où le . signifie que l'on respecte les points p_H:S->BH et p_G:S->BG
en gardant trace du 2-iso correspondant, et []. signifie que l'on prend les
classes d'équivalence des 2-cells (qui sont forcément inversibles)

Corollaire 5.2: Si G prodiscret, Hom(H,G) =~ Top[BH,BG].
Proof: si G prodiscret, G=~M(G). [Je crois que ça se généralise à des groupoides prodiscrets]
       Comme H->MH est dense, on a Hom(MH,G)=Hom(H,G)

Corollaire 5.3: Hom(M(H), M(G)) =~ Top_S(BH,BG)+, où le + signifie que l'on respecte les points sans garder trace des isos.
Corollaire 5.4: si G discret, Hom(H,G) =~ Top_S(H,G)
]

  Si G est un groupoïde continu, Moerdijk construit une complétion cG qui
  est une catégorie continue telle que B(G)=B(cG). (En général si C
  catégorie continue, BC reste un topos).
  Puis il explique comment tout morphisme f:BH->BG peut être vu comme venant
  d'un biespace R(f), ie muni d'une action de H à droite et G à gauche.
  f^*: BG->BH est donné par E-> E \tens_cG R(f) pour tout G-espace étale E.

  Note: tout morphisme BG->BH ne vient pas d'un morphisme G->H, dans le
  papier précédent il résoud le problème en inversant les weak-équivalence,
  ici il considère les bispaces.

  Just like the category of commutative rings can be madeinto a bicategory with bimodules as morphisms and the tensorproduct as composition (cf. 111). such spaces equipped with anaction of cG on the left and one of cH on the right-call them bispaces - form the morphisms of a bicategory with con-tinuous groupoids as objects and tensor-product as composition.It is a formal consequence of (2) that the 2-categor) of toposesis equivalent to a bicategory of groupoids and such bispaces, as I will spell out in Section 6.

### Moerdijk (1988): Toposes and Groupoids

https://link.springer.com/content/pdf/10.1007/BFb0081366.pdf
https://repository.ubn.ru.nl/bitstream/handle/2066/128966/128966.pdf?sequence=1

Un résumé de:
- The classifying topos of a continuous groupoid, I and II,
- Morita equivalence of continuous groups
- Prodiscrete groups and Galois toposes

$ 1.Equivariant sheaves

Un G-space est un espace p:E->G0 muni d'une action à droite de G
(groupoid):
si p(e)=d0 g, p(e.g)=d1 g, e.s(p(e))=e, (e.g).h=e(gh).

Prop 1.1: the category of étale G-spaces (or equivariant G-sheaves) is a
topos BG.

Ex:
- si G groupe, BG=G-Sets est un topos atomique, BG classifie les G-torseurs [E,BG]=H^1(E,G). 
- si G groupe topologique continu, BG=G-Sets-Continu (ie les stabilisateurs
  sont ouverts), c'est un topos atomique, où un site atomique est donné par
  les G/U, U sous-groupe ouvert.
- si G groupe profini, G=lim_proj Gi où Gi=G/U_i groupe fini.
  The cohomology of BG est la cohomologie Galoisienne: H^i(BG,
  A)=H^i_Gal(G, A) pour un G-module discret A, et BG est un K(G,1)-topos,
  ie le groupe fondamental profini de BG est G, et les autres groupes
  d'homotopie sont nuls.
- si G est un progroupe strict, ie G=lim_proj G_i et G_i->>G_j, alors on
  peut définir BG comme étant les ensembles X=\sum X_i où on a des actions
  compatibles de G_i sur X_i. Alors BG est aussi BG où G=lim_proj G_i est
  prie dans la catégorie des locales, ie G groupe prodiscret.
- la Schanuel topos B(Aut N)=~B(Mono N) où Mono N=monomorphisms dans N.
- si X est un espace, vu comme groupoid trivial, Sh(X)=BX.
  Si G est un groupe topologique qui agit sur un espace topo X, on a un
  groupoid X_G=(X x G => X) et BX_G = faisceaux sur X munis d'une action
  compatible de G.
- si M est une foliated manifold, Hol(M) l'holonomy groupoid (homotopy
  class of paths), alors Hol(M) est un groupoid différentiable, et BHol(M)
  est la catégorie des faisceaux qui sont loc. constant sur chaque leaf.
- une étendue est un topos E tel que E/B=Sh(G0) pour un espace G0, avec
  B->>1. Le diagramme BxBxB ≡> BxB => B est un groupoid trivial dans E, qui
  donne un groupoid continu G où Sh(G1)=Sh(G0) x_E Sh(G0) = E/BxB.
  An object of BG is then an object X->B de E/B muni d'un iso ExB->BxE
  au-dessus de BxB, et en déroulant tout on voit que BG=E.

$ 2. Basic Properties
On peut construire B(G,E) internalement à un topos E, pour un groupoide
continu dans E, on obtient un topos B(G,E)->E.

Th 2.1: stability theorem. Si f:F->E, B(F, f^#G)=F x_E B(E, G).

Prop 2.2: si G continuous groupoid sur S.
- si G0 ouvert, BG->S ouvert
- si G0 loc connected et G1=>G0 open, BG->S loc connected
- si G0 open et G1->G0xG0 open, BG->S atomic.

Prop 2.3: si G1=>G0 ouverts/loc. connected/local homéo/, Sh(G0)->BG
ouvert/loc. connected/atomic.

Corollaire 2.4: dans le théorème de représentation E=BG, on a
- E->S ouvert ssi E=BG pour un groupoid G / G1=>G0->1 ouverts
- E->S (connected) loc. connected ssi G1=>G0->1 (connected) loc. connected
- E->S (connected) atomic ssi G0->1 open (and surjective) et G1->G0xG0 open
  (and surjective)

Theorem 2.5: si Bf: BG->BH est induit par f:G->H
- f0 open => Bf open
- f essentially surjective => Bf surjective
- f essentially surjective et full => Bf connected
- f open et full => Bf atomic
- f weak equiv => Bf equiv
- si f0 et G1=>G0 loc connected, H1=>H0 open, alors Bf loc connected
- si f0 et G1=>G0 loc homéo, H1=>H0 open, alors Bf atomique

$ 3.Completions of Continuous Groupoids

Si G est un groupoide continu, on peut regarder L le lax pullback Sh(G0)
x_BG Sh(G0), c'est un topos localic L=Sh(Gc1). On définit alors Gc comme
Gc1 => Gc0=G0, c'est une catégorie continue, et Ghat comme le groupoide associé
(ie on ne considère que les flêches qui sont des isos), on a
Ghat1=>Ghat0=G0. On a Sh(G1hat)=Sh(G0) x_BG Sh(G0).
[Interprétation: Gc est l'espace des endomorphismes du point localic
Sh(G0)->BG et Ghat l'espace des automorphismes]

Th: BG=BGhat=BGc. [par le descent theorem for open geom morphisms]

Ex: Si G groupe topologique, Gc=lim_proj G/U (U open subgroups)

Si G groupe localic prodiscrete (ex: G profini), alors Gc=G

$ 4. Toposes as a localization of  groupoids. 

Localisation theorem 4.2: B: (Etale complete groupoid, weak
equiv^{-1})->(Top, isomorphic class of geom morphism) is an equivalence.

Si BG->BH est un morphisme géométrique, on peut définir K0 tel que
Sh(K0)=pullback de Sh(G0)->BG->BH par Sh(H0)->BH, et K1 comme pullback de
G1->G0xG0 par K0xK0->G0xG0. On obtient alors g:K->G une weak equivalence.
Si H est étale complète, on obtient un triangle BK   ->    BH
                                                  -> BG -> BH
qui commute à un iso naturel près. K0 est un H-G bispace, et f*: BH->BG
est donné par E-> E \tens_H K0.

$ 5. Geometric   Morphisms as Tensor Products

Bispace: H qui est un left Gc space et right Hc space telle que les deux
actions commutent; ie R->G0, R->H0, Gc1 x_G0 R ->R, R x_G0 Hc1 -> R
et Gc1 x_G0 R => R -> H0
et R x_G0 Hc1 => R -> G0
et Gc1 x_G0 R x_H0 Hc1 -> Gc1 x_G0 R
         R x_H0 Hc1    ->   R

Tensor product: si R bispace et E un right Gc-space, E \tens_Gc R est
défini par le coéq usuel: E x_G0 Gc1 x_G0 R => E x_G0 R ->> E \tens_Gc R.
This coeq needs not be stable, but it is if the actions of Gc on E and R
are given by open maps.

Lemma: si R open bispace et E étale G-space (so also étale Gc space), alors
E \tens_Gc R est un étale H-space (so also étale Hc space).

On a donc un foncteur - \tens_Gc R: BG -> BH, on dit que R est plat si ce
foncteur est exact à gauche.

Theorem 5.4: Rappel un bispace R est flat si g(R)* := - \tens_Gc R est exact.
Le foncteur g:Flat(Gc,Hc)->Top(BH,BG) a un adjoint à droite R pleinement
fidèle R:Top(BH, BG) -> Flat(Gc, Hc).

Corollaire 5.5: si f:BH->BG, alors f* =~ - \tens_Gc R(f).

Corollaire 5.6: This bicategory of continuous groupoids and complete flat
bispaces (where composition is tensor product)
is equivalent to the dual of the bicategory of toposes and
geometric morphisms.
Complete: R =~ Rg(R).

$ 6. Pointed   atomic toposes, Galois toposes, and  the  fundamental group. 

Theorem 6.1 (JT): topos E->S connected atomic with a point p:S->E
<=> groupe continu G dans S tel que E=BG et p=p_G: S->BG est le point canonique
(ie p* est juste l'oubli)

Par 5.4:
Theorem 6.2: Si G et H sont des groupes continus,
Hom(Hc, Gc) =~ [(BH, p_H), (BG, p_G)] en tant qu'ensembles, et 
Hom(Hc, Gc) =~ Top+[(BH, p_H), (BG, p_G)] en tant que catégorie (où Top+
désigne les morphismes pointés dans Top, mais où les 2-morphismes ne
respectent pas les points)

Corollaire 6.3: the embedding of prodiscrete groups into pointed topos is
fully faithful: Hom(H,G)=Top+[(BH,p_H), (BG,p_G)] dès que G et H sont
continus et G prodiscret.

Theorem 6.4: a pointed topos (E,p) is a Galois topos [=pointed connected
atomic topos, generated by its normal object, où A normal si
A=Aut_E(A)-torseur] <=> (E=BG, p=p_G) pour G prodiscret.

Si E est un topos connecté loc. connecté, les connected loc. constants
objets forment un site atomique normal, et la cloture sous les sommes
donnent un topos Galoisien \pi_1(E) \subset E, et l'inclusion et l'image
inverse d'un morphisme géométrique surjectif E->> \pi_1(E). Si E a un point
p, \pi_1(E) a un point \pi_1(p).

Prop 6.5: Si (E,p) connected loc connected topos, (E,p)->(B \pi_1(E,p),
\pi_1(p)) est le morphisme universel vers un topos Galoisien; si G est un
topos Galoisien Top(E,G)=~Top(B \pi_1(E,p)) [et de même pour Top+]
Corollaire 6.6: Si G groupe prodiscret, Top+((E,p), (BG,
p_G))=Hom(\pi_1(E,p), G).

Since for any discrete group G, any two points are isomorphic, we get
Corollaire 6.7: si G discret, Top(E,BG)=Hom(\pi_1(E,p),G)
donc si A abélien H^1(E,A)=Hom(\pi_1(E,p), A) car BA classifie les
A-torseurs.


### Bunge (1990): An application of descent to a classifying theorem for toposes

https://www.researchgate.net/profile/Marta_Bunge/publication/230774979_An_Application_of_Descent_to_a_Classification_Theorem_for_Toposes/links/552581f00cf24b822b4053d7/An-Application-of-Descent-to-a-Classification-Theorem-for-Toposes.pdf

Th: For G on open spatial groupoid (spatial=localic); BG classify principal
Ghat bundle, ou Ghat est la étale complétion de G [BGhat=BG].

Ex: si G groupe discret dans Set, BG classifie les G-principal bundle.
    si Gbar groupe prodiscret, BGbar =~ BG où G=lim G_i dans space.

Idée de la preuve: give two different descriptions of the stack
completion of a spatial groupoid G, in the context of Sp-indexed
categories and relative to the topology of open surjections on Sp
First, by mimicking the procedure employed in [6] for the case
of a category object in a topos X, it is possible to show that
for X=Sp, with the class of open surjections, the essential
features are still present to allow us to derive also here that a
stack completion of G may be given by the Sp-indexed category of
G-torsors, or principal G-bundles. This gives one of the
ingredients of our main theorem. The other ingredient arises from
the Sp-stack of spatial points of BG, which turns out to be a stack
completion of G precisely when G is etale complete (i.e. precisely
when the canonical map G->Ghat is an isomorphism). Putting these
two results together gives the desired theorem as a simple consequence
of the universality of the stack completion.

$ 1. An overview of descent

The notions of descent, weak equivalence and stacks are local
notions; a class P of morphisms in X, closed under pullbacks,
composition and identities, is fixed throughout for this purpose.

Rappel: si C catégorie interne, son externalisation [C] est donnée par
- [X,C] est la catégorie ou les objets sont X->C0 et un morphisme f:x->y
  est donné par f:X->C1 tel que x=d0 f et y=d1 f.
- le foncteur [g,C] pour g:Y->X est donné par composition.
L'externalisation [F] d'un foncteur F:C->D est donné par la composition avec
F0 sur les objets et F1 sur les morphismes.

Si A est une catégorie interne, et X indexé au-dessus de lui même un P-stack,
alors on a Yoneda: A->X^A°, et la stack complétion de A est donnée par les
préfaisceaux localement représentables (en effet l'inclusion induite est
une weak equivalence).

Si A est une catégorie X-indexée, qui a \Sigma (adjoint à gauche du
pullback) et BCC (Beck-Chevalley Condition), alors si f:I->J, Des_A(f)
est équivalente à la catégorie des T_f-algèbres, où T_f est la monade de
\Sigma_f -| f* (isomorphisme qui commute avec le diagramme de descente
[A^I, A^J, Descente] classique); donc A est un stack si \Sigma_f -| f*
est monadique pour tout f.

$ 2. Descent  and  the  Joyal-Tierney theorem
Top 2-category of bounded S-toposes (S elementary topos)

Si π:F->E, on a la catégorie Des(π) donnée par le simplexe tronqué
F x_E F x_E F ≡> F x_E F => F -> E, consiste donc sur les objets en un Y
\in F, tel que π_0*Y =~ π_0*Y dans F x_E F et tel qu'on a les cocycles
habituels.

Lemme 2.1:
- π is an effective descent morphism
- π is an effective descent morphism pour S[O] que l'on voit comme
  Top-indexed via Hom_Top(-, S[O])
  Note: S[O] est l'object classifier dans Top: Hom_Top(E, S[O])=~E
- π is an effective descent morphism pour toute Top-indexed categorie Hbar
  représentée par un topos H (via Hom_Top(-,H))

Corollary 2.2:
- every π in Q is an effective descent morphism
- S[O] est un Q-stack dans Top
- tout topos H est un Q-stack dans Top

Sh: Sp->Top est fully faithfull et a une réflection (la spatial/localic
refletion).
Soit G un groupoid dans Space (ie [G_1 x_G_0 G_1, G_1; G_1, G_0] est un
pullback où la première flèche G_1 x_G_0 G_1 -> G_1 est π_0 (resp. π_1)
et la deuxième la multiplication.

G-space: p:E->G_0 continue et G_1 x_G_0 E -> E.
BG: étales G-spaces.

THEOREM 2-3 (Joyal-Tierney). Soit Q une classe de morphismes de Top closes sous
pullback, composition et identité, et P la classe dans Sp qui lui
correspond par réflexion. Si
- (C) tout E dans Top est couvert par π:Sh(X)->E avec π dans Q.
- (D) tout morphisme de Q est de descente effective [ie par le Lemme 2.1, S[O]
  est un Q-Stack  ou encore tout topos E est un Q-stack]
Alors il existe un groupoide P-spatial (ie localic où les morphismes sont
dans P) G tel que E=~BG.

Preuve: on a Sh(G0)->E dans Q, on définit G1 par Sh(G1)=Sh(G0)x_E Sh(G0)
ou encore Sh(G1)=Sh(G0)xSh(G0) x_ExE E, ce qui montre que G1->G0 est donné
par le pullback de E->ExE est ouvert.
Comme π:Sh(G0)->E est de descente effective, et que S[O] est un Q-stack, E s'identifie via la donnée de descente avec S[O]^Sh(G0)_π =~ BG.

Joyal-Tierney: Q = classe des surjections ouvertes; donc G est un groupoide
ouvert.
Améliorations (Joyal): Q=connected locally connected
Note: (D) est trivial pour Q=connected locally connected; en effet on a
BCC (Tierney-Paré), et connected locally connected morphisms are regular epi
(Pitts). De plus they are effective descent morphism since S[O] is a Q-stack. En
effet π_! -| π* est triplable dans ce cas, car π* est fully faithfull (donc
reflète les isos) et il préserve les coéqs comme il a un adjoint à droite.

Maintenant si G est un open spatial groupoid, on a une surjection ouverte
canonique π_G:Sh(G_0)->BG (telle que l'image inverse est le foncteur d'oubli),
qui donne un open spatial groupoid Ghat (l'étale complétion) qui a même
objets G0 et tel qu'on ait un morphisme canonique continu G->Ghat qui
induit BG=BGhat.
Moerdijk[23] montre dans le cas particulier où G est un spatial group, que
Ghat est le groupe des isomorphismes du monoïde spatial lim_proj G/U (U
open subgroup).
Ainsi BG est le topos de descente de π_G, ce qui montre que B* est
fonctoriel: un morphisme f:G->H induit Ghat->Hhat et BG->BH.

$ 3. The fibration of spatial points of BG
X=(Spaces, continuous map), P=open surjections [=> pullback stable+régular épi]
                            Q=open surjections of toposes
Si f:Y->X est un morphisme dans P, alors f:Sh(Y)->Sh(X) est dans Q et est
de descente effective.

Proposition 3.1: Si H est un topos, Spts(H)={spatial points of H= Sp^op
-Sh^op-> Top^op -Top[-,H]-> Cat} est un P-stack.

Si G est un open spatial groupoid, on a un Sp-foncteur [G]->SPts(BG) où [G]
est l'externalisation de G et pour X dans Sp, le foncteur correspondant
[X,G]->Top[Sh(X),BG] envoie un objet X->G0 sur Sh(X)->Sh(G0)->BG,
et un morphisme f:X->G1 de [X,G] il associe l'isomorphisme Sh(X)->BG issu
de la descente Sh(G0)->BG.

Theorem 3.2: si G est un groupoid spatial ouvert étale complète,
[G]->Spts(BG) est une P-weak équivalence.
Corollaire 3.3: dans ce cas, Spts(BG) est la stack complétion de [G].

Prop 3.4: si E est un topos, G open spatial groupoid, Spts(E)^G=G-diagrams
dans Spts(E), alors Spts(E)^G=~Top(BG,E).

Preuve: un élément de Spts(E)^G correspond à un morphisme f:Sh(G0)->E
et une action de G sur f; c'est équivalent à une donnée de descente pour f
pour le diagramme simplicial (Sh(G_.)), dont le descent topos est BG.
On a donc un morphisme BG->E.

Corollaire 3.5: si φ:G->H un morphisme continu de spatial groupoids qui est
P-weak equivalence, alors Bφ:BG->BH est une équivalence.

Preuve: Pour tout topos E, comme Spts(E) est un Q-stack, Spts(E)^H ->
Spts(E)^G est une équivalence, donc par la prop Top(BH, E)->Top(BG, E) est
une équivalence, donc Bφ est une équivalence.

$ 4. Spatial G-torsors or generalized principal G-bundles

The notion of G-bundle can be generalised for G spatial groupoid [we can
assume G open]; principal G-bundles=G-torsor over a space (where 'epi' is
replaced by 'open surjection').

Theorem 4.1: La catégorie Sp indexée sur elle même est un P-stack.

Comme G est une catégorie interne à Sp, la catégorie Sp^G° des rights
G-space est un stack, et on a Yoneda: [G]->Sp^G° qui montre que la P-stack
complétion de [G] est donnée par les éléments P-loc. rep de Sp^G°.

Définition 4.2: A right G-space over X is T->X x G0
ie T->X et T->G0 où T->G0 est muni d'une action G-action compatible avec T->X: 
T x_G0 G1 => T->X.

Déf 4.3: A right G-torsor is a right G-space où
- T->X est une surjection ouverte
- T x_G0 G1 => T est la kernel pair de T->X.

Prop 4.4: Tor(G) est une sous-catégorie indexée pleine de Sp^G°.
Tor(X,G) est la sous-catégorie de (Sp/X)^G° des torseurs sur X.

Lemme 4.5: si X est une catégorie avec pullback, P a class of stably
regular épis, q: F->Y épi effectif dans P (ie q coéq du kernel pair F x_Y
F=F), et pareil pour p:E->X, et qu'on a un diagramme commutatif
E x_X E -> F x_Y F
  E     ->   F
  X     ->   Y
alors le diagramme du bas est un pullback ssi (l'un des deux, donc les
deux) diagrammes du haut le sont [cf Barr aussi].

Corollaire 4.6: Si (T->X) -> (S->Y) est un morphisme de torseurs, alors le
diagramme est un pullback.
Corollaire 4.7: Les morphismes de Tor(X,G) sont des isos, ie Tor(X,G) est
un groupoide

Déf 4.8: G est un G-torseur au dessus de G0: c'est le G-torseur trivial.
T->X a right G-space est dit trivial/représentable si T est le pullback de
G le long de x:X->G0 (ie T=yon^X(x)). Il est dit P-locally representable si
il existe un morphisme ouvert surjectif Y->>X tel que le pullback de T à Y
soit trivial.

Prop 4.9. T right G-space sur X. (<=>)
- T G-torsor
- T loc. représentable
=> Tor(G) =~ P-loc.rep.(Sp^G°)

Theorem 4.11: If G open spatial groupoid, yon: [G]->Tor(G)=~P-loc.
rep(Sp^G°) is a P-weak equivalence, 
and Tor(G) is the P-stack complétion of [G].

$ 5 The classification theorem

Theorem 5.1: si G open spatial groupoid, Ghat sa complétion étale, alors
on a yon: [Ghat]->Tor(Ghat) et Φ:[Ghat]->Spts(BG) sont deux stack
complétions, d'où un isomorphisme Tor(Ghat) =~ SPts(BG) (tel que le
diagramme de stack complétion commute à un 2-iso près).

Corollaire 5.2: Tor(X, Ghat)=~Top(Sh(X), BG)
Corollaire 5.3: si H open spatial groupoid, Tor(Ghat)^H=Top[BH, BG]
Preuve: Tor(Ghat)^H=~Spts(BG)^H  = Top(BH, BG) par 3.4.

Or Tor(Ghat)^H est la catégorie des H-Ghat bispaces au sens de Moerdijk.

Corollaire 5.4: B: Gpt->Top induit une équivalence {étale complète
groupoid, P-weak-equivalences^{-1}} =~ {Top, isomorphism class of geometric
morphisms}

Soit Top[BG,BH]+ les morphismes BG->BH qui respectent les points
Sh(G0)->BG, Sh(H0)->BH. Si on voit un espace X comme un groupoid trivial,
Top[Sh(X), BG]+ définit une catégorie Sp-indexée SPts(BG)+.

Prop 5.5: si G est étale complète, [G]=~SPts(BG)+, et donc la stack
complétion [G]->SPts(BG) peut se voir comme un oubli de la structure
pointée de SPts(BG)+, ie on a le droit "d'ajouter de la multiplicité".
Dans l'autre sens, les points spatiaux SPts(BG) sont localement pointés, ie
localement dans SPts(BG)+.

Corollaire 5.6: Si G, H open groupoid, G étale complète, alors
Hom(G,H) =~ Top[BH, BG]+

Preuve:
[G] =~ SPts(BG)+, donc si H spatial groupoid,
[G]^H =~ SPts(BG)^H+, or de SPts(BG)^H =~ Top(BH,BG) on déduit
SPts(BG)^H+ =~ Top[BH, BG]+.

### Moerdijk, Classifying spaces for toposes with enough points
https://link.springer.com/article/10.1007/BF02925366
https://sci-hub.tw/10.1007/BF02925366

This paper provides an introduction to and a survey of recent work with C. Butz. The central construction is that of a “classifying space” for any Grothendieck topos with enough points. It is proved that this space has the same cohomology and homotopy groups as the topos. The construction also has applications in mathematical logic, where it yields new topological completeness theorems.

E coherent si il y a un site de définition (C,J) où C a les
pullback et un objet terminal, et tous les covering sont finis]
E coherent => E has enough point (Deligne)
Coherent toposes = classyfing toposes of finitary geometric theories.

$ 2. Approximation of toposes by topological spaces

Proposition: Si E a assez de points, on peut construire un espace topologique
X_E tel que si f:Sh(X_E)->E, alors f*:E->Sh(X_E) est full and faithfull,
préserve la first order logic (ie f open), et les hom internes.
X_E est construit en terme d'enumerated models.

Theorem 1: De plus f* induit un isomorphisme des catégories dérivées D+(E)->D+(X_E),
donc préserve la cohomologie abélienne: H^i(E,A)=H^i(X_E, f*A).

Theorem 2: il existe une relation d'équivalence π sur X_E tel que
f*: E->Sh(X_E, π) est fully faithfull and logical.

Theorem 3: E=Sh(G) où G est le groupoid obtenu en regardant sur les modèles
qui constituent X_E les isomorphismes de modèles.

$ 3. Topological   models of classical logic 

Completness theorem: Pour une Henkin Type Theory T (une modèle du premier
ordre en logique classique avec des types), il existe un modèle topologique
M sur un espace Y tel que
(i) (completeness) φ est prouvable dans T ssi [[φ]]=Y
(ii) (functional completeness) tout morphisme M(R)->M(S) entre des interprétations de types est définissable par une provably functional relation.
Preuve: on prend le topos classifiant E, et on considère l'espace
topologique associé.

The definability of functions as stated in part (ii) can be extended to arbitrary subsheaves if one takes a group action into account.

Definability Theorem: T,Y,M comme précédemment, il existe un groupe π qui
agit sur Y et M de telle sorte que pour tout type S et tout sous-sheaf
complémenté invariant par π, A \subset M(S), corresponde une formule φ(x)
avec une variable libre de type S tel que A=[[φ(x)]]

Stacks and topos
----------------

### Stack completions over a topos

#### Marta Bunge, Robert Pare (1979): Stacks and equivalence of indexed categorie
http://www.numdam.org/article/CTGDC_1979__20_4_373_0.pdf

$ 1 strong/weak/local equivalences:

S be a finitely complete regular category

Def: F:A->B (S-indexed) weak equivalence ssi F^I fully faithfull et loc.
surjectif au sens de si y \in B^I, il existe a:J->>I regular epi, un
élément x \in A^J et un iso dans B^J: F^J x = a* y.

Lemma: Weak equivalences are closed under composition, and stable under 2-pullbacks.   Weak equivalence [A<-E->B] is an equivalence relation. [cf anafunctor]

Proposition: Si C et D sont internes dans S, F:C->D foncteur interne, F est
une weak-equivalence ssi 
(i) F est internalement fully faithfull ie [C1, D1; C0xC0, D0xD0] est un pullback, et 
(ii) la composée C0 x_D0 Iso(D)->Iso(D)->D0
                    C0      -F0-> D0
est un épi régulier. De plus si C et D sont weakly equivalent, on peut
prendre pour E une catégorie interne (=small) aussi.

Def: A et B (S-indexed) sont strong-equivalent si on a F:A->B et G:B->A
tel que GoF=~Id_A et FoG=~Id_B.

Def: A et B sont locally equivalent si il existe U->>1 / A/U strongly
equivalent to B/U. [Note: on dit que U a global/full support]
Note: si on a AC (ie un épi régulier split) loc. equivalent <=> strong equivalent <=> weak equivalent. En général local equivalence does not imply weak equivalence even for internal categories.

Prop: (<=>)
(i) tout objet U->>1 a une section globale 1->U
(ii) A loc. equivalent à B (A, B S-indexed) => A weak equivalent à B.
Prop: (<=>)
(i) S satisfait the internal axiom of choice AC [=pour tout épi régulier
f:J->>I, il existe U->>1 / U*f split]
(ii) pour tout C, D catégories interne de S, F:C->D weak equiv => F:C->D
local equivalence.

Pr (ii)=>(i): si e:B->>A épi régulier, on peut construire la catégorie
interne B_e: B x_A B x_A B ≡> B x_A B => B (plus delta: B -> B x_A B)
et comparer avec A_Id: A ≡> A => A catégorie interne discrète. Alors e
induit un foncteur interne F_e: B_e -> A_Id. 
Par hypothèse on a U->>1 tel que Uxe: U* B_e -> U* A_Id a un
inverse; comme U* A_Id est discrète cela montre que e splitte locally.

Résumé: strong equiv => weak equiv
                     <= si AC
        strong equiv => local equiv
                     <= si global section pour U->>1
        weak equiv => local equiv si IAC.
Donc en particulier sous AC toutes les notions sont équivalentes.

$ 2 STACKS FOR THE REGULAR EPIMORPHISM TOPOLOGY:
Soit phi: J->>I un épi régulier, J'=J x_I J et J''=J x_I J x_I J
On a J''≡>J'=>J, diagramme simplicial tronqué.

Une donnée de descente pour un objet a dans A^J est la donnée d'un isomorphisme \pi_0^* a=\pi_1^* a dans A^J' tel que le diagramme qui va bien commute dans A^J''; un morphisme f:a->b est compatible avec la descente si le diagramme qui va bien avec f:\pi_i*a -> \pi_i* b commute dans A^J'.

Si a \in A^I, alors $phi* a$ a une donnée de descente.
A (catégorie S-indexée) est un stack si on a une équivalence de catégorie
$a -> phi* a$ entre A^I et les données de descente sur A^J.

Reformulation Prop 2.2: A est un stack ssi pour tout e:J->>I épi régulier, le
foncteur interne de (1.12) F_e: J_e -> I_id induit une équivalence
A^{F_e}: A^{I_disc}->A^{J_e} de catégories S-indexées.

(2.3) PROPOSITION (Bénabou and Roubaud [101]). Let A be an S-indexed category for which \Sigma (or \Pi) exists and satisfies the Beck condition. Then A is a stack iff for every regular epi a: J -> I, the functor a*: A^I -> A^J is tripleable (resp. cotripleable).
(2.4) COROLLARY. Any finitely complete exact category S, indexed by itself in the usual way, is a stack. (Plus généralement, si F:S->S' foncteur exact de catégories régulières, alors si S' est exacte finiment complète, S'/S est un stack,
où S'/S est indexée par (S'/S)^I=S'/FI.
(2.6) COROLLARY. If S is a topos and E an S-topos, then E is a stack over S.

We pointed out in the proof of ( 1.12 ) that, if a: J -> I is a regular epi in S , the internal functor Fa: Ja -> I_id is a weak equivalence functor. Then in (2.2) we saw that to be a stack, A must have the property that A^Fa be an equivalence for all regular epis a. We may ask whether arbitrary weak equivalence functors do not play the same role, and indeed they do, as the following shows.
(2.7) PROPOSITION. An indexed category A is a stack iff for every weak equivalence functor F: B -> C, the functor A^F: A^C -> A^B is an equivalence of indexed categories.
(2.8) COROLLARY. For any weak equivalence functor F: B -> C between S-indexed categories, where S is exact, the induced functor S^F: S^C -> S^B is an equivalence. Also, if S satisfies the axiom of choice, every S-indexed category A is an S-stack. 
(2.9) COROLLARY. If A is a stack and D is any indexed category,then A^D is also a stack.
(2.11) COROLLARY. Let F: A -> B be a weak equivalence functor between S-indexed categories where B is a stack. Then F: A -> B is « the » associated stack of A.
2.12) COROLLARY. Let A and B be indexed categories and let F:A->Abar, G:B->Bbar be weak equivalence functors with Abar and Bbar stacks. If A =_weakly B, then Abar = Bbar, and conversely.

$ 3 Exemple: S=Set^2

#### Bunge (1979): Stack completions and Morita equivalence for categories in a topos
http://www.numdam.org/item?id=CTGDC_1979__20_4_401_0

$ 1 THE S-INDEXED CATEGORY OF S-ESSENTIAL POINTS OF AN S-TOPOS.

E/S topos; Pointess_S(E)=locally connected geom morphism S->E au dessus de S (=S-essential points)
C'est une catégorie indexée par Pointess_S(E)^I={S/I -> E (loc. connected)}
au dessus de S, le pullback de J->I dans S étant donné par S/J->S/I dans S
qui est loc. connected.

Here are two «essential» facts about Pointess_S(E). One says that it is a stack. The other is the indexed version of the property which left continuous Set-valued functors possess; that of being representable.

(1.1) THEOREM: Pointess_S(E) est un stack.

(1.2) PROPOSITION. Let f: E -> S be an S-topos.
(i) Let phi: S->E (over S ) be an S-essential point of E. Then,there exists X \in |E| and a natural isomorphism phi* =~ hom_E(X,-).
(ii) Let phi: S/I->E (over S ) be an I-indexed family of S-essential points of E, i.e., an S-essential geometric morphism as indicated. Then, there exist an I-indexed family C: X ->f*I in E/f*I and a natural isomorphism 
\phi* =~ Hom_E/f*I(C, \Delta_I) 
where \Delta_I: E->E/f*I takes Y \in |E| to Yxf*I -> f*I.

Preuve: (i) X est donné par phi_! 1. (ii) X->f*I est donné par phi^I_!(I->IxI)

Note: si C est une catégorie interne, by (1.1), Pointess_S(S^C°) is a stack but need not be the stack completion of C although there is a canonical indexed functor [C] -> Pointess_S(S^C°).

$ 2. STACK COMPLETIONS OF LOCALLY INTERNAL INDEXED CATEGORIES.

Let A be an S-indexed category with small homs, so that there is defined the Yoneda embedding. Yon: A -> S^A° is an indexed functor.
Def: an object X of S^A° is locally representable if there exists K with global
support and x \in A^K tel que Yon^K(x)=~K*X.
Def: an object I-indexed X of (S^A°)^I is locally representable if there exists
f:K->>I and x \in A^K tel que Yon^K(x)=~f*X.

Remark 1: si A=[C] vient d'une catégorie interne, une famille C:X->Delta I
de S^C° ->\Gamma <-\Delta S est loc. représentable si il existe K->>I épi
régulier, un morphisme c:K->C_0 et un morphisme f: X x_{\Delta I} \Delta K
-> C_1 tel que f soit le pullback de \Delta c: \Delta K -> \Delta C_0=C_0xC_0.

(2.3) PROPOSITION. For a locally internal S-indexed category A, the S-indexed category Atilde of locally representable objects is the stack completion of A
- En particulier on a un morphisme (fully faithfull) L:Atilde->Pointess_S(S^A°)
- Prop 2.5: A est un stack ssi F:A->Atilde est une équivalence de
  catégories S-indexées

Remark 2: F: C -> Ctilde peut aussi être défini directement via
si c:I->C0, alors Fc est la flêche X->I où X est le pullback de Delta I
x_{C0xC0} C1. Au vu de la remark 1 c'est juste le Yoneda embedding extended
to families.
On en déduit L:Ctilde->Pointess(S) ainsi: si X->Delta I est loc
représentable I-indexed family of S^C°, on a un morphisme S-essentiel
φ:S/I->S^C° via φ*= Hom_{S^C°/Delta I}(X->Delta I, Δ_I .)

On a le diagramme:
φ: S/I -> S^C°
   S/K -> S/C0
où K->>I et K->C0 rendent X->Delta I loc représentable.
Ainsi un point S-essentiel est loc représentable si il vient d'un tel
diagramme, où S/K->S/C0->S^C° se voit comme un point représentable.

Exemples: 
(1) In [9, Lesson 3], Lawvere discusses several examples which illustrate well how the notion of stack completion unifies the facts that a scheme is locally affine, a vector bundle is locally trivial, and Azumaya algebra is locally a matrix algebra. For instance, if X is a manifold admitting partitions of unity, then, as a category object in sh(X), the category of vector bundles of finite type is the stack completion of that of trivial vector bundles. The other examples take place in the Zariski topos.
(2) For a topos S with natural number object, Sfin the internal category of finite sets, has a stack completion: the S-indexed category of locally finite sets. In general, a topos S need not have stack completions for its category objects; an example due to A. Joyal is mentioned in [10]. However, it follows from Lemma 8.35 of P. Johnstone [8],that Grothendieck toposes, because of the existence of a generating set,do have small stack completions for their category objects.
(3) Let S be a topos, G a group object in S . We may regard G as a category object in S, and as such, describe its stack completion. A right G-set X with action x: XxG -> X is called a right G-torsor (cf.[8], Section 8.3) if X ->> 1 and XxG -> XxX is an isomorphism. G itself, with action m: G x G -> G multiplication, is a right G-torsor, the trivial one. By definition then, a right G-torsor is locally isomorphic to the trivial G-torsor. Hence, G-torsors form the stack completion of G . Torsors play an important role in non-abelian cohomology (cf.Giraud [6] ) and are the key to understanding stacks.

$ 3. KAROUBIAN ENVELOPES OF INTERNAL CATEGORIES

Si C est une catégorie interne, on peut construire U:C->Chat (Karoubian
enveloppe of C / the closure of C under splitting of idempotents) tel que u
est pleinement fidèle, et les idempotents dans Chat splittent (et Chat
universel pour cette propriété).
Prop 3.4.2: U est une équivalence de catégories internes ssi les
idempotents splittent dans C.

Prop 3.3: U induit une équivalence de préfaisceaux S^U: S^Chat° -> S^C°.

$ 4. S-ATOMIC FAMILIES OF PRESHEAVES.
Note: if S=Set (ou a AC), alors C->Pointess_S(S^C°) est la Karoubian
enveloppe de C, ie = Chat.

In the classical case (S = Set), every atom is the retract of the representables. Here we can only have, in general, the local version of this result.

(4.2) PROPOSITION. In S^C°, every S-atomic family is locally the retract of representables. [Et réciproquement, cf la preuve de la prop 4.3]

(4.3) PROPOSITION: Il existe M: Chat -> Pointess_S(S^C°) tel que
MoU = H: C->Pointess_S(S^C°) (à un iso canonique près),
M^I est pleinement fidèle pour tout I et embed Chat^I dans les points
essentiels qui sont des retracts de représentables, et M est une weak
equivalence de foncteurs.

(4.3.1 ) There exists an equivalence of S-indexed categories:
S-Atomic(S^C°)=~Pointess_S(S^C°).
Preuve: on utilise le fait que la famille des représentables
C_1 -> Delta C_0 est S-atomique dans S^C°.

$ 5. MORITA EQUIVALENCE FOR CATEGORY OBJECTS IN A TOPOS

On a donc C -F> Ctilde -L> Pointess_S(S^C°)
            -U> Chat   -M>
où F et M sont des weak-equivalences.
Si les idempotents splittent dans C (<=> U est une équivalence), alors L
est un weak equivalence de stack, donc une strong equivalence:
Ctilde=Pointess_S(S^C°).

(5.2) THEOREM. Let S be a topos and let C, D be categories in S. (<=>)
(i) C and D are Morita equivalent (ie S^C° et S^D° sont des catégories S-indexed équivalentes)
(ii) Chat and Dhat are weakly equivalent.
(iii) Chattilde and Dhattilde are equivalent. [Note: Chattilde est
simplement Pointess_S(S^C°)]

(5.3) REMARKS. In the presence of the axiom of choice for S, (5.2) says that C and D are Morita equivalent iff Chat and Dhat are equivalent categories, as every category object is a stack. This result has been known for some time (cf. [7,2]), at least when S is Set.

On dit que C est good si U et F sont des équivalences. 
- Si C good alors C et Pointess_S(S^C°) est une équivalence, donc 
- Si C et D good, C et D sont Morita equivalent ssi ils sont equivalent.

#### Marta Bunge (2008): Intrinsic  n-stack  completions  over  a  topos
http://www-lmpa.univ-littoral.fr/CT08/slides/Bunge.pdf

* Rappels sur les 1-stack

Proposition. A fibration A/S is a stack iff for every weak equivalence functor F:B->C in S, A^F: A^C->A^B is an equivalence of fibration.
[weak equivalence: essentially surjective + fully faithfull où essentially
surjectif = surjectif quitte à prendre un pullback]

Corollaire: si F:A->B est une weak equivalence et B est un stack, alors B
est la stack complétion.

Exemple 1: dans le topos de Zariski, on a une weak équivalence entre les
free U-module de rang fini et les U-modules projectifs de rang fini, où U
est l'anneau générique. On en déduit:
  - qu'on a une équivalence quand pour un anneau local L
    (en effet L est le tiré en arrière d'un morphisme géométrique
    Set->Zariski, donc ça préserve l'équivalence, qui est forte car Set a
    AC)
  - dans Sh(X), avec L=sheaf of germs of R-valued continuous function,
    cette weak equivalence induit une strong équivalence sur les stack
    complétion: there  is  an  equivalence  between  the  categories  of
    real vector bundles over X and that offinitely generated projective
    Cont(X,R)-modules.

Theorem A (Bunge-Paré, 1979): the fibration cod: S->S is a stack
Note: as base S needs to be a topos, but as fibration over itself S needs
only be a Barr-exact category.

Theorem B (Bunge 1979): the stack completion of a groupoid G is given by the
factorisation of Yoneda: [G]->S^(G^op) by [G]->LocRep(S^G^op).

Theorem C (Bunge 1990): For an étale complète groupoid G which is not empty
and connected, LocRep(S^G°)=~Tors(G)=~Points(S^G°).

Preuve: [G]->Tors(G) defined by regarding G as the trivial G-torsor is a
weak equivalence, and Tors(G) is a stack. So Tors(G) is the stack
completion of G. D'autre part Bunge 1979 montre que
LocRep(S^G°) s'identifie à la fibration PointEss(S^G°) et Bunge 1990 a la
fibration (localic - in this case discrete) Point(S^G°).

On retrouve Diaconescu 1995: que S^G° classifie les G-torseurs.
Cohomology non abélienne: H^1(S,G):=\pi^0(Tors^1(G)) où \pi^0=isomorphism classes.

Bunge 2001: pour un Galois topos G sur S, on défini le Galois groupoid
G_U=Iso(p_U) où U est un cover universel dans G. Alors \Pi_1(G) la stack
complétion de G_U s'identifie à la fibration Points(G).

Dans le cas d'un topos loc. connecté, si U \subset V sont des covers avec
groupoid de Galois G_U et G_V, GG_U et GG_V leur topos (de Galois) classifiant
et p_U: S/e!U->GG_U leur canonical bag of points [Rappel de l'article
précédent: on peut construire GG_U comme pushout de [E/U, E; S/e!U, GG_U]]
alors Hom(G_U, G_V)=Top_S(GG_U,GG_V)+ où le + signifie commutation avec les
canonical bag of points.
Ce pendant si on prend les stack completion Gc_U et Gc_V (qui ont les même
topos classifiant); on a Hom(Gc_U, Gc_V)=Top_S(GG_U, GG_V)
ie la multiplicité prise en compte par la stack complétion permet
d'éliminer la dépendence en les points.

* n-stacks
n-fibration: 1-fibration tel que le (n-1)-foncteur induit sur les Hom est une
(n-1)-fibration, stable par précomposition.

Si S topos, une n-fibration A->S est un n-stack si pour tout épi e:J->>I dans
S, le n-functor e:A^I->A^J est de n-descent effective

weak-n-equivalence: essentiellement surjectif (ie surjectif localement, ie
surjectif quitte à pullbacker par J->>I) et tel qu'il induit une (n-1)-weak
equivalence sur les Hom. A weak-0-equivalence est un morphisme A->B qui est
un isomorphisme.

Prop: - Une n-fibration est un n-stack si toute weak n-equivalence F:B->C
induit une strong equivalence A^F: A^C->A^B.
      - Si F:A->B est une weak n-equivalence et B un n-stack, (B,F) est la
n-stack complétion de A.

n-Kernels: un morphisme e:J->I induit un n-foncteur F_e^n: J_e^n->I_dis^n,
the n-kernel of e. Par exemple J_e^2 est J x_I J x_I J ≡> J x_i J -> J.
Prop: si e epi, F_e^n est une weak equivalence.

Soit Stack la 2-catégorie dont les objets sont les 1-groupoids 1-stack dans
S, les 1-morphismes les foncteurs G->H et les 2-morphismes les
transformations naturelles.
On a une 2-fibration Stack -> S, où Stack^I := Stack/I_dis

(ASC): on dit que S a ASC si l'inclusion Stack -> Gpd admet un biadjoint à
gauche, ie on peut construire la stack complétion internalement.

Hermida's theorem (2004): une 2-fibration A->Cat a "BCC" si le changement
de base u* admet un adjoint à gauche \Sigma_u qui satisfait l'équivalent
des conditions de Beck Chevalley.

Th 1: Si A->Cat a "BCC", alors on a l'équivalent des conditions de Beck
pour la 1-descente: pour tout q:T->Q dans Cat, on a une biequivalence
Des^2_q(A) =~ 2-algèbres pour la 2-comonade q* \Sigma_q.
Th 2: any 2-regular eso in Cat est de 2-descente effective pour la
fibration canonique cod: Fib -> Cat.

Theorem 2A: Si S satisfait ASC, cod: Stack -> S est un 2-stack.

Pr: par le théorème de 2-comonadicité, il faut montrer que si e:J->>I
e*: Stack/I_dis -> Stack/J_dis reflète les équivalences.
On factorise J_dis -> J_e -> I_dis, or J_dis -> J_e est strong, donc un
2-regular eso, donc de 2-descente pour cod:Fib->Cat par Th2, donc si e*x
est une équivalence, E*x est une équivalence où E: J_e->I_dis.
Mais si E*x: E*G->E*H est une équivalence, et E*G->G, E*H->H sont des
weak-equivalence car E* est une weak equivalence, donc x:G->H est weak,
mais G et H sont des stack donc x est une strong equivalence.

n-groupoids: nGpd(S)->(n-1)Gpd(S) est une fibration exacte. [on peut
définir nGpd dans n'importe quelle catégorie S exacte]
Def: un 2-gpd G est un 1-stack si G_1 est un 1-gpd 1-stack.
     Ainsi un 2-gpd 2-stack est un 2-gpd 1-stack.

Theorem 2B: Si S satisfait ASC, G un 2-gpd 1-stack, alors sa 2-stack
complétion est LocRep(Stack^G°).

2-gerbes: G est une 2-gerbe si il existe un (non-empty, connected) 1-gpd
1-stack A (un bouquet) tel que G =~ Equ(A). G est donc un 2-gpd 1-stack.

Si G est un 2-gpd, le 2-gpd Tors^2(G) pour objet les G-2-Torsor, ie un
groupoid stack T tel que T_0->>1 a on a a:TxG->T tel que TxG->TxT est un
iso; pour 1-cell les G-equivariant functor T->R, et pour 2-cell les
transformations naturelles qui sont des isos [c'est probablement
automatique pour une transformation naturelle sur un torseur]

Th 2C: Si S satisfait ASC, et G une 2-gerbe, alors on a une biequivalence
LocRep(Stack^G°)=~Tors^2(G).
Autrement pour toute 2-Gerbe G,  le 2-topos Stack^G° classifie les G-2-torsors.
H^2(S,G):=\pi_0(Tors^2(G)) où \pi_0 signifie "classe d'équivalence".

Conjecture: Si S satisfait ASC^n, si G est un (n+1)-groupoid n-stack (par
ex une (n+1)-gerbe) alors la (n+1)-stack completion de G existe en tant que
(n+1)-fibration et est donnée par la weak (n+1)-equivalence
G->LocRep((Stack^n)^G°).

### Etendues, stacks and groupoids:

#### DORETTE A. PRONK (1996): Etendues and stacks as bicategories of fractions
http://archive.numdam.org/ARCHIVE/CM/CM_1996__102_3/CM_1996__102_3_243_0/CM_1996__102_3_243_0.pdf
=> bicategories of fractions: Hom(C[W^-1],D) =bi Hom_W(C,D)

The category of toposes and isomorphism classes of geometric morphisms can
be viewed as a category of fractions in the Gabriel-Zisman sense of a
specific category of [localic] groupoids with respect to the class of weak
equivalences (see (Moerdijk, 1988b)). 
B: [Etale-Compl.-Groupoids][W-1] =1 [S-toposes].
[W: esentially surjective fully faithfull morphisms of groupoids;
Etale-Complete Groupoid=groupoid G tel que G1=>G0 est le pullback dans la
catégorie des topos de G0=>BG. Un groupoïde étale est étale complète.]

This equivalence restricts to the following B: [Etale-Groupoids][W^-1] =1
[Etendues], where [Etendues] is the category of étendues and isomorphism
classes of geometric morphisms, and [Etale Groupoids] is the category of
étale groupoids in the category of sober topological spaces and isomorphism
classes of continuous maps (see Section 1) and W is the class of weak
equivalences.
[Note: etendue = Grotendieck topos E with an object U->>1 / E/U=Sh(X) pour X topologique;
THEOREM 9. A Grothendieck topos E is an étendue if and only if there exists an étale groupoid G such that E = BG [=G-equivariant sheaves on G_0].]

We want to understand this equivalence also on the level of 2-cells.
THEOREM 1. There is a canonical equivalence of bicategories (T1-Etendues) =bi (T1-Etale Groupoids)[W^-1]. Here (T1-Etendues) is the 2-category of toposes which roughly speaking locally look like a T1-space (= is locally Sh(X) for X T1), and (T1-Etale Groupoids) is the 2-category of étale groupoids in the category of T1-spaces. W denotes here and in the following the class of weak equivalences of groupoids.
Note: this equivalence is the restriction of the equivalence
THEOREM 27: (2-Iso-Etendues) =bi (Etale Groupoids) [W^-1].
[2-Iso-Etendue=category of etendues with just the isomorphic 2-cells; a
T1-Etendue is a 2-Iso-Etendue]

THEOREM 4. There is an equivalence of 2-categories (Etendues) ≃2 (Topological Stacks).
COROLLARY 5. There is a canonical equivalence of bicategories (Topological Stacks) ≃bi (T1-Etale Groupoids) [W^-1].
[A un topos E, on associe S(E) sur Top par S(E)(X)=Hom_Geom(Sh(X),E)
Bunge: S(E) est un stack, et si G est étale complete groupoid, S(G) est la
stack completion de G pour les surjections ouvertes.
Theorem 30: si E est une étendue, S(E) est un stack topologique
THEOREM 34. S defines an equivalence of 2-categories (2-Iso-Etendues) ≃ (Top-stacks)
COROLLARY 35. There exists an equivalence of bicategories (Top-Stacks) ≃ (Etale-Groupoids) [W^-1]]

THEOREM 6. There is an equivalence of 2-categories (Differentiable Etendues) =2 (Differentiable Stacks).
COROLLARY 7. There is a canonical equivalence of bicategories (Differentiable Stacks) =bi (Differentiable Groupoids) [W^-1].
[Differentialbe etendue = ringed Grothendieck topos (E,R) tel que
localement à U->>1, (E/U, p_U^*R)=(Sh(M), C^infini(M)) pour une manifold M,
non nécessairement Hausdorff.
It is not difficult to see that the correspondence between étendues and étale groupoids restricts to a correspondence between differentiable étendues and étale groupoids in the category of differentiable manifolds (differentiable étale groupoids for short):
THEOREM 39. A ringed Grothendieck topos (E, R) is a differentiable étendue if and only if there exists a differentiable étale groupoid G such that (E, R) ≃ (BG, C^infini(G0)).
Since manifolds are automatically T1-spaces we have:
THEOREM 40. The functor B induces an equivalence of bicategories (Differentiable-Etendues) ≃ (Differentiable-Etale-Groupoids)[W^-1].
]

THEOREM 2. There is a canonical equivalence of bicategories: (Algebraic Stacks) ≃bi (Algebraic Groupoids) [W^-1].
THEOREM 3. There is an equivalence of 2-categories: (Algebraic Stacks) =2 (Algebraic Etendues).
[Grothendieck topos E=alg etendue if there exists U->>1 tel que
E/U=Sh(X_étale) et E/UxU=Sh(Y_étale), X, Y schémas et Y=>X étales séparées surjections.
Algebraic groupoid=étale separated groupoid.
THEOREM 47. This functor B: ( Alg. Groupoids) → (Alg. Etendues) induces an equivalence of bicategories (Alg. Groupoids) [W-1] =bi (Alg. Etendues).
THEOREM 50. The functor S: (Alg. Etendues) → (Alg. Stacks), is an equivalence of 2-categories.]

Résumé: B induit une équivalence de bicatégorie
groupoides T1-étales/différentiels/algébriques vers les étendues T1/différentielles/algébriques
et le foncteur S une équivalence de 2-catégorie des 
étendues T1/différentielles/algébriques vers les stacks T1/différentiels/algébriques.

#### Every étendue comes from a local equivalence relation; Anders Kock, Ieke Moerdijk

Une étendue est un topos E avec U->>1 tel que E/U localic.
Si r est une relation d'équivalence locally simply connected sur une locale
M, alors Sh(M,r) les r-invariants sheaves on M forment une étendue, et
toute étendue est de ce type.

Galois
------

* https://core.ac.uk/download/pdf/81935271.pdf
  JOURNAL OF ALGEBRA 132, 27&286 (1990) 
  Pure Galois Theory in Categories, GEORGE JANELIDZE 
 This is a next step of abstraction in Galois theory after the theories’ of M. Barr [ 1,2] and A. Joyal and M. Tierney [22]. I call it “pure” because there are no sets, toposes, and profinite spaces; in particular Galois groupoids are internal groupoids in an arbitrary category and so are very far from the groups of automorphisms in any sense.

 Voir aussi https://mathoverflow.net/questions/144708/janelidzes-galois-theory
 qui cite le livre: Galois Theories by Francis Borceux, George Janelidze

### Catégories Galoisiennes

#### Dubuc (2000): On the Galois Theory of Grothendieck
On the Galois Theory of Grothendieck (2000), E.J. Dubuc, C. Sanchez de la Vega

https://arxiv.org/abs/math/0009145
       In this paper we deal with Grothendieck's interpretation of Artin's interpretation of Galois's Galois Theory (and its natural relation with the fundamental group and the theory of coverings) as he developed it in Expose V, section 4, ``Conditions axiomatiques d'une theorie de Galois'' in the SGA1 1960/61.
    This is a beautiful piece of mathematics very rich in categorical concepts, and goes much beyond the original Galois's scope (just as Galois went much further than the non resubility of the quintic equation). We show explicitly how Grothendieck's abstraction corresponds to Galois work.
    We introduce some axioms and prove a theorem of characterization of the category (topos) of actions of a discrete group. This theorem corresponds exactly to Galois fundamental result. The theorem of Grothendieck characterizes the category (topos) of continuous actions of a profinite topological group. We develop a proof of this result as a "passage into the limit'' (in an inverse limit of topoi) of our theorem of characterization of the topos of actions of a discrete group. We deal with the inverse limit of topoi just working with an ordinary filtered colimit (or union) of the small categories which are their (respective) sites of definition.
    We do not consider generalizations of Grothendieck's work, except by commenting briefly in the last section how to deal with the prodiscrete (not profinite) case. We also mention the work of Joyal-Tierney, which falls naturally in our discussion.
    There is no need of advanced knowledge of category theory to read this paper, exept for the comments in the last section.

$ 2 Transitive actions of a discrete group.

Si A objet de C, G=Aut(A), G agit à gauche sur [A,X], on note le G-set
résultant [A,X]_G. On a donc [A,X] = Hom(G, [A,X]_G), ie A est la valeur de l'adjoint à gauche A x_G - du foncteur [A,-]_G évalué en G: A= A x_G G.
On vérifie A x_G G/H = A/H (quotient catégorique, si il existe)

$ 2.5 . Axioms for the representable connected case

RC0) For all X in C there exist A → X , and every arrow A → X is a strict epimorphism
RC1) The quotient A → A/H of A by any subgroup H ⊆ Aut(A), exists in C and it is preserved by the functor [ A, − ].
RC2) Every endomorphism of A is an automorphism. That is [A,A] = Aut(A).

On a [A,A]->[A,A]/H->[A,A/H] et RC1 dit que la dernière flêche est une
bijection.

Th 2.11: si C satisfait RC*, alors A x_G - existe et [A, -]_G et A x_G -
induisent une équivalence de catégorie C =~ G-ens-transitif.
Ainsi si e:A->X, X=A/Fix(e); et G/H=[A,A]/H =~[A, A/H], donc
A/H=A x_G [A,X]_G si H=Fix(e) et [A, A/H]=[A, A x_G G/H]_G.

$ 3.1 . Axioms for the connected case
F: C->Ens
C0) For all A ∈ C , F(A) != ∅ and every arrow A → B is an strict
epimorphism (in this case the category ΓF of elements of F is actually a
poset, see remark 3.2). [=> F faithfull, reflects mono and iso]
C1) Given any object A and a finite group H acting on A , H → (Aut(A))^op, the quotient A → A/H exists and it is preserved by F (see definition 2.2).
C2) F(A) is finite ∀A∈C and F preserves strict epimorphisms [this implies [A,A]=Aut(A)].
C3) The poset ΓF has all finite meets, in particular it is filtered
(so F is a prorepresentable functor, ie F=[P, -] où P est un proobjet; donc
ΓF devient la catégorie P/C, et tout morphisme P->A est un épi dans Pro(C),
vu que ce sont des monos dans Ens^C)

Déf: a:P->A est Galois ssi a*: Aut(A) -> [P,A] est une bijection.
On définit alors la sous-catégorie C_A des X tels que [A,X]=~[P,X].
Sur C_A, F devient alors [A,-]
Note: A Galois et C_A ne dépendent pas du choix de a.

Th 3.12: C_A satisfait les props RC* [par ex le quotient par H est celui
dans C], donc est équivalente à G-ens-transitifs où G=Aut A.

Prop 3.13 (Galois closure): pour tout X il existe A Galois tel que X \in
C_A.
Donc F est limite filtrée des objets Galoisiens A, et C est colimite filtrée
des C_A.

Si x:A->B Galoisien, de [P,B]=~[B,B], et [P,A]=~[A,A], on peut définir
[P,P]  -> [A,A]
  \> [B,B] </
donc [P,P] est une limite proj de groupes finis (où les transitions sont
surjectives), donc [P,P]=Aut(P) est un groupe profini.

Groupe profini: \pi limite proj de groupes finis (où les transitions sont
surjectives).
On le voit comme un groupe topologique \pi (pour la topologie produit des
groupes finis discrets G_i). \pi est donc compact, et \pi->G_i est
surjectif.
Note: une action transitive \pi x E -> E (E ensemble discret) est continue
ssi \pi se factorise par un des G_i, donc la catégorie ctEns^\pi des
actions transitives et continues est la limite inductive fitrèe des
sous-catégories tEns^G_i des actions transitives des G_i.

Revenons à la catégorie C: les équivalences C_A =~ tEns^G(A) commutent avec
les inclusions C_A \subset C_B pour x:B->A et tEns^G(A) \subset tEns^G(B)
respectivement.

Propo 3.20: si X \in C, on a une action à gauche transitive continue de
\pi:=[P,P]^op sur [P,X]: (h:P->P).(x:P->X)=xoh.

Theorem 3.21: [P, -]_pi a un adjoint à gauche P x_pi - qui induit une
équivalence de catégories C =~ ctEns^\pi.

$ 4 All continuous actions of a profinite group. (ie the non connected case)

Grothendieck considered a category with, in particular, finite sums, and
proved that it is equivalent to the category of finite continuous actions
on a profinite group. However, in our proof of this result it can be seen
clearly that the argument goes through if one assume arbitrary sums, and
the conclusion is now that the category is equivalent to the category (in
this case a topos) of all continuous actions of the same profinite group.
We shall write this two results in parallel:

Let C be a category and F:C→Set a functor.
G0) The full subcategory of ∫_F C on the finite objects [X finite if F(X)
finite set] is cofinal.

Axioms on C:
G1) C has all finite limits (<=> a 1 et fiber products)
G2) C has an initial object, [finite] coproducts and quotients by finite groups
G3) C has strict epi-mono factorisation; et si X->>I-->Y alors I est a
direct summand of Y: Y= I \cup J.

Axioms on F:
G4) F is left exact, ie preserves finite limits [avec G0 ça implique F proreprésentable]
G5) F preserves initial object, [finite] sums, quotients by finite group actions and sends strict epimorphisms to surjections
G6) F reflects isomorphisms

We shall see that every object of C is a finite direct sum of connected objects (connected = non somme disjointe non vide) and that the full subcategory of non empty connected objects satisfy axioms C*.

Prop 4.2: [C est extensive.]
Remark 4.3. Since pulling back along any arrow preserves coproducts, it follows immediately that if A is connected, the representable functor [A, −] preserves coproducts.
Remark 4.4. The fact that F preserves [finite] coproducts (G5) means in a sense that P is connected.

Prop 4.8: A finite non emtpy connected  in C <=> tout P->A est minimal (ie
ne se factorise pas par un sous objet) et [P,A] \ne 0,  <=> il existe un
P->A minimal.
Prop 4.9: les objets minimaux sont cofinals dans dans le diagramme Θ_F
des objets finis de F (qui est cofinal dans ΓF par G0); donc on peut même
se restreindre aux objets finis connexes. Corollaire: tout objet connexe
est fini.

Theorem 4.13: la sous-catégorie des objets connectés satisfait C*.

Theorem 4.16 . Every [finite] object X∈C is a [finite] coproduct of connected objects of C.
[De plus l'union est disjointe car si A et B sont deux sous-objets connexes
de X, alors soit A \cap B=0, soit A=~B]

Prop 4.17: Pour tout X∈C, on a une action continue à gauche de \pi=Aut(P)^op sur
[P,X]=F(X). L'action est transitive ssi X est connecté.

Theorem 4.18: [P,-]_\pi induit une équivalence de catégorie entre C et \pi-cEns, qui se restreint en une équivalence {objets finis de C} =~ \pi-cEnsFinis.

$ V - All actions of a discrete group.

Prop 5.1: Si A est un objet d'une catégorie C, on a une action à gauche du monoïde [A,A] sur [A,X]

We assume now that the category C has coproducts and coequalizers. It is well known and easy to see that the representable functor [ A, − ] has a left adjoint (the “tensor” in closed category terminology) that we denote here A • −, and that it is given by the formula A • S = ∐_S A.
In the case that C=Ens^G (G monoid), alors [G,E]=|E| et G • E = GxE.
On a donc  [A,-]:  C <=> Ens A•-
           |-| Ens^G <=> Ens Gx-
           [A,-]_G C <=> Ens^G
d'où on en déduit si C a les coéqs un adjoint à gauche Ax_G- de [A,-]_G
(using the other two adjointness in the triangle)

Prop 5.2: si C a les coéqs et coproduits (donc toutes les colimites), on
peut construire q: A •|E| -> A ×_G E
comme le coéqualisateur de toutes les flêches g: A->A
                                                  \/ A •|E|
ie q ◦ λ_x ◦ g = q ◦ λ_gx, one for each x ∈ E and g ∈ [ A,A ].

Déf 5.3: A est un générateur si pour tout X
la counité de l'adjonction: A ×_G [ A,X ] → X, est un iso; ie 
si l'évaluation ε: A • [ A,X ] -> X donne X comme A x_G [A,X].

Proposition 5.4 .
Let C be a category with coproducts and coequalizers and A ∈ C .
Then:
i) If A is a generator then the representable functor [ A, − ] reflects isomorphisms.
ii) Assume the representable functor [ A, − ] preserves coproducts and coequalizers. Then, if it reflects isomorphisms, A is a generator.

$ 5.5 . Axioms for the representable case
Consider a category C and an object A ∈ C.
Axioms on C:
R1) C has a terminal object and pullbacks (thus all finite limits).
R2) C has coequalizers.
R3) C has coproducts.

Axioms on A (in terms of the representable functor [ A, − ]):
R4) [ A, − ] preserves coequalizers.
R5) [ A, − ] preserves coproducts.
R6) [ A, − ] reflects isomorphisms.

Theorem 5.6. Let C be any category and A ∈ C as in 5.5. Then the left adjoint A ×_G (−) ⊣ [ A, − ]_G exists and establishes an equivalence of categories.

It is interesting to observe that it is not necessary to assume any exactness properties in the category C. However, if we want to write the axioms R4 and R5 as properties of the object A (projective and connected), then we need some of the exactness properties characteristic of a topos (or pretopos).

Proposition 5.8 . (strict epi - mono factorizations, Tierney-Kelly).  Let C be any category with pull-backs and quotients of equivalence relations which are stable under pulling-back (equivalently, strict epimorphisms are stab le under pulling back). Then C has strict epi-mono factorizations. That is, given any f : X → Y , there is a factorization X e→ I i→ Y where e is a strict epimorphism and i is a monomorphism.
[la définition est bizarre, c'est plus fort que régulier (ou on veut juste
des quotients des kernels pairs), mais plus fort que C catégorie exacte,
car dans une catégorie exacte on veut que le quotient d'une congruence
existe et soit le kernel pair du quotient...]

A relation in X is a subobject of X × X. 
Using pull-backs and images the composition of relations is defined in the usual way as in the category of sets.
If C has unions of denumerable chains of subobjects which are stable under pulling-back, the transitive closure of any relation is constructed as the union of iterated compositions. Thus, if in addition there are finite unions of sub objects (to make a relation reflexive and symmetric), any relation is contained in a smallest equivalence relation, which is generated as described above. Notice that denumerable stable coproducts are sufficient, since unions are the direct image of the induced map from the coproduct.

Proposition 5.10. [infinitary pretopos]
Let C be a Regular Category such that every equivalence relation has a quotient and every denumerable chain of subobjects has an stable union (or denumerable stable coproducts exists in C).  Then, C has coequalizers.  If in addition,
equivalence relations are effective, then any finite limit preserving functor F : C → E into any other such category will preserve coequalizers if it preserves strict epimorphisms and stable denumerable unions (or preserves stable denumer able coproducts).

$ 5.11. Axioms for the representable case (second version)
Consider a category C and an object A ∈ C.

Axioms on C
E1) C has a terminal object and pullbacks.
E2) C has quotients of equivalent relations which are then the kernel pair
of this quotient, and this quotient is stable by pulling back (i.e.
equivalence relations are effective and universal).
=C exact
E3) C has an initial object and coproducts stable by pulling back.
Notice that we do not require that coproducts be disjoint.
= preextensive

Axioms on A :
E4) A is projective
[= the functor [ A, − ] pre- serves strict epimorphisms (this is weaker that the usual me aning of projective, which is defined with respect to all epimorphisms)]
E5) A is connected
E6) A is a generator
Notice that E6) implies that A is non empty.

Remark 5.13. By axiom E3) pulling back along any arrow preserves coproduc ts, then it follows immediately that if A is connected, the representable functor [ A, − ] preserves coproducts.  If the initial object is empty and coproducts ar e disjoint, then the other implication also holds.

Theorem 5.15.
Let C be any category and A ∈ C as in 5.11. Then the left adjoint 
A ×_G − ⊣ [ A, − ]_G exists and establishes an equivalence of categories.

Theorem 5.17.
Let C be any category and A ∈C as in 5.5 but with axioms R2) and R4) respectively replaced by: 
R’2) C has quotients of objects by groups of automorphisms. 
R’4) [ A, − ] preserves quotients of objects by groups of automorphisms. 
Assume that [ A,A ] = Aut(A), then the left adjoint A ×_G (−) ⊣ [A, − ] G exists and establishes an equivalence of categories.

Note: dans ce cas on peut définir Ax_G- informellement ainsi:
A • S = {(a,x)/ x ∈ S and a ∈ the x-copy of A } Then the object A ×_G E , G = Aut(A) op , can be described informally as the object A •| E | divided by the equivalence relation (clearly reminiscent o f the tensor product construction) defined by pairs (ag,x) = (a,gx).

Theorem 5.20. Let C be any category and A∈C as in 5.11 but with E2) replaced by: E’2) In C actions of groups by automorphisms are effective. Assume that [ A,A ] = Aut (A) , then the left adjoint A × G (−) ⊣ [ A, − ] G exists and establishes an equivalence of categories. 

$ 6 Final Comments

We can easily generalize the results in section V by replacing the single object A by a (small) set of objects and its associated full subcategory A ⊂ C.  In this case the category Ens-G becomes the presheaf category Ens^A^op and the restriction of the Yoneda embedding h : C →Ens^A^op corresponds to the functor [A,−]_G. This generalizes proposition 5.1.  The left adjoint to h is given by a Kan extension that we denote k : Ens^A^op →C. Given E∈Ens^A^op, consider its canonical diagram ΓE so that E = colim_{(a,A)∈ΓE} [−,A]. Then k(E) is the corresponding colimit taken in C: k(E) = colim_{(a,A)∈ΓE} A.

We pass now to the axiom set 5.11.  Axioms E1), E2) and E3) are respectively conditions a), c) and b) in Giraud’s Theorem [[1], IV, 1.2]. A xiom E6) says that the category C has an (small) generating set, which is condition d) in that theorem. We have in addition axioms E4) and E5), which say that the object s in the generating set are projective and (non-empty) connected. Thus, theorem 5. 15 is Giraud’s Theorem in the particular case in which E4) and E)5 hold. It gives a characterization of categories of presheaves. Compare also with [[1], IV, 7.6], where conditi on [ii): the full subcategory of (non empty) connected projective objects is generating] in exercise 7.6 d) consists precisely on the axioms E4), E5) and E6) together. This characterization is due to J. E. Ross 

Giraud’s Theorem can be analyzed as follows: Assume axioms E1), E2), E3) and E6) (not E4) and E5)), that is, Giraud’s assumptions. Then we have an adjunction as indicated above (proposition 5.2. Axiom E6) says (tautologically) that the counit of this adjunction is an isomorphism, making C a full subcategory of Ens^A^op. How can we make the unit of the adjunction in Ens^A^op be an isomorphism without E4) and E5) ?, (as we do in theorem 5.11). Giraud’s answer is to force this un it to be an isomorphism by means of the appropriate Grothendieck topology (here it is probably needed that coproducts be disjoint in addition to stable). All this relativices to the additive case, where, in the place of sets, the category of abelian groups is the base category. In fact, it was this case that was developed first.

The statements and their proofs are essentially the same. A conspicuous difference is that now preservation of coproducts by the representable functor [ A, − ] means that the object A is “small”, instead of “connected”. A coproduct of two small objects is still small, and this implies that the category of modules over a ri ng does not characterize the ring (while the category of actions of a monoid does characterize the monoid). An earlier instance of the additive case of theorem 5.15 are the Morita equivalences.

$ 6.2 . On sections III and IV
In section III, theorem 3.21, we proved a characterization of the category of transitive actions of a profinite group by “passing into the limit” (theorem 2.11 in section II on transitive actions of a discrete group) in a filtered colimit of categories.  Using this, we show in section IV Grothendieck’s theorem in [6]. This theorem (4.18 in section IV) implies that a connected locally connected [[1], IV, 8.7 , l)] boolean topos with a “profinite point” (that is, its inverse image functor satisfies axiom G0 in 4.1) is the topos of continuous π-sets for a profinite group π (locally connected + boolean = atomic, see [[8], Ch. 8]). A careful analysis shows, in the light of axioms 3.1 and proposition 3.6, that axiom G6) can be omitted in 4.1.
Our proof shows that Grothendieck’ theorem is the result of “passing into the limit” (theorem 5.17 in section V on all actions of a discrete group) in a filtered inverse limit of topoi. Warning: such a limit is not a colimit of categories and inverse image functors, but, nevertheless, we have such a colimit on the sites, (see [[1], VI, 8.2.3, 8.2.9], also [10])
This theorem can be generalized to the case in which the point is not any more “profinite”. Here it is necessary to consider the diagram of discrete groups without passing to its inverse limit group, since the projections from this limit can not any more be guaranteed to be surjective [[1], IV, 2.7]. Thus, the topological group is replaced by a whole system of discrete groups, called a “progroup” by Grothendieck. The corresponding theorem is a theorem of characterization of the category of all actions (as defined by Grothendieck) of a progroup. In this more general context the existence of the Galois Closure can not be proved as in proposition 3.13. It is necessary to introduce an stronger (than just finite limit) preservation property in the functor F. This condition (preservation of cotensors = arbitrary products of a same object) replace the finiteness
condition G0.
In [[9], VIII, 3. theorem 1] the finiteness condition in theorem 4.18 it is also removed. This is done following a different line that the one sketched above. As it was stressed by Joyal since the early seventies, topological spaces are replaced by “spaces”, which are the dual objects of locales (sup-complete distributive lattices). The profinite (topological) group becomes an spatial group, which in general will not have sufficiently many points, and thus it will not be a topological group in the classical sense. An spatial group is a more general concept that a progroup. The topos of continuous π-sets of an spatial group satisfy the condition on preservation of cotensors precisely when the spatial group corresponds to a progroup.

#### Des références plus anciennes de Barr
* http://www.math.mcgill.ca/barr/papers/galois.pdf
  Barr: Abstract Galois Theory (1980)
  Conditions caractérisant la catégorie des transitives discrete G-sets for
  a profinite group G.

  https://www.sciencedirect.com/science/article/pii/0022404982900809
  Abstract galois theory II, Michael Barr (1982)
  Galois theory for a connected commutative ring object in any topos.

### Topos Galoisiens

* http://www.cheng.staff.shef.ac.uk/pssl88/pssl88-duncan.pdf
  Gros and Petit Toposes and [link with galois]

#### Moerdijk (1989): Prodiscrete groups and Galois toposes
https://www.sciencedirect.com/science/article/pii/S1385725889800307

  A prodiscrete group is usually taken to  be  a topological group G isomorphic to the limit of a  filtered projective system {Gi} of discrete groups. Even if  all the homomorphisms Gi->Gj in the system are surjections, G may turnout to be the trivialgroup (cf.  1.3below), and this  is the reason why the fundamental group of a  scheme (or more generally of a topos) has  to  be constructed as  a progroup, i.e. a formal inverse system {Gi} of discrete groups. (Another well-known way out is  to restrict oneself to finite coverings only, and construct the fundamental group as  a profinite topological group.) The aim of this note is to point out that this kind of pathology does not occur if one computes the inverse limit  in  a category of generalized spaces, namely locale.

  $1: equivalence between surjective progroups and prodiscrete localic groups.

  $2: if G=(G_i) on construit BG= lim_proj BG_i, c'est un topos de
  Grothendieck pointé; on a Hom(G,H)=Hom(BG,BH).

  $1.4: G localic, G prodiscrete := inverse limit of discrete groups
  <=> the open normal subgroups form a neighboorhood of e:1->G.

  Theorem 1.6: the functor L:progroups -> localic groups, {G_i} -> lim_proj
  dans locale G_i, restrict to an
  equivalence of category {surjective progroups}=~{prodiscrete localic groups}
  
  $2: G groupe localic, BG the topos of G-Set est un topos atomique.
  Le foncteur d'oubli U:BG->Set est l'image inverse d'un point *:Set->BG.

  If f:G->H, on a Bf:BG->BH (morphism de Topos pointés), et si f est une
  surjection ouvert, Bf est atomic connected.

  On a lim_proj B(G_i)=B(lim_proj G_i). De plus on a un (pseudo)pullback
  square Sh(G) => Sets => BG où Set->BG est le point de BG.

  Theorem: Hom(G,H)=Hom(BG, BH) si H prodiscrete.

  $3 Galois topos

  Un atome A de E est normal/Galois si A est un Aut(A)-torseur, ie
  AxAut(A)->AxA est un isomorphisme.
  Galois topos = pointed connected atomic topos generated by its normal
  atoms.

  Un objet X est loc. trivial (ou loc. constant) s'il existe U->>1 et
  un ensemble S tel que UxS =~ UxX au-dessus de U.
  X est dit loc. trivial cover si de plus X->>1.
 Finite limits and colimits of locally trivial objects are locally
 trivial; if X->Y is a morphism of locally trivial objects, then
 im(f)\subset Y is complemented subobject. So if Y is connected, f must
 be epi.

 Theorem: E is a Galois topos (<=>)
 - E=BG pour un groupe localic G prodiscrete
 - E is pointed, connected locally connected et généré par les loc. trivial
   covering
 - E is pointed, connected locally connected et tout objet dans E est une
   somme de locally trivial coverings

  Pr: (1)=>(4)=>(3) est évident. (3)=>(1) est un argument standard de la
  théorie de Galois: on montre que X loc. trivial (via l'ensemble S) cover
  est covered par B=Iso(S,X) et B est une somme d'objets de Galois.
  (2)=>(1): G/U est un atome normal pour tout U normal open subgroup, et
  ils forment un site vu que G est prodiscrete.
  (1)=>(2) Par descente, si p:Sets->E est le point, E=BG(Aut(p)) où on voit
  Aut(p) comme le groupe localic d'automorphisme de p, inclus dans
  \prod_{a atomique} Aut p*(A).

  $ 3.4 Groupe fondamental
  Le groupe fondamental de E \pi_1(E) peut se voir comme satisfaisant
  B(\pi_1(E))=Cov(E), la sous-catégorie pleine de E généré par les locally
  trivial covers of E (c'est un topos de Grothendieck pointé par le
  théorème de Giraud).

  De plus on a Hom(E, B(G))=Hom(B(\pi_1(E)), B(G))=Hom(\pi_1(E), G) si G
  prodiscrete; donc en particulier si G discret, BG classifie les G-torseur
  dans E (=G-principal bundle dans E). De plus dans ce cas, on a
  {isomorphisms class of G-torsors in E}={equivalence classes of continuous
  morphisms \pi_1(E)->G}.

#### Bunge (1990): Classifying Toposes and Fundamental Localic Groupoids
https://www.researchgate.net/publication/230774980_Classifying_Toposes_and_Fundamental_Localic_Groupoids

  Etend la construction de Moerdijck au cas des topos sans points.

  Pour E topos de Grothendieck pointé, on a son groupe fondamental BG qui
  est un progroupe. BG={G-sets}, mais l'action de G n'est pas naturelle.
  Il le devient si on regarde G comme un groupe dans les locales (via
  G_i->lim G_i, cf le papier précédent), et si G est strict (ie surjectif), on
  retrouve bien la même catégorie BG.

  Plus généralement si G est un groupoide, BG={G ensemble = espace étale
  X->G0 muni d'une action X xG0 G1-> X + morphismes continus préservant
  l'action} est un topos, qui classifie les principal localic Ghat bundle,
  où Ghat est l'étale complétion de G.

  Théorème 3.7: si E/S est un topos avec une locale of path components, alors E
  a un groupoid localic G fondamental, et G est localement, à équivalence
  de Morita près un groupoid prodiscret.

  Note: G est fondamental pour E, noté G=\pi_1(E) si on a
  H^1(E,K):={K-torseurs à iso près}=[G, E] pour tout groupe discret K dans
  S.

  Note: locale of path component := E bounded locally connected au dessus
  d'un totally disconnected locally topos over S.
  Plus de détails dans la section $1, où la notion de totally disconnected
  topos/morphism est introduit et où il est montré que
  connected locally connected est orthogonal à totally disconnected.

  Idée de la preuve, cf $2: H^1(E,K) est la filtered colimit le long de U->>1
  de H^1(E,K)^U={U-split torsors} (tout torseur splitte)
  Rappel: un K-torseur est un objet T->>1 tel que T x \gamma^*K -> TxT est
  un iso. 
  
  Theorem 2.1: (Diaconescu) Si K est un groupe, Top_S(E,S^K)=Tors(E,K).

  Le topos of U-split objects of E est défini comme le pushout
  E/U -> E    et si E loc. connected et U connected (ie E/U->S connected)
  S   -> H_U  alors h_U:E->H_U is connected loc. connected et
              k_U is a surjection and local homéo
  Comme catégorie, H_U est donnée par les isomorphismes \gamma_U* s ->~
  \phi_U* A, s un set et A dans E (un objet qui est donc loc. constant
  splitté par U).

  Théorème 2.6 (Morita equivalence for localic groupoid)
  Si G est un groupoide, on a un point localic canonique p_G:S[G0]->BG.
  G est étale complète <=> G=Aut(p_G). Alors si G, H open groupoid, H étale
  complète, Hom(G,H)=~ Top_S(BG,BH)_+, où le + signifie qu'on a un
  diagramme commutatif
  S[G0]->BG
  S[H0]->BH
  Attention: ici Top_S signifie la (2-1)-catégorie, ie ce qui etait noté
  Top_S[] dans le papier de descente.

  Théorème 2.8: Classification of U-split torsor
  Si E loc connected et U->>1 connected
  On a une équivalence de catégorie Top_S(B\Pi^U, BK)_+ -> Tors(E,K)^U
  donc par 2.6 on a Hom(\Pi^U,K)=~Top_S(B\Pi^U, BK)_+ =~ Tors(E,K)^U donc
  Corollaire 2.9: [\Pi^U,K] =~ H^1(E,K)^U:=[Tors(E,K)^U]
  où \Pi^U est le groupoide étale complete discret qui représente H_U.

  Note: attention, le théorème 2.8 est faux, en vrai l'équivalence est
  Top_S[B\Pi^U, BK] =~ Tors(E,K)^U (par Diaconescu)
  Mais Hom(\Pi^U, BK)=Top_S[B\Pi^U,BK]+ donc \Pi^U représente seulement
  faiblement la cohomology. C'est corrigé dans l'article de Bunge de 2004
  en passant à la stack complétion: si K est un stack, on a
  Hom(\Pi^U~, BK)=Top_S[B\Pi^U,BK]

  Théorème 2.12: extension de 2.8 au cas de E qui a une locale of path
  component.

  On déduit le Théorème 3.7 en prenant une limite projective de \Pi^U.
  Plus exactement, U->\Pi_U est filtré et on applique le 
  Theoreme 3.6: si on a un 2-système inverse filtré G_i d'open discrete localic
  in a topos S, avec les points localics S[G_i0]->BG_i (qui sont des
  surjections ouvertes), alors on a
  p: lim_proj S[G_i0] -> BG=lim_proj G_i, G atomic et p localic open
  surjection.


  Theorem 3.7: E topos with a locale of path components,
  alors G=lim_proj G_U is the fundamental localic groupoid, and is
  locally morita equivalent to a prodiscrete localic groupoid

  Preuve cf Théorème 3.5: Tors(E,K)=lim_ind Tors(E,K)^U=
  lim_ind Top_S(B \Pi_U, BK)+ = Top_S (BG, BK)+= Hom(G, K).
  En pasasnt aux composantes connexes: H^1(E,K)=[G, K].

  $ 1 Totally disconnected toposes and locale of path components

  I l'intervalle, E est dit totally disconnected si E->E^S[I] est une
  équivalence.
  Un morphisme f:F->E est dit totally disconnected si
  F      -> E       est un pullback.
  F^S[I] -> E^S[I]

  1.2 Proposition: E tot. disconnected <=> E->S tot. disconneted
  Si X locale, f:X->Y map de locale, alors X (resp. f) totally disconnected
  ssi S[X] (resp. S[f]) totally disconnected.

  1.4 Proposition: Totally disconnected morphisms are stable under
  composition, pullback, and gof tot. disconnected => f tot. disconnected.
  1.5 Corollary: a point S->E, a localic point S[X]->E where X tot.
  disconnected and a local homéo are tot. disconnected.

  Déf 1.6: A locale X is path connected if X->1 and X^I->XxX are open
  surjections; a topos E is path connected if E->S and E^S[I]->ExE are open
  surjections.

  Th Moerdijk-Wraith:
  - connected + loc. connected locale/topos => path connected.
  - dans locales, a 'path connected' is orthogonal to any 'totally disconnected'

  Th 1.8: si [A, C; B, D] est un pullback dans Top, avec p:B->D, q:C->D
  connected loc. connected, alors A->C et A->B sont connected loc.
  connected et le diagramme est un pushout.
  In particular loc. connected connected morphisms are regular épis.
  (En fait on sait même qu'ils sont de descente effective)

  Th 1.9: In Top, a connected loc. connected is orthogonal to totally
  disconnected.

  Prop 1.10: Factorisation in Top_S into connected loc. connected followed
  by totally disconnected are unique if they exists; for a loc connected
  morphism f:E->F this factorisation is given by the connected-étale
  factorisation: E->F/f_! 1 ->F (here F/f_!1->F is a local homé and localic
  so is determined by a discrete locale in F); loc. connected+tot.
  disconnected => local homéo.

  Déf 1.11: locale of path over S if E->S factor into connected loc.
  connected followed by a tot disconnected morphism.


#### Bunge, Moerdijk (1997), On the construction of the Grothendieck fundamental group of a topos by paths 
https://www.sciencedirect.com/science/article/pii/S0022404997001631

E connected loc. connected.

$ 1. Locally constant sheaves and the Grothendieck fundamental group 

F->E est un cover s'il est de la forme E/L->E où L est locally constant.
LC(E), FLC(E), SLC(E)=sous catégorie des objets loc. constant (resp
finiment loc constant, resp sum of loc constants).

Si S=Set et si E a un point p, FLC(E)=BG pour un groupe profini G: the profinite
fundamental group π_1^pf(E,p) [en effet FLC est un topos Galoisien avec un
point]

La construction de G n'utilise pas que E est loc. connected. Mais si c'est
le cas (S quelconque), alors SLC(E)=BG pour un groupe localic G prodiscret que l'on note π_1(E,p).

E est dit loc. simply connected si on a un U->>1 qui trivialize tous les
objets loc. constants. (<=>)
(ii) LC(E) = SLC(E), i.e., locally constant objects are closed under sums, 
(iii) the prodiscrete group π_1(E,p) is discrete.

Dans ce cas il y a un recouvrement universel Etilde->E, où Etilde=E/L pour
un objet localement constant universel L: π_1(E,p)=Aut(L) et universel signifie tout objet connecté de LC(E) est un quotient de L.

$ 2. The coverings fundamental group of a topos in the absence of a point 

On définit comme dans Bunge GG_U le topos pushout
  E/U -> E
  S/e!U -> GG_U
GG_U connected atomic et E->GG_U connected.

Th 2: GG=lim_proj GG_U =SLC(E) est connected atomic et E->GG est connected
locally connected. GG=BG où G:=π_1(E) est le groupoid localic lax_lim_proj
G_U; il classifie les torseurs: pour tout groupe K dans S,
Hom(G,K)=H^1(E,K).

$ 3. The paths fundamental group of a topos 

E^I=Morphisms from the (topos of sheaves on) I, the unit interval seen as a
locale to E.

Th 3.1: E^I -> ExE défini par l'évaluation en les end points est une
surjection ouverte, ie E connected+loc connected => path connected.

I est le simplexe Δ_1, qui donne une locale cosimpliciale:
1=Δ_0 => I=Δ_1 ≡> Δ_2... ce qui donne le topos simplicial
E^Δ2 ≡ E^Δ1 => E.

∏(E)=descent topos of this simplicial topo = objects of A with a descent
date ε_0*A =~ ε_1*A. The forgetful functor gives E->∏(E).
Prop 3.2: ∏(E) is connected atomic, and E->∏(E) an open surjection.

Si E a un point base, ∏(E)=BG où G:=π_1^paths(E,p) est un groupe localic.

$ 4. The comparison map
On a un morphisme connecté loc. connecté ∏(E)->SLC(E) (qui induit un
morphisme correspondant des groupes localics si E a un point).

$ 5. Path-simply connected topoi 

On dit que E est p.s.c. si E^Δ2 -> E^δΔ2 est une surjection stable.

Prop 5.1: Si E est p.s.c. ∏(E)=~S.
Corollaire: E psc => E simply connected.

$ 6. Unique path-lifting 

Prop 6.2: si L est loc constant, il a le unique path lifting, donc
∏(E)/φ*(L) =~ ∏(E/L)

$ 7. The first equivalence theorem 

Prop 7.1: si E loc. simply connected, u:Etilde->E son cover universel, et
supposons que ∏(Etilde)=S. Alors ∏(E)=~SLC(E).
Dans ce cas, ∏(E)=B π_1(E) et si on a un point, π^path_1(E,p)=π_1(E,p) est
donc un groupe discret (car E loc simply connected => son groupe
fondamental est discret).

$ 8. Locally path-simply connected topoi and the main comparison theorem 

Déf: E locally path simply connected si E a un système générateur d'objets
connectés C_i tels que E/C_i p.s.c.

Theorem 8.1: si E loc. path simply connected ∏(E)=~SLC(E).
Preuve:
Lemme 8.2: lspc=>lsc
Lemme 8.3: Si E est lspc, Etilde=E/U (où u cover universel) satisfait ∏(Etilde)=S; donc on peut appliquer la Prop 7.1.

$ 9. The groupoid of paths 

If E^I->ExE is loc. connected, it factorises as E^I->H->ExE décomposition
connected+loc. connected o étale morphism. Thus H is the topos of connected
components of E^I as a ExE topos. The two maps H=>E are part of a groupoid
topos H x_E H ≡> H => E where composition is composition of paths.

Prop 9.1: the descent topos of the groupoid H is equal to ∏(E).

On est dans ce cas si E lspc:
Prop 9.3: Si E lspc, E^I->ExE is loc. connected.


#### Bunge, Lack (2003) van Kampen theorem for toposes
https://www.sciencedirect.com/science/article/pii/S0001870803000100

Theorem 5.1: Soit
E1 -> E
^     ^
|     |
E0 -> E2
un pullback où f1:E1->E et f2:E2->E sont des inclusions et f1+f2 de
descente effective. Alors c'est un pushout.

Déf: si e:E->S est bounded, A est U-split si il existe J->I dans S et
U->e*I tels que e*J x_{e*I} U =~ AxU au dessus de U.
Si U->>1, on dit que U est loc. constant.

Lemme 5.3: Si f:E->F est loc connected, alors U split f*A ssi f_!U split A.
Lemme 5.4: Si f:E->F loc connected surjectif, f*A loc constant => A loc
constant.

Theorem 5.6: Si on a un pushout
E1 -> E
^     ^
|     |
E0 -> E2
tel que E1+E2->E est loc connected surjection, alors en passant aux objets
loc. connectés et aux pullbacks f*, on a un pullback:
E1lc -> E0lc
^     ^
|     |
Elc -> E2lc

Lemme 6.1: Si e:E->S est loc connected, alors (<=>)
(i) A est U-split
(ii) dans la définition de U-split, pour J->I on peut prendre J->e_! U
(ii) dans la définition de U-split, pour J->I on peut prendre e_! AxU->e_! U

Lemme 6.2: Si E loc connected et U->>1 est un universal cover (ie split
tous les objets loc constant), c'est le cas aussi de σ*σ_!U où σ:E->G_U
vient de l'inclusion des U-splits objets dans E, donnée par le pushout
usuel.

Theorem 6.3. Dans le cadre du théorème 5.6 où les 4 topos sont locally
simply connected, alors si on applique le groupoide fondamental ∏_1^c
on reste un pushout dans Top_S (pushout de topos atomiques).

Dans le cas d'un cover universel U, le groupoide UxUxU ≡> UxU => U
descend via e_! en un groupoide sur S, noté π_1^c(E,U).
Bπ_1^c(E,U) =~ ∏_1^c(E).

On a LSCTop_S={(E,U) où E loc simply connected et U universal covering}
un morphisme (E,U)->(F,V) est un morphisme f:E->F + un morphisme U->f*V.
On a B+: Gpd(S)->LSCTop_S, qui envoie G sur (BG, U) où U est la codomain
map G_1->G_0 munie de l'action canonique; B+ est fully faithfull.
On a donc un foncteur π_1^c: LSCTop_S -> Gpd(S).

Theorem 6.5: dans le cadre du th 6.3, on peut prendre des universal covers
de telle sorte qu'appliquer π_1^c donne un pushout dans Gpd(S).

Remark 6.6: si les topos sont locally path connected, on a un theorem de
Van Kampen pour les π_1^p (car ils coincident avec les π_1^c).


#### Bunge (2004), Galois groupoids and covering morphisms in topos theory
http://citeseerx.ist.psu.edu/viewdoc/download;jsessionid=FF479C5DCB7E7EA20A613ABB712D4AFA?doi=10.1.1.15.7071&rep=rep1&type=pdf

  Met à jour l'article précédent en corrigeant des bugs, et fait le lien
  avec la théorie de Galois catégorie pure de Janelidze.

  $ 2 construit à nouveau la catégorie des objets localement constants:
  si E/S bounded loc. connected, on construit pour U->>1 le pushforward
  E/U -> E
  S/e!U -> GG_U
  [dans l'article précédent on supposait U connexe, donc e!U=1]
  Alors GG_U =~ Spl(U) où Spl(U)=objet loc. constant split par U (<=>)
  - on a un iso e* S x_{e*e_! U} U->AxU au dessus de U
  - on a un pullback AxU->e*S de U->e*e_! U
  - on a un J->I dans S, U->e*I dans E tel qu'on ait un iso
    e*J x_e*I U -> AxU au dessus de U

  Prop 2.8: GG_U=BG_U où G_U étale complète discrète localic groupoid
  et p_U:S/e!U ->GG_U s'indentifie avec le bag of points S[G0]->G_U

  Proof: p_U is a surjective local homéo (surjectif car U->>1),
  so GG_U is classified by a étale
  complète discrete localic groupoid G_U with G_U0=e_!U.

  $ 3 Stack completions and the fundamental groupoid of a topos

  Th 3.1
  Si G est un groupoid dans S, G split les idempotents, donc (cf l'article stack
  completion de Bunge), la stack completion de G est Pointess_S(BG).
  De même pour la catégorie Tors(G) vu comme catégorie indexée par
  Tors(G)^I = G-torseur de G/I. Par Diaconescu BG classifie les G-torseur,
  donc on a aussi la stack complétion comme étant Point_S(BG).

  Corollaire 3.2: toutes ces catégories sont (canoniquement) équivalente.
  => tout point est essentiel, et les points (indexés) viennent d'un G-torseur (indexé).

  Def: on suppose que S satisfait (ASC), ie la stack complétion existe
  comme catégorie interne Gbar.
  Ex: si S Grothendieck, il satisfait ASC car il y a un small generating class.
  Th 3.4: dans ce cas Hom_S(Gbar, Hbar)=Top_S(BG, BH).
  Du coup on considère H^1(E,K) non plus pour K un groupoide dans S, mais
  un stack groupoid, et H^1(E,K)=connected components du stack groupoid
  Tors(E,K). H^1 sera alors représenté par \pi_1^c(E), la colimite des
  \pi_U qui représentent Tors(E,-)^U = les torseurs splits par U.

  On a Top_S(B(G_U)), BK)=~Tors(E,K)^U [où G_U est introduit dans le $2],
  mais G_U n'est pas un stack donc représente seulement faiblement la
  cohomologie. Sa stack complétion interne G_U->G_Ubar (qui est une weak
  equivalence) induit une strong équivalence BG_U->BG_UBar, donc en passant
  à G_UBar on a un strong représentant.

  Def 3.7: \Pi_1^C(E)=la limite filtrèe des topos Spl(U).
  C'est le covering fundamental group topos of E/S; it is the full
  subcategory of E generated by the locally constant covers.
  E->\Pi_1^c(E) est connected loc. connected

  Th 3.8: si E/S loc. connected, S satisfait ASC. Alors \Pi_1^c(E) est
  représenté par un prodiscrete localic groupoid \pi_1^c(E) qui représente
  H^1(E,-) avec coefficient dans des groupes discrets (qui sont des stacks).

  Déf 3.9: E loc. connected est simply connected si il existe U qui splitte
  tous les objets loc. constants.

  $ 4 Galois groupoids and Galois toposes

  Déf 4.1: S-Galois family = objet X->>1 dans E tel qu'il existe
  d: X->e*I qui fait de X un Aut(d) torsor dans E/I au dessus de S, ie
  X x_e*I e*(Aut d) -> XxX est un iso.
  Note: e*(Aut d) est un groupoid discret dans E avec pour objets e*I.

  Theorem 4.2: Si E loc. connected bounded,
  le morphisme S/e!U -> G_U (le U-splitting topos) est un local homéo
  surjectif, et son image inverse est représenté par une S-famille
  Galoisienne \sigma*d: sigma*A -> e* e_! U, où \sigma: E->G_U.
  Cette famille génère G_U;
  G_U=B(Aut(\sigma*d)) [qui est un localic groupoid discret] et on a le
  pullback: E/\sigma*A -> E
            S/e!U      -> G_U

  Corollaire 4.5: si E est simply connected, et U un cover qui splitte tous
  les objets loc. constant; et d: sigma*A ->e* e_! U le cover universel,
  alors le groupoid \pi_1^c =~ Gal(\sigma* d) au sens de Janelidze.

  Déf 4.7: E/S bounded est Galois si E loc. connected et est généré (=a un
  internal site of definition) par des objets S-Galoisiens.

  Theorem 4.10: E/S loc. connected bounded. (<=>)
  - E/S est Galois
  - E =~ \Pi_1^c(E)
  - E est générée par les loc. constant covers
  - E=BG pour G prodiscrete localic groupoid.
  Corollaire 4.11: E/S loc. connected bounded. (<=>)
  - E/S loc simply connected et Galois
  - E =~ \Pi_1^c(E) et E loc simply connected
  - E=E_lc la sous catégorie des loc. constant objects
  - E=BG pour G discrete localic groupoid.

  $ 5 Locally paths simply connected topos over any base

  On a une notion de path fundamental group topos \Pi_1^p(E), défini comme
  la colimitte du diagramme de descente
  E^Δ ≡> E^I => E où I est l'intervalle unité et Δ le 2-simplexe.
  
  Déf 5.1: Un objet Y a le path lifting property si (E/Y)^Δn -> E^Δn
  est ouvert, et on a le unique path lifting property si
  (E/Y)^Δn -> E^Δn est un pullback.
   E/Y     -> E
  
  Prop 5.3: Si A loc. constant, il a le unique path lifting property.

  Th 5.4: on a un morphisme ∏_1^p(E)->∏_1^c(E) (au-dessous de E).
  C'est une équivalence si E est S-Galoisien.

  Rem: si E locally simply connected, et A universal cover, alors
  ∏_1^c(E/A) =~ S/e_! A (naturellement).

  Déf 5.6: Si E loc connected, on dit qu'il est loc. simply path connected si 
  il est loc simply path connected et le cover universel A satisfait
  ∏_1^p(E/A) =~ S/e_! A (naturellement ie qui commute avec
  E->∏_1^p(E/A) et E-> S/e_! A).

  Theorem 5.7 si E loc connected et loc simply path
  connected, alors on a une équivalence ∏_1^p(E)->∏_1^c(E) 
  Note: loc simply path connected = loc simply connected
  (ce qui implique que si A est le cover universel, \Pi_1^c(E/A)=S/e_!A)
  + on a l'équivalence \Pi_1^p(E/A)=S/e_!A.

  Prop 5.8: \Pi_1^c est un biadjoint à gauche (ie un réflecteur) de l'inclusion
  loc simply path connected galois topos lpscGTop_S-> loc simply path connected
  topos lpscLTop_S, où les morphismes dans LTop_S sont les morphismes loc.
  connected.

  Prop 5.9 (van Kampen): si on a un pushout de topos loc simply path
  connected et les morphismes sont des surjections loc connected, alors
  on a un pushout quand on applique \Pi_1^c, où on voit \Pi_1^c(E)=BG comme
  un classifying topos de groupoid discret, ce qui donne donne un pushout
  sur les \pi_1^c.

  $ 6 étudie les generalized covering morphisms
  et montre dans la Prop 6.8 que les locally constant objets of E
  déterminent a topological fibration of covering morphisms.

  Prop 6.11: les complete spread objects (vu comme des unramified
  morphismes dans E; dont font partie les loc. constant objetcts) ont la
  unique path lifting property et forment une topological fibration.

#### Zoghaib (2004): A few points in topos theory
http://www.normalesup.org/~zoghaib/math/points-tt.pdf

Un résumé des articles de Dubuc et un peu de Bunge.

$ 3 Donne un résumé de constructions de limites/colimites de Topos

$ 4 The fundamental groupoid of a topos

Theorem 4.1 (The fundamental theorem of generalised Galois theory).
Let f: E → S be an arbitrary (bounded) topos. Then there exist a localic
groupoid G such that E is equivalent to the topos B G of G-sets.

Theorem 4.5. Let γ : E → S et be a connected atomic topos with a point. Then E is equivalent to the topos of G-sets, where G is the localic group of automorphisms of any base point of E.
[Preuve: donne la preuve élémentaire de Dubuc plutôt que celle par descente.]

Ca généralise la théorie de Galois au sens de SGA1; une catégorie
"Galoisienne" étant un cas particulier de topos atomique.

Def: Galois topos = connected, loc. connected, and generated by its Galois
object. [A Galois = A connected and an Aut(A) torsor, ie A->>1 and A x γ*
Aut A -> AxA is an iso].

Proposition 4.11. A Galois topos has enough points.

Theorem 4.12.
Let γ : E → S et be a connected and locally connected topos.
There exists a Galois topos, which we will denote G(E), and a geometric morphism E → G (E) whose inverse image is given by inclusion, such that G(E) is the topos of sums of locally constant objects in E.

Preuve: reprend la preuve de Bunge qui considère S_U comme le pushforward
de [E/U, E; S/γ_! U, S_U], S_U étant les U-splits objets, et G(E) étant
colimite des S_U.

Le groupoid fondamental de G(E) (qui est un topos atomique) classifie le
H^1 de E.

#### Dubuc (2003): Localic Galois Theory
https://arxiv.org/abs/math/0012173

In Proposition I of "Memoire sur les conditions de resolubilite des equations par radicaux", Galois established that any intermediate extension of the splitting field of a polynomial with rational coefficients is the fixed field of its galois group.
We first state and prove the (dual) categorical interpretation of of this statement, which is a theorem about atomic sites with a representable point. In the general case, the point determines a proobject and it becomes (tautologically) prorepresentable. We state and prove the, mutatus mutatis, prorepresentable version of Galois theorem. In this case the classical group of automorphisms has to be replaced by the localic group of automorphisms. These developments form the content of a theory that we call "Localic Galois Theory".
An straightforward corollary of this theory is the theorem: "A topos with a point is connected atomic if and only if it is the classifying topos of a localic group, and this group can be taken to be the locale of automorphisms of the point". This theorem was first proved in print in Joyal A, Tierney M. "An extension of the Galois Theory of Grothendieck", Mem. AMS 151, Theorem 1, Section 3, Chapter VIII. Our proof is completely independent of descent theory and of any other result in that paper.

Theorem B: A topos E with a point p: Ens → E, p∗ = F , is connected atomic if and only if it is the classifying topos BG of a localic group G, and this group can be taken to be lAut(F) = lAut(p)^op .

Theorem A: A topos E with a representable point p:Ens → E, p∗ = [ A, − ], A ∈ E is connected atomic if and only if it is the classifying topos BG of a discrete group G, and this group can be taken to be Aut(A)^op.

$ 1. Classical Galois Theory

Assumption 1.1. (connected atomic site with a representable point)
i) Every arrow Y → X in C is an strict epimorphism.
ii) For every X ∈ C there exists A → X.
iii) The representable functor F = [ A, − ] preserves strict epimorphisms.

Then:
Theorem 1.2.
For every object X ∈  C the action of the group Aut(A) op on the set [ A, X ]
is transitive.

Theorem 1.3 (Galois Theorem).
Every arrow x: A → X in C is the categorical quotient of A by the action of the Galois group Fix(x) = { h ∈ Aut(A) | xh = x } ⊂ Aut (A).

These theorems follow easily from the following proposition:
Proposition 1.4. Every arrow X → A is an isomorphism. In particular, every endomorphism of A is an isomorphism, Aut(A) = [ A, A ].

=> Theorem A, since any connected atomic topos with a representable point has a site as 1.1.

$ 2. The theorems of localic Galois Theory
P prerepresentable.

Assumption 2.1.
i) Every arrow Y → X in C is an strict epimorphism.
ii) For every X ∈ C there exists P → X. That is, FX != ∅ .
iii) The prorepresentable functor F = [ P, − ] preserves strict epimorphisms.

Then:
Theorem 2.2.
For every object X ∈ C the action of the localic group of automorphisms lAut(P)^op = lAut(F) on the set [ P, X ] = FX is transitive.

Theorem 2.3.
Every arrow x:P → X in C is the categorical quotient, relative to the category C, of P by the action of the Galois group lFix(x)∈lAut(P) described informally as {h∈Aut(P) | xh = x}.

The equivalent version of this statement in terms of the fiber functor is reminiscent of the lifting lemma in classical covering theory:
Lifting Lemma: Given any objects X∈C,  Y∈C, and elements x∈FX, y∈FY, if 
lFix(x) ≤ lFix(y) in lAut(F), then there exist a unique arrow f:X → Y in C such that F(f)(x) = y.

$ 3. Preliminaries on Localic Spaces and Groups
$ 4. The locale of automorphisms of a set-valued functor
$ 5. The (pre)topology generated by a family of covers
$ 6. Proof of the theorems 2.2 and 2.3
$ 7. Preliminaries on the classifying topos of a localic group

$ 8.Characterization of the classifying topos of a localic group
First recall that a connected atomic topos is a connected, locally connected and boolean topos.

Proposition 8.1. Let C be a category and F:C → Ens be a functor as in 2.ii) and iii). Then the canonical (in this case atomic) topology defines an atomic site with a point. If C is small, the topos of sheaves C∼ is an atomic topos with a point (see[2]). This topos is connected if and only if condition ii) holds. Any connected atomic topos with a point can be presented in this way.

Proposition 8.2.The category tBG of transitive G-sets satisfies 2.1. If G is small, BG is an atomic topos with a point, with inverse image given by the underline set (BG is the topos of sheaves for the canonical topology on tBG).

Theorem 8.3. Let C and F:C→Ens be as in 2.1. Then the functor μF:C->BG, G=lAut(F) lands into tBG, μF:C→tBG [μF is the lift of F, donné par l'action G=lAut(F) sur FX pour tout X]. If C is small, then G is small, and μF induces an equivalence of categories C∼ ≃ BG between the topoi of sheaves for the canonical topology on C and the classifying topos BG.
=> Theorem B.

#### Dubuc (2004): On the representation theory of Galois and Atomic Topoi (2004)
  https://arxiv.org/abs/math/0208222

       We elaborate on the representation theorems of topoi as topoi of discrete actions of various kinds of localic groups and groupoids. We introduce the concept of "proessential point" and use it to give a new characterization of pointed Galois topoi. We establish a hierarchy of connected topoi:
    [1. essentially pointed Atomic = locally simply connected],
    [2. proessentially pointed Atomic = pointed Galois],
    [3. pointed Atomic].
    These topoi are the classifying topos of, respectively: 1. discrete groups, 2. prodiscrete localic groups, and 3. general localic groups.
    We analyze also the unpoited version, and show that for a Galois topos, may be pointless, the corresponding groupoid can also be considered, in a sense, the groupoid of "points". In the unpointed theories, these topoi classify, respectively: 1. connected discrete groupoids, 2. connected (may be pointless) prodiscrete localic groupoids, and 3. connected groupoids with discrete space of objects and general localic spaces of hom-sets, when the topos has points (we do not know the class of localic groupoids that correspond to pointless connected atomic topoi).
    We comment and develop on Grothendieck's galois theory and its generalization by Joyal-Tierney, and work by other authors on these theories.

$ 1.3. The classifying topos of a localic groupoid
Soit G un groupe localic.

Déf 1.3.1 Un G-set est défini ici via un morphisme continu G->lAut(X).
Prop 1.3.4: tBG est un site atomique, son topos of sheave est BG, a pointed
connected atomic topos.

Pour un groupoide localic:

Proposition 1.3.6. Given any localic groupoid with discrete set of objects, the category BG can be defined as the (ordinary) category of enriched functors G −→lS and natural transformations. BG=lS^G (où lS=localic spaces)

Proposition 1.3.7. Given any localic groupoid G with discrete set of objects, the topos BG is an atomic topos with enough points (with inverse images given by the evaluation functors).  If the groupoid is connected, then it is a connected topos,equivalent to the classifying topos of any one of its vertex localic groups.

$ 1.4.Classifying topos and filtered inverse limits

Theorem 1.4.2: Given a cofiltered diagram of localic groups+localic
surjective morphism, B lim_proj G_i = lim_proj BG_i.

A similar theorem for filtered inverse limits of localic groupoids with discrete sets of objects seems plausible. Abusing rigor, one could say that a corresponding result in the case of arbitrary localic groupoids also holds, but we do not know of any clear proof in print, and it remains anopen problem to us.

$ 2.1. The localic functor category

Associated with ΓF, we define a poset, which we denote DF, identifying all arrows in each hom-set of category ΓF.
Entre deux foncteurs F,G:C->S, Dubuc défini ce qu'est une relation
naturelle entre F et G (c'est une relation R \subset FxG), et défini une
relation d'ordre sur {(X, x0 \in FX, 1 \in GX)}; the locale of presheave on
this lattice is the locale of natural relations from F to G. By introducing
the appropriate covers, we construct the quotient locales of natural
transformation and natural bijections.

Ca permet de voir la catégorie des foncteurs C->S comme enrichie dans
Locale.

$ 2.2.The localic groupoid of points of a topos.
Si E est un topos, l'ensemble de ses points est muni d'une structure de
groupoide localic canonique, qui est fonctorielle, et qui commute aux
limites filtrées (si les morphismes de transition qui vont bien sont
surjectifs).

La structure localique vient du fait qu'un point de E=Sh(C) peut être vu
comme un point du site C, ie un foncteur C->Set plat et continu, et donc la
catégorie des points de E peut être enrichie dans Locale.
lPoints(E)[ f, g ] = lBij (g∗ , f∗)

$ 2.3. The localic group of a pointed topos and filtered inverse limits.
Si f:S->E est un point de E, qui vient d'un point du site F:C->S
où E=C~, F=f*|C.
Alors F s'étend en μF: C-> BlAut(F) d'où un morphisme C~ -> BlAut(F)
au-dessous du point.

Prop 2.3, 2.4 et 2.5: BlAut(F) se comporte bien par rapport aux points.
Proposition 2.3.6. Consider a filtered system of set valued functors F_i and its colimit, alors lAut(F) est la colimite des lAut(F_i).

Proposition 2.3.7. In the situation of proposition 2.3.6, assume that each Cα is asite, each Tα a morphism of sites, and C the inverse limit site (cf 1.1.1). Assume furthermore that the transition morphisms lAut(Tαβ) given by proposition 2.3.3 are surjections. Then, in the following diagram the two bottom rows are inverse limit diagrams of topoi
C_α  -T_αβ   -> C_β  -> C
C_α~ -t*_αβ -> C_β~  -> C~
BlAut(F_α)   ...     -> BlAut(F)

$ 3.The fundamental theorems of galois theory
$ 3.1.Pointed connected atomic sites.
Si E est un topos avec un point f:S->E, C \subset E un site de définition
de E pour la topologie canonique, muni d'un point F:C->S tel que F=f*|C,
alors
1) Si E est un topos atomique pointé, on peut prendre C tel que
   i) toutes les flèches Y->X dans C sont des épi stricts
   ii) pour tout X, FX!=0
   iii) F préserve les épi stricts
   iv) la catégorie ΓF des éléments de F est cofiltrée.
2) Réciproquement si C est comme dans 1), alors E=Sh(C) est un topos pointé
atomique connecté. ii) <=> la connectivité de E; on peut prendre pour C la
sous-catégorie des objets connectés de E.

$ 3.2.Discrete galois theory
C'est le cas où ΓF a un objet initial, ie f* est représentable par un objet A dans C. Dans ce cas, lAut(F)=Aut(A)^op, A est un covering universel, on dit que E
est locally simply connected. Comme A est dans C, c'est un cover, donc
A->>1 (situation typique du cas connecté).

Theorem 3.2.4(fundamental theorem). Dans ce cas, le lift μF (où on prend
l'action de G:=lAut(F) qui est ici un groupe discret) identifie C à tBG et E à BG.

Version groupoid, Th 3.2.5: Si E est un topos essentiellement pointé,
connecté atomique, G sa catégorie des points (qui ici est un groupoid
discret), alors le morphisme géométrique canonique BG=S^G°->E est une
équivalence.

This situation is characterized in terms of exactness properties of
the inverse image of the point. It is equivalent to the preservation of all limits by the inverse image functor f∗ , or, equivalently, the point is essential.

Prop 3.2.6: If the point is essential, then ΓF has an initial object F and F is representable by A.

Corollary 3.2.7. A pointed connected atomic topos is a locally simply connected Galois topos if and only if the point is essential.

$ 3.3.Prodiscrete galois theory.

Grothendieck’s galois theory corresponds to the situation described in 3.1.1 when the Galois objects are (co) cofinal in the diagram ΓF of the functor F.
This yields a prodiscrete localicgroup as the localic group of automorphisms of the point. Later,in a series of commented exercises in SGA4 [1] he gave guidelines to treat the general prodiscrete case by means of locally constant sheaves and progroups. The key result in these developments is the construction of the Galois closure. In [19] I. Moerdijk developed this program using prodiscrete localic groups instead of progroups, and gave a rather sketchy proof of the fundamental theorem (theorem 3.2 loc. cit.). Prodiscrete localic groups and their classifying topoi are completely equivalent to strict (in the sense that transition morphisms are surjective) progroups and their classifying topo (and the same for groupoids).

Pointed Galois topoi are given by pointed atomic sites where the Galois
object are cofinal in ΓF.

Si on fixe A un objet Galoisien, on peut
considérer C_A la sous catégorie de C des objets X splittés par [A,X], ie
[A,X]=~FX. C'est un site atomique avec A comme point représentable, d'où
une équivalence B(lAut(A)^op)=~E_A.

Theorem 3.3.5(fundamental theorem).
Si E est un topos Galoisien avec un point, alors μF identifie C à
tB(lAut(F)) et le morphisme induit B(lAut(F))->E est une équivalence.

Version groupoid Th 3.3.6: Si E est un topos Galoisien avec un (donc assez)
de points, E=B(G^op) où G=lPoints(E). De plus G a prodiscrete "hom" space,
in particular prodiscrete vertex localic groups.
The reader should be aware that the groupoid in this theorem is not a prodiscrete localic groupoid.

We now characterize this situation in terms of exactness properties of the inverse image of the point.
Grothendieck’s theory corresponds to the case in which the point, although not necessarily essential, is such that the inverse image preserves certain infinite limits,namely, cotensors of connected objects. This is equivalent to the existence of Galois closure (that is, the Galois objects generate the topos), or to the fact that the localic group lAut(p) is prodiscrete. We elaborate on this now.

Def 3.3.7: A point is proessential if the inverse image preserves cotensors of connected object: p*(∏_S X)=∏_S p*X.

Notice that preservation of cotensors (of any object) is a much stronger conditionwhich implies that the point is essential.

Theorem 3.3.8. Dans la situation 3.1.1, si le point est proessential, alors
on a une Galois closure des objets connectés, et le topos est Galoisien.

Corollary 3.3.9. A pointed connected atomic topos is a Galois topos if and only if the point is proessential.

$ 3.4. Unpointed prodiscrete galois theory

Consider now any connected locally connected topos F and the Galois topos E = GLC(F). Given a morphism between Galois objects f:A→B, the geometrical morphism 
Split(A) ← Split(B) (with inverse image the full inclusion of categories) clearly induces a surjective function between the sets of point.
 A point of E furnish a way of choosing a point (consistently with respect to the transition morphisms) on each topoi Split(A), thus, it is exactly an element of the inverse limit of the sets of points of the topoi Split (A). This inverse limit may be empty, but taken in the category of localic spaces it always defines a non trivial prodiscrete localic space (since the projections are surjective [15] IV 4.2.) G0, which is the space of (may be phantom) points of the inverse limit topos E.
 More over, there is induced a groupoid morphism GA←GB between the categories (which are discrete connected groupoids) of points, GA = Points(Split(A))
(compare 2.2.1). The inverse limit of this filtered diagram, taken in the category of localic groupoids, defines a prodiscrete localic groupoid (see [16], definition 2.8) G with the prodiscrete localic space G0 as its localic space of ‘‘objects”.
We shall say that G is the localic groupoid of phantom points of the Galois topos E, and write phPoints(E).  The points (if any) of G0 are exactly the points of the topos E. On the other hand, there are also geometric morphisms between the push-out topoi PA ← PB , which are morphisms of pointed topoi for the canonical points (cf 5.1.4 and 5.1.6). Thus, there is always a consistent choice of points for the system of push-out topoi PA.

En résumé, G et la limite proj des G_A, G_B,... le groupe localic associé aux
topos Galoisiens Split(A)=~PA, que l'on peut définir explicitement comme
G_A=Points(Split(A)). On a donc B(G_A^op)=Split(A)=~PA.
On a donc BG^op=lim_proj BG_A^op (car B commutes with the inverse limit of
discrete groupoids), d'où BG^op=~E =~ lim_proj Split(A).
Cependant, si tous les PA ont des points: S->PA donné par le point
canonique [A,-]; le système des PA n'est pas filtré (contrairement aux
topos isomorphes Split(A)), donc lim_proj PA n'existe pas forcément, donc E
n'a pas forcément de points! En effet, PA est seulement bifiltrée, comme
les G_A, et autant la limite bifiltrée de groupoide existe (cf Bunge) pour
donner G, il n'est pas claire que pour les PA la limite bifiltrée donne un
topos.

Theorem 3.4.1 (fundamental theorem).
Let F be any connected locally connected topos, and E be the Galois topos E = GLC(F). Then the canonical geometric morphism B(G^op)→E is an equivalence, where G is the prodiscrete localic groupoid of (phantom) points G = phPoints(E) defined by the inverse limit above.

$ 3.5. Comparison between the pointed and unpointed theories

First, notice that since all the points of the essentially pointed topoi Split(A) are representable, it follows from the localic Yoneda’s lemma 2.1.3 that the localic and the discrete groupoids of points are equivalent in this case. We have GA=Points(Split(A))∼= lPoints(Split(A)).
[...] This shows that lPoints(E) is the inverse limit of the filtered system of discrete groupoids GA ← GB ··· in the category of localic groupoids with discrete space of objects, while phPoints (E) is by definition the inverse limit of the same system in the category of all localic groupoids. It follows then that there is a comparison morphism of localic groupoid lPoints(E) → phPoints(E).
Notice that from the representation theorems 3.4.1 and 3.3.6 follows
that this morphism induces an equivalence between the classifying topoi.

Comment 3.5.1. In the arguing above it is given an sketch of the proof that the functor lPoints(E) preserves filtered limits of topoi (into the category of localicgroupoids with discrete space of objects), generalizing 2.3.6.

Galois topos with points are connected but may have a non-connected groupoid of points:
Example 3.5.2. In SGA4 IV 7.2.6 d) it is said that there exists a strict progroup H = (Hi)_i∈I such that the classifying topos BH has two non isomorphic points. Equivalently, there is a prodiscrete localic group H such that BH has two non isomorphic points.  This implies that the groupoid of points Points(BH) is not connected. Its classifying topos BPoints(BH) can not be BH. However, the localic groupoid of points lPoints(BH) (which has discrete set of objects) is connected (in particular, the localic space of morphisms between any two points is non trivial). We have BH ∼= BlPoints(BH) and H ∼= lPoints(BH).

$ 3.6. Localic galois theory.

In the previous sections we have developed the fundamentals of the galois theory as given by Grothendieck’s guidelines up to its natural end point, which is the representation theorems of Galois Topoi 3.3.5 and 3.4.1. One aspect of these theorems is that they furnish an axiomatic characterization of the classifying topoi of prodiscrete localic groups and (connected) prodiscrete localic groupoids respectively. With the notion of localic group generalizing the notion of progroup, the natural end point of the theory is push forward into the representation theorem of pointed connected atomic topoi, which would be, in particular, an axiomatic characterization of the classifying topoi of general localic groups. This theorem is [Joyal-Tierney-15] Ex.VIII 3.Theorem 1, and it still generalizes closely Grothendieck’s galois theory. In particular, the localic group in the statement is still the localic group of automorphisms of the point (or the localic groupoid of all points as defined in section 2.2), and as such, it is canonically associated to the topos (and functorial).

We now recall the fundamental theorems of localic galois theory established in [9], where the representation theorem of pointed connected atomic topoi is a consequence of a theory completely different to the Joyal-Tierney theory, and more akin in its methods to classical galois theory.

Let F:C->S be a pointed connected atomic site.
Theorem 3.6.1. For every object X ∈ C the action of the localic group of automorphisms lAut(F) on the set FX is transitive.
Theorem 3.6.2. Lifting Lemma: Given any objects X∈C , Y∈C, and elements x∈FX, y∈FY, if lFix(x) ≤ lFix(y) in lAut(F), then there exist a unique arrow f:X → Y in C such that F(f)(x) = y

Theorem 3.6.3 (fundamental theorem).
Si E est un topos atomique connecté avec un point, alors μF identifie C à
tB(lAut(F)) et le morphisme induit B(lAut(F))->E est une équivalence.
Groupoide: Theorem 3.6.4 B(G^op)=~E, où G=lPoints(E).

$ 4.1. Comments on Joyal-Tierney galois theory
Classifying topoi are explicitly described as descent
topoi. For them, the fundamental theorem of galois theory states that (*) open surjections are geometric morphisms of effective descent.
The fundamental theorems of previous galois theories follow because these theorems are statements about a point, and this point is an open surjection.

It also follows an unpointed theory of representation for a completely arbitrary topos in terms of localic groupoids, theorem Ch.VIII 3. Theorem 2., which states that any topos is the classifying topos of a localic groupoid.
But contrary to the atomic pointed case, this groupoid is not fonctorial.

However, for an atomic topoi with enough points, we have a canonical open spatial cover, namely, the discrete localic space of all the
points (only one is necessary if the topos is connected), and it can be seen that the construction in Step 2 [ie the groupoid associated to the descent] yields the localic groupoid of points (defined in 2.2 above).

$ 4.2. The non connected theory
Definition 4.2.1. A Multigalois topos is a locally connected topos generated by its Galois objects, or, equivalently, it is a sum of Galois topoi.

Let E be any locally connected topos. The following theorems follow by decomposing E as a sum of connected topoi, and proving the statements for connected topoi (which we indicate in between parenthesis):

Theorem 4.2.2 (discrete case).
The following are equivalent:
2. E is a locally simply-connected (Galois) Multigalois topos.
3. E is (connected) atomic with enough essential points.
4. The canonical geometric morphism μ:B(G)→E is an equivalence, where G is the (connected) discrete groupoid of points G = Points(E).
5. E is the classifying topos of any (connected) discrete groupoid

Theorem 4.2.3 (pointed prodiscrete case) .
The following are equivalent:
1. E has enough points and it is (connected) generated by its locally constant objects.
2. E has enough points and it is a (Galois) Multigalois topos.
3. E is (connected) atomic with enough proessential points.
4. The canonical geometric morphism B(G) μ−→ E is an equivalence, where G is the (connected) localic groupoid of points G = lPoints(E), which in this case has prodiscrete “hom-spaces”.
5. E is the classifying topos of any (connected) localic groupoid with discrete
space of objects and prodiscrete “hom-spaces”.

Theorem 4.2.4 (unpointed prodiscrete case).
The following are equivalent:
1. E is (connected) generated by its locally constant objects.
2. E is a (Galois) Multigalois topos.
4. The canonical geometric morphism B(G) μ−→ E is an equivalence, where G is the (connected) localic groupoid of phantom points G = phPoints(E), which is prodiscrete (by definition).
5. E is the classifying topos of any (connected) prodiscrete localic groupoid

Theorem 4.2.5 (pointed localic case).
The following are equivalent:
3. E is (connected) atomic with enough points.
4. The canonical geometric morphism B(G) μ−→ E is an equivalence, where G is the (connected) localic groupoid of points G = lPoints(E).
5. E is the classifying topos of any (connected) localic groupoid with discrete
space of object.

We see that the theorem that should be labeled unpointed localic case is missing. E=BG but the localic groupoid G such that E ∼= BG is not identified and
can not be considered to be (as far as we can imagine) the groupoid of points of the topos. 
In [18] Moerdiejk investigates Joyal-Tierney theorems and establishes that
atomic topoi are characterized by the fact that the localic groupoid can
be so chosen that the map G1(d0, d1) −→ G0×G0 is open ([18] 4.7 c).

$ 5. Appendix.  Galois theory of covering topoi
We shall denote by γ the structure morphism of any topos E, E γ−→ S. A topos E is said to be locally connected if the inverse image functor γ∗ is essential, that is, if it has itself a left adjoint denoted γ_! (the set of connected components). A topos E is said to be connected if the inverse image functor γ∗ is full and faithful. If E is connected and locally connected clearly γ_! γ∗ = id .
Recall that a connected atomic topos is a connected, locally connected and boolean topos.

A covering of a topos E is a geometric morphism of the form E/X −→ E, with X a locally constant object.

$ 5.1. Locally constant object
Déf 5.1.1: X is U-split if there is a cover U={U_i} [U_i->>1] such that X
is constant on U_i: γ∗Si × Ui -θi→ X×Ui pour un set Si.
X loc. constant s'il est U split pour un cover.

Si on identifie la famille Si avec une fonction S->I où S=\sum S_i et
U=\sum U_i, alors U->>1 et θ: γ∗S ×_{γ∗I} U → X × U over U. 

When the topos is connected a classical (in the theory of topological coverings spaces) connectivity argument shows that all the sets Si can be considered equal (see [5] for a proof of this in the topos context).
We comment to the reader interested in the relative theory over an
arbitrary base topos that the connectivity argument depends on the excluded middle. Based on this, even when the topos is connected, in the relative case the “single set version” of the notion will not be equivalent to the “family version” of SGA4 or [7], even for connected topoi (unless the base topos is boolean).

(*) Assume now that E is locally connected. In this case, by enlarging I, we can always consider I = γ_! U. In fact, the connected components of U = ∑_i Ui are the connected components of the U_i. Repeat then the same set Si for each connected component of Ui. The map ζ : U → γ∗γ_! U results the unit of the adjunction γ_! ⊣ γ^∗ at U.

We consider now a locally connected topos. Given a cover U, the full subcategory Split(U) of objects split by U is a topos (see [1], [5]), in fact a quotient topos with inverse image given by the inclusion. Obviously the adjunction γ_! ⊣ γ^∗ restricts to Split(U), and so this topos is locally connected. It is immediate to check that it is boolean (given ֒ Z → X in Split(U), then Z × U  ֒→ X × U has a complement and this implies that ֒ Z → X has one, (see [5]). Thus Split(U) is an atomic topos, and clearly, if E is connected, so is Split(U).

Given any topos, the covers U → 1 epi form a (co) filtered poset Cov(E) if we define U ≤ V ⇐⇒ ∃ U → V . This poset has a small cofinal subset. In fact, as observed in [3], the irredundant sums of generators with global support, of which there is only a set, are cofinal.

If U ≤ V , it is immediate to check that Split(V) ⊂ Split(U), and that the inclusion is the inverse image of a geometric morphism of topoi. In this way we have a filtered inverse limit of topoi. Clearly the inverse limit site for this topos is the full subcategory of all connected locally constant objects of E, and the topos, that we denote GLC(E), as a category, is the full subcategory of objects generated by the locally constant objects. It follows that the inclusion is the inverse image of a geometric morphism, and E → GLC(E) is a quotient topos. Again, the adjunction γ! ⊣ γ∗ obviously restricts to GLC(E), and so this topos is locally connected. In the same way that for Split(U) it is immediate to check that it is boolean, thus it is an atomic topos, and if E is connected, so is GLC(E).

In [6] a push-out topos is considered in order to define categories of
locally constant objects: P_U=Pushout de [E/U, E; S/γ_! U, P_U] où
ρ∗_U(S→γ_!U)=γ∗S ×_{γ∗γ!U}  U and φ∗:E->E/U; U(X) -> X × U. It is well
known that the geometric morphism φ_U:E/U->E is locally connected, and it
can be checked that the geometric morphism ρ_U:E/U->S/γ_!U is connected and
locally connected. It follows that f_U:S/γ_!U->P_U is locally connected and
that σ_U:E->P_U is connected locally connected.

The functor σ∗_U is the projection functor P_U → E, which is then fully faithful
and the essential image is Split(U). Thus Split(U) and P_U are equivalent
topoi.
The morphism f_U:S/γ_!U->P_U is actually a family of points indexed by γ!U, and since it is locally connected, all these points are essential. The inverse image of f_U is given by f∗_ U〈 X, S → γ_!U, θ 〉 = S → γ_! U
(où θ : X × U → γ∗S ×_{γ∗γ_!U} U an isomorphism over U).

So we can apply Section 3.2 to Split(U):
From proposition 3.2.2 we have the following important fact (existence of Galois closure)

Proposition 5.1.3. Given any locally connected topos E and a cover U, for each i ∈ γ_! U the composite, denoted f_i, of the corresponding point of S/γ_!U with f_U is an essential point of P_U.

Proposition 5.1.4.
Given any connected locally connected topos E and any cover U, Split(U) = Split(A), and P_U ∼= P_A, for A any representing object (necessarily a Galois object (5.2), thus in particular a connected cover) of one of the points f_i.

Proposition 5.1.5. In the situation of proposition 5.1.3, any point g is isomorphic to some f_i.

It follows then from proposition 3.2.1 that when the topos is connected, all the points f_i are isomorphic. Furthermore, given any locally connected topos E and a connected cover U (notice that this forces E to be a connected topos) we have:
Proposition 5.1.6.
Given any connected locally connected topos E and a connected cover U, the topos P_U has a canonical essential point f = f_U, and any other point is isomorphic to f.

Here it is important to stress the fact that although there is a canonical (geometrical morphism) equivalence Split(U) =~ PU, the topos Split(U) does not have a canonical point since the equivalence does not have a canonical inverse.

$ 5.2. Galois objects.
Definition 5.2.1.
A Galois Topos is a connected locally connected topos generated by its Galois object, où A Galois if it is an Aut(A)-torsor, ie A->>1 et A × γ∗Aut(A) −→ A × A is an isomorphism.

Since Galois objects are locally constant, clearly the canonical morphism gives an equality of topoi E = GLC(E). In particular, Galois topoi are atomic. 

Proposition 5.2.2.
Given any connected geometric morphism E f−→ F, an object A∈F is a Galois object if and only if f∗A∈E is so.

Proposition 5.2.3.
Any filtered inverse limit of Galois topoi and connected locally
connected geometrical morphisms is a Galois topos.

Theorem 5.2.4.
Given any connected locally connected topos E, the topos GLC(E) is a Galois
topos. In particular GLC(GLC(E))=GLC(E).

Corollary 5.2.5.
Given any connected locally connected topos E, then E is a Galois topos if and only if E is generated by its locally constant objects if and only if E = GLC(E).

Let GCov(E) be the subposet of Cov(E) whose objects are Galois objects (necessarily covers). Although it is not cofinal , it is also filtered. In fact, given two Galois objects A, B , consider the Galois object C such that Split(A×B) = Split(C) given by proposition 5.1.4. We have
Proposition 5.2.6.
Any Galois topos is the filtered inverse limit of the topoi Split(A), A ∈ GCov(E). The inverse limit site is the filtered union of the full subcategories cSplit(A)⊂E of connected objects split by A.

The original definition of Galois object given in [12] was relative to a point of the topos. However, that point was surjective, and it is easy to check:
Proposition 5.2.7.
Let E be a topos furnished with a surjective point (meaning the inverse image functor reflects isomorphisms), S f−→ E. Then, a non-empty connected object A is a Galois object if and only if there exists a ∈ f∗A so that the map Aut(A) -a∗→ f∗A , defined by a∗(h) = f∗(h)(a) is a bijection (the same holds then for any other element b ∈ f∗A).
Notice that this characterization of Galois objects is word by word equal
to the definition of normal extension in the classical Artin’s
interpretation of galois theory.

#### ncafe: Topoi of gsets

https://golem.ph.utexas.edu/category/2018/10/topoi_of_gsets.html

For any group G, the category of G-sets is a Boolean topos
(il est même atomique [décomposer X en orbites], connected, avec un point
[G est un modèle dans Set car c'est un torseur]

On a [H,G]=[BH,BG] où je note BG=G-sets. On voit facilement que tout
morphisme géométrique [BH,BG] est ici essentiel.
[cf Marta Bunge, Galois groupoids and covering morphisms in topos theory (2004) pour l'extension au cas des groupoids. On remarque aussi que dans le cas d'un groupe, G0={*} donc toute weak equivalence est forte!]
Note que si H est un sous-groupe de G, alors Set->BH->BG nous donne un
point atomique de BG: c'est G/H. Si H est normal on a même
Set->BH->BG->B(G/H)->Set.

Th: The category GSet comes with a forgetful functor U:GSet→Set
Galois/Tannaka: The group of natural automorphisms of U just G.

Proof: GSet has only one point. However, this point has a symmetry group,
which is G. (Because GSet is the “classifying topos for G-torsors”.) => U
is represented by this G-set freely generated by one element (a.k.a. the
G torsor) so by Yoneda we just need to look at the morphisms from this
G-set to itself, which are indeed G.

* Extension to Lawrere theories: Nat(U^n->U)=~F(n):
  Relatedly, if T is any Lawvere theory (say) and Set^T is the category of algebras, with underlying-set functor U:Set^T→Set, then the set of natural transformations U^n→U carries a T-algebra structure that is naturally isomorphic to the free algebra F(n) on n generators. You can generalize this to monads and their algebras, and n doesn’t have to be finite.
The idea is that U^n≅hom(n,U−)≅hom(F(n),−):Set^T→Set, and by Yoneda the set of natural transformations hom(F(n),−)→U is naturally isomorphic to the underlying set UF(n). 

* Connetectedness: the topos Set^G is connected for any (discrete) groupoid G that is connected in the categorical sense; but the topos Sh(X) is also connected for any space X that is connected in the topological sense.
    D3.4.14 exemple of a connected atomic topos without a point.

* Galois theory of a topos.
  C5.2.13 and C5.3.8: a Grothendieck topos is connected, atomic, and has a point if and only if it consists of the continuous discrete actions of some localic group.
  C5.2.14(c): The localic group in question can be characterized somewhat explicitly in terms of classifying topoi. If the topos E classifies some theory T, then the point s:Set→E classifies some T-model M∈Set, and the localic group G is the automorphism group of this model M with the “topology of pointwise convergence” (the scare quotes are because in general we’re talking about locales rather than spaces).
  C5.2.10: For a discrete group G, the topos GSet admits a proper surjection from a localic topos if and only if G is finite.
  Proposition [Joyal-Tierney 84]. For every Grothendieck topos ℰ there is a localic groupoid 𝒢 such that ℰ≃Sh(𝒢).
  Proposition [Butz-Moerdijk 98]. If ℰ has enough points, then there exists a topological groupoid 𝒢 such that ℰ≃Sh(𝒢)

* Morita equivalence of groupoids:
  C5.3 of the Elephant, but there doesn’t seem to be a complete answer given. Three classes of functors between localic groupoids are shown to induce equivalences of toposes:
  - open weak equivalences: functors that are internally full-and-faithful in LocLoc (in the usual sense for internal categories), and essentially “surjective” where the relevant notion of surjection is an open surjection.
  - dually, proper weak equivalences.
  - the map from any open or proper localic groupoid G_1⇉G_0 (i.e. one for which the source and target maps are open or proper) to its “étale-completion”, which is the kernel pair of the geometric morphism Sh(G_0)→Sh(G_1⇉G_0)
  and it is shown that any geometric morphism between toposes of sheaves on étale-complete open (or proper) localic groupoids can be represented by a span of functors between these étale-complete open (or proper) localic groupoids in which the backwards-pointing arrow is an open (or proper) weak equivalence. This gives a sort of representation of the 2-category of toposes as a 2-category of fractions of that of étale-complete open localic groupoids (but not proper ones, since not every topos can be presented by a proper localic groupoid).

* Bunge’s characterization of presheaf toposes. One version of her theorem (from her 1966 thesis) states that presheaf categories are precisely (cocomplete) atomic categories = the full subcategory Atom(E) of atomic objects is small and dense où ici Atom est à prendre au sens de tiny, ie E(a,−):E→Set preserves colimits

* Tannaka-Krein
First, I want to draw your attention to how cute the structure of the proof of “Tannaka-Krein reconstruction over Set” is: its content consists of exactly two applications of the Yoneda lemma, one to show that the group of automorphisms of the fiber functor is the group of automorphisms of the G-set G, and the other to show that the group of automorphisms of the G-set G is GG (Cayley’s theorem).

Second, here’s a context for relating this result to the usual Tannaka-Krein theorem. Let’s consider the 2-category of symmetric monoidal cocomplete categories, or SMCCs for short (where part of the requirement is that the monoidal structure distributes over colimits), and symmetric monoidal cocontinuous functors. Probably I should also require presentability but that won’t really be relevant to anything I’m about to say. Two important classes of examples to keep in mind are Grothendieck topoi and quasicoherent sheaves on stacks. The nLab term here is “symmetric 2-rig” but I really dislike that terminology, among other things because it’s actually incompatible with e.g. the standard notion of a 2-group (a 2-ring doesn’t have an underlying additive 2-group). But I do want to think of SMCCs as categorified commutative rings, so as a setup for doing “2-affine algebraic geometry,” where Grothendieck topoi live “over Spec(Set)” and quasicoherent sheaves live “over Spec(Ab).”

General forms of the Tannaka-Krein theorem due to Lurie and others assert that if XX and YY are stacks satisfying some hypotheses, then symmetric monoidal cocontinuous functors QC(Y)→QC(X), possibly satisfying some hypotheses, correspond to morphisms X→Y of stacks. The specialization to Tannaka-Krein for finite groups occurs when Y=BG for a finite group G and X is a point (and we’re working over an algebraically closed field of characteristic zero, say): morphisms X→Y then correspond to G-torsors on a point, and there’s one isomorphism class of these with automorphism group G, and correspondingly there’s a unique fiber functor from QC(BG)≅Rep(G) to QC(pt)≅Vect, with automorphism group G.

So what these theorems say is that some stacks are 2-affine in the sense that their theory fully faithfully embeds into the theory of SMCCs.

Tannaka-Krein over Set is the same story about BGBG and a point, only instead of working over a field we work over Set, and “symmetric monoidal cocontinuous functor” is upgraded slightly to “geometric morphism” (it’s a bit annoying that these don’t quite coincide). The more general claim about torsors is then a special case of Diaonescu’s theorem, which further implies that the fiber functor G-Set→Set is uniquely determined up to isomorphism by being geometric. Probably it’s even determined up to isomorphism by being symmetric monoidal cocontinuous.


# Stacks

Presentable stacks
------------------

* https://arxiv.org/abs/math/0306176
Topological and Smooth Stacks
David Metzler
    We review the basic definition of a stack and apply it to the topological and smooth settings. We then address two subtleties of the theory: the correct definition of a ``stack over a stack'' and the distinction between small stacks (which are algebraic objects) and large stacks (which are generalized spaces). 

Cf $5.1 p.41 for the small topos and gros topos of a topological space
and $5.2: 
Proposition (Giraud [Gir71]). Let F be a stack over a site C. Then there is a strict stack G over C and a natural equivalence i:F∼→G of stacks
Hence we can suppose that we start with a strict small stack F on Op(X). In particular this is an honest sheaf of groupoids. It is easy to see ([AGV72], [MLM94]) that this is the same thing as a groupoid object in the category Sh(Op(X)) of (small) sheaves of sets on X. But this is the same as a groupoid object, call it G, in the category of  ́etale spaces over X.

* https://projecteuclid.org/download/pdf_1/euclid.agt/1513715541
An étalé space construction for stacks
DAVID CARCHEDI (2013)

We generalize the notion of a sheaf of sets over a space to define the notion of a small stack of groupoids over an étale stack.  We then provide a construction analogous to the étalé space construction in this context, establishing an equivalence of 2–categories between small stacks over an étale stack and local homeomorphisms overit. These results hold for a wide variety of types of spaces, for example, topological spaces, locales, various types of manifolds, and schemes over a fixed base (where stacks are taken with respect to the Zariski topology). Along the way, we also prove that the 2–category of topoi is fully reflective in the 2–category of localic stacks.

Note the appendix C: Sheaves in groupoids versus stacks

* https://arxiv.org/abs/1212.2282
Étale Stacks as Prolongations
David Carchedi (2012-2013)
    In this article, we derive many properties of étale stacks in various contexts, and prove that étale stacks may be characterized categorically as those stacks that arise as prolongations of stacks on a site of spaces and local homeomorphisms. Moreover, we show that the bicategory of étale differentiable stacks and local diffeomorphisms is equivalent to the 2-topos of stacks on the site of smooth manifolds and local diffeomorphisms. An analogous statement holds for other flavors of manifolds (topological, Ck, complex, super...), and topological spaces locally homeomorphic to a given space X. A slight modification of this result also holds in an even more general context, including all étale topological stacks, and Zariski étale stacks, and we also sketch a proof of an analogous characterization of Deligne-Mumford algebraic stacks. We go on to characterize effective étale stacks as precisely those stacks arising as the prolongations of sheaves. It follows that étale stacks (and in particular orbifolds) induce a small gerbe over their effective part, and all gerbes over effective étale stacks arise in this way. As an application, we show that well known Lie groupoids arising in foliation theory give presentations for certain moduli stacks. For example, there exists a classifying stack for Riemannian metrics, presented by Haefliger's groupoid RΓ and submersions into this stack classify Riemannian foliations, and similarly for symplectic structures, with the role of RΓ replaced with ΓSp. We also prove some unexpected results, for example: the category of smooth n-manifolds and local diffeomorphisms has binary products.

$ Appendix B. ́Etale Stacks and their Sheaf Theory

Remark B.3 . A stack XX comes from an S-groupoid if and only if it has an atlas, ie a representable épi X->XX.

Proposition B.1.
A stack XX over S is  ́etale if and only if it admits an  ́etale atlas p : X → XX , that is a representable epimorphism which is a local homeomorphism

Non-abelian cohomology
----------------------

* http://www.numdam.org/article/CTGDC_1982__23_2_165_0.pdf
JOHN DUSKIN
An outline of non-abelian cohomology in a topos : (I) The theory of bouquets and gerbes

* https://www.researchgate.net/profile/Joyal_Andre/publication/225537361_Strong_Stacks_and_Classifying_Spaces/links/54d1151b0cf28959aa7a6951/Strong-Stacks-and-Classifying-Spaces.pdf
Strong Stacks and Classifying Spaces, Joyal Andre, Myles Tierney, 1991

$ 1 Torsors and stacks

E topos.

* Torseurs pour un groupe

Si G est un groupe, un G-torseur est un objet non nul X (ie X->>1)
avec une action libre et transitive XxG->X, ie XxG =~ XxX.
Une map X->Y de G-torseur (compatible avec l'action) est toujours un iso.

Torsors solve the problem of finding all objects T locally isomorphic to a given object S of E. T is locally isomorphic to S if there exist a cover K->>1 et un iso TxK =~ SxK au-dessus de K. De manière équivalente, Iso(S,T) est non vide; si G=Aut(S) alors T loc isomorphic to S <=> Iso(S,T) est un G-torseur, on retrouve T par l'évaluation mapping: T= Iso(S,T) \tens_G S.
Ainsi H^1(G):={iso class of G-torsors in E}:={iso class of objects loc iso
to S}.

For a general object X, a G-torsor over X is T->X with a free right action
TxG->T over X (free: TxG -> TxT injective) et tel que T/G->X est un iso.
If E=category of simplicial sets, G-torsor = principal G-bundle.
H^1(G,X)=isomorphism classes of G-torsors over X, ie in E/X.
Si S est un objet, G=Aut(S), alors la correspondance plus haut vue dans E/X
donne une bijection entre H^1(G,X) et les classes d'iso d'objets T->X loc.
isomorphe (dans E/X) à XxS->X. (Such an object in simplicial sets is just a
fibre bundle with fiber S).

* Torseurs pour un groupoide

G-torsor (over 1) = T->G0 with a free transitive (contravariant) action T xG0 G1 -> T
A G-torsor T->X over X is a G-torsor in E/X. H^1(X,G)=iso class of
G-torsor in E/X.

If f:Y->X, T G-torsor over X, f*T is a G-torsor over Y.
If g:G->H, T \tens_G H is a H-torsor.
=> H^1(X,G) is contravariant in X and covariant in G and only depends on the weak equivalence class of G.

Torsors for a groupoid solve the problem of finding all objects T locally
isomorphic to a familly S->I, ie a cover c:J->>I such that J*T =~ c*S dans E/J.
En effet, soit G le groupoide Iso(S,S)->IxI le groupoide des iso des fibres
S->I, c'est aussi l'objet Iso(SxI,IxS) dans E/IxI, qui a la prop.
universelle suivante: si f,g:J->I alors (f,g):J->IxI se factorise par
Iso(S,S) ssi f*(S)=g*(S) dans E/J. Alors si T est loc. isomorphe à S,
Tiso:=Iso(S,T) est un G-torseur, et l'évaluation donne un isomorphisme
Tiso \tens_G (S) =~ T. Ainsi {T loc. isomorphe à S->I}=H^1(G):={G-torseurs}.

* Stacks pour un groupoide

Si G est un groupoïde, hom(X,G) est le groupoide (dans Set) dont les objets sont X->G0 et une map f->g une application f:X->G1 tel que la composition
X->G1->G0xG0 soit (f,g). Comme t:G1->G0 est un G-torseur, et que Iso_G(G1,G1)->G0xG0 est canoniquement isomorphe à G1->G0xG0, on a un foncteur pleinement fidèle
hom(X,G)->H(X,G) := la catégorie des G-torseurs [note: H^1(X,G)=∏_0(H(X,G))]
qui à f:X->G0 associe f*G1.
Déf: G est un stack si c'est une équivalence, autrement dit le foncteur est
representative: pour tout G-torseur T->X, il existe f:X->G0 tel que T=~f*G1.
Par ex. si G=Iso(S,S)->IxI, G est un stack ssi S->I est 'complete', ie si
T->X est loc. isomorphe à S->I, il existe f:X->I tel que T=~f*(S).

Th 1: si G groupoide, (<=>)
(i) G stack
(ii) pour tout X, un G-torseur T->X a une section X->T
(iii) si H->G, et on a une équivalence faible H->K de groupoides, injective
sur les objets, il existe K->G qui fait commuter le diagramme à iso près
(iv) comme (iii) sans supposer H->K injective sur les objets.

Une stack completion G->G* est une weak equiv telle que G* est un stack;
en particulier H(X,G)=H(X,G*)=hom(X,G*) par définition d'un stack.

$ 2 Strong stacks
Déf: G strong stack si on a Th1:(iii) où on demande que le diagramme soit
exact, ie ne commute plus à iso près.

Si E topos de Grothendieck, une strong stack completion existe toujours.
In fact, we prove more: strong stacks are the fibrant objects for a Quillen homotopy structure on Gpd(E).

$ 3 Strong stacks in categories
Rappel: si F->E est une fibration, F est un stack si
(i) F(\sum X_i)=\prod F(X_i)
(ii) si X->>Y, F(Y)=~des F(X).
Une catégorie interne C de E est un stack si son externalisation [C] est un
stack. Note: (i) est automatique.
Reformulation: une donnée de descente pour X->>Y est un foncteur
de la relation d'équivalence, vue comme catégorie, X x_Y X vers C; on a une weak-equivalence X x_Y X vers Y (discrète), et C est donc un stack si X x_Y X -> C s e complète en Y_dis->C.

Comme X x_Y X et Y_dis sont des groupoides, C est un stack ssi Iso(C) (le
groupoide où on ne conserve que les isos de C) en est un.

Passing from groupoids to categories in E, torsors are replaced by locally
representable functors. Si C est une catégorie, et F:C->E un foncteur
interne, représenté par F->C0 et une action F xC0 C1->F, alors on peut
définir la catégorie des éléments FF:=F xC0 C1 -> FxF.
F est dit loc. représentable si T(FF)={les objets terminaux de la catégorie
FF, ie t tels que pour tout a dans FF_0 il existe une unique map a->t dans
FF_1} \subset FF_0 est non vide (ie T(FF)->>1 est une surjection).
Rem: si C est un groupoide et l'action est free et transitive, T(FF)=~F, donc F torsor ssi F loc. représentable. En général, F est loc représentable ssi T(F) est un Iso(C) torseur.

On peut définir une action de C sur une famille F->X comme une action de la
catégorie interne XxC sur F->X dans E/X; ou encore comme une action de C
sur F telle que la map F->X est constante. On dit que F->X est une famille loc.
représentable indexée par X si F->X est loc. représentable dans E/X.
Autrement dit, T(FF)_X la catégorie des objets terminaux de X calculée
fibralement au dessus de X vérifie T(FF)_X->>X.
C'est le cas ssi T(FF)_X est un Iso(C)-torseur au-dessus de X.
Dans ce cas, X =~ π_0(F), donc F est loc. représentable ssi il y a un objet
terminal (au sens interne) dans chaque composante de la catégorie des
éléments de F. On dit que F est une famille X-indexée de foncteurs
représentables si T(FF)_X->X split.

Comme pour les groupoides, on a un foncteur pleinement fidèle
hom(X,C)->H(X,C):=category of locally representable families indexed by X
(en effet t:C1->C0 est loc. représentable).

Th 3: (<=>)
(i) C stack
(ii) every loc. representable family of functors is representable
(iii) pour tout X, Hom(X,C) =~ H(X,C)
(iv) si A->C, et on a une équivalence faible A->B de catégories, injective
sur les objets, il existe B->C qui fait commuter le diagramme à iso près
(v) comme (iii) sans supposer A->B injective sur les objets.

Si Iso(C)* est une stack complétion de Iso(C), on peut construire une
stack complétion de C comme le pushout Iso(C) \subset C via
Iso(C)->Iso(C)*.

Prop 6: C is a strong stack (ie on a (iv) sans iso près) ssi Iso(C) strong
stack.

$ 4 Strong stacks and classifying spaces
S(E)=topos des objets simpliciaux dans E, si G est un groupoide dans S(E), alors son nerf N(G) est un double objet simplicial. On note BG sa diagonale:
BG_n=N(G)_nn.

Prop 7: si G est un groupoide dans S(E) et G* sa strong stack complétion,
alors G*_0 est weakly equivalent dans S(E) à BG.

Th 5: si G est groupoide 'amenable' dans S(E), et G->G* sa strong stack
complétion, alors pour tout X dans S(E), H^1(X,G) =~ [X, G*_0], ie G*_0 est
un espace classifiant des G-torseurs.

Note: G est 'amenable' si il est locally transitive, ie G1->G0xG0 est une
fibration de Kan.

Plus de détail sur ces espaces classifiant dans
https://www.sciencedirect.com/science/article/pii/0022404993900917
Classifying spaces for sheaves of simplicial groupoids
André Joyal, Myles Tierney

# 2-Catégories

Calculus of fractions
---------------------

* Le calcul général de fractions dans une bicatégorie est introduit ici:
DORETTE A. PRONK (1996): Etendues and stacks as bicategories of fractions
http://archive.numdam.org/ARCHIVE/CM/CM_1996__102_3/CM_1996__102_3_243_0/CM_1996__102_3_243_0.pdf

* Cependant on utilise souvent ça pour inverser des weak equivalences entre
groupoides (pour l'étude de stack presentable), où la construction peut
être simplifiée:
https://perso.uclouvain.be/enrico.vitale/FrazioniFedeli.pdf
FAITHFUL CALCULUS OF FRACTIONS, O. ABBAD AND E.M. VITALE (2013)
Dans cet article, nous developons un argument simple sur les bicategories
de fractions qui montre que, si Σ est la classe des equivalences faibles
entre groupoides internes à une categorie reguliere A qui admet
suffisamment d’objets projectifs reguliers, alors  la description  de
Grpd(A)[Σ^−1] peut etre considerablement simplifiee.

* Une autre simplification utilisant des anafoncteurs
  Note: il y a un appendix sur les sites superextensifs.
  https://arxiv.org/abs/1101.2363
  Internal categories, anafunctors and localisations
David M. Roberts (2011)
    In this article we review the theory of anafunctors introduced by Makkai and Bartels, and show that given a subcanonical site S, one can form a bicategorical localisation of various 2-categories of internal categories or groupoids at weak equivalences using anafunctors as 1-arrows. This unifies a number of proofs throughout the literature, using the fewest assumptions possible on S.

* Ce papier remplace le système de fraction par de l'homotopie et explique
  comment on peut voir des stacks algébriques comme de l'homotopie entre
  prestacks algébriques.
  https://arxiv.org/abs/1303.0340
Bicategorical fibration structures and stacks
Dorette A. Pronk, Michael A. Warren (2013)

    The familiar construction of categories of fractions, due to Gabriel and Zisman, allows one to invert a class W of arrows in a category in a universal way. Similarly, bicategories of fractions allow one to invert a collection of arrows in a bicategory. In this case the arrows are inverted in the sense that they are made into equivalences. As with categories of fractions, bicategories of fractions suffer from the defect that they need not be locally small even when the bicategory in which W lives is locally small. Similarly, in the case where W is a class of arrows in a 2-category, the bicategory of fractions will not in general be a 2-category.
    In this paper we introduce two notions ---systems of fibrant objects and fibration systems--- which will allow us to associate to a bicategory B a homotopy bicategory Ho(B) in such a way that Ho(B) is the universal way to invert weak equivalences in B. This construction resolves both of the difficulties with bicategories of fractions mentioned above. We also describe a fibration system on the 2-category of prestacks on a site and prove that the resulting homotopy bicategory is the 2-category of stacks. Further examples considered include algebraic, differentiable and topological stacks. 

* https://arxiv.org/abs/1402.7108
 On certain 2-categories admitting localisation by bicategories of fractions
David Michael Roberts (2014-2015)
    Pronk's theorem on bicategories of fractions is applied, in almost all cases in the literature, to 2-categories of geometrically presentable stacks on a 1-site. We give an proof that subsumes all previous such results and which is purely 2-categorical in nature, ignoring the nature of the objects involved. The proof holds for 2-categories that are not (2,1)-categories, and we give conditions for local essential smallness.

Intro:
  The author’s [9] considered the case of a sub-2-category C→Cat(S) of the 2-category of categories internal to a subcanonical site (S, J), satisfying some mild closure conditions. The main result of [9] is that such 2-categories admit a bicategory of fractions at theso-called weak equivalences(also called Morita equivalences), and that anafunctors also calculate this localisation.

Theorem 3.1. A 2-site (K, J), given by a fully faithful singleton coverage, admits a bicategory of fractions for W_J (the weak equivalences)

Example 2.3. As an example, take the 2-category K to be Cat(S) or Gpd(S) for (S, T) a finitely complete site with singleton pretopology T (ie a class of arrows containing all identity arrows and closed under composition and pullback).
The pretopology J=J(T) is defined to be the class of fully faithful functors such that the object component is a cover in T. This is the case studied in [9].

Theorem 3.1 allow to extend the result of [9] to (internal) over
categories:

Corollary 3.6: Cat(S)/X, Gpd(S)/X also admit bicategories of fraction for
the weak equivalence.

∞-categories
============

* ∞-stacks

- https://arxiv.org/abs/1312.2204
  Higher Orbifolds and Deligne-Mumford Stacks as Structured Infinity Topoi
  David Carchedi (2013-2016)
    We develop a universal framework to study smooth higher orbifolds on the one hand and higher Deligne-Mumford stacks (as well as their derived and spectral variants) on the other, and use this framework to obtain a completely categorical description of which stacks arise as the functor of points of such objects. We choose to model higher orbifolds and Deligne-Mumford stacks as infinity-topoi equipped with a structure sheaf, thus naturally generalizing the work of Lurie, but our approach applies not only to different settings of algebraic geometry such as classical algebraic geometry, derived algebraic geometry, and the algebraic geometry of commutative ring spectra as in Lurie's work, but also to differential topology, complex geometry, the theory of supermanifolds, derived manifolds etc., where it produces a theory of higher generalized orbifolds appropriate for these settings. This universal framework yields new insights into the general theory of Deligne-Mumford stacks and orbifolds, including a representability criterion which gives a categorical characterization of such generalized Deligne-Mumford stacks. This specializes to a new categorical description of classical Deligne-Mumford stacks, a result sketched in previous work of the author, which extends to derived and spectral Deligne-Mumford stacks as well.

# Books

## Z.L. Low: Algebraic Theories

### Chapter 1 Monads

$ 2 Monadicity 

- Eilenberg-Moore: for each adjunction F ⊣ U : D → C inducing the monad T, there is a unique functor K : D → C^T such that K F = F^T, U =U^T K
  KA := (UA, U \epsilon_A)
- Kleisli: for each adjunction F ⊣ U : D → C inducing the monad T, there is a unique functor K : D → C^T such that F = K F^T, U^T= U K
  KX := FX

Limits for a monadic functor U:
- U creates and preserves limit: if L is a limiting cone in C, there exists
  a unique T-module structure on L such that L is a limiting cone in C^T.
- a monadic functor creates all colimits that the monad preserves:
Proposition ... Let T be a monad on a category C. Given a diagram (A•,α•) : J → C^T, if both λ : A• ⇒ ∆B and Tλ : TA• ⇒ ∆TB are colimiting
cocones in C and T^2λ:T^2A•⇒∆T^2B is jointly epimorphic, then there exists
a unique T-module structure β:TB→B such that λ : (A•,α•) ⇒ ∆(B,β) is a
colimiting cocone in C^T.

Proposition ... Let T be a monad on a category C, and let ϵ be
the counit of the free–forgetful adjunction F ⊣ U : C^T → C. For any T-module
(A,α), the diagram T^2A => TA -> A
is a split coequaliser diagram in C, and the diagram
FUFU(A,α) => FU(A,α) -> (A,α) [ie T^2A => TA -> A seen in C^T]
is a coequaliser diagram in C^T, where the pair FUFU(A,α)=>FU(A,α) is reflexive.

Theorem .. (Beck’s monadicity theorem). Let U : D → C be any functor.
A U-split pair is a pair of morphisms g,h:C→B in D such that there exists
a split coequaliser diagram of the form
UC => UB -> X in C. The functor U : D → C is monadic if and only if
(a) U has a left adjoint F : C → D,
(b) U is conservative,
(c) D has coequalisers for all reflexive U-split pairs and U preserves them.

Since it needs only a little more effort, we prove a more precise theorem:
Theorem .. (Beck). Let U : D → C be a functor with left adjoint F : C → D,
and let T be the induced monad. Suppose D has coequalisers for
all reflexive U-split pairs.
(i) The comparison functor K : D → C^T itself has a left adjoint L : C^T → D.
(ii) If U preserves coequalisers of reflexive U-split pairs, then the unit of the adjunction L ⊣ K : D → C^T is a natural isomorphism.
(iii) If U reflects coequalisers of reflexive U-split pairs, then the counit of the adjunction L ⊣ K : D → C^T is a natural isomorphism. [=> D is a reflective subcategory of C^T]

Corollary .. (Imprecise monadicity theorems). A conservative functor
U : D → C with a left adjoint is monadic if any of the following additional
conditions are satisfied:
• (CTT). D has coequalisers of all reflexive pairs whose images under U
admit a coequaliser, and U preserves them.
• (VTT). D has split coequalisers of all reflexive U-split pairs.
• (WTT). D has coequalisers of all parallel pairs and U preserves them.
Moreover, the composite of any two functors satisfying the CTT / VTT / WTT
condition also satisfies the CTT / VTT / WTT condition, respectively.
Proposition ... If U : D → C satisfies the CTT condition and V : C → E is
monadic, then the composite VU : D → E is also monadic.

Proposition ... A monadic functor is an amnestic [ie Uf=Id => f=Id] isofibration [ie isomorphisms lifts] if and only if it is strictly monadic.

$  Colimits in the Eilenberg–Moore category

Theorem .. (Linton). Let T be a monad on a finitely cocomplete (resp.
cocomplete) category S. The following are equivalent:
(i) S^T has coequalisers for all reflexive pairs.
(ii) S^T has all finite (resp. small) colimits.

Definition ... Let C be any category with pullbacks, and let A be an object
in C. A congruence on A is a parallel pair k0,k1 : K → A with the following
properties:
• (Relational). the morphisms k0 and k1 are jointly monic.
  [ie if products exist, K → A×A is a monomorphism]
• (Reflexivity). there is a (unique) morphism r : A → K such that
  k0 ◦ r = id_A = k1 ◦ r
• (Symmetry). there is a (unique) morphism s : K → K such that
  k0 ◦ s = k1; k1 ◦ s = k0
• (Transitivity). Given a pullback square as below,
  q1: K ×A K -> K
        . q0    . k0
  k1:   K    -> A
  there is a (unique) morphism t : K ×A K → K such that
  k0 ◦q0 = k0 ◦ t;    k1 ◦q1 = k1 ◦ t
The quotient of a congruence (k0,k1) is the coequaliser of k0 and k1, if it
exists.
Ex: if C has pullback, the kernel pair of f:A->B is a congruence on A.
Note: the intersection of a small family of congruences on A is also a
congruence on A.

Lemma ... Let C be any category with pullbacks, and let f : A → B be any
morphism in C. If there exists c : B → A such that f ◦ c = idB, then there is a
split coequaliser diagram of the form
  K => A -> B
in C, where k0,k1 : K → A is the kernel pair of f.

** Let S be a wellpowered complete and cocomplete exact category where all
regular epimorphisms split (ex: S=Set). **

Proposition ... A congruence K in S^T has a quotient (which is created by U)
Pr: U preserves limits, so UK is a congruence on UA, which has a split
quotient, so there exists a unique T-module structure on this quotient.

Corollary ... A T-module homomorphism f : (A,α) → (B,β) is a regular epimorphism in S^T iff f: A → B is a regular epi in S.
Pr: f is regular <=> f is the quotient of its kernel pair, but quotient of
congruences are created by U.

Theorem ... If T is a monad on S, then S^T has all small colimits.
Pr: By Linton's theorem, we want to prove that S^T has coeqs for all
parallel pairs. If g,h:A->B is such a pair, we take the intersection K of all
congruences on B through which (g,h) factor; the quotient of this
congruence is the coeqs of g,h. Note that K is a small intersection because
if (k: K->BxB is a mono, there is at most one sub-T-module structure on K
compatible with BxB).

$  Morphisms of monads

Definition ... Let S be a monad on C and let T be a monad on D. A morphism of monads S → T consists of
• a functor F : C → D and
• a natural transformation φ : TF ⇒ FS
satisfying the following equations:
φ • η^TF = Fη^S [compatibility of units]
φ • µ^TF = Fµ^S • φS • T φ [compatibility of composition]

Remark ... In the special case C = D and F = id_C, the monad morphism
is entirely determined by the natural transformation part T ⇒ S—note the
direction! For this reason, some authors define monad morphisms using
the opposite convention.

Ex 1.4.3: If A is a monoid in Set, there is a monad AA(M)=A \times M.
f: B->A is a morphism of monoid <=> f: AA->BB is a morphism of monad.

Th: There is a 2-category of monads:
Proposition ... If (F,φ) : S → T and (G,ψ) : T → V are morphisms of
monads, then (G,ψ)◦(F,φ) = (GF,Gφ•ψF)
Definition ... Let (F,φ),(F′,φ′): S → T be two morphisms of monads. A
transformation of monad morphisms ψ : (F,φ) ⇒ (F′,φ′) is a natural
transformation of functors θ : F ⇒ F′ satisfying the following equation:
  φ′•Tθ = θS•φ
Proposition ...
(i) Given two transformations of monad morphisms θ : (F,φ) ⇒ (F′,φ′),
θ′: (F′,φ′) ⇒ (F′′,φ′′), the vertical composite θ′•θ is a transformation
of monad morphisms (F,φ) ⇒ (F′′,φ′′).
(ii) Given monad morphisms (F,φ),(F′,φ′) : S → T, (G,ψ),(G′,ψ′) : T → V
and transformations θ : (F,φ) ⇒ (F′,φ′), σ : (G,ψ) ⇒ (G′,ψ′), the
i) Given monad morphisms �F,φ�,�F ′,φ′� : � → �, �G,ψ�,�G ′,ψ′� : � → �
and transformations θ : �F,φ� ⇒ �F ′,φ′�, σ : �G,ψ� ⇒ �G ′,ψ′�, the
horizontal composite σ ◦ θ = σF′ •Gθ = G′θ • σF
is a transformation (G,ψ) ◦ (F,φ) ⇒ (G′,ψ′) ◦ (F′,φ′).

The Eilenberg–Moore construction extends to a (strict!) “-functor” from the
“-category of monads” to the “-category of categories”:

Proposition ... A morphism of monads (F,φ) : S → T induces a functor
F^φ : C^S → D^T, given by F^φ(A,α) = (FA,Fα ◦ φ_A); this respects
composition of monad morphisms S->T->V.
Proposition... A transformation of monad morphisms θ : (F,φ) ⇒ (G,ψ)
induces a natural transformation of functors θ∗: F^φ ⇒G^ψ, where
(θ∗)_(A,α) = θ_A for each S-module (A,α),
and this respects horizontal and vertical composition of transformations.

Converse:
Proposition ... Let S be a monad on C, let T monad on D.
If Φ : C^S → D^T comes from F : C → D (ie U^T Φ = F U^S), then Φ = F^φ for a unique monad morphism (F,φ) : S → T.
Proposition ... Let (F,φ),(G,ψ) : S → T be morphisms of monads. If
θ : F^φ⇒G^ψ is a natural transformation such that there exists a natural transformation θ : F⇒G for which θ_{(A,α)} = θ_A
for all S-modules (A,α), then θ is a transformation (F,φ) ⇒ (G,ψ).

Corollary ... Let I be the identity monad on the terminal category. For
any monad T on any category C, the category of monad morphisms I → T
together with their transformations is isomorphic to the category C^T.

Definition ... Let U,R,U′,R′ be functors as in the diagram below,
R': C′-> D′
    .U σ .U'
R : C -> D   ; where σ: RU=>U′R′ is an isomorphism.
Let F ⊣ U and F ′ ⊣ U ′ be adjunctions. Define ˆσ : F′R ⇒ R′F to be the natural
transformation: epsilon^{F'U'} R'F . F' \sigma F . F' R \eta^{UF}.
We say the Beck–Chevalley condition holds for the diagram above when ˆσ is a natural isomorphism, and the strict Beck–Chevalley condition holds when both σ and ˆσ are identities.

Proposition ... Let S be a monad on C and let T be a monad on D. 
Let R^φ : C^S → D^T be the functor induced by a morphism of
monads (R,φ) : S → T. The Beck–Chevalley condition holds for the diagram
R^φ: C^S -> D^T
      .     .
R:    C  -> D
if and only if φ : TR ⇒ RS is a natural isomorphism, and the strict Beck–
Chevalley conditions holds if and only if TR = RS and φ = id.
Proposition ... In the case above, if R is fully faithfull and
φ : TR ⇒ RS is a natural isomorphism (ie the Beck-Chevalley condition
hold), then: a T-module (X,ξ) is in the essential/strict image of R^φ iff X
is in the essential/strict image of R.

$  Descent and base change

Let A and B be rings, not necessarily commutative, and suppose we have
a ring homomorphism f : B → A. This induces an adjunction between the
respective categories of left modules:
A ⊗_ (−) ⊣ Hom_A(A,−) : Mod(A) → Mod(B)
The right adjoint is in fact (isomorphic to a functor) induced by the
morphism of monads induced by the ring homomorphism, and we will see later
in this section that the functor induced by a morphism of monads has a left
adjoint under mild assumptions.

Now, consider a general adjunction of categories:
F ⊣ U : D → C
We think of U as being “restriction of scalars” and F as being “extension of
scalars”
The descent problem for F asks for a characterisation of those
objects A in D that arise as FX for some object X in C, and a way to reconstruct X given FX. The formal dual of theorem .. immediately gives a necessary condition: A must have the structure of a comodule for the induced
comonad G = (FU,ϵ,FηU). Indeed, if A = FX, then the adjunction unit
η_X : X →UFX gives us a morphism ξ = Fη_X : A → FUA such that
ϵ_A ◦ ξ = id_A; Fη_{UA} ◦ ξ = FUξ ◦ ξ
exactly as required for (A,ξ) to be a G-comodule. We think of this as a 
‘descent datum’ for F.
Notice that we have a coreflexive fork in C for each object X:
X->UFX => UFUFX
Moreover, its image under F is a reflexive split equaliser in D:
FX -> FUFX -> FUFUFX
which induce a split equaliser [todo: reflexif non?] diagram in the category D_G of comodules for G.

Thus, if D_G is to be a ‘good’ model of C, the adjunction unit η_X : X → UFX should be the equaliser of UFη_X,η_{UFX} :UFX →UFUFX. This motivates the following
definition:
Definition ... A functor of comonadic descent type is a functor F : C → D
with the following properties:
• F has a right adjoint U : D → C, and
• for each object X in C, the adjunction unit η_X : X → UFX is the equaliser of
UFη_X,η_{UFX} : UFX → UFUFX.

Let G be the comonad induced by the adjunction F ⊣ U. If F : C → D is a
functor of comonadic descent type and every G-comodule is isomorphic to
one of the form (FX,FηX), then we say comonadic descent is effective for F.

Proposition ... Let F ⊣ (U : D → C) be an adjunction of categories with unit
η : id_C ⇒ UF and counit ϵ : FU ⇒ id_D. Let G be the induced comonad on D,
and let K : C → D_G be the comparison functor induced by the formal dual of
the Eilenberg–Moore theorem (..). The following are equivalent:
(i) For each object X in C, the adjunction unit η_X : X → UFX is a regular
monomorphism.
(ii) F : C → D is a functor of comonadic descent type.
(iii) K : C → D_G is fully faithful.
In particular, comonadic descent is effective for F if and only if F is a comonadic.

Since a functor F : C → D is of effective comonadic descent type if and
only if it is comonadic, the formal dual of Beck’s theorem gives us necessary
and sufficient conditions for comonadic descent to be effective for F:
Theorem ... Let F : C → D be a functor with a right adjoint U : D → C.
(i) F is a comonadic functor if and only if F is conservative, C has equalisers
for all reflexive F-split pairs and F preserves them.
(ii) F is a functor of comonadic descent type if C has equalisers for all
reflexive F-split pairs and the left adjoint F reflects them.

Example ... A⊗_B (−) is comonadic when A is a faithfully flat B-algebra,
[= it preserves and reflects all exact sequences]

We now give the promised construction of a left adjoint for the functor
induced by a morphism of monads (R,φ): S → T. We may think of this
as being a ‘base change’ functor, for the following reason. Suppose L_φ :
D^T → C^S is a left adjoint to R^φ : C^S → D^T. By the uniqueness of left adjoints up to isomorphism, we must have L_φ F^T ∼= F^S L, therefore L_φ(TA,µ_A^T)
must be isomorphic to (SLA,µ^S_{LA}). 
Moreover, for any T-module (A,α), we have a reflexive coequaliser diagram
  T^2A => TA -> A 
in D^T, so its image under L_φ must be a reflexive coequaliser diagram in C^S:
SLTA => SLA -> L_φ(A,α)
This is the essential idea behind the construction of L_φ: roughly speaking,
L_φ(A,α) is built using the same plan as (A,α), but with the free T-modules
replaced by the corresponding free S-modules.
Theorem ... Let S be a monad on C, let T be a monad on D.
Let (R,φ) : S → T be a morphism of monads, and suppose C^S has coequalisers for all reflexive pairs.
(i) If R : C → D has a left adjoint L : D → C, then R^φ : C^S → D^T has a left
adjoint L_φ : D^T → C^S.
(ii) If C = D and R = id_C, then R^φ : C^S → C^T is strictly monadic.
     [ie C^S is equivalent to the category of modules for a monad on C^T]

Corollary ... Let T be a monad on a category C, and let C′ be a full 
subcategory of C^T. If C′ has coequalisers for all reflexive pairs and the restriction of the forgetful functor U^T : C^T → C to C′ is monadic, then C′ is a reflective subcategory of C^T.

Example ... Ab, the category of abelian groups, is monadic over Set and
has all coequalisers, so it is a reflective subcategory of Grp.

TODO Z.L. Low: Algebraic Theories $1.6: constructing monads

## Johnstone, The Elephant

### Part A: TOPOSES AS CATEGORIES

#### $ A4 Geometric morphisms - basic theory

$ A4.2 Surjections and inclusions

Theorem A.4.2.1 + Corollaire
Si G est une comonade exacte à gauche, E_G est un topos et f:E->E_G est
géométrique.

Example 4.2.4. 
- Si G est un groupe topologique, Cont(G) est coréflectif dans [G,Set], donc un topos.
- Si C est une petite catégorie, [C^op,Set] est une catégorie comonadique
  au-dessus de Set/ob C.

Prop 4.2.5: si f:E->F géométrique, G,H comonades exactes à gauche sur E
(resp F), alors g: E_G -> F_H géométrique <=> F: f^* G -> H f^* morphisme
de comonade.

Lemma 4.2.6: f: F->E est dit surjectif si E est comonadique sur F. (<=>)
f^* conservatif; f^* fidèle; l'unité de la monade f_*f^* est monic; ou
encore si m:A'->A est un mono dans E, m->f_*f^* m est un pullback square.
Exemple: si f:A->B est un morphisme dans E, le morphisme induit E/A->E/B
est une surjection ssi f est un épi.

Theorem 4.2.10: tout morphisme f:F->E se factorise uniquement en F->G->E où
g:F->G est une surjection, et h:G->E est une inclusion.

Preuve: G est le topos F_GG où GG est la comonade issue de f_* f^*.
h^*: E->G vient du fait que F_GG est la comonade finale, il y a un adjoint
à droite h_* (qui envoie une coalgèbre B sur le coeq f_*B => f_*f^*f_* B),
et on vérifie que la counité h^* h_*->1 est un isomorphisme ce qui est
équivalent à h_* fully faithfull.

Exemple 4.2.12: si f:A->B dans E, la décomposition de F:E/A->E/B vient de
la décomposition A->Im f->B.

$ A4.3 Cartesian reflectors and sheaves

Prop 4.3.1: Si E cartesian closed, L reflexion. L preserve les produits
finis ssi L(E) est un exponential ideal in E. Dans ce cas B^LA =~ B^A
pour B dans L.

On suppose maintenant que L est une réflexion qui préserve les pullbacks
Lemme 4.3.2: L définit un universal closure operator. c_L(A')=pullback de
LA'->LA le long de A->LA.

Lemme 4.3.3: Si c est une universal closure, si on a un diagramme
A' -> B' avec A'-->A dense et B'-->B clos alors il existe A->B'
A  -> B  qui fait commuter le diagramme.

Déf 4.3.4: A is separated/sheaf ssi pour tout B'-->B dense,
Hom(B,A) -> Hom(B',A) est injectif/bijectif.

Lemme 4.3.6:
A is c_L separated (<=>)
- A->LA monic
- A subobject of an object of L
- Diagonal A->AxA is closed
A is a c_L sheaf (<=>)
- A->LA is an iso
- A object of L

Lemme 4.3.7: si B-->A est c-dense, le pullback donne une bijection entre
les (classes d'isos) des sous-objets clos de A et ceux de B.
(L'autre sens est donné par la closure de B'-->B-->A).

Lemme 4.3.8: si A est un c-sheaf, A'-->A est c-closed <=> A' est un c-sheaf
[Cf aussi Johnstope, Topos Theory, 3.26:
si A separated, A'-->A, alors A' l'est aussi.
si F sheaf et G separated, a mono F-->G is closed]

Theorem A.4.3.9: si L est une monade idempotente exacte à gauche sur E, la
localisation E_L est un topos, et f:E_L -> E est une inclusion.
f^* s'interprête comme une sheafication.
En détail:
Theorem 4.3.9: si L est une réflecteur exact à gauche, L(E) est un topos et
L(E)->E une inclusion géométrique, dont l'image inverse est la
factorisation à travers L.
Pr: J=closure de 1->Omega, j:Omega->Omega la topologie associée,
on a alors c_L(A')=sous-objet correspondant à j \chi_A'.
Omega_j=equalisateur de j et 1_Omega. Omega_j classifie les sous-objets
fermés de A (ie A' correspond à \chi_A' se factorise par Omega_j ssi A'
fermé); donc Omega_j est un j-sheaf par 4.3.7, donc le classificateur de
Sh_j(E) par 4.3.8.

=> bijection between geom inclusion, cartesian réflexion, local operators (=topology),
universal closure operation

Prop 4.3.11: f:F->E se factorise à travers L(E) ssi f*(m) est un iso pour
tout mono c_L-dense m ssi f_*(B) est un c_L sheaf pour tout B de F
ssi f*(g) est un iso pour tout morphisme bidense ssi f*(1-->J) est un iso
[Cf Johnstone-TT 3.47 pour la dernière ligne]

Cor 4.3.12: si M réflecteur cartésien de F, on a un morphisme M(F)->L(E)
qui fait commuter le diagramme ssi f* envoie les monos c_L dense dans des
monos c_M dense ssi f_* envoie les c_M sheaves sur les c_L sheaves.

[Cf aussi Johnstone-TT $3.4: Sh_j(E) as category of fraction
si f:X->Y dans E, on a R=>X ->>Q --> Y où R est le kernel pair
et la diagonale X-->XxX induit via R-->XxX un morphisme X-->R.
Déf: f almost mono si X-->R est j-dense (mono <=> X-->R iso)
     f almost épi si Q-->Y est j-dense (épi <=> Q-->Y iso)
     f bidense si almost mono+épi
Prop 3.42: si f:A'-->A, L(f) iso <=> f dense
Cor 3.43: f:X->Y, L(f) iso <=> f bidense
Cor 3.44: X->LX est bidense
Prop 3.45 si E_j={bidense morphisms}, E_j admet un calcul des fractions à
droite et à gauche, et Prop 3.46: E[E_j^-1] =~ Sh_j(E).

Remark 3.48: the j-powerset monad X->Omega_j^X is autoadjoint,
it induces a comonad G_j sur E^op, et les coalgèbres (E^op)_G_j
s'identifient à Sh_j(E), et E->(E^op)_G_j s'identifie à la sheafication.

Exo 4 (Lawrere's construction of L): soit m:X->Omega^X ->Omega_j^X
MX l'image de m et LX sa cloture. Alors X->>MX est universel vers les
morphismes de X dans un élément séparé et LX est le faisceau associé.

$ A4.4 Local operators
[=topologie j de lawrere]

J->Omega = sous-objet classifié par j,
Omega_j = equalisateur de j et 1_Omega = image de j.
=> retract of Omega, so injective; Omega_j clasify j-closed subobjects.

A'-->A correspond à \chi_A' -> Omega. Alors il se factorise par
- J ssi A'-->A est j-dense
- Omega_j ssi A'-->A est j-clos.

Theorem 4.4.5: closure operators for quasi topos:
Let c be a proper universal closure opemtion on a quasitopos f. Then the
categories Sep_c(f) and Sh_c(f) are both quasitoposes. Further, if c is
strict, then Sh_c(f) is a topos.

Theorem A.4.4.8: For a quasitopos E, there is a bijection between
reflective subcategories of E with cartesian reflector, and proper
universal closure operations on E. In particular, if E is a topos, there is
a bijection between subtoposes of E and local operators on E.

Paragraphe autour du lemme 4.4.10: construction de A+
en imitant la construction pour un site (cf C2.2.6) de manière interne au
topos.

$ A4.5 Examples of local operators

Open subtopos: si U-->1, on a E/U --> E.
Ex si E=Sh(X) and U open subset, E/U=Sh(U).
The localisation is L(A)=A^U, and j_U is given by
1xOmega ->_{ux1} OmegaxOmega ->_{=>} Omega.

Prop 4.5.1: Let j be a topology, L the reflexion. Sh_j(E) open subtopos of E (<=>)
- L is logical
- L is cartesian closed
- si m:A'->A est j-dense, m^B: A'^B->A^B l'est pour tout B
- \Pi_J(1->J) est un j-dense sous-objet de 1
- there exist u:1->J tel que 1xu: 1xJ -> JxJ se factorise à travers la
  relation d'ordre de J.
Pr: AxU is the smallest j-dense subobject of A.

Closed subtopos: U-->1, j_U  given by 1xOmega ->_{ux1} OmegaxOmega ->_{v} Omega.
=> local operator, which we shall denote by c(U). We shall see below that the local
operators on a topos form a distributive lattice (in fact a Heyting algebra), and
that the open and closed local operators corresponding to a given subterminal
object are indeed complementary to each other in this lattice. For the present,
we note that if U is a complemented subobject of 1, with complement V say,
then c(U) coincides with o(V), by an easy calculation in the Heyting algebra Omega
thus, for a Boolean topos, the notions of open subtopos and closed subtopos
coincide. (Again, we shall see later that if £ is a Boolean topos then its only
subtoposes are open ones.)

Prop 4.5.6: si U-->1, p:L->E and q:M->E the open/closed subtoposes
corresponding to U, then E is the topos obtained by gluing along the
composite q* p_*: L->M.

Prop 4.5.8: j a topology (<=>)
- L_j: E->Sh_j(E) preserves the subobject classifier
- Omega_j -> Omega is j-dense
- Pour tout f: A->Omega, l'équalisateur de f et jf est un sous-objet
  j-dense de A
- Tout mono de E peut se factoriser (pas forcément uniquement) comme un
  monomorphisme j-clos suivi d'un mono j-dense.
- j commute avec =>

Lemme 4.5.11: D sous objet de Omega, E_D={monomorphismes A'->A tels que
\chi_A' se factorise par D}.
- E_D est stable par pullback
- Si 1->Omega se factorise par D (<=> E_D contient tous les isos), E_D est
  stable par pushout
- D->Omega correspond à un J ssi E_D contient les isos et satisfait à
  m o n \in E_D <=> m et n \in E_D pour tout monos composables m et n.

Prop 4.5.12 et Cor 4.5.13: topologie générée par un sous-objet D de Omega
(ie plus petite topologie telle que D<=J, et plus grosse topologie telle que
Omega_j<=D)

Lemme 4.5.21: Conditions pour que Sh_j(E) soit booléen
Prop 4.5.22: E booléen (<=>) every subtopos is boolean / quasi-closed / closed / open
Prop 4.5.23: Any topos admit a surjection B->E, B booléen.

$ A4.6 The hyperconnected-localic factorization

Definition 4.6.1 We say a geometric morphism f: F -> E is localic if every
object of F is a subquotient of one of the form f*A, where A is an object of E.
(ie 1 is a bound for f)

Now let f: F -> E be an arbitrary geometric morphism, and let G be the full
subcategory of F whose objects are all subquotients of objects of the form f*A.
Lemma 4.6.3 
(i) G is coreflective in F.
(ii) G is a topos.

We define a geometric morphism f: F -> E to be hyperconnected if it restricts
to an equivalence between E and the topos G constructed above; equivalently, if
f* is full and faithful, and its image in F is closed under arbitrary
subobjects and quotients.

Theorem 4.6.5 Any geometric morphism can be factored, uniquely up to
equivalence, as a hyperconnected morphism followed by a localic one.
=> the inclusion LTop/E -> Top/E has a left adjoint: the localic reflection

Preuve: F->G is hyperconnected, G->E localic.

[voir aussi https://ncatlab.org/nlab/show/locale#RelationToToposes
Proposition 4.14. The functor Sh(−):Locale→Topos has a left adjoint
L:Topos→Locale
given by sending a topos ℰ to the locale that is formally dual to the frame of subobjects of the terminal object of ℰ]

Proposition 4.6.10 For a geometric morphism f: F -> E (<=>)
equivalent:
(i) The surjection-inclusion and hyperconnected-localic factorizations of f
coincide.
(ii) f can be factored as a composite of morphisms which are either hyperconnected or inclusions.
(iii) The counit of the adjunction (f^* -| f_*) is monic.

### Part B: 2-CATEGORICAL ASPECTS OF TOPOS THEORY

#### $ B1 Indexed categories and fibrations

$ B1.2 Indexed categories

Definition B.1.2.1: une catégorie S-indexée est un pseudofoncteur
S^op->CAT; ie pour une telle catégorie indexée CC, pour x:I->J on a x^*:
CC^J->CC^I.

Exemples 1.2.2:
- si S a les limites finies, on a SS indexée sur S par SS^I:=S/I et les
  pullbacks
- si F:T->S et CC est S-indexée, on a F^* CC indexée sur T.
  En particulier F^* SS est donnée par (F^*SS)^I=S/F(I)
- en particulier si S a les produits on peut réindexer CC par le foncteur
  - x I:S->S pour obtenir (CC^I)^J=CC^(IxJ)

Lemme 1.2.3: si F:T->S catégories avec limites finies, avec adjoint à
droite R. Alors R s'étend en RR: F^* SS -> TT via
S/FI -> S/RFI -> S/I.

Remark 1.2.4: si F a un adjoint à gauche L, L s'étend en F^* SS->TT ssi  L
satisfait les 'Frobenius reciprocity' condition L(A x FI)=~ LA x I of
A1.5.8. We may thus deduce that if S and C are locally cartesian closed
categories and F:T->S is a functor having a left adjoint L, then the
T-indexed functor TT -> F^* SS has an indexed left adjoint iff F is locally
cartesian closed (i.e. F/I: T/I -> S/I  is a cartesian closed functor for
each I).

$ B1.3 Fibred categories

Definition 1.3.1: si CC est indexée sur S, on peut définir la "catégorie
des éléments" aka "la catégorie de Grothendieck" G(CC) par
- un objet est (I,A) où I \in S, A \in CC^I
- un morphisme (I,A)->(J,B) est un morphisme x:I->J dans S et g:A->x^*(B) dans C^I
  La composée (y,g)o(x,f) est (yox, x*g o f)
  Ainsi (x,f)=(x,1)o(1,f) est la composée d'un morphisme vertical suivi
  d'un morphisme horizontal.
Alors G(CC)->S est une fibration, et réciproquement toute fibration C/S donne
une catégorie indexée via I->C^I=fibre au-dessus de I (Theorem 1.3.5).

$ B1.5 Descent conditions and stacks

[Johnstone: predescent:=descent; descent:=effective descent]

In verifying that a particular morphism is a descent morphism, the
following result (due to J. Beck; it was this result that first emphasized
the importance of the Beck-Chevalley condition) is often useful.

Proposition 1.5.5 Suppose C is an S-indexed category having S-indexed
products, and let x: J -> I be a morphism of S. Then
(i) Desc(C, (x)) is isomorphic to the category of coalgebras for the comonad
G on C J induced by the adjunction (x* -| ∏_x).
(ii) x is a descent morphism for C iff x*: C_I -> C_J is comonadic.
(iii) In particular, if C is S-complete, then x is a descent morphism for C iff
x*: C_I -> C_J is conservative.

Proposition 1.5.6 Let S be a cartesian category, and x: J -> I a morphism
of S. Then
(i) x is a pre-descent morphism (for the canonical indexing of S over itself)
iff it is a stable regular epimorphism (i.e. every pullback of x is a regular
epimorphism).
(ii) In particular, if S is regular, then x is a pre-descent morphism iff it is a cover.
(iii) Suppose either that S is effective regular, or that S is cartesian and has
pullback-stable coequalizers of reflexive pairs. Then every cover in S is a
descent morphism.

Scholium 1.5.7 Let S be a cartesian category, and let P be a class of
morphisms of S such that
(i) P contains all isomorphisms, and is closed under composition;
(ii) P is stable under pullback;
(Hi) every member of P is a coequalizer;
(iv) if a, b: R => A is an equivalence relation for which a (equivalently, b) is in P, then it has a pullback-stable coequalizer which belongs to P.
Then every morphism of P is a descent morphism.

#### $ B3 Toposes over a base

$ B3.1 S-toposes as S-indexed categories

Si p:E->S est un morphisme de topos, p^* induit un morphisme de catégories
S-indexées p^*: SS->EE.
Donc on a un morphisme géométrique EE->SS, et EE est cocomplet et loc.
small en tant que S-catégorie.
Si f:E->F au dessus de S, l'ajonction f^* -| f_* s'étend en f:EE->FF.
Cependant, si f_! existe, il ne s'étend pas forcément en S-foncteur; on dit
que f: E->F est S-essentiel si c'est le cas.

Ex: si F:C->D est un foncteur S-interne, [C,S]->[D,S] est S-essentiel.

Theorem 3.1.2 For an S-indexed topos EE, the following are equivalent:
(i) EE is S-complete and locally small.
(ii) EE is S-cocomplete and locally small.
(iii) There exists a geometric morphism p: E^1->S, such that EE is equivalent
to the indexed category I -> E^1/p^*I.
Moreover, if these conditions are satisfied, then the geometric morphism in (iii) is unique up to unique 2-isomorphism.

Remark 3.1.4 The assertion, for an S-indexed topos EE, that there exists an
S-indexed geometric morphism EE -> S, is strictly weaker than the
equivalent conditions of 3.1.2. The reason is connected with the fact,
noted at the end of A4.1.9, that a topos defined over Set need not be
cocomplete (in the classical sense); if we take E to be an incomplete
Set-topos such as the one described in A2.1. 7, then the Set-indexing of E
arising from the geometric morphism E -> Set does not coincide with the
naive indexing I -> (I-fold power of E) (in fact the latter is the stack
completion of the former, for the coverage of 1.5.4); the former is
(complete and) cocomplete as a Set-indexed category, but the latter is not.
However, both indexed categories admit Set-indexed geometric morphisms to
the canonical indexing of Set over itself. On the other hand, it can be
shown that an S-indexed topos admitting an indexed geometric morphism to S
is locally small, by the indexed version of the argument of A4.1.9; so we
may if we wish add 'EE is S-cocomplete and admits an S-indexed geometric
morphism to S' to the equivalent conditions of 3.1.2.

Prop 3.1.5: Top/S(E,F) =~ Top_S (EE,FF).

S-toposes are complete, cocomplete and locally small as
S-indexed'categories. They are also well-powered and well-copowered, by
1.3.14 and 2.2.7; hence we shall be particularly interested in those which
have S-indexed separating and/or coseparating families as defined in 2.4.1,
so that we can apply the S-indexed adjoint functor theorem to them.

Lemme 3.1.6: p:E->S est bounded (<=>)
(i) EE has an S -indexed separating family.
(ii) There exists an object B of E such that every object of E is a subquotient
(cf. A4.6.1) of one of the form p*IxB.
(iii) ...
Prop 3.1.13: if B is a bound, PB is a coseparator for EE.

Examples 3.1:.8 (a) Localic morphisms, as defined in A4.6.1, are bounded;
they are exactly those geometric morphisms such that 1 is a bound
(b) Interpreting the proof of 3.1.6 in the case S = Set, we see that a bound
for a Set-topos E is simply an object B whose subobjects form a separating
set (equivalently, since E is balanced, a generating set) for E. In particular,
if a Set-topos E has a generating set {G i liE I} such that the coproduct
lliEI G i exists in E, then the latter is a bound for E.

$ B3.2 Diaconescu's Theorem

Theorem 3.2.7 (Diaconescu's Theorem) Let S be a topos, C an internal
category in S and p: E -> S a geometric morphism. Then there is an equivalence
of categories Top/S(E, [C,S]) =~ Tors(C,E), which is natural in E.
[Note: Johnstone appelle Tors un foncteur interne plat]

Exemple 3.2.9: si N est un objet de nombres naturels, C le cardinal fini
générique dans S/N et SS_f=SS[C] (ie the free category with finite
S-indexed coproducts generated by the terminal category 1), alors 
Top/S(E, [S_f, S]) =~ E.
Let I be an object of S, and let K(I) denote the object of
K-finite sub objects of I, alors Top/S(E, [KK(I), S]) =~ Sub_E(p^* I)

Corollary 3.2.12: Si p:E->S, et CC interne dans S, alors [CC,S]->S
a pour p-pullback [p^* CC, E]->E.

$ B3.3 Giraud's Theorem

Theorem 3.3.4 (Giraud's Theorem) For a geometric morphism p: E->S (<=>)
(i) p is bounded.
(ii) There exists an internal category CC in S and an inclusion E -> [CC, S] in Top/S

Corollary 3.3.5: p localic <=> E s'injecte dans [PP,S] où PP est un
préordre interne <=> E s'injecte dans [HH^op, S] où HH est une algèbre de
Heyting complète interne.

Prop 3.3.6: le pullback d'un morphisme géométrique bounded/localic le long
d'un morphisme géométrique existe et est bounded/localic.

Proposition 3.3.8
(i) For any bounded geometric morphism p, the diagonal Delta_p is localic.
(ii) If p is localic, then Delta_p is an inclusion.
(iii) If p is an inclusion, then Delta_p is an equivalence.

Theorem 3.3.11 Let S be a topos, and EE an S-indexed category. (<=>)
(i) EE is an S-indexed oo-pretopos with a separating family.
(ii) EE is a locally small, cocomplete S-indexed topos with a separating family.
(iii) There exists a bounded geometric morphism p: E-> S such that EE is
equivalent to the indexing of E over S induced by p* .
(iv) There exists an internal category CC in S, such that EE is equivalent to a
reflective indexed subcategory of the indexed functor category [CC, S] with
cartesian reflector.

### Part C: TOPOSES AS SPACES

#### $ C2 Sheaves on a site

$ C2.1 Sites and coverages

Corollary 2.1.11 For a small category C, the assignment J -> Sh( C, J) is a
biJection from the set of Grothendieck coverages on C to the class of reflective
subcategories of [C^op, Set] with cartesian reflector.

[En effet J est un sieve ssi en tant que sous-objet de Omega, le sub-object
classifier de [C^op, Set], il correspond à j:Omega->Omega une topologie]

$ C2.2 The topos of sheaves

Theorem 2.2.3 (Comparison Lemma) Let (C, J) be a site such that C is
locally small, and let D be a small J-dense subcategory of C. Then the
restriction functor Sh(C, J) =~ Sh(D, J_D) just defined is (one half of) an
equivalence of categories.

Theorem 2.2.8 For a category E, the following are equivalent:
(i) There exists an essentially small site (C, J) such that E=~Sh(C, J).
(ii) There exists a small site (C, J) such that E=~ Sh(C, J).
(iii) There exists a standard site (C, J) such that E=~ Sh(C, J).
[a site (C, J) is standard if C is small and cartesian, and J is subcanonical, ie all covering sieves are effective-epimorphic]
(iv) E is a cocomplete, locally small topos with a separating set of objects.
(v) E is a topos, and there exists a bounded geometric morphism E -> Set (cf. B3.1.7).
(vi) E =~ Map(A), where A is a tabular effective positive geometric allegory
with a strong separator (cf. A3.4.11).
(vii) E is an oo-pretopos with a separating set of objects.
(viii) E is locally small and has a small subcategory which is dense for
the canonical coverage, and every sheaf for the canonical coverage is
representable.
(ix) E is locally presentable (cf. D2.3.4), locally cartesian closed and balanced, and is effective as a regular category.

Corollary 2.2.12 A Grothendieck topos E has enough points iff there exists a
surjection Set / K =~ E for some set K.

Note: tout morphisme de topos de Grothendieck vient d'un morphisme de site
(quitte à changer le site par un site "Morita"-équivalent).

#### $ C3 CLASSES OF GEOMETRIC MORPHISMS

$ C3.1 Open maps

f: F -> E to be open if its inverse image f* is a Heyting functor.

Theorem 3.1.7 For a geometric morphism f: F -> E, (<=>)
(i) f is open, i.e. f^* is a Heyting functor.
(ii) f^* commutes with universal quantification.
(iii) f^* is a sub-logical functor.
(...)

Proposition 3.1.8 For a geometric morphism f: F -> E, the following are
equivalent:
(i) f_* commutes with universal quantification.
(ii) f_* is sub-logical.
(iii) f is an inclusion.

Corollary 3.1.9
(i) Any hyperconnected geometric morphism is open.
(ii) A geometric morphism is open iff the localic part of its hyperconnected-localic factorization is open.

Corollary 3.1.12
(i) Open surjections are regular epirnorphisms in Loc.
(ii) If an open map is a monomorphism in Loc, then it is an inclusion (i.e. a
regular monomorphism).

Proposition 3.1.19
(i) Let (C, J) be an internal site in a topos S, such that every J-covering family is inhabited. Then the geometric morphism Shs(C, J) -> S is open.
(ii) A bounded geometric morphism f: E -> S is open iff there exists a site of
definition for E over S in which every cover is inhabited.

Scholium 3.1.20 A bounded geometric morphism f: E -> S is an open surjection iff there is a site of definition (C, J) for E over S such that C has a terminal
object and every J-covering sieve is inhabited.

Corollary 3.1.21 A geometric morphism f: :F->E between bounded S-toposes
is an open surjection iff it can be defined by a fibration of sites
(P, T): (D, K) -> (C,J) in S for which P preserves covers.

Theorem 3.1.28 A geometric morphism is stably left weak Beck-Chevalley (in
the sense of 2.4.16) iff it is open.

Theorem 3.1.27 et 3.1.23: le pullback de f open+bounded l'est aussi
(+surj si f l'est); le pullback de f open par g bounded est open (+surj si
f l'est).

$ C.3.2 Proper maps

f: F -> is closed if, for every object A of E and every closed subtopos C of F /If*(A), the image of the composite C -> F/f*(A) -> E/A is a closed subtopos of E/A.
[nlab: https://ncatlab.org/nlab/show/closed+subtopos
Let U be a subterminal object of a topos ℰ. Then c_U(V)≔U∪V defines a Lawvere-Tierney topology on ℰ, whose corresponding subtopos is called the closed subtopos associated to U.
In case ℰ=Sh(X) is the topos of sheaves on a topological space X, a subterminal object is just an open subset U of X and the closed subtopos corresponding to it is equivalent to Sh(X∖U).

https://ncatlab.org/nlab/show/subtopos
If ℰ is an elementary topos then subtoposes correspond to Lawvere-Tierney topologies j on ℰ, to localizations of ℰ as well as to universal closure operators on ℰ.]

Corollary 3.2.17
(i) A geometric morphism is proper iff both halves of its surjection-inclusion
factorization are proper, iff it can be factorized as a proper surjection
followed by a closed inclusion.
(ii) Proper geometric morphisms are closed.

$ C3.3 Locally connected morphisms

We defined a geometric morphism f: F -> E to be essential if its inverse
image functor f* has a left adjoint f_! as well as its right adjoint f*.
However, the class of essential geometric morphisms is not as well-behaved
as one might like. One reason (which we noted in B1.2.4) is that although,
when we make F and E into E-indexed categories, the adjunction (f* -| f_*)
is always indexed over E, the adjunction (f_! -| f*) need not be, even
though (f/A)* has a left adjoint for every object A of E. Accordingly, it
is advantageous to study the more restricted class of morphisms f: F->E for
which f* has an E-indexed left adjoint: for reasons adumbrated after 1.5.9
above, we call such morphisms locally connected.

Proposition 3.3.1 (<=>) f:F->E
(i) f is locally connected.
(ii) f* commutes with ∏-functors
(iii) For each object A of E, the functor (f/A)*: E/A->F/f^*A is cartesian closed.

Corollary 3.3.2
(i) stable left Beck-Chevalley morphism (in the sense of 2.4.16) <=> locally connected.
(ii) Locally connected morphisms are open.
(iii) A composite of locally connected morphisms is locally connected.
(iv) ...
Loc. connected morphisms are stable by (bounded) pullback, cf Th 3.3.15.

We recall from 1.5.7 that f is said to be connected if f* is full and faithful.
For locally connected morphisms, there is a particularly simple criterion for
connectedness:
Lemma 3.3.3 Let f: F -> E be a locally connected geometric morphism. Then
f is connected iff the left adjoint f_! of f* preserves 1.

Local homeo: F->E is of the form E/A->E; => loc. connected.

Proposition 3.3.5
(i) Any locally connected morphism can be factored, uniquely up to
equivalence, as a connected locally connected morphism followed by a local
homeomorphism.
(ii) A geometric morphism f: F -> E is locally connected iff, for each
object B of F, the composite F / B -> F -> E may be factored as a connected
morphism followed by a local homeomorphism.

We say an object A of (the domain of) a locally connected S-topos p: E -> S is
connected if p_!A = 1; equivalently, if the composite geometric morphism E/A ->
E -> S is connected as well as locally connected. From the fact that p_! is an
S-indexed left adjoint, we may deduce what is really a reformulation of 3.3.5(ii):
Lemma 3.3.6 If p: E -> S is a locally connected topos over S, then every object
of E is expressible as an S-indexed coproduct of connected objects.

Thus we may think of p_!A, for a general object A of E, as 'the object of
connpcted components of A'. Saying that A is connected is equivalent to saying
that it has no nontrivial 'E-indexed decompositions'; that is, any morphism
A -> p*I factors through p*x for some x: 1 -> I in S. Hence the decomposition
of 3.3.6 is unique.

Next, we consider how local connectedness can be characterized in terms of
sites. We saw in Section C3.1 that openness corresponds to the condition 'all
covers inhabited'; in a similar way, local connectedness corresponds to 'all covers connected'. Given a sieve R on an object U of a category C, we say R is connected if it is connected as a full subcategory of C/U, and a site (C,T) is locally connected if every cover is connected.

Theorem 3.3.10 Let p: E -> S be a bounded geometric morphism. Then p is
locally connected iff there exists a locally connected internal site (C, T)
in S such that E = Sh_S(C, T) in Top/S. Moreover, p is connected and
locally connected iff there exists a locally connected site of definition
for E whose underlying category C has a terminal object.

Proposition 3.3.12 Let f: F->E be a geometric morphism between bounded
S-toposes. Then f is connected and locally connected iff it can be induced by a
fibration of sites (P, T): (D, K) -> (C, J) in S such that P preserves covers and every K-covering sieve is J-locally connected.

$ C3.4 Tidy morphisms

As we noted after 1.5.5, the condition that the direct image functor Sh(X)
-> Set should preserve directed unions of subterminal objects, which is
equivalent to compactness of the locale X, seems less 'natural' in
topos-theoretic terms than the condition that this functor should preserve
all filtered colimits. But the latter is appreciably stronger: we shall
call a locale X (or more generally a Set-topos E) strongly compact if the
direct image functor Sh(X) -> Set (resp. E -> Set) preserves filtered colimits.

Definition 3.4.2 Following I. Moerdijk and J. Vermeulen [858], we shall
call a geometric morphism f: :F -> E tidy if it makes :F into a strongly
compact E-topos, i.e. if the direct image functor f_* preserves filtered
E-indexed colimits.

Corollary 3.4.11 A bounded geometric morphism f: F->E is tidy iff it is a
stable right Beck-Chevalley morphism in the sense of 2.4.16.

pure-entire factorization of a geometric morphism:
recall that a morphism f: F -> E is said to be entire if it is localic and
the corresponding internal locale X in E is compact and zero-dimensional
(i.e. O(X) is generated by its complemented elements).
pure: f_* preserves 2:=1 \cup 1.

Lemma 3.4.12
(i) A morphism f is pure iff f_* preserves finite coproducts.
(ii) Hyperconnected morphisms are pure.

Prop 3.4.13
Every geometric morphism can be factored as a pure morphism followed
by an entire morphism, and the factorization is unique up to canonical
equivalence.

Lemma 3.4.14 For a geometric morphism f: F->E, the following are
equivalent:
(i) f is connected.
(ii) f* preserves E-indexed coproducts.
(iii) The pullback of f along any entire morphism with codomain E is pure.

$ C3.5 Atomic morphisms

= geometric morphisms whose inverse image functors are logical.
Ex: local homeo
=> essential, locally connected

Corollary 3.5.2 Let E be a Grothendieck topos with enough points. Then E is
Boolean iff the unique geometric morphism: E -> Set is atomic.

Remark 3.5.7 Using the descent theorem for open surjections, we shall see
in 5.2.12 below that if f: E->S is connected atomic and has a section, then
E may be identified with the topos of continuous G-sets for a suitable
localic group G in S. In particular, it is bounded over S. That is, a
connected atomic morphism with a section is necessarily bounded.

Theorem 3.5.8 For a bounded geometric morphism p: E->S (<=>)
(i) p is atomic.
(ii) There exists an internal site (C, T) for E over S such that C satisfies the
right Ore condition, and T consists either of all inhabited sieves on objects
of C or of all sieves generated by single morphisms of C.
(iii) There exists a site (C, T) as in (ii), but with the additional property that each morphism of C is an effective epimorphism.

Proposition 3.5.10 Let f: F -> E be a geometric morphism between bounded
S-toposes. Then f is connected and atomic iff it can be defined by a
fibration of sites (P, T): (D, K) -> (C, J) in S such that P creates covers.

Corollary 3.5.14 A bounded geometric morphism f: F -> E is atomic iff both
f and the diagonal morphism F ->F x_E F are open.

$ C3.6 Local maps

Th 3.6.1 f: F->E is a local geometric morphism, if (<=>)
(i) f* has an E-indexed right adjoint.
...
=> tidy

Scholium 3.6.6 A geometric morphism f: F->E between bounded S-toposes
is local iff it can be induced by a fibration of sites (P, T): (D, K) ->(C, J) in S such that T reflects (as well as preserves) covers.

Theorem 3.6.16: totally connected: (<=>)
(i) f is locally connected and the left adjoint f_! of f* is cartesian.

#### $ C5 Toposes as groupoids

$ C5.1 The descent theorems

Theorem 5.1.1 Suppose f: F -> E is bounded, surjective and either locally
connected or tidy. Then objects descend along f.

Theorem 5.1.6 Open surjections, and proper surjections, are descent morphisms in BTop.

Proposition 5.1.8 S-essential surjections, and relatively tidy surjections, are
lax descent morphisms in BTop/S.

$ C5.2 Groupoid representations

Theorem 5.2.1 Let S be a topos with a natural number object. For any
bounded geometric morphism p: E->S, there exists an open surjection f: F->E
such that the composite pof is localic.
[Theorem 5.2.7: on peut même supposer f:F->E connected and locally
connected]

Etendue='locally localic' topos, i.e. a topos E containing a well-supported object A such that E/A is localic

Lemma 5.2.4 Let C be a small category. Then the functor category [C, Set] is
an etendue iff every morphism of C is epic. (etendu: exist A->>1 tel que
E/A est localic)

Lemma 5.2.5 A Grothendieck topos E is an etendue iff there exists a site of
definition (C, J) for E such that every morphism of C is monic.

Theorem 5.2.11 Let S be a topos with a natural number object.
(i) For any bounded S-topos E, there exists a connected and locally connected
localic groupoid G in S such that E =~ Cont_S(G).
(ii) For any etendue E over S, there exists an atomic localic groupoid G in
S (that is, one whose domain and codomain maps are local homeomorphisms) such that E =~ Cont_S(G).
(iii) For any bounded S-topos E having a K-finite pre-bound over S, there exists
a proper localic groupoid G in S such that E =~ Cont_S (G).

Pr: si on a un morphisme de descente f:F->E avec F localic (par exemple f
open surjection comme plus haut), alors f est localic par A4.6.2, et F x_E
F => F aussi par B3.3.6, donc F x_E F est localic, et de même pour F x_E F
x_E F. On a donc un groupoïde interne G dans Loc(S).
Plus exactement G_n est la locale simpliciale définie par Sh_S(G_n)=F_n:=F
x_E... (n fois). Comme Loc_S->Top/S préserve les limites, G_. a les mêmes
types de limites que F_. En particulier G_2=>G_1=>G_0 est un pullback dans
Loc(S), ce qui implique que G est un groupoid interne (on utilise la
préservation des pullbacks à G_3 pour montrer l'associativité).
The descent theorem tells us that we have Cont_S(G) =~ Desc(F.) =~ E.

Note: a localic groupoid G is open (resp. proper, locally connected,
tidy, ... ) if its domain and codomain maps d1,d0: G_1 -> G_0 have the
property in question. Note that this will automatically be the case (for
any pullback-stable property of geometric morphisms) if the covering
morphism F -> E from which we start has the corresponding property.

Theorem 5.2.13 Any connected atomic S-topos with a point is equivalent to
one of the form Cont_S(G), where G is an open localic group in S (i.e. one such
that G -> 1 is open).

Pr: the point s:S->E is an open surjection, and the corresponding G satisfy
G_0=1, ie G is a group.

$ C5.3 Morita equivalence for groupoids

BTop/S may be regarded as a category of fractions of the full subcategory
of Gpd(Loc(S)) whose objects are etale-complete open localic groupoids in S,
obtained by inverting the open weak equivalences.
[etale-complete: Sh(G_1) -> Sh(G_0) est un pullback.
                    |          |
                 Sh(G_0) -> Cont(G)
On peut toujours etale compléter un groupoid en remplçant G1 par G1hat tel
que Sh(G1hat)=>Sh(G0) est la kernel pair de Sh(G0)->Cont(G).
