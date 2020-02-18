vim: ft=markdownlight fdm=expr

Références
==========

- https://mathstrek.blog/2012/02/29/thermodynamics-for-mathematicians-i/
- http://www.sci.sdsu.edu/~salamon/MathThermoStates.pdf
  The mathematical structure of thermodynamic
- https://math.stackexchange.com/questions/384725/thermodynamics-for-math-majors
  => A First Course in the Mathematical Foundations of Thermodynamics

Theory
======

* Références
- https://en.wikipedia.org/wiki/Thermodynamic_equations
- https://en.wikipedia.org/wiki/Thermodynamic_potential
- https://en.wikipedia.org/wiki/Thermodynamic_square
  => Mnemotechniques
- https://fr.wikipedia.org/wiki/Potentiel_thermodynamique
  https://en.wikipedia.org/wiki/Table_of_thermodynamic_equations
  Très bon résumé des formules

Definitions
-----------

* https://fr.wikipedia.org/wiki/Formulaire_de_thermodynamique

Travail: W [J], W=W_fp + W' (W_fp: forces de pression, δW_fp=-P dV)
Chaleur: Q [J]
Pression: P, p [Pa]
Volume: V [m^3]
Température: T [K]
Quantité de matière: n [mol]
Potentiel chimique: μ [J/mol]. μ_i=∂U/∂n_i|P,T,n_j

Energie interne: U [J] (dE_c+dE_p) + dU=δW+δQ
Enthalpie: H=U+pV [J]
Energie libre: F=U-TS
Enthalpie libre:  G=H−TS

Constants:
k_B Boltzmann constant 	R Ideal gas constant 	NA Avogadro constant

Equations
---------

* Conjugate variables:
  p Pressure 	V Volume
  T Temperature 	S Entropy
  μ Chemical potential 	N Particle number 

