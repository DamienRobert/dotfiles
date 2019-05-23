let affiche_sudoku a =
  (* m ligne, n colone *)
  let m= Vect.length a and n = Vect.length a.(0) in
  for i = 0 to m -1 do
    for j = 0 to n - 1 do
      print_int a.(i).(j)
    done;
    print_newline()
  done
;;

let test=Array.make_matrix 9 9 0;;

affiche_sudoku test;;
