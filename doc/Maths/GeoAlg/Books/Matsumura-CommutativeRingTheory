vim: ft=markdownlight fdm=expr

Résumés sur la flatness:
========================

* Déf

M plat <=> I \tens M=IM pour tout idéal de type fini de A
<=> Tor^A_1(M,A/I)=0 pour tout I de type fini de A
<=> Tor^A_1(M,N)=0 pour tout module N/A fini
<=> Si \sum a_i x_i = 0 dans M, il existe b_ij dans A, y_j dans M tels que
    \sum_i a_i b_ij=0 et x_i= \sum b_ij y_j

* Base change

- Si B/A plat, alors Tor^A_i(M,N) \tens B = Tor^B_i(M \tens B, N \tens B)
- Si de plus A noeth, M/A fini, alors Ext^A_i(M,N) \tens B = Ext^B_i(M \tens B, N \tens B)

* Propriétés élémentaires

- Si a régulier sur A, il l'est sur M (car 0->A- a->A exact implique \tens
  M est exact aussi).
- Si (A,m) local, M/A fini ou m nilpotent, alors
  M libre <=> M proj <=> M plat

* Corollaire du critère local de platitude

Si (B,n) est local et contient un corps k, x_1,...,x_n une suite
B-régulière de n. Alors A=k[x_1,...x_n] \subset B est isomorphe à une algèbre
de polynômes et B/A plat.

* Fidèle platitude

B/A ff <=> B/A flat et Spec B -> Spec A surjective
       <=> B/A plat, et pour tout m maximal dans A, il existe m' \subset B au dessus de m.

Prop: si B/A ff, alors M flat (ff)/A <=> M \tens B flat (resp ff)/B
      si A local et M/A fini, M libre sur A <=> M \tens B libre sur B.

I Platitude
===========

Transitivité
------------

Si M/B f, B/A plat alors M/A plat
Si M/B ff, B/A fidèlement plat alors M/A fidèlement plat

Réciproquement, si M/B fidèlement plat, alors
  - M/A plat => B/A plat
  - M/A fidèlement plat => B/A fidèlement plat.

Changement de base
------------------

M/A plat (ou fidèlement plat) => M\tens B/B plat (resp fidèlement plat)

Local
-----

M B-module, M/A plat ssi M_p/A_p plat pour tout P \in Spec B, p=P \inter A.

Fidèle platitude
----------------
M/A fidèlement plat <=> M/A plat et M \tens N \ne 0 pour tout N
                    <=> M/A plat et mM \ne M pour tout m maximal de A

ex: - si f: A->B morphisme d'anneau locaux, f plat <=> f fidèlement plat
    - une localisation est plate mais pas fidèlement plate

Intersections
-------------

M/A plat, B/A plat, N_1, N_2 des sous-modules de N (A-module), I_1, I_2
idéaux de A, alors
- (N_1 \inter N_2) \tens M = (N_1 \tens M) \inter (N_2 \tens M)
- (I_1 \inter I_2) B = (I_1 B) \inter (I_2 B)
- (I_1 : I_2) B = (I_1 B : I_2 B) si I2 fini.

[En particulier si B/A plat, I idéal de B, alors (I \inter A)B=I]

Images réciproques
------------------
B/A fidèlement plat
(i) M -> M \tens B, m->m \tens 1 est injectif, en particulier A -> B est un monomorphisme (et de plus on a vu que Spec B -> Spec A surjectif)
(ii) IB \inter A=I

Liberté des modules plats
-------------------------

(A,m) anneau local. M/A plat. Si x_1, ... x_n \in M sont A/m-libres dans M/mM,
ils sont A-libres dans M.
Donc M fini ou m nilpotent => M libre

Hom et base change
------------------

Si B/A plat, M de présentation finie
Hom_A(M,N)\tens B = Hom_B(M \tens B, N \tens B)

Lien avec les modules projectifs
--------------------------------

M plat <=> M loc plat
Si M fini, M plat <=> M loc libre (car M fini plat sur A local <=> M libre)

P projectif => P loc projectif, la réciproque est vraie si P de prés finie
P proj sur A local <=> P libre

Donc M de prés finie, M plat <=> M proj

II Platitude et complétion
==========================

A -> B, M/B fini

1) J \subset Rad B.
M_n := M/J^(n+1)M.

M_n/A plat (for all n) => M plat

2) Si B A-alg noethérienne, b \in Rad B, régulier sur M.
M/bM plat sur A => M plat

Rappel: si I idéal de A, on dit que M est I-adically sep si a \tens M est
séparé pour la topo I-addique pour tout idéal a fini.
ex: si B noeth, IB \subset rad B, M fini sur B => M I-adically sep.

