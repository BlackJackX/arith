open Format

type term = 
    ANum of int
  | ABool of bool
  | IFTHEN of term * term * term
  | PRED of term
  | SUCC of term
  | ISZERO of term


let rec term2string t = 
  match t with
      ANum x -> string_of_int x
    | ABool x -> string_of_bool x
    | IFTHEN(t1, t2, t3) -> 
        let tl = ["("; "if"; term2string t1; "then"; 
          term2string t2; "else"; term2string t3; ")"] in
        String.concat " " tl
    | PRED t1 -> 
        let tl = ["("; "pred"; term2string t1; ")"] in
        String.concat " " tl
    | SUCC t1 -> 
        let tl = ["("; "succ"; term2string t1; ")"] in
        String.concat " " tl
    | ISZERO t1 -> 
        let tl = ["("; "iszero"; term2string t1; ")"] in
        String.concat " " tl

