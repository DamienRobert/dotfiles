vim: ft=markdownlight fdm=expr

Sous-espaces matriciels
=======================

## Calculer la plus grande dimension d'un sous-espace vectoriel de matrices n×n dont tous les éléments non nuls sont inversibles

############ sciences.maths:9522

On peut faire autant qu'on veut, et un lecteur (anonyme[#]) de mon
blog me souffle la démonstration suivante : soit V un vectoriel réel
muni d'une forme quadratique q anisotrope.  On considère C(q)
l'algèbre de Clifford associée à cette situation (dont on rappelle
qu'elle est l'algèbre universelle munie d'une flèche de V et vérifiant
v·v=q(v) pour tout v dans V).  Alors les éléments non nuls de V, vus
comme éléments de C(q), sont inversibles : donc, si on plonge V dans
les endomorphismes linéaires de C(q) par multiplication à gauche, on
obtient bien des matrices de déterminant non nul sauf pour v=0.
Précisément, cela fournit un sous-espace vectoriel de dimension d des
matrices de rang n=2^d tel que seule la matrice nulle ne soit pas
inversible.

############# sciences.maths:9532

 # Les nombres suivants sont égaux:

(1) la dimension maximale d(n,R) d'un sous-espace vectoriel de M(n,R) dont
tous les éléments non nuls sont des matrices inversibles
(2) la cardinalité maximale u(n) d'une famille de champs de vecteurs sur
R^n\{0} contenant le champ de vecteur radial, et formant une famille libre
en tout point
(2') comme en (2), mais en se restreignant à des champs de vecteurs
linéaires (i.e. donnés par X->AX, A une matrice)
(3) v(n)+1, où v(n) est le cardinal maximal d'une famille de champs de
vecteurs sur la sphère S^{n-1}, formant en tout point une famille libre
(4) U(n) = 2^c + 8d, où n=(2a+1).2^(c+4d), c=0,1,2,3

petit tableau:
 n   1 2  3 4  5 6 7 8  12  16 32 64 128 256 512 1024 2048 4096
U(n) 1 2  1 4  1 2 1 8  4   8  10 12 16  16  18   20   24   24

On a en particulier que U est invariant par multiplication par un nombre
impair, et la majoration U(n)<= 2(log_2(n)+1), atteinte quand n vaut
certaines puissances de 2.

Pr:
L'équivalence de (1) et (2') n'est pas difficile. Montrer que (2')
équivaut à (4) fait appel à la théorie des représentations.
Par ailleurs, l'équivalence de (2) et (3) est évidente, tandis que
l'équivalence de (2) et (4) est difficile, relève de la topologie
algébrique, et contient comme corollaire la caractérisation des sphères
parallélisables.

 # On peut s'intéresser à d(n,K) pour un corps K autre que R.

- d(n,K)=1 pour tout n>=1 si (et seulement si) K est algébriquement clos
- d(n,K)<= n pour tout n
- Pour K de caractéristique différente de 2, d(2,K)=1 ssi tout élément de
K possède une racine carrée
- d(n,K)=n si K possède une extension de degré n (ou, plus généralement,
un corps gauche de degré n)

## trouver la plus grande dimension d'un sous-espace vectoriel de matrices n×n dont aucune n'est inversible (ou plus généralement, dont le rang est borné par r) :
############# sciences.maths:2590
Soit E un sev de M_n(K) et r le plus grand rang des éléments
de E. Alors dim E <= nr.
############# sciences.maths:2605
C'est vrai, la preuve est dans un Bourbaki d'algèbre, je ne sais plus
lequel.
Voilà une preuve pour la dimension maximale d'un sous-espace ne contenant
 que des matrices non inversibles (on en a parlé il n'y en a pas longtemps
avec Sylvain et Hugues). C'est du bricolage, mais amusant quand meme:
i)- Si pour tout n, K a un polynome irréducible de degrés n, la matrice
compagnon de ce polynome engendre un sous-corps de M_n(K), qui n'intersecte
pas ton sous-espace, ca conclut.
ii)- La propriété passe à l'extension des scalaires si K est infini:
 Si V est ton sous-espace de M_n(K), K inclus dans L, LV est un sous-espace
de M_n(L) ne contenant que des matrices non inversibles car si E_i est une
base de V sur K, det( x_1 E_1 + ... + x_n E_n) est en polynome en les x_i
nul dur K infini donc nul et donc nul sur L aussi. dim_L LV=dim_K V
iii)- Si K est fini on est dans i), sinon, on l'inclut dans un corps K(T)
qui vérifie i) (par exemple, X^n - T est irréductible par eisenstein), et on
conclut par ii).
La meme preuve montre que l'on peut (en remplacant det par des mineurs) pas
mal modifier le corps quand il est infini.
############# sciences.maths:17908
Soit E un sous-espace vectoriel de M_n(K) dont le rang des éléments
est borné par r.  On peut manifestement supposer que E contient la
matrice J_r qui a r 1 sur la diagonale puis que des 0.

