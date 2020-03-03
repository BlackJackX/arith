open Syntax
open Core

let t1 = ABool true
let t2 = ANum 2
let t3 = ANum 4

let t4 = IFTHEN(t1, t2, t3)
let t5 = SUCC(t4)
let t = IFTHEN(ISZERO(t2), t4, t5)

let () = print_endline (term2string(eval(t)))

let () = print_int(size (t))