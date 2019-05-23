vim: ft=markdownlight fdm=expr

Complexités usuelles
====================

https://en.wikipedia.org/wiki/Computational_complexity_of_mathematical_operations

Multiplication: O(n log n log log n) (Schonage-Strasse)

Euclide/Euclide étendu: a par b => O(lob b) opérations pour un coût total
de O(log a log b).
Version rapide: http://planetmath.org/fasteuclideanalgorithm
(Knuth-Schnoage/Zimmerman-Stehle) => Otilde(log max (a,b))

Binary trees:
si on a m nombres de n bits sur lequel faire une opération associative
(multiplicaton/CRT/interpolation) qui double la taille et qui coûte
n^\alpha; alors la méthode naïve coûte
n^\alpha+(2n)^\alpha+...+(mn)^\alpha=O(n^\alpha m^{\alpha+1})
La méthode binary tree coûte a la hauteur h (on a 2^h éléments de taille
2^k n avec (k+h)=log_2(m)): 2^h (2^k n)^alpha
Pour un coût total si alpha=1 de O(log_2(m) m n)
                   si alpha>1 de O((mn)^\alpha)

Le même raisonnement marche pour "redescendre": si on veut calculer m
restes de division euclidiennes par des nombres de taille n; plutôt que de
les faire un par un

Ex: batch gcd http://facthacks.cr.yp.to/batchgcd.html

Divides and conquer
===================
If T(n)=aT(n/b)+O(n^d), alors
- T(n)=O(n^d) si d>log_b a
- T(n)=O(n^d log n) si d=log_b a
- T(n)=O(n^{log_b a}) si d<log_b a

Pr: cf http://www.cs.berkeley.edu/~vazirani/algorithms/chap2.pdf
On a un arbre de profondeur log_b n, et de largeur a^{log_b n}=n^{log_b a}
Au niveau k, on a a^k problèmes de complexités O(n/b^k)^d.
D'où un coût total de  n^d \sum_k O((a/b^d)^k); k<=log_b n
Si a/b^d < 1, le coût est O(du premier terme)=O(n^d)
Si a/b^d > 1 le coût est donné par O(du dernier terme)=O(n^d (a/b^d)^{log_b n})
   =O(n^{log_b a})
Si a/b^d=1 le coût est donné par O(n^d \log_b n)

En résumé:
il y a O(n^{log_b a}) noeuds; donc soit le nombre de noeus domine le coût
O(n^d) de reconstruction et c'est explorer l'arbre qui domine, soit le coût
de reconstruction domine le nombre de noeuds et c'est la dernière
reconstruction qui domine, soit c'est pareil et on prend un facteur log n.
