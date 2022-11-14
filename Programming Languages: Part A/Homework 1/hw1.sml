fun is_older(date1 : (int * int * int), date2: (int * int * int)) =
  let
    val (y1,m1,d1) = date1
    val (y2,m2,d2) = date2
  in
    if y1 < y2 then true
    else if y1 > y2 then false
    else if m1 < m2 then true
    else if m1 > m2 then false
    else d1 < d2
  end;
