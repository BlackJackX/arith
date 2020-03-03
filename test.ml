
let rec f1 x = 
  match x with
      t when t > 0 -> f2 (t-1);
    |  _ -> 0

  and f2 x = 
    match x with
        t when t > 0 -> f1 (t-1);
        | _ -> 0    