Maintenant, si M = (A B \\ C D) est une autre matrice de E (découpée
au niveau des r premières lignes et r premières colonnes, de sorte que
A est r×r), considérons la matrice J_r + epsilon·M (Alain fait M+x·J_r
mais je pense que c'est plus clair d'imaginer une petite perturbation
de J_r).  Comme le rang de cette matrice est au plus r, le déterminant
de toute matrice (r+1)×(r+1) contenant la matrice supérieure gauche
I_r + A doit être nul : développons ce déterminant par rapport à
epsilon : le terme d'ordre 1 est d·trace(A) où d est un certain
scalaire issu de D, et le terme d'ordre 2 est le produit scalaire c·b
d'un vecteur ligne c issu de C et d'un vecteur colonne b issu de B,
bref, tout ça doit être nul.  Donc on a prouvé que dans M le bloc D
est complètement nul et les blocs B et C vérifient C·B = 0.

Bon, les blocs A possibles, ils sont de dimension r², les blocs D, de
dimension 0 (il n'y a que 0), et on cherche donc à trouver la
dimension des couples (B,C) possibles.  On va transposer le bloc C
pour y voir plus clair, et alors H=tC et B vivent dans M_{r,n-r}(K).
Soit V l'ensemble des couples (tC,B) pour une certaine matrice M dans
E (la projection de E sur ces coordonnées, quoi).

La question devient donc : si j'ai un sous-espace vectoriel V de
M_{r,n-r}(K)² formé de couples (H,B) tels que toujours tH·B = 0,
comment majorer sa dimension ?  En introduisant la forme bilinéaire
<(H,B),(H',B')> -> trace(tH·B'+tH'·B) (je crois qu'Alain avait mélangé
les facteurs), on voit qu'elle est non dégénérée sur M_{r,n-r}(K)² et
que V est totalement isotrope (car si (H,B) et (H',B') sont dans V
alors leur somme aussi, ce qui donne tH·B'+tH'·B=0), ce qui majore la
dimension de V par ½·2r(n-r) = r(n-r) = nr-r².

Du coup, on a dimension nr-r² pour les couples (B,C) plus haut, et en
comptant avec r² pour les blocs A, ça majore la dimension de E par nr,
ce qu'on voulait prouver.

Déterminants
============

Nilpotent <=> Trace des puissances = 0
http://math.stackexchange.com/questions/159167/trace-of-powers-of-a-nilpotent-matrix
(pour le <= il suffit d'avoir la trace de A^k=0 pour k=1..n)
[plus généralement par Newton en car 0 tr(M^k)=tr(N^k) <=> M et N ont même
pol car]

Recursion formula for the higher traces (of exterior product) giving the
coeffs of the characteristic polynomial:
http://math.stackexchange.com/questions/23899/formulas-for-the-top-coefficients-of-the-characteristic-polynomial-of-a-matrix

Déterminants particuliers
-------------------------

Matrice trigonales: http://www.les-mathematiques.net/phorum/read.php?3,1119099
Vandermonde


Injection, Surjection et Mineurs
--------------------------------

sciences.maths                  Message 15016

Si je ne m'abuse (je n'ai pas vérifié très soigneusement, donc
peut-être que je me plante), un h:A^m->A^n est

* injectif ssi /\^m(h):A->/\^m(A^n) est injectif (i.e., les C_n^m
  coordonnées, qui sont les mineurs m×m de h, n'ont pas de diviseur de
  zéro commun),

* surjectif ssi /\^n(h):/\^n(A^m)->A est surjectif (i.e., les C_m^n
  coordonnées, qui sont les mineurs n×n de h, engendrent l'idéal
  unité).

Exemples:
- il n'y a pas d'injection de A^m dans A^n si m>n
  [Preuve directe: si A est intégère, on tensorise par Frac A qui est plat.
  Si A est noéthérien on localise en un idéal premier minimal pour se
  ramener au cas artinien et on compare la longueur des modules. Dans le
  cas général on fait une descente Noethérienne, cf forum.maths:10830]
- il n'y a pas de surjection de A^m dans A^n si m<n
- Si n=m, h monomorphisme <=> dét h non diviseur de 0, et
  h épi <=> dét h inversible <=> h iso.

Critère de postivitié d'une matrice symétrique
----------------------------------------------
http://fr.wikipedia.org/wiki/Matrice_d%C3%A9finie_positive

 Critère de Sylvester

Pour qu'une matrice A=\big(a_{ij}\big)_{1\leqslant i,j\leqslant n}, réelle symétrique ou complexe hermitienne, soit définie positive, il faut et suffit que les n matrices A_p=\big(a_{ij}\big)_{1\leqslant i,j\leqslant p}, pour p de 1 à n, aient leur déterminant strictement positif, autrement dit que les n mineurs principaux dominants soient strictement positifs.

Remarque 1. Pour n=2, le critère de Sylvester est essentiellement le critère de positivité du trinôme du second degré.

Remarque 2. Plus généralement, l'indice d'une matrice symétrique réelle est égal au nombre de changements de signes dans la suite de ses n+1 mineurs principaux (en incluant \det(A_0)=1), sous réserve que tous soient non nuls.

Remarque 3. En fait sur un corps (commutatif) quelconque, cette condition de non-nullité des mineurs principaux est une condition nécessaire et suffisante pour qu'il existe une matrice Q triangulaire supérieure telle que {}^tQAQ soit diagonale et de rang maximum (il suffit d'adapter la démonstration qui suit).

