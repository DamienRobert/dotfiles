vim: ft=markdownlight fdm=expr

https://fr.wikipedia.org/wiki/Espace_vectoriel_topologique
Tout voisinage de l'origine est absorbant; on a un système de voisinage de
zéro équilibré.

Espace localement convexe
=========================

https://fr.wikipedia.org/wiki/Espace_localement_convexe
<=> la topologie est définie par une famille de semi-normes
(prendre la jauge des voisinages convexes)

Théorème — Soit E un espace localement convexe séparé, dont la topologie est définie par une famille P de semi-normes. Les conditions suivantes sont équivalentes :
 - E est métrisable.
 - Tout point de E possède une base dénombrable de voisinages.
 - La topologie de E peut être définie par une sous-famille dénombrable D ⊂ P de semi-normes.
 - La topologie de E peut être définie par une famille dénombrable filtrante de semi-normes.
 - La topologie de E peut être définie par une distance invariante par translation.

Hahn-Banach: convexe fermée = faiblement fermé
=> un espace loc convexe a toujours la topologie duale de la bornologie de
son dual (ie des parties équicontinues); et s'il est séparé => il se plonge
dans son bidual.

Espace de Fréchet
-----------------
https://fr.wikipedia.org/wiki/Espace_de_Fr%C3%A9chet
Espace de Fréchet: E espace localement convexe complètement métrisable
Ex: Banach

Théorème: https://fr.wikipedia.org/wiki/Espace_de_Fr%C3%A9chet
- L'hypothèse de complétude permet d'appliquer aux espaces de Fréchet le théorème de Baire et ses conséquences, entre autres :
   - le théorème de Banach-Steinhaus : toute famille simplement bornée d'applications linéaires d'un espace de Fréchet dans un espace vectoriel topologique est équicontinue ;
   - le théorème de l'application ouverte : toute application linéaire continue surjective entre deux espaces de Fréchet est ouverte ;
   - son corollaire : toute application linéaire continue bijective entre deux espaces de Fréchet est un homéomorphisme ;
   - le théorème du graphe fermé : toute application linéaire de graphe fermé entre deux espaces de Fréchet est continue.
- La convexité locale assure aussi les propriétés suivantes :
  - les points d'un espace de Fréchet sont séparés par son dual topologique (cf Théorème de Hahn-Banach).
  - tout convexe compact d'un espace de Fréchet est l'adhérence de l'enveloppe convexe de ses points extrémaux (cf Théorème de Krein-Milman).
- Le théorème d'inversion locale ne s'applique pas en général aux espaces de Fréchet, mais une version faible a été trouvée sous le nom de théorème de Nash-Moser (en).
- Tout quotient d'un espace de Fréchet par un sous-espace vectoriel fermé est complet (donc est un espace de Fréchet)1. L'hypothèse de métrisabilité est ici cruciale2.

Définitions
-----------
Disque: convexe équilibré

Tonneau: https://fr.wikipedia.org/wiki/Ensemble_tonnel%C3%A9#Propri.C3.A9t.C3.A9s = Convexe fermé équilibré absorbant.
        (a) T est un tonneau ;
        (b) T est le polaire d'un ensemble M convexe, équilibré et fortement borné dans E′ ;
        (c) il existe une semi-norme p sur E, semi-continue inférieurement, telle que T soit l'ensemble des x ∈ E satisfaisant à p(x)≤1
Tout espace localement convexe admet une base de voisinages de 0 tonnelés.

Borné: absorbé par tout voisinage de zéro.
Bornivore: absorbe tout borné.
Bornologie canonique/Von Neuman: Bornologie donnée par les bornés