* Laws
- Premier principe de la thermodynamique : dU + dU_ext = 0
  => dU=δQ+δW (note: δ signifie que la différentielle n'est pas exacte)
- Deuxième principe de la thermodynamique : dS + dS_ext ≥ 0, ie S_crée=Δ(S+S_ext)≥ 0
  => dS≥0 for an isolated system.
- Troisième principe: S=0 when T=0

* Fundamental equation:
Travail des forces de pressions:
  δW=δW_fp+δW' où δW_fp=-PdV ie W_fp=-PΔ_V à pression constante
Donc dU = δQ − PdV + δW′ + ∑_i μ_i dN_i
  où δQ = T dS [cas réversible]
On en déduit l'équation fondamentale, qui marche même dans un cadre non réversible car U, S et V sont des fonctions d'état:
  dU = T dS − p dV + ∑_i μ_i dN_i
=> the thermodynamic space has k+2 dimension
=> on peut déduire les dérivées partielles, eg (∂U/∂S)|V,N_i = T
Remark: S, V, N_i are extensive, T, p, μ_i intensive

* Euler integral: comme on intègre des quantités extensives, on a
  U=TS-pV+∑_i μ_i N_i
En différentiant et en utilisant l'équation fondamentale:
  0 = S dT − V dp + ∑_i N_i dμ_i [Gibbs–Duhem]
=> l'état du système est de dimension k+1

Potentials
----------

- Internal energy: U(S,V,N_i)
  = capacity to do work plus release heat. Décroit à entropie (+ external
  parameters, eg volume) constante.
- Helmotz free energy (energie libre): F=U-TS = F(T,V,N_i)
  = mechanical+non mechanical work. Décroit à température constante.
- Enthalpy: H=U+pV =H(S,p,N_i)
  = non mechanical work + release heat. Décroit à pressure constante.
- Gibbs free Energy (enthalpie libre): G=U+pV-TS = H-TS=G(T,p,N_i)
  = non-mechanical work. Décroit à pressure et température constante.
Note: ce sont des transformées de Legendre de U pour remplacer des
variables extensives par des variables intensives

Pour une transformation réversible, δQ=TdS, ie dS=δQ/T
(et pour une transformation irréversible, dS>δQ/T), d'où
- dU=-PdV+TdS+δW'
- dF=-PdV-SdT+δW'
- dH=VdP+TdS+δW'
- dG=VdP-SdT+δW'

* Sans travail W', on a:
- A volume constant, ΔU=Q_p
- A température et volume constant: ΔF=-TS_crée<=0
- A pression constante, ΔH=Q_p
- A température et pression constante, ΔG=-TS_crée<=0

Fonctions caractéristique
-------------------------

* https://fr.wikipedia.org/wiki/Fonction_de_Massieu
Fonction caractéristique de Mathieu: dΨ = dS − dU/T − P/T dV = dS + dS_ext ≥ 0
Ex à volume et température constant: Ψ=J=-F/T (fonction de Massieu)
   à pression et température constant: Ψ=Y=-G/T (fonction de Planck)
Ce sont des transformées de Legendre de l'entropie

Équivalences entre fonctions caractéristiques et potentiels thermodynamiques
Potentiel thermodynamique 	Fonction caractéristique
* Variables intensives
Température T 	1/T
Pression P 	− P/T
Potentiel chimique μ_i	−μ_i/T
* Variables extensives
Entropie S	Énergie interne U
Volume V
Quantité de matière n_i
* Fonctions
Énergie interne U(V,S,n)	Entropie S(V,U,n)
Enthalpie H = U + P V (P,S,n)	 Ψ_1 = S − P/T*V (-P/T,U,n)
Fonction de Helmholtz (Énergie libre) F = U − T S (V,T,n)	Fonction de Massieu J = S − 1/T U = − F/T (V,1/T,n)
Fonction de Gibbs (Enthalpie libre) G = U + P V − T S (P,T,n)	 Fonction de Planck Y = S − P/T V − 1/T U = − G/T (-P/T,1/T,n)
Grand potentiel Φ_G = U − T S − ∑_i μ_i n_i(V,T,μ) Ψ_2 = S − 1/T U − ∑ (−μ_i/T) n_i = − Φ_G/T (V,1/T,-μ/T)
* Évolution spontanée
dU = δW + δQ	dS ≥ δQ/T
Premier principe de la thermodynamique dU + dU_ext = 0	Deuxième principe de la thermodynamique dS+dS_ext ≥ 0
L'énergie interne ne peut pas être calculée de façon absolue. 	Troisième principe de la thermodynamique L'entropie d'un cristal parfait à 0 K est nulle.
dU ≤ − PdV + TdS + ∑ μ_i dn_i	dS ≥ P/T dV + 1/T dU + ∑_i (−μ_i/T)dn_i
Notation générale Φ = Φ (x,y,n)	Notation générale Ψ = Ψ(x,y,n)
Dans une transformation spontanée à x et y constantes, dΦ = −T[dS + dS_ext] ≤ 0, Φ ne peut que décroître.	Dans une transformation spontanée à x et y constantes, dΨ = dS + dS_ext ≥ 0, Ψ ne peut que croître.
À l'équilibre dΦ=0, Φ atteint un minimum.	À l'équilibre dΨ=0, Ψ atteint un maximum.
* Relation de Gibbs-Duhem
SdT − VdP + ∑_i n_i dμ_i = 0	Ud(1/T)−Vd(−P/T)+ ∑_i n_id(−μ_i/T)=0
* Relations de Gibbs-Helmholtz
(∂J/∂1/T)|V,n = − U	(∂F/∂T)|V,n=−S
(∂Y/∂1/T)|P,n = − H	(∂G/∂T)|−P/T,n=−Ψ_1
* Capacités thermiques
Capacité thermique isochore C_V, à volume constant δQ_V = C_V dT = dU = T dS
C_V = (∂U/∂T)|V,n = −T(∂^2F/∂T^2)|V,n	−TC_V = (∂S/∂1/T)|V,n = −1/T(∂^2J/∂1/T^2)|V,n
Capacité thermique isobare C_P, à pression constante δQ_P = C_P dT = dH = T dS
C_P = (∂H/∂T)|P,n = −T(∂^2G/∂T^2)|P,n	−TC_P = (∂S/∂1/T)|P,n = −1/T(∂^2Y/∂1/T^2)|P,n


Relations
---------

* Gibbs-Duhem: https://fr.wikipedia.org/wiki/Relation_de_Gibbs-Duhem
  En représentation énergie: S dT − V dp + ∑_i N_i dμ_i = 0
  En représentation entropie : Ud(1/T)+Vd(P/T)−∑_i n_id(μ_i/T)=0

* https://en.wikipedia.org/wiki/Maxwell_relations
En calculant les dérivées partielles secondes de U, et en utilisant
Schwartz, on a par exemple (∂T/∂V)|S = −(∂P/∂S)|V = ∂^2U/∂S∂V

* Gibbs-Helmholtz
(∂(G/T)/∂T)|p,n = −H/T^2      (∂(G/T)/∂(1/T))|V,n = H
(∂(F/T)/∂T)|V,n = −U/T^2      (∂(F/T)/∂(1/T))|V,n = −U

* https://en.wikipedia.org/wiki/Clausius%E2%80%93Clapeyron_relation#Derivation_from_state_postulate
dP_1→2/dT = Δ_1→2(H) / T⋅Δ_1→2(V)

Propriétés matérielles
----------------------
These properties are seen to be the three possible second derivative of the Gibbs free energy with respect to temperature and pressure.

* ρ	Density is defined as mass of material per unit volume

* Coefficient of thermal expansion / Coef de dilatation isobare
  α_p = 1/V (∂V/∂T)|p      α   	Coef de dilatation isobare
        1/P (∂P/∂T)|V      β   	Coef de compression isochore

* Compressibility at constant temperature or constant entropy
  β_{T or S} = − 1/V (∂V/∂p)|T,N or S,N
  - β_T 	Isothermal compressibility (χ_T en Français: coef de compressibilité isotherme)
  - β_S 	Adiabatic compressibility

* Heat capacity at constant pressure or constant volume
  C_{p or V} = T/N (∂S/∂T)|p or V   [dU = C_V dT, dH = C_P dT, les autres paramètres constants]
  - C_V 	Heat capacity at constant volume / Capacité thermique isochore
    C_V = (∂U/∂T)|V,n = T(∂S/∂T)|V,n = 1/T^2(∂^2J/∂1/T^2)|V,n = −T(∂^2F/∂T^2)|V,n
    => A volume constant: δQ_V = C_V dT = T dS = dU
  - C_p 	Heat capacity at constant pressure / Capacité thermique isobare
    C_P = (∂H/∂T)|P,n = T(∂S/∂T)|H,n = 1/T^2(∂^2Y/∂1/T^2)|P,n = −T(∂^2G/∂T^2)|P,n
    => A pression constante: δQ_P = C_P dT = T dS = dH

- https://fr.wikipedia.org/wiki/Relation_de_Mayer
  C_P-C_V=T ∂P/∂T|V,n * ∂V/∂T|P,n
  Cas d'un gaz parfait: PV=nRT => C_P-C_V=nR

* Coefficients calorimétriques: https://fr.wikipedia.org/wiki/Coefficients_calorim%C3%A9triques_et_thermo%C3%A9lastiques
δQ = TdS = C_V dT + l dV = C_P dT + h dP = λ dV + μ dP
  l: coeff de dilatation isotherme, h coeff de compression isotherme

Coefficients thermoélastiques:
dV/V=-χ_T dP + α dT
dP/P=-1/Pχ_T dV/V + β dT

Voir la page wikipedia pour plein de relations entre ces coefficients

Processus adiabatique
---------------------

* https://en.wikipedia.org/wiki/Adiabatic_process

Pour un gaz parfait: PV^γ=cstant
where P is pressure, V is volume, and for this case n = γ, where
    γ = C_P/C_V = (f+2)/f

(3) U = α n R T = α P V 
where α is the number of degrees of freedom divided by two, R is the universal gas constant and n is the number of moles in the system (a constant). 

* Carnot
η=1-T_f/T_c efficacité moteur depuis deux sources
e = − Q_c/W ⩽ T_c/(T_c−T_f=e_c) efficacité pompe à chaleur

Gaz parfait
===========

* https://fr.wikipedia.org/wiki/Gaz_parfait
PV=nRT=Nk_BT, Pv=rT où
- P est la pression du gaz (en pascal) ;
- V est le volume occupé par le gaz (en mètre cube) ;
- n est la quantité de matière (en mole) ;
- N est le nombre de particules ;
- R est la constante universelle des gaz parfaits: R = 8,314 462 1 J K−1 mol−1 = N_A⋅k_B où N_A est le nombre d'Avogadro (6,022×1023 mol−1) et k_B est la constante de Boltzmann (1,38×10-23 J·K−1) ;
- T est la température absolue (en kelvin) ;
- v est le volume massique (ou volume spécifique), l'inverse de la masse volumique (v = 1/ρ) (en mètre cube par kilogramme (m^3/kg) ;
- r est une constante qui dépend du gaz, elle est définie comme suit r = R/M où M est la masse molaire du gaz considéré. Pour l'air, r = 8,314472 / (28,965338 ×10-3) ≈ 287 J·kg−1·K−1. [Preuve: n=m/M où m est la masse en kg et v=V/m]

Statistical physics
===================

Z = ∑_q e^{−E(q)/k_B T}, E(q)=energie de l'état q
et la proba d'être dans l'état q est P(q) = e^{−E(q)/k_B T}/Z

* https://fr.wikipedia.org/wiki/Physique_statistique#Ensemble_grand-canonique
Z = e^{−βF} où β=1/k_B T.
U=energie moyenne= U=-(∂ln Z/∂β)|N,V
S = k_B ln Ω

Divers
======

- http://rantonels.github.io/capq/q/TD1.html
TD1 - How are negative temperature possible? Why are they hotter than any positive temperature? How were they acheived?
