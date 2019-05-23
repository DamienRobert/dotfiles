vim: ft=markdownlight fdm=expr

Diffie-Hellman 
==============

g^a, g^b -> g^(ab)=(g^b)^a

El Gamal:
Clé publique: (g, p=g^a)
Chiffrement: m->(g^k, s=p^k.m)
Déchiffrement: m=s/(g^k)^a

Signature [DSA]:
m->(g^k, s=(m-ag^k)/k)
Vérification: g^m=p^(g^k)(g^k)^s

ZK: Alice publie (g, p=g^a) [secret: a]
- Alice choisit x et envoit q=g^x
- Soit Bob demande x (et vérifie que q=g^x)
- Soit il demande s+x (et vérifie que q p=g^(s+x))

DLP
===
h=g^x

Baby steps, giant steps:
x=x_0+ux_1 où u=sqrt(N)
hg^(-x_0)=(g^u)^x_1
=> Intersection entre les hg^-m et les (g^u)^m

Pohlig-Hellmann: 
Soit N = \prod p_i la décomposition de N en facteurs premiers. 
Par les restes chinois, il suffit de trouver x mod p_i^e_i. 
On écrit alors x =x_0+px^1 + ··· + x_{e−1} p^{e−1}
Soit β = g^(N/p). Alors x_0 = log_β (h^(N/p)), car h^(N/p) = β^x = β^x_0 puisque β est d'ordre p; x_1 = log β (hg^(−x_0))^(N/p^2)...

Pollard:
m_k=g^u_k h^v_k k=1..20
On part de s_0=g^a_0 h^b_0 et on itère s_{i+1}=s_i*m_{Hash(s_i))
Collision s_i=s_j => h=g^((a_i-a_j)/(b_i-b_j))
i et j sont en O(sqrt(N)) [paradox des anniversaires]

Corps finis
-----------
Notations: p=L_q(l_p,c_p).

- Si l_p < 1/3, on est dans le cas petite caractéristique.
FFS: L_q(1/3,(32/9)^{1/3}) (=1.526)
Remplacé par le nouvel algo en L(1/4) et le quasi-poly:
L_q(l_p+\epsilon)

- Si 1/3<= l_p <2/3, cas de la moyenne caractéristique
GNFS/NFS-HD [JSLV06]: L_q(1/3,(128/9)^{1/3}=2.423)
Amélioré par le multiple NFS (MNFS) [BP14]: (2^13/3^6)^{1/3}=2.24
NFS with conjugation method [BGGM14]: (96/9)^{1/3}=2.201
Combiner les deux [Pierrot 2014]: MNFS-CM -> 2.156

   Cas frontière: l_p=1/3
-> La constante oscille entre 3^{1/3}(=1.442) et
(128/9)^{1/3} parce que dans certains cas (si c_p petit: c_p<(16/9)^{1/3})
on peut utiliser FFS plutôt que GNFS; cf Fig 2 p. 6 de l'article SNFS de
Cécile Pierrot et Antoine Joux.

- Si l_p>=2/3, cas de la grande caractéristique
NFS/GNFS: L_q(1/3,(64/9)^{1/3}=1.923)
Amélioré par le multiple NFS [Cécile+Razvan]: L_q(1/3,((92+26\sqrt{13})/27)^{1/3}=1.90)

   Cas frontière: l_p=2/3 [Pierrot 2014]
-> MNFS-CM commence en dessous de 2.1 et descend à 1.659;
ensuite pour c_p assez grand c'est MNFS avec la variante Joux-Lercier généralisé
pour le polynôme qui donne la même chose que MNFS: 1.90

Lemme amusant: An element of F_{p^n}=u \in F_p^d x Polynomial of degree n-d
-------------

 Mehdi: One small question to Arjen/Thorsten
 It is mentioned in your review that "it is an easy exercise in linear algebra to show that for d|n an element of F_{p^n} can be represented as a product of an element of F_{p^d} and a polynomial of degree n-d". This sounded easy enough at first, but Taechan and I tried to come up with a short proof and couldn't find one. What is the easy linear algebra argument that does the trick here?

-> Let F_{p^n} be represented as F_p[x]/(f) for an irreducible f of degree
n. In the following elements of F_{p^n} will be identified with polynomials
in F_p[x] of degree <=n-1.

Statement: Let d|n and s in F_{p^n}. Then there exists a non-zero u in
F_{p^d} such that su is polynomial of degree at most n-d.

