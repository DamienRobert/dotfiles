vim: fdm=expr ft=markdownlight

Doc
===

http://blog.ezyang.com/2010/10/ocaml-for-haskellers/
http://science.raphael.poss.name/haskell-for-ocaml-programmers.html

https://github.com/bitemyapp/learnhaskell

Functions
=========

- Evaluation:
  ($) :: (a -> b) -> a -> b
  f 2 = f $ 2 = ($) f 2
- @ apply
  (>$>) :: a -> (a -> b) -> b
  x >$> f = f x = f $ x as well
- composition
  (.) :: (b -> c) -> (a -> b) -> (a -> c)
  g . f = \x -> g (f x)
- @ composition
  (>.>) :: (a -> b) -> (b -> c) -> (a -> c)
  f >.> g = g.f = \x -> g (f x) = \x -> x >$> f >$> g

Monades
=======
[see Info/Monades pour plus de détails]

  f :: a -> m b
  g :: b -> m c
- bind (the monadic version of >$>):
  (>>=) :: m a -> (a -> m b) -> m b

  (=<<) :: (a -> m b) -> m a -> m b
  f =<< x  =  x >>= f
  ie (=<<)= flip (>>=)
  avec flip :: (a -> b -> c) -> (b -> a -> c)
  flip f = \x y -> f y x

- mcompose:
  (>=>) :: (a -> m b) -> (b -> m c) -> a -> m c
  f >=> g = \x -> (f x >>= g) 

  (<=<) :: (b -> m c) -> (a -> m b) -> (a -> m c)
  (<=<) = flip (>=>)

- return :: a -> m a

- (>>) :: m a -> m b -> m b
  mv1 >> mv2  =  mv >>= (\_ -> mv2)

class Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  return :: a -> m a
  (>>) :: m a -> m b -> m b
  fail :: String -> m a

Monadic laws:
  1. return >=> f       ==    f
  2. f >=> return       ==    f
  3. (f >=> g) >=> h    ==    f >=> (g >=> h)
Equivalently:
  1. return x >>= f    ==  f x
  2. mv >>= return     ==  mv
  3. (mv >>= f) >>= g  ==  mv >>= (\x -> (f x >>= g))

Do notation:
  -- mv  :: m a
  -- v1  :: a
  -- f   :: a -> m b
  -- v2  :: b
  -- mv3 :: m c
  do v1 <- mv
     v2 <- f v1
     mv3
     return v2
is the same as
  mv >>= \v1 ->
    f v1 >>= \v2 ->
      mv3 >> return v2
[ie with v1 <- mv we keep mv in the bind, while without the <- we use >>
which is like the bind but it throw the given value, ie we don't use 'mv3'
here. We can interpret v1 <- mv in the do as 'extract mv into v1', because
everything is wrapped into monodic operations]
