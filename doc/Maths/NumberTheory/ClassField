vim: ft=markdownlight fdm=expr

Corps des classes global
========================

Réf: Cox: on primes of the form x^2+ny^2 p.159

Module m=\prod p^n_p où le produit est fini et
- n_p=0 sur les places à l'infini
- n_p<=1 sur les places réelles
Ie m=m_0 m_infini avec m_infini un produit de places réelles distinctes

I_K(m)=idéaux fractionnaires premiers à m
P_K,1(m)=idéau principaux aO_K ou a=1 mod m_0 et v(a)>0 aux places réelles
de m_infini.
P_K,1(m) est d'indice fini dans I_K(m), un groupe de congruence est un
groupe P_K,1(m)\subset H \subset I_K(m); I_K(m)/H est un groupe de classe
généralisé.

Ex: pour un corps quadratique imaginaire, m=m_0, O conducteur d'ordre m
H=P_K,Z(m) (ie les élélements congru à a mod m_0, a premier à m),
le groupe de classe est le groupe de Picard de O.

Réciprocité d'Artin
-------------------

Soit L/K une extension abélienne non ramifiée en dehors de m.
Le symbole d'Artin (L/K, p) \in Gal(L,K) [normalement le frobenius est
défini à conjugaison près sur un idéal premier non ramifié, mais on est
abélien là...] s'étend multiplicativement en (L/K,I), d'où un morphisme
Phi_m: I_K(m)->Gal(L/K).

Théorème 8.2:
- Phi_m est surjectif [cf Cebotarev on a une densité 1/Gal(L/K) pour que
  l'image d'un premier soit un élément donné du groupe de Galois]
- Le noyau H de Ker Phi est un groupe de congruence si les exposants de m
  sont assez grand, ie Gal(L/K) est un groupe de classe.
  [dans ce cas on a même H=N_{L/K}(I_L(m)) P_K,1(m) cf (8.21) p. 173]

Théorème 8.5:
- il existe un plus petit module f(L/K) (le conducteur de l'extension) qui
  satisfait le th 8.2. En particulier une place est ramifiée ssi elle
  divise f, et un module m du théorème 8.2 est telle que Ker Phi_m est un
  groupe de congruence ssi f \mid m.
  Il suffit de le définir comme le pgcd des modules m tels que L soit
  inclus dans le ray class field de rayon m.

[cf Exo 9.20, le ring class field d'un ordre quadratique imaginaire O de
conducteur f est (f/2)O_K si f=2f', f' impair et 2 splitte complétement
dans O_K; et fO_K sinon [avec les exceptions dégénérées ou le conducteur
est O_K quand f=2 ou 3 et K=Q(\sqrt(-3)) et f=2 avec K=Q(i)].
Autrement dit, si f=2 et 2 splitte complétement (ou un des cas dégénérés),
alors le ring class field=le corps de classe de Hilbert, ie
Pic(O)=Cl(O_K).]
[Wikipedia: http://en.wikipedia.org/wiki/Conductor_%28class_field_theory%29
le conducteur est le produit des conducteurs locaux,
où localement f(Lp/Kp) est le plus petit n tel que U^(n)=1+p^n soit inclus
dans N_{L/K}(L*)=Ker Artin Map. p est non ramifié ssi f=0, p est
modéremment ramifié ssi f=1.]
[Attention: f(L/K) \mid f(M/K) n'implique pas L \subset M
cf http://math.stackexchange.com/questions/729295/abelian-extensions-under-inclusion-and-their-conductors]

Théorème 8.6 (existence):
- Si H est un groupe de congruence pour m, il existe une extension
  abélienne L/K ramifiée exactement aux places de m tel que
  H=\Ker \Phi_m

Example: K=Q, L=Q(\zeta_m), \frak{m}=m \infinity
\Phi_m: I_Q(m)->(Z/mZ)* satisfait
\Phi_m(a/b Z)=[a]/[b] dans (Z/mZ)* (ici a/b>0 et a et b premiers à m)
montre que \ker Phi_m=P_Q,1(m)

Corollaire 8.7:
L,M ext abéliennes de K. Alors L \subset M ssi'il existe un module m
divisible par les conducteurs de L et M tel que Ker \Phi_M,m \subset Ker
\Phi_L,m.
=> Kronecker-Weber: une ext abélienne K de Q est inclus dans Q(\zeta_m), où
m \infity est divisible par le conducteur de K.

Th 8.10: le corps abélien H_K correspondant à m=1 et H=P_K est le corps des
classe de Hilbert; on a donc Cl(O_K)=Gal(H_K/K). C'est l'extension
abélienne maximale non ramifiée.
Le ray class field correspond à I_K(m)/P_K,1(m) [ex: Q(\zeta_m) est le ray
class field de module m\infity]
Le ring class field à I_K(m)/P_K,Z(m)

TODO: p.165 nth power Legendre symbol, weak reciprocity, strong reciprocity
using the nth power Hilbert symbol from local class field theory.

Théorème de Densité de Cebotarev
--------------------------------

L/K ext Galoisienne de corps de nombre, P premier au dessus de p non ramifié.
\sigma=(L/K,P) lift du Frobenius, la classe de conjugaison de \sigma est
donnée par les (L/K, gP). Donc (L/K,p) est bien défini à conjugaison près.

Théorème 8.17:
{p premier de K, non ramifié dans L et (L/K,p) \in S} (S \subset Gal(L/K)
stable par conjugaison) a pour densité |S|/|Gal(L/K)|

Rappel: (L/K,p)=1 <=> p splitte complétement dans L, donc on a une densité
de 1/|G| de tels premiers (et ils caractérisent entièrement L):

Théorème 8.19:
  S_L/K=premiers splittant complétement.
  Si L/K et M/K sont Galoisiens, alors
- L \subset M ssi S_M/K \subset S_L/K (a un nombre fini près)
- L=M ssi S_M/K=S_L/K (a un nombre fini près, et donc on a forcément
  une vraie égalité du coup)
Plus précisément, si L/K et M/K ext finies alors
- Si M/K Galoisien, L \subset M <=> S_M/K \subset S_L/K (a un nombre fini près)
- Si L/K Galoisien, L \subset M <=> Stilde_M/K \subset S_L/K (a un nombre fini près) où Stilde_M/K=premiers p non ramifiés dans L et il existe un P au dessus de p avec f(P/p)=1.

Normes et idèles
----------------

CC_K=II_K/K* (idèles sur idèles principales) est le idèle class group.
Si L/K abélien, application d'Artin \Phi_L/K: CC_K->Gal(L/K)) est continue
et surjective, dont le noyau H est un sous-groupe fermé d'indice fini de CC_K
(et réciproquement tout tel sous-groupe correspond à une extension
abélienne). Le noyau H est simplement N_{L/K}(CC_L) dans CC_K.

cf aussi
http://www.madore.org/~david/weblog/d.2014-05-19.2202.corps-de-classes.html
sur le role des idèles diagonales

Corps des classes local
=======================
http://en.wikipedia.org/wiki/Local_class_field_theory

L/K ext abélienne finie
Loi de réciprocité induit une bijection de K*/N(L*)=Gal(L/K)
Plus généralement si L/K fini
on a K*/N(L*)=Gal(L/K)^ab
et donc globalement on a en recollant au niveau des idèles
CC_K/N_{L/K}(CC_L)=Gal(L/K)^ab


Cebotarev
=========

http://en.wikipedia.org/wiki/Chebotaryov_density_theorem
