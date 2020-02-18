vim: ft=markdownlight fdm=expr

Isolation
=========

λ: W/m.K
R=e/λ: m^2.K/W
U=1/R: W/K.m^2

Liste de U (fenêtres, murs...): http://www.energieplus-lesite.be/index.php?id=15347
Liste de λ:
- http://www.energieplus-lesite.be/index.php?id=15348
- http://tony.moutaux.free.fr/isomaison/index.php/materials/index
- http://www.isoltop.com/Conductivite-Thermique.html
Liste de μ:
- https://energieplus-lesite.be/donnees/enveloppe44/enveloppe2/coefficient-de-resistance-a-la-diffusion-de-vapeur-des-materiaux/

* Déperditions:
Ubat=(1/R)*Surface +1/hi +1/he => watt/degré (W/K)
  R=e/λ
  hi et he (conduction de l'air): https://www.thermexcel.com/french/ressourc/deperdit.htm
  Ou encore appelé rsi et rse http://www.energieplus-lesite.be/index.php?id=16896
  Pour un mur 1/hi+1/he=0.11+0.06=0.17
  Pour un sol: 1/hi=0.17, 1/he=0.05
  Pour un plafond: 1/hi=0.09, 1/he=0.05

* Résistance lame d'air
http://www.energieplus-lesite.be/index.php?id=16897
1.5-2.5cm: 0.17, au-delà: 0.18

* Coefficients tau:
http://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/93426-conductivite-thermique-dune-lame-dair.html

* Ponts thermiques:
http://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/194634-isolation-une-renovation-ponts-thermiques-2.html
 St = Si + Sp (surface totale=surface intérieure + surface pont thermique)
 St/Rt = Si/Ri + Sp/Rp
 En combinant les deux, on obtient la relation suivante :
 Rt/Ri = (1+Sp/Si) / (1 + (Sp/Si)/(Rp/Ri))

Inertie
=======

* Références:
- http://boiscorde.weebly.com/uploads/3/1/2/4/31244775/pare-pluie_pare-vapeur_et_inertie.pdf
- http://www.energieplus-lesite.be/index.php?id=10330
- http://passivact.com/Concepts/files/InertiesThermiques-Comprendre.html
- http://www.ideesmaison.com/Construction/Gros-travaux/Materiaux/Detail-des-calculs.html
- http://mayar.over-blog.com/article-4680739.html
  C'est quoi l'inertie?
- http://mayar.over-blog.com/article-3908394.html
  C'est quoi le mieux? Faire un mur capteur au sud ou bien isoler? (mise à jour)

* Notations:
- ρ la masse volumique du matériau en [kg/m^3]
- c la capacité thermique massique du matériau en [J/kg.K]
- masse thermique: S=ρc: J/K.m^3
- diffusivité: α=λ/S=λ/ρc [m²/s]
  => profondeux caractéristique: δ=√{2α/ω} [m]
     célérité: cel=δω [m/s], déphase: e/δω [s] (ω=2π/Période)

* Effusivité:
https://fr.wikipedia.org/wiki/Effusivit%C3%A9_thermique
- Effusivité : E = √(λS) = √(λρc) [J/K.m^2.s^{1/2}]
- Température de contact en surface entre deux matériaux de temp Ti et
  d'effusivité Ei: T=(E1.T1+E2.T2)/(E1+E2)

* Diffusivité: https://fr.wikipedia.org/wiki/Diffusivit%C3%A9_thermique
- diffusivité: α=λ/S=λ/ρc [m²/s]
  (Elle est en en m²/h si masse thermique en Wh/K.m^3)
- amortissement: exp(-e/δ) (amortissement de l'amplitude du signal, sans unité)
  où δ(ω) = √{2α/ω} [m] (=profondeur de peau thermique: profondeur à laquelle l'amplitude du signal est amortie d'un facteur e=2.7)
  et α: diffusivité, ω: pulsation du signal de température en rad/s (ie ω=fréquence rad) = 2π/Période
  [Rem: si α en m^2/h on a pour un signal de 24h: δ=√{2α 24/2π}),
   => amortissement = exp(-e √{24α/π}) = exp(-2.764 e √α)]
- Temps caractéristique (lié au déphasage): t=e^2/α [s]
=> Le signal sinusoïdal de température à la profondeur e dans le massif semi-infini est amorti de façon exponentielle dans cette épaisseur $e$  par un coefficient exp(−e/δ) et retardé avec un déphasage de e/δ radians => longueur caractéristique δ
  [cf résolution équation chaleur: T=T0+Δ_T e^{-x/δ} cos(ωt-x/δ)
                                     T0+Δ_T e^{-x/δ} cos(ω(t-x/δω))]
- célérité = cel = δω = √{2αω} = √(4πα/Période) [m/s]
  Si Période=24h et α en [m/h], cel=0.725[1/√h].√α [m/h]
  [en effet √(4π/24*3600s)=1/83√s=1/0.023√3600√h=1/1.38√h=0.725[1/√h]=√(4π/24h)]
  -> vitesse de transmission de la chaleur à travers la paroi
- déphasage = e/cel = eω/δ = √(T/4π) e/√α [s] où e=épaisseur
  Si T=24h, déphasage=e / 0.725√α=1.38[√h] e/√α [h]
  -> décalage en temps de la transmission de chaleur

* Applets de calcul inertie:
- http://meteo.re.free.fr/thermo.php
- https://enercoconseils.wordpress.com/2011/10/14/wall-t/
  => http://enerco.free.fr/widgets/Inertia/index.html

Chauffage
=========

* Degré Jour Unitaire (DJU): https://cegibat.grdf.fr/simulateur/calcul-dju
http://www.infoclimat.fr/climatologie/

* Calcul simplifié de puissance de chauffe: 
http://www.radiastyl.fr/calcul-puissance.html [zone climatique*coeff isolation*volume]
Calcul plus précis: http://herve.silve.pagesperso-orange.fr/deperditions/deperd_simplifiee.htm

Chauffer 1m^3 d'air:
http://www.maisons-et-bois.com/discussions/viewtopic.php?id=11433
  chaleur spécifique de l'air = 960J/kg.K
  masse volumique de l'air = 1.2kg/m^3 à 20°C [ρ=1,292kg⋅273,15K/T]
  Il faut donc 960x1.2=1150 Joules d'énergie pour réchauffer un m3 d'air par degrés de différence = 0.32 Wh/°C

ECS
---

* Chauffer 1L d'eau:
http://edesignlab.fr/chauffage-dun-volume-deau/
  chaleur spécifique de l'eau = 4185.5J/(kg.K)=1.1626Wh
  chaleur latente: 333,7kJ=92,7Wh pour transformer 1kg de glace à 0°C en eau.
  chaleur latente: 2258kJ=627,22Wh pour transformer 1kg d'eau à 100°C en vapeur.

* Estimation consommation ECS:
http://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/646554-ecs-instantane-gaz-vs-ecs-ballon-electrique-guide-choix.html
 Pour 2 personnes, pour obtenir 80L d'ECS à 55°C à partir d'une eau à 10°C, il faut donc fournir
80L x (55°C-10°C) x 1,161 = 4,18 kWh par jour pour l'ECS.
Si l'ECS est produite via un ballon d'ECS, il faut ajouter les déperditions thermiques du ballon : 1,17 kWh par jour pour un ballon de 100L à 55°C

* Pertes tuyaux: http://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/180288-cette-reduire-pertes-dun-cumulus-2.html
E= Delta t°*1,16*pi*r*r=(60-20)*1,16*3,14*0,7*0,7=71 Wh de pertes pour
chaque mètre de canalisation de 12, après chaque utilisation d'une source.

Radiateurs
----------

* Puissance radiateur fonte:
4 colonnes: http://www.radiateur-en-fonte.fr/vente-radiateur-en-fonte-2484.htm
6 colonnes: http://www.radiateur-en-fonte.fr/radiateur-fonte-inertie-2486.htm

Calculs: http://herve.silve.pagesperso-orange.fr/radiateur.htm

 Q = S x (hr+hc) x (Tm - Ti)
Avec hr coefficient de radiation:
  hr = Ec x (T1 + T2) x (T1^22 + T2^22) x Co (Co=5,67051 x 10-8, constante de Stefan-Boltzmann), Ec=émissivité du corps=~0.9
et hc coefficient de convection:
   hc = 5,6 x ((T1 - T2) / (T2 x h))^0,25

 L'équilibre thermique de l'ensemble local-émetteur, en régime permanant, est donné par la relation suivante :
Q = K x S x (Tm - Ti) = H x (Ti - Te) = D x c·ρ x (Td - Tr), en W
  avec c = coefficient de chaleur spécifique de l'eau c = 1,1627Wh
  et ρ=masse volumique en kilo par litre, typiquement c·ρ=1,1628
  D débit de l'eau [kg/h]
  H pertes de la maison [W/K]
  K coeff du radiateur [W/Km^2]

 Le coefficient K, pour un Δ_T autre que le Δ_T nominal, est obtenu avec la formule suivante :
K = K_N x (Δ_T / Δ_TN)^(n - 1), en W/(m².K)
ie Q=Q_N*(Δ_T/Δ_TN)^n
Où Δ_T=(Td - Tr) / ln((Td - Ti) / (Tr - Ti))
         =~ (Td+Tr)/2-Ti si la chute n'est pas trop grande
et n=1,287 en moyenne, n=1 si le radiateur est très rayonnant, n=1.5 s'il est très convectant

Hydraulique (pression circulateur et perte de charge): http://www.energieplus-lesite.be/index.php?id=10983

Discussion sur futura: http://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/766139-augmentation-de-superficie-radiateurs-8.html

Gains condensation: http://herve.silve.pagesperso-orange.fr/chcondens.htm

Apports solaires
----------------

http://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/338824-puissance-solaire-1000-w-m2-342-w-m2-2.html
Pour un panneau perpendiculaire au soleil,
sur 24 h, il aura reçu en moyenne 342 W/m2
sur 12 heures de jour, il aura reçu 680 W/m2
la plus forte puissance enregistrée (à midi) sera 1361 W

https://fr.wikipedia.org/wiki/Constante_solaire
F = 1 360,8 ± 0,5 W/m².
Le rayonnement solaire incident moyen sur la surface totale est  :
F¯ = F/4 ≃ 340 W.m^−2

Données plus précises en fonction de la lattitude:
http://ines.solaire.free.fr/gisesol_1.php

Autres apports: http://www.bbs-logiciels.com/download/manuels/Clima-Win/APPORTS%20-%20CALCUL%20PAR%20LA%20METHODE%20RTS%202005-2009-2013.pdf

Confort thermique
-----------------

* Confort thermique en fonction température et humidité:
http://www.energieplus-lesite.be/index.php?id=10250

* Type de chauffage:
http://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/766771-difference-entre-radiateur-fonte-radiateur-aluminium.html

fonte : λ = 46W/m/K, ρ = 7,8e3kg/m3, cρ = 540J/kg.K --> effusivité ~14e3
alu : λ = 237W/m/K, ρ = 2,7e3kg/m3, cρ = 888J/kg.K --> effusivité ~24e3
effusivité = racine (λ.rho.c)

radiateur fonte 92 6 colonnes : 198W, 10,5kg --> capa thermique par watt déclaré 10.5*540/198 = ~29 J/K/W(n)
radiateur alu 32 4 éléments : 181W, 2,19kg --> capa thermique par watt déclaré 2.19*888/181 = ~11 J/K/W(n)

Hygrométrie
===========

Hygrométrie recommandée: 30-70%, si possible 40-60%
Documentation:
- https://www.effinergie.org/web/images/attach/base_doc/1400/101015_dossier_migrationV2_VAD_light.pdf
  Migration de vapeur d'eau et risque de condensation dans les paroies
- http://pravarini.free.fr/vapeur.htm
- http://www.meteofrance.fr/publications/glossaire/153342-pression-de-vapeur-saturante
- https://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/113363-vapeur-deau-murs-2.html #31
- http://mayar.over-blog.com/article-4801188.html
  Condensation dans les murs
- http://mayar.over-blog.com/2017/03/a-propos-de-pression-de-vapeur-saturante.html
  A propos de pression de vapeur saturante...
  => Liste des formules d'approximation de vapeur saturante
- http://mayar.over-blog.com/2017/03/la-tirade-du.html
  La tirade du µ [Quelques valeurs de μ]
- http://mayar.over-blog.com/2017/04/mu-vapeur-permeabilite.html
  Mu et flux de vapeur : addendum concernant la perméabilité
  [Calcul de pression partielle en prenant en compte le fait que la
  perméabilité à l'air dépend de la température]
- http://mayar.over-blog.com/2017/08/a-propos-du-point-de-rosee.html
   A propos du point de rosée 

* Résistance à la diffusion de vapeur d’une paroi (mu et Sd):
- http://www.energieplus-lesite.be/index.php?id=17041#02
- https://fr.wikipedia.org/wiki/Facteur_de_diffusion_de_la_vapeur_d'eau

- μ: coefficient de diffusion de la vapeur d'eau
     (μ <=> 1/lambda pour les déperditions thermiques):
- Sd=μ*épaisseur: résistance à la diffusion de vapeur [m]
  => l'épaisseur de la couche d’air équivalente à la diffusion de la vapeur
- π_air=0.185E-9 [kg/m.s.Pa=s]

Flux de vapeur d'eau:
Dv:=q [kg/m^2.s] =0.185E-9 [s] /Sd [m] * Δ_Pression [Pa]
             = Δ_Pression/R avec R= Sd(=μe)*5.4E9  [m/s]
Q [kg] = q*temps [s] * surface [m^2]

Note: en vrai π_air=2.0E-7 T^0.81/P
cf http://mayar.over-blog.com/2017/04/mu-vapeur-permeabilite.html pour le
calcul exact de Dv

* Données
https://fr.wikipedia.org/wiki/Capacit%C3%A9_thermique_massique
- Chaleur spécifique de l'air: 1005 J/kg.K
- Chaleur spécifique de l'eau: gaz: 1850, liquide: 4185, solide (0°C) 2060
En fonction de la température: https://en.wikipedia.org/wiki/Latent_heat

## Formules hygrométriques

RH = P_vapeur d'eau/P_saturante (humidité relative)

!! Wikipedia
* Calcul de vapeur saturante: https://fr.wikipedia.org/wiki/Pression_de_vapeur_saturante

! Formule de Dupré:
ln(p_sat/p_0)=M.Lv/R*(1/T0-1/T)-M.a/R*ln(T/T0) [(1)]
  - p_0: la pression de référence: 1013.25 hPa
  - T0: température d'ébullition de la substance à une pression p0 donnée, en K (T0 = 373.15 K pour l'eau)
  - psat: pression de vapeur saturante, dans la même unité que p0 (p0 = 1013.25 mbar=101325Pa);
  - a: le facteur de linéarité de la variation de l'enthalpie du fluide avec la température ;
  - M: masse molaire de la substance, en kg/mol (M = 0,01801 kg/mol);
  - Lv: chaleur latente de vaporisation de la substance, en J/kg (Lv = 2,26E6 J/kg);
  - R: constante des gaz parfaits, égale à 8,31446 J/K/mol ;
  - T: température de la vapeur, en K.

! Formules explicites:
Voir aussi http://mayar.over-blog.com/2017/03/a-propos-de-pression-de-vapeur-saturante.html, j'indique la correspondance via [FOO]
- https://fr.wikipedia.org/wiki/Pression_de_vapeur_saturante_de_l%27eau#Formules
  En supposant a=0 et L=2.47E6 à 20°C (en vrai la chaleur latente de
  vaporisation varie avec la température de l'ordre de 10%), on trouve
 P_sat = P0 exp[LM/R (1/T0−1/T)]= exp(14.33 − 5350°C/T) [Clapeyron]
- Formule simplifiée [Rankine] pour l'eau, plus raffinée, sur la plage de 5
  à 140 °C:
  ln p_sat = 13.7 − 5120°C/T
- Formule simplifiée de Duperray (écart de 0,12 à 7,7 % sur la plage T=de 90 à 300 °C): p_sat = (T/100°C)^4
- Formule [d'Antoine] https://fr.wikipedia.org/wiki/Pression_de_vapeur_saturante_de_l%27eau#Formules
  log_10 P_sat = 8.07131-1730.63/(233.426°C+T) pour T de 1°C à 99°C
- formules (Magnus) dans https://fr.wikipedia.org/wiki/Masse_volumique_de_l%27air
 p_sat=611,213 exp{17.5043T/(241.2°C+T)}
 p_sat=611,657 exp{17.2799- 4102.99/(237.42°C+T)}
      =611,657 exp{(17.2799T-0.396)/(237.42°C+T)}
  [Magnus-Tetens: 610,78 exp{17,2693882*T/(T+237,3)}=10^{2.7858+7.5η/(237.3+η)} [Murray67]
   Buck96: 611,21 exp{(18,678-T/234,5)*T/(T+257,14+T)}]
- Sur energieplus: pvs [Pa] = 10^{2,7877+7,625.η/(241,6+η)} (η>0°C)
                   pvs [Pa] = 10^{2,7877+(9,756.η)/(272,7+η)} (η<0°C)
    => C'est [CTSC]. C'est quasiment la formule de Magnus plus haut qui donne 10^{2,7862+7,60.η/(241,2+η)}
=> Buck96 > Magnus-Tetens >> CSTC > Antoine >>> Rankine > Clapeyron

! Tableau
Température (°C) 	Pression de vapeur saturante (mbar)
-60° 0,001  -40° 0,13  -20° 1,03  -10° 2,6  0° 6,10   5° 8,72  10° 12,3
15° 17,0  20° 23,4  25° 31,7  30° 42,4  40° 73,8  50° 123  60° 199  100° 1013
et https://fr.wikipedia.org/wiki/Pression_de_vapeur_saturante_de_l%27eau#Table_des_pressions_de_vapeur_saturantes_de_l'eau pour un tableau plus complet

* Température de rosée: https://fr.wikipedia.org/wiki/Point_de_ros%C3%A9e
  Tr = b α(T,RH) / (a−α(T,RH))
    avec: α(T,RH)= aT/(b + T) + ln RH
    a = 17,27 et b=237,7 [°C].
  Domaine de validité :
    T, température mesurée : 0 °C < T < 60 °C
    RH, humidité relative : 0,01 (1%) < RH < 1,00 (100%)
    Tr, point de rosée : 0 °C < Tr < 50 °C

Preuve: On écrit P_sat=Cste e^{aT/(T+b)} et on résout RH.P_sat(T)=P_sat(T_rosée)
On a presque les mêmes chiffres que la formule de Magnus plus bas

Autre formule: Tr = RH^{1/8}⋅[112+0.9⋅T]+0.1⋅T−112

* https://fr.wikipedia.org/wiki/Masse_volumique_de_l%27air

- Air sec:
ρ=PM/RT [kg/m^3] où P=presion de l'air [101300 Pa], M masse molaire de l'air [0.0289644 kg/mol], R la constante des gaz parfaits [8,3144621 J·K-1·mol-1], T la température en K.
 =P/R_sT où R_s=R/M=287.058 Jkg-1K-1
=> ρ=1,292kg⋅273,15K/T=1.2kg/m^3 à T=20°C.

- Air humide:
ρ=p/R_hT où R_h=R_s/[1−(φ⋅p_sat/p)⋅(1−R_s/R_v)]
avec: R_s=287,06 J kg−1 K−1 est la constante spécifique de l'air sec ;
      R_v= 461 J kg−1 K−1 est la constante spécifique de la vapeur d'eau ;
      φ est l'humidité relative et p la pression de l'air.
[Note: je ne retrouve pas cette formule avec ρ=p_s/R_sT + p_v/R_vT, p=p_s+p_v,
pour moi R_h=p R_v R_s / (P_vR_s+P_sR_v)]

!! Energie Plus
* http://www.energieplus-lesite.be/index.php?id=11243
- pvs [Pa] = 10^{2,7877+7,625.η/(241,6+η)}
    η température en °C>0 [c'est quasiment la formule de Magnus plus haut qui donne 10^{2,7862+7,60.η/(241,2+η)}
  pvs [Pa] = 10^{2,7877+(9,756.η)/(272,7+η)}
    η température en °C<0 (glace)
- température de rosée:
    Si ηr>0°C, ηr = 31,685.x/(1-0,1311.x)
    Si ηr<0°C, ηr = 27,952.x/(1-0,1025.x)
      où x = log_10 (pv/613,34) [inverser les deux formules plus haut]
- humidité absolue: ha [kg_eau/kg_air sec]=0,622.(pv/(Patm-pv))
    où Patm=101300 Pa en altitude 0m
    [Preuve: ha=Pv/RvT / Ps/RsT=Rs/Rv * Pv/(P-Pv) et Rs/Rv=0.622]
  humidité relative: φ=pv/pvs
- enthalpie: h [kJ/kg air sec]= 1,006.η + ha.(2501+1,83.η)
                              =~ 2501-2.45*η kJ/kg [Goujot].
  Preuve: chaleur spécifique air : 1004J/kg K, chaleur latente de vaporisation eau: 2258kJ/kg, chaleur spécifique vapeur d'eau: 1.880 kJ/kg K [Goujot]
- volume spécifique: v = (461,24.(0,622+ha).T)/P [en m^3 air humide/kg air sec]
    T est la température absolue = η + 273,15°C
    P = pression totale de l’air humide, que l’on peut en première approche prendre égale à la pression atmosphérique, soit 101 300 Pa
  masse spécifique: m=1/v en kg air sec/m^3 air humide

* http://herve.silve.pagesperso-orange.fr/chcondens.htm
  Tr = ((pv/288,68)^(1/8,02)-1,098)*100
  Pvs = 288,68*(1,098 + T /100)^8,02

Formules complètes
------------------

* https://fr.wikipedia.org/wiki/Formule_de_Clapeyron
Formule de Clapeyron : (dP_1→2/dT)=Δ_1→2(H) / T⋅Δ_1→2(V)
  - T la température de changement d'état (en kelvins, K) ;
  - P_1→2 la pression de changement d'état à la température T (en pascals, Pa) ;
  - Δ_1→2 H l'enthalpie de changement d'état de la phase 1 à la phase 2 à la température T (en joules par mole, J/mol) ;
  - Δ_1→2 V = V¯2−V¯1 la différence des volumes molaires du corps pur respectivement dans les phases 2 et 1 à la température T et sous la pression P_1→2 (en mètres cubes par mole, m^3/mol).

* https://fr.wikipedia.org/wiki/Formule_de_Clausius-Clapeyron
Formule de Clausius-Clapeyron =  forme simplifiée de la formule de Clapeyron: 
- (dP_sat/dT) = P_sat Δ_vap H / RT^2
- (d ln P_sat/d 1/T) = - Δ_vap H / R
- (d ln P_sat/d ln T) = Δ_vap S / R
où:
- T la température ;
- P_sat la pression de vapeur saturante du corps pur à T
- Δ_vap H l'enthalpie de vaporisation du corps pur à T
- Δ_vap S l'entropie de vaporisation du corps pur à T
- R la constante universelle des gaz parfaits = 8.314 J mol−1 K−1.

Preuve: cas particulier de la formule de Clapeyron où V_gaz >> V_liquide et
du coup on estime Δ_V=V_gaz via la formule des gaz parfaits

Si on intègre en supposant que l'enthalpie est de la forme:
Δ_vap H = α + β T + γ T^2 + δ T^ε
on obtient des formules simplifiées:

- formule de Dupré où on suppose que l'enthalpie Δ_vap H est affine en T:
ln(P_sat)= Cste + A/T + B⋅ln(T), qui donne exactement [(1)]
- formule de Rankine où on suppose l'enhalpie constante en T:
  ln(P_sat/P°)=- Δ_vap H/R * (1/T - 1/T°)
- Équation d'Antoine : ln(P_sat) = A + B/(T+C) [on rajoute le C pour mieux
  fitter]
- On a aussi la formule de Duperray où l'on suppose l'entropie de
  vaporisation constante: P_sat/P∘ = (T/T∘)^{Δ_vap S /R}

Equation de la chaleur
======================

* Références:
- https://fr.wikipedia.org/wiki/%C3%89quation_de_la_chaleur
- https://en.wikipedia.org/wiki/Heat_equation
- https://fr.wikipedia.org/wiki/Conduction_thermique#Cas_d.27un_domaine_limit.C3.A9_par_deux_plans_parall.C3.A8les

Exemples de résolution numérique et anologie electrique:
- http://robert.mellet.pagesperso-orange.fr/diff/diff_01.htm

Fonction theta, Chaleur (cas spatial périodique)
- http://www.les-mathematiques.net/phorum/read.php?4,1382144,1383434,quote=1

Cours (cf la page wikipedia)
- http://www.sciences.univ-nantes.fr/sites/claude_saintblanquet/conducti/cddex.htm
  CONDUCTION DE LA CHALEUR Auteurs : Claude SAINT-BLANQUET et Bernard FOURCHER 
+ http://www.lmm.jussieu.fr/~lagree/COURS/MECAVENIR/index.html
  Cours Mécavenir EPU de Thermique, GM3C, Pierre-Yves Lagrée
- http://ori-oai-search.insa-lyon.fr/notice/view/default%253AUNIMARC%253A160504
  Transferts de chaleur et de masse, Insa Lyon, Jean Brau

Logiciels: http://www.thermexcel.com/french/ressourc/bilanth.htm

Formules
--------

- Q: transfert thermique [J] = ρcV T
- Φ, Q': flux de chaleur, Φ=dQ/dt [W] = ρcV ∂T/∂t
- φ, q: densité de flux thermique; Φ=φ.S [W/m^2]
- ρ: masse volumique du matériau [kg/m^3]
- c, c_p: capacité thermique massique du matériau [J/kg.K]
- ρc: masse thermique [J/K.m^3]
- λ [W/m.K], h [W/K.m^2]
- effusivité: E=√(λρc) [J/K.m^2.s^{1/2}]
- diffusivité: α=λ/ρc [m²/s]

* Transfert de chaleur:
- Conduction: φ=λΔ_T/e = Δ_T/r = hΔ_T avec h=λ/e [W/K.m^2],
  Loi de Fourier: φ=−λ∇T [la loi plus haute est l'approximation ∇T=Δ_T/e]
- Convection: φ=hΔ_T avec h=coefficient de convection thermique [W/K.m^2]
- Rayonnement: φ=εσT^4 où σ=constante de Stefan-Boltzmann=5,6703×10−8 W/K^4.m^ et ε l'émissivité

* Équation de la chaleur
- ∂u/∂t-α∇^2u=0
- Dim 1: ∂u/∂t=α(∂^2u/∂x^2) avec α=λ/ρc la diffusivité
Vient de dH/dT ∂T/∂t=∂/∂x(λ.∂T/∂x) avec H l'enthalpie = ρcT

* Echangeur thermique: 
dQ/dt=(h2-h1) dm/dt où m=masse, h_i=enthalpie massique=c_p T_i

Exemple: Une masse m1 à temp T1 mis en contacte avec une masse m2 à temp T2
dans une enceinte adiabatique
=> (mc_p)_1 (T-T1)+(mc_p)_2 (T-T2)=0 => T=...

* Loi de Newton
(Système mince, ie T uniforme dans le système):
Q'(t)=\int_surface flux q; q est proportionel à (T_ext-T_int)
=> Q'(t)=-hS(T-T_ext) où S=surface et h le coefficient d'échange [W/m^2K]

Exemples:
- Rayonnement: E=e σ T^4 où e est l'émissivité (0<e<=1) et
  σ=5.67*10^-8 W/m^2K^4 constante de Boltzman
  En linéarisant: q_rayonnement=h_r(T-T_ext) avec h_r=4eσ T_ext^3.
- Convection:
  h=2.4(T-T_ext)^{1/4} (cf p10 du chapitre 3 cours3_mince)
  Autres valeurs de h: cf chap 3 p.6 et http://www.fsr.ac.ma/cours/physique/bargach/Chap4.pdf (Transferts de chaleur par convection) et chap 5 p.2
- Conduction: h=λ/e

Résolution: Or Q'(t)=ρ c_p V ∂T/∂t (s'il n'y a pas de création volumique)
ie ∂T/∂t=-hS/Vρc_p Δ_T= -h/ρce Δ_T = -Δ_T/τ
=> d'où T=T_ext+(T_0-T_ext)e^{-t/τ},
   avec τ=ρ c_p V/hS (=ρce/h=ρce^2/λ=e^2/α pour un mur)

## Equation de la chaleur

* Loi de conservation:
Si a est une quantité conservée,
d/dt \int^3 a dv = -\int^2 J.ds + \int^3 rdv
où J flux associé et r terme source volumique
=> en 1d: ∂/∂t a(x,t)=-∂/∂x J(x,t)+r(x,t)

* Pour la chaleur: J=q le flux de chaleur, a= l'énergie volumique =ρc T
=> ρc ∂T(x,t)/∂t=-∂q(x,t)/∂x+r(x,t)
   ou en 3D ρc ∂/∂t T(x,t) = −∇·q+r

Loi de Fourier: q = −k ∂T/∂x [k=λ]
On en déduit l'équation de la chaleur: ρc ∂T/∂t = ∂/∂x(k.∂T/∂x)+r
et donc si k est constant et r=0: 
∂T/∂t = α ∂^2 T/∂x^2 avec α=k/ρc la diffusivité.
En 3D: q=−k∇T => ∂T/∂t = α∇²T

* Conditions aux limites:
- Température limite imposée: T=T_p sur la paroi
- Flux limite imposé: q_p=cste (=- k ∂T/∂x|p)
- Flux limite suivant une loi de Newton: q_p=h.(T_paroi-T_ext) (=- k ∂T/∂x|p)

Cas statique: T=cste en temps dans le système
=> l'équation de la chaleur donne dq/dx=0, ie q et T affines en x et on retrouve la loi de Newton:
Q'(t)=qS, Q'(t)=-hS Δ_T=(T_1-T_2)/R, R=e/kS (analogie électrique Δ_T=R Q').

* Nombre de biot

Normalisons l'épaisseur L de telle sorte qu'elle vaille 1 (et on normalise T en retranchant T_ext).
"q_p=h.(T_paroi-T_ext)" devient "-dT/dx=hL/k T" (sur la paroi)
Bi nombre de Biot=hL/k;
- B_i infini: T_paroi=constante
- B_i=0: paroi adiabatique, q_p=0
- B_i petit: système "mince". Le flux de chaleur emporté est faible, on
  peut supposer le système à température homogène (la conduction
  homogénisant plus vite que la convection)

Remarque: en régime stationnaire on a q=Δ_T/r (r=e/k la résistance
surfacique) sur la paroi on a q=h Δ_T; tout se passe comme si on avait une
résistance "superficielle" de 1/h en plus.

## Equation de chaleur cylindrique

Cf Chapitre 5b, en particulier (p.7) si on isole un tuyau par une épaisseur trop
petite, l'isolation ne compense pas l'augmentation de surface de convection!

## Résolution

Cf Chapitre 6.
1) Cas d'une lamelle
On normalise pour avoir e=1, Δ_T=1, en normalisant le temps par
T'=T/τ avec τ=e^2/α (temps caractéristique) on a
∂T/∂t =  ∂^2 T/∂x^2 
de solutions \sum_k A_k exp(-k^2 t) cos(kx+φ_k)
où k vérifie k tan(k)=B_i

2) Cas semi-infini
Solution en coordonnées normalisées: T=erf(x/2\sqrt{t})

3) Cas périodique en x=0
T=Δ_T e^{i(wt-kx)}
où l'équation de la chaleur donne -k^2=iw/α
ie T=T0+Δ_T e^{-x \sqrt{w/2α}} cos(wt-x\sqrt{w/2α})
    =T0+Δ_T e^{-x/δ} cos(wt-x/δ) où δ=\sqrt{2α/w}=\sqrt{4παf}
Si on écrit Text=A0 e^{2πif(t-t0)} on obtient
  T=A0 e^{-ω(x-x0)/δ}e^{iω[t-t0-(x-x0)/δ]}

Preuve:
https://forums.futura-sciences.com/habitat-bioclimatique-isolation-chauffage/194783-addition-de-dephasage.html #11

Divers
------

- http://mayar.over-blog.com/2017/05/quelle-finition-pour-mon-plancher.html
  "Quelle finition pour mon plancher?"

Accoustique
===========

http://www.pac-silence.fr/legislation-bruit.html
- Lp = Lw - 10 log (4Pid²)
