vim: ft=markdownlight fdm=expr

Déterminant et aire plane
=========================

Si P=(x1,y1), P2=(x2,y2), alors
dét(x1,y1;x2,y2)=|P1||P2| sin \theta
(où theta est l'angle OP1,OP2)

Preuve: en divisant par les normes on peut supposer P1 et P2 unitaires,
puis via une rotation que P1=(1,0), d'où P2=(cos \theta, sin \theta), et le
déterminant donne immédiatement sin \theta

Angle au centre
===============

https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_l%27angle_inscrit_et_de_l%27angle_au_centre

Si A, B, M, N sont sur un cercle de centre O, alors
angle AMB = angle ANB [et réciproquement si égalité des angles => cocyclique]
          = 2 angle AOB

Corollaire: dans la situation précédente P1=(1,0) et P2 sur le cercle
unité, si P0=(-1,0) alors P0P1 est le diamètre et donc
P0 P2 P1 est un triangle à angle droit.
L'angle P2 P0 P1 est donné par \theta/2 par le th de l'angle au centre,
et la distance P1 P2 est donc 2 sin(\theta/2)

Triangle
========

http://en.wikipedia.org/wiki/Triangle

The law of sines, or sine rule,[7] states that the ratio of the length of a side to the sine of its corresponding opposite angle is constant, that is
    \frac{a}{\sin \alpha} = \frac{b}{\sin \beta} = \frac{c}{\sin \gamma} =
    diameter of the circumsribed circle.

The law of cosines, or cosine rule, connects the length of an unknown side of a triangle to the length of the other sides and the angle opposite to the unknown side.[7] As per the law:
For a triangle with length of sides a, b, c and angles of α, β, γ respectively, given two known lengths of a triangle a and b, and the angle between the two known sides γ (or the angle opposite to the unknown side c), to calculate the third side c, the following formula can be used:
    c^2\ = a^2 + b^2 - 2ab\cos(\gamma)
    b^2\ = a^2 + c^2 - 2ac\cos(\beta)
    a^2\ = b^2 + c^2 - 2bc\cos(\alpha)

If the lengths of all three sides of any triangle are known the three angles can be calculated:

    \alpha=\arccos\left(\frac{b^2+c^2-a^2}{2bc}\right)
    \beta=\arccos\left(\frac{a^2+c^2-b^2}{2ac}\right)
    \gamma=\arccos\left(\frac{a^2+b^2-c^2}{2ab}\right)

The law of tangents or tangent rule, can be used to find a side or an angle when you know two sides and an angle or two angles and a side. It states that:[8]

    \frac{a-b}{a+b} = \frac{\tan[\frac{1}{2}(\alpha-\beta)]}{\tan[\frac{1}{2}(\alpha+\beta)]}.

Computing the area of a triangle
--------------------------------

T=\frac{1}{2}bh

Knowing SAS: T = \frac{1}{2}ab\sin \gamma = \frac{1}{2}bc\sin \alpha = \frac{1}{2}ca\sin \beta
Knowing AAS: T = \frac {b^{2}(\sin \alpha)(\sin (\alpha + \beta))}{2\sin \beta},
Knowing ASA:[10] T = \frac{a^{2}}{2(\cot \beta + \cot \gamma)} = \frac{a^{2} (\sin \beta)(\sin \gamma)}{2\sin(\beta + \gamma)},
Using Heron's formula: T = \sqrt{s(s-a)(s-b)(s-c)}
where s= \tfrac{a+b+c}{2} is the semiperimeter, or half of the triangle's perimeter.

==========================================================================

L'espace des modules des triangles est de dimension 3 (on peut se ramener à
une base orthonormée telle que A=(0,0), B=(x,0) et C=(y,z)). Donc
intuitivement 3 conditions indépendantes sur les longueurs/angles imposent
qu'il n'y a qu'un nombre fini de triangles satisfaisant ces conditions.

Ex:
- si on fixe les trois longueurs -> une seule solution
  (loi des cosinus donne l'angle)
- si on fixe trois angles on est en dimension 1 car alpha+beta+gamma=pi
  donc les conditions ne sont pas indépendantes
- si on fixe 2 angles + 1 longueur (on a donc les trois angles) -> 1 seule
  solution (par exemple loi des sinus pour avoir les autres longueurs)
- si on fixe 2 longueurs et 1 angle -> dim 0
  - soit on a l'angle entre les deux longueurs, la loi des cosinus donne la
    troisième longueur
  - sinon on utilise la loi des sinus pour avoir un deuxième angle (donc
    les trois), sauf que le sinus donne (jusqu'à) deux possibilités.

http://en.wikipedia.org/wiki/Solution_of_triangles
A triangle can be solved when given any of the following:[1][2]
    Three sides (SSS)
    Two sides and the included angle (SAS)
    Two sides and an angle not included between them (SSA)
    A side and the two angles adjacent to it (ASA)
    A side, the angle opposite to it and an angle adjacent to it (AAS).
