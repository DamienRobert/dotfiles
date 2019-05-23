let string_of_list l=
  let s=String.create (List.length l) in
  let _=List.fold_left
    (fun i c->s.[i]<-(if c>=' '&&c<='~' then c else ' '); i+1)
    0 l in
  s

let clean_field l=
  let rec pop=function
    | [] -> []
    | (t::q) as l ->
      if t>' '&&t<='~' then l else pop q
  in string_of_list (pop (List.rev (pop l)))

let rec parse_amf l=
  match
    try
      Some(input_char stdin)
    with
      | _ -> None
  with
    | None -> []
    | Some '\000' -> clean_field l::parse_amf []
    | Some c -> parse_amf (c::l)

let rec get_songs=function
  | "SNG_ID"::sid::"SNG_TITLE"::title::"ART_ID"::aid::"ART_NAME"::aname::
    "ALB_ID"::lid::"ALB_TITLE"::ltitle::q->
      (aname,ltitle,title)::get_songs q
  | _::q -> get_songs q
  | [] -> []

let _=
  let doc=parse_amf [] in
  let songs=get_songs doc in
  List.iter (function an,lt,t->Printf.printf "%s|%s|%s\n" an lt t) songs