Preuve. Notons q la forme quadratique associée à A, définie par q(\mathbf{x})=\sum_{1\leqslant i,j,\leqslant n}a_{ij}x_ix_j.

La condition est nécessaire. On remarque d'abord que si q est définie positive, alors \det A>0. En effet, par rapport à une base orthogonale pour cette forme quadratique (il en existe, d'après la réduction de Gauss), la matrice de q s'écrit \mathrm{diag}(c_1,...,c_n) les c_i étant tous strictement positifs. Alors c_1...c_n=(\det A)(\det Q)^2 (Q étant la matrice de passage), donc \det A>0. Le résultat s'ensuit, en appliquant le même raisonnement à la restriction de q aux sous-espaces \R^k\times\{0\}^{n-k}, pour 1\leqslant k\leqslant n-1.

Montrons maintenant que la condition est suffisante. On procède par récurrence sur la dimension. Pour n=0 c'est évident puisqu'en dimension 0 l'ensemble des vecteurs non nuls est vide. Supposons la propriété vraie pour n-1 et notons E=\R^{n-1}\times\{0\}. Par hypothèse de récurrence, q_{\vert E} est définie positive. De plus, q est est non dégénérée (parce que le déterminant de A est non nul) donc

\,\R^n=E\oplus E^{\perp} \quad \textrm{avec} \quad \dim E^{\perp}=1

Soient e un vecteur non nul de E^{\perp} et a=q(e). Alors \det A et a\det A_{n-1} ont même signe d'après le même argument que dans la première partie (qui met implicitement en jeu le discriminant), or par hypothèse \det A et \det A_{n-1} sont strictement positifs. Donc a>0, si bien que la restriction de q à E^\perp est, elle aussi, définie positive, ce qui montre que q est définie positive.

Dans le cas complexe, la preuve est analogue, en considérant la forme hermitienne définie par la matrice.

Décomposition des matrices
==========================

http://en.wikipedia.org/wiki/Matrix_decomposition

## LU decomposition
    Applicable to: square matrix A
    Decomposition: A=LU, where L is lower triangular and U is upper triangular
    Related: the LDU decomposition is A=LDU, where L is lower triangular with ones on the diagonal, U is upper triangular with ones on the diagonal, and D is a diagonal matrix.
    Related: the LUP decomposition is A=LUP, where L is lower triangular, U is upper triangular, and P is a permutation matrix.

Any square matrix A admits an LUP factorization. If A is invertible, then it admits an LU (or LDU) factorization if and only if all its leading principal minors are nonsingular. If A is a singular matrix of rank k , then it admits an LU factorization if the first k leading principal minors are nonsingular, although the converse is not true.

If a square, invertible matrix has an LDU factorization with all diagonal entries of L and U equal to 1, then the factorization is unique. In that case, the LU factorization is also unique if we require that the diagonal of L (or U) consists of ones.

## Rank factorization

    Applicable to: m-by-n matrix A of rank r
    Decomposition: A=CF where C is an m-by-r full column rank matrix and F is an r-by-n full row rank matrix
    Comment: The rank factorization can be used to compute the Moore-Penrose pseudoinverse of A, which one can applies to obtain all solutions of the linear system Ax=b.

## Cholesky decomposition

    Applicable to: square, symmetric, positive definite matrix A
    Decomposition: A=U^TU, where U is upper triangular with positive diagonal entries
    Comment: the Cholesky decomposition is unique
    Comment: the Cholesky decomposition is also applicable for complex hermitian positive definite matrices
    Comment: An alternative is the LDL decomposition which can avoid extracting square roots.

## QR decomposition

    Applicable to: m-by-n matrix A
    Decomposition: A=QR where Q is an orthogonal matrix of size m-by-m, and R is an upper triangular matrix of size m-by-n
    Comment: The QR decomposition provides an alternative way of solving the system of equations Ax=b without inverting the matrix A. The fact that Q is orthogonal means that Q^TQ=I, so that Ax=b is equivalent to Rx=Q^Tb, which is easier to solve since R is triangular.

## Polar Decomposition

The polar decomposition of a square complex matrix A is a matrix decomposition of the form A = UP
where U is a unitary matrix and P is a positive-semidefinite Hermitian
matrix. Intuitively, the polar decomposition separates A into a component
that stretches the space along a set of orthogonal axes, represented by P,
and a rotation represented by U.

## Singular value decomposition

    Applicable to: m-by-n matrix A.
    Decomposition: A=UDV^H, where D is a nonnegative diagonal matrix, and U and V are unitary matrices, and V^H denotes the conjugate transpose of V (or simply the transpose, if V contains real numbers only).
    Comment: The diagonal elements of D are called the singular values of A.
    Comment: like the eigendecomposition below, the singular value decomposition involves finding basis directions along which matrix multiplication is equivalent to scalar multiplication, but it has greater generality since the matrix under consideration need not be square.

## Composantes principales:

http://en.wikipedia.org/wiki/Proper_orthogonal_decomposition

PCA is mathematically defined as an orthogonal linear transformation
that transforms the data to a new coordinate system such that the greatest
variance by some projection of the data comes to lie on the first
coordinate (called the first principal component), the second greatest
variance on the second coordinate, and so on.

