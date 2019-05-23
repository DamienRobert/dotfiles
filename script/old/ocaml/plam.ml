type carte = Joker | Pique of int | Coeur of int | Carreau of int | Trefle of int;;

let rec separe l = match l with
    [] -> [], [], [], [], []
  | p::q -> let l1,l2,l3,l4,l5 = separe q in
      match p with
          Joker -> l1,l2,l3,l4,p::l5
        | Pique n -> p::l1, l2, l3, l4, l5
        | Coeur n -> l1, p::l2, l3, l4, l5
        | Carreau n -> l1, l2, p::l3, l4, l5
        | Trefle n -> l1, l2, l3, p::l4, l5;;

let valeur c = match c with
          Joker -> 0
        | Pique n | Coeur n | Carreau n | Trefle n -> n ;;
let valide l =
  let l1,l2,l3,l4,l5 = separe l in
  let valeurs = [1;2;3;4;5;6;7;8;9;10;11;12;13] in
  let rec compte c v = match v with
      [] -> 0
    |p ::q -> (if valeur p = c then 1 else 0) + compte c q in
  List.for_all (function l-> List.for_all (function x -> compte x l = 1) valeurs) [l1;l2;l3;l4];;

let rec une_carte joueurs tas = match joueurs with
    [] -> [], tas
  | p::q -> match tas with
        [] -> joueurs, tas
      | u::v -> let nj, nt = une_carte q v in
          (u::p)::nj, nt;;

let rec distribue n joueurs tas = if n = 0 then joueurs else
  let (nj,nt)=une_carte joueurs tas in distribue (n-1) nj nt;;
