vim: fdm=expr ft=markdownlight

Documentation
=============

https://spyder.wordpress.com/2014/03/16/why-ocaml-why-now/
http://roscidus.com/blog/blog/2013/06/20/replacing-python-round-2/
http://roscidus.com/blog/blog/2013/09/28/ocaml-objects/
http://roscidus.com/blog/blog/2013/12/20/polymorphism-for-beginners/
https://blog.baturin.org/introduction-to-ocaml.html

Syntax
======

(* constantes *)
let n=3 and m=3;;

(* temporary assignement *)
let n=3 in n+1;;
[let x=a in b is equivalent to (function x->b)(a)]

(* functions *)
# let f x y=x+y;;
val f : int -> int -> int = <fun>
# let f=function x -> function y -> x+y;;
val f : int -> int -> int = <fun>
# let f = fun x y -> x+y;;
val f : int -> int -> int = <fun>

(* references *)
# let x=ref 0;;
val x : int ref = {contents = 0}
# !x;;
- : int = 0
# x:=2;;
- : unit = ()
# x ;;
- : int ref = {contents = 2}

(* arrays *)
# let a = [| 1; 2|];;
val a : int array = [|1; 2|]
# a.(0);;
- : int = 1
# a.(0) <- 5;;
- : unit = ()
# a;;
- : int array = [|5; 2|]

(* lists *)
# let a=[1;2];;
val a : int list = [1; 2]

(* blocks *)
()
begin; end;

(* imperatif *)
if foo then bar else baz
for k=1 to/downto n do bar... done
while cond do ... done

exception NoMore;;
raise NoMore;;
try ... with NoMore -> ...

(* pattern matching *)
let rec intersection l1 l2 = match (l1,l2) with
    [], _ -> []
  | _,[] -> []
  |p1::q1, p2::q2 -> if p1<p2 then intersection q1 l2 else
                     if p1>p2 then intersection l1 q2
                     else p1::intersection q1 q2;;
val intersection : 'a list -> 'a list -> 'a list = <fun>
