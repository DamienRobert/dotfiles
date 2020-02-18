vim: ft=markdownlight fdm=expr

https://news.ycombinator.com/item?id=19039525
Some Fundamental Theorems in Mathematics (arxiv.org) => Nice list!
https://arxiv.org/abs/1807.08416

Enigmes
=======

See ~/Papiers/Maths/puzzles.pdf
http://psthomas.com/LogicPuzzles.html
https://en.wikipedia.org/wiki/The_Hardest_Logic_Puzzle_Ever

See also: http://www.teamliquid.net/forum/general/270819-math-puzzles
and http://www.teamliquid.net/forum/search.php?q=math+puzzle
http://www.devenir-rentier.fr/t9781

Infinite hats
-------------
http://www.teamliquid.net/blogs/93007-really-hard-puzzle?page=2
This is probably the hardest puzzle that i've solved myself:

An infinite number of ppl are given either a black or a white hat. They can't see what colour hat they have on but they can see everyone elses. They cannot communicate with each other in anyway once they've been given the hats but they can devise a strategy before the game starts. Then, at a predetermined time, they all have to shout out the colour hat they think they have on [at the same time]. They win if only finitely many get it wrong.


There are no pissy tricks like "looking in a mirror" or sneaking round the "no communication" rule and we assume they can see all the the other ppl at once and perform any computations they might need to instantly.

