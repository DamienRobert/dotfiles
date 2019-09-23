vim: foldmethod=expr ft=markdownlight

* Wikipedia: http://en.wikipedia.org/wiki/Call-with-current-continuation
call/cc f prend la continuation cont et applique f(cont) avec pour
continuation cont.

* Links
https://wingolog.org/archives/2016/02/08/a-lambda-is-not-necessarily-a-closure
=> lambda: contified

# Continuations

(par convention une continuation, en plus de changer le flot d'execution,
retourne la valeur passée:)
callcc {|cont|  cont.call }           #=> nil
callcc {|cont|  cont.call 1 }         #=> 1
callcc {|cont|  cont.call 1, 2, 3 }   #=> [1, 2, 3]

callcc {|cont| p 1; cont.call; p 2} #execution resume here, p 2 is not executed

~~~ ruby
ruby <<'EOS'
require 'continuation'
x=0; callcc {|cont| $cont=cont}; p x; x+=1; $cont.call
EOS
#=> loops endlessly, printing increasing values of x.
~~~

## yin/yang: http://everything2.com/title/call%252Fcc+yin-yang+puzzle
~~~ ruby
#The yin yang puzzle in ruby: http://blog.gonzih.me/blog/2013/11/26/yin-yang-callcc-puzzle-in-ruby/
require "continuation"
lambda do |yin, yang|
  yin.call(yang)
end.call(lambda { |cc| print "@"; cc }.call(callcc { |c| c }),
         lambda { |cc| print "*"; cc }.call(callcc { |c| c }))
 #=> @*@**@***@****@*****@******@...

 #Warning, doing it this way
require "continuation"
yin  = ->(cc) { print "@"; cc }.call(callcc { |c| c })
yang = ->(cc) { print "*"; cc }.call(callcc { |c| c })
yin.call(yang)
 #gives => @*@******************...

 # "Debug" version
lambda do |yin, yang|
  yin.call yang
end.call(lambda {|cc| print "@ - #{cc}\n"; sleep 0.1; cc }.call(callcc {|c| c}),
         lambda {|cc| print "* - #{cc}\n"; sleep 0.1; cc }.call(callcc {|c| c}))
~~~

## Continuation passing style 
(k est "le reste du programme", ie la continuation):

f=->(x,y){(x+1)*y} devient
add=->(x,y,k) {k.(x+y)}
time=->(x,y,k) {k.(x*y)}
f=->(x,y,k) {add.(x,1, ->(xp1){ time.(xp1,y,k) })}
fc=f.curry.(1,2)
fc.(->(k){k})

f=->(x,y){x*x+y*y} devient
f=->(x,y,k) {time.(x,x, ->xx { time.(y,y,->yy { add.(xx,yy,k) })})}
f.(2,3,->k {k})
[en pratique f est définie par
(x,y,k) -> (x*x)@ xx -> (y*y)@ yy -> (xx+yy)@ z -> z@k
où l'on n'a pas besoin de parenthèse sur @ car par associativité
u@x->f(x)@y->g(y)=u@(x->(f(x)@(y->g(y))))=(u@(x->f(x)))@(y->g(y))=u@f@g]

factorial=->(n,k) { 
  n==1 ? k.(1) : add.(n,-1, -> nm1 {
    factorial.(nm1, -> f { time.(n,f,k) })
  })
}
factorial.(3,->k {k})

callcc est définit via
callcc=->(f,k) { k f.(k) }

## CPS et defonctionalisaton

- http://gallium.inria.fr/blog/generators-iterators-control-and-continuations/
- https://news.ycombinator.com/item?id=20444143
  Defunctionalize the Continuation (pathsensitive.com)

Monades et Continuations passing style
======================================
[voir aussi Monades]

* http://en.wikibooks.org/wiki/Haskell/Continuation_passing_style

add_cps :: Int -> Int -> (Int -> r) -> r
add_cps x y k = k (add x y)
square_cps :: Int -> (Int -> r) -> r
square_cps x k = k (square x)
pythagoras_cps :: Int -> Int -> (Int -> r) -> r
pythagoras_cps x y k =
 square_cps x $ \x_squared ->
  square_cps y $ \y_squared ->
   add_cps x_squared y_squared $ \sum_of_squares ->
    k sum_of_squares

newtype Cont r a = Cont { runCont :: (a -> r) -> r }
import Control.Monad.Cont
add_cont :: Int -> Int -> Cont r Int
add_cont x y = return (add x y)
square_cont :: Int -> Cont r Int
square_cont x = return (square x)
pythagoras_cont :: Int -> Int -> Cont r Int
pythagoras_cont x y =
    do x_squared <- square_cont x
       y_squared <- square_cont y
       sum_of_squares <- add_cont x_squared y_squared
       return sum_of_squares

square_C :: Int -> Cont r Int
square_C x = return (x ^ 2)
addThree_C :: Int -> Cont r Int
addThree_C x = return (x + 3)
main = runCont (square_C 4 >>= addThree_C) print
{- Result: 19 -}

The Monad instance for (Cont r) is given below:
instance Monad (Cont r) where
  return n = Cont (\k -> k n)
    m >>= f  = Cont (\k -> runCont m (\a -> runCont (f a) k))
So return n is a Cont-value that throws n straight away into whatever
continuation it is applied to. m >>= f is a Cont-value that runs m with
the continuation \a -> f a k, which maybe, receive the result of
computation inside m (the result is bound to a) , then applies that
result to f to get another Cont-value. This is then called with the
continuation we got at the top level (the continuation is bound to k);
in essence m >>= f is a Cont-value that takes the result from m,
applies it to f, then throws that into the continuation.

callCC :: ((a -> Cont r b) -> Cont r a) -> Cont r a
           ^^^^^^^^^^^^^^     ^^^^^^^^
            continuation k     résultat de f
callCC f = Cont $ \k -> runCont (f (\a -> Cont $ \_ -> k a)) k

Example: square using callCC
-- Without callCC
square :: Int -> Cont r Int
square n = return (n ^ 2)
-- With callCC
square :: Int -> Cont r Int
square n = callCC $ \k -> k (n ^ 2)

## Continuations are the mothers of all monads

http://blog.paralleluniverse.co/2015/08/07/scoped-continuations/
Discussion on HN: https://news.ycombinator.com/item?id=9852073
http://blog.sigfpe.com/2008/12/mother-of-all-monads.html
Reddit discussion: https://www.reddit.com/r/haskell/comments/1cyajx/the_mother_of_all_monads_school_of_haskell/
Counter exemple for a monad using lazy evaluation: https://blog.melding-monads.com/2009/12/20/are-continuations-really-the-mother-of-all-monads/

# Delimited vs undelemited continuations

https://en.wikipedia.org/wiki/Delimited_continuation
http://okmij.org/ftp/continuations/against-callcc.html
http://okmij.org/ftp/continuations/undelimited.html#delim-vs-undelim

Delimited continuations:
- shift/reset vs delimcc https://stackoverflow.com/questions/14431257/how-to-translate-shift-reset-into-delimcc
