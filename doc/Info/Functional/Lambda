vim: foldmethod=expr ft=markdownlight

Cf wikipedia pour l'isomorphisme de Curry-Howard
+ http://ncatlab.org/nlab/show/computational+trinitarianism
(logic = category theory = type theory)
See: http://math.ucr.edu/home/baez/qg-fall2006/index.html#computation
And the paper 'Physics, Topology, Logic and Computation: a Rosetta Stone'
http://math.ucr.edu/home/baez/rosetta.pdf

Lambda Calcul
=============

http://en.wikipedia.org/wiki/Lambda_calculus#.CE.B1-conversion

- Free and bound variables
The abstraction operator, λ, is said to bind its variable wherever it occurs in the body of the abstraction. Variables that fall within the scope of an abstraction are said to be bound. All other variables are called free. For example, in the following expression y is a bound variable and x is free: λy.x x y. Also note that a variable is bound by its "nearest" abstraction. In the following example the single occurrence of x in the expression is bound by the second lambda: λx.y (λx.z x)
The set of free variables of a lambda expression, M, is denoted as FV(M) and is defined by recursion on the structure of the terms, as follows:
    FV(x) = {x}, where x is a variable
    FV(λx.M) = FV(M) \ {x}
    FV(M N) = FV(M) ∪ FV(N)[13]
An expression that contains no free variables is said to be closed. Closed lambda expressions are also known as combinators and are equivalent to terms in combinatory logic.

- α-conversion

Alpha-conversion, sometimes known as alpha-renaming,[15] allows bound variable names to be changed. For example, alpha-conversion of λx.x might yield λy.y. Terms that differ only by alpha-conversion are called α-equivalent. Frequently in uses of lambda calculus, α-equivalent terms are considered to be equivalent.

- β-reduction
Beta-reduction captures the idea of function application. Beta-reduction is defined in terms of substitution: the beta-reduction of  ((λV.E) E′)  is E[V := E′].
For example, assuming some encoding of 2, 7, ×, we have the following β-reduction: ((λn.n×2) 7) → 7×2.

- η-conversion
Eta-conversion expresses the idea of extensionality, which in this context is that two functions are the same if and only if they give the same result for all arguments. Eta-conversion converts between λx.(f x) and f whenever x does not appear free in f.

Plus précisément: passer de f à function x -> f(x) est une "eta-expansion"
et l'inversion une "eta-contraction"

Y-Combinator
============

Y:f -> f(Y(f)) [dans un langage paresseux], ie
Y(f)=f(x \to Y(f)(x)) [dans un langage strict]
    =x \to f(Y(f))(x)
where f takes a function to a function
and Y(f) is the fixed point of f.

See: http://mvanier.livejournal.com/2897.html for a detailled explanation,
or https://gist.github.com/deepakjois/2689336 with examples in ruby.

[Implems:]
http://rosettacode.org/wiki/Y_combinator#Ruby
~~~ ruby
 #cheating
y = lambda do |f|
  lambda {|*args| f[y[f]][*args]}
end

 #lambda
y = ->(f) {->(g) {g.(g)}.(->(g) { f.(->(*args) {g.(g).(*args)})})}
fac = ->(f) { ->(n) { n < 2 ? 1 : n * f.(n-1) } }
p 10.times.map {|i| y.(fac).(i)}
fib = ->(f) { ->(n) { n < 2 ? n : f.(n-2) + f.(n-1) } }
p 10.times.map {|i| y.(fib).(i)}

 #methods
def y(&f)
  lambda do |g|
    f.call {|*args| g[g][*args]}
  end.tap {|g| break g[g]}
end
fac = y {|&f| lambda {|n| n < 2 ? 1 : n * f[n - 1]}}
fib = y {|&f| lambda {|n| n < 2 ? n : f[n - 1] + f[n - 2]}}
p Array.new(10) {|i| fac[i]}
 # => [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
p Array.new(10) {|i| fib[i]}
 # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
~~~

Exemple
=======

- http://codon.com/programming-with-nothing
https://news.ycombinator.com/item?id=3343205
FizzBuzz program in lambda calculus (via ruby blocks)

Biblio
======

http://okmij.org/ftp/tagless-final/course/lecture.pdf
Typed Tagless Final Interpreters
alternative  to  the  traditional,  or  ‘initial’  encoding  of  anobject language as a (generalized) algebraic data type.