Quasi Complet: un filtre de Cauchy borné converge (rem contrairement aux
suites de cauchy un filtre de cauchy n'est pas forcément borné)
Semi Complet: les suites de Cauchy convergent
Complet => Quasi Complet => Semi Complet

Disque de Banach:
 A subset D of X is a disk if it is convex and balanced. The disk D is absorbing in the space span(D) and so its Minkowski functional forms a seminorm => X_D=span(D) + topology induced by this seminorm (basis of neighborhoods of 0 = {r D}). If D is Von-Neuman bounded in X then the (normed) topology of XD will be finer than the subspace topology that X induces on this set.
This space is not necessarily Hausdorff, however, if D is a bounded disk and if X is Hausdorff, then X_D is a normed space. If D is a bounded sequentially complete disk and X is Hausdorff, then the space X_D is a Banach space. A bounded disk in X for which XD is a Banach space is called a Banach disk

A disk in a topological vector space X is called infrabornivorous if it absorbs all Banach disks

Opérateurs continus ou bornés
-----------------------------
https://en.wikipedia.org/wiki/Bounded_operator

Every continuous map is bounded, however the converse fails; a bounded operator need not be continuous. Clearly, this also means that boundedness is no longer equivalent to Lipschitz continuity in this context.
A converse does hold when the domain is pseudometrisable (ou même bornologique), a case which includes Fréchet spaces. For LF spaces, a weaker converse holds; any bounded linear map from an LF space is sequentially continuous.

Espace Tonnelé et Bornologique
-------------------------------
https://en.wikipedia.org/wiki/Barrelled_space
https://fr.wikipedia.org/wiki/Espace_tonnel%C3%A9
https://fr.wikipedia.org/wiki/Partie_born%C3%A9e_d%27un_espace_vectoriel_topologique#Espace_bornologique
https://en.wikipedia.org/wiki/Bornological_space
https://fr.wikipedia.org/wiki/Espace_disqu%C3%A9

E tonnelé ssi tout tonneau est un voisinage de zéro.
          ssi toute semi-norme semi-continue inférieurement dans E est continue

E infratonnelé/quasibarreled ssi tout tonneau bornivore est un voisinage de zéro.

E bornologique ssi tout disque bornivore est un voisinage de zéro.
               ssi la topologie localement convexe T′ la plus fine qui a les mêmes bornés dans E est la topologie initiale T

E ultrabornologique ssi toute partie convexe de E qui absorbe les parties convexes, équilibrées, bornées et semi-complètes de E est un voisinage de 0 dans E.
                    ssi infrabornivorous => voisinage de zéro 
                       If X is locally convex and Hausdorff, then a disk is infrabornivorous if and only if it absorbs all compact disks.
                    (<=> X be the inductive limit of the spaces XD as D varies over all compact disks in X)

E Montel = Tonnelé + Fermé Borné = Compact

Liens:
- Fréchet => Ultrabornologique
- Métrisable => Bornologique
- Ultrabornologique => Bornologique
- Bornologique + Semi complet => Ultrabornologique
- Ultrabornologique => Tonnelé
- (Tonnelé ou Bornologique) => Infratonnelé
- Infratonnelé+Semi complet => Tonnelé
  (En particulier un espace bornologique et semi-complet est tonnelé)

Prop: Let X be a metrizable locally convex space with continuous dual X′ (<=>)
- β(X′, X) is bornological,
- β(X′, X) is quasi-barrelled,
- β(X′, X) is barrelled [on dit que X is a distinguished space.]

Th (Espaces Tonnelés) E tonnelé (<=>)
- every σ(X′,X)-bounded subset of the continuous dual space X' is equicontinuous
  (ça marche même dans L(E,F) où F est loc convexe; une partie simplement bornée est équicontinue)
- for all subsets A of the continuous dual space X', the following properties are equivalent: equicontinuous, relatively weakly compact, strongly bounded, weakly bounded.
- X carries the strong topology β(X,X′)
- the 0-neighborhood bases in X and the fundamental families of bounded sets in E_β′ correspond to each other by polarity.

Th (InfraTonnelé=quasi-barreled) (<=>)
- every bounded lower semi-continuous semi-norm on X is continuous
- every β(X′,X)-bounded subset of the continuous dual space X′ is equicontinuous.

Th (Bornologique): Un espace localement convexe E est bornologique si et seulement si tout opérateur linéaire borné de E dans un autre espace localement convexe est continu.
Plus précisément: (Bornological <=>)
- The locally convex topology induced by the von-Neumann bornology on X is the same as τ, X's given topology.
- Every convex, balanced, and bornivorous set in X is a neighborhood of zero.
- Every bounded semi-norm on X is continuous,
- Any other Hausdorff locally convex topological vector space topology on X that has the same (von-Neumann) bornology as (X,τ) is necessarily coarser than τ
- For all locally convex spaces Y, every bounded linear operator from X into Y is continuous.
- X is the inductive limit of normed spaces.
- X is the inductive limit of the normed spaces XD as D varies over the closed and bounded disks of X (or as D varies over the bounded disks of X).
- X carries the Mackey topology τ ( X , X ′ ) {\displaystyle \tau (X,X')} \tau (X,X') and all bounded linear functionals on X are continuous.
- X has both of the following properties:
    X is convex-sequential or C-sequential, which means that every convex sequentially open subset of X is open,
    X is sequentially bornological or S-bornological, which means that every convex and bornivorous subset of X is sequentially open (and so open by above)

Equicontinuité
--------------
https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Banach-Steinhaus

  Rappelons qu'une partie M de E′ est équicontinue si, et seulement si
  pour tout ε > 0 il existe un voisinage V de 0 dans Eι tel que |⟨x,x′⟩| ≤ ε pour tous x ∈ V et x′∈ M. (<=>)
      (a) M est équicontinue ;
      (b) M est incluse dans le polaire d'un voisinage de 0 dans Eι
      (c) le polaire de M est un voisinage de 0 dans Eι
Par conséquent, la topologie ι(E) est identique à la topologie de la convergence uniforme sur les parties équicontinues de E′.

Lemme — Soit E et F deux espaces localement convexes, F étant séparé, et H une partie équicontinue de L(E,F)
  Dans H, les structures uniformes suivantes coïncident :
  (a) celle de la convergence simple (ou même sur une partie dense de E) ;
  (b) celle de la convergence uniforme dans les parties précompactes de E.

Les parties équicontinues de E′ sont bornées dans E_β′, et les parties bornées de E_β′ sont bornées dans E_σ′. Le résultat qui suit est appelé le théorème de Banach-Alaoglu-Bourbaki ; il généralise le théorème de Banach-Alaoglu, valide dans le cas des espaces de Banach:
Théorème — Toute partie équicontinue de E′ est relativement compacte pour la topologie faible σ(E′,E).
[https://fr.wikipedia.org/wiki/Topologie_faible
Banach-Alaoglu:
Théorème — Soit E un espace normé. Alors la boule unité fermée de E' est compacte pour la topologie faible-*.
https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Banach-Alaoglu-Bourbaki
Si E est un ℝ-espace vectoriel topologique et V un voisinage de 0, alors l'ensemble polaire V° de V, défini par
V∘ = { ℓ∈E′ ∣ ∀v∈V |ℓ(v)|≤1 }
est une partie compacte du dual topologique E' pour la topologie faible-*.]

Théorème — (Banach Steinhaus <=>)
    (a) E est tonnelé;
    (b) les parties équicontinues du dual E′ de E coïncident avec les parties bornées de E_σ′.

Théorème —  Soit E′ le dual d'un espace de Montel E (ie tonnelé + fermé borné=compact)
  Alors pour une suite dans E', convergence faible => convergence simple

Types
-----
- Espaces vectoriels topologiques localement convexes : dans ces espaces, tout point admet une base de voisinages convexes. Par la technique connue sous le nom de fonctionnelle de Minkowski, on peut montrer qu'un espace est localement convexe si et seulement si sa topologie peut être définie par une famille de semi-normes. La convexité locale est le minimum requis pour des arguments géométriques comme le théorème de Hahn-Banach.
- Espaces tonnelés : espaces localement convexes où tout tonneau est un voisinage de 0. [Tonneau=convexe fermé équilibré absorbant] => Banach Steinhaus
  Ex: locally convex spaces which are Baire spaces are barrelled.
- Espaces de Montel : espaces tonnelés où tout fermé borné est compact.
  [Attention: la boule unité d'un evn de dim infinie n'est jamais compacte]
- Espaces bornologiques : espaces localement convexes où toute partie convexe équilibrée qui absorbe les parties bornées est un voisinage de 0.
- Espaces LF (de)
- Espaces F (en)
- Espaces de Fréchet = localement convexe métrisable complet
- espaces de Schwartz
- Espaces nucléaires
- Espaces vectoriels normés et semi-normés : espaces localement convexes où la topologie peut être décrite par une unique norme ou semi-norme. Dans les espaces vectoriels normés, un opérateur linéaire est continu si et seulement s'il est borné.
- Espaces de Banach : espaces vectoriels normés complets. La plus grande partie de l'analyse fonctionnelle est formulée pour des espaces de Banach.
- Espaces réflexifs : espaces de Banach isomorphes à leur double dual. Un exemple important d'espace non réflexif est L1, dont le dual est L∞ mais est strictement contenu dans le dual de L∞.
- Espaces de Hilbert : ils ont un produit scalaire ; bien que ces espaces puissent être de dimension infinie, la plupart des raisonnements géométriques familiers en dimension finie s'appliquent également.
- Espaces euclidiens ou hermitiens : ceux-ci sont des espaces de Hilbert de dimension finie. Il existe alors une unique topologie conférant à l'ensemble le statut d'espace vectoriel normé. Cette configuration est étudiée dans l'article topologie d'un espace vectoriel de dimension finie.

Excellent résumé des types d'evt:
http://mathoverflow.net/questions/8443/barrelled-bornological-ultrabornological-semi-reflexive-how-are-these-us
https://ncatlab.org/nlab/show/topological+vector+space
[Liens manquants: Fréchet => Ultrabornologique]

Dual
====

https://en.wikipedia.org/wiki/Topology_of_uniform_convergence
https://fr.wikipedia.org/wiki/Dual_d%27un_espace_vectoriel_topologique

## Forme linéaire continue d'un evt loc. convexe
Soit x∗ ∈ E∗ alors x∗ ∈ E′ si, et seulement si son noyau H est un hyperplan fermé dans E.
Pr: La condition est évidemment nécessaire. Montrons qu'elle est suffisante : si H est fermé, l'espace quotient E/H est un espace localement convexe séparé de dimension 1 sur k. On a x∗ = g∘ϕ où ϕ est la surjection canonique de E sur E/H, et est donc continue, et où g est une forme linéaire sur E/H, et est donc continue puisque E/H est de dimension finie.

## Polaire
On appelle polaire de M dans F l'ensemble M∘ des y∈F tels que ℜ(⟨x,y⟩)≥−1 pour tout x ∈ M {\displaystyle x\in M} x \in M21.
Cet ensemble contient 0 et est convexe, fermé dans F pour la topologie σ(F,E).
En conséquence du théorème de Hahn-Banach, le bipolaire M∘∘ est l'enveloppe convexe fermée de M ∪ { 0 } pour la topologie σ(E, F).

Pour que la topologie quotient, induite sur F/M∘ par σ(F, E) soit identique à la topologie σ(F/M∘,M) il suffit que M soit fermé dans E pour la topologie σ(E,F).

Transposée
----------
(1) Soit u : E → F une application linéaire. (<=>)
    (a) u est continue ;
    (b) il existe une application v : F′ → E′ telle que l'on ait
        ⟨u(x),y′⟩ = ⟨x,v(y′)⟩
Dans la suite, l'application linéaire u est supposée continue ; on a les résultats suivants :
(1) (i)   ker(t_u)=(im(u))^0 (ii)  im(t_u)¯ = ker(u)^0
(2) Pour que u soit un morphisme strict, il faut et il suffit que im(t_u) soit un sous-espace fermé de F′ [morphisme strict: l'application coim->im est un isomorphisme)

Topologie sur le dual d'un evt loc convexe
------------------------------------------
On veut utiliser une bornologie pour munir le dual d'une topo de la
convergence uniforme.
Si la bornologie est adaptée (pour tout A ∈ B A est borné et son adhérence est bornée; on dit que E est disqué dans ce cas) alors le dual pour la topologie est égal à E'.
On munit alors E' de la topologie de la convergence uniforme sur cette bornologie.
Exemple: l'ensemble des bornés de E (bornologie canonique) ou l'ensemble des parties précompactes de E. On obtient également un espace disqué en prenant comme base de la bornologie la famille des « disques » compacts (un disque est une partie convexe équilibrée).

Les bornologies les plus usuelles dont les suivantes :
    (1) S = σ, ensemble des parties finies de E. La topologie σ(E′,E) est appelée la topologie faible de E′. On précise parfois qu'il s'agit de la « topologie *-faible » pour la distinguer de la « topologie faible » σ(E′,E′′).
    (2) S = γ, ensemble des parties convexes compactes de E.
    (3) S = c, ensemble des parties compactes de E.
    (4) S = ρ, ensemble des parties relativement compactes de E.
    (5) S = κ, ensemble des parties précompactes de E.
    (6) S = β, ensemble des parties bornées de E. Cette bornologie est dite canonique, et la topologie β (E′,E) est appelée la topologie forte de E′.

Complétude du dual
------------------

Soit E un espace localement convexe séparé et S une bornologie.
On a vu plus haut que E_S′ est un espace localement convexe séparé.
Si E est un espace tonnelé, E_S′ est quasi-complet.
Si E est un espace bornologique, le dual fort E_β′ est complet (et c'est un espace (DF) si E est métrisable).
Si E est un espace normé (donc bornologique), E_β′ est normé complet, donc un espace de Banach.

Parties Bornées de E'
---------------------
Procédons à la classification des parties bornées du dual E′:
    (a) les ensembles équicontinus ;
    (b) les ensembles dont l'enveloppe équilibrée fermée convexe est compacte pour la topologie *-faible σ(E′,E);
    (c) les ensembles relativement compacts pour la topologie *-faible σ(E′,E) (on dit encore : les ensembles *-faiblement relativement compacts) ;
    (c') les ensembles fortement bornés ;
    (d) les ensembles *-faiblement bornés (ou, de manière équivalente, les ensembles *-faiblement précompacts).
Dans le cas général, (a) ⊂ (b) ⊂ (c,c') ⊂ (d).
- (a) = (b) si, et seulement si E est un espace de Mackey
- (a) = (c') si, et seulement si E est un espace infratonnelé (une condition suffisante pour qu'on ait cette égalité est donc que E soit bornologique)
- (b) = (d) si, et seulement si E′ est quasi-complet pour la topologie σ(E′,E) 
- (c') = (d) si E est semi-réflexif ou semi-complet (en particulier, si E est quasi-complet)
- (a) = (d) si, et seulement si E est un espace tonnelé (théorème de Banach-Steinhaus).
En outre, si E est un espace localement convexe tonnelé et semi-complet, les ensembles ci-dessus coïncident avec :
    (e) les ensembles bornés pour la S-topologie de E′, pour toute bornologie adaptée S.

La considération des sous-ensembles équicontinus de E′ permet d'obtenir un critère de complétude de E, dû à Grothendieck:
Soit E un espace localement convexe séparé. Les conditions suivantes sont équivalentes :
    (i) E est complet ;
    (ii) une forme linéaire sur E_σ′ est continue si, et seulement si sa restriction à toute partie équicontinue M de E′ est continue (pour σ (E′,E)).

Topologie de Mackey
-------------------

Théorème et définition —
(1) On appelle topologie de Mackey τ(E,F) la S′-topologie où S′ est l'ensemble des parties convexes de F, compactes pour σ(F,E).
(2) La topologie T est compatible avec la dualité entre E et F si, et seulement si elle est plus fine que σ(E,F) et moins fine que τ(E,F).

Les parties convexes fermées dans E et les parties bornées dans E sont les mêmes pour toutes les topologies localement convexes compatibles avec la dualité entre E et F. On peut donc parler d'une partie fermée convexe ou d'une partie bornée de E, sans précision de la topologie.
Soit maintenant E un espace localement convexe séparé. Sa topologie ι(E) est compatible avec la dualité entre E et E′, par conséquent ι(E) est moins fine que τ(E,E′). Si elle coïncide avec τ(E,E′), E est appelé un espace de Mackey (les espaces infratonnelés et les espaces bornologiques - donc les espaces localement convexes métrisables - sont des espaces de Mackey). Soit E′ le dual de E; la topologie γ(E′,E) est moins fine que τ(E′,E); si E est quasi-complet, γ(E′,E) = c(E′,E) = κ(E′,E), et ces trois topologies sont donc moins fines que τ(E′,E).

Soit E et F des espaces localement convexes et u:E→F une application continue. Alors elle est faiblement continue. Inversement, si u est faiblement continue, elle est continue pour les topologies de Mackey τ(E,E′) et τ(F,F′); en particulier, elle est continue pour les topologies ι(E) et ι(F) si E est un espace de Mackey.

Bidual et réflexivité
---------------------

On définit également sur E′′ la topologie dite « naturelle ». Il s'agit de la topologie ε(E′′,E′)  où ε désigne l'ensemble des parties équicontinues de E′. D'après ce qu'on a vu plus haut, cette topologie induit sur E sa topologie initiale (d'où le nom de « topologie naturelle »). Elle est moins fine que β(E′′,E′) (et identique à celle-ci si E est bornologique ou tonnelé) et définit dans E′′ les mêmes parties bornées.

Un espace localement convexe séparé E est dit semi-réflexif si l'injection canonique c_E est bijective, autrement dit si, en tant qu'espaces vectoriels, E et E′′ coïncident.
L'espace E est semi-réflexif si, et seulement si la topologie β(E′,E) est compatible avec la dualité entre E et E′ (β(E′,E)=τ(E′,E))
Si E est semi-réflexif, les deux topologies faibles qu'on peut définir sur E′ (la topologie *-faible σ(E′,E) et σ(E′,E′′)), sont donc identiques.
Le théorème qui suit, encore appelé théorème de Banach-Alaoglu-Bourbaki, généralise le critère de Banach-Alaoglu pour la réflexivité des espaces de Banach (compacité faible de la boule unité) :
Théorème — Un espace localement convexe séparé E est semi-réflexif si, et seulement si toute partie bornée de E est relativement compacte dans E_σ
Un espace E est semi-réflexif si, et seulement si Eτ′ est tonnelé, et cela entraîne évidemment que Eβ′ est tonnelé; E est alors quasi-complet pour les topologies σ(E,E′) et ι(E) ; plus précisément E est semi-réflexif si, et seulement s'il est quasi-complet pour sa topologie affaiblie σ(E,E′)
Si E est semi-réflexif, la bijection c E {\displaystyle c_{E}} {\displaystyle c_{E}} est telle que sa bijection réciproque c E − 1 {\displaystyle c_{E}^{-1}} {\displaystyle c_{E}^{-1}} est continue.

Un espace localement convexe E est dit réflexif s'il est semi-réflexif et si les topologies ι(E) et β(E,E′) coïncident.
Le dual fort E_β′ d'un espace réflexif E est réflexif.
Théorème — Pour qu'un espace localement convexe séparé E soit réflexif, il faut et il suffit qu'il soit semi-réflexif et tonnelé.

Espaces tonnelés quasi-complets
-------------------------------

Soit E un espace tonnelé quasi-complet. Alors E est un espace de Mackey, donc est un sous-espace vectoriel topologique de son bidual (et ce sous-espace est fermé si E est complet). De plus, les ensembles bornés de E′ pour toute bornologie S de E, sont identiques. On peut donc appeler ces ensembles, sans risque de confusion, les ensembles bornés de E′. Ces ensembles coïncident avec les ensembles équicontinus, les ensembles *-faiblement relativement compacts et les ensembles *-faiblement précompacts.

Proposition — Un espace localement convexe est tonnelé, quasi-complet et réflexif si, et seulement si son dual fort est tonnelé, quasi-complet et réflexif.

# Exo: Si E evt sur K corps complet, F de dim finie, M fermé \subset E => M+F est fermé.

Preuve: sciences.maths:18664
Il suffit de supposer le corps complet, cf Bourbaki, EVT Chap 1, $3
Theoreme 2.

Soit K un corps valué complet et non discret.
Si E est un ev topologique séparé de dimension n finie, E est isomorphe à K^n.

Preuve: c'est vrai si n=1 (il n'y a pas besoin de complétude pour celà). Si
H est un hyperplan de E, on peut appliquer l'hypothèse de récurrence, donc
en particulier H est complet, donc fermé, donc la suite exacte associée
splitte.

Donc à partir de si F est un sous-espace de dimension fini d'un ev
topologique E séparé sur K, F est complet donc fermé dans E. Pareil, si M
est fermé dans E, F+M est fermé, ça se voit en passant au quotient.

====================================================================

Preuve de Gro-Tsen:
> D'ailleurs, c'est quoi ta solution au problème initial? Je l'ai fait en
> bidouillant avec les normes, mais
>  - ça ne se généralise pas à des evt
>  - ce n'est pas très joli

J'ai effectivement mis pas mal de temps à trouver comment faire sur
les e.v.t. sans supposer la locale convexité (avec, c'est plus facile,
parce qu'on a de bonnes jauges).

Rappel : Un espace vectoriel topologique (sous-entendu, sur R) est un
R-espace vectoriel muni d'une structure d'espace vectoriel topologique
séparé pour laquelle l'addition et la multiplication scalaire soient
continues (comme fonctions de *deux* variables, évidemment).

(Note : En fait, « T_1 », i.e., « les points sont fermés » (ou même
« {0} est fermé ») suffit à la place de « séparé ».  En effet, pour
prouver la séparation, il suffit de prouver que si x est un vecteur
non nul d'un espace vectoriel topologique E alors il existe des
voisinage U de 0 et V de x qui sont disjoints ; pour le prouver, on
commence par trouver un voisinage W de 0 qui ne contient pas x, puis,
par continuité de la somme, on trouve des voisinages U et U' de 0 tels
que la somme d'un élément de U et d'un de U' soit un élément de W, et
enfin on pose V=x-U'.)

Définition : Une partie d'un espace vectoriel topologique est dite
« équilibrée » lorsqu'elle est stable par multiplication par n'importe
quel réel dans l'intervalle [-1;1].

Lemme : Si E est un espace vectoriel topologique, alors les ouverts
équilibrés contenant 0 forment un système fondamental de voisinages de
celui-ci.  Démonstration : Soit V un voisinage ouvert de 0.  Par
continuité de la multiplication scalaire, il existe eps>0 réel et W
voisinage de 0, qu'on peut supposer ouvert, tels que si |t|<eps alors
tW est contenu dans V.  La réunion de tous ces tW forme un ouvert
équilibré contenant 0 et contenu dans V.

Lemme : Sur R^n (et, partant, sur tout R-espace vectoriel de dimension
finie), il n'existe qu'une seule structure d'espace vectoriel
topologique.  Démonstration : On considère l'identité h entre R^n muni
de sa structure topologique usuelle (au départ) et R^n muni de sa
structure topologique qu'on cherche à déterminer (à droite).  Ainsi, h
est une bijection, et par ailleurs h est continu car l'addition et la
multiplication scalaire sont continues (donc l'application qui à
(x_1,...,x_n) du R^n usuel associe x_1·e_1+...+x_n·e_n, où e_1,...,e_n
sont les éléments de la base canonique du R^n bizarre, c'est-à-dire h,
est continue).  Il s'agit de montrer que la réciproque de h est encore
continue, et il suffit de le montrer en zéro : autrement dit, il
s'agit de montrer que si je prends un voisinage usuel U de zéro dans
R^n alors h(U) est un voisinage de zéro dans la nouvelle topologie.
On peut évidemment restreindre U, donc autant supposer que c'est une
boule ouverte (pour la distance euclidienne usuelle), disons la boule
ouverte de rayon 1, parce que ça ne change rien.  Maintenant, soit K
la boule fermée de rayon 1.  C'est un compact, donc h(K) est encore
compact (puisque h est continue et que la cible est séparée), et même,
h est un homéomorphisme de K sur h(K).  Là j'étais sur le point de
dire « donc on a gagné », mais, bien sûr, c'est une arnaque : il faut
travailler encore un peu (on n'est pas encore en mesure de conclure
que h(K) est un voisinage de zéro).  En revanche, ce qui est
certainement vrai, c'est que le complémentaire de h(½K) est un ouvert
(aussi bien pour la nouvelle topologie que pour l'usuelle), ainsi que
tout translaté de lui.  Or en intersectant un nombre fini de
translatés du complémentaire de h(½K) on peut aisément fabriquer une
partie de R^n qui contienne zéro mais ne contienne aucun point dans la
coquille sphérique (pour la distance euclidienne usuelle) à distance
entre 1-eps et 1+eps de l'origine (en effet, cette coquille sphérique
fermée donc compacte pour la topologie usuelle est recouverte par
l'ensemble des boules ouvertes de rayon ½ centrées sur un point
d'elle, donc par un nombre fini d'entre elles).  Appelons W cette
partie, qui est un ouvert (donc un voisinage de zéro) pour la nouvelle
topologie (ainsi que pour l'usuelle).  Il doit contenir (d'après le
lemme précédent) un voisinage V équilibré de zéro pour la nouvelle
topologie ; mais comme W évite toute une coquille, V est contenu
entièrement dans la sphère intérieure de cette coquille, donc V est
contenu dans h(K), donc dans h(U), et on a ce qu'on voulait.  (Ouf !)

Proposition : Tout sous-espace vectoriel de dimension finie d'un
espace vectoriel topologique est fermé.  Démonstration : Soit E
l'espace ambiant et F un sous-espace vectoriel de dimension finie.
Soit x un point n'appartenant pas à F.  On veut montrer que x a un
voisinage qui ne rencontre pas F.  Soit F' le sous-espace vectoriel de
E, toujours de dimension finie, engendré par F et x.  On vient
d'expliquer que F' (muni de la topologie induite et de la structure
linéaire évidente) est isomorphe en tant qu'espace vectoriel
topologique (i.e., par une bijection linéaire bicontinue) à un R^n
(avec sa topologie usuelle).  Mais dans R^n tous les sous-espaces
vectoriels sont fermés.  Donc il y a un ouvert de F' contenant x et
qui ne rencontre pas F.  Mais cet ouvert de F' est intersection d'un
ouvert U de E avec F', et l'ouvert U est donc un voisinage de x dans E
qui ne rencontre pas F.

Proposition : Soit E un espace vectoriel topologique, F un sous-espace
vectoriel fermé et G un sous-espace vectoriel de dimension finie.
Alors F+G est fermé.  Démonstration : On munit le quotient E/F de la
topologie quotient (i.e., la plus fine rendant continue la surjection
canonique E->E/F).  Cela en fait bien un espace vectoriel
topologique : les différentes propriétés sont évidentes, la seule
intéressante est la séparation, qui vient exactement du fait que F est
fermé.  Alors (F+G)/F est de dimension finie donc fermé d'après la
proposition précédente.  Donc par continuité de la surjection
canonique, son image réciproque dans E, c'est-à-dire F+G, est fermée
dans E.

C'est ce qu'on voulait prouver.