The principal components transformation can also be associated with another matrix factorisation, the singular value decomposition (SVD) of X,
X=U \Sigma W^T
Here Σ is a n-by-p rectangular diagonal matrix of positive numbers σ(k), called the singular values of X; U is an n-by-n matrix, the columns of which are orthogonal unit vectors of length n called the left singular vectors of X; and W is a p-by-p whose columns are orthogonal unit vectors of length p and called the right singular vectors of X.

In terms of this factorisation, X^T X=W \Sigma^2 W^T
Comparison with the eigenvector factorisation of X^TX establishes that the right singular vectors W of X are equivalent to the eigenvectors of X^TX, while the singular values σ_k of X are equal to the square roots of the eigenvalues λ_k of X^TX.

Using the singular value decomposition the score matrix T can be written
T=XW=U\Sigma
so each column of T is given by one of the left singular vectors of X multiplied by the corresponding singular value.

Autrement dit on regarde la matrice symétrique X^T X=W \Sigma^2 W^T
Le changement de variable T=XW donne la matrice T=U \Sigma
ie l'élément de plus grande variance suivi d'une rotation
donc les vecteurs T_i correspondent aux éléments de plus grande variance
successives (via des projections orthogonales)

Type de Matrices
================

## Orthogonal matrices:
http://en.wikipedia.org/wiki/Orthogonal_matrix

Si Q est orthogonale, il existe P orthogonale telle que
P^-1 Q P= diag (R_1, ..., R_m, \pm 1, ..., \pm 1)
où R_i est orthogonale de rang 2:
(cos \theta, -sin \theta (rotation)
 sin \theta, cos \theta) ou
(cos \theta, sin \theta (reflexion)
 sin \theta, -cos \theta)

A number of important matrix decompositions (Golub & Van Loan 1996) involve orthogonal matrices, including especially:

    QR decomposition
        M = QR, Q orthogonal, R upper triangular.
    Singular value decomposition
        M = UΣV^T, U and V orthogonal, Σ non-negative diagonal.
    Eigendecomposition of a symmetric matrix (Decomposition according to Spectral theorem)
        S = QΛQ^T, S symmetric, Q orthogonal, Λ diagonal.
    Polar decomposition
        M = QS, Q orthogonal, S symmetric non-negative definite.

## Symmetric matrix
http://en.wikipedia.org/wiki/Positive-definite_matrix

Spectral theorem: S = QΛQ^T, S symmetric, Q orthogonal, Λ diagonal (réelle).

### Simultaneous diagonalization

A symmetric, and a symmetric and positive-definite matrix can be
simultaneously diagonalized (in terms of simultaneous diagonalisation of
two quadratic forms):
Let M be a symmetric and N a symmetric and positive-definite matrix.
X^T M X = Λ and X^T N X = I
(but note that this is no longer an orthogonal diagonalization; because X
may not be orthogonal. M and N are codiagonalisable via an orthogonal
diagonalisation when they commute as usual).

## Unitary matrix
Unitary: U*=U^-1

    U is diagonalizable; that is, U is unitarily similar to a diagonal matrix, as a consequence of the spectral theorem. Thus U has a decomposition of the form
        U = VDV^*
    where V is unitary and D is diagonal and unitary (so the values are of
    modulus 1).

## Hermition matrix
A=A*
    A=U D U^*, D diagonale hermitienne, ie réelle

## Normal matrix
Normal: AA*=A*A

A is normal if and only if there exists a unitary matrix U
such that
    A=U D U^*
where D is a diagonal matrix. Then, the entries of the diagonal of D are the eigenvalues of A. The column vectors of U are the eigenvectors of A and they are orthonormal. Unlike the Hermitian case, the entries of D need not be real.

Proposition. If A and B are normal with AB = BA, then both AB and A + B are also normal. Furthermore there exists a unitary matrix U such that UAU ∗ and UBU ∗ are diagonal matrices. In other words A and B are simultaneously diagonalizable. 

## Symplectic matrix
http://en.wikipedia.org/wiki/Symplectic_matrix

M^T \Omega M = \Omega
où \Omega^T=-\Omega (skew-symmetric)

Changement de base:
    \Omega \mapsto A^T \Omega A
    M \mapsto A^{-1} M A.
OPS que \Omega=(0 I; -I 0) ou que \Omega=\diag (0 1; -1 0)

Rem: M est simmilaire à M^-1 donc si \lambda est valeur propre, 1/\lambda
aussi, et \pm 1 est une valeur propre de multiplicité paire.
Ie le poly caractéristique est un poly réciproque.

Ex: http://mathoverflow.net/questions/123765/symplectic-block-diagonalization-of-a-real-symmetric-hamiltonian-matrix
  # Réduction symplectique de matrices hamiltoniennes symmétriques

http://gauss.uc3m.es/web/personal_web/fdopico/papers/SIMAX2009-symplectic.pdf
Décomposition de matrices symplectiques en (A 0; 0 D), et (1 B; 0 1) (1 0; C
1)

Smith Normal Form
=================

http://en.wikipedia.org/wiki/Smith_normal_form

Let A be a nonzero m×n matrix over a principal ideal domain R. There exist invertible m \times m and n \times n-matrices S, T so that the product S A T is
diag(d_1,...,d_r,0,...,0) with d_i \mid d_{i+1}

-> Sur un corps donne la forme rang

