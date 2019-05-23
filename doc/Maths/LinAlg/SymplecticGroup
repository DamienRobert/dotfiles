vim: ft=markdownlight fdm=expr

Groupe symplectique
===================

Cf Papers/Maths/Symplectic:
- http://www.maths.ed.ac.uk/~aar/papers/mschap.pdf
Linear Symplectic Geometry Chapter
- http://webzoom.freewebs.com/cvdegosson/symplectic%20group.pdf
The Symplectic Group
- Canonical Forms for Hamiltonian and Symplectic Matrices and Pencils
Links between unitary/orthogonal/symplectic matrices:
- http://math.ucr.edu/home/baez/symplectic.html

http://en.wikipedia.org/wiki/Symplectic_matrix
Le déterminant d'une matrice symplectique est 1.
(Il est trivialement +-1, il est 1 sur C ou R pour des raisons de
connexité, plus généralement la preuve est un peu plus délicate).

M est symplectique si M* J M=J
où J=(0 1; -1 0)
ou encore diag(0 1;-1 0)
Le pol car de M est alors un polynôme réciproque
(cf http://planetmath.org/characteristicpolynomialofasymplecticmatrixisareciprocalpolynomial): si x est valeur propre, 1/x également.

L'algèbre de Lie sont les matrices symplectico-symétriques, ie M telles que
JM=-M*J, ie M=-JM*J.
Remarque:
- le groupe de Lie de O(n) sont les matrices symétriques
- comme J^2=-1 et J*J=1, le groupe de Lie sp(n) est exactement
  l'algèbre JM, M symétrique.
  (et JM est alors symplectico-antisymétrique, ie <=> M=JM*J)
Et l'algèbre de cartan de sp(n) sont les matrices de la forme
(D 0; 0 -D) où D est diagonale.

With J in standard form, the inverse of M is given by
    M^{-1} = J^-1 M^T J=(D^T  -B^T ; -C^T  A^T)
en particulier, conjuguer une matrice JA via M symplectique revient à
conjuguer A comme forme quadratique via M:
M^-1 JA M=-M^T A M.

Le groupe symplectique est engendré par (A 0; 0 t_A^{-1}),
(1 B;0 1) (B symétrique) et S (ou (1 0;C 1) avec C symétrique).

http://homepages.wmich.edu/~mackey/detsymp.pdf
- Dans la décomposition QS (polard décomposition), si M est symplectique, Q
et S le sont aussi. Donc Q est orthogonale symplectique et S symétrique
(définie positive) symplectique
Q est de la forme [A B; -B A], et SpO(2n,R) est même isomorphe à U(n) via
A+iB -> [A B; -B A]
- Dans la décomposition QR, on peut aussi prendre Q dans SpO(2n,R), et
prendre R=(A B; 0 -A^T) où A est triangulaire supérieure.

- Une matrice diagonale telle que si lambda est valeur propre, alors
  1/lambda aussi est symplectique.

Remarque: t_J=J^{-1}=-J
Pour la forme symplectique, on a \tilde{u}=J \transp{u} t_J
et u est symplectique ssi \tilde{u}=u^{-1}

Symplectic block diagonalisation
================================

* http://mathoverflow.net/questions/164145/symplectic-block-diagonalization-of-a-complex-symmetric-matrix

Given a complex symmetric 2n×2n-matrix A, i.e., A∈ℂ2n×2n with A=AT. Is it possible, to block-diagonalize A using a (complex) symplectic matrix R, i.e., is there always a matrix R∈ℂ2n×2n with
R^T J R=J such that R^T A R=(0 D; D 0),
[Rem: (0 D; D 0) est conjuguée à (D 0; 0 -D)]

This fails even for n=1. In this case, the matrix
A=(1 0;0 0)
can't be diagonalized in the form that you want because it's not zero, yet its determinant vanishes.
There is a test for when this can be done, though. It's enough to have JA be semi-simple (i.e., diagonalizable). In this case, the eigenvalues of JA come in opposite pairs, and, if λ1,…,λn,−λ1,…,−λn is a list of the eigenvalues of JA, then you can let D be the diagonal matrix whose entries are λ1,…,λn.
The thing you want to think about is that the Lie algebra of the symplectic group is exactly the set of matrices of the form JA where A is symmetric, and you are trying to conjugate JA into the Cartan subalgebra consisting of the diagonal matrices of this form via the adjoint representation of the symplectic group on its Lie algebra.
(It's a general fact that you can conjugate the semi-simple elements of the Lie algebra into a Cartan subalgebra via the adjoint action, but you can't conjugate the nilpotent elements into a Cartan subalgebra.)

* http://mathoverflow.net/questions/123765/symplectic-block-diagonalization-of-a-real-symmetric-hamiltonian-matrix

Yes, you can always do this. The right way to understand this is to look at the complex symmetric matrix X=x+iy. You want to act on this by a complex matrix C=c+is where C is unitary, by the rule, X↦CTXC, and you want to know whether you can arrange that CTXC is a real, diagonal matrix.
You can do this, in two stages: First, look at the Hermitian symmetric matrix H=X¯X=H¯T. When you act by C, the matrix H will transform as H↦C¯THC. Thus, one can choose C to that H is diagonal and hence real. In particular, one is reduced to the case in which X=x+iy satisfies xy−yx=0. Thus, x and y are commuting symmetric matrices and hence they can be simultaneously diagonalized by a real orthogonal matrix. Thus, you can now assume that x and y are diagonal.
Second, let C be diagonal and unitary and let it act on a diagonal X by X↦CTXC. Since the diagonal elements of C are unit complex numbers, we can clearly choose them so that the entries of CTXC are real and nonnegative, which is what you wanted.

Sous-espaces caractéristiques
=============================

sciences.maths                        Message 21141/21234
> Si M est une matrice symplectique, il est facile de voir que son polynôme
> caractéristique P est un polynôme égal à son polynôme réciproque.
> Si Q_1 est un polynôme irréductible divisant P, je note Q_2 son polynôme
> réciproque, qui divise donc aussi P.
> 
> Est-ce que la forme symplectique, restreinte à la somme des espaces
> caractéristiques de Q_1 et Q_2 reste non dégénérée?

Groumpf, c'est malin de poser des questions intéressantes pendant les
vacances, alors que j'ai plus ou moins promis d'être sage et de ne pas
(trop) faire de maths.

Si je ne dis pas trop de bêtises : je note P = ppcm(Q1,Q2)^d R, où R
est premier avec Q1 et Q2. Le sous-espace W qui t'intéresse est
exactement le noyau de ppcm(Q1, Q2)^d (M), donc l'image de R(M). Si je
choisis e dans W, alors il s'agit donc de trouver f tel que f~ R(M)~ J
e != 0 (je note ~ pour la transposée, J pour la forme symplectique).
Il me semble que l'existence d'un tel f découle donc directement du
fait que R(M) e != 0 et de la non-dégénérescence de J, ou alors je dis
une grosse bêtise ?

| En fait ce qu'on veut c'est que
| \tilde{R(M)} e != 0 où \tilde dénote le conjugué pour la forme
| symplectique. Comme M est symplectique, il faut donc montrer que
| R(M^-1)e != 0.
| Mais par choix de P, comme P et le polynôme carac de M sont réciproques, R
| l'est aussi, donc R(M^-1)=R(M) cqfd.
| [C'est là qu'intervient le besoin de prendre pour P le produit des deux
| espaces caractéristiques conjugués]
| 
| Merci!
| 
| Et bien sûr tout ceci se généralise aux q-formes symplectiques, en
| particulier au couplage de Weil d'une variété abélienne sur un corps fini
| F_q. Je m'étais toujours dis que la bonne généralisation des groupes
| appelés G_1=(\Ker \pi-1) et G_2=(\Ker \pi-q) en crypto sur les courbes
| elliptiques était de passer aux espaces caractéristiques!

Générateurs
===========

* http://mathoverflow.net/questions/65941/generating-the-symplectic-group

->  Have you already tried to use the relations in Stanek's (freely available) paper http://www.ams.org/journals/proc/1963-014-05/S0002-9939-1963-0153748-8/S0002-9939-1963-0153748-8.pdf

(Note: they are given in a better form in
http://link.springer.com/article/10.1007%2FBF01433472#page-1
    Joan S. Birman
Mathematische Annalen
1971, Volume 191, Issue 1, pp 59-68
On Siegel's modular group.)

The top answer gives an explicit presentation for Sp_4(\Z), from
BENDER, P. “Presentation of Symplectic Group Sp(4,Z) with 2 Generatrices and 8 Definitive Relations.” Journal of Algebra 65, no. 2 (1980): 328-331.

* http://mathoverflow.net/questions/123634/reference-on-generators-of-subgroups-of-symplectic-groups

-> give generators for \Gamma_0(n) for g=2
+ a ref to a theorem by Baas-Milnor-Serre
