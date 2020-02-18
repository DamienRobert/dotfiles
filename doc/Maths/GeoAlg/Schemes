vim: ft=markdownlight fdm=expr

Références
==========

* Books

- Algebraic Geometry I, Ulrich Görtz, Torsten Wedhorn
  https://www.algebraic-geometry.de/

* Introductions
- https://www.math.ens.fr/~debarre/NotesGAEL.pdf
Rational curves on algebraic varieties
Si f:Y-->X birationel, X lisse, alors le diviseur exceptionel de f contient
des courbes rationelles

Propriétés locales
==================

Résumé:
- local pour fppf: S loc. noeth, S Jacobson, "every quasi-compact open a un nombre fini de composantes irréductibles"
- local pour syntomic: S loc. noeth et S_k, S Cohen-Macauley
- local pour smooth: S réduit, S normal, S loc. noeth et R_k, S régulier, S Nagata.
- descendent pour ffpf: réduit, régulier
- germe local pour étale: la dimension locale, la codimension, la régularité

Local pour Zariski: loc. irréd, loc. intègre [probablement pas optimal]

Propriétés locales sur les anneaux
----------------------------------

[Th: Soit P une propriété sur des ouverts affines. On suppose que
(i) Si Spec A a P, les ouverts distingués aussi.
(ii) Si Spec A a un recouvrement fini par des ouverts distingués A_i
(ie A_i=A_f_i avec 1=(f_1, ..., f_n)) alors si les A_i ont P, A aussi.
Alors si X a un recouvrement par des ouverts affines qui ont P, tout ouvert
affine de X a P.

Vient de la
Prop: Soit Spec A et Spec B des ouverts affines d'un schéma X.
Alors l'intersection est l'union d'ouverts affines distingués à la fois
dans A et dans B.

Preuve: il suffit de montrer que tout x dans l'intersection est inclus dans
un ouvert distingué de A et B. Soit A_f un ouvert distingué inclus dans
l'intersection et contenant x, et B_g inclus dans A_f et contenant toujours
x. Alors la section g de Spec B se restreint en une section g' sur Spec
A_f, et il est facile de voir que Spec B_g est isomorphe à Spec (A_f)_g'.
Mais si g'=g''/f^n, Spec(A_f)_g'=Spec(A_fg'') donc est bien distingué dans A.]

* https://stacks.math.columbia.edu/tag/01OO
$ 27.4 Types of schemes defined by properties of rings

Rappel: Si P est une propriété des anneaux, on dit qu'elle est locale si
1. P(X) => P(X_f) où X=Spec R
2. P(X_i) => P(X) où X=\union X_i décomposition en ouverts standards.

On dit alors que X est localement P, si tout x a un ouvert affine qui a P.
On dit souvent que X est P si X est localement P et qc (note: un ouvert affine est qc).

Remarque: si on a seulement 1., on peut regarder "localement P" qui est
bien une propriété locale: on a une décomposition X = \union X_i où X_i a P.
Si sur un anneau "localement P et Q => P", alors ça sera souvent le cas sur
un schéma aussi.

Th: X est localement P (<=>)
- tout ouvert affine est P.
- il existe un recouvrement de X par des ouverts U_i tels que U_i est loc. foo
  (Idem on a un recouvrement par des ouverts affines P).
Autrement dit: "localement P" est Zariski-locale sur X.

Exemple de propriétés locales:
- X réduit (= anneau réduit)
- X loc. irréd (= les composantes irréds sont irréd)
  X irréd = connexe + loc. irréd
- X loc. intègre (= les composantes connexes sont intègres)
    = réduit et loc. irréd
  X intègre = connexe + loc. intègre
- X loc. noeth (= anneau noeth)
  X noeth = qc + loc. noeth

Souvent ça passe aux stalks (ie X est loc foo <=> les stalks sont loc foo),
en particulier quand on est loc. de prés finie, mais pas tout le temps (cf
le contre exemple sur X noéthérien plus bas).

Prop (sections et germes):
- X réduit <=> toutes les germes sont réduites <=> les sections
de chaque ouvert (pas forcément affines) sont réduites.
- X intègre <=> X est réduit et irréductible <=> les sections de chaque
  ouvert (pas forcément affines) sont intègres <=> les sections de chaque
  ouvert affine sont intègres
  => les germes sont intègres <=> X loc. intègre
- X irréductible <=> chaque ouvert affine U est irréductible
  (ie O_X(U) a un unique idéal premier minimal, ou encore le Nilradical de
  O_X(U) est premier) => Les germes sont irréductibles <=> X loc. irréd