http://en.wikipedia.org/wiki/Hermite_normal_form

* A matrix with integer entries is in Hermite normal form (HNF) if
    All nonzero rows (rows with at least one nonzero element) are above any rows of all zeroes (all zero rows, if any, are at the bottom of the matrix).
    The leading coefficient (the first nonzero entry from the left, also called the pivot) of a nonzero row is always strictly to the right of the leading coefficient of the row above it; moreover, it is positive.
    All entries in a column above a leading entry are nonnegative and strictly smaller than the leading entry.
    All entries in a column below a leading entry are zeroes (implied by the first two criteria).

* Nonsingular square matrices
In particular, a nonsingular square matrix with integer entries is in Hermite normal form (HNF) if
  - it is upper triangular,
  - its diagonal entries are positive,
  - in every column, the entries above the diagonal are non-negative and smaller than the entry on the diagonal.

* Existence and uniqueness of the Hermite normal form

For every m×n matrix A with integer entries there is a unique m×n matrix H, in (HNF), with integer entries such that
    H=UA with U ∈ GLn(Z)
(i.e. U is unimodular).
Equivalently, H is the unique matrix in (HNF) with integer entries that can be obtained from A by means of a finite sequence of elementary row operations over Z (the only admissible row multiplications are by ±1).

-> Sur un corps donne la row echelon form
http://en.wikipedia.org/wiki/Row_echelon_form

Perron-Frobenius
================
http://en.wikipedia.org/wiki/Perron%E2%80%93Frobenius_theorem

Positive matrices
-----------------

Let A = (a_{ij}) be an n \times n positive matrix: a_{ij} > 0 for 1 \le i,j \le n . Then the following statements hold.

*    There is a positive real number r, called the Perron root or the Perron–Frobenius eigenvalue, such that r is an eigenvalue of A and any other eigenvalue λ (possibly, complex) is strictly smaller than r in absolute value, |λ| < r. Thus, the spectral radius \rho(A) is equal to r. If the matrix coefficients are algebraic, this implies that the eigenvalue is a Perron number.
*    The Perron–Frobenius eigenvalue is simple: r is a simple root of the characteristic polynomial of A. Consequently, the eigenspace associated to r is one-dimensional. (The same is true for the left eigenspace, i.e., the eigenspace for AT.)
*    There exists an eigenvector v = (v1,…,vn) of A with eigenvalue r such that all components of v are positive: A v = r v, vi > 0 for 1 ≤ i ≤ n. (Respectively, there exists a positive left eigenvector w : wT A = r wT, wi > 0.)
*    There are no other positive (moreover non-negative) eigenvectors except positive multiples of v (respectively, left eigenvectors except w), i.e., all other eigenvectors must have at least one negative or non-real component.
*    \lim_{k \rightarrow \infty} A^k/r^k = v w^T, where the left and right eigenvectors for A are normalized so that wTv = 1. Moreover, the matrix v wT is the projection onto the eigenspace corresponding to r. This projection is called the Perron projection.
*    Collatz–Wielandt formula: for all non-negative non-zero vectors x, let f(x) be the minimum value of [Ax]i / xi taken over all those i such that xi ≠ 0. Then f is a real valued function whose maximum is the Perron–Frobenius eigenvalue.
*    A "Min-max" Collatz–Wielandt formula takes a form similar to the one above: for all strictly positive vectors x, let g(x) be the maximum value of [Ax]i / xi taken over i. Then g is a real valued function whose minimum is the Perron–Frobenius eigenvalue.
*    The Perron–Frobenius eigenvalue satisfies the inequalities
        \min_i \sum_{j} a_{ij} \le r \le \max_i \sum_{j} a_{ij}.

Irreducible matrix
------------------

Let A be a square matrix (not necessarily positive or even real). The matrix A is irreducible if any of the following equivalent properties holds.

Definition 1 : A does not have non-trivial invariant coordinate subspaces. Here a non-trivial coordinate subspace means a linear subspace spanned by any proper subset of basis vectors. More explicitly, for any linear subspace spanned by basis vectors ei1 , ..., eik, n > k > 0 its image under the action of A is not contained in the same subspace.

Definition 2: A cannot be conjugated into block upper triangular form by a permutation matrix P:

    PAP^{-1} \ne \begin{pmatrix} E & F \\ 0 & G \end{pmatrix},

where E and G are non-trivial (i.e. of size greater than zero) square matrices.

If A is non-negative other definitions exist:

Definition 3: For every pair of indices i and j, there exists a natural number m such that (Am)ij is not equal to 0.

Definition 4: One can associate with a matrix A a certain directed graph GA. It has exactly n vertices, where n is size of A, and there is an edge from vertex i to vertex j precisely when Aij > 0. Then the matrix A is irreducible if and only if its associated graph GA is strongly connected.

This notion is reminiscent of that of a free action of a group, if one could somehow build a group out of 'A' (one may take \left\lbrace \exp(tA), t\in\mathbb{R}\right\rbrace in that case one also has an irreducible representation of that group).

A matrix is reducible if it is not irreducible.

