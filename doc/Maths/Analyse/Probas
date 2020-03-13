vim: ft=markdownlight fdm=expr

Moments
=======

* https://en.wikipedia.org/wiki/Moment_(mathematics)

- The normalised n-th central moment or standardised moment is the n-th central moment divided by σ^n
- The third central moment is the measure of the lopsidedness of the distribution; any symmetric distribution will have a third central moment, if defined, of zero. The normalised third central moment is called the skewness, often γ. A distribution that is skewed to the left (the tail of the distribution is longer on the left) will have a negative skewness. A distribution that is skewed to the right (the tail of the distribution is longer on the right), will have a positive skewness.
- The fourth central moment is a measure of the heaviness of the tail of the distribution, compared to the normal distribution of the same variance. 
  The kurtosis κ is defined to be the standardized fourth central moment

* https://en.wikipedia.org/wiki/Hausdorff_moment_problem
Borel measure μ supported on the closed unit interval [0, 1] => déterminée
par ses moments (attention ce n'est plus vrai pour une mesure à support non
borné). Hausdorff donne une caractérisation des moments possibles.

Fonction caractéristique
========================

* https://fr.wikipedia.org/wiki/Fonction_caract%C3%A9ristique_(probabilit%C3%A9s)
- ϕ_X(t)=E[e^{itX}] (=transfo de Fourier)
- Lorsque la variable aléatoire X est discrète, on définit sa fonction génératrice par G(z)=E[z^X], on a ϕ_X(t)=G(e^it)
- détermine de façon unique la loi d'une variable aléatoire
- Si les X_i sont indépendants, φ_{X1+...+Xn} = φX1...φXn.
- ϕ_X(t) = ∑_k=0^∞ i^k m_k(X)/k! t^k où m_k(X)=moment d'ordre k

* https://fr.wikipedia.org/wiki/Convergence_de_variables_al%C3%A9atoires
- Théorème de continuité de Lévy φ_n -> φ (simplement) <=> X_n tend en loi
  vers X.

Gaussienne
==========

* https://en.wikipedia.org/wiki/Multivariate_normal_distribution
- X ~ N(μ, Σ) (<=>)
- f_X(x1, …, xk) = exp(−1/2(x−μ)^T Σ^−1 (x−μ)) / \sqrt{(2π)^k|Σ|}
  (cas Σ non dégénéré)
- φ_X(u)=exp(i u^T μ -1/2 u^T Σ u)
- X=AZ+μ où Z_n~N(0,1) iid. A matrice k*l et Σ=AA^T.
- toute combinaison linéaire \sum a_i X_i est une gaussienne

Statistiques
============

* https://fr.wikipedia.org/wiki/Coefficient_de_d%C3%A9termination
En statistique, le coefficient de détermination, noté R2 ou r2, est une mesure de la qualité de la prédiction d'une régression linéaire.
Il est défini par :
    R^2 = 1 − ∑(y_i−y_i^)^2/∑(y_i−y¯)^2
où n est le nombre de mesures, y_i la valeur de la mesure no i, y_i^ la valeur prédite correspondante et y¯ la moyenne des mesures.

Lemme:
- R^2 = corr(y^,y)^2
- Dans le cas univarié, on montre que c'est aussi le carré du coefficient de corrélation entre les valeurs x_i de la variable prédictive et les mesures y_i.

- https://fr.wikipedia.org/wiki/Corr%C3%A9lation_(statistiques)#Coefficient_de_corr%C3%A9lation_lin%C3%A9aire_de_Bravais-Pearson
  Coefficient de corrélation corr: r = Cov(X,Y)/σ_Xσ_Y

* χ²: https://fr.wikipedia.org/wiki/Test_du_%CF%87%C2%B2
  T = ∑_{j=1}^J (N p_j^ − N p_j)^2/Np_j
Sous l'hypothèse nulle, cette statistique suit asymptotiquement une loi du χ^2 à (J–1) degrés de liberté.

* https://fr.wikipedia.org/wiki/Loi_du_%CF%87%C2%B2
la loi du χ^2 centrée avec k degrés de liberté est la loi de la somme de carrés de k lois normales centrées réduites indépendantes.
Conformément au théorème central limite, lorsque k est « grand » (k > 100), la loi d'une variable de χ^2, somme de variables aléatoires indépendantes, peut être approchée par une loi normale d'espérance k et de variance 2k.

* https://fr.wikipedia.org/wiki/Test_de_Student
On veut comparer la moyenne μ d'une population de loi normale et d’écart type σ non connu à une valeur déterminée μ0. Pour ce faire, on tire de cette population un échantillon de taille n dont on calcule la moyenne empirique x¯ = 1/n ∑ x_i et l'on remplace sa variance σ2 par son estimateur sans biais
    S_n^∗2 = 1/(n−1) ∑ (X_i − X¯_n)^2
Selon l’hypothèse nulle, la distribution d’échantillonnage de cette moyenne se distribue elle aussi normalement avec un écart type σ/√n.
La statistique de test :
    Z = \sqrt{n} (X¯−μ0)/S_n^∗
suit alors une loi de Student à n – 1 degrés de liberté

* https://fr.wikipedia.org/wiki/Loi_de_Student
Soit Z une variable aléatoire de loi normale centrée et réduite et soit U une variable indépendante de Z et distribuée suivant la loi du χ^2 à k degrés de liberté. Par définition, la variable
    T = Z/\sqrt{U/k}
suit une loi de Student à k degrés de liberté. 

* https://biology.stackexchange.com/questions/13486/deciding-between-chi-square-and-t-test