*Attention*: X noéthérien n'implique pas que l'anneau des sections de chaque
ouvert soit noéthérien, de même pour X de type fini (par contre je crois
qu'on a bien X noeth => les germes sont noeths)
Et les germes sont noeths n'impliquent pas X noeth, cf https://math.stackexchange.com/questions/1201152/if-local-rings-are-noetherian-is-scheme-locally-noetherian

* https://stacks.math.columbia.edu/tag/01OU
$ 27.5: Noetherian schemes

Si X noeth, tout ouvert est qc (et donc rétrocompact), et si X loc. noeth, tout ouvert est rétrocompact.
=> X loc. noeth => X qs
   i:Z->X immersion avec X loc. noeth, i est qc
   f: X->Y avec X noeth => f qcqs

Lemma 27.5.9. Any nonempty locally Noetherian scheme has a closed point. Any nonempty closed subset of a locally Noetherian scheme has a closed point. Equivalently, any point of a locally Noetherian scheme specializes to a closed point.

Lemma 27.5.10. Let X be a locally Noetherian scheme. Let x′⇝x be a specialization of points of X. Then
  - there exists a discrete valuation ring R and a morphism f:Spec(R)→X such that the generic point η of Spec(R) maps to x′ and the special point maps to x, and
  - given a finitely generated field extension κ(x′)⊂K we may arrange it so that the extension κ(x′)⊂κ(η) induced by f is isomorphic to the given one.

Topologies
----------

* https://stacks.math.columbia.edu/tag/020N
$ 33.3 The Zariski topology

Standard open: Spec A[1/f] -> Spec A

* https://en.wikipedia.org/wiki/Nisnevich_topology
A morphism of schemes f : Y → X is called a Nisnevich morphism if it is an étale morphism such that for every (possibly non-closed) point x ∈ X, there exists a point y ∈ Y in the fiber f^−1(x) such that the induced map of residue fields k(x) → k(y) is an isomorphism

* https://stacks.math.columbia.edu/tag/0214
$ 33.4 The étale topology

Standard étale: Spec R[x]_g/(f) -> Spec R
(Attention: la composée de deux standard étale n'est pas forcément standard étale)

* https://stacks.math.columbia.edu/tag/021Y
$ 33.5 The smooth topology

Standard smooth: Spec(S=R[x1,…,xn]/(f1,…,fc))→Spec(R).
où la Jacobienne det(df_i/dx_j) est invertible dans S.

This topology defines the same topos as the étale topology:
https://stacks.math.columbia.edu/tag/055S
$ 36.34 Slicing smooth morphisms
In this section we explain a result that roughly states that smooth coverings of a scheme S can be refined by étale covering

Lemma 36.34.6. Let f:X→S be a smooth morphism of schemes. Let s∈S be a point in the image of f. Then there exists an étale neighbourhood (S′,s′)→(S,s) and a S-morphism S′→X.

qui utilise le:

Lemma 36.34.5. Let f:X→S be a morphism of schemes. Let x∈X be a point with image s∈S. Assume
  - f is smooth at x, and
  - x is a closed point of X_s and κ(s)⊂κ(x) is separable.
Then there exists an immersion Z→X containing x such that
  - Z→S is étale, and
  - Z_s={x} set theoretically.

* https://stacks.math.columbia.edu/tag/0224
$ 33.6 The syntomic topology
 In this section we define the syntomic topology. This topology is quite interesting in that it often has the same cohomology groups as the fppf topology but is technically easier to deal with.

 Cf https://stacks.math.columbia.edu/tag/01UB
 $ 28.29 Syntomic morphisms
 = flat local complete intersection morphism.

 An algebra A over a field k is called a global complete intersection over
 k if A≅k[x1,…,xn]/(f1,…,fc) and dim(A)=n−c. (=> flat)
 An algebra A over a field k is called a local complete intersection if
 Spec(A) can be covered by standard opens each of which are global complete
 intersections over k. See Algebra, Section 10.134.
 Recall that a ring map R→A is syntomic if it is of finite presentation,
 flat with local complete intersection rings as fibres, see Algebra,
 Definition 10.135.1.

* https://stacks.math.columbia.edu/tag/021L
$ 33.7 The fppf topology

* https://stacks.math.columbia.edu/tag/0DBC
$ 33.8 The ph topology

In this section we define the ph topology. This is the topology generated by Zariski coverings and proper surjective morphisms, see Lemma 33.8.15.

We borrow our notation/terminology from the paper [ph] by Goodwillie and Lichtenbaum. These authors show that if we restrict to the subcategory of Noetherian schemes, then the ph topology is the same as the “h topology” as originally defined by Voevodsky: this is the topology generated by Zariski open coverings and finite type morphisms which are universally submersive.

We will see in More on Morphisms, Lemma 36.43.7 that fppf coverings (and hence syntomic, smooth, or étale coverings) are ph coverings as well.

* https://stacks.math.columbia.edu/tag/022A
$ 33.9 The fpqc topology

* https://stacks.math.columbia.edu/tag/0ETA
$ 33.10 The V topology
The V topology is weaker than all other topologies in this chapter. Roughly speaking it is generated by Zariski coverings and by quasi-compact morphisms satisfying a lifting property for specializations.

Lemma 33.10.2. A standard fpqc covering is a standard V covering.

* https://stacks.math.columbia.edu/tag/03DR
$ 35.8 Quasi-coherent sheaves and topologies

(Sch/S)^opp⟶Ab,(f:T→S)⟼Γ(T,f∗F) défini un faisceau F_τ pour la topologie fpqc
(donc aussi pour les topos plus faibles).

Ca permet de voir les big ou small site big_τ(S) comme des topos annelés, et de lui associer un faisceau à F. Les morphismes de schémas induisent des morphismes de topos annelés (en fait c'est même pleinement fidèle).

De même, F->F_τ est une équivalence de catégorie (35.8.11) sur les
faisceaux quasi-cohérents, et on a la même cohomologie (35.8.10).
Equivalence qui préserver (la plupart) des propriétés de faiscaux
quasi-cohérents (35.8.12)
En fait on a même (35.8.13) que c'est compatible avec les sommes directes,
les colimites, le produit tensoriel, le Hom (si F de prés. finie), exact à droite, et exact sur le petit topos étale; compatible aux pullbacks, et
compatible aux pushforwards pour le (petit) topos de Zariski/étale si f
qcqs (35.8.14), et en fait dans ce cas là pour le petit topos on a même 
R^i_fsmall,*(F_τ)=(R^i f_∗F)_τ. 

Big and small sites
-------------------

* Espaces classifiants:
- https://arxiv.org/abs/0902.1130
Grothendieck topologies from unique factorisation systems
Mathieu Anel (2009)

 This work presents a way to associate a Grothendieck site structure to a category endowed with a unique factorisation system of its arrows. In particular this recovers the Zariski and Etale topologies and others related to Voevodsky's cd-structures. As unique factorisation systems are also frequent outside algebraic geometry, a construction applies to some new contexts, where it is related with known structures defined otherwise. The paper details algebraic geometrical situations and sketches only the other contexts.

=> this also give the classifying property of the little/big topos of the
zariksi/étale topology:

Small Zariski: localisation of A; Etale: strict henselisation of A; Nisnevich: ind-etale henselian local A-algebra
Big Zariski: local A-algebras; Etale: strict henselian local A-algebras; Nisnevich: henselian local A-algebra

- Voir aussi:
https://mathoverflow.net/questions/20622/construction-of-the-petit-zariski-topos-out-of-the-gros-topos-of-a-scheme/21154#21154

=> Over an affine scheme Spec A, The big topo E classifies local rings in topoi while the small topos X classifies local rings that are localisations of A, so X is the subtopos of those objects Y of E such that A^1 restricted to Y is a localisation of A.

Qui cite la thèse de M. Hakim IV.5 qui donne une construction fonctorielle
du petit topos étale en fonction du petit topos de Zariski comme adjoint à
gauche [attention, Hakim écrit ses flèches dans l'autre sens, donc parle
d'adjoint à droite] du foncteur d'inclusion Topos annelé en anneaux
strictement locaux -> Topos (loc) annelé; et construit également le petit
topo de Zariski comme l'adjoint à gauche du foncteur d'inclusion Topos loc
annelé -> Topos annelé: Zariski(E,A)=(Spec A, O_A).

- Ce théorème (la topologie de Zarsiki classifie les anneaux locaux et la topologie étale classifie les anneaux henséliens strict) est repris dans 
https://link.springer.com/chapter/10.1007%2FBFb0061844
https://sci-hub.tw/10.1007/BFb0061844
Generic Galois theory of local rings, G.C. Wraith
qui donne une théorie de Galois des anneaux locaux en terme de leur strict
Hensélisation, et qui explique que l'intéret d'être Hensélien strict plutôt
que Hensélien est que la première notion est géométrique.

* Big and small topos
- https://golem.ph.utexas.edu/category/2009/01/petit_topos_gros_topos.html

$ Denis-Charles Cisinski:

To express further the differences between the petit and the gros topos of X, we can notice that the Yoneda embedding gives a fully faithful functor from Sch/X to the category of sheaves on the gros topos. In particular, X is completely determined by its gros topos; however, the scheme X is not determined by its petit topos: the petit topos only determines the underlying topological space of X. To determine X, you need to know its petit topos as well as its sheaf of rings O_X. And the data of this sheaf of rings is a kind of disguised link to a gros topos! Indeed, let us consider first the case where X=Spec(Z). Then the gros Zariski topos of Spec(Z) is the classifying topos for local rings: given a topos T, a sheaf of local rings on T (I mean by this a sheaf of rings O which is locally a local ring, i.e., in the case where the topos has enough points, for any point x of the topos T, the ring O_x is a local ring) is the same thing as a (geometric) morphism of topoi from T to the big Zariski topos of Spec(Z). The universal local ring is the Zariski sheaf represented by the affine line on Sch/Spec(Z).

The data of the sheaf of rings O XO_X thus gives you the relation of X with all the schemes of finite presentation over Spec(Z). As any ring is a filtered colimit of rings of finite presentation, you can understand from this all the sets Hom(X,Y) for any scheme Y, hence recover X completely by the Yoneda Lemma (this is why the definitions of schemes as locally ringed spaces or as sheaves on the gros topos lead to equivalent notions after all).

There is a systematic ‘toposic’ way to recover the gros Zariski topos of a scheme X from the category Sch/X and from the petits topoi of schemes (locally) of finite presentation over X. Indeed, we have a (pseudo-)functor
(−)_Zar:Sch/X→Topoi
which associates to a scheme Y over X its petit topos Y_Zar. Then the gros topos of X can be described as the lax 2-colimit of this pseudo-functor. In particular, the canonical morphisms of topoi from Y_Zar to the gros Zariski topos of X form the universal ‘lax cocone’.

$ James:
There are actually three functors relating the big and small toposes. More precisely, there is a topos map from the big topos to the small topos, and this map has a section f. Then not only does f^* have a right adjoint f_* but it also has a left adjoint f_!

$ Mike Schumlan, For topological spaces:
Somewhere in between, we can consider sheaves on LH/X, where LH is the category of topological spaces and local homeomorphisms. It turns out that LH/X is actually equivalent to the petit topos of X, and therefore so is the category of sheaves on it; so this just reconstructs the petit topos.

- https://mathoverflow.net/questions/20622/construction-of-the-petit-zariski-topos-out-of-the-gros-topos-of-a-scheme/21154#21154
The gros étale topos for S is just ((Shv(Aff_ét)↓S). We can construct from it the petit étale topos by considering Shv(ét↓S), where (ét↓S) is the subcategory of the gros étale topos consisting of étale morphisms A→S where A is affine. This site is equipped with the induced topology.

Now for the ring object. For the petit topos, we let OS be defined simply
the sheaf sending any affine scheme to its corresponding ring (exercise:
Show that this is a sheaf). This defines a ring object in the category of
sheaves on the small site (exercise: Prove this. (Hint: Think of the
definition of a group object and recall that the Yoneda embedding is
full.)). For the large topos, we just let it be the base change of the
affine line. It's not hard to show that they agree on étale morphisms A→S
for A affine.

Propriétés locales pour les topologies
--------------------------------------

* https://stacks.math.columbia.edu/tag/0347
$ 34.12 Local properties of schemes

τ∈{fpqc,fppf,syntomic,smooth,étale}

Déf: P est locale pour τ ssi pout tout τ-covering, S has P <=> S_i a P
Ex: P is local for the flat topology if it ascends along flat morphisms and descends along flat surjective morphisms (en effet si S'->S est plat et S a P, on peut raffiner S' en un flat covering, donc S' a P; de même pour les autres topologies)

Lemma 34.12.2: Si P est locale pour Zariski, et que 
1. Si S'->S est affine et dans τ, P passe de S à S'
2. Si S'->S est affine surjectif et dans τ, P passe de S' à S
   (si τ=smooth, étale ou syntomic on peut supposer S'->S surjectif standard)
alors P est locale à τ.

- local pour fppf: S loc noeth, S Jacobson, "every quasi-compact open a un nombre fini de composantes irréductibles"
- local pour syntomic: S loc noeth et S_k, S Cohen-Macauley
- local pour smooth: S réduit, S normal, S loc noeth et R_k, S régulier, S
  nagata.

* https://stacks.math.columbia.edu/tag/06QL
$ 34.16 Variants on descending properties

Lemma 34.16.1. If f:X→Y is a flat and surjective morphism of schemes and X is reduced, then Y is reduced.
(Ce n'est pas une propriété locale car Spec k[ε]->Spec k est fppf mais k[ε]
n'est pas réduit. Autrement dit ça descent, mais ça ne monte pas.)

Lemma 34.16.2. Let f:X→Y be a morphism of algebraic spaces. If f is locally of finite presentation, flat, and surjective and X is regular, then Y is regular.

Autres propriétés qui descendent pour un morphisme fidèlement plat:
* https://stacks.math.columbia.edu/tag/033D
$ 10.159 Descending properties
Noetherian, Reduced, Normal, Regular, Noetherian+S_k, Noetherian+R_k

* https://stacks.math.columbia.edu/tag/04QQ
$ 34.17 Germs of schemes
Attention: germ c'est une classe d'équivalence de (U,x), à ne pas confondre
avec le stalk (que j'appelle germe en Français) qui est la limite inductive.
Mais c'est presque pareil: deux germes équivalents ont le même stalk.

* https://stacks.math.columbia.edu/tag/04QT
$ 34.18 Local properties of germs

Definition 34.18.1. Let P be a property of germs of schemes. We say that P is étale local (resp. smooth local) if for any étale (resp. smooth) morphism of germs (U′,u′)→(U,u) we have P(U,u)⇔P(U′,u′).

Exemple: la dimension locale, la codimension, la régularité sont germe-locales
pour les morphismes étales:
Lemma 34.18.2. Let f:U→V be an étale morphism of schemes. Let u∈U and
v=f(u). Then dim_u(U)=dim_v(V). And dim(OU,u)=dim(OV,v).
And OU,u is a regular local ring if and only if OV,v is a regular local ring.

Functorial point of view
========================

https://ncatlab.org/nlab/show/functorial+geometry
et les références:
Grothendieck course at Buffalo: http://matematicas.unex.es/~navarro/res/ifag.pdf
Zhen Lin thesis: https://www.repository.cam.ac.uk/bitstream/handle/1810/256998/Low-2016-PhD.pdf?sequence=1&isAllowed=y

https://mathoverflow.net/questions/33070/functorial-point-of-view-for-formal-schemes

Séminaire lectures Grothendieckiennes: http://www.math.ens.fr/seminaire_G/

Faisceaux quasi-cohérents
=========================

Définition
----------

Soit X un schéma, F un faisceau de modules.

On dit que F est quasi-cohérent ssi pour tout ouvert affine U, F|U est
isomorphe au faisceau induit par un O_X(U) module M.

Th: F est quasi-cohérent équivaut à:
- il existe un recouvrement de X par des ouverts affines U_i tels que F|U_i
  soit isomorphe au faisceau induit par un module affine
- Pour tout V affine inclus dans U affine, l'application canonique
  F(U) \tens_O_X(U) O_X(V) -> F(V) est un isomorphisme
- F est un conoyau: O_X^n -> O_X^m -> F -> 0
  (n, m poeuvent être des ordinaux)

Cor: si F est induit par M sur un ouvert affine Spec(A), F|D_f=M_f, F|P=M_P

Ex: Si R anneau de valuation discrète, Spec R a un point fermé x_1 et un
point ouvert x_0. Un faisceau quasi-cohérent F est donné par
M_0=\Gamma(x_0,F) et M_1=\Gamma(X,F) avec M_0=M_1 \tens_R Frac(R).

Rem: Si Y est fermé dans X, F un O_Y module, alors F est O_Y-quasi-cohérent
ssi F étendu par 0 en X\Y est O_X-quasi-cohérent.

Th: Si X noéthérien, F est cohérent si pour tout ouvert affine U, F|U vient
d'un module fini M; il suffit de le vérifier pour un recouvrement ouvert.

Th: Si f:X->Y est qs, et F quasi-cohérent sur X, f_*(F) est quasi-cohérent
sur Y. Si de plus f est projectif(?) et F cohérent, f_*(F) est cohérent.

Pr: Mumford, RedBook III.$1, ou Hartshorne.

Faisceaux sur un espace affine
------------------------------

Th: Si X affine, le foncteur section globale induit une équivalence de
catégorie entre faisceau quasi-cohérent et O_X(X)-modules; de plus il est
exact (ainsi que son foncteur réciproque "faisceau associé").

Plus précisément: si 0->F'->F->F''->0 est exact, et si F'' est
quasi-coherent, alors 0->\Gamma(X,F')->\Gamma(X,F)->\Gamma(X,F'')->0 est
exact
(car les faisceaux quasi cohérents ont une cohomologie triviale sur un
espace affine).

On a l'adjonction
Hom_A(M,\Gamma(X,F)) = \Hom_{Spec A}(M~, F)
pour tout faisceau de module F (non forcément q.cohérent) sur Spec A.

Faisceaux sur un espace projectif
---------------------------------

Si M gradué sur S gradué, on a un foncteur ~ qui associe
M~ faisceau quasi-cohérent sur Proj S.
Réciproquement si S est généré par S_1, alors \Gamma_*(F)~ = F
où \Gamma_*(F)=\sommetens \Gamma(X,F(n))

Les foncteurs ~ et \Gamma_* induisent des équiv de catégorie entre les
O_X-modules cohérents et les S modules gradués finis à troncation près.

Rem: Si S=A[x_0,...,x_r], \Gamma_*(S~)=S
De plus I_1 et I_2 idéaux de S définissent le même sous-schéma fermé ss'ils
ont la même saturation; et si I est un O_X-idéal, \Gamma_*(I) est saturé,
d'où bijection entre sous-schémas fermés et idéaux saturés.
(la saturation de I est l'ensemble des s\in S tel que pour tout i, x_i^n s \in I pour n>>0)

Projectivité normale
--------------------

* Projectivité normale: si X est une sous-variété de P^n, on a
S(X)=k[X_0, ..., X_n]/I_X \subset S~(X)=\sum Γ(L^n)
on dit que X est proj normal si X est normal et S iso à S~.

* Plus de détails:
https://math.stackexchange.com/questions/409222/projective-normality
https://amathew.wordpress.com/2013/05/23/projective-normality-and-independent-conditions/

Plus exactement, si L=O_P(1)|X, A:=k[X0,...,Xn]=\sum Γ(P, O(n))=S~(P),
alors l'application restriction définit une application naturelle A->S~(X)
dont le noyau est l'idéal I_X, ie S(X) est l'image de cette application.
Cette application est un iso <=> A->>S~(X) <=> Γ(P, O(n)) ->> Γ(X, L) pour
tout n>=0 (Harthshorne Exo 5.14 p 126),
ie S^n Γ(X,L) ->> Γ(X, L^n) [ici on suppose que X->P^N est donné par le
plongement projectif associé à L très ample, dans ce cas Γ(X,L)=Γ(P, O(1))
par définition d'un plongement projectif, cf cf BiLal, p 197],
et ça revient à la multiplication Γ(X, L^n) \tens Γ(X, L)->Γ(X, L^{n+1})
est surjective (BiLal Lemme 7.3.2) pour tout n.

* Mult surjective => L très ample

Mumford (on varieties defined by quadratic equations, p39) montre même que
si L est ample et qu'on a cette surjectivité pour tout n, alors il est très
ample. 

Donc L ample tel que la mult est surjective pour tout n <=> L très ample et
proj normal.

Question: si on a juste la surjectivité pour n assez grand? Réponse: L est
toujours très ample. En fait la preuve de Mumford est la suivante: L^N est
très ample pour N grand, et on a le diagramme (via le plongement de Segre)
X -> P(Γ(L^N)) -> P(S^N Γ(L)) si S^N est surjective
  -> P(Γ(L)    ->
Donc il suffit que S^N soit surjectif pour N assez grand pour que L soit très ample.

Question: et si on a juste Γ(X, L^k) \tens Γ(X, L)->>Γ(X, L^{k+1}) pour k
assez grand? A priori c'est beaucoup moins fort que la surj de S^N.

D'un autre côté, cf Stacks, si on est ample on est une immersion vers Proj(Γ*(L)). On est très ample si on a une immersion vers P(E), donc plus ou moins si Γ*(L) est engendré en degré 1 (quitte à remplacer par un module saturé). Ca donne d'ailleurs une autre preuve que très ample est lié à la surjectivité de la multiplication.

* L très ample => Mult surjective
Si L est juste très ample, la mult. est surjective pour n assez grand:
Par cohomologie, la surjectivité de la multiplication en S^k est équivalente
à H^1(P, I_X(k))=0: on veut Γ(P^n,OP^n(k))→Γ(X,O_X(k)) surjectif, et on
regarde la suite exacte: 
0→I_X(k)→O_P^n(k)→O_X(k)→0 (remembering that H^1(P_n,O(k))=0.)

Comme H^1(P, I_X(k))=0 pour k assez grand (car O(1) est ample, cf
Hartshorne plus bas), ça montre que S^k est surjectif pour k assez grand,
et donc en particulier que Γ(X, L^k) \tens Γ(X, L)->Γ(X, L^{k+1})  est
surjectif pour k assez grand.

* Question: si L est ample, est-ce qu'on a la surjectivité pour
n assez grand? Si on remplace L par L^N pour N>>0 oui, on est même proj normal, mais pour L??

Réponse non: exemple sur une courbe elliptique, D=(0_E) est ample, mais ses
sections globales sont les constantes, donc la multiplication n'est pas
surjective.

Par contre, cf Harthshorne
http://www.numdam.org/article/PMIHES_1966__29__63_0.pdf Prop 1.2, si X est
propre, L ample <=> pour tout faisceau F, il existe n0 tel que H^i(X, F
\tens L^n) pour tout i>0 et n>=n0.
En appliquant ça à la multiplication, on voit que Γ(X, L^n) x Γ(X,
L^m)->Γ(X, L^{n+m}) est surjectif pour n, m assez grands. En particulier
comme chaque module de section est fini (X propre), l'anneau des sections
globales est de type fini.

* Conclusion:
- Si L est ample, Γ(X, L^n) x Γ(X, L^m)->Γ(X, L^{n+m}) est surjectif pour n, m assez grands.
- Si L est ample, L est très ample <=> S^n: S^n Γ(L) -> Γ(L^n) est surjectif
pour n assez grand
  Ca implique Γ(X, L^k) \tens Γ(X, L)->Γ(X, L^{k+1}) est surjectif pour k assez grand.
- Si L ample, L très ample et on est proj normal <=> S^n: S^n Γ(L) -> Γ(L^n) est surjectif pour tout n <=> Γ(X, L^k) \tens Γ(X, L)->Γ(X, L^{k+1}) est surjectif pour tout k. Et alors l'anneau homogène k[X0,...,Xn]/I_X =~ S~(L)

* Voir aussi la régularité de Castelnuovo-Mumford
- https://mathoverflow.net/questions/25603/ample-line-bundles-sections-morphisms-to-projective-space. 

- https://arxiv.org/pdf/math/0512645.pdf M-REGULARITY AND THE FOURIER-MUKAI TRANSFORM

A coherent sheaf F on P^n is called m-regular in the sense of Castelnuovo-Mumford if H^i(F(m−i)) = 0,for all i >0. The main result involving this concept is the following:
Theorem 1.2 (Castelnuovo-Mumford Lemma).
Let F be a 0-regular coherent sheaf on P^n. Then the following hold:
(1) F is globally generated.
(2) F is m-regular for all m≥1.
(3) The multiplication map H^0(F)⊗H^0(OP^n(k))→H^0(F(k)) is surjective for all k≥0

- https://en.wikipedia.org/wiki/Castelnuovo%E2%80%93Mumford_regularity
the Castelnuovo–Mumford regularity of a coherent sheaf F over projective space Pn is the smallest integer r such that it is r-regular, meaning that
    H^i(P^n, F(r−i)) = 0
whenever i > 0. The regularity of a subscheme is defined to be the regularity of its sheaf of ideals. The regularity controls when the Hilbert function of the sheaf becomes a polynomial; more precisely dim H^0(P^n, F(m)) is a polynomial in m when m is at least the regularity. The concept of r-regularity was introduced by Mumford (1966, lecture 14), who attributed the following results to Guido Castelnuovo (1893):
  - An r-regular sheaf is s-regular for any s ≥ r.
  - If a coherent sheaf is r-regular then F(r) is generated by its global sections.

Pullbacks et pushforwards
-------------------------

Si f: Spec B -> Spec A, alors
- f^* (M~)=(M \tens_A B)~
- f_* (N~) = (N vu comme A-module)~

Si \phi est un morphisme d'anneaux gradués S->T, ça induit un morphisme
U ouvert dans Y=Proj T -> X=Proj S;
- f^* (M~)=(M \tens_S T)~|U
- f_* (N~|U) = (N vu comme S-module)~
On particulier le pullback de O_X(n) est O_Y(n)|U et le pushforward de
O_Y(n)|U est (f_* O_U)(n)

Si f: Y->X, E loc libre sur X, alors
f_*(F \tens f^* E)=f_*(F) \tens E

Carrés commutatifs:
f: X->S; \pi: T->S, f_T le pullback X_T -> T, p: X_T -> X; F sur X
- G \tens_O_S f_* O_X \iso f_* f^* G
  si f affine (et G quasi-cohérent?)
- \pi^* f_* F \iso (f_T)_* p^* F˙
  si \pi plat et f séparée qc (ou X noeth)
- f_* F \tens_O_S G \iso F \tens_O_X f^* G
  si G loc libre,

Faisceaux cohérents
-------------------

Th (Serre)
Si X proj sur A noeth, F cohérent, alors
F(n) est engendré par un nombre fini de sections globales pour n>>0

Si f:X->Y morphisme projectif de schémas sur A Nagata (ex k-alg de type
fini), alors si F cohérent f_* F est cohérent.

Extension faisceaux cohérents
-----------------------------

1) Se donner un module de type fini sur le localisé revient à se
donner un Module cohérent sur un voisinage ouvert suffisamment petit (cf EGA
IV paragraphe 8).

ie: si M est de type fini sur A_P, il vient d'un module de type fini sur
A[1/f].

2) Maintenant, un module de type fini sur le localisé
A[S^-1] est le localisé d'un A-module de type fini. Deux démonstrations :

a- de manière générale, si X est un schéma noethérien, U un
ouvert, tout faisceau cohérent sur U peut se prolonger en un faisceau
*cohérent* sur X [cela doit se trouver dans Pierre Gabriel, _Des catégories
abéliennes_, Bull. Soc. Math. France 90 (1962) 323--448.]
(cf Hartshorne, exo 5.15)

b- si on choisit une présentation A[S^-1]^m -> A[S^-1]^n -> M -> 0 du
module, on voit que, quitte à les multiplier tous par un élément de S
convenable, on peut supposer que les coefficients de la matrice
(n,m) représentant le morphisme de gauche proviennent de A...

=> Au final, un module de type fini sur le localisé A_P provient d'un
module de type fini sur A.

(cf sciences.maths  Message 10835)

Rappels changement de base
---------------------------

- Si N B-Module, Hom_A(M,N)=Hom_B(M \tens_A B, N)
  En particulier si K B-alg, X(K)=X_B(K)
- Si B/A plat, M, N A-modules, M finiment présenté, alors
  Hom_A(M,N)\tens B = Hom_B(M \tens_A B, N \tens_A B)
- Restriction de Weil: adjoint au pullback (dans l'autre sens que le
  foncteur d'oubli)
  Res_L/k X(S)=X(S_L)

Pushforward
-----------

* https://stacks.math.columbia.edu/tag/01LA
$ 26.24 Functoriality for quasi-coherent modules

It is in general not the case that the pushforward of a quasi-coherent module is quasi-coherent. Here is a case where this does hold.

Lemma 26.24.1. Let f:X→S be a morphism of schemes. If f is quasi-compact and quasi-separated then f∗ transforms quasi-coherent OX-modules into quasi-coherent OS-modules.

Voir aussi la discussion dans: https://math.stackexchange.com/questions/1109747/when-is-the-pushforward-of-a-quasi-coherent-sheaf-quasi-coherent-hartshorne-pro

Nilpotents
==========

Th: Soit X un schéma, U ouvert, s une section sur U. On a l'équivalence de
(i) s est localement nilpotent
(ii) s(x)=0 pour tout x \in U
(iii) Ann s = U
(iv) Si U est qc: s est nilpotente

Pr: (ii)<=>(iii) est trival, (i)<=>(ii) vient de ce que pour un ouvert
affine, nilrad=intersection des premiers, (i)<=>(iv) pour U qc est trivial.

Th: 1) S'il existe un élément localement nilpotent s sur un ouvert U, il
existe une germe dans U tel que s soit nilpotent.
2) Réciproquement, s'il existe une un élément nilpotent d'une germe, ou une
section localement nilpotente sur un ouvert, alors il existe un élément
nilpotent en chaque ouvert affine contenant cet ouvert/cette germe.

Pr: 1) Si on a un élément nilpotent non nul, il existe une germe ou il est
toujours non nul, et toujours nilpotent.
2) Par définition des germes, un élément nilpotent d'une germe vient d'un
élément nilpotent d'un petit ouvert autour. Soit A un ouvert affine
contenant ce petit ouvert affine, que l'on peut supposer égale à A_f. On
a donc un élément nilpotent g/f^m dans A_f. Donc les f^k g sont non nuls
dans A (sinon g serait nul dans A_f); et comme (g/f^m)^k est nul pour k
assez grand, ça veut dire que f^k' g^k est nul pour k,k' assez grand,
donc gf est nilpotent. (Par le th précédent, ça se voit directement en
constatant que g est nul sur D(f), et que f étant nul sur Var(f), gf est
nul sur A, donc nilpotent).

Cor: Soit X un schéma. X réduit <=> il n'y a pas d'éléments localement
nilpotents sur un ouvert <=> l'anneau des sections en chaque ouvert est
réduit <=> chaque germe est réduite.
De plus X est réduit ss'il existe un recouvrement par des ouverts affines
réduits.

Cor (si je ne me plante pas):
soit N le préfaisceau des sections nilpotenents, R le préfaisceau quotient
R(U)=O_X(U)/N(U), ie le quotient réduit maximal.
Si X n'est pas noéth, N et R ne sont pas des faisceaux en gal. Soit N+ et
R+ les faisceaux associés. Alors N+ est le faisceau des sections localement
nilpotenentes, et R+ est le faisceau associé à X_réd. Comme le foncteur
faisceau associé est exact, on a toujours que R+=O_X/N+.

Kahler differentials
====================

* https://en.wikipedia.org/wiki/K%C3%A4hler_differential
* https://en.wikipedia.org/wiki/Cotangent_sheaf
Let f : X → S and Δ: X → X ×S X the diagonal morphism. Then the image of Δ is locally closed; i.e., closed in some open subset W of X ×S X (the image is closed if and only if f is separated). Let I be the ideal sheaf of Δ(X) in W. One then puts: Ω_{X/S} = Δ∗(I/I^2)

Si S et R sont affines, on a
     Hom_S(Ω_{S/R}, M) ≅ Der_R(S,M).
Ω_{S/R}=I/I^2 où I est le noyau de S\otimes_{R}S \to S
ie c'est le module de dérivation universel.

Le fibré cotangent est stable par pullback: Ω_{X/S} \tens S'=Ω_{X'/S'}

* Suites exactes:
If S→T is a morphism of schemes, then
    f^∗ Ω_{S/T} → Ω_{X/T} → Ω_{X/S} → 0.
Et c'est une suite exacte si X->S est lisse (https://stacks.math.columbia.edu/tag/02K4)

If X is a closed subscheme of S with ideal sheaf I, then
    I / I^2 → Ω_{S/T} ⊗ O_X → Ω_{X/T} → 0 (en effet, Ω_{X/S}=0)
Et c'est une suite exacte si X->T est lisse. (https://stacks.math.columbia.edu/tag/06AA)
[Changement de notation: Z is a closed subscheme of X au dessus de S: 
    I / I^2 → Ω_{X/S} ⊗ O_Z → Ω_{Z/S} → 0]

Si on a une immersion i:X->S d'idéal I, telle que j:X->S->T est aussi une immersion d'idéal J, alors J/J^2→I/I^2→i^∗ Ω_S/T→0
et on a une suite exacte si S->T est lisse.

Preuves: la suite exacte se continue par le cotangent complex,
  H_1(NL_B/A ⊗_B C)→H_1(L_C/A)→H_1(L_C/B)→C ⊗_B Ω_B/A→Ω_C/A→Ω_C/B→0
of C-modules extending the sequence of Lemma 10.130.7. If Tor_B^1(Ω_B/A,C)=0, then H_1(NL_B/A ⊗_B C)=H_1(L_B/A) ⊗_B C.
et pour une immersion X->S fermée NL_X/S est homotopiquement équivalent à I/I^2

* Cotangent complex https://en.wikipedia.org/wiki/Cotangent_complex
 X -f-> S -g->T induit [attention: c'est vrai pour des schémas affines, il
 faut des conditions quand on a des morphismes de schémas]
  Lf^∗ L_S/T → L_X/T → L_X/S → L_f^∗ L_S/T[1].
d'où une suite longue
  H_2(L_X/S)->H_1(Lf^∗ L_S/T)→H_1(L_X/T)→H_1(L_X/S)→ f* Ω_S/T→Ω_X/T→Ω_X/S→0

- X/S lisse <=> L_X/S=Ω_X/S[0]
- X/S l.c.i. <=> L_X/S perfect en degré [-1,0]
- Si B=A/I, avec I généré par une séquence régulière (ou de Koszul),
  L_B/A is quasi-isomorphic to I/I^2[1].
Note: si B=A/I on a NL_B/A=I/I^2[1] donc H_1(L_B/A)=I/I^2.

* Fibres (cf Mumford/RedBook)

Th: Soit X de type fini sur k, x point fermé. Alors l'espace tangent
T_x=hom_k(m_x/m_x^2,k) est isomorphe à
- L'espace des k-dérivations D: O_X|x -> k; ie
  D(fg)=f(x) Dg + g(x) Df.
- Hom_{O_X|x}(\Omega_X/k|x,k(x)) [=Hom_k(x)(\Omega_X/k(x),k(x)]
- Hom(k[\epsilon]/(\epsilon^2),X) d'image x.

Cor: Pour tout x\in X fermé, l'espace cotangent m_x/m_x^2 est isomorphe à
\Omega_X/k(x) = \Omega_X/k|x \tens_{O_X|x} k(x). [Note: il faut k parfait en général]
Cet isomorphisme envoie df (mod m_x \Omega_X/k|x) sur f-f(x) modulo m_x^2.
En particulier, l'espace cotangent en chaque x vient du faisceau cohérent
\Omega_X/k.

Naive cotangent complex
-----------------------

* https://stacks.math.columbia.edu/tag/00S0
$ 10.133 The naive cotangent complex

Given a ring map R→S there exists a canonical simplicial R-algebra P∙ whose terms are polynomial algebras and which comes equipped with a canonical homotopy equivalence P∙⟶S
The cotangent complex L_S/R of S over R is defined as the chain complex associated to the cosimplicial module Ω_{P∙/R} ⊗_{P∙} S

Le cotangent complex naïf est donné par la troncation en degré 1, il aura
donc le même H_0 et H_1.

! Définition
Si on a une présentation 0->I->P-α>S->0 (où P est un anneau de polynôme, pas
forcément de type fini, sur R), on a le complexe "naïf":
NL(α):I/I^2⟶Ω_{P/R} ⊗_P S (où I/I^2 est en degré 1 et Ω en degré 0)

Les NL(α) sont homotopiquement équivalent pour toute présentation α. Plus
généralement, si on a un morphisme de présentation α:P->S vers α':P'->S',
alors on a un morphisme bien défini à homotopie près NL(α) -> NL(α'), qui
est un quasi isomorphisme si les morphismes R->R' et S->S' induits sont des
isos.

En fait on a même une équivalence de K-théorie:
Lemma 10.133.15. Let R→S be a ring map of finite type. For any presentations α:R[x1,…,xn]→S, and β:R[y1,…,ym]→S we have I/I^2⊕S^⊕m≅J/J^2⊕S^⊕n as S-modules where I=Ker(α) and J=Ker(β).

L'homotopie en degré 0 et 1 coincide avec celui de L_S/R et on a
H_0(NL_S/R)=H_0(L_S/R)=Ω_{P/R} ⊗_P S/I=Ω_S/R.
H_1(NL_S/R)=H_1(L_S/R)=Ker(I/I^2⟶Ω_{P/R} ⊗_P S)

! Résultats
Lemma 10.133.4 (Jacobi-Zariski sequence). Let A→B→C be ring maps
We get the following exact sequence of homology groups
  H_1(NL_B/A ⊗_B C)→H_1(L_C/A)→H_1(L_C/B)→C ⊗_B Ω_B/A→Ω_C/A→Ω_C/B→0
of C-modules extending the sequence of Lemma 10.130.7. If Tor_B^1(Ω_B/A,C)=0, then H_1(NL_B/A ⊗_B C)=H_1(L_B/A) ⊗_B C.

Exemples: 
- si B est une algèbre de polynôme sur A, on peut prendre pour NL(B/A): 0→Ω_B/A
- si B=A/I, à homotopie près on a NL(B/A)=I/I^2→0, ie H_1(B/A)=I/I^2 [10.133.6]
- Changement de base plat: NL_{S/R}⊗_R R′⟶NL_{S⊗_R R′/R′} est une équivalence d'homotopie si R->R' est plat
- Localisations: 
    - Si S^−1A→B, NL_{B/A}→NL_{B/S^−1A} is a homotopy equivalence.
    - NL_{B/A}⊗_B B_g→NL_{B_g/A} is a homotopy equivalence [Lemma 10.133.12.]
    - NL_{B/A}⊗_B S^−1B→NL_{S−1B/A} is a quasi-isomorphism

Le lemme 10.133.12 donne la présentation suivante de B_g: β:P[x]⟶B_g extending α and sending x to 1/g:
  - J/J^2=(I/I^2)_g⊕B_g(fx−1), où J=(I,f) tel que α(f)=g
  - Ω_{P[x]/A} ⊗_P[x] B_g=Ω_P/A ⊗_P B_g ⊕ B_gdx,
  - NL(β)≅NL(α)⊗_B B_g ⊕ (B_g →^g B_g)

Cotangent complex
-----------------

* https://arxiv.org/pdf/1008.0601.pdf
A note on the cotangent complex in derived algebraic geometry, Gabriele Vezzosi

* https://stacks.math.columbia.edu/tag/08PL
$ 88.3 The cotangent complex of a ring map

Definition 88.3.2. The cotangent complex L_B/A of a ring map A→B is the complex of B-modules associated to the simplicial B-module
ΩP∙/A⊗P∙,ϵB where ϵ:P∙→B is the standard resolution of B over A.

* https://stacks.math.columbia.edu/tag/08PQ
$ Simplicial resolutions and derived lower shriek 

Lemma 88.4.2. Let A→B be a ring map. Let ϵ:P∙→B be the standard resolution of B over A. Let π be as in (88.4.0.1). Then
Lπ_!(F)=F(P∙,ϵ) in D(Ab), resp. D(B) functorially in F in Ab(C), resp. Mod(B−).
En particulier, L_B/A= Lπ_!(Ω_O/A ⊗_O B−)

* https://stacks.math.columbia.edu/tag/08QL
$ 89.6 Functoriality 
On a une application canonique LB/A⟶LB′/A′
pour un diagramme commutatif

Lemma 89.6.2. If (89.6.0.1) induces a quasi-isomorphism B⊗^L_A A′=B′, then the functoriality map induces an isomorphism
L_B/A ⊗^L_B B′⟶L_B′/A′

* https://stacks.math.columbia.edu/tag/08QR
$ 88.7 The fundamental triangle

 In this section we consider a sequence of ring maps A→B→C. It is our goal to show that this triangle gives rise to a distinguished triangle
    L_B/A⊗^L_B C → L_C/A → L_C/B → L_B/A ⊗^L_B C[1] in D(C).

* https://stacks.math.columbia.edu/tag/08R4
$ 88.9 Smooth ring maps
Lemma 88.9.1. If A→B is a smooth ring map, then L_B/A=Ω_B/A[0]. 

* https://mathoverflow.net/questions/2607/intuition-about-the-cotangent-complex
  If an ideal I in a ring A is generated by a regular sequence, the cotangent complex of the quotient map A↠A/I is (I/I^2)[1]
  In general, the cotangent complex of an algebraic space can be supported in arbitrary non-positive degrees. The cotangent complex of an Artin stack can be nonzero in degree 1. The degrees in which the cotangent complex is concentrated imply various things about a morphism of schemes:
  - it is perfect in degree 0 if and only if the map is smooth;
  - it is perfect in [−1,0] if and only if the map is lci;
  - H1=0 if and only if it is a DM stack;
  - H0=H1=0 if and only if it is an etale local immersion.

* https://stacks.math.columbia.edu/tag/08R6
$ Comparison with the naive cotangent complex

Lemma 89.10.3. Let A→B be a ring map. Then τ≥−1LB/A is canonically quasi-isomorphic to the naive cotangent complex.

Remark 89.10.5.
Hence we conclude that H_n(C_B/A,J/J^2)→H_n(L_B/A)
[où C_B/A=la catégorie opposée des algèbres de polynôme sur A avec un
morphisme P->B, J⊂O be the kernel of O→B−.]
is an isomorphism for all n≥2. Combined with the remark above we obtain the formula H_2(L_B/A)=H_2(CB/A,J/J2)=H_0(C_B/A,Tor^O_1(J,B−)).

* https://stacks.math.columbia.edu/tag/08RC
$ 88.11 A spectral sequence of Quillen
 In this section we discuss a spectral sequence relating derived tensor product to the cotangent complex.

* https://stacks.math.columbia.edu/tag/08SH
$ The cotangent complex of a local complete intersection

Lemma 88.13.2. Let A→B be a surjective ring map whose kernel I is generated by a regular sequence (or is Koszul). Then L_B/A is quasi-isomorphic to I/I^2[1].

Proposition 88.13.4. Let A→B be a local complete intersection map. Then L_B/A is a perfect complex with tor amplitude in [−1,0].
(ie is quasi-isomorphic to a complex E∙ of finite projective R-modules
which are 0 in degree not in [-1,0])

* https://stacks.math.columbia.edu/tag/08SM
$ 88.15 Deformations of ring maps and the cotangent complex

A'->A une déformation (ie I^2=0), A->B, N un B-module, I->N morphisme de A-module, on veut trouver B':
  0 -> N -> B'? -> B -> 0
  0 -> I -> A'  -> A -> 0

Lemma 88.15.1. In the situation above we have
  - There is a canonical element ξ∈Ext^2_B(L_B/A,N) whose vanishing is a sufficient and necessary condition for the existence of a solution to (88.15.0.1).
  - If there exists a solution, then the set of isomorphism classes of solutions is principal homogeneous under Ext^1_B(L_B/A,N).
  - Given a solution B′, the set of automorphisms of B′ fitting into (88.15.0.1) is canonically isomorphic to Ext^0_B(L_B/A,N).

Voir aussi: https://mathoverflow.net/questions/2607/intuition-about-the-cotangent-complex
  If you have a scheme X over k, a first order deformation is a space X over k[ϵ]/(ϵ)^2 whose fiber over the only point of k[ϵ]/(ϵ)^2 is X again. You can imagine k[ϵ]/(ϵ)^2 as a point with an infinitesimal arrow attached to it and X as an infinitesimal thickening of X. The cotangent complex gives you precise information on how many such thickenings there are: The set of such thickenings is isomorphic Ext^1(L_X,ϵ^2).
  Now let's assume that we have chosen one such infinitesimal thickening X over k[ϵ]/(ϵ)^2. It is not always true that you can go on and make this thickening into a thickening to the next order. Whether or not you can do this is measured precisely by the cotangent complex: There is a map that takes as input your chosen thickening X and spits out an element in Ext^2(L_X,ϵ^3). If the element in the Ext group is zero you can go on to the next level. If it is not zero, it's game over and your stuck.

  If f:S→X is a map of schemes and S′ is a square-zero extension of S with ideal J, there is an obstruction to extending f to S′ in the group Ext^1(f∗L_X,J). If this obstruction vanishes, such extensions have a canonical structure of a torsor under Ext^0(f^∗L_X,J).
  If p:X→S is a morphism, S′ is a square-zero extension with ideal J, and p∗J→I is a homomorphism of quasi-coherent sheaves on X, then the problem of finding a square-zero extension X′ with ideal I and a map X′→S′ extending X→S compatible with the given map on ideals is obstructed by a class in Ext^2(L_X/S,I). If this class is zero, isomorphism classes of solutions form a torsor under Ext^1(L_X/S,I) and isomorphisms between any two solutions form a torsor under Ext^0(L_X/S,I).

* https://stacks.math.columbia.edu/tag/08UQ
$ 88.17 The cotangent complex

In this section we discuss the cotangent complex of a map of sheaves of rings on a site. In later sections we specialize this to obtain the cotangent complex of a morphism of ringed topoi, a morphism of ringed spaces, a morphism of schemes, a morphism of algebraic space, etc.

Let C be a site and let Sh(C) denote the associated topos. Let A denote a sheaf of rings on C. Let A-Alg be the category of A-algebras. Consider the pair of adjoint functors (F,i) where i:A-Alg→Sh(C) is the forgetful functor and F:Sh(C)→A-Alg assigns to a sheaf of sets E the polynomial algebra A[E] on E over A. Let X∙ be the simplicial object of Fun(A-Alg,A-Alg) constructed in Simplicial, Section 14.33.

Now assume that A→B is a homomorphism of sheaves of rings. Then B is an object of the category A-Alg. Denote P∙=X∙(B) the resulting simplicial A-algebra. Recall that P0=A[B], P1=A[A[B]], and so on. Recall also that there is an augmentation
ϵ:P∙⟶B where we view B as a constant simplicial A-algebra. This is the
standard resolution of B.

Déf: L_B/A=Ω_{P∙/A}⊗_{P∙,ϵ} B

Lemma 88.17.8. Let D be a site. Let A→B→C be homomorphisms of sheaves of rings on D. There is a canonical distinguished triangle
    L_B/A⊗^L_B C → L_C/A → L_C/B → L_B/A ⊗^L_B C[1] in D(C).

=>
$ Section 88.19: The cotangent complex of a morphism of ringed spaces
$ Section 88.20: Deformations of ringed spaces and the cotangent complex

$ Section 88.21: The cotangent complex of a morphism of ringed topoi
Lemma 89.21.3. Let f:(Sh(C1),O1)→(Sh(C2),O2) and g:(Sh(C2),O2)→(Sh(C3),O3) be morphisms of ringed topoi. Then there is a canonical distinguished triangle
Lf∗Lg→Lg∘f→Lf→Lf∗Lg[1] in D(O1).

$ Section 88.22: Deformations of ringed topoi and the cotangent complex
$ Section 88.23: The cotangent complex of a morphism of schemes
$ Section 89.24: The cotangent complex of a scheme over a ring
$ Section 89.25: The cotangent complex of a morphism of algebraic spaces
$ Section 89.26: The cotangent complex of an algebraic space over a ring
$ Section 89.27: Fibre products of algebraic spaces and the cotangent complex

Propriétés géométriques
=======================

Stack: A variety is a scheme X over k such that X is integral and the structure morphism X→Spec(k) is separated and of finite type.

* https://stacks.math.columbia.edu/tag/0383
Lemma 29.22.4. Let X be a scheme over k. The structure morphism X→Spec(k) is universally open.

* Propriété des extensions de corps:
Lemma 10.160.4. Let k be a field. Let K/k be a separable field extension. Then K is geometrically normal over k (et donc géom réduit) 

Field base change
-----------------

* https://stacks.math.columbia.edu/tag/0C4X
$ 33.5 Change of fields and local rings

Lemma 33.5.1. Let K/k be an extension of fields. Let X be scheme over k and set Y=XK. If y∈Y with image x∈X, then
  - OX,x→OY,y is a faithfully flat local ring homomorphism,
  - with p0=Ker(κ(x) ⊗k K→κ(y)) we have κ(y)=κ(p0),
  - OY,y=(OX,x ⊗k K)p where p⊂OX, x⊗k K is the inverse image of p0.
  - we have OY,y/mxOY,y=(κ(x) ⊗k K)p0

Lemma 33.5.2. If X is locally of finite type over k. Then
dim(OY,y/mxOY,y)=trdegk(κ(x))−trdegK(κ(y))=dim(OY,y)−dim(OX,x)

Lemma 33.5.3. If X is locally of finite type over k, dim(OX,x)=dim(OY,y) and κ(x) ⊗k K is reduced (for example if κ(x)/k is separable or K/k is separable). Then m_xOY,y=m_y.

Note: les propriétés suivantes sont stables et descendent par field base change de type fini (c'est un cas particulier de changement fpqc): X loc. noeth, X loc. of finite type, O_X,x Cohen-Macauley
Les props suivantes descendent pour tout field base change: X a un ample invertible sheaf, X quasi affine, X propre, X projectif

Field of definition
-------------------

* https://stacks.math.columbia.edu/tag/04MJ
$ 33.31: Uniqueness of base field

Proposition 33.31.1. Let X be a scheme. Let a:X→Spec(k1) and b:X→Spec(k2) be morphisms from X to spectra of fields. Assume a,b are locally of finite type, and X is reduced, and connected. Then we have k′1=k′2, where k′i⊂Γ(X,OX) is the integral closure of ki in Γ(X,OX). 

Galois
------

! Descente des ouverts qc.

Lemma 33.7.8. Let k be a field. Let X be a scheme over k. Let A be a k-algebra. Let V⊂X_A be a quasi-compact open. Then there exists a finitely generated k-subalgebra A′⊂A and a quasi-compact open V′⊂X_A′ such that V=V′_A.

En particulier:
Lemma 33.7.9. Let k be a field. Let X be a scheme over k. Let k¯ be a (possibly infinite) Galois extension of k. Let V⊂X_k¯ be a quasi-compact open. Then
  - there exists a finite subextension k⊂k′⊂k¯ and a quasi-compact open V′⊂X_k′ such that V=(V′)_k¯,
  - there exists an open subgroup H⊂Gal(k¯/k) such that σ(V)=V for all σ∈H.

! Descente des fermés

Lemma 33.7.10. Let k be a field. Let k⊂k¯ be a (possibly infinite) Galois extension. Let X be a scheme over k. Let T¯⊂X_k¯ have the following properties
    - T¯ is a closed subset of X_k¯,
    - for every σ∈Gal(k¯/k) we have σ(T¯)=T¯.
Then there exists a closed subset T⊂X whose inverse image in X_k¯ is T¯.

Geometrically foo schemes
-------------------------

X schéma sur k.

* http://math.stanford.edu/~vakil/216blog/geofibersnov2710.pdf
PROPERTIES OF GEOMETRIC FIBERS (résumé (incomplet) des propriétés géom foo)
Si K/k inséparable, X schéma sur k, X_K -> X est un homéo, 

* Stack project:

Geometrically foo (foo=reduced, connected, irreductible, integral, normal,
regular): X schéma sur k est géom foo si X_k' est foo pour toute extension
k'. Il suffit de le vérifier sur k'=k^alg.

[Petit détail: pour géom regular comme c'est défini pour des anneaux locaux
noeth, on suppose X loc. noeth et on ne regarde que des extensions de corps
finiment engendrés]

Lemma 33.7.3, 33.8.2,... (Descente) Let k⊂k′ be a field extension. Then X is geometrically foo over k if and only if X_k′ is geometrically foo over k′.
De même pour géom réduit/normal/regular en un point x.

* Cas séparables/inséparables:
- pour les propriétés topologiques (connected, irreductible), il suffit
de regarder les extensions finies séparables (ou de prendre k'=k^sép) [réf: Lemma 33.7.11/33.8.8]
  En particulier, si X est foo et K/k purement inséparable (ou plus généralement k sép. clos dans K), X_K est foo.
  [en effet c'est trivial car X_K est homéo à X. La généralité vient que
  k(X)->k ne change pas les propriétés]
  Corollaire: si k sép. clos, X est foo <=> X est géom foo.
- pour les propriétés algébriques (réduit, normal, régulier), il suffit de regarder les extensions finies purement inséparable (et même juste k^{1/p}, ou la cloture parfaite de k pour "foo=reduced").
  En particulier, si X est foo et K/k séparable, X_K est foo.
  [en effet K/k est géom foo, donc X_K est foo. Réf: Lemma 33.10.6...]
  Corollaire: si k parfait, X est foo <=> X est géom foo.

* Produits
Th: Si X est geom foo et Y foo, X x_k Y est foo.
[Réf: Lemma 33.10.5, ...]
De même pour géom réduit/normal/regular en un point x: si X géom réduit en
x et Y réduit, X x_k Y est géom réduit en tout x' au dessus de x.
(Stack n'a pas la preuve pour "foo=regular" mais j'imagine que c'est vrai aussi)

Corollaire:
Si k parfait, le produit de deux schémas réduit est réduit.
Si k sép clos, le produit de deux schémas irréd/connexe est irréd/connexe.
Preuve: car dans ce cas, "foo=geom foo"

* Geom foo pour une extension de corps
Prop?: si X intègre, X est géom foo ssi k(X) est géom foo.

[Preuve: clairement, au moins si X est de type fini, par EGA IV.8 k(X) géom
foo <=> X est géom foo sur un ouvert U dense <=> X est géom foo. Il me
semble que ça marche en général, eg Lemma 33.8.6 dit que X géom foo => k(X)
géom foo. Plus généralement, il suffit de le vérifier pour X=Spec A affine,
et par ex. si K=Frac(A) est géom réduit clairement A aussi vu que kbar est
plat]

Prop:
- K/k est géom réduit ssi il est séparé.
- K/k est géom connexe/irréd ssi k est séparablement clos dans K (eg si K/k fini, K/k purement inséparable).
- K/k est géom intègre ssi k est alg clos dans K

Corollaire: si X intègre
- X est géométriquement réduit ssi k(X)/k est séparé
- X est géométriquement irréductible ssi k est sép. clos dans k(X) ssi k(X) \inter k^sép = k.
- X est géométriquement intègre ssi k est alg. clos dans k(X) ssi k(X) \inter k^alg = k [TODO: est-ce que c'est bien pareil que k sép clos et k(X)/k séparable? Il faut peut-être rajouter des hypothèses genre X de type fini]
et donc:
- si Y réduit et k(X)/k séparable, X x_k Y est réduit
- si Y irréd/connexe et k sép. clos dans k(X), X x_k Y est irréd/connexe
- si Y intègre, k(X)/k séparable et k alg. clos dans k(X), X x_k Y est intègre

### Geometrically reduced schemes

* https://stacks.math.columbia.edu/tag/035U
$ 33.6: Geometrically reduced schemes

Let k be a field of characteristic p>0, X a scheme over k. (<=>)
  - X is geometrically reduced,
  - X_k′ is reduced for every field extension k⊂k′,
  - X_k′ is reduced for every finite purely inseparable field extension k⊂k′,
  - X_k^1/p is reduced,
  - X_k^perf is reduced,
  - X_k¯ is reduced,
  - for every affine open U⊂X the ring OX(U) is geometrically reduced (see Algebra, Definition 10.42.1).

  - X is geometrically reduced at x,
  - O_Xk′,x′ is reduced for every finite purely inseparable field extension k′ of k and x′∈Xk′ the unique point lying over x,
  - O_Xk^1/p,x′ is reduced for x′∈Xk^1/p the unique point lying over x, and
  - O_Xkperf,x′ is reduced for x′∈Xk^perf the unique point lying over x.

  - X is geometrically reduced at x,
  - X_k′ is geometrically reduced at x′.

Lemma 33.6.7. Y be scheme over k.
  - If X is geometrically reduced at x, and Y reduced, then X ×_k Y is reduced at every point lying over x.
  - If X geometrically reduced over k and Y reduced. Then X ×_k Y is reduced.

Lemma 33.6.8.
  - If x′⇝x is a specialization and X is geometrically reduced at x, then X is geometrically reduced at x′.
  - If x∈X such that (a) OX,x is reduced, and (b) for each specialization x′⇝x where x′ is a generic point of an irreducible component of X the scheme X is geometrically reduced at x′, then X is geometrically reduced at x.
  - If X is reduced and geometrically reduced at all generic points of irreducible components of X, then X is geometrically reduced.

Lemma 33.6.9. If X locally Noetherian and geometrically reduced at x. Then there exists an open neighbourhood U⊂X of x which is geometrically reduced over k.

Lemma 33.6.11. X→Spec(k) be locally of finite type and X has finitely many irreducible components. Then there exists a finite purely inseparable extension k⊂k′ such that (X_k′)red is geometrically reduced over k′.

### Geometrically connected and irreducible schemes

* https://stacks.math.columbia.edu/tag/0361
$ 33.7 Geometrically connected schemes
* https://stacks.math.columbia.edu/tag/0364
$ 33.8 Geometrically irreducible schemes

X, Y schemes over k a field.

! Connected and irreducible components

Lemma 33.7.4/33.8.4. If X is geometrically connected/irred over k. Then the projection morphism p:X ×k Y⟶Y induces a bijection between connected/irred components.
Lemma 33.7.6/33.8.7. Let k⊂k′ be an extension of fields, k sep alg closed. Then X_k′→X induces a bijection of connected / irred components.

Lemma 33.7.15/33.8.9; Lemma 33.7.17 (Gabber)/33.8.10. 
Let k⊂K be an extension of fields. Denote p:X_K→X the projection morphism. 
- For every connected/irreducible component T of X the inverse image T_K⊂X_K is a union of connected/irreducible components of X_K.
- Let T¯⊂X_K be a connected/irred component. Then p(T¯) is a connected/irred component of X.

! Galois action on components

Lemma 33.7.18. Let k be a field, with separable algebraic closure k¯. Let X be a scheme over k. There is an action Gal(k¯/k)^opp×π_0(X_k¯)⟶π_0(X_k¯) with the following properties:
  - An element T¯∈π_0(X_k¯) is fixed by the action if and only if there exists a connected component T⊂X, which is geometrically connected over k, such that Tk¯=T¯.
  - The action is comptabile with base change for any field extension k⊂k′
Lemma 33.8.11: same with IrredComp(X_k¯)

Lemma 33.7.19. If
  - X is quasi-compact, and
  - the connected components of X_k¯ are open.
  (eg: X is of finite type over k.)
Then π_0(Xk¯) is finite, and the action of Gal(k¯/k) on π_0(X_k¯) is continuous.

Lemma 33.8.13. Assume X→Spec(k) locally of finite type.
  - the action Gal(k¯/k)^opp×IrredComp(X_k¯)⟶IrredComp(X_k¯) is continuous if we give IrredComp(X_k¯) the discrete topology,
  - every irreducible component of X_k¯ can be defined over a finite extension of k, and
  - given any irreducible component T⊂X the scheme T_k¯ is a finite union of irreducible components of X_k¯ which are all in the same Gal(k¯/k)-orbit.
Note: la même preuve marche pour π_0(X_k¯) si on est dans le cadre de 33.7.19.

! Irreductibility

Slogan: Geometric irreductibility is Zariski local modulo connectedness.
Lemma 33.8.5. Let k be a field. Let X be a scheme over k. The following are equivalent
  - X is geometrically irreducible over k,
  - for every nonempty affine open U the k-algebra OX(U) is geometrically irreducible over k (see Algebra, Definition 10.46.4),
  - X is irreducible and there exists an affine open covering X=⋃Ui such that each k-algebra OX(Ui) is geometrically irreducible, and
  - there exists an open covering X=⋃i∈IXi with I≠∅ such that Xi is geometrically irreducible for each i and such that Xi∩Xj≠∅ for all i,j∈I.
Moreover, if X is geometrically irreducible so is every nonempty open subscheme of X.

Lemma 33.8.6. Let X be a geometrically irreducible scheme over the field k. Let ξ∈X be its generic point. Then κ(ξ) is a geometrically irreducible over k.

! Conectedness

Lemma 33.7.13. Let T→X be a morphism of schemes over k, T geometrically connected and X connected. Then X is geometrically connected.
Lemma 33.7.14. If X is connected and has a point x such that k is algebraically closed in κ(x). Then X is geometrically connected. In particular, if X has a k-rational point and X is connected, then X is geometrically connected.

### Geometrically integral schemes
* https://stacks.math.columbia.edu/tag/0366
$ 33.9 Geometrically integral schemes

Lemma 33.9.3. Let k be a field. Let X be a proper scheme over k.
  - A=H^0(X,OX) is a finite dimensional k-algebra,
  - A=∏_i=1,…,n A_i is a product of Artinian local k-algebras, one factor for each connected component of X,
  - if X is reduced, then A=∏_i=1,…,n k_i is a product of fields, each a finite extension of k,
  - if X is geometrically reduced, then k_i is finite separable over k,
  - if X is geometrically connected, then A is geometrically irreducible over k,
  - if X is geometrically irreducible, then A is geometrically irreducible over k,
  - if X is geometrically reduced and connected, then A=k, and
  - if X is geometrically integral, then A=k.
Et donc H^0(X,OX)=k <=> X is geometrically connected (=> étant Stein)

Lemma 33.10.7. Let X be a proper geometrically normal scheme over k. (<=>)
  - H^0(X,OX)=k,
  - X is geometrically connected,
  - X is geometrically irreducible, and
  - X is geometrically integral.

* https://stacks.math.columbia.edu/tag/038L
$ 33.10 Geometrically normal schemes

* https://stacks.math.columbia.edu/tag/038S
$ 33.12 Geometrically regular schemes

Lemma 33.12.5 (descente plate). Let k be a field. Let f:X→Y be a morphism of locally Noetherian schemes over k. Let x∈X be a point and set y=f(x). If X is geometrically regular at x and f is flat at x then Y is geometrically regular at y. In particular, if X is geometrically regular over k and f is flat and surjective, then Y is geometrically regular over k.

Lemma 33.12.6. Let k be a field. Let X be a scheme locally of finite type over k. Let x∈X. Then X is geometrically regular at x if and only if X→Spec(k) is smooth at x (Morphisms, Definition 29.32.1).

Red book
--------

### Corps de définition

On dit que X/kbar est défini sur k ssi X=X0 *_k kbar, avec X0 schéma sur k.

Ex: si X/kbar est une variété fermée de A^n, X est définie sur k ss'il
existe des équations f_i(X_1,...,X_n)=0 définissant X, où f_i \in
k[X_1,...,X_n]

Th: Soit p: X->X0 la projection.
- p est surjective, fermée et ouverte
- Pour tout x \in X0, p^-1(x) est une orbite finie de Gal(k/k0)
  Si x est fermé, il y a bijection entre p^-1(x) et les
  k-plongements de k(x) dans kbar.
Pr: Mumford, RedBook, $4 Th1.

### Conjugaisons (descente Galoisienne)

Soit \sigma un automorphisme de kbar/k, on note \sigma_X la conjugation
induite sur X par (1 * \phi) où \phi: \Spec kbar -> \Spec kbar est induite
par \sigma^{-1}.

Ex: si X0=Spec k[X_1,...,X_n]/(f_1,...,f_m) et x \in X est le point fermé (x_1,...,x_n), alors \sigma_X(x)=(\sigma(x_1),...,\sigma(x_n)).
Plus généralement, si X0 (donc X est affine), \sigma_X([P]) correspond à
l'idéal (1 \tens \sigma)P dans X.

Si f est une fonction sur X, on a par définition (\sigma_X^*
f)(\sigma_X(x))=\sigma_X^* (f(x)) (où sigma_X^* est induite sur la fibre).

Th: Si X0 est de type fini sur k alors, en notant p:X->X0 la projection
(i) Pour tout ouvert U de X0, l'application canonique
O_X0(U) \tens_k kbar -> O_X(p^-1(U))
est un isomorphisme
(ii) Si f \in O_X0(U), alors pour tout point fermé x de p^-1(U) on a
f(\sigma_X(x))=\sigma(f(x)) [#]
(iii) Inversement, si k parfait et X réduit, O_X0(U) est l'ensemble des
sections O_X(p^-1(U)) satisfaisant [#]

Pr: Mumford, RedBook $4, Th 2.
  Pour (i), il suffit de se ramener aux ouverts affines.
  Pour (ii), comme X/kbar est de type fini, les points fermés ont pour corps
  résiduel kbar, et \sigma_X induit \sigma sur les corps résiduels. Or f est
  rationel => \sigma_X^* f = f pour tout \sigma, ce qui implique que
  f(\sigma(x))=\sigma(f(x))
  Pour (iii), si f(\sigma(x))=\sigma(f(x)) pour tout x, alors f0=f-\sigma_X^*
  f a pour valeur 0 en tout x fermé. Comme X est réduit, f0 qui s'annule en
  tout point fermé s'annule partout (car les points fermés sont denses sur
  kbar), donc f est stable par chaque \sigma_X^*. Mais comme k est parfait, k
  est l'ensemble des invariants de \Gal(kbar/k), donc f est k-rationelle.

Cor: Se donner X0/k est équivalent à se donner
(i) X/kbar
(ii) l'action de Gal(kbar/k) par conjugaison sur X
(X0 en tant qu'espace topologique sera le quotient de X par Gal(kbar/k)
(iii) Un sous faisceau de O_X défini sur les k-ouverts (ie les ouverts de X
stables par l'action de Galois): le faisceau des fonctions rationnelles
(ce faisceau induisant le faisceau sur X0)

Rem: - Si X est réduit et k parfait, il suffit d'avoir (i) et (ii)
- Si x \in X0 est un point fermé, il y a bijection entre p^-1(x) et les
  k-plongements de k(x) dans kbar.

### Extension des scalaires

Soit X un schéma de type fini sur k.

On dit que X est géométriquement irréductible si X*kbar est irréductible.
C'est équivalent à X*K est irréductible pour toute extension K/k, et il
suffit de le vérifier pour K=cloture séparable de k.

On dit que X est géométriquement réduit si X*kbar est réduit.
C'est équivalent à X*K est réduit pour toute extension K/k, et il
suffit de le vérifier pour K=cloture parfaite de k.

Th:
(i) X est géométriquement réduit ssi k(X)/k est séparé
(ii) X est géométriquement irréductible ssi k est alg clos dans k(X) ssi
k(X) \inter kbar = k.

Pr: Mumford, $4 Prop 4, ou Maths/Galois/produit_tensoriel

Embedded Primes
===============
Ce sont ceux qui interviennent dans la décomposition primaire d'un module.

Modules de longueur finies
--------------------------

- M est de longueur finie de longueur n => toute chaine maximale est de
longueur n.
- M longueur finie <=> M artinien et Noetherien
=> M est isomorphe à \sum M_P, et M=M_P si P^k anhilie M

R est artinien <=>
(i) R est noetherien de dimension 0 (ie tout idéal premier est max)
(ii) R est de longueur fini comme R-module
=> R a un nb fini d'idéaux max, R iso à \prod_fini R_P

Si R noetherien, M finiment engendré, alors M artinien <=>
(i) M de longueur finie
(ii) \prod_fini P_i annhilie M
(iii) R/ann(M) est artinien (ie tous les premiers contenant ann(M) sont max)

Cor: * avec les mêmes hypothèses M_P est de longueur finie <=> P minimal sur ann(M)
     * Si I est un idéal de R, on a les équivalences
  (i) P est minimal sur I
  (ii) R_P/I_P est artinien
  (iii) On a P_P^n \subset I_P pour n assez grand

Premiers associés
-----------------

* M finiment engendré sur R noetherien *

Ass M c'est les idéaux premiers annulant un élément de M.

Th:  - Ass M est fini, contient tous les idéaux premiers minimaux sur ann(M)
     - L'union des premiers dans ass M = {0} union {les zéros diviseurs sur M}
     - Ass M commute à la localisation

Cor: si I est un idéal, soit I contient un non diviseur sur M, soit I
      annilhie un élément de M (par prime avoidance), en fait dans ce
      dernier cas I est même inclus dans un assassin.

Prop: M' \subset M est nul ssi M'_P = 0 pour tout P dans Ass M

Prop:
- Ass (M' \somme M'')= Ass M' \union Ass M''
- Si 0->M'->M->M''->0, Ass M' \subset Ass M \subset Ass M' \union Ass M''
-  M a une filtration 0 \subset M_1 \subset ... \subset M
   ou M_{i+1}/M_i \iso R/P_i (les assasins apparaissent dans les P_i, mais
   il peut y en avoir d'autres!)

Prop: M is P-coprimaire (ie Ass(M)={P}) <=>
(i) P est minimal sur ann M et M -> M_P est une injection (ie les éléments
non dans P ne sont pas des diviseurs de zéros sur M)
(ii) P^k annule M pour k assez grand et M->M_P est une injection.

Application: si P est minimal sur ann(M), alors le noyau M' de M->M_P est
P-primaire (ie M/M' est P-coprimaire). On dit que M' est la composante
P-primaire.

Th: si M' sous-module, M' = intersection finie de modules P_i-primaires
i) Tout ass(M/M') apparait dans les P_i
ii) Si l'intersection est irredondante, les P_i sont exactement ass(M/M')
iii) Si l'intersection est minimale, chaque assassin apparait exactement
une fois. De plus si P_i est minimal sur ann(M/M'), M_i est la composante
P_i primaire de 0 dans M/M'

Th: Si I idéal, H^0_I(M) = (0:_M I^\infty) (=les éléments annulés par une
puissance de I).
Notons Ass(M) = A \union B où A sont les assasins dans le fermé engendré par I, et B les assassins dans l'ensemble ouvert complément de I.
Soit (0) = \intersection M_i la décomposition primaire de 0 dans M
i) H^0_I(M) = \intersection M_i où P_i est dans B
ii) H^0_I(M) est uniquement caractérisé par Ass(H^0_I(M))=A et Ass(M/H^0_I(M))=B

De plus, si U est un ensemble stable par multiplication tel que B soit
l'ensemble des assassins ne rencontrant pas U (ie B=assassins dans l'ouvert
défini par U), on a H^0_I(M)=Ker M->M[U^-1]
Pour tout U il existe I tel que B soit l'ensemble des assassins ne
rencontrant pas U, et réciproquement pour tout I, il existe f dans I tel
que A soit l'ensemble des assassins contenant f (de manière équivalente,
B est l'ensemble des ass dans l'ouvert associé à f). En particulier les noyaux
des localisations correspondent aux H^0_I(M) (qui d'ailleurs ne dépendent
que du radical de I)

Interprétation faisceautique
----------------------------

Bon maintenant, dans le cadre affine d'avant, si I = ann M, l'ensemble B
est nul (tout assassin contient ann M), donc on a bien M est nul en dehors
de son support. Si P est un premier minimal au-dessus de ann M, le noyau de
M -> M_P est exactement la composante P-primaire de M car P est le seul
assassin de M inclus dans P.
Plus généralement, le noyau M' de la restriction M -> M|U où U est un
ouvert, et quelque chose qui ne dépend que des Assassins qui sont dans U:
les assassins de M/M' c'est l'ensemble B (plus haut). Comme M/M' a tout ses
assassins dans U, la restriction y est injective. Inversement M' a tous ses
assassins en dehors de U, donc la restriction donne le module nul.

Longueur en un premier
----------------------

Si P premier, sa multiplicité dans M est par définition la longueur de
(0:P^\infity) dans M_P, qui est égal à \inter M_i,P pour P_i ne contenant
pas P, qui est égal à H^0_P(M)_P.
En effet, H^0_P(M) a pour assassins les premiers contenant P, donc si on
localise en P alors soit
- P n'est pas un assassin, donc P n'est pas diviseur de 0 dans M_P, donc H^0_P(M)_P=0 et la multiplicité est 0
- soit l'unique assassin de H^0_P(M)_P est P, donc il est bien de longueur
finie, et par définition c'est le plus grand sous-module de longueur finie
de M_P.

Idéaux et diviseurs de zéro
---------------------------
Toujours mêmes hypothèses.

Si I idéal, Ker(I) c'est l'ensemble des éléments m de M tels que i.m=0 pour
tout i \in I. Ker(I) est non vide ssi I ne contient pas de non diviseur de
0 (cf plus haut), d'où l'équivalence Ker(I) est non vide ssi I est inclus
dans un assassin. Ex: Ker(ann M)=M.

Si I et J sont premiers entre eux, Ker(I) \inter Ker(J) est vide (car si x
est dans l'intersection, il est annihilé par I et J donc la somme).
On fait on a l'équivalence: Ker(I) \inter Ker(J) = \vide ssi I+J n'est pas
inclus dans un assassin (car Ker(I)\inter Ker(J) c'est Ker(I+J))

Résumé pour un module sur un anneau
-----------------------------------

- Ass M est fini, contient tous les idéaux premiers minimaux sur ann(M)
- L'union des premiers dans ass M = {0} union {les zéros diviseurs sur M}
- Ass commute à la localisation, donc si U est un ouvert de Spec A, Ass M|U = les assassins dans U = les premiers P dans U tel que P soit un assassin de la fibre M|P.

De plus, le noyau de M -> M|U est donné par M' dont les assassins sont
exactements ceux de M dans \Spec A \ U; et donc ceux de M/M' sont dans U
(comme ceux de sa localisation injective M/M'|U = M|U).

Si I est l'idéal premier correspondant à U, M' est donné par H^0_I(M)=(0:
I^\infinity). Si 0= \inter M_i est une décomposition primaire minimale, M'
= \inter M_i pour les P_i dans U.

Pr: En effet, dans M' 0=\inter (M_i \inter M') avec les P_i dans I, alors
que dans (M/M')|U, 0=\inter M_i avec les P_i dans U.

Annulateur et support d'un module quasi-cohérent
------------------------------------------------

Soit M un module quasi cohérent sur un schéma X, s une section globale de M.
Le support de s est l'ensemble des x tels que s_x \ne 0. On a s_x=0 ssi s
est nul sur un ouvert autour de x, donc le support de s est fermé.

Var(s), c'est l'ensemble des points où s(x)=0; X_s est son complémentaire,
c'est donc un ouvert.
Remarque: si s(x) \ne 0, alors s_x \ne 0. Donc le support de s contient
X_s.

Le support de M c'est l'ensemble des x / le germe M_x est non nul, si M est
cohérent c'est un fermé (et par Nakayama c'est aussi les x / M(x) est non
nul); sur un ouvert affine c'est Var(ann M). En général, la clotûre du
support de M est encore Var(ann M).

Lemme: Si x se spécialise en y, alors s(y) \ne 0 => s(x) \ne 0 et s|x \ne 0
=> s|y \ne 0. Contraposée: s(x)=0 => s(y)=0 et s|y=0 => s|x=0.

Ex: Si x n'appartient pas au support de s, alors s|x=0 donc s(x)=0 donc s(y)=0 pour tout x->y.

Th: Soit X=Spec A, s \in A, alors
-X_s = Spec A[1/s] est l'ouvert complémentaire de Var(s)
-Support(s)=Var(0:s) contient X_s
-Si I=(0:s^\infty), alors I est le noyau de A->A_s, et est caractérisé
ensemblistement par l'ensemble des points x tels que s|x ne soit pas
nilpotente. En particulier, la clôture de X_s est donnée par Var(I), on en
déduit que Rac(I)=intersection des idéaux premiers ne contenant pas s=I +
préimage de Nilpotent(A_s).

En résumé: Var(s)={x | s(x)=0} est le complémentaire de X_s={x| s(x) \ne 0).
X_s ouvert \subset cloture X_s = Var{intersection idéaux premiers ne
contenant pas s} = Var(0:s^\infty)={x | s|x n'est pas nilpotente}
\subset Var(0:s)={x | s|x \ne 0}=Support de s.

En passant au complémentaire: Var(s)={x | s(x)=0} est fermé, son intérieur
est donné par le {x | s|x nilpotente} (en effet sur un ouvert U \subset
Var(s), s(x)=0 donc s est localement nilpotente sur U), qui contient le
complémentaire du support: {x | s|x =0}

Cas de plusieurs sections:
- \intersection X_s_i= X_{\prod s_i} donc on se ramène au cas d'une section.
- Y=\union X_s_i est le complémentaire de Var(s_i) qui est l'intersection
  des Var(s_i). Y={x | s_i(x) \ne 0 pour un i}. La clôture de Y est donné
  par (0:I^\infty) où I=(s_i); \overline Y=\union \overline X_s_i={x | il
  existe i / s_i|x non nilpotent}.

Assassins des modules cohérents
-------------------------------

Soit X un schéma noethérien, M un module cohérent sur X.

Déf: les assassins de X sont les points génériques des composantes des
supports d'une section de M sur un ouvert.

Th:
- Il y a un nombre fini d'assassins (associated primes); pour chaque
  assassin x il existe une section m tel qu'il soit exactement l'annulateur
  de cet élément (dans la germe en x ou sur un petit ouvert contenant x).
- f \in O_X est un diviseur de M ssi f(x)=0 pour un assassin x de M
- les assassins se localisent aux ouverts et même aux germes
- les points génériques de l'annulateur de M sont des assassins de M.
(Réciproquement, si s est une section de O_X dont le support ne contient
aucun de ces points génériques, alors s(x)=0 pour tout x, donc s
nilpotente. En particulier, si X est réduit, les seuls assassins de O_X
sont les points génériques.)
- L'application \Gamma(U,M)->\prod_{assassins dans U} M_p est une injection
  (En particulier, si une section m est nulle sur un ouvert U contenant tous les
  assassins, alors m est nulle)

Prop: - si m est une section de M, Supp m est la cloture des assassins x de M tels que m|x \ne 0.
- Les point x tels que O_X,x est non réduit est la cloture des assassins x
  de O_X tels que O_X,x non réduit.

Déf: une fonction est rationelle sur X <=> c'est une section de O_X sur un
ouvert contenant tous les assassins. K(X)=lim inductive \Gamma(U) pour U
contenant tous les assassins = anneau des fractions totales.
- K(X) est inclus dans le produit \prod_{x assassin} O_X,x
  Si X est réduit, K(X)=\prod_{x assassin} O_X,x et les O_X,x sont des
  corps.

Attention, si KK(X)=lim inductive \Gamma(U) pour U ouvert dense,
où l'on identifie deux sections de U et V qui coincident sur un ouvert
dense dans U \inter V (Eisenbud-Harris Ex I.21), alors il me semble que
KK(X)=\prod_{x générique} O_X,x, mais O_X ne s'injecte pas forcément dans
KK(X).
Concrêtement, ça se traduit par le fait que si U est un ouvert dense (ie il
contient tous les points génériques) mais qu'il existe un point immergé non
dans U, alors la cloture de U n'est pas égale à X. Ex: si X affine, la
cloture d'un ouvert U quelconque est donnée par l'idéal des fonctions
régulières dont l'intersection avec U est nulle, ie par l'intersection des
composantes primaires dont U contient le point associé, ie par l'idéal
(0:I^\infity) où I est l'idéal définissant le fermé complémentaire de U.

Assassins et morphismes
-----------------------

Prop: Si f: Y->X, alors f(Ass Y)=Assassins du O_X modules f_*(O_Y).

Rem: Si M est un faisceau cohérent sur X, un diviseur de 0 de M est déjà un
diviseur de 0 dans X équivaut à Ass M \subset Ass X (par prime avoidance).
En particulier, si f: Y->X est plat, f(Ass Y) \subset Ass X.

Ex: si f:Y->X avec X intègre, alors les Ass(Y) sont au dessus du point
générique de X équivaut à pour tout y\in Y, les éléments non nuls de
O_X|f(y) ne sont pas des diviseurs de zéro de O_Y|y.

Stack project
-------------

* https://stacks.math.columbia.edu/tag/00L9
$ 10.62 Associated primes

* https://stacks.math.columbia.edu/tag/05G9
$ 10.63 Symbolic powers

* https://stacks.math.columbia.edu/tag/05GA
$ 10.64 Relative assassin

* https://stacks.math.columbia.edu/tag/0546
$ 10.65 Weakly associated primes

* https://stacks.math.columbia.edu/tag/02M4
$ 10.66 Embedded primes

* https://stacks.math.columbia.edu/tag/02OI
$ 31.2 Associated points

* https://stacks.math.columbia.edu/tag/05DA
$ 31.3 Morphisms and associated points

* https://stacks.math.columbia.edu/tag/05AJ
$ 31.4 Embedded points

* https://stacks.math.columbia.edu/tag/056K
$ 31.5 Weakly associated points

* https://stacks.math.columbia.edu/tag/05EW
$ 31.6 Morphisms and weakly associated points

* https://stacks.math.columbia.edu/tag/05AS
$ 31.7 Relative assassin

* https://stacks.math.columbia.edu/tag/05AU
$ 31.8 Relative weak assassin

Diviseurs
=========

Riemann Roch
------------

l(D)=dim {f/ (f)+D >=0}; ll(D)=l(D)-1 = dim projective
ll(D)=deg(D)-g + i(D) où i(D)=l(K-D) est l'indice de spécialité

- deg(K)=2g-2, l(K)=g, ll(K)=g-1
- Si deg(D)>=2g-1, ll(D)=deg(D)-g
- si Deg(D)=0, l(D)=0, sauf si D~0 où l(0)=1 [L(0)={constantes}]

Exemples:
- Si C: F(x,y)=0 est une courbe lisse plane de genre g, les g différentielles
régulières sont données par $x^i dx / (∂F/∂y)$
- Par ex si C est hyperelliptique, les différentielles régulières sont
  dx/y, xdx/y, ... x^g dx/y
  De plus, si \alpha_i sont les (2g+1) ou (2g+2) points de Weierstrass, on
  a respectivement
  K=\sum alpha_i - 3 (\infinity)
  K=\sum alpha_i - 2 (\infinity_+ + \infinity_-)

Invertibles modules (Eisenbud)
------------------------------

Th 11.6:
- I invertible iff I* \tens I \to R is an iso
- If M is invertible, it is isomorphic to a fractional ideal of R.
  An invertible fractional ideal I contains a nonzerodivisor of R
- If I,J are invertible fractional, I \tens J \iso IJ and I^{-1} \iso I*
  (where I^{-1}={s \in K(R) | sI \subset R}}
- If I \subset K(R) is a R-submodule, I is invertible iff I^{-1}I=R.

I est de pure codimension 1 si les premiers associés de I sont de
codimension 1 (ie sont tous génériques)

Th 11.8: R Noeth domain, R_P est factoriel pour tout P maximal
(i) I invertible <=> I pure codimension 1
(ii) Un idéal invertible I \subset K(R) s'écrit de manière unique comme un
produit d'idéaux premiers de codim 1.

Th 11.10: On a un morphisme des diviseurs de Cartier vers les diviseurs de Weil:
\phi(I) = \sum_{P codim 1 prime} length(R_P/I_P).P \in Div(R)

(Rem: si R est de dim 1, length R/I = \sum_{P codim 1 prime containing I}
length(R_P/I_P) donc l'application I->length R/I respecte la structure de
groupe des diviseurs de Cartier)

Prop 11.11:
- Si R est noeth et *normal* alors les applications
Cartier(R)->Div(R) et Pic(R)->Chow(R) sont injectives.
- Si R est localement factoriel, alors Cartier(R)->Div(R) et
  Pic(R)->Chow(R) sont bijectives.
En général on a pas surjection (s'il existe des premiers de codim 1 non
inversibles), ni injection

Pour l'injection dans le cas normal, on utilise:
si R anneau réduit noeth, x \in K(R) appartient à R si x \in R_P pour tout
premier P associé à un non diviseur de 0 dans R.

Cf aussi:
http://mathoverflow.net/questions/12260/when-does-the-group-of-invertible-ideal-quotients-the-free-abelian-group-on-th/

* Remarque:
Tout module inversible est (isomorphe à un) idéal fractionnaire si Ass(X)
est inclus dans un ouvert affine
cf Remarks on the existence of Cartier divisors (Stefan Schroer)

Anneaux normaux, factoriels
---------------------------

R régulier local => factoriel
(R régulier local de dim 1 <=> valuation discrète <=> principal+local)

* Factorialité
R est factoriel ssi tout idéal de codim 1 est principal
                ssi tout idéal premier minimal au-dessus d'un principal est principal
                ssi Cl(R)=0 (dans le cas où on peut définir correctement le groupe de classe de Weil, par exemple R anneau de Krull)
[ http://en.wikipedia.org/wiki/Krull_ring
Let A be an integral domain and let P be the set of all prime ideals of A of codim one, that is, the set of all prime ideals properly containing no nonzero prime ideal. Then A is a Krull ring if
    A_{\mathfrak{p}} is a discrete valuation ring for all \mathfrak{p} \in P ,
    A is the intersection of these discrete valuation rings (considered as subrings of the quotient field of A ).
    Any nonzero element of A is contained in only a finite number of codim 1 prime ideals.
    Ex: A integrally closed noeth domain]

* Normalité:
- R domain est normal ssi pour chaque P premier associé à un idéal principal,
P_P est principal
- En général R est un produit d'anneaux normals si on a les critères
  R1 (régulairté en codim <=1, ie la localisation en un premier de codim 1
  est à valuation discrète et en codim 0 un corps)
  et S2 (un idéal premier associé à un non diviseur de zéro est de codim 1,
  un idéal premier associé à 0 est de codim 0)
Rappel: R0+S1=> réduit
De manière équivalente: S1="Si P est de codim >=1, depth R_P >=1"
                        S2="Si P est de codim >=2, depth R_P >=2"

* Critère Jacobien
Th 18.15: soit R=k[x_1,...,x_r][U^-1]/I le localisé d'un anneau affine sur
un corps parfait k. I=(f_1,...,f_n) a codimension c.
Soit J l'idéal engendré par les mineurs cxc de la matrice Jacobienne
(\delta f_i/\delta x_j) modulo I. Supposons que R soit Cohen-Macauley.
(i) R réduit ssi J a codim >=1 dans R
(ii) R est un produit d'anneaux intègres si (i) et de plus R_P est intègre pour
tout premier P de codim <=1
(iii) R est un produit d'anneaux intègres normaux si J a codim >=2 dans R.

Cartier divisors
----------------
[cf Schroer, Remarks on the existence of Cartier divisors]

Soit T \subset X un sous-ensemble fini contenant Ass(X).

Th 3.3: Un fibré en droite L est représentable par un diviseur de Cartier
L(D) avec D à support disjoint de T si et seulement si L|T est trivial dans
Pic(T).

Cor: Si Ass(X) est inclus dans un ouvert affine U, alors Div(X)->Pic(X) est
surjectif.
Pr: si T est dans un ouvert affine U=Spec(A), T est inclus dans Spec(S^{-1}A) 
où S est le complément de l'union des p \subset A correspondant aux points
de T. S^{-1}A est semi-local, donc son groupe de Picard s'annule, donc L
est représentable par un D à support disjoint de T.

Brill Noether
-------------

https://www.birs.ca/workshops/2014/14w5133/files/Osserman-reference.pdf
Brill-Noether theory, Joe Harris

https://web.stanford.edu/~tonyfeng/Brill_Noether1.pdf
BRILL-NOETHER THEORY, TONY FENG

Variétés et Courbes
===================

Varieties
---------

* Rappel: https://stacks.math.columbia.edu/tag/020C
$ 32.3 Varieties
Variété / k:
Definition 32.3.1. Let k be a field. A variety is a scheme X over k such
that X is integral and the structure morphism X→Spec(k) is separated and of
finite type.

Inconvénient: le pullback par k'->k (ou le produit fibré sur k) n'est pas
forcément une variété (ie connexe), eg Q(i) \tens_Q Q(i) =~ Spec Q(i)
\union Spec Q(i). Par contre si k=kbar, le produit fibré de variétés est
une variété.

* https://stacks.math.columbia.edu/tag/06LF
$ 33.20 Algebraic schemes

Lemma 33.20.3. Let k be a field. Let X be a locally algebraic k-scheme.
  - The topological space of X is catenary (Topology, Definition 5.11.4).
  - For x∈X closed, we have dimx(X)=dim(OX,x).
  - For X irreducible we have dim(X)=dim(U) for any nonempty open U⊂X and dim(X)=dimx(X) for any x∈X.
  - For X irreducible any chain of irreducible closed subsets can be extended to a maximal chain and all maximal chains of irreducible closed subsets have length equal to dim(X).
  - For x∈X we have dimx(X)=maxdim(Z)=mindim(OX,x′) where the maximum is over irreducible components Z⊂X containing x and the minimum is over specializations x⇝x′ with x′ closed in X.
  - If X is irreducible with generic point x, then dim(X)=trdeg_k(κ(x)).
  - If x⇝x′ is an immediate specialization of points of X, then we have trdeg_k(κ(x))=trdeg_k(κ(x′))+1.
  - The dimension of X is the supremum of the numbers trdeg_k(κ(x)) where x runs over the generic points of the irreducible components of X.
  - If x⇝x′ is a nontrivial specialization of points of X, then
    - dim_x(X)≤dim_x′(X),
    - dim(OX,x)<dim(OX,x′),
    - trdeg_k(κ(x))>trdeg_k(κ(x′)), and
    - any maximal chain of nontrivial specializations x=x0⇝x1⇝…⇝xn=x has length n=trdeg_k(κ(x))−trdeg_k(κ(x′)).
  - For x∈X we have dim_x(X)=trdeg_k(κ(x))+dim(OX,x).
  - If x⇝x′ is an immediate specialization of points of X and X is irreducible or equidimensional, then dim(OX,x′)=dim(OX,x)+1.

Lemma 33.20.4. Let k be a field. Let f:X→Y be a morphism of locally algebraic k-schemes.
  - For y∈Y, the fibre Xy is a locally algebraic scheme over κ(y) hence all the results of Lemma 33.20.3 apply.
  - Assume X is irreducible. Set Z=f(X)¯ and d=dim(X)−dim(Z). Then
    - dim_x(X_f(x))≥d for all x∈X,
    - the set of x∈X with dim_x(X_f(x))=d is dense open,
    - if dim(OZ,f(x))≥1, then dim_x(X_f(x))≤d+dim(OZ,f(x))−1,
    - if dim(OZ,f(x))=1, then dim_x(X_f(x))=d,
  - For x∈X with y=f(x) we have dim_x(Xy)≥dim_x(X)−dim_y(Y).

Lemma 33.20.5. Let k be a field. Let X, Y be locally algebraic k-schemes.
  - For z∈X×Y lying over (x,y) we have dim_z(X×Y)=dim_x(X)+dim_y(Y).
  - We have dim(X×Y)=dim(X)+dim(Y).

* https://math.stackexchange.com/questions/630465/morphisms-of-k-schemes-who-agree-on-overlinek-points
X,Y two finite-type k schemes such that X is geometrically reduced and Y
separated, f,g:X→Y two morphisms of k-schemes such that : X(k¯)→Y(k¯) are
equal, then f=g.

* https://math.stackexchange.com/questions/3168916/equivalent-definitions-of-elliptic-curves-over-a-scheme/3168956#3168956
if X/k is finite type, connected, and X(k)≠∅ then X is automatically geometrically connected.

Curves
------

* https://stacks.math.columbia.edu/tag/0A22
$ 32.42 Curves = variety of dim 1 sur k

* https://stacks.math.columbia.edu/tag/09N7
$  32.37: One dimensional Noetherian schemes
Proposition 32.37.12. Let X be a Noetherian separated scheme of dimension 1. Then X has an ample invertible sheaf.

* Réf: Lectures on rational points on curves, Poonen

k corps parfait
{variétés intègres sur k, appli birationelle} ~ {k-algèbres de type fini}^op

Remark 1.4.7: X/k irréd, X geom irréd <=> k(X) \cap kbar = k

Remark 1.7.6: X/k smooth => X/k reduced
              smoothness is preserved by base change

Section 2.1: {curves integral, appli birat } ~ {k-alg de deg transcendance 1}
               ~ {curves smooth projective integral, dominant morphisms}
            car toute courbe intègre a un unique modèle lisse projectif intègre.
            [attention si k(C) \cap kbar \ne k la courbe n'est pas geom intègre]

Remarque: si C courbe lisse projective géom intègre, alors C est uniquement
déterminée par C_kbar (équiv de catégorie): les points de C = les classes
sous Galois de C_kbar(kbar)=C(kbar). En effet C=C_kbar/Gal.

Ex: R[x] a un point réel X^2+1 (penser valuation) = orbite {i,-i}

C courbe lisse geom irréd.
C(k)=C(kbar)^G [mais Spec C=orbites de C(kbar)+point générique=valuations de k(C)]
Div(C)=Div(C_kbar)^G
Pic(C)=Pic(C_kbar)^G (si C(k) n'est pas vide), cf [diviseurs_rationels]
Si f \in kbar(C_kbar), Div f invariant par Galois, alors f \in k(C).
[Preuve: H^1(G,kbar[C]^*)=H^1(G,kbar*) car C projective = 0 par Hilbert
90.]

* Références
- https://www.math.ucla.edu/~hida/207b.1.12w/Lec12w.pdf
  ARITHMETIC OF CURVES, HARUZO HIDA
- Curves over non perfect fields
  https://mathoverflow.net/questions/242059/why-define-curves-over-perfect-fields
- http://math.mit.edu/~poonen/papers/curves.pdf
  Lectures on rational points on curves, BjornPoonen

Cohomologies
============

Cohomology of sheaves
---------------------

* Notes:
Il faut faire attention qu'on a deux types de cohomologies: la cohomologie
des faisceaux (ie de Z-modules) sur un espace topologique/un site; et la
cohomologie des O_X-modules sur un espace annelé / un topos annelé.
Le pullback n'est pas le même, dans stacks ils notent f^{-1} le pullback de
faisceau (il est donc exact), et f^* le pullback de modules (ie f^* F =
f^{-1} F \tens_f^-1O_Y O_X), il n'est pas forcément exact si f:X->Y n'est
pas plat.

Pour la cohomologie de modules sur les schémas, le cas intéressant est la
weak Serre category des modules quasi-cohérent, ça donne une sous-catégorie
triangulée D_Qcoh(X) de D(X).

Il y a une subtilité que dans les bons cas on a D_Qcoh(X) est
équivalente à D(Qcoh(X)), mais que le foncteur dérivé de f_* peut ne pas
être le même (mais je crois que ça n'arrive pas si X noeth).

Enfin si f:X->S, avec S affine, et qu'on travaille avec des modules
quasi-cohérents (modulo la subtilité plus haut), se donner f_* F c'est
essentiellement pareil que se donner Γ(f_* F)=Γ(F) vu comme O_S module.
Donc les résultats sur les pushforwards donnent aussi la cohomologie des
faisceaux si on voit X sur Z.

* https://stacks.math.columbia.edu/tag/01DW
$ 20 Cohomology of Sheaves
Cohomology of sheaves on topological space
=> modules over a sheaf of rings and we work with morphisms of ringed spaces

* https://stacks.math.columbia.edu/tag/01FQ
$ 21 Cohomology on Sites

Let (C,O) be a ringed site, see Modules on Sites, Definition 18.6.1. Let F be an O-module. We know that the category of O-modules has enough injectives, see Injectives, Theorem 19.8.4. Hence we can choose an injective resolution F[0]→I∙. For any object U of the site C we define
  21.2.0.5 H^i(U,F)=H^i(Γ(U,I∙))
to be the the ith cohomology group of F over U. The family of functors H^i(U,−) forms a universal δ-functor Mod(O)→Mod_O(U). Similarly
  21.2.0.6 H^i(C,F)=H^i(Γ(C,I∙))
it the ith cohomology group of F on C. The family of functors H^i(C,−) forms a universal δ-functor Mod(C)→Mod Γ(C,O).

Let f:(Sh(C),O)→(Sh(D),O′) be a morphism of ringed topoi, see Modules on Sites, Definition 18.7.1. With F[0]→I∙ as above we define
  21.2.0.7 R^if_∗F=H^i(f_∗I∙)
to be the ith higher direct image of F. These are the right derived functors of f_∗. The family of functors R^if_∗ forms a universal δ-functor from Mod(O)→Mod(O′).

Pseudo cohérence et perfect objects
-----------------------------------

!! Complexes de modules

* https://stacks.math.columbia.edu/tag/064N
$ 15.62 Pseudo-coherent modules

- An object K∙ of D(R) is m-pseudo-coherent if there exists a bounded complex E∙ of finite free R-modules and a morphism α:E∙→K∙ such that H^i(α) is an isomorphism for i>m and H^m(α) is surjective.
- An object K∙ of D(R) is pseudo-coherent if it is quasi-isomorphic to a bounded above complex of finite free R-modules.

Lemma 15.62.4. Let R be a ring. Let M be an R-module. Then
  - M is 0-pseudo-coherent if and only if M is a finite R-module,
  - M is (−1)-pseudo-coherent if and only if M is a finitely presented R-module,
  - M is (−d)-pseudo-coherent if and only if there exists a resolution
    R^⊕ad→R^⊕a_{d−1}→…→R^⊕a0→M→0 of length d, and
  - M is pseudo-coherent if and only if there exists an infinite resolution
    …→R^⊕a1→R^⊕a0→M→0 by finite free R-modules.

Lemma 15.62.5. Let R be a ring. Let K∙ be a complex of R-modules. The following are equivalent
  - K∙ is pseudo-coherent,
  - K∙ is m-pseudo-coherent for every m∈Z, and
  - K∙ is quasi-isomorphic to a bounded above complex of finite projective R-modules.
If (1), (2), and (3) hold and H^i(K∙)=0 for i>b, then we can find a quasi-isomorphism F∙→K∙ with Fi finite free R-modules and F^i=0 for i>b.

Lemma 15.62.18. Let R be a Noetherian ring. Then
  - A complex of R-modules K∙ is m-pseudo-coherent if and only if K∙∈D−(R) and Hi(K∙) is a finite R-module for i≥m.
  - A complex of R-modules K∙ is pseudo-coherent if and only if K∙∈D−(R) and Hi(K∙) is a finite R-module for all i.
  - An R-module is pseudo-coherent if and only if it is finite.

* https://stacks.math.columbia.edu/tag/0651
$ 15.63 Tor dimension

Definition 15.63.1. Let R be a ring. Denote D(R) its derived category. Let a,b∈Z.
  - An object K∙ of D(R) has tor-amplitude in [a,b] if H^i(K∙ ⊗^L_R M)=0 for all R-modules M and all i∉[a,b].
  - An object K∙ of D(R) has finite tor dimension if it has tor-amplitude in [a,b] for some a,b.
  - An R-module M has tor dimension ≤d if M[0] as an object of D(R) has tor-amplitude in [−d,0].
  - An R-module M has finite tor dimension if M[0] as an object of D(R) has finite tor dimension.

Lemma 15.63.3. Let R be a ring. Let K∙ be an object of D(R). Let a,b∈Z. The following are equivalent
  - K∙ has tor-amplitude in [a,b]. (resp.  [a,∞])
  - K∙ is quasi-isomorphic to a complex E∙ of flat R-modules with E^i=0 for i∉[a,b]. (resp K-flat complex E∙ whose terms are flat R-modules with E^i=0 for i∉[a,∞]). 

Lemma 15.63.6. Let R be a ring. Let M be an R-module. Let d≥0. The following are equivalent
  - M has tor dimension ≤d, and
  - there exists a resolution 0→F_d→…→F_1→F_0→M→0 with Fi a flat R-module.
In particular an R-module has tor dimension 0 if and only if it is a flat R-module.

* https://stacks.math.columbia.edu/tag/0656
$ 15.70 Perfect complexes

A perfect complex is a pseudo-coherent complex of finite tor dimension. We will not use this as the definition, but define perfect complexes over a ring directly as follows.

Definition 15.70.1. Let R be a ring. Denote D(R) the derived category of the abelian category of R-modules.
  - An object K of D(R) is perfect if it is quasi-isomorphic to a bounded complex of finite projective R-modules.
  - An R-module M is perfect if M[0] is a perfect object in D(R).

Lemma 15.70.2. Let K∙ be an object of D(R). The following are equivalent
  - K∙ is perfect, and
  - K∙ is pseudo-coherent and has finite tor dimension.

Lemma 15.70.3. Let M be a module over a ring R. The following are equivalent
  - M is a perfect module, and
  - there exists a resolution 0→F^d→…→F^1→F^0→M→0 with each F^i a finite projective R-module.

!! Dans les ringed spaces

* https://stacks.math.columbia.edu/tag/08C3
$ 20.42 Strictly perfect complexes
Definition 20.42.1. Let (X,OX) be a ringed space. Let E∙ be a complex of OX-modules. We say E∙ is strictly perfect if Ei is zero for all but finitely many i and Ei is a direct summand of a finite free OX-module for all i.

* https://stacks.math.columbia.edu/tag/08CA
$ 20.43 Pseudo-coherent modules

Definition 20.43.1. Let (X,OX) be a ringed space. Let E∙ be a complex of OX-modules. Let m∈Z.
  - We say E∙ is m-pseudo-coherent if there exists an open covering X=⋃Ui and for each i a morphism of complexes αi:E∙i→E∙|Ui where Ei is strictly perfect on Ui and H^j(αi) is an isomorphism for j>m and H^m(αi) is surjective.
  - We say E∙ is pseudo-coherent if it is m-pseudo-coherent for all m.
  - We say an object E of D(OX) is m-pseudo-coherent (resp. pseudo-coherent) if and only if it can be represented by a m-pseudo-coherent (resp. pseudo-coherent) complex of OX-modules.

If X is quasi-compact, then an m-pseudo-coherent object of D(OX) is in D−(OX). But this need not be the case if X is not quasi-compact.

* https://stacks.math.columbia.edu/tag/08CF
$ 20.44 Tor dimension

Lemma 20.44.3. Let (X,OX) be a ringed space. Let E be an object of D(OX). Let a,b∈Z with a≤b. The following are equivalent
  - E has tor-amplitude in [a,b].
  - E is represented by a complex E∙ of flat OX-modules with Ei=0 for i∉[a,b].

* https://stacks.math.columbia.edu/tag/08CL
$ 20.45 Perfect complexes

Definition 20.45.1. Let (X,OX) be a ringed space. Let E∙ be a complex of OX-modules. We say E∙ is perfect if there exists an open covering X=⋃Ui such that for each i there exists a morphism of complexes E∙i→E∙|Ui which is a quasi-isomorphism with E∙i a strictly perfect complex of OUi-modules. An object E of D(OX) is perfect if it can be represented by a perfect complex of OX-modules.

Lemma 20.45.5. Let (X,OX) be a ringed space. Let E be an object of D(OX). The following are equivalent
  - E is perfect, and
  - E is pseudo-coherent and locally has finite tor dimension.

!! Pour les modules quasi-cohérents de schémas

* https://stacks.math.columbia.edu/tag/08E4
$ 36.9 Pseudo-coherent and perfect complexes

Lemma 36.9.2. Let X=Spec(A) be an affine scheme. Let M∙ be a complex of A-modules and let E be the corresponding object of D(OX). Then E is an m-pseudo-coherent (resp. pseudo-coherent) as an object of D(OX) if and only if M∙ is m-pseudo-coherent (resp. pseudo-coherent) as a complex of A-modules.
And E has tor amplitude in [a,b] if and only if M∙ has tor amplitude in [a,b].
And E is a perfect object of D(OX) if and only if M∙ is perfect as an object of D(A).

Lemma 36.9.3. Let X be a Noetherian scheme. Let E be an object of DQCoh(OX). For m∈Z the following are equivalent
  - H^i(E) is coherent for i≥m and zero for i≫0, and
  - E is m-pseudo-coherent.
In particular, E is pseudo-coherent if and only if E is an object of D^−_Coh(OX).

* https://stacks.math.columbia.edu/tag/09M0
$ 36.16 Compact and perfect objects

Proposition 36.16.1. Let X be a quasi-compact and quasi-separated scheme. An object of DQCoh(OX) is compact if and only if it is perfect.

* https://stacks.math.columbia.edu/tag/0DJM
$ 36.18 Characterizing pseudo-coherent complexes, I

Characterize pseudo-coherent objects as derived homotopy limits of approximations by perfect objects.

* https://stacks.math.columbia.edu/tag/0CSE
$ 36.31 Characterizing pseudo-coherent complexes, II

Lemma 36.31.1. Let A be a ring. Let R be a (possibly noncommutative) A-algebra which is finite free as an A-module. Then any object M of D(R) which is pseudo-coherent in D(A) can be represented by a bounded above complex of finite free (right) R-modules.

Derived tensor product and hom
------------------------------

* https://stacks.math.columbia.edu/tag/06XY
$ 15.57 Derived tensor product

Definition 15.57.3. Let R be a ring. A complex K∙ is called K-flat if for every acyclic complex M∙ the total complex Tot(M∙⊗RK∙) is acyclic.

Lemma 15.57.9. Let R be a ring. Let P∙ be a bounded above complex of flat R-modules. Then P∙ is K-flat.

Lemma 15.57.12. Let R be a ring. For any complex M∙ there exists a K-flat complex K∙ and a quasi-isomorphism K∙→M∙. Moreover each K^n is a flat R-module.

On a ainsi le produit tensoriel dérivé: −⊗^L_R M∙:D(R)⟶D(R)
L∙⟼Tot(L∙ ⊗_R K∙) où K∙→M∙ est une K-flat resolution, ie c'est le foncteur
dérivé LF où F: L∙↦Tot(N∙ ⊗_R M∙)

* https://stacks.math.columbia.edu/tag/0A5W
$ 15.69 Derived hom

(K,L)⟼RHom_R(K,L) is an internal hom in the derived category of R-modules in the sense that it is characterized by the formula
   Hom_D(R)(K,RHom_R(L,M))=Hom_D(R)(K ⊗^L_R L,M) (*)
   et même plus généralement: RHom_R(K,RHom_R(L,M))=RHom_R(K ⊗^L_R L,M)
   dont (*) peut-être retrouvé en prenant H^0.
A construction can be given as follows. Choose a K-injective complex I∙ of R-modules representing M, choose a complex L∙ representing L, and set
  RHom_R(L,M)=Hom∙(L∙,I∙)
We have: H^n(RHom_R(L,M))=Hom_D(R)(L,M[n]) for all n∈Z.

Catégories dérivées
-------------------

* https://stacks.math.columbia.edu/tag/06YZ
$ 36.3 Derived category of quasi-coherent modules

On a un foncteur canonique: D(QCoh(OX))⟶D_QCoh(OX)
Si X=Spec A c'est une équivalence de catégorie, et D_QCoh(OX) =~ D(A) via RΓ.

* https://stacks.math.columbia.edu/tag/0AVV
$ 36.5 Affine morphisms

Lemma 36.5.1. Let f:X→S be an affine morphism of schemes. Then Rf_∗:DQCoh(OX)→DQCoh(OS) reflects isomorphisms.

Lemma 36.5.2. Let f:X→S be an affine morphism of schemes. For E in DQCoh(OS) we have Rf_∗ Lf^∗ E=E ⊗^L_OS f_∗OX.

Lemma 36.5.3. Let f:X→Y be an affine morphism of schemes. Then f_∗ induces an equivalence Φ:DQCoh(OX)⟶DQCoh(f_∗OX)
whose composition with DQCoh(f_∗ OX)→DQCoh(OY) is Rf_∗:D_QCoh(OX)→D_QCoh(OY).

* https://stacks.math.columbia.edu/tag/08D6
$ 36.6 The coherator

Let X be a scheme. The coherator is a functor
  Q_X:Mod(O_X)⟶QCoh(O_X)
which is right adjoint to the inclusion functor QCoh(OX)→Mod(OX). It exists for any scheme X and moreover the adjunction mapping QX(F)→F is an isomorphism for every quasi-coherent module F, see Properties, Proposition 28.23.4. Since QX is left exact (as a right adjoint) we can consider its right derived extension
RQ_X:D(OX)⟶D(QCoh(OX)), it is right adjoint to the canonical functor D(QCoh(OX))→D(OX)

Proposition 36.6.6. Let X be a quasi-compact scheme with affine diagonal. Then the functor (36.3.0.1)
  D(QCoh(OX))⟶DQCoh(OX)
is an equivalence with quasi-inverse given by RQ_X.
Et de plus Rf_*: D(QCoh(OX))->D(QCoh(OY)) commute avec Rf_*: D_Qcoh(X)->D_Qcoh(Y) si X, Y qc avec diag affine.

Warning: One pitfall is to carelessly assume that this equality means derived functors are the same. [Mais je crois que quand on est noeth tout se passe bien, le contre exemple donné n'étant pas noeth justement]

* https://stacks.math.columbia.edu/tag/09T1
$ 36.7 The coherator for Noetherian schemes

Lemma 36.7.1. Let X be a Noetherian scheme. Let J be an injective object of QCoh(OX). Then J is a flasque sheaf of OX-modules.

Proposition 36.7.3. Let X be a Noetherian scheme. Then the functor (36.3.0.1)
  D(QCoh(OX))⟶DQCoh(OX)
is an equivalence with quasi-inverse given by RQX.

* https://stacks.math.columbia.edu/tag/09M2
$ 36.17 Derived categories as module categories

Theorem 36.17.3. Let X be a quasi-compact and quasi-separated scheme. Then there exist a differential graded algebra (E,d) with only a finite number of nonzero cohomology groups H^i(E) such that DQCoh(OX) is equivalent to D(E,d).

Base change
-----------

* Références:
- https://en.wikipedia.org/wiki/Base_change_theorems

- http://www.math.polytechnique.fr/perso/massot.patrick/files/gdtSS/kernels.pdf
  Adjunction, pull-back and push-forward;  Proper base change;
  Tensor products and the projection formula;  Kernels

- https://math.berkeley.edu/~mhaiman/math256-fall13-spring14/EGAI-9.pdf
  Synopsis of material from EGA Chapter I,$9: Supplement on quasi-coherent sheaves

- https://math.stackexchange.com/questions/1718610/commutation-of-pushforward-and-pullback-along-cartesian-squares
  Theorem [Lipman, 3.10.3]. The three independence conditions above are equivalent.

- https://mathoverflow.net/questions/110866/interpreting-ff
  Assume that f_∗OX=OY [note: par Stein factorisation, il me semble que
  c'est le cas si on est propre à fibres géom connexes]. Then there is a
  semiorthogonal decomposition of the derived category D(X)=⟨Ker
  f^∗,f^∗(D(Y))⟩ and f^∗f_∗ is the projection onto the second component.

* https://stacks.math.columbia.edu/tag/0B6N
$ 48.8 Right adjoint of pushforward and pullback

### Base change morphisms et projection formula

Notations: on a un diagramme commutatif of ringed spaces
X' -g'> X
|f'     |f
S' -g>  S

* https://stacks.math.columbia.edu/tag/02N7
$ The base change map

Lemma 20.17.1. Let F∙ be a bounded below complex of OX-modules. Assume both g and g′ are flat. Then there exists a canonical base change map g^∗Rf_∗ F∙ ⟶ R(f′)_∗(g′)^∗F∙ in D^+(S′).

En général, on a une base change, cf https://stacks.math.columbia.edu/tag/079V
$ 20.28 Cohomology of unbounded complexes
Lg^∗ Rf_∗ F∙ ⟶ R(f′)_∗ L(g′)^∗ F∙ [dans le cas flat,  g^∗ = Lg^∗.]

Dans la suite, on se restreint à des pullbacks, et on regarde à quelle
condition cette map est un iso.

* https://stacks.math.columbia.edu/tag/01E6
$  20.49: Projection formula

Lemma 20.49.3. f:X→Y morphism of ringed spaces, E∈D(OX), K∈D(OY), K is perfect. => Rf_∗E ⊗^L_OY K=Rf_∗(E ⊗^L_OX Lf^∗K) in D(OY).
En particulier si K=OY-module loc. free, E=F un OX-module,
  Rf_∗F ⊗_OY K=Rf_∗(F ⊗_OX f^∗K) in D^+(OY). [20.49.2]

Remark 20.49.5. The projection formula is compatible with the base change map.

Voir plus bas, on a même pour les schémas:
Lemma 36.21.1. f:X→Y qcqs morphism of schemes, E in DQCoh(OX), K in DQCoh(OY).
The projection formula Rf_∗(E) ⊗^L_OY K ⟶ Rf_∗(E ⊗^L_OX Lf^∗K) is an isomorphism. (https://stacks.math.columbia.edu/tag/08ET)


### Complexe représentant le pushforward dérivé

* https://stacks.math.columbia.edu/tag/071M
$ 30.7 Cohomology and base change, II

Let f:X→S be a morphism of schemes and let F be a quasi-coherent OX-module. If f is quasi-compact and quasi-separated we would like to represent Rf_∗F by a complex of quasi-coherent sheaves on S. This follows from the fact that the sheaves Rif∗F are quasi-coherent if S is quasi-compact and has affine diagonal, using that DQCoh(S) is equivalent to D(QCoh(OS)), see Derived Categories of Schemes, Proposition 36.6.6.

In this section we will use a different approach which produces an explicit complex having a good base change property. The construction is particularly easy if f and S are separated, or more generally have affine diagonal. Since this is the case which by far the most often used we treat it separately.

=> Lemma 30.7.1 et 30.7.2:
X qc affine diagonal sur S, F quasi-cohérent.
- Cˇ∙(U,f,F)⟶Rf_∗F est un iso où Cˇ∙ est le Cech complex
- commute au pullback: g^∗Cˇ∙(U,f,F)⟶Rf′∗F′ est un iso
- si S'->S est affine, g^∗Cˇ∙(U,f,F)=Cˇ∙(U′,f′,F′)

Lemma 30.7.3. f:X→S a morphism of schemes, F quasi-coherent on X, f qcqs et S qc separated. There exists a bounded below complex K∙ of quasi-coherent OS-modules with the following property: For every morphism g:S′→S the complex g^∗K∙ is a representative for Rf′_∗F′ with notation as in diagram (30.5.0.1).
Preuve: utilise des hypercoverings

### Affine base change

* https://stacks.math.columbia.edu/tag/02KE
$ 30.5 Cohomology and base change, I

Lemma 30.5.1. Let f:X→S morphism of schemes, F quasi-coherent OX-module, f affine => f_∗F≅Rf_∗F is a quasi-coherent sheaf, and for every base change diagram
  g^∗ f_∗ F=f′^∗ (g′)_∗F.

### Proper base change

! Proper base change theorem
* https://stacks.math.columbia.edu/tag/09V4
$  Proper base change in topology
In this section we prove a very general version of the proper base change theorem in topology. It tells us that the stalks of the higher direct images Rpf∗ can be computed on the fibre.

Theorem 20.18.2 (Proper base change).
f:X->Y proper and separated map of topological spaces, E in D^+(X). Then the base change map is an iso in D^+(Y′):
  g^−1 Rf_∗ E ⟶ Rf′_∗ (g′)^−1 E
  and g^−1 f_∗ F=f′_∗ (g′)^−1 F for any sheaf of sets F on X.

* https://stacks.math.columbia.edu/tag/095S
$ Chapter 57: Étale Cohomology
$ 57.87 The proper base change theorem

Lemma 57.87.12. f:X→S proper morphism of schemes, g:S′→S be a morphism of schemes, E∈D^+(X_étale) have torsion cohomology sheaves. Then the base change map
  g^−1 Rf_∗ E → Rf′_∗ (g′)^−1 E is an isomorphism.

### Flat base change

* https://stacks.math.columbia.edu/tag/02KE
$ 30 Cohomology of Scheme
$ 30.5 Cohomology and base change, I

Lemma 30.5.2 (Flat base change). Consider a cartesian diagram of schemes
X′ -g'> X
|f'     |f
S′  -g> S

F a quasi-coherent OX-module, g flat, f qcqs.
  - the base change map is an isomorphism g^∗ Rf_∗ F ⟶ R f′_∗ (g′)^∗ F,
  - if S=Spec(A) and S′=Spec(B), then H^i(X,F)⊗_A B=H^i(X′,F′) [F′=(g′)^∗ F]

### Flat sheaves on proper morphisms

* https://stacks.math.columbia.edu/tag/07VJ
$ 30.22 Cohomology and base change, III

Lemma 30.22.1. Let S=Spec(A), A Noetherian ring, f:X→S proper morphism of schemes, F a coherent OX-module flat over S. Then
  - RΓ(X,F) is a perfect object of D(A), and
  - for any ring map A→A′ the base change map RΓ(X,F)⊗^L_A A′⟶RΓ(X_A′,F_A′) is an isomorphism.

Remark 30.22.2. A consequence of Lemma 30.22.1 is that there exists a finite complex of finite projective A-modules M∙ such that we have H^i(X_A′,F_A′)=H^i(M∙⊗_A A′) functorially in A′. The condition that F is flat over A is essential, see [Hartshorne].
Rem: si A′ plat on a H^i(X_A′,F_A′)=H^i(X, F) ⊗_A A′ car H^i(M∙⊗_A A′) = H^i(M∙) ⊗_A A′

Note: 30.22.1 est un cas particulier de 36.21 et de 36.27.1, cf Remark 36.27.2.
(cf [#Base change in the derived category]):
Lemma 36.27.1. f:X→S of finite presentation, E∈D(OX) perfect object, G∙ bounded complex of finitely presented OX-modules, flat over S, with support proper over S. Then
  K=Rf_∗(E⊗^L_OX G∙)       resp. K=Rf_∗ RHom(E,G∙) [36.27.7]
is a perfect object of D(OS) and its formation commutes with arbitrary base change.

Avec 36.27.1 on en déduit l'application suivante:

* https://stacks.math.columbia.edu/tag/0BDM
$ 36.29: Applications

Lemma 36.29.4. Let f:X→S be a morphism of finite presentation. Let F be an OX-module of finite presentation, flat over S with support proper over S. If R^i f_∗F=0 for i>0, then f_∗F is locally free and its formation commutes with arbitrary base change, ie g^∗ f_∗F=f′^∗ (g′)_∗F.

Preuve: Par 36.27.1, E=Rf_∗F of D(OS) is perfect and its formation commutes with arbitrary base change. Since there is never any cohomology in degrees <0,
we see that E (locally) has tor-amplitude in [0,b] for some b. If H^i(E)=R^if_∗F=0 for i>0, then E has tor amplitude in [0,0]. Whence E=H^0(E)[0]. We conclude H^0(E)=f_∗F is finite locally free, car E parfait donc qis à un complexe de module projectif concentré en sa tor-amplitude [0,0].

!! Cohomologie des fibres et fibres de la cohomologie
Cf Mumford70 pour une preuve élémentaire que E=Rf_*F est parfait dans ce cadre.

* https://arxiv.org/pdf/1312.7320.pdf
A PROOF OF GROTHENDIECK’S BASE CHANGE THEOREME. TENGAN
We give an elementary short proof of Grothendieck’s base change theorem for the cohomology of flat coherent sheaves.

Theorem 1.1 (Grothendieck). Let f:X→Y be a proper map of noetherian schemes, and F be a coherent sheaf on X which is flat over Y. For y∈Y let X_y=X×_Y Spec κ(y) be the fiber of y, and F_y be the pullback of F to X_y.
(a) The base change map φ^p(y):R^pf_∗F ⊗_OY κ(y) → H^p(X_y,F_y) is surjective if and only if it is an isomorphism.
(b) Suppose that φ^p(y) is surjective. Then the following conditions are equivalent:
 (i) φ^{p−1}(y) is also surjective;
 (ii) R^p f_∗ F is a free sheaf in a neighborhood of y.
 Furthermore, if these conditions hold for all y∈Y, then the formation of R^p f_∗ F commutes with arbitrary base change

[Preuve: Par les résultats plus haut, f_* F est représenté par un complexe parfait E. La base change map est donné par le produit tensoriel
dérivé ⊗^L_OY mais comme E est parfait c'est le produit tensoriel terme à
terme. On veut donc comparer H^p(E \tens k) avec H^p(E) \tens k. On peut
supposer X local = Spec(R,m), k=R/m et on se ramène à un problème d'algèbre
linéaire.]

Utilise le résultat de Mumford: [Reformulation du Lemma 30.22.1.]
Theorem 2.1 (The Grothendieck complex).
Let f:X→Spec A be a proper map of noetherian schemes, and F be a coherent sheaf on X which is A-flat. There exists a finite complex (F•, d•) of finitely generated A-flat modules such that for any A-algebra B we have an isomorphism, functorial in B, H^p(X ⊗_A B, F ⊗_A B) =H^p(F• ⊗_A B)

Et on en déduit la version suivante du Lemma 36.29.4.
Corollary 3.1. Let f:X→Y be a proper map of noetherian schemes, and F be a coherent sheaf on X which is flat over Y. If H^1(X_y,F_y) = 0 for all y∈Y, then
(a) R^1f_∗F= 0
(b) f_∗ F is a locally free OY-module, whose formation commutes with arbitrary base change

* Cf Mumford70 pour les corollaires suivants.
Cor 1 est y->dim H^p(X_y, F_y) semi-continu supérieurement, et χ(F_y) loc. constant, cf [Dimension]

COROLLARY 2 p. 51: f:X→Y proper map of noetherian schemes, F coherent sheaf on X which is Y-flat, and Y reduced. (<=>)
  (i) y -> dim_k(y) H^p(X_y, F_y) is a constant function,
  (ii) R^p f_*(F) is a locally free sheaf E on Y, and for all y \in Y, the
       natural map E ⊗_OY k(y) -> H^p(X_y, F_y) is an isomorphism.
If these conditions are fulfilled, we have further that 
R^{p-1} f_* F ⊗_OY k(y) -> H^{p-1}(X_y, F_y) is an isomorphism for all y.

Preuve: on utilise que si F est de rang loc constant sur Y réduit, il est
loc. libre, puis on fait de l'algèbre linéaire. Le dernier énoncé vient facilement du Th 1.1

COROLLARY 3 Let f: X->Y and F be as above (unlike Corollary 2, Y
need not be reduced). Assume for some p that H^p(X_y, F_y)=(0), for all y.
Then the natural map 
R^{p-1} f_* F ⊗_OY k(y) -> H^{p-1}(X_y, F_y) is an isomorphism for all y.
Preuve: trivial par le théorème 1.1

COROLLARY 4 Let f and F be as above. If R^k f_*(F) = (0) for k>=k0, 
then H^k(X_y,F_y) = (0) for all y and k>=k0.

=> voir le résumé plus bas

### Smooth base change theorem

* https://stacks.math.columbia.edu/tag/0EYQ
$ 57.85 Smooth base change

Lemma 57.85.3. S a scheme, S′=lim Si a directed inverse limit of schemes Si smooth over S with affine transition morphisms and f:X→S be qcqs.
Then g^−1 Rf_∗ E=R(f′)_∗ (g′)^−1 E
for any E∈D^+(X_étale) whose cohomology sheaves H^q(E) have stalks which are torsion of orders invertible on S.

* http://math.stanford.edu/~conrad/Weil2seminar/Notes/L7-8.pdf
THE SMOOTH BASE CHANGE THEOREM
Autre preuve du lemme 57.85.3

### Base change in the derived category
** Chapter 36: Derived Categories of Schemes

! Base change quand on a la Tor indépendence
* https://stacks.math.columbia.edu/tag/08ET
$ 36.21 Cohomology and base change, IV

Lemma 36.21.1. f:X→Y qcqs morphism of schemes, E in DQCoh(OX), K in DQCoh(OY).
The projection formula Rf_∗(E) ⊗^L_OY K ⟶ Rf_∗(E ⊗^L_OX Lf^∗K) is an isomorphism.

Lemma 36.21.3 If X and S′ are Tor independent over S, then for all E∈D_QCoh(OX)   Rf′_∗L(g′)^∗E=Lg^∗Rf_∗E.
[Tor independant: OX,x and OS',s' are Tor independent over OS,s when
x,s'->s, ie Tor_OS,s^p(OX,x, OS',s')=0 for all p>0]

Dans le cadre de la Tor-independence (et les bonnes hypothèses qcqs), on a les résultats suivants:

Lemma 36.21.4: Conditions pour avoir un iso
RHom_X(M,K) ⊗^L_R R′⟶ RHom_X′(L(g′)^∗M,L(g′)^∗K), eg M∈D(OX) is perfect and K∈DQCoh(X)
Lemma 36.21.6: If E∈D(OX) has tor amplitude in [a,b] as a complex of f^−1OS-modules, then L(g′)∗E has tor amplitude in [a,b] as a complex of f^−1OS′-modules; en particulier if G is an OX-module flat over S [=G[0] has tor amplitude [0,0]], then L(g′)∗G=(g′)∗G. 
Lemma 36.21.7: si g:S'->S est une immersion, Rg′_∗∘Lf'^∗=Lf^∗∘Rg_*

* https://math.stackexchange.com/questions/1718610/commutation-of-pushforward-and-pullback-along-cartesian-squares
Theorem [Lipman, 3.10.3] Si on a un diagramme commutatif de schémas qs, alors (<=>)
- g^∗f_∗ ⟶∼ f'_∗ g'^∗ of functors Dqc(X)→Dqc(S') is an isomorphism;
- f^∗g_∗⟶∼g'_∗f'^∗ of functors Dqc(S')→Dqc(X) is an isomorphism;
- tor-independent, ie σ is cartesian and for all pairs of points s'∈S', x∈X such that s:=g(s')=f(x), Tor^OS,s_i(OS',s',OX,x)=0,for all i>0.

! Représentants stable par pullback
* https://stacks.math.columbia.edu/tag/0DJ6
$ 36.23 Cohomology and base change, V

In Section 36.21 we saw a base change theorem holds when the morphisms are tor independent. Even in the affine case there cannot be a base change theorem without such a condition, see More on Algebra, Section 15.59. In this section we analyze when one can get a base change result “one complex at a time”.

Lemma 36.23.4. f:X→S qcqs morphism of schemes, E∈DQCoh(OX), G∙ a bounded above complex of quasi-coherent OX-modules flat over S. Then formation of
  Rf_∗(E ⊗^L_OX G∙)
commutes with arbitrary base change, ie
  Lg^∗ Rf_∗ (E ⊗^L_OX G∙) ⟶=~ Rf′_∗( L(g′)^∗E ⊗^L_OX′ (g′)^∗G∙ )

Lemma 36.23.5. f:X→S qcqs morphism of schemes, E∈D(OX), G∙ a bounded above complex of quasi-coherent OX-modules flat over S, and E perfect [or E pseudo coherent, ie qis to a bounded above complex of finite free R-modules, and G bounded]. Then formation of
  Rf_∗ RHom(E,G∙)
commutes with arbitrary base change, ie
Lg^∗ R_f∗ RHom(E,G∙) ⟶ R(f′)_∗ RHom(L(g′)^∗E, (g′)^∗G∙)

* https://stacks.math.columbia.edu/tag/0A1G
$ 36.27 Cohomology and base change, VI

Lemma 36.27.1. f:X→S of finite presentation, E∈D(OX) a perfect object, G∙ a bounded complex of finitely presented OX-modules, flat over S, with support proper over S. Then
  K=Rf_∗(E⊗^L_OX G∙)       resp. K=Rf_∗ RHom(E,G∙) [36.27.7]
is a perfect object of D(OS) and its formation commutes with arbitrary base change.
[Lemma 36.27.3: for E⊗^L_OX G∙, same with E pseudo-coherent, G∙ bounded above, and K is pseudo-coherent]

Proof: the statement on base change is Lemma 36.23.4.

Remark 36.27.2. Let R be a ring. Let X be a scheme of finite presentation over R. Let G be a finitely presented OX-module flat over R with support proper over R. By Lemma 36.27.1 there exists a finite complex of finite projective R-modules M∙ such that we have RΓ(X_R′,G_R′)=M∙ ⊗_R R′ functorially in the R-algebra R′.

Lemma 36.27.4 [Corollaire]. f:X->S proper finite presentation.
  - Let E∈D(OX) be perfect (resp. pseudo-coherent) and f flat. Then Rf_∗E is a perfect (resp. pseudo-coherent) object of D(OS) and its formation commutes with arbitrary base change.
  - Let G be an OX-module of finite presentation, flat over S. Then Rf_∗G is a perfect object of D(OS) and its formation commutes with arbitrary base change.
[Preuve: 1) G∙=O_X[0], 2) E=O_X, G∙=G[0],

### Résumé
X' -g'> X
|f'     |f
S' -g>  S

* Représentants:
- F quasi-coherent on X, f qcqs et S qc separated
  => il existe K∙ bounded below of quasi-coherent OS-modules qui représente
  Rf_* F et qui commute au base change: for all g, g^∗ K∙ is a representative for Rf′_∗F′ 

- f:X→S qcqs morphism of schemes, E∈DQCoh(OX), G∙ a bounded above complex of quasi-coherent OX-modules flat over S.
  - Formation of Rf_∗(E ⊗^L_OX G∙) commutes with arbitrary base change:
    Lg^∗ Rf_∗ (E ⊗^L_OX G∙) ⟶≅ Rf′_∗( L(g′)^∗E ⊗^L_OX′ (g′)^∗G∙ )
  - Same for Rf_∗ RHom(E,G∙) si E perfect ou E pseudo-coherent et G bounded
  - Si de plus f:X→S of finite presentation, E∈D(OX) perfect, G∙ a bounded complex of finitely presented OX-modules, flat over S, with support proper over S, then Rf_∗(E⊗^L_OX G∙), resp. Rf_∗ RHom(E,G∙) is a perfect object of D(OS)
  [et si E juste pseudo-coherent, Rf_∗(E⊗^L_OX G∙) est pseudo-cohérent]

  En particulier, si f:X->S proper finite presentation.
  - E∈D(OX) perfect/pseudo-coherent and f flat => Rf_∗E perfect/pseudo-coherent and its formation commutes with arbitrary base change.
  - G OX-module of finite presentation, flat over S => Rf_∗G perfect and its formation commutes with arbitrary base change.

  Et si S=Spec(R) est affine, X of finite presentation over R, G a finitely presented OX-module flat over R with support proper over R. There exists a finite complex of finite projective R-modules M∙ such that we have RΓ(X_R′,G_R′)=M∙ ⊗_R R′ functorially in the R-algebra R′ et donc H^i(X_R′,G_R′)=H^i(M∙ ⊗_R R′).

* Base change map: Lg^∗ Rf_∗ F∙ ⟶ Rf′_∗ Lg′^∗ F∙ (pour tout diagramme commutatif)
Si on a un pullback: F quasi-coh, E \in D^+(X), alors
- f affine, F quasi-coh: f_*F≅Rf_∗F et g^∗ f_∗ F=f′^∗ g′_∗F
- g flat:  g^∗ = Lg^∗, et si f qcqs: g^∗ Rf_∗ F ⟶≅ R f′_∗ g′^∗ F
- f proper separated: g^−1 Rf_∗ E ⟶≅ Rf′_∗ (g′)^−1 E
- g affine-limite de smooth morphism, g^−1 Rf_∗ E = Rf′_∗ g′^−1 E
  si E \in D^+_ét(X) est cohomologiquement de torsion d'ordre invertible sur S.
- si S' et X sont Tor-independant, E∈D_QCoh(OX), Lg^∗ Rf_∗ E = Rf′_∗ Lg′^∗ E

* Projection formula: E in D_QCoh(O_X), K in D_QCoh(O_S).
- f qcqs: Rf_∗E ⊗^L_OS K ⟶≅ Rf_∗(E ⊗^L_OX Lf^∗K) in D(OS).

* Flat sheaf on proper map

f:X→Y be a proper map of noetherian schemes [ça s'adapte probablement au cas de prés fini], F coherent sheaf on X flat over Y.
-> K=Rf_∗F is perfect and H^p(X_y,F_y)=H^p(K⊗^L_OY κ(y))
(a) φ^p(y):R^pf_∗F ⊗_OY κ(y) → H^p(X_y,F_y) is surjective iff if it is an iso.
(b) In this case, (<=>)
 (i) φ^{p−1}(y) is also surjective ie R^{p-1} f_∗F ⊗_OY κ(y) → H^{p-1}(X_y,F_y) iso
 (ii) R^p f_∗ F is a free sheaf in a neighborhood of y.
 Furthermore, if these conditions hold for all y∈Y, then the formation of R^p f_∗ F commutes with arbitrary base change
Si Y réduit, y -> dim_k(y) H^p(X_y, F_y) constant function <=> (a)+(b)

- If R^k f_*(F) = (0) for k>=k0, H^k(X_y,F_y) = (0) for all y and k>=k0.
- If H^p(X_y, F_y)=(0) for all y, by (a+Nakayama) then R^p f_* F=0 and by (b) R^{p-1} f_* F ⊗_OY k(y) -> H^{p-1}(X_y, F_y) is an iso. 

  Note: if p=1 ie H^1(X_y, F_y)=(0), f_* F is then loc. free, and its formation commutes with arbitrary base change:
  => Lemma 36.29.4. f:X→S of finite presentation, F OX-module of finite presentation, flat over S with support proper over S. If R^i f_∗F=0 for i>0, then f_∗F is locally free and its formation commutes with arbitrary base change, ie g^∗ f_∗F=f′^∗ (g′)_∗F.

Proper morphisms
----------------

* https://stacks.math.columbia.edu/tag/02O5
$ 30.19: Higher direct images of coherent sheaves
Proposition 29.19.1. Let S be a locally Noetherian scheme. Let f:X→S be a proper morphism. Let F be a coherent O_X-module. Then R^i f_∗ F is a coherent O_S-module for all i≥0. 

* https://stacks.math.columbia.edu/tag/0CYK
$ 30.26: Being proper over a base
Lemma 30.26.10. Let S be a locally Noetherian scheme. Let f:X→S be a morphism of schemes which is locally of finite type. Let F be a coherent OX-module with support proper over S. Then R^pf_∗F is a coherent OS-module for all p≥0. 

Theorem on formal functions
---------------------------

* https://stacks.math.columbia.edu/tag/02OC

Theorem 29.20.5 (Theorem on formal functions). Let A be a Noetherian ring. Let I⊂A be an ideal. Let f:X→Spec(A) be a proper morphism. Let F be a coherent sheaf on X. Fix p≥0. The system of maps
  H^p(X,F)/I^n H^p(X,F)⟶H^p(X,F/I^nF)
define an isomorphism of limits
  H^p(X,F)^∧ =~⟶ lim_n H^p(X,F/I^nF)
where the left hand side is the completion of the A-module H^p(X,F) with respect to the ideal I, see Algebra, Section 10.95. Moreover, this is in fact a homeomorphism for the limit topologies.

Types de cohomologies
---------------------

* https://en.wikipedia.org/wiki/Monsky%E2%80%93Washnitzer_cohomology
Defined for non-singular affine varieties over fields of positive characteristic p. Lift the variety to characteristic 0, and then take a suitable subalgebra of the algebraic de Rham cohomology of Grothendieck (1966)

* https://en.wikipedia.org/wiki/K%C3%A4hler_differential#de_Rham_cohomology
 = hypercohomology of the de Rham complex

* https://en.wikipedia.org/wiki/Crystalline_cohomology

  Crystalline cohomology is a Weil cohomology theory for schemes X over a
  base field k. Its values H^n(X/W) are modules over the ring W of Witt
  vectors over k.

  Crystalline cohomology only works well for smooth proper schemes. Rigid
  cohomology extends it to more general schemes.
  
  Motivation: One idea for defining a Weil cohomology theory of a variety X
  over a field k of characteristic p is to 'lift' it to a variety X* over
  the ring of Witt vectors of k (that gives back X on reduction mod p),
  then take the de Rham cohomology of this lift. The problem is that it is
  not at all obvious that this cohomology is independent of the choice of
  lifting.
  
  The idea of crystalline cohomology in characteristic 0 is to find a
  direct definition of a cohomology theory as the cohomology of constant
  sheaves on a suitable site
      Inf(X)
  over X, called the infinitesimal site and then show it is the same as the
  de Rham cohomology of any lift.
  
  The site Inf(X) is a category whose objects can be thought of as some
  sort of generalization of the conventional open sets of X. In
  characteristic 0 its objects are infinitesimal thickenings U→T of Zariski
  open subsets U of X. This means that U is the closed subscheme of a
  scheme T defined by a nilpotent sheaf of ideals on T; for example,
  Spec(k)→ Spec(k[x]/(x^2)).
  
  Grothendieck showed that for smooth schemes X over C, the cohomology of
  the sheaf O_X on Inf(X) is the same as the usual (smooth or algebraic) de
  Rham cohomology.

* https://en.wikipedia.org/wiki/Rigid_cohomology
 It extends crystalline cohomology to schemes that need not be proper or smooth, and extends Monsky–Washnitzer cohomology to non-affine varieties.

https://mathoverflow.net/questions/11648/current-status-of-crystalline-cohomology
https://mathoverflow.net/questions/47950/comparison-of-de-rham-cohomology-and-etale-cohomology

* https://ncatlab.org/nlab/show/syntomic+cohomology
Syntomic cohomology is the abelian sheaf cohomology of the syntomic site of a scheme. It is a pp-adic analogue of Deligne-Beilinson cohomology.
It is closely related to the crystalline cohomology of that scheme. It may be regarded as a pp-adic absolute Hodge cohomology.

Dualité
-------

Voir [Categorie/Categorie#Faisceaux] pour Rf^! et f_!

### Grothendieck duality

* Références sur la dualité de Grothendieck
- https://www.springer.com/fr/book/9783540411345
  Grothendieck Duality and Base Change
  Authors: Conrad, Brian
  + Cf appendix B: lien entre la dualité sur une courbe et la dualité sur l'espace tangent de sa Jacobienne.
- https://www.springer.com/gp/book/9783540854197
  Foundations of Grothendieck Duality for Diagrams of Schemes
  Authors: Lipman, Joseph, Hashimoto, Mitsuyasu 
  + contient des notes sur les catégories dérivées
  Cours + Slides sur le livre: https://www.math.purdue.edu/~lipman/Spain/

* Dualité de Grothendieck, Conrad Th 4.3.1:
  Rf_* RHom°_X(F°,G°) -> RHom°_Y(Rf_* F°, Rf_* G°) induit
  un morphisme de dualité
  Rf_* RHom°_X(F°,f^#G°) -> RHom°_Y(Rf_* F°, G°) 
  qui est un iso quand f:X->Y proper CM morphism with pure relative
  dimension and Y loc. noetherian.

* https://en.wikipedia.org/wiki/Coherent_duality
The classical statement of Grothendieck duality for a projective or proper morphism f: X → Y of noetherian schemes of finite dimension, found in Hartshorne (Residues and duality) is the following quasi-isomorphism:
    Rf_∗ RHom_X(F⋅, f^! G⋅) → RHom_Y(Rf_∗ F⋅ , G⋅)
for F⋅ a bounded above complex of OX-modules with quasi-coherent cohomology and G⋅ a bounded below complex of OY-modules with coherent cohomology. Here the Hom's are the sheaf of homomorphisms. 
[Note: c'est une version de la dualité de Verdier
  RHom(Rf_! F, G) ≅ Rf_∗ RHom(F, f^!G) (dans la catégorie dérivée des faisceaux)
qui donne en passant aux sections globales:
  RHom(Rf_! F, G) ≅ RHom(F, f^!G)]
car comme f est propre, f_!=f_*]

### Serre Duality

* Serre duality: https://en.wikipedia.org/wiki/Serre_duality

- Serre duality for vector bundles
X/k smooth variety of dim n.
Suppose in addition that X is proper (for example, projective) over k. Then Serre duality says: for an algebraic vector bundle E on X and an integer i, there is a natural isomorphism
    H^i(X , E) ≅ H^{n−i}(X , K_X ⊗ E∗)∗
où K_X= canonical line bundle ie the bundle of n-forms on X, the top exterior power of the cotangent bundle.

The isomorphism in Serre duality comes from the cup product in sheaf cohomology. Namely, the composition of the cup product with a natural trace map on H^n(X, K_X) is a perfect pairing:
    H^i(X, E) × H^{n−i}(X, K_X ⊗ E∗) → H^n(X, K_X) → k.

- Serre duality for coherent sheaves
or a Cohen-Macaulay scheme X of pure dimension n over a field k, Grothendieck defined a coherent sheaf ω_X on X called the dualizing sheaf. Suppose in addition that X is proper over k. For a coherent sheaf E on X and an integer i, Serre duality says that there is a natural isomorphism
    Ext_X^i(E, ω_X) ≅ H^{n−i}(X, E)∗
of finite-dimensional k-vector spaces. Here the Ext group is taken in the abelian category of O_X. This includes the previous statement, since Ext_X^i (E, ω_X) is isomorphic to H^i(X, E∗ ⊗ ω_X) when E is a vector bundle. 

Si X est Cohen-Macauley de codim r dans Y smooth: ω_X=Ext^r_OY(O_X, K_Y)

Exemple: Si X équidimensionel projectif de codim r, w_X°=Ext^r_P^m(O_X, w_P^m) donne toujours Ext^i(F,w_X°)->H^{n-i}(X,F)*
et si X est loc. intersection complète (ou Cohen-Macauley), cette application est un iso, et on a explicitement dans le cas l.c.i.
  w_X°=w_P^m ⊗ Λ^r(I/I^2) où I est l'idéal de déf de X,
  donc ω_X est un line bundle, ie X Gorenstein.
[This is a special case of the proof of the adjunction formula, cf plus bas.]

Ainsi si X est intersection complète, I=(f1, ..., fr) de degrés d_i, on a I/I^2=~O_X(-d_1)+O_X(-d_2)+...
donc Λ^r(I/I^2)=O_X(d_1+...+d_r) d'où comme w_P^m=O(-m-1)
w_X°=O_X(d_1+...+d_r-m-1).
For example, the dualizing sheaf of a plane curve of degree d is given by O_X(d−3).

- Grothendieck duality
For any scheme X of finite type over a field k, there is an object ω_X∙ of the bounded derived category of coherent sheaves on X, D_coh^b(X). Formally, ω_X∙ is the exceptional inverse image f^! O_Y, where f is the given morphism X → Y = Spec(k). When X is Cohen–Macaulay of pure dimension n, ω_X∙ is ω_X[n]; that is, it is the dualizing sheaf discussed above, viewed as a complex in (cohomological) degree −n. In particular, when X is smooth over k, ω_X∙ is the canonical line bundle placed in degree −n.

Using the dualizing complex, Serre duality generalizes to any proper scheme X over k. Namely, there is a natural isomorphism of finite-dimensional k-vector spaces
    Hom_X(E, ω_X∙) ≅ Hom_X(O_X,E)∗ for any object E in D_coh^b(X).

More generally, for a proper scheme X over k, an object E in D_coh^b(X), and F a perfect complex in D_perf(X), one has the elegant statement:
    Hom_X(E, F ⊗^L ω_X∙) ≅ Hom_X(F, E)∗.

To compare with previous formulations, note that Ext_X^i(E, ω_X) can be viewed as Hom_X(E, ω_X[i]). When X is also smooth over k, every object in D_coh^b(X) is a perfect complex, and so this duality applies to all E and F in D_coh^b(X). The statement above is then summarized by saying that F ↦ F ⊗ ω_X∙ is a Serre functor on D_coh^b(X) for X smooth and proper over k.[8]

* https://en.wikipedia.org/wiki/Adjunction_formula
Let X be a smooth algebraic variety or smooth complex manifold and Y be a smooth subvariety of X, if ideal sheaf I. The conormal exact sequence 0->I/I^2->i*Ω_X->Ω_Y->0 gives
     ω_Y = i∗ω_X ⊗ det(I/I^2)^∨

- The particular case of a smooth divisor
Suppose that D is a smooth divisor on X. Its normal bundle extends to a line bundle O(D) on X, and the ideal sheaf of D corresponds to its dual O(−D) . The conormal bundle I/I^2 is i∗O(−D), which, combined with the formula above, gives
    ω_D = i∗(ω_X⊗O(D)).
In terms of canonical classes, this says that
    K_D = (K_X+D)|D.

- Applications to curves: The genus-degree formula for plane curves can be deduced from the adjunction formula

* http://math.uchicago.edu/~may/REU2013/REUPapers/Fung.pdf
SERRE DUALITY AND APPLICATIONS, JUN HOU FUNG

Theorem 2.1 (Serre duality for P^n_k). Let k be a field and P=P^n_k be projective n-space over k. Let ω_P be the sheaf O_P(−n−1) and let F be a coherent sheaf. Then for 0≤r≤n, the Yoneda pairing H^r(P,F)×Ext^{n−r}_P(F,ω_P)→H^n(P,ω_P)=k is perfect

Definition 2.25.Let X be a proper scheme of dimension r over a field k. A dualizing sheaf for X is a coherent sheaf ω◦_X on X together with a trace morphismt: H^r(X,ω◦_X)→k such that for all coherent sheaves F on X, the natural pairing Hom(F,ω◦_X)×H^r(X,F)→H^r(X,ω◦X) followed by t induces an isomorphism y0(F):Hom(F,ω◦_X)→H^r(X,F)^∗.

It exists for any proper scheme. For a projective scheme of dimension r in P^n_k: ω◦_X=Ext^{n−r}_P(O_X,ω_P).

Theorem 2.31 (Duality for a projective scheme)
There is a natural map: y_i(F): Ext^{r−i}_X(F,ω◦_X)→H^i(X,F)

Theorem 2.34. Let P be an S-scheme and X a closed subscheme with sheaf
of ideals I, with relative dimensions n and r respectively.
(a) If X is regularly immersed in P and F is a quasicoherent OX-module, thenthere exists an isomorphism φ:Ext^{n−r}_P(O_X,F)∼→ Hom_X(∧^r(I/I^2),F/IF).
(b) If X and P are smooth over S, then the canonical sheaf ω_X/S is isomorphic to Ext^{n−r}_P(O_X,ω_P/S). In
particular, if P is the k-scheme P^n_k, then the canonical sheaf ω_X is isomorphic to Ext^{n−r}_P(O_X,ω_P)=ω◦_X, the dualizing sheaf.

Theorem 2.35. Let k be a field, P=P^n_k, and ω_P=O^P(−n−1) the dualizing sheaf for P. Let X be a closed subscheme of dimension r, ω_X=Ext^{n−r}_P(O_X,ω_P) the dualizing sheaf for X, and F a coherent OX-module. Then for all s≤r,
the following are equivalent.
(i) The map Ext^{r−i}_X(F,ω_X)→H^i(X,F)^∗ is an isomorphism for all r−s≤i≤r.
(ii) H^i(X,O_X(−m)) = 0 for large m and r−s≤i<r.
(iii) Ext^{n−i}_P(O_X,ω_P) = 0 for r−s≤i<r.

Corollary 2.36. Suppose the same conditions from the theorem above hold.
Then (a) Hom_X(F,ω_X)∼→ H^r(X,F)^∗ is always an isomorphism.
 (b) The map Ext^{r−i}_X(F,ω_X)→H^i(X,F)^∗ is an isomorphism for all i iff X is Cohen-Macaulay

[Preuves:
Theorem 2.2: Si X affine noth. scheme, F qc, H^i(X,F)=0 pour tout i>0 [et c'est connu que ça caractérise les schémas affines]

Theorem 2.3: (Grothendieck vanishing) X noeth topological space, F sheaf of abelian groups, H^i(X,F)=0 for i>dim X.

Theorem 2.4: Si S=A[x0,...,xn], A noeth ring, P=Proj S=P_A^n.
Alors \Gamma_*(O_P):=\sum H^0(P, O_P(m))=~ S, H^n(P, O_P(-n-1))=A et
H^i(P, O_P(m))=0 pour 0<i<n

Theorem 2.9 (Serre): si X projectif au dessus de A, F coherent, alors pour
m assez grand F(m) est généré par un nombre fini de sections globales.
Cor 2.11 (Serre finiteness and vanishing): les modules H^i(X,F) sont de type fini sur A; et H^i(X, F(l))=0 pour tout l>=l0 et i>0.

Theorem 2.10 (Yoneda/Cartier pairing): si C, D catégories abéliennes, C a
assez d'injectifs, F:C->D additif exact à gauche. Alors on a un couplage
\delta-fonctoriel R^p F(A) x Ext_C^q(A,B) -> R^{p+q} F(B)

De la suite spectrale H^p(X,Ext^q_X(F,G)) ⇒ Ext^{p+q}_X(F,G) on en déduit
Corollary 2.22. If F is locally free of finite type, Ext^p_X(F,G)=∼=H^p(X,G⊗F^∨), where F^∨=Hom_X(F,O_X).

Proposition 2.24. Let i:X→P be a closed immersion of ringed spaces, E,F two O_X-modules, and G an O_P-module. Suppose E is locally free of finite type. Then there exist a spectral sequence Ext^p_X(F,Ext^q_P(E,G))⇒ Ext^{p+q}_P(E⊗F,G)
]

* Voir aussi https://rigtriv.wordpress.com/2008/05/29/serre-duality/
Si X=P^n, on a un pairing (i) hom(F,w)xH^n(X,F)->H^n(X,w)=k, et même
(ii) un iso Ext^i(F,w)->H^{n-i}(X,F)' où Ext^i(F,G)=H^i(X, Hom(F,G))
En général on dit que w_X est dualisant si on a (i), alors on a une
application comme dans (ii), qui est un iso si X suffisamment gentil [CM
cf plus haut], et dans ce cas si F est loc. libre alors
H^i(X,F)=~H^{n-i}(X, F^∨ ⊗ w_X)'

* https://mathoverflow.net/questions/215463/serre-duality-over-a-non-algebraically-closed-field
Ext^i(F,ω)→H^{n−i}(X,F)^∨
The proof [that this is an isomorphism] works verbatim for any projective Cohen-Macaulay scheme of pure dimension n over any field.

A proof via specializing Grothendieck duality. It is probably useful for people to see this worked out. Say f:X→Spec k is the structural map and its proper and X is just a scheme of finite type over k, say F is a coherent sheaf on X (for simplicity). Then Grothendieck duality says that
Rf_∗ RHom_{O_X}(F,f^!k)≃RHom_k(Rf_∗F,k).

- Analyzing the Left side
If X is Cohen-Macaulay, then f_!k is a canonical module on X with a shift (locally by the dimension, note that Cohen-Macaulay means it is locally equidimensional). => = Ext^i(F,ω_X)
- Analyzing the right side
  RHomk(∙,k) is just the derived functor of k-vector space duality
  => (H^{d−i}(X,F))^∨

### Serre duality on curves

* https://mathoverflow.net/questions/58559/dualizing-sheaf-of-a-nodal-curve
I'm trying to understand the dualizing sheaf ωC on a nodal curve C, in particular why is H^1(C,ω_C)=k, where k is the algebraically closed ground field. I know this sheaf is defined as the push-forward of the sheaf of rational differentials on the normalization C~ of C with at most simple poles at the points lying over the nodal points of C and such that the sum of residues at the two points lying over the node will be zero.

If C~ is the normalization, with two points x and y being identified under the map π:C~→C to the node z of C, then we have an exact sequence
0→Ω^1_C~→Ω^1_C~(x+y)→kx⊕ky→0,
where kx and ky are the skyscraper sheaves at the points x and y. Pushing forward (which is exact because the map π is finite, and so in particular affine) we get an exact sequence
0→π∗Ω^1_C~→π∗Ω^1_C~(x+y)→k⊕2z→0.
In conclusion, we have an exact sequence 0→π∗Ω^1_C~→ω_C→kz→0.
Now taking cohomology (and recalling that H^i(C,π∗F)=Hi(C~,F) for a coherent sheaf on C~), we obtain
0→H0(C~,Ω1C~)→H0(C,ωC)→H0(C,kz)→H1(C~,Ω1C~)→H1(C,ωC)→0.
(The point here being that H1 of a skyscraper sheaf such as kz vanishes.)
I claim that in this exact sequence the map H1(C~,Ω1C~)→H1(C,ωC)
is an isomorphism, and hence that the latter is one-dimensional, since the former is.
Indeed the map H0(C,ωC)→H0(C,kZ)=k is surjective: the residue theorem guarantees the existence of sections of H0(C,ωC) which have non-zero residues at x and y when pulled back to C~

* https://math.stackexchange.com/questions/42818/line-bundles-on-singular-curves

Let X˜ be the normalization of X, and let x0 and x1 be the two points of X˜ lying above the node x.

If L˜ is a line bundle on X˜ and ϕ is an element of Isom(L˜x0,L˜x1), then you can make a line bundle L on X by identifying the fibres L˜x0 and L˜x1 via ϕ.
Thus line bundles on X are the same as pairs (L˜,ϕ) where L˜ is a line bundle on X˜ and ϕ is an isomorphism between L˜x0 and L˜x1.
The Gm-action is just the action on ϕ given by scaling.

If x is a separating node, then the situation is different: the normalization is not connected, it has two pieces, say X0 and X1, each with a unique point x0 and x1 lying over x.
 Again, this identification is only determined up to scaling by an element of Gm, but if we choose two different identifications, which say differ by a scaling factor of λ, we nevertheless get the same line bundle on X, the reason being that we can apply the automorphism 1×λ to the line bundle L0∐L1 on X0∐X1 (i.e. the automorphism which is 1 on the first factor and multiplication by λ on the second factor), and this will take the first identification to the second.

* https://web.northeastern.edu/castravet/MATH518/victor.pdf
Picard Groups of Affine Curves
Victor I. Piercey

Proposition 3.20. Let X′ be a nonsingular curve embedded in projective space P^n. Let Z={p1,...,pk}⊂X′ be a finite subset of the points of X and let U=X′\Z. Then there is an exact sequence: Z^k→Cl(X′)→Cl(U)→0

- 4.1  Projective Modules over Fiber Product
Si A=A1 x_S A2, (tel que A1->>S surjectif),
alors se donner un module M sur A revient à se donner M_i
sur A_i tels qu'on ait un iso M_1 \tens_A1 S = M_2 \tens_A2 S
(en effet sur les schémas on a Spec A=Spec A1 \cup_S Spec A2).
Si de plus les Mi sont projectifs de type fini, M aussi (et on les obtient
tous comme ça; on peut reconstruire Mi comme étant M tens_A Ai si M
projectif).

Proposition 4.14. The Picard group Pic(A) embeds into K0(A)as the group of units
[K0(A)=K-theory, ie modules projectifs finis / [P]+[Q]=[P \oplus Q]]

Theorem 4.15: on a une suite exacte
0 -> A× -> A×1⊕A×2 -> S× -∂> Pic(A) -δ> Pic(A1)⊕Pic(A2)
où δM=(Ai ⊗_A M)

- 4.2  The Conductor Square
[voir aussi NumberTheory/Orders#The conductor square]

On applique ça au 'conductor square': A1 be the normalization of A,
c le conducteur de A=l'annulateur du A-module A1/A donc on a un produit
fibré
A   -> A1
A/c -> A1/c
d'où la suite exacte:
0 → A× → A×1⊕(A/c)× → (A1/c)× →Pic(A) → Pic(A1)⊕Pic(A/c)

- 4.3  The Cusp and the Node
Pour une cusp (en genre 0, ie la dégénération d'une courbe elliptique)
Proposition 4.23. Pic(A) =k+
et pour un noeud
Proposition 4.26. Pic(B)=k×.

The geometric story for the node can be described intuitively.  Think of the elements of the Picard group as line bundles.  The normalization of B corresponds to an affine, non-singular rational curve Y1≈A^1_k=Spec(k[t]). Since Pic(Y1)is trivial, the only line bundle over Y1 is the trivial line bundle Y1×k.The map from B to B1 corresponds to a map from the corresponding curve Y to Y1 that separates the node on X into two distinct points p1,p2 on Y1. Every line bundle over Y corresponds to some identification of the fibers through p1 and p2 of the trivial line bundle over Y1. There is a one-to-one correspondence between the possible identifications of the fibers and the transition maps in a local trivialization. The transition maps are in a one-to-one correspondence with maps from the trivializing open neighborhood of the node into the general linear group over k with rank one. This is precisely k×. In other words, every transition map is given by multiplication by some unit u∈k×, hence Pic(Y)∼=k×.

Complétion
==========

Complétion
----------

* Résumé:
- la complétion de modules préserve la surjectivité (en fait il suffit que
  M/IM->>N/IN) et M ⊗_R R∧→M∧ est surjectif si M fini.
- si R noeth (local), R→R∧ est (fidèlement) plat, et si M fini M∧=M ⊗_R R∧

* https://stacks.math.columbia.edu/tag/00M9
$ 10.95: Completion

Lemma 10.95.1. Let R be a ring. Let I⊂R be an ideal. Let φ:M→N be a map of R-modules.
  - If M/IM→N/IN is surjective, then M∧→N∧ is surjective.
  - If M→N is surjective, then M∧→N∧ is surjective.
  - If 0→K→M→N→0 is a short exact sequence of R-modules and N is flat, then 0→K∧→M∧→N∧→0 is a short exact sequence.
  - The map M ⊗_R R∧→M∧ is surjective for any finite R-module M.

Lemma 10.95.3: Si I finiment généré, M∧/I^nM∧ ≃ M/I^nM.
En particulier M∧ est I-adically complete.

Lemma 10.95.4. Let 0→M→N→Q→0 be an exact sequence of R-modules such that Q is annihilated by a power of I. Then completion produces an exact sequence 0→M∧→N∧→Q→0. 

Lemma 10.95.6. Let R be a ring, let I⊂R be an ideal, and let R∧=limR/In.
  - any element of R∧ which maps to a unit of R/I is a unit,
  - any element of 1+I maps to an invertible element of R∧,
  - any element of 1+IR∧ is invertible in R∧, and
  - the ideals IR∧ and Ker(R∧→R/I) are contained in the Jacobson radical of R∧.

Lemma 10.95.12. Let R be a ring. Let I⊂R be an ideal. Let M be an R-module. Assume
  - R is I-adically complete,
  - ⋂n≥1 I^nM=(0), and
  - M/IM is a finite R/I-module.
Then M is a finite R-module.

* https://stacks.math.columbia.edu/tag/0BNH
$ 10.96 Completion for Noetherian rings

Lemma 10.96.1. Let I be an ideal of a Noetherian ring R. Denote ∧ completion with respect to I.
  - If K→N is an injective map of finite R-modules, then the map on completions K∧→N∧ is injective.
  - If 0→K→N→M→0 is a short exact sequence of finite R-modules, then 0→K∧→N∧→M∧→0 is a short exact sequence.
  - If M is a finite R-module, then M∧=M⊗RR∧.

Lemma 10.96.2. Let I be a ideal of a Noetherian ring R. Denote ∧ completion with respect to I.
  - The ring map R→R∧ is flat.
  - The functor M↦M∧ is exact on the category of finitely generated R-modules.

Lemma 10.96.3. Let (R,m) be a Noetherian local ring. Let I⊂m be an ideal. Denote R∧ the completion of R with respect to I. The ring map R→R∧ is faithfully flat. In particular the completion with respect to m, namely lim_n R/m^n is faithfully flat.

Lemma 10.96.5. Let I be an ideal of a ring R. Assume
  - R/I is a Noetherian ring,
  - I is finitely generated.
Then the completion R∧ of R with respect to I is a Noetherian ring complete with respect to IR∧.
Lemma 10.96.6. Let R be a Noetherian ring. Let I be an ideal of R. The completion R∧ of R with respect to I is Noetherian.

Lemma 10.96.7. Let R→S be a local homomorphism of local rings (R,m) and (S,n). Let R∧, resp. S∧ be the completion of R, resp. S with respect to m, resp. n. If m and n are finitely generated and dim_κ(m) S/mS<∞, then
  - S∧ is equal to the m-adic completion of S, and
  - S∧ is a finite R∧-module.

Lemma 10.96.8. Let R be a Noetherian ring. Let R→S be a finite ring map. Let p⊂R be a prime and let q1,…,qm be the primes of S lying over p (Lemma 10.35.21). Then
R_p∧ ⊗_R S=(S_p)∧=S_q1∧×…×S_qm∧
where the (S_p)∧ is the completion with respect to p and the local rings R_p and S_qi are completed with respect to their maximal ideals.

Lemma 10.96.9. Let R be a ring. Let I⊂R be an ideal. Let 0→K→P→M→0 be a short exact sequence of R-modules. If M is flat over R and M/IM is a projective R/I-module, then the sequence of I-adic completions
0→K∧→P∧→M∧→0 is a split exact sequence.

Lemma 10.96.10. Let A be a Noetherian ring. Let I,J⊂A be ideals. If A is I-adically complete and A/I is J-adically complete, then A is J-adically complete.

* https://stacks.math.columbia.edu/tag/07NU
$ 15.42 Permanence of properties under completion

Henselization
-------------

* https://stacks.math.columbia.edu/tag/04GE
$ 10.149 Henselian local rings

* https://stacks.math.columbia.edu/tag/0BSG
$ 10.150 Filtered colimits of étale ring maps

* https://stacks.math.columbia.edu/tag/0BSK
$ 10.151 Henselization and strict henselization

Lemma 10.151.1. Let (R,m,κ) be a local ring. There exists a local ring map R→Rh with the following properties
  - Rh is henselian,
  - Rh is a filtered colimit of étale R-algebras,
  - mRh is the maximal ideal of Rh, and
  - κ=Rh/mRh.

Lemma 10.151.2. Let (R,m,κ) be a local ring. Let κ⊂κsep be a separable algebraic closure. There exists a commutative diagram
  R Rh Rsh
  κ κ  κ_sep
with the following properties
  - the map Rh→Rsh is local
  - Rsh is strictly henselian,
  - Rsh is a filtered colimit of étale R-algebras,
  - mRsh is the maximal ideal of Rsh, and
  - κsep=Rsh/mRsh.
The maps R→Rh→Rsh are flat local ring homomorphisms.

* https://stacks.math.columbia.edu/tag/0AGY
$ 15.43 Permanence of properties under étale maps

* https://stacks.math.columbia.edu/tag/07QL
$ 15.44 Permanence of properties under henselization

Summary: https://mathoverflow.net/questions/95300/henselization-of-a-local-ring
If A is a local ring, its henselization i:A↪Ah is always injective and even faithfully flat.
The rings A and Ah have the same dimension and share many properties : A is noetherian (resp. reduced, resp. a normal domain) ⟺ Ah is noetherian (resp. reduced, resp. a normal domain).
And if A (and thus Ah ) is noetherian we can add that depth(A)=depth(Ah) and that : A is regular (resp. Cohen-Macaulay) ⟺ Ah is regular (resp. Cohen-Macaulay).
Notice that a complete local ring is henselian and that in general a local ring and its henselization have the same completion : the morphism i^:A^→≅Ah^
is an isomorphism.

Artin-Rees and Krull's intersection theorem
-------------------------------------------

* https://stacks.math.columbia.edu/tag/00IJ
$ 10.50 More Noetherian rings

Lemma 10.50.4 (Krull's intersection theorem). Let R be a Noetherian local ring. Let I⊂R be a proper ideal. Let M be a finite R-module. Then ⋂_n≥0 I^nM=0.

Lemma 10.50.5. Let R be a Noetherian ring. Let I⊂R be an ideal. Let M be a finite R-module. Let N=⋂_n I^nM.
  - For every prime p, I⊂p there exists a f∈R, f∉p such that N_f=0.
  - If I is contained in the Jacobson radical of R, then N=0.
Lemma 10.50.5 says that for every prime ideal I⊂p there exists a g∈R, g∉p such that f \in ⋂_n≥0 I^n  maps to zero in R_g. In algebraic geometry we express this by saying that “f is zero in an open neighbourhood of the closed set V(I) of Spec(R)”. 

Lemma 10.50.7 (Artin-Tate). Let R be a Noetherian ring. Let S be a finitely generated R-algebra. If T⊂S is an R-subalgebra such that S is finitely generated as a T-module, then T is of finite type over R.

Grothendieck existence theorem
------------------------------

* https://stacks.math.columbia.edu/tag/0EHN
$ 30.23 Coherent formal modules

Lemma 30.23.1. If X=Spec(A) is the spectrum of a Noetherian ring and I is the quasi-coherent sheaf of ideals associated to the ideal I⊂A, then Coh(X,I) is equivalent to the category of finite A∧-modules where A∧ is the completion of A with respect to I.

Let X be a Noetherian scheme and let I⊂OX be a quasi-coherent sheaf of ideals. There is a functor (30.23.3.1) Coh(OX)⟶Coh(X,I),F⟼F∧
which associates to the coherent OX-module F the object F∧=(F/I^nF) of Coh(X,I).

Lemma 30.23.4. The functor (30.23.3.1) is exact.

* https://stacks.math.columbia.edu/tag/087V
$ 30.25 Grothendieck's existence theorem, II
Proposition 30.25.4. Let A be a Noetherian ring complete with respect to an ideal I. Let f:X→Spec(A) be a proper morphism of schemes. Set I=IOX. Then the functor (30.23.3.1) is an equivalence.
[Rem: la version I était pour f:X->Spec(A) projectif]

* https://stacks.math.columbia.edu/tag/0CYW
$  30.27: Grothendieck's existence theorem, III

Theorem 30.27.1 (Grothendieck's existence theorem).
Let A be a Noetherian ring complete with respect to an ideal I. Let X be a separated, finite type scheme over A. Then the functor (30.27.0.1)
Coh_{support proper over A}(OX)⟶Coh_{support proper over A}(X,I) is an equivalence. 

Remark 30.27.2 (Unwinding Grothendieck's existence theorem). Let A be a Noetherian ring complete with respect to an ideal I. Write S=Spec(A) and S_n=Spec(A/I^n). Let X→S be a separated morphism of finite type. For n≥1 we set X_n=X×S S_n. Picture:
X1 -i1-> X2 -i2-> … -> X
S1  ->   S2  ->   … -> S
In this situation we consider systems (Fn,φn) where
  - F_n is a coherent OXn-module,
  - φ_n:i^∗_n F_{n+1}→F_n is an isomorphism, and
  - Supp(F_1) is proper over S_1.
Theorem 30.27.1 says that the completion functor coherent OX-modules F with
support proper over A⟶systems (Fn) as above is an equivalence of categories. 
In the special case that X is proper over A we can omit the conditions on the supports.

* https://stacks.math.columbia.edu/tag/0898
$ 30.28 Grothendieck's algebraization theorem

Theorem 30.28.4 (Grothendieck's algebraization theorem). Let A be a Noetherian ring complete with respect to an ideal I. Set S=Spec(A) and S_n=Spec(A/I^n). Consider a commutative diagram
X1 -i1-> X2 -i2-> …
S1  ->   S2  ->   …
of schemes with cartesian squares. Suppose given (L_n,φ_n) where each L_n is an invertible sheaf on X_n and φ_n:i^∗_nL{n+1}→Ln is an isomorphism. If
  - X1→S1 is proper, and
  - L1 is ample on X1
then there exists a proper morphism of schemes X→S and an ample invertible OX-module L and isomorphisms Xn≅X ×_S S_n and L_n≅L|_Xn compatible with the morphisms i_n and φ_n.

- De plus, si X->S est séparé de type fini, et qu'on se donne une suite
  cartésienne Z_n de X_n tel que Z_1 -> X_1 closed immersion (resp. fini)
  et Z_1->S_1 propre, alors il existe Z->X closed immersion (resp. fini)
  et Z propre sur S.
- Et si X/S propre et Y/S séparé de type fini, et qu'on a f_n:X_n->Y_n
  compatibles, alors on a un morphisme X->Y.

* Résumé:
- Si S=Spec(A), A complet, se donner un schéma propre X->S + L ample sur X revient à se donner X_i->S_i + Li tel que X_1->S_1 propre et L1 ample.
- Si X->S séparé de type fini
  - se donner Z->X immersion fermée (resp. fini) revient à se donner
    Z_i->X_i tel que Z_1->X_1 immersion fermée (resp. fini)
  - se donner F cohérent à support propre sur X revient à se donner F_i
    cohérent sur X_i tel que F_1 de support propre sur X_1.

Excellent rings
---------------

* https://stacks.math.columbia.edu/tag/07QS
$ 15.51 Excellent rings

Definition 15.51.1. Let R be a ring.
  - We say R is quasi-excellent if R is Noetherian, a G-ring, and J-2.
  - We say R is excellent if R is quasi-excellent and universally catenary.

- G-ring: les fibres formelles en chaque R_p sont géométriquement régulières
  Si R G-ring et R→S is essentially of finite type, S G-ring

- j-2=toute R-algèbre de type fini S est de type j-1, ie Reg(S) est ouvert

Proposition 15.51.3. The following types of rings are excellent:
  - fields,
  - Noetherian complete local rings,
  - Z,
  - Dedekind domains with fraction field of characteristic zero,
  - finite type ring extensions of any of the above.

Lemma 15.51.4. Let (A,m) be a Noetherian local ring. The following are equivalent
  - A is Nagata, and
  - the formal fibres of A are geometrically reduced.
Lemma 15.51.5. A quasi-excellent ring is Nagata.

Lemma 15.51.6. Let (A,m) be a Noetherian local ring. If A is normal and the formal fibres of A are normal (for example if A is excellent or quasi-excellent), then A∧ is normal.

Note: la hensélisation (stricte) d'un anneau excellent est excellent (j'ai
vu ça quelque part sur mathoverflow par nfdc23, pour le cas strict c'est dans EGA)

Jacobson schemes et dimension 0
===============================

Jacobson
--------

* https://stacks.math.columbia.edu/tag/005T
$ 5.18 Jacobson spaces

Definition 5.18.1. Let X be a topological space. Let X0 be the set of closed points of X. We say that X is Jacobson if every closed subset Z⊂X is the closure of Z∩X0.

Note that a topological space X is Jacobson if and only if every nonempty locally closed subset of X has a point closed in X.

Lemma 5.18.6. A finite Jacobson space is discrete.

Slogan [5.18.7]: For Jacobson spaces, closed points see everything about the topology.

* https://stacks.math.columbia.edu/tag/00FZ
$ 10.34 Jacobson rings

Definition 10.34.1. Let R be a ring. We say that R is a Jacobson ring if every radical ideal I is the intersection of the maximal ideals containing it.
= is Jacobson as a topological space [10.34.4]

Theorem 10.34.11. Let k be a field. Let S be a k-algebra generated over k by the elements {xi}i∈I. Assume the cardinality of I is smaller than the cardinality of k. Then
  - for all maximal ideals m⊂S the field extension k⊂κ(m) is algebraic, and
  - S is a Jacobson ring.

Proposition 10.34.19. Let R be a Jacobson ring. Let R→S be a ring map of finite type. Then
  - The ring S is Jacobson.
  - The map Spec(S)→Spec(R) transforms closed points to closed points.
  - For m′⊂S maximal lying over m⊂R the field extension κ(m′)/κ(m) is finite.

* https://stacks.math.columbia.edu/tag/01P1
$ 28.6 Jacobson schemes

= topologically Jacobson = the closed points are dense in every closed subset

S Jacobson <=> S locally Jacobson for the Zariski topo

* https://stacks.math.columbia.edu/tag/01T9
$ 29.15 Points of finite type and Jacobson schemes

A finite type point s of S is a point such that the morphism Spec(κ(s))→S is of finite type

Lemma 29.15.7. Let S be a scheme. For any locally closed subset T⊂S we have
T≠∅⇒T∩Sft-pts≠∅.
In particular, for any closed subset T⊂S we see that T∩Sft-pts is dense in T.

Donc pour un schéma non de Jacobson, on pourrait considérer les points de
type fini pour retrouver la topologie. [Note: un point fermé est toujours
de type fini (et même fini! et même une immersion fermée!), car il est de
la forme A/m. Pour un schéma de Jacobson un point de type fini est fermé!
De plus si S de Jacobson et f:T->S loc. of finite type, f envoie les points
fermés sur des points fermés, et on a même κ(s)⊂κ(t) est fini]

Lemma 29.15.8. Let S be a scheme. The following are equivalent:
  - the scheme S is Jacobson,
  - Sft-pts is the set of closed points of S,
  - for all T→S locally of finite type closed points map to closed points, and
  - for all T→S locally of finite type closed points t∈T map to closed points s∈S with κ(s)⊂κ(t) finite.

Lemma 29.15.9. Let S be a Jacobson scheme. Any scheme locally of finite type over S is Jacobson.

Lemma 29.15.10. The following types of schemes are Jacobson.
  - Any scheme locally of finite type over a field.
  - Any scheme locally of finite type over Z.
  - Any scheme locally of finite type over a 1-dimensional Noetherian domain with infinitely many primes.
  - A scheme of the form Spec(R)∖{m} where (R,m) is a Noetherian local ring. Also any scheme locally of finite type over it.

Dimension 0
-----------

* Résumé
- Soit X un espace topologique sobre.
  - X est de dim 0 et noeth, X est fini discret
  - Si X est fini et de Jacobson, X est fini discret [5.18.6]
  Donc si X noeth. et de Jacobson (par exemple de type fini sur Y noeth. et
  de Jacobson), X dim 0 <=> X fini discret <=> X fini
- Un schéma dont l'espace topologique est fini discret est affine [26.11.8]. 
  Si A noeth, A de dim 0 <=> A artinien (cf https://en.wikipedia.org/wiki/Artinian_ring)
- Un schéma réduit dont l'espace topologique est fini discret est un
  produit de corps. On se ramène à un point (qui est donc intègre), et on
  vérifie que c'est un corps car (0) étant l'unique premier, il est
  maximal.
- Si X schéma de type fini sur un corps,
  X dim 0 <=> X fini discret <=> X fini sur k <=> X entier sur k <=> X = Spec(A) avec A artinien
  Si de plus X réduit, alors A est un produit de corps finis sur k.
  Si de plus X intègre, alors A est un corps fini sur k.
  [Preuve: X est noeth et Jacobson, et pour X entier on utilise la normalisation de Noether.]

* https://math.stackexchange.com/questions/106043/rings-whose-spectrum-is-hausdorff/106069#106069

For an affine scheme S=Spec(A) (<=>)
1) A is zero-dimensional
2) S has all its points closed (i.e. S is T1)
3) S is Hausdorff
4) S is compact Hausdorff

If moreover the ring A is noetherian the above are also equivalent to:
5) A is Artinian
6) S has the discrete topology
7) S is finite and has the discrete topology

If moreover the ring A is finitely generated over a field k (and thus noetherian) the above are also equivalent to:
8) A is algebraic over k
9) dim_k(A)<∞
10) Card(S)<∞

- https://math.stackexchange.com/questions/474873/why-is-every-noetherian-zero-dimensional-scheme-finite-discrete
It is false that the spectrum of a zero-dimensional ring is discrete if the ring is not assumed noetherian:
- Si A=K^(N), Spec A est une union dénombrable de points
- If A=K^N is the denumerable power of a field K then A is zero-dimensional and Spec(A) is homeomorphic to the Stone-Čech compactification of N, a dreadful beast which is certainly not discrete since it is compact and infinite.

* https://stacks.math.columbia.edu/tag/00KD
$  10.59: Dimension 

Proposition 10.59.6. Let R be a ring. The following are equivalent:
  - R is Artinian,
  - R is Noetherian and dim(R)=0,
  - R has finite length as a module over itself,
  - R is a finite product of Artinian local rings,
  - R is Noetherian and Spec(R) is a finite discrete topological space,
  - R is a finite product of Noetherian local rings of dimension 0,
  - R is a finite product of Noetherian local rings Ri with d(Ri)=0,
  - R is a finite product of Noetherian local rings Ri whose maximal ideals are nilpotent,
  - R is Noetherian, has finitely many maximal ideals and its Jacobson radical ideal is nilpotent, and
  - R is Noetherian and there are no strict inclusions among its primes.

* https://stacks.math.columbia.edu/tag/02IF
$ 10.60 Applications of dimension theory

Lemma 10.60.3. Let S be a nonzero finite type algebra over a field k. Then dim(S)=0 if and only if S has finitely many primes. 

Proof. Recall that Spec(S) is sober, Noetherian, and Jacobson, see Lemmas 10.25.2, 10.30.5, 10.34.2, and 10.34.4. If it has dimension 0, then every point defines an irreducible component and there are only a finite number of irreducible components (Topology, Lemma 5.9.2). Conversely, if Spec(S) is finite, then it is discrete by Topology, Lemma 5.18.6 and hence the dimension is 0.

Rappel: Lemma 5.18.6. A finite Jacobson space is discrete. (Et bien sûr un espace discret est de Jacobson)

Remarque: il me semble que la même preuve marche pour un schéma de type
fini S sur R noeth de Jacobson, S est donc noeth et de Jacobson, et donc S
de dim 0 <=> S a un nombre fini de points (et donc est discret)

* https://stacks.math.columbia.edu/tag/04MS
$ 28.10: Dimension

Lemma 28.10.5. A locally Noetherian scheme of dimension 0 is a disjoint union of spectra of Artinian local rings.

Lemma 28.10.6. Let X be a scheme of dimension zero. The following are equivalent
  - X is quasi-separated, [note: c'est le cas si X affine]
  - X is separated,
  - X is Hausdorff,
  - every affine open is closed.
In this case the connected components of X are points.

Algèbres de type fini sur un corps
----------------------------------

Th: Pour une k-algèbre A de type fini (<=>)
discret, ensemblistement fini, de dim 0, A/k finie, A artinien

Preuve: ensemblistement fini => discret finie est 10.60.3 (A est de Jacobson), 
dim 0 => fini est le lemme de Normalisation de Noether, le reste est standard.
Cf Dimension 0 pour plus de détail.

* https://stacks.math.columbia.edu/tag/06LF
$ 33.20 Algebraic schemes
Loc. algebraic = loc of finite type over k, algebraic = finite type over k
Lemma 33.20.2. Let k be a field. Let X be a locally algebraic k-scheme of dimension 0. Then X is a disjoint union of spectra of local Artinian k-algebras A with dimk(A)<∞. If X is an algebraic k-scheme of dimension 0, then in addition X is affine and the morphism X→Spec(k) is finite. 

! Algèbres de type fini qui sont des corps
1. Si R⊂K avec K algébrique sur k⊂R, R est un corps
   (en particulier, R intègre entière sur k est un corps)
2. Si R⊂K avec K de type fini sur R, alors il existe f∈R tel que R_f est un corps et  R_f⊂K est fini.
   Si R est de Jacobson, alors on peut prendre f=0, ie R est un corps et K/R est fini.

Preuve:
1. est https://stacks.math.columbia.edu/tag/0BID
  $ 9.8: Algebraic extensions, Lemma 9.8.10.
  où on utilise un polynôme annulateur pour inverser a \in R.
  Note: dans le cas R/k fini, on a aussi la preuve suivante:
  R intègre de type fini sur k et de dim 0, donc Spec R est un point et R
  est un corps.
2. est https://stacks.math.columbia.edu/tag/00FS
  $ 10.33: Hilbert Nullstellensatz
  et https://stacks.math.columbia.edu/tag/00FZ
  $ 10.34: Jacobson rings

Limites projectives de schémas
==============================

* Passage de générique (point générique) à général (sur un ouvert de Zariski)
https://math.stackexchange.com/questions/713061/on-the-use-of-generic-and-general-in-algebraic-geometry
From generic to general. Suppose you have a morphism of schemes X→Y, with Y irreducible of generic point η. Let Q be a property of schemes. If the generic fiber Xη has Q, and the property is constructible, then a general fiber has Q as well, meaning that there is an open subset U⊂Y such that X_u has Q for every u∈U.

* https://mathoverflow.net/questions/234234/etale-localization-reference-request
-> https://stacks.math.columbia.edu/tag/081C
$ 32.8 Descending properties of morphisms
 For a limit of a directed system of schemes with affine transition, cas
 qcqs
 The stacks project so far has P = "affine", "finite", "unramified", "closed immersion", "separated", "flat", "finite locally free", "smooth", "etale", "isomorphism", "monomorphism", "surjective", "syntomic", "proper", "quasi-finite", and "at-worst-nodal of relative dimension 1"

* Référence: Ega IV.8
I filtrant, A_i système inductif d'anneaux, A sa limite inductive.
Si X_a est un schéma sur A_a, on peut considérer X_j=X_a x_{A_a} A_j
et X=X_a x_{A_a} A. Alors X est la limite projective des X_j.
Essentiellement, quand on est de présentation finie, X a une propriété (P)
équivaut à X_a a la propriété (P) pour tout $a$ assez grand; et de même
pour les propriétés des morphismes ou des O_X modules. De plus se donner un
A schéma X de présentation finie sur A <=> se donner un A_i schéma de X_i
de présentation finie, pour i assez grand; et alors X=X_i x_{A_i} A. De
même pour les O_X modules de présentation finie, leurs morphismes, les
morphismes de A-schémas de présentation finie, etc.

Exemples:
- U_i voisinages affines décroissant d'un point y \in Y; la limite
  inductive des O(U_i) est l'anneau local O_y.
  En particulier, Y intègre et y=point générique, se donner un schéma de
  prés finie sur K=k(Y) <=> se donner un schéma de prés finie sur un ouvert
  assez petit de Y.
  Ici les morphismes de transitions U_i -> U_j sont plats (ce sont des
  immersions ouvertes)
- Cas A_i des corps, A=lim A_i est donc un corps. Eg si K/k est une
  extension de corps, on peut voir K comme la limite inductive d'extensions
  de type fini de k.
  Ici les morphismes de transitions sont fidèlement plats.
- Pour des propriétés locales en Y, on peut considérer une section affine A,
  A est alors un anneau quelconque, mais peut-être vu comme limite
  inductive de Z-algèbres de type finis.
  Ainsi on peut souvent (quand on est de prés finie) se ramener au cas
  Noethérien. [cf Morphismes#Absolute approximation où on approxime des
  morphismes qcqs par des morphismes de présentation finie]

Prop (8.3.8):  (S limite projective des S_i [EGA montre que la limite S
projectif de schémas affines S_i sur une base S_0 existe, et que O_S est la
limite inductive des O_S_i, et topologiquement S est la lim proj des S_i.
Si X_i0->S_i0, on déf X_i=X_i0 x S_i0 S_i, alors la lim proj des X_i est X.])
- S->S_i est dominant/surjectif ssi S_j->S_i dominant/surjectif pour tout j>=i
- si les S_j->S_i sont (fidèlement) plats pour i, j assez grands, S->S_i
  est (fidèlement) plat
- si S->S_i est surjectif pour i assez grand, alors S->S_i est
  (universellement) ouvert ssi S_j->S_i est (universellement) ouvert pour
  tout j>=i.

Th (8.3.11): si un des S_i est qcqs, alors il y a bijection entre
l'ensemble des parties (resp. les parties constructibles, resp. les parties
constructibles ouvertes, resp. les parties constructibles fermées, resp.
les parties constructibles loc. fermées) sur X et les limites ind de ces
parties sur les X_i. Ainsi, si Z est constructible dans X et vient de la limite
des Z_i, alors Z est ouverte (resp fermée, resp loc fermée) si Z_i est
ouvert (resp...) pour un $i$.

Prop 8.4.1: si un des S_i est qcqs, si S est noeth, alors S_i irréductible
pour i assez grand => S irréd, et S_i connexe pour i assez grand => S
connexe. Si de plus S_i->S_j est dominant (ou un homéo sur un sous-espace),
alors {composantes irréd de S} =~ {composantes irrés de S_i} via Z->
\overline{u_i(Z)}; et de même pour les composantes connexes.

Prop 8.7.1: si les S_i sont réduits, S est réduit.

Th 8.5.2: si S_0 est *qcqs*, un O_S-module quasi-cohérent F de *présentation
finie* vient d'un F_i (de prés. finie) sur S_i. De plus, si F=lim proj F_i
(F_i quasi cohérent prés finie), G=lim proj G_i (G_i quasi cohérent), alors
Hom(F,G)=lim ind Hom(F_i, G_i). Et f:F->G est un iso ssi un des f_i est un
iso (et donc F et G sont isomorphes si F_i est isomorphe à G_i pour un i).
En appliquant à F=O_S, on a \Gamma(O_S)=lim ind \Gamma(O_S_i).
Les propriétés suivantes sont vraies sur F si elle est vraie pour un F_i:
- F loc libre
- F->G->H->0 exacte
- F->G surjectif
- 0->F->G->H->0 exacte (si les S_i->S_j sont plats!)
- F->G injectif (si les S_i->S_j sont plats!)

Prop 8.6.3: si S_0 est *qcqs* il y a bijection entre les sous-schémas de
prés finies de S et les lim inductives de tels sous-schémas sur les S_i;
idem pour ceux qui sont de plus ouverts/fermés.

# Galois theory of schemes

Références:
- SGA1
- Lenstra: https://websites.math.leidenuniv.nl/algebra/GSchemes.pdf
- http://www.math.toronto.edu/~jacobt/Lecture7.pdf
  Des exemples de groupes étales fondamentaux

# Deformation

- https://en.wikipedia.org/wiki/Kodaira%E2%80%93Spencer_map
The Kodaira–Spencer map is[1]
    δ : T_0 S → H^1(X,TX)
where
    XX → S is a smooth proper map between complex spaces[2] (i.e., a deformation of the special fiber X=XX_0
    δ is the connecting homomorphism obtained by taking a long exact cohomology sequence of the surjection T XX|X → T_0 S ⊗ O_X
The basic fact is: there is a natural bijection between isomorphisms classes of Xx → S = Spec(C[t]/t^2) and H^1(X,TX)

- https://math.stackexchange.com/questions/1322093/why-does-infinitesimal-lifting-imply-triviality-of-infinitesimal-deformations/1322196#1322196
Let X be an affine nonsingular scheme of finite type over some algebraically closed field k. Let D=k[ϵ]/(ϵ^2), and let X′ be an infinitesimal deformation of X over D (ie, the X′ is flat over D, and the reduced fiber is X).
Then X' is trivial: X′=X ×_k D.
(Note that the proof works also if we replace D by any local Artin k-algebra)

Voir aussi:
- http://math.stanford.edu/~conrad/vigregroup/vigre05/gm.pdf
  THE θ OPERATOR by Nick Ramsey
- Yves André, On the Kodaira-Spencer map of abelian schemes
  https://arxiv.org/abs/1606.03691
- Le cours: https://math.berkeley.edu/~robin/math274root.pdf
  Math274, Lectures on Deformation Theory Robin Hartshorne

# GAGA

* https://en.wikipedia.org/wiki/Algebraic_geometry_and_analytic_geometry
The category of coherent sheaves on a projective complex algebraic variety X is equivalent to the category of analytic coherent sheaves on the analytic variety X^an, and the equivalence is given on objects by mapping F to F^an, and
     ε_q : H^q(X, F) → H^q(X^an, F^an) is an iso.

Chow: any analytic subspace of complex projective space which is closed in the strong topology is closed in the Zariski topology.

GAGA général: on peut associer X^an à X schéma de type fini sur C, et f^an à f:X->Y loc. de type fini.
- Then (f_∗ F)^an → f_∗^an F^an is injective. If f is proper then this map is an isomorphism. One also has isomorphisms of all higher direct image sheaves (R^i f_∗ F)^an ≅ R^i f_∗^an F^an
- If X^an is Hausdorff and compact, F -> F^an is an equivalence of category of coherent algebraic and analytic modules.

## Kodaira embedding theorem:
Let X be a compact Kähler manifold, and L a holomorphic line bundle on X. Then L is positive line bundle if and only if there is a holomorphic embedding ϕ : X → P of X into some projective space such that ϕ∗OP(1) = L^⊗m for some m>0.

* https://en.wikipedia.org/wiki/Positive_form#Positive_line_bundles
In algebraic geometry, positive (1,1)-forms arise as curvature forms of ample line bundles (also known as positive line bundles). Let L be a holomorphic Hermitian line bundle on a complex manifold,
    ∂¯ : L ↦ L ⊗ Λ^0,1(M)
its complex structure operator. Then L is equipped with a unique connection preserving the Hermitian structure and satisfying
    ∇^0,1=∂¯ 
This connection is called the Chern connection.
The curvature Θ of a Chern connection is always a purely imaginary (1,1)-form. A line bundle L is called positive if
    iΘ
is a positive definite (1,1)-form. The Kodaira embedding theorem claims that a positive line bundle is ample, and conversely, any ample line bundle admits a Hermitian metric with iΘ positive.

* Plus de détails ici:
https://johncarlosbaez.wordpress.com/2018/12/26/geometric-quantization-part-2/
Suppose we have a compact complex manifold M equipped with a holomorphic complex line bundle L \to M. Given any hermitian metric on L, this bundle has a unique connection D called the Chern connection with the properties sketched in my article. The curvature of this connection is a (1,1)-form; let’s call it \Theta.
We say L is positive if there exist a hermitian metric on it such that
  \omega = \frac{i}{2\pi} \Theta
is the imaginary part of a Kähler structure on M. This is equivalent to demanding that
  \omega(v, Jv) > 0
for every nonzero tangent vector v.

The Kodaira embedding theorem says that if L is positive then M can be embedded as a submanifold of CP^n for some sufficiently large n in such a way that for some sufficiently large k, L^{\otimes k} is isomorphic to the pullback of the dual of the tautological line bundle over CP^n.
We can go further using Chow’s theorem: M actually embeds as a projective variety in CP^n.

We can say all this a bit differently if we start with a compact Kähler manifold M. Then the imaginary part of the Kähler structure is a (1,1)-form \omega. We say \omega is integral if it represents an integral element of deRham cohomology.
If \omega is integral we say the Kähler structure on M is a Hodge metric and call M a Hodge manifold. In this case we can find a hermitian holomorphic line bundle L over M whose Chern connection has curvature \Theta with
  \frac{i}{2\pi} \Theta = \omega

And so, in this case M can be embedded as a projective variety in CP^n for some sufficiently large n in such a way that for some sufficiently large k, L^{\otimes k} is isomorphic to the pullback of the dual of the tautological line bundle.

# Analytic spaces

* https://en.wikipedia.org/wiki/Rigid_analytic_space
The basic rigid analytic object is the n-dimensional unit polydisc, whose ring of functions is the Tate algebra T_n, made of power series in n variables whose coefficients approach zero in some complete nonarchimedean field k. 
An affinoid algebra is a k-Banach algebra that is isomorphic to a quotient of the Tate algebra by an ideal.
A rigid analytic space over k is a pair (X , O X) describing a locally ringed G-topologized space with a sheaf of k-algebras, such that there is a covering by open subspaces isomorphic to affinoids.

Raynaud: the category of quasi-compact quasi-separated rigid spaces over k is
equivalent to the localization of the category of quasi-compact admissible
formal schemes over R with respect to admissible formal blow-ups. Here, a
formal scheme is admissible if it is coverable by formal spectra of
topologically finitely presented R algebras whose local rings are R-flat.

Vladimir Berkovich reformulated much of the theory of rigid analytic spaces
in the late 1980s, using a generalization of the notion of Gelfand spectrum
for commutative unital C*-algebras. The Berkovich spectrum of a Banach
k-algebra A is the set of multiplicative semi-norms on A that are bounded
with respect to the given norm on k, and it has a topology induced by
evaluating these semi-norms on elements of A.

* https://en.wikipedia.org/wiki/Berkovich_space

* https://en.wikipedia.org/wiki/Perfectoid_space 
Perfectoid spaces are adic [=rigid analytic space] spaces of special kind,
which occur in the study of problems of "mixed characteristic", such as local
fields of characteristic zero which have residue fields of characteristic prime
p. 

A perfectoid field is a complete topological field K whose topology is
induced by a nondiscrete valuation of rank 1, such that the Frobenius
endomorphism Φ is surjective on K°/p where K° denotes the ring of
power-bounded elements.

The tilting equivalence is a theorem that the tilting functor (-)♭ induces
an equivalence of categories between perfectoid spaces over K and
perfectoid spaces over K♭ [which is of carac p]
Almost purity theorem:
Let K be a perfectoid field.
- If X → Y is a finite étale morphism of adic spaces over K and Y is
perfectoid, then X also is perfectoid;
- A morphism X → Y of perfectoid spaces over K is finite étale if and only if
the tilt X♭ → Y♭ is finite étale over K♭.

# Motifs

https://ncatlab.org/nlab/show/Standard+Conjectures+on+Algebraic+Cycles

https://mathoverflow.net/questions/176122/progress-on-the-standard-conjectures-on-algebraic-cycles

https://arxiv.org/pdf/1402.2155.pdf
FORGOTTEN MOTIVES:THE VARIETIES OF SCIENTIFIC EXPERIENCE Yuri I. Manin

http://www.normalesup.org/~zoghaib/math/dea.pdf
Théorie homotopique de Morel-Voevodsky et applications; Sam Zoghaib

http://tomlr.free.fr/Math%E9matiques/Andre,%20Y%20-%20Une%20Introduction%20aux%20Motifs%20%28SMF%202004%29.pdf
Livre d'Yves André: une introduction aux motifs (purs, mixtes, périodes)
Algebraic space
===============

* Références:
https://ncatlab.org/nlab/show/algebraic+space
https://mathoverflow.net/questions/3194/what-are-the-benefits-of-using-algebraic-spaces-over-schemes
https://mathoverflow.net/questions/292728/clarifying-an-interpretation-of-algebraic-spaces
https://mathoverflow.net/questions/11226/commutative-rings-to-algebraic-spaces-in-one-jump
  The T-V approach just means this: an algebraic space with affine diagonal is the same as a sheaf X on Aff which is covered by affines U_i such that each U_ij := U_i \times_X U_j is affine and etale over U_i and U_j. A general algebraic space is the same except that you only require that each U_ij is an algebraic space with affine diagonal (instead of being affine).

* TODO algebraic space, cf les notes de Toen
  https://perso.math.univ-toulouse.fr/btoen/files/2015/02/cours2.pdf

  https://stacks.math.columbia.edu/tag/0021
  4.8 Fibre products and representability

  https://mathoverflow.net/questions/14486/precise-definition-of-a-scheme-key-question-how-to-define-an-open-subfunctor-w?rq=1

Définitions
-----------

* https://en.wikipedia.org/wiki/Algebraic_space
An algebraic space X comprises a scheme U and a closed subscheme R ⊂ U × U satisfying the following two conditions:
    1. R is an equivalence relation as a subset of U × U
    2. The projections pi: R → U onto each factor are étale maps.
Rem: One can assume that R and U are affine.

$ Algebraic spaces as sheaves

An algebraic space X can be defined as a sheaf of sets
    XX : ( Sch / S )_et^op→Sets 
such that
    - There is a surjective etale morphism X → XX
    - the diagonal morphism Δ XX / S : XX → XX × XX is representable. 
      This is equivalent to the property that given any schemes Y , Z and morphisms h_Y , h_Z →XX, their fiber-product of sheaves h_Y × XX h_Z is representable by a scheme over S.
      [cf https://stacks.math.columbia.edu/tag/0021 4.8 Fibre products and representability]

* Algebraic spaces: https://stacks.math.columbia.edu/tag/025X
$ 61.6 Algebraic spaces

Definition 57.6.1. Let S be a scheme contained in Schfppf. An algebraic
space over S is a presheaf F:(Sch/S)^opp_fppf⟶Sets with the following properties
 (i)  The presheaf F is a sheaf.
 (ii) The diagonal morphism F→F×F is representable.
 (iii) There exists a scheme U∈Ob((Sch/S)fppf) and a map h_U→F which is surjective, and étale.
[Note: https://stacks.math.columbia.edu/tag/076L montre qu'il suffit que (i) soit vraie pour la topologie étale]

Note: we only require the diagonal map for F to be representable, whereas in
[Kn] it is required that it also be quasi-compact. If F=h_U for some scheme
U over S this corresponds to the condition that U be quasi-separated.

As ringed topoi
---------------

* https://www.math.columbia.edu/~dejong/wordpress/?p=260
Given an algebraic space X we obtain a ringed topos (Sh(X_{etale}), O_X) of sheaves on the small etale site of X endowed with the structure sheaf. This is a locally ringed topos (as in SGA4, Expose IV, Exercise 13.9). Moreover, a morphism X —> Y of algebraic spaces induces a morphism of ringed topoi in the same direction. In fact it is a morphism of locally ringed topoi (see reference above for definition). In fact I think that
  Mor(X, Y) —> Mor( (Sh(X_{etale}), O_X), (Sh(Y_{etale}), O_Y) )
is a bijection, i.e., the category of algebraic spaces is a full subcategory of the category of locally ringed topoi. This is sooooo cool!

Voir aussi https://www.math.columbia.edu/~dejong/wordpress/?p=322 'Example etale topoi' pour les DM stack.

* https://stacks.math.columbia.edu/tag/04KL
Fully Faithfull Embedding of algebraic spaces into locally ringed topoi
X->(X_ét, O_X).

Bootstrap
---------

- "Bootstrap": https://stacks.math.columbia.edu/tag/04S6
Theorem 72.10.1. Let S be a scheme. Let F:(Sch/S)^opp_fppf→Sets be a functor. Any one of the following conditions implies that F is an algebraic space:
  - F=U/R where (U,R,s,t,c) is a groupoid in algebraic spaces over S such that s,t are flat and locally of finite presentation, and j=(t,s):R→U×SU is an equivalence relation,
  - F=U/R where (U,R,s,t,c) is a groupoid scheme over S such that s,t are flat and locally of finite presentation, and j=(t,s):R→U×S U is an equivalence relation,
  - F is a sheaf and there exists an algebraic space U and a morphism U→F which is representable by algebraic spaces, surjective, flat and locally of finite presentation,
  - F is a sheaf and there exists a scheme U and a morphism U→F which is representable (by algebraic spaces or schemes), surjective, flat and locally of finite presentation,
  - F is a sheaf, ΔF is representable by algebraic spaces, and there exists an algebraic space U and a morphism U→F which is surjective, flat, and locally of finite presentation, or
  - F is a sheaf, ΔF is representable, and there exists a scheme U and a morphism U→F which is surjective, flat, and locally of finite presentation.
Lemma 76.12.3: $ Algebraic spaces in the étale topology
  - F is a sheaf for the étale topology, ΔF is representable by algebraic spaces, and there exists an algebraic space U and a morphism U→F which is surjectiveand smooth [en fait je pense qu'on peut adapter la preuve pour qu'elle marche avec U->F surjectif fppf en utilisant le bootstrap]

Preuve: 
(iii) => (vi) vient de https://stacks.math.columbia.edu/tag/046K
qui montre que U->F is representable by algebraic spaces, surjective, flat and locally of finite presentation => ΔF is representable (by schemes). 
  Preuve: comme U est algébrique, il existe un schéma U'->U étale
  surjectif; qui est donc en particulier representable, surjective, flat and locally of finite presentation, donc on peut remplacer U par un schéma; alors
  Ux_F U est un esp algébrique et U x_F U -> U x_S U is a monomorphism which is locally of finite type, hence a separated and locally quasi-finite morphism
  et on en déduit que ΔF est représentable.
(v) => (i) On pose R=U×F U; on montre que F=U/R est un espace algébrique,
et de plus U→F is surjective, flat, and locally of finite presentation (cf Lemma 72.11.6)

* https://stacks.math.columbia.edu/tag/04SJ
$ 76.11 Applications
- A sheaf which is fppf locally an algebraic space is an algebraic space.
- Any fppf descent datum for algebraic spaces is effective.
- Lemma 76.11.5 si on a un groupoid quotient stack [U/R] d'espaces algébriques,
  alors for any scheme T over S and objects x,y of [U/R] over T the sheaf
  Isom(x,y) on (Sch/T)fppf is an algebraic space. 
- Lemma 76.11.7. Let S be a scheme. Let X→B be a morphism of algebraic spaces
  over S. Let G be a group algebraic space over B and let a:G×BX→X be an action
  of G on X over B. If
   - a is a free action, and
   - G→B is flat and locally of finite presentation,
  then X/G (see Groupoids in Spaces, Definition 70.18.1) is an algebraic
  space and X→X/G is surjective, flat, and locally of finite presentation.
- Lemma 76.11.8. On peut se donner un G-torseur localement si on a les cocycle condition.

### Laumont-Laurent-Morret-Bailly:
* Cas d'un espace algébrique:

Note: un espace algébrique est un faisceau our la topologie fppf.
Si g:X->Y est un morphisme ffpf d'espaces algébrique, alors g est de
descente effective, ie "les espaces algébriques forment un S-champ fppf".

Corollaire (10.4). Soient X. une S-relation d'équivalence fppf (9.2) et X
le S-faisceau fppf quotient. (ie X1=>X0 et X=X0/X1).
On suppose que X_0 et X_1 sont des S-espaces
algébriques, que les morphismes de S-espaces algébriques pr_i o \delta sont
plats et localement de présentation finie, et que le morphisme de S-espaces
algébriques \delta est quasi-compact. Alors X est un S-espace algébrique.

Note: l'hypothèse qc vient du fait que dans le livre ils supposent leur
espace/champs algébriques qs, ie la diagonale est qc en plus d'être
représentable (et dans le cas d'un champ la diagonale est séparée).

COROLLAIRE (10.4.1). - Soit \pi: X->Y un morphisme de S-faisceaux fppf.
On suppose que :
(i) X est un S-espace algébrique
(ii) \pi est représentable, fidèlement plat et localement de présentation finie
(iii) (pr1 , pr2) : X x_Y X -> X x_S X (qui est un morphisme d'espaces
algébriques d'après (i) et (ii)) est quasi-compact.
Alors Y est un S-espace algébrique.

Algebraic Stacks
================

* Références:
- https://golem.ph.utexas.edu/category/2009/06/algebraic_geometry_for_categor.html
- https://perso.math.univ-toulouse.fr/btoen/videos-lecture-notes-etc/
  Bertrand Toën, A master course on algebraic stacks (Toulouse 2005)
- https://maths-people.anu.edu.au/~alperj/papers/stacks-guide.pdf
  A  GUIDE  TO  THE  LITERATURE  ON  ALGEBRAIC  STACKS, JAROD ALPER
  Disponible ici aussi: https://stacks.math.columbia.edu/tag/03B0
- https://math.berkeley.edu/~molsson/qcohrevised.pdf
  SHEAVES ON ARTIN STACKS, MARTIN OLSSON
  We develop a theory of quasi–coherent and constructible sheaves on algebraic stacks correcting a mistake in the recent book of Laumon and Moret-Bailly.
- http://www.maths.mic.ul.ie/hoffmann/allahabad.pdf
  The moduli stack of vector bundles on a curve
  (Quick exemple of a moduli problem represented by a stack)
- https://arxiv.org/pdf/alg-geom/9609014.pdf
  Algebraic (geometric) n-stacks Carlos Simpson

Algebraic stacks are a class of geometric/presentable class:
https://ncatlab.org/nlab/show/geometric+stack
https://mathoverflow.net/questions/27399/when-is-a-stack-not-geometric
Cf aussi Pronk, Etendues

Définitions
-----------

* https://en.wikipedia.org/wiki/Stack_(mathematics)
An algebraic stack or Artin stack is a stack in groupoids X over the etale site such that the diagonal map of X is representable and there exists a smooth surjection from (the stack associated to) a scheme to X. A morphism Y → X of stacks is representable if, for every morphism S → X from (the stack associated to) a scheme to X, the fiber product Y ×X S is isomorphic to (the stack associated to) an algebraic space.

The motivation behind the representability of the diagonal is the following: the diagonal morphism Δ : XX → XX × XX is representable if and only if for any pair of morphisms of algebraic spaces X , Y → XX their fiber product X ×_XX Y is representable.

A Deligne–Mumford stack is an algebraic stack X such that there is an étale surjection from a scheme to X. Roughly speaking, Deligne–Mumford stacks can be thought of as algebraic stacks whose objects have no infinitesimal automorphisms.

* Algebraic stacks: https://stacks.math.columbia.edu/tag/026O
$  90.12: Algebraic stack

Definition 86.12.1. Let S be a base scheme contained in Sch_fppf. An
algebraic stack over S is a category p:X→(Sch/S)_fppf over (Sch/S)_fppf with the following properties:
  (i) The category X is a stack in groupoids over (Sch/S)fppf.
  (ii) The diagonal Δ:X→X×X is representable by algebraic spaces.
  (iii) There exists a scheme U∈Ob((Sch/S)fppf) and a 1-morphism (Sch/U)fppf→X which is surjective and smooth1.
[Note: https://stacks.math.columbia.edu/tag/076U montre qu'il suffit que (i) soit vraie pour la topologie étale]

As ringed topoi
---------------

* https://www.math.columbia.edu/~dejong/wordpress/?p=346
DM stacks as locally ringed topoi
Suppose that (Sh(C), O) is a locally ringed topos. When is this the small etale topos of a DM stack? I think the condition is just that it is “locally isomorphic to the small etale topos of a scheme”.

Preuve: The condition means there exists a sheaf F in Sh(C) such that the localization (Sh(C)/F, O_F) is isomorphic to (Sh(U_{etale}), O_U) as a locally ringed topos. Consider the product sheaf FxF and think of it as a sheaf over F via one of the projections. Via the isomorphism Sh(C)/F = Sh(U_{etale}) we can think of FxF as an etale sheaf on U. Since every sheaf  on U_{etale} is representable by an algebraic space over U we conclude that (Sh(C)/FxF, O_{FxF}) is isomorphic to (Sh(R_{etale}), O_R) for some algebraic space R. By the fully faithfulness discussed in previous posts we obtain two morphisms s, t : R —> U. Moreover, we can do the same trick with FxFxF and obtain a composition morphism R x_U R —> R (this will require a bit of work relating fibre products of etale morphisms of algebraic spaces to what happens on the side of small etale topoi, but I’m not worried). Hence (U, R, s, t, c) will be an etale groupoid algebraic space. The final step is to show that the DM-stack X = [U/R] has an associated locally ringed small etale topos (X_{etale}, O_X) which is equivalent to the locally ringed topos we started out with.

Bootstrap et Critère d'Artin
----------------------------

* https://stacks.math.columbia.edu/tag/06DB
$ 93.16 Bootstrapping algebraic stacks

Theorem 93.16.1. Let S be a scheme. Let F:X→Y be a 1-morphism of stacks in groupoids over (Sch/S)fppf. If
  - X is representable by an algebraic space, and
  - F is representable by algebraic spaces, surjective, flat and locally of finite presentation,
then Y is an algebraic stack

Voir aussi
http://www-personal.umich.edu/~bhattb/math/artin_flat_smooth_groupoid.pdf
une courtes note expliquant pourquoi si Y a un atlas fppf alors il a un
atlas lisse.

- Quotient stacks:
* https://stacks.math.columbia.edu/tag/06FG
$ 93.17 Applications

Theorem 93.17.2. Let S be a scheme contained in Sch_fppf. Let (U,R,s,t,c) be a groupoid in algebraic spaces over S. Assume s,t are flat and locally of finite presentation. Then the quotient stack [U/R] is an algebraic stack over S.

* https://stacks.math.columbia.edu/tag/06PI
$ 93.18 When is a quotient stack algebraic?

Lemma 93.18.3. [Slogan] Let S be a scheme and let B be an algebraic space over
S. Let G be a group algebraic space over B. Endow B with the trivial action of
G. Then the quotient stack [B/G] is an algebraic stack if and only if G is flat
and locally of finite presentation over B. 

Ainsi le stack [U/R] n'est pas forcément algébrique si le groupoïde (U,R)
n'est pas fppf (ça inclu le cas lisse). Par contre en général [U/R] a
toujours sa diagonale représentable par des espaces algébriques, cf
https://stacks.math.columbia.edu/tag/04TJ Lemme 86.17.1.

Later we will see that the quotient stack of a smooth S-space by a group
algebraic space G is smooth, even when G is not smooth (Morphisms of
Stacks, Lemma 93.32.7). 
https://stacks.math.columbia.edu/tag/0DLS
Lemma 98.32.7. Let X→Y be a smooth morphism of algebraic spaces. Let G be a group algebraic space over Y which is flat and locally of finite presentation over Y. Let G act on X over Y. Then the quotient stack [X/G] is smooth over Y.

* https://stacks.math.columbia.edu/tag/07SZ
94 Artin's Axioms

## Laurent Morey-Bailly
* Cas d'un champs:

Note: un champ algébrique X est un champ fppf, et si la diagonale est quasi
affine c'est même un champ fpqc.

Corollaire (10.5): si on a un diagramme 2-cartésien de champs fppf
X0 -> X où X0->X, Y0->Y sont des épis (fppf) et que F0:X0->Y0 est représentable
Y0 -> Y alors F:X->Y aussi.

COROLLAIRE (10.6). — Soient X. un S-faisceau fppf en groupoïdes et
X le S-champ fppf associé (cf. (9.5)). On suppose que X_0 et X_1
sont des S-espaces algébriques, que les morphismes de S-espaces algébriques
a et b de X_1 dans X_0 sont plats et localement de présentation finie, et que le
morphisme de S-espaces algébriques \delta = (a, b) : X0 -> X0 x_S X0 est séparé
et quasi-compact. Alors X est un S-champ algébrique.

Quotients:
(10.13) Soient X un S-espace algébrique, Y X un morphisme de S-espaces
algébriques et G un X-espace algébrique en groupes que l'on suppose séparé,
plat et de présentation finie sur X, opérant à droite sur le X-espace algébrique
Y.
PROPOSITION (10.13.1). - Le S-champ [Y/G /X] défini en (2.4.2) et (3.4.2)
est un S-champ algébrique. En particulier, le S-champ B(G/X) de loc. cit.
est un S-champ algébrique.

Remarque (10.13.2) : Si, de plus, on suppose G lisse sur X, le 1-morphisme
canonique Y -> [Y/G/X] est une présentation et pour que [Y/G/X] soit lisse
sur S il faut et il suffit que Y le soit.

- Caractérisation
  Th 8.1: Un champ algébrique est de Deligne-Mumford ssi la diagonale est non
  ramifiée (ie loc de type fini et formellement non ramifiée)

  COROLLAIRE (8.1.1). - Soit X un S-champ algébrique, et soit D le 1-morphisme diagonal. Les conditions suivantes sont équivalentes :
(i) X est représentable (ie est un espace algébrique) ;
(ii) X est un S-espace (ie vient d'un faisceau);
(iii) pour tout U \in ob(Aff/S) et tout x \in ob(X_U), on a Aut(x)={Id};
(iv) D est un monomorphisme de S-champs.
[En effet, plus généralement un groupoide X vient d'un préfaisceau ssi X_U
est une catégorie discrète pour tout U, ssi D est un monomorphisme, donc on
a équivalence de (ii)-(iii)-(iv). Réciproquement, on a que X est un champ
de Deligne-Mumford par le théorème + un S-espace alors la présentation
étale de X comme champ est aussi une présentation étale de X comme
faisceau, ie X est un espace algébrique].

## Stacks et groupoides

* Espaces algébriques:
- un espace algébrique X  est un faisceau sur la topo étale (ou ffpf) dont la
  diagonale est représentable (par des schémas) et on a une surjection
  F:Y->>X étale d'un schéma.
  Ainsi X est donné par le quotient de Y par une relation d'équivalence Yx_XY étale.
- il suffit que X soit un faisceau et qu'on ait Y->>X un morphisme surjectif
  ffpf représentable par des espaces algébriques avec Y un espace algébrique
- ou encore que X=U/R un quotient d'un espace algébrique par une relation d'équivalence fppf.
Exemple: si X->Y est un morphisme d'espaces algébriques, G groupe ffpf sur Y qui agit librement sur X, alors X/G est un espace algébrique et X→X/G est surjectif fppf.

* Champ algébrique:
- un champ X sur la topo étale (ou fppf) est algébrique si la diagonale est
  représentable (par des espaces algébriques) et on a une surjection
  F:Y->>X lisse d'un schéma.
  Ainsi X est donné par le groupoide lisse de schémas Yx_X Y=>Y.
- il suffit que X soit un champ et qu'on ait F:Y->>X où Y est un espace
  algébrique et F est représentable ffpf surjectif
- un groupoide d'espaces algébriques donné par G1=>G0 ffpf est un champ
  algébrique
Exemple: si X->Y est un morphisme lisse d'espaces algébriques, G groupe ffpf sur Y qui agit sur X, alors [X/G] est lisse sur Y

Th: 
- Un champ algébrique est de Deligne-Mumford ssi la diagonale est non ramifiée
- Un champ algébrique est un espace ssi X est un faisceau <=> Aut(x)={Id}
  pour tout object dans X_U (U affine) <=> la diagonale est un
  monomorphisme

* Coarse moduli space: https://stacks.math.columbia.edu/tag/04UX
=> https://arxiv.org/pdf/0708.3333.pdf
   EXISTENCE AND PROPERTIES OF GEOMETRIC QUOTIENTS DAVID RYDH
Let XX be an algebraic stack. A coarse moduli space π:XX→X such that π is
separated exists if and only if X has finite inertia. In particular, any
separated Deligne–Mumford stack has a coarse moduli space.

=> en particulier on peut définir le quotient au sens des espaces
algébriques comme le coarce moduli space du stack associé (et de plus le
morphisme quotient est propre).

Note: https://stacks.math.columbia.edu/tag/050P
Let X be an algebraic stack. Then the inertia stack IX is an algebraic stack as well. The morphism IX⟶X is representable by algebraic spaces and locally of finite type.
Rappel: IX=la catégorie (x, α) tel que F(α)=Id où F:X->S est la fibration.

Voir aussi https://math.stackexchange.com/questions/1005788/the-coarse-moduli-space-of-a-deligne-mumford-stack/1027327
pour des exemples ou le coarse space est un schéma (en utilisant GIT):
- smooth proper curves of genus g
- principally polarized abelian varieties of fixed degree, or
- canonically polarized varieties with fixed Hilbert polynomial, or
- hypersurfaces of fixed degree d≥3 in Pn with n≥3
- polarized K3 surfaces of fixed degree
et l'intro http://math.stanford.edu/~conrad/papers/coarsespace.pdf
Let XX be an Artin stack (always assumed to have quasi-compact and separated diagonalover SpecZ; cf.  [2,§1.3]).  A coarse  moduli  space for X  is a map π:XX→X to analgebraic space such that (i)π is initial among maps from XX to algebraic spaces (notethat the category of maps from XX to an algebraic space is discrete), and (ii) for every algebraically closed field k the map [XX(k)]→X(k) is bijective (where [XX(k)] denotes the set of isomorphism classes of objects in the small category X(k)). If X is equipped witha map to a scheme S then  Xhas a unique compatible map to S, and so it is equivalent to require the universal property for algebraic spaces over S.