Let A be non-negative. Fix an index i and define the period of index i to be the greatest common divisor of all natural numbers m such that (Am)ii > 0. When A is irreducible, the period of every index is the same and is called the period of A. In fact, when A is irreducible, the period can be defined as the greatest common divisor of the lengths of the closed directed paths in GA (see Kitchens[8] page 16). The period is also called the index of imprimitivity (Meyer[5] page 674) or the order of cyclicity.

If the period is 1, A is aperiodic.

A matrix A is primitive if it is non-negative and its mth power is positive for some natural number m (i.e. the same m works for all pairs of indices). It can be proved that primitive matrices are the same as irreducible aperiodic non-negative matrices.

A positive square matrix is primitive and a primitive matrix is irreducible. All statements of the Perron–Frobenius theorem for positive matrices remain true for primitive matrices. However, a general non-negative irreducible matrix A may possess several eigenvalues whose absolute value is equal to the spectral radius of A, so the statements need to be correspondingly modified. Actually the number of such eigenvalues is exactly equal to the period. Results for non-negative matrices were first obtained by Frobenius in 1912.

Perron–Frobenius theorem for irreducible matrices
-------------------------------------------------

Let A be an irreducible non-negative n × n matrix with period h and spectral radius ρ(A) = r. Then the following statements hold.

*    The number r is a positive real number and it is an eigenvalue of the matrix A, called the Perron–Frobenius eigenvalue.
*    The Perron–Frobenius eigenvalue r is simple. Both right and left eigenspaces associated with r are one-dimensional.
*    A has a left eigenvector v with eigenvalue r whose components are all positive.
*    Likewise, A has a right eigenvector w with eigenvalue r whose components are all positive.
*    The only eigenvectors whose components are all positive are those associated with the eigenvalue r.
*    Matrix A has exactly h (where h is the period) complex eigenvalues with absolute value r. Each of them is a simple root of the characteristic polynomial and is the product of r with an hth root of unity.
*    Let ω = 2π/h. Then the matrix A is similar to eiωA, consequently the spectrum of A is invariant under multiplication by eiω (corresponding to the rotation of the complex plane by the angle ω).
*    If h > 1 then there exists a permutation matrix P such that
        PAP^{-1}= \begin{pmatrix} 0 & A_1 & 0 & 0 & \ldots & 0 \\ 0 & 0 & A_2 & 0 & \ldots & 0 \\ \vdots & \vdots &\vdots & \vdots & & \vdots \\ 0 & 0 & 0 & 0 & \ldots & A_{h-1} \\ A_h & 0 & 0 & 0 & \ldots & 0 \end{pmatrix},
        where the blocks along the main diagonal are zero square matrices.
*    Collatz–Wielandt formula: for all non-negative non-zero vectors x let f(x) be the minimum value of [Ax]i / xi taken over all those i such that xi ≠ 0. Then f is a real valued function whose maximum is the Perron–Frobenius eigenvalue.
*   The Perron–Frobenius eigenvalue satisfies the inequalities
        \min_i \sum_{j} a_{ij} \le r \le \max_i \sum_{j} a_{ij}.

Further properties
------------------

Let A be an irreducible non-negative matrix, then:

*    (I+A)n−1 is a positive matrix. (Meyer[5] claim 8.3.5 p. 672).
*    Wielandt's theorem. If |B|<A, then ρ(B)≤ρ(A). If equality holds (i.e. if μ=ρ(A)eiφ is eigenvalue for B), then B = eiφ D AD−1 for some diagonal unitary matrix D (i.e. diagonal elements of D equals to eiΘl, non-diagonal are zero).[9]
*    If some power Aq is reducible, then it is completely reducible, i.e. for some permutation matrix P, it is true that: P A P^{-1}= \begin{pmatrix} A_1 & 0 & 0 & \dots & 0 \\ 0 & A_2 & 0 & \dots & 0 \\ \vdots & \vdots & \vdots & & \vdots \\ 0 & 0 & 0 & \dots & A_d \\ \end{pmatrix} , where Ai are irreducible matrices having the same maximal eigenvalue. The number of these matrices d is the greatest common divisor of q and h, where h is period of A.[10]
*    If c(x)=xn+ck1 xn-k1 +ck2 xn-k2 + ... + cks xn-ks is the characteristic polynomial of A in which the only non-zero coefficients are listed, then the period of A equals to the greatest common divisor for k1, k2, ... , ks.[11]
*    Cesàro averages: \lim_{k \rightarrow \infty} 1/k\sum_{i=0,...,k} A^i/r^i = ( v w^t), where the left and right eigenvectors for A are normalized so that wtv = 1. Moreover the matrix v wt is the spectral projection corresponding to r - Perron projection.[12]
*    Let r be the Perron-Frobenius eigenvalue, then the adjoint matrix for (r-A) is positive.[13]
*    If A has at least one non-zero diagonal element, then A is primitive

Relevement des valeurs propres
==============================

