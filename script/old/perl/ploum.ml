let a = 1+1 in a*a;;
1+;;

let rec fact n =  match n with
  0 -> 1
  | n -> n * fact(n-1);;

fact(2);;
