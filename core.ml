open Syntax

exception TypeNotMatch


let rec eval t =
  let () = print_endline(term2string t) in
  match t with
      (ANum _ | ABool _) -> t
    | IFTHEN(_, _, _) -> eval_ifthen t
    | SUCC(_) -> eval_succ t
    | PRED(_) -> eval_pred t
    | ISZERO(_) -> eval_iszero t

  and eval_succ t = 
    match t with
        SUCC(ANum(x)) -> ANum(x+1)
      | SUCC(t1) -> eval(SUCC(eval(t1)))
      | _ -> raise TypeNotMatch 

  and eval_pred t = 
    match t with
        PRED(ANum(x)) when x!=0 -> ANum(x-1)
      | PRED(ANum(x)) when x==0 -> ANum(0)
      | PRED(t1) -> eval(PRED(eval(t1)))
      | _ -> raise TypeNotMatch

  and eval_iszero t = 
    match t with
        ISZERO(ANum(x)) when x==0 -> ABool(true)
      | ISZERO(ANum(x)) when x!=0 -> ABool(false)
      | ISZERO(t1) -> eval(ISZERO(eval(t1)))
      | _ -> raise TypeNotMatch

  and eval_ifthen t = 
    match t with
        IFTHEN(ABool(true), t1, t2) -> eval(t1)
      | IFTHEN(ABool(false), t1, t2) -> eval(t2)
      | IFTHEN(t1, t2, t3) -> eval(IFTHEN(eval(t1), eval(t2), eval(t3)))
      | _ -> raise TypeNotMatch



let rec size t = 
  match t with
      (ANum(_) | ABool(_)) -> 1
    | (ISZERO(t1) | SUCC(t1) | PRED(t1)) -> 1+size(t1)
    | IFTHEN(t1, t2, t3) -> 1+size(t1)+size(t2)+size(t3)