Sujet d'Ulm 1986 sur le théorème de Rellich
(Relevement C1 des valeurs propres d'un arc de matrices symétriques)
Sujet trouvé ici: http://concours-maths-cpge.fr/fichiers.php

Cf aussi son bouquin: http://archive.org/details/perturbationtheo00rell
(vers p55). Ou le sujet fait par Tosel dans mes archives papiers.

* Résumé:

- Un arc continu de polynômes (unitaires de degré n) admet un relevement
  continu des racines. Par contre, un arc C^infty n'admet pas forcément un
  relevement dérivable des racines.

- Il existe des arcs C^infty de matrices réelles diagonalisables qui
  n'admettent pas de relevement C^1 d'une valeur propre

- Par contre, un arc C^1 de matrices symétriques (ou hermitiennes) admet un
  relevement C^1 des racines du pol caractéristique.

  En dimension 2, c'est équivalent au fait que si f_1, f_2 sont C^1, alors
  il existe g C_1 tel que g^2=f_1^2+f_2^2 (et donc par récurrence, il
  existe g/ g^2=f_1^2+...+f_n^2).

  Ce n'est pas vrai pour C^2 à la place de C^1, ex
  (t^5 sin(1/t))^2+t^14 n'admet pas de racine carré C^2.

  En particulier, même un arc C^infty de matrices symétriques n'admet pas
  forcément de relévement C^infty des racines. Pour les vecteurs propres
  c'est pire, il n'y a meme pas relevement continu d'un vecteur propre,
  même pour un arc C^infty.

- En revanche, pour un arc analytique de matrices symétriques (ou
  hermitiennes), il existe un relevement analytique d'une base orthonormale
  de vecteurs propres.

Idée de la preuve
-----------------

Continuité/Dérivabilité en un point

1) Si f est une fonction continue de [a,b[ dans R, quelle est bornée, et que
l'ensemble de ses valeurs d'adhérences en b est fini, alors elle est
continue en b (en effet, comme f est continue, le TVI dit que les valeurs
d'adhérences sont connexes, donc s'il est fini il est réduit à un point, et
par locale compacité la valeur d'adhérence est une limite).

Pour les racines des polynomes ou les valeurs propres ça donne la
continuité en un point (car les racines sont bornées en les coeffs du
polynomes, et les valeurs d'adhérences sont des racines donc en nombre
fini).
Pour la dérivabilité des valeurs propres on vérifie que les valeurs
d'adhérences sont des valeurs propres de la matrice dérivée (projetée sur
l'espace propre de la matrice de départ), en prenant des sous suites
convergentes des vecteurs propres orthonormaux.

2) Récursion
Si P et Q sont unitaires premiers entre eux, le théorème d'inversion locale
dit que la multiplication des polynômes unitaires de même degré est un
difféomorphisme localement en (P,Q). Donc localement, si P n'est pas un
(X-a)^n, on peut se ramener à des degrés plus faibles et donc il existe un
relèvement local.

3) Recollement
Maintenant l'espace des polys de la forme (X-a)^n est fermé (car
l'application a-> (X-a)^n est propre), donc sur l'intervalle où l'arc est
défini, P(t) n'est pas de cette forme sur un ouvert Omega. Localement en
les points de Omega il y a un relèvement, des arguments de connexité
standard montre qu'il existe un recollement sur tout Omega (car en un point
de recollement, les deux suites de racines tendent vers des permutations
l'unes de l'autre, donc quitte à composer par cette permutation on peut
recoller). Sur le complémentaire F de Omega, le relèvement est forcément
(a,a,a,a,a,a), mais par le point 1) c'est facile de voir qu'on reste
continu.


Pour les matrices symétriques, l'idée est la même, localement quand ni M ni
M' ne sont des homothéties, de faire une récursion comme en 3.
Si P et Q sont des polynômes, alors x -> P(M)(x), Q(M)(x) a pour noyau P(M)
inter Q(M). Si P et Q sont premiers entre eux, ce noyau est nul. De plus
si PQ(M)=0, Im P(M) \subset Ker Q(M) et réciproquement, donc on a
V=Im P(M) \somme Im Q(M) = Ker Q(M) \somme Ker P(M).
Sur Im P(M(t)), Im Q(M(t)) on peut localement choisir des bases
orthonormées de manière C^infity, d'où la récurrence.
(Note amusante: le pol char de P(M) a pour racine les P(alpha_i), où les
alpha_i sont les racines du pol char de M -- on voit ça sur une
trigonolisation. Donc P(M) est inversible <=> P est premier avec le pol
char de M)!

Semi-simplicité
===============

Soit P le polynome car d'une matrice M agissant sur V, P_0 le polynôme minimal.

Si P_0=\prod Q_i^e_i, par localisation V est isomorphe à la somme des V_i,
où sur V_i on a localisé en Q_i, ie V_i=Ker Q_i^e_i(X)
De plus, si P=\prod Q_i^n_i, alors dim V_i=deg Q_i^n_i

[Pr: A=k[X]/P_0(X) est un anneau artinien, donc A=\sum A_Q_i des localisés
et A_Q_i = k[X]/Q_i(X). V=\sum V_Q_i des localisés, et V_{Q_i}=Ker
Q_i^{e_i} ]

- V_i est simple ssi n_i = 1 donc V simple ssi P_0=P et P_0 irréductible
- V est semi simple ssi e_i = 1 pour tout i.
- V cyclique (ie de rang 1) ssi P_0=P ie n_i=e_i

Drunford:
M = D + N uniquement où D semi-simple et N nilpotent avec D, N commutant.
et D et N sont des polynômes en M

Th: M et N sont semblables dans k ssi M-XI et N-XI sont équivalentes dans
k[X], ie ssi elles ont même invariants de similitudes.

Cyclicité
---------