Proof: For any i the map coeff_i: F_{p^n} -> F_p sending an element to its
i-th coefficient is F_p-linear. Since the map F_{p^d} -> F_{p^n} sending an
element t to ts is F_p-linear, the composition t \mapsto coeff_i(ts) is
also F_p-linear, as well as the map F_{p^d} -> (F_p)^{d-1} that sends t to
( coeff_{n-d+1}(ts),coeff_{n-d+2}(ts),...,coeff_{n-1}(ts) ). The dimension
(as F_p-vector space) of F_{p^d} is d, so that the kernel of the last map
is at least one-dimensional, thus contains a non-zero u.


Cas des courbes pairing friendly: SNFS
--------------------------------------
DLP on Curve = DLP on Fq => \sqrt{p}=L_q(1/3,c)
so p=L_q(1/3,2c)

[Joux-Pierrot 2013]:
p donné par un polynôme de degré \lambda

- Moyenne caractéristique: 1/3 <= l_p <2/3
L_q(1/3,(64/9)^{1/3}(1+1/\lambda)^{1/3})
- l_p=2/3
Varie entre L_q(1/3,(32/9)^{1/3}(1+1/\lambda)^{1/3})
et          L_q(1/3,(64/9)^{1/3}(1+1/\lambda)^{1/3})
- Haute caractéristique: l_p>2/3
L_q(1/3,(32/9)^{1/3})

[Cf Gaudry Razvan Kleinung Asiacrypt 2015: tower number field sieve, qui
est peut-être plus rapide en pratique]

Modèles
=======

Edwards
-------
Twisted Edward: $E: a x^2+y^2= 1+dx^2y^2$; Edward: a=1
  Addition of $P=(x_1,y_1)$ and $Q=(x_2,y_2)$:
  \[P+Q = \left( \frac{x_1 y_2 + x_2 y_1}{1 + dx_1 x_2 y_1 y_2}, \frac{y_1 y_2 - a x_1 x_2}{1 - dx_1 x_2 y_1 y_2} \right) \]

Montgomery:

Up to birational equivalence:
- Montgomery=Twisted Edwards 
- Elliptic+T of order 4 = Edwards
- Over F_q, q=3 mod 4, Montgomery=Edwards (Proof: in this case the
  Montgomery curve has a point of order 4)
  [And one can use an isogeny between the Edwards a=1 and the twisted
  Edwards a=-1 to speed up the arithmetic, see
  https://eprint.iacr.org/2014/027]
- E + 3 points of 2-torsion => 2-isogenous to twisted Edwards

Ed25519: http://blog.cr.yp.to/20140323-ecdsa.html

Curve25519
----------

Curve25519: la courbe y^2 = x^3 + 486662x^2 + x sur \F_{2^{255}-19} en format Montgomery
X25519: échange Diffie-Helmann avec les coordonnées (x:z) sur cette courbe
Ed2551: la courbe -x^2 + y^2 = 1 -\frac{121665}{121666}x^2y^2 (birationellement équivalente) au format Edward où on peut faire des signatures (sans entropie, à la différence de RSA)

http://en.wikipedia.org/wiki/EdDSA
http://en.wikipedia.org/wiki/Curve25519
http://ed25519.cr.yp.to/

The format: https://github.com/FredericJacobs/25519
RFC for a key to use both for X25519 and Ed25519: http://moderncrypto.org/mail-archive/curves/2014/000293.html
Deployment: http://ianix.com/pub/curve25519-deployment.html
Gpg: http://security.stackexchange.com/questions/34567/ecc-in-openpgp
     https://www.gnupg.org/faq/whats-new-in-2.1.html#ecc

How do Ed5519 keys work?
https://blog.mozilla.org/warner/2011/11/29/ed25519-keys/

New curves
----------

- https://hyperelliptic.org/EFD/
- http://safecurves.cr.yp.to/

Curve 25519
- http://ed25519.cr.yp.to/
-> http://nacl.cr.yp.to/index.html

Goldilock (Mike Hamburg)
- http://shiftleft.org/about/
- https://github.com/coruus/ed448-goldilocks

Brainpool
- http://www.ecc-brainpool.org/
- https://tools.ietf.org/html/rfc5639

* Newsgroup/ML: 
- http://moderncrypto.org/
- IETF: http://www.ietf.org/mail-archive/web/cfrg/current/threads.html

Multiplication scalaire
=======================

Double and add
--------------

On a récursivement:
- Si n=2m, nP=m(2P)
- Si n=m+1, nP=mP+P

d = d_0 + 2d_1 + 2^2 d_2 + \cdots + 2^m d_m

* Left to right (on commence par les bits de poids forts)

Q=P
for i from m to 0 do
  Q=2P
  if d_i==1 then Q = Q+P
Return Q

* Right to left (on commence par les bits de poids faibles):
On calcule les puissances de 2 et on les ajoute quand nécessaire

Q=0
for i from 0 to m do
  if d_i==1 then Q = Q+P
  P=2P
Return Q