right so if you don't know/believe the axiom of choice you'll have to come up with a solution i haven't thought of yet. You might have come across the axiom in one of it's many forms (Zorn's lemma, Well-ordering principle) at some point in a maths degree but otherwise, even if you look it up on wiki, you'll struggle to know how to use it. It (roughly) says that if you have any collection of sets, you can pick an element in each of them, equivalently it says you can "well order" any set (ie you can say x<y or y<x for any x not equal to y).

I was told this puzzle a while ago, but it's solution actually came up the other day in some proper maths i was doing in a really natural way. One thing that's pretty weird is that i don't think it's possible to come up with a strategy that works if we replace "only finitely many" with "less than n" for an arbitrarily large n

ANSWER: take a representative on the equivalence class of sequences modulo
they differ in a finite number of places:
Call two ways of matching hats to people equivalent if only finitely many people are assigned different colored hats.
This is an equivalence relation. Beforehand, the prisoners agree on a single element from each equivalence class using Choice.

GONDOLIN:
On May 13 2009 15:03 Muirhead wrote:
Haha... the funny thing is that while you are right that each prisoner has 1/2 probability of surviving, still only finitely many will die. Infinity is strange... this problem is basically the probability-theory version of the existence of non-measurable sets (look up Banach-Tarski paradox).


Another way to state this is that if you look at a finite subset of people, then only half of them will survive. However when you look at an infinite number, only finitely many will not survive.

That only means that the function Cardinal is not continuous on P(N)=2^N (with the tychonoff topology).

But this is very easy to see, if you have a sequence (X_n) where X_i \subset N, then you can define the inferior limit
X_inf=\cup_{k >= 0} \cap_{l >= k} X_l
and the superior limit
X_sup=\cap_{k >= 0} \cup_{l >= k} X_l
then X_inf is a subset of X_sup, and we say that X_n -> X if X_inf=X_sup=X.

Now if X_n=[0,n], X_n->N, but if X_n=[n,2n], X_n-> \emptyset. So you have two exemples of sets with n elements converging to completely different things.

Three legged spiders
--------------------
http://www.teamliquid.net/blogs/93184-yet-another-math-puzzle?page=3

Definition: A three-legged spider is a the union of three line segments, all meeting at a single point. For example, a T is a three-legged spider.

Question: Can you fit uncountably many three-legged spiders in the plane? If not, can you prove it is impossible?

EDIT:
The plane is infinite
The spiders need not all be congruent
No leg of any given spider may be contained in another leg of that spider
No two distinct spiders can intersect anywhere

ANSWER:
Suppose, for the sake of contradiction, that there are uncountably many spiders in the plane.
Let the width of a spider be the minimum distance from its center to one of its three endpoints.
For some positive integer N, uncountably many spiders have width at least 1/N. Erase all the spiders with width less than 1/N
Cover the plane with countably many disks of diameter 1/N. At least one such disk has uncountably many centers of spiders. Erase all spiders with centers not in the disk. [NdeDams: diamètre 1/2N?]
Each spider divides the disk into three distinct regions. Associate a triplet of rational points to the spider, one point in each region.

Fourier analysis on number fields
---------------------------------
http://www.teamliquid.net/blogs/98480-fourier-analysis-on-number-fields

I'm trying to write complete solutions to the problems in Ramakrishnan and Valenza's book. The problems are generally approachable but given the sheer volume of questions I know I'm going to get stuck in a few places. The first place I'm getting stuck is on part (b) of problem 6 in Chapter 2.

The book uses the convention that a Banach algebra is a (not necessarily commutative) unital algebra whose elements form a complex Banach space and such that
||a times b|| <= ||a|| times ||b||
for any two elements a and b.

I'm supposed to find an example of a Banach algebra together with two elements a and b such that ab is invertible but ba is not invertible.

ANSWER:
Take X to be the Banach space of (square-summable) complex-valued functions on the set of positive integers, with norm something like

(Sum) |f(k)|^2.

(Square-summable meaning I want to take just those functions with finite norm here.)

Look at the algebra of bounded linear operators on X. Take a and b to be the operators

a(f)(n) = f(2n)
b(f)(2n) = f(n) and b(f)(2n+1) = 0.

I think a and b are bounded. b is not surjective, so ba cannot be invertible. On the other hand, ab is the identity already.

Quartic equations
-----------------
http://www.teamliquid.net/blogs/66841-solving-the-quartic-equation

I thought I would devote this entry to some interesting mathematics rather than a problem.

All of us know how to solve quadratic equations, and if you know Galois theory you know it is impossible to solve a quintic. Recently I saw a very cool way to solve the general quartic equation, relying on a bit of geometry. It does assume that we can already solve cubic equations.

Suppose P(x)=x^4+ax^3+bx^2+cx+d is an arbitrary quartic polynomial.

Let Q(x,y)=x-y^2 and let R(x,y)=y^2+axy+by+cx+d.

To find the zeros of P, it will suffice to find the common zeros of Q and R, two conics.

Let S(x,y,z)=xz-y^2 and let T(x,y,z)=y^2+axy+byz+cxz+dz^2

If we find the common zeros of S and T, we can set z=1 and find the common zeros of Q and R.

If C is any complex number, then CS+(1-C)T shares the same common zeros as S and T.

Our strategy will be to find a C which makes CS+(1-C)T particularly simple.

We can view CS+(1-C)T as a quadratic form on 3-space. The symmetric matrix representing this form will have entries that are linear polynomials in C.

By Sylvester's theorem, the form is degenerate if and only if the matrix has determinant 0. But the determinant will be a degree 3 polynomial in C, and since we can solve degree 3 polynomials we can find a C which makes CS+(1-C)T degenerate.

Geometrically, this means that the zeros of CS+(1-C)T are two planes. Finding the planes is a linear problem of completing the square, so we can assume the planes are known.

We want to find the common zeros of S, CS+(1-C)T, and z-1.

But the common zeros of the second two polynomials listed above are just two lines, and it is easy to find the intersections of a line with a quadratic like S!

Private points of sphere
-------------------------
http://www.teamliquid.net/blogs/93178-math-puzzle-day10#19

KG1128:
You have n spheres of equal size. distributed in some way in space.

A point on a sphere is called "private" if all other spheres cannot see it.
In more precise definition, private means you cannot draw a segment from any point on any other sphere, to that point, without crossing the surface of some spheres.

Your quest:
Find the area of ALL the private points, what is it?

ANSWER by MUIRHEAD:
Draw any plane in space somewhere far away from the spheres and move the plane in the direction of the spheres so that it remains parallel to its previous positions. The plane will first touch the spheres at some point A on some sphere, and last touch the spheres at some point B on some sphere. Then A and B are the only private points whose tangent planes are parallel to the original plane. Consider all possible directions for starting planes and we are done.

KG1128:
Muirhead, I like your answer.

but to be more complete you have to address these 2 things:

A. plane can touch multiple spheres at the same time
B. let x = radius of the spheres. whether x is 1 or 10 or 10000, same number of planes will hit same number of tangent points, yet the surface area of the sphere is different in each case.

if you can explain why A or B can be ignored, your proof is complete i think.

GONDOLIN:
What he did is to construct a map from the grassmanian Gr(2,3) to the set of private points.
Identify Gr(2,3) with Gr(1,3) = P(R^3)=S^2/+-1.

Now except for a finite number of points, this application is etale and has for differential the homotethy x*Id. Hence the area of the private points is x*Surface(S^2) (since the application is doubly valued).

[Edit: Oops, i meant "except for a *finite union of 1-dimensional subvarieties*, the application is etale blabla"... Thanks Muirhead for the correction, this will teach me to only make drawings in dimension 2...]

MUIRHEAD:
Here's a more formal sketch

I defined a "map" F from the real projective plane to pairs of points on the spheres. The map F is well-defined unless the moving plane's final point of contact or initial point of contact with the spheres is shared by more than one sphere (i.e. your A.). One can see that the set of points in the real projective plane which are messed up in this fashion is a finite union of curves (subsets of projections of great circles on the sphere). Thus, in reality F maps an open, dense subset of the real projective plane onto pairs of points on the spheres. If n is the total number of spheres, there is a natural n-fold covering map G from the n spheres onto a single sphere. One sees that F followed by G is an "inverse" for the canonical projection from the sphere to the projective plane.

My box puzzle
-------------
http://www.teamliquid.net/blogs/93171-really-hard-puzzle-2

You are playing a game. In this game there is an infinite (countable) number of boxes, and in each box a number. The host is free to place any number inside a box (and he can place the same numbers into different boxes).

You can open as many boxes as you want (even infinitely many), as long as you leave at least one box closed. You then state the number you think there is inside a closed box. You win if you guessed the right number.

How do you play?
What i pretend is that for every n>0, you have a strategy so that your probability of success is greater than 1-1/n!
In other word you can't always win (duh!) but you have a strategy that
gives you 999 999/ 1 000 000 chances to win!

ANSWER:
So you choose a choice function s on the sequences modulo cofinite equivalence like you did (the same function as for the hats problem).
You split the boxes into n sequences u1, u2, ..., un.

Now s(u1) is a sequence that is equal to u1 on a cofinite set. This mean there exist A1 such that s(u1)_n = u1_n if n >= A1. Define in the same way the numbers A2, ..., An.

Now you open all the boxes for u1, u2, ..., u(n-1). This allow you to find the numbers A1, ..., A(n-1). You take A=Max(A1, ..., A(n-1)), and you open all the boxes in the sequence un except (un)_A. Now you give s(un)_A as your answer, you win if An<=Max(A1,...,An-1).

So you have n strategies (depending on the column you don't open at the beginning), and only one may fail.

Guess the hat color
-------------------
http://spikedmath.com/puzzle-002.html

"Three people enter the room, each with a hat on their head. There are two colors of hats: red and blue; they are assigned randomly. Each person can see the hats of the two other people, but they can't see their own hats. Each person can either try to guess the color of their own hat or pass. All three do it simultaneously, so there is no way to base their guesses on the guesses of others. If nobody guesses incorrectly and at least one person guesses correctly, they all share a big prize. Otherwise they all lose.

=>

I think the optimal strategy is: if one sees that the other two have their hats in the same colour, he says the other colour; if one sees that the other two have different colours, he passes. Then the only way they can loose is in the situation from the comic - when they all have the same colour. => 3/4 of success

Chapeaux sur 100 mathématiciens
-------------------------------
Il y a 100 mathématiciens alignés; ils doivent dire la couleur de leur
chapeau et n'ont droit qu'à une erreur. On commence par le dernier de la
file, celui qui voit tous les chapeaux.

Stratégie: énoncer \sum couleur mod Nombre de couleur
Les autres peuvent alors déterminer leur couleur.

Blue eyes
---------
Blue eyes:
http://robertheaton.com/2014/01/06/how-to-win-at-dinner-party-the-blue-eyed-islanders/
https://terrytao.wordpress.com/2011/04/07/the-blue-eyed-islanders-puzzle-repost/http://math.stackexchange.com/questions/489308/blue-eyes-a-logic-puzzle

100 prisoners and boxes
-----------------------
https://en.wikipedia.org/wiki/100_prisoners_problem
http://puzzling.stackexchange.com/questions/16/100-prisoners-names-in-boxes

Chapeaux et boites
------------------
Encore l'énigme des chapeaux et des boîtes (avec des commentaires de moi
pour la solution des boîtes):
http://blog.computationalcomplexity.org/2016/07/an-infinite-hat-problem-and-later-point.html
http://blog.computationalcomplexity.org/2016/07/solution-to-infinite-hat-problema.html
http://blog.computationalcomplexity.org/2016/07/solution-to-alice-bob-box-problem.html

Strange Things
==============

- http://en.wikipedia.org/wiki/Exotic_R4
R^4 a des structures exotiques, et c'est le seul R^n dans ce cas

- Aut(S_n) est donné par les autos intérieurs, sauf pour n=6

forum:alt.bavardage.maths#9657
- La somme de Minkowski de deux convexes C^\infty dans
le plan est C^6 mais pas forcément C^7 (en fait, elle est C^{20/3}, et
l'exposant dépend de la dimension ; mais c'est moins surprenant si on
dit ça, donc c'est un peu une arnaque).
- il y a plein de résultats autour des groupes finis
(où en général un truc exceptionnel décèle un groupe sporadique qui se
cache), comme le fait que A_n a un multiplicateur de Schur égal à 2
pour tout n sauf 6 ou 7 auquel cas il vaut 6.

yaf.maths:1122 (ou mathoverflow je sais plus quoi):
  On dit qu'un polynôme univarié f à coefficients complexes (i.e., f
  dans C[x]) est «×indécomposable×» lorsque f n'est pas le composé de
  deux tels polynômes sauf si l'un d'eux est de degré×1.
  
  Théorème×: soient f et g deux polynômes univariés à coefficients
  complexes, non-constants et indécomposables.  Supposons que f(x)-g(y)
  se factorise de façon non-triviale dans C[x,y].  Alors SOIT
  g(x)=f(ax+b) pour a,b complexes, SOIT deg(f)=deg(g) est dans
  l'ensemble {7,11,13,15,21,31}.
  
  Et le plus bizarre, c'est sans doute ceci×: la preuve connue de ce
  théorème dépend de la classification des groupes simples finis.
  
  (Référence×: théorème×1.1 de Feit, "Some Consequences of the
  Classification of Finite Simple Groups", p. 176-181 in: Cooperstein &
  Mason (eds), *The Santa Cruz Conference on Finite Groups* (Santa Cruz
  1979), AMS Proceedings of Symposia in Pure Math 37 (AMS 1980).)

- i^i \in R (i=e^(i \pi) donc i^i=e^-\pi)

Votes
=====


https://en.wikipedia.org/wiki/Electoral_system
## Ranked voting methods:
vote  simple  transferable (STV), (vote alternatif)
https://en.wikipedia.org/wiki/Single_transferable_vote

https://en.wikipedia.org/wiki/Maximal_lotteries
Probabilistic: Nash equilibrium

https://en.wikipedia.org/wiki/Schulze_method
The Schulze method (/ˈʃʊltsə/) is an electoral system developed in 1997 by Markus Schulze that selects a single winner using votes that express preferences.

## Rated voting methods:
In "range voting", voters score or rate each option on a range, and the
option with the highest total or average score wins. In "majority judgment",
similar ballots are used, but the winner is the candidate with the highest
median score.
https://fr.wikipedia.org/wiki/Jugement_majoritaire
https://en.wikipedia.org/wiki/Majority_judgment

https://en.wikipedia.org/wiki/Range_voting

## References

http://www.lamsade.dauphine.fr/%7Elang/runoff.pdf
https://interstices.info/jcms/p_92522/comment-designer-le-vainqueur-d-une-election
https://lechoixcommun.fr/articles/Vous_reprendrez_bien_un_peu_de_democratie-1.html #Jugement majoritaire (ie medianne)
http://rangevoting.org/RangeVoting.html #pub pour le système de la moyenne des notes
http://voteaupluriel.org/ #essais de votes sur scrutins alternatifs
https://hal.archives-ouvertes.fr/hal-01304043/document #Majority Judgment vs Majority Rule
http://www.votedevaleur.org/co/votedevaleur.html

Voting matter:
https://www.skishore.me/voting.html
http://norvig.com/election-faq-2012.html#rational

Ranking
=======

- ELO
- Trueskill, trueskill through time
- Whole history rating: https://www.remi-coulom.fr/WHR/
  => ruby implem: https://github.com/goshrine/whole_history_rating
- trueskill2: https://www.microsoft.com/en-us/research/uploads/prod/2018/03/trueskill2.pdf
- https://rankade.com/ree

- Starcraft => Aligulac: http://aligulac.com/about/faq/
- Dota: https://www.dotainternational.com/how-dota-2-mmr-ranking-works-detail-guide/
        https://www.dotainternational.com/calibration-mmr-dota-2-detailed-guide/

Probas
======

https://www.gregegan.net/ESSAYS/TUESDAY/Tuesday.html