M est une matrice compagnon <=> P_0=P 
<=> Il y a un seul facteur invariant <=> V est cyclique
<=> le commutant de M sont les polynômes en M.
<=> (k infini) il n'y a qu'un nombre fini de sous-espaces stables

Pour tout M Com(Com(M))=Poly(M)

ex: simple => cyclique

En résumé: soit A=k[X]/P_0. Si A est simple (=A corps = P_0 irréd),
l'action est simple; si A est semi-simple (ie multiplicités 1), l'action
est semi-simple, si P_0 est le seul invariant (ie P=P_0) l'action est de rang 1.

Jordan
------

Les facteurs invariants de (C_P C_Q) sont (P \wedge Q, P \vee Q).
Corollaire: si P=\Prod P_i avec les P_i premiers entre eux, alors C_P est
semblable à (C_P_i)

Soit maintenant R=\prod R_i^f_i un facteur invariant, C_R la matrice compagnon,
alors C_R est semblabe à (C_R_i^f_i).

Ex: Si R_i=(X-lambda), C_(R_i^f_i) est semblable à la matrice de Jordan usuelle.

Inversement, si on se donne une décomposition en facteurs de Jordan
Q_i^g_i, alors on les classes par blocks croissants:
Q_1^g_1 Q_2^g_2 ...
Q_1^g'_1 Q_2^g'_2 ...
et on lit les facteurs invariants sur les lignes.

Exemple: a un block de Jordan Q_1, Q_1^2, Q_1^2, Q_2^3, Q_2^4 correspond
les invariants Q_1, Q_1^2 Q_2^3, Q_1^2 Q_2^4.

=> M est cyclique ssi pour toute valeur propre λ (ou généralement chaque
irréductible) il n'y a qu'un seul bloc de jordan.

Sous-espaces stables d'un endomorphisme cyclique
------------------------------------------------

On a P=P_0=\Prod P_i^n_i, et V est de rang 1 est isomorphe à A=k[X]/P(X).
Les sous-espaces invariants de V correspondent aux idéaux de A, ie aux
facteurs de P(X). Ie ce sont exactement les \Ker P_i^g_i (g_i \leq n_i), cet
espace étant de dimension \Sum g_i deg P_i (car c'est le degré de l'anneau
quotient).

Commutant/Bicommutant
---------------------

- Com(Com(u))=k[u]/P_0(u)

- Si u commute avec v, alors u stabilise Ker v et Im v.
  Si v est une projection, u commute avec v <=> u stabilise Ker v et Im v.
  Ie les décompositions V=V_1 \oplus V_2 stables par u sont en bijection avec 
  les projections p (p^2=p) de Com(u)

Si A=k[X]/P(X) est un produit d'anneau (par exemple on peut voir ça en
localisant), alors les idempotents de A fournissent des projections p sur V
qui commutent avec u (car p=R(u)).

Espaces caractéristiques
------------------------

Si P=\prod Q_i^n_i, alors V=\somme V_i, dim V_i=n_i deg Q_i (V_i=Ker Q_i^n_i),
décomposition en sous-espace caractéristiques et les projecteurs sont des
polynômes en f (voir plus haut)

Si P se décompose en facteurs linéaires on peut expliciter ces projecteurs:
La projection sur un espace caractéristique vient des polynômes de
Lagrange si f est diagonalisable à racines distinctes. En général il faut
prendre le polynôme qui vaut 1 en \lambda à l'ordre n_\lambda, et 0 en les
autres \lambda_i à l'ordre n_i [cf Algebre/Interpolation] pour avoir le
projecteur sur l'espace caractéristique associé à lambda.

Plus généralement, si P(M)=0 et P=P_1 P_2 avec P_1 et P_2 premiers entre
eux, alors
V=V_1 \somme V_2, et la projection sur V_i est un polynôme en f.
De plus V_1=Ker P_1=Im P_2; et P_2|V_1 est inversible.

Preuve: On a Im P_2 \subset Ker P_1; V=Im P_1+Im P_2 par Bézout, et Ker P_1
\cap Ker P_2=0; d'où les égalités. P_2|V_1 est inversible car son noyau est
nul. Par le th Chinois k[M] se décompose suivant P_1 et P_2; d'où des
idempotents dans l'anneaux qui donnent les projecteurs sur V_i.

De manière similaire: si f endo; V=Ker f \somme Im f ssi Im f \subset Im
f^2 et on a alors égalité.

Sous-Espaces Stables
--------------------

Si W \subset V est stable, W_i \subset V_i est stable car les V_i sont
donnés par des projecteurs. On peut donc supposer que A=k[X]/P_0(X) est
local, ie P_0=Q^e, et P=Q^n (n \geq e).

On note V_j=k[X]/Q^j l'espace Q^j-cyclique canonique.
On a un drapeau canonique V_0 \subset V_1 \subset ...
où à chaque fois la dimension croit de deg Q (ce sont les seuls ss-evs
stables de V_j).

Par la décomposition de V en ss-espaces cycliques, on a
V=\oplus V_j, avec j croissant, le dernier est égal à e, et \sum j=n.

Pour construire W stable, on prend des x_j dans V_j et des combinaisons
linéaires des x_j. W sera cyclique de type le max des j dans lequel x_j
vit.