Theorem
-------
Si I nilpotent ou A noeth et M I-adically sep, alors on a l'équivalence
(1) M/A plat
(2) Tor_1^A(M,N)=0 pour tout N A_0=A/I-module
(3) M_0 plat sur A_0 et I \tens M = IM
(3') M_0 plat sur A_0 et Tor^A_1(A_0,M)=0
(4) M_0 plat sur A_0 et I^n/I^n+1 \tens_{A_0} M_0 = I^n M/I^n+1 M (for all n)
(4') M_0 plat sur A_0 et gr(A) \tens A_0 M_0 \iso gr(M)
(5) M_n plat sur A_n

Rem: - on a toujours (1) => (2) <=> (3) <=> (3') => (4) <=> (4') => (5)
     - le critère local de platitude est un cas particulier

Th: (A,m) -> (B,n) morphisme d'anneaux locaux
M/B fini; M^ := M \tens_B B^.
Alors M/A plat <=> M^/A plat <=> M^/A^ plat
De même si on remplace M^ par M*:=la complétion mB-addique de M.

III Platitude et régularité
===========================

Prop
----
(A,m,k) et (B,n,k') locaux noetherien
u:M -> N morphisme de B-modules finis, N plat sur A
(i) u injectif et N/u(M) plat sur A
<=>(ii) u0 : M \tens k -> N \tens k injectif

Corollaire
----------
(i) x_1, ... x_n M-séquence et M_n := M/\sum x_iM plat sur A
<=> (ii) l'image des x_i est une M \tens_A k-séquence et M plat sur A.

Th
--
A,B noeth, A->B, M/B fini, b \in B
M plat/A et b est M/(q \inter A) régulier pour tout q \in Spm B
=> b régulier sur M et M/bM est plat sur A.

Cor
---
A noeth, B=A[X_1,...,X_n] (ou B=A[[X_i]]), f(X) \in B
I idéal de A engendré par les coeffs de f.
Si I=A, alors f non diviseur de zéro dans B et B/fB plat sur A.

IV Platitude d'anneaux gradués
==============================

G groupe abélien, R, M G-gradués.
M plat sur R <=> pour tout complexe de R-modules gradués préservant le
degré, \tens M est exact <=> Tor^R_1(M,R/H)=0 pour tout H idéal homogène
fini de R.

Cor
---
Si I idéal de R (pas forcément homogène). On suppose que
- Pour tout idéal H homogène de R, H \tens M est I-adically separated
- M/IM est R/I plat
- Tor^R_1(M,R/I)=0
Alors M/R est plat.

Cor
---
Si A, B sont N-gradués; A_0, B_0 locaux d'idéaux max m,n.
f: A->B morphisme de degré 0, f(m) \subset n
Alors B/A plat <=> B_N plat sur A <=> B_N plat sur A_M
où M=m+A_1+..., N=n+B_1+...

V Platitude et fibres
=====================

Si A->B morphisme d'anneaux locaux, alors dim B<= dim A + dim fibre
spéciale; égalité si B/A plat

Réciproque: (A,B locaux noeth)
Si A régulier, B Cohen-Macauley et dim B = dim A + dim fibre spéciale,
alors B/A plat

Cor
---
X,Y k-schémas irré, f:Y -> X /
- X régulier
- Y Cohen-Macauley
- f envoie les points fermés de Y sur les points fermés de X (ex: f propre)
- pour tout x \in X point fermé, f^-1(x) est de dimension dim Y -dim X
Alors f est plat.

VI Transfert
============

Th: f: A->B morphisme d'anneaux noeth
E A-mod, G B-mod, G/A plat. Alors
- pour tout p \in Spec A, si G/pG \ne 0, f_*(Ass_B(G/pG))=Ass_A(G/pG)={p}
- Ass_A(E\tens G)= \union_{Ass_A(E)} Ass_B(G/pG)

Th: (A,m) -> (B,n) noeth locaux
M/A fini, N/B fini, N/A plat. Alors
depth_B(M \tens_A N)= depth_A M+depth_B(N/mN)

Cor: Si B/A plat, F=B/mB
- depth B=depth A + depth F
- B is CM <=> A et F sont CM

Th (même notations):
- B régulier => A régulier (mais pas forcément F)
- A et F rég => B rég

Conditions R et S
-----------------

(Ri): A_P régulier si P de codim <= i
(Si): depth A_P >= min(codim P,i) \forall P in Spec A
(ie depth A_P = codim P si codim P <=i)

ex: S1 <=> les premiers associés sont minimaux
    Si pour tout i <=> A CM
    R0+S1 => A réduit
    Si A intègre, S2 <=> tout diviseur premier d'un idéal principal non nul
    est de codimension 1.

Th (Serre): A normal <=> R1+S2
(A normal ssi A_p intégralement clos pour tout p \in Spec A ssi A=\prod
A_i, A_i int clos)

Th: (A,m) -> (B,n) locaux noeth, B/A plat
(i) B satisfait (Ri) => A aussi
(ii) A et B\tens k(p) satisfont (Ri) pour tout p => B aussi
De même pour (Si)

Cor: B normal (resp réduit) => A aussi
     A et les fibres de A->B sont normales (resp réduit) => B aussi

VII Platitude générique
=======================

A intégral noeth, M/A fini, alors il existe f\in A tel que M_f libre sur A_f.

Pr: en général si A anneau, M/A fini, alors U_r={p \in Spec A | M_p peut
être généré par r éléments} est ouvert, et si M/A prés fini, alors U={p \in
Spec A | M_p libre} est ouvert.

Vient du
Th: (Topological Nagata criterion)
A noeth, U \subset Spec A. Alors U ouvert <=>
  (i) \for all p,q \in Spec A, p \in U et q se spécialise en p => q \in U
  (ii) si p \in U, U \inter Var(p) est non vide

Application:
Th: A noeth, B/A de type fini, M/B fini
    Alors {q \in Spec B, M_q plat sur A} est ouvert

Rem: si A noethérien, B/A type fini est plat, Spec B -> Spec A ouvert.

Généralisation
--------------

Lemme: Si B noeth, C=B[x], E/C fini, F \subset E finie sur B, E=CF
Alors D=E/F a une filtration 0=G_0 \subset G_i \subset D tel que D=\union
G_i et G_i+1/G_i sont isomorphes à un nombre fini de B-modules finis.

Th: si A noeth intégral, R/A algèbre de type fini, S/R algèbre de type fini,
E/S fini, M \subset E finie sur R, N \subset E fini sur A, D=E/(M+N); alors
il existe a \in A tel que D_a soit libre.
