
type term = 
    ANum of int
  | ABool of bool
  | IFTHEN of term * term * term
  | PRED of term
  | SUCC of term
  | ISZERO of term

val term2string : term -> string
