fun is_older(date1 : (int * int * int), date2 : (int * int * int)) =
  let
    val (y1, m1, d1) = date1
    val (y2, m2, d2) = date2
  in
    if y1 < y2 then true
    else if y1 > y2 then false
    else if m1 < m2 then true
    else if m1 > m2 then false
    else d1 < d2
  end;

fun number_in_month(dates : (int * int * int) list, month : int) =
    if null dates then 0
    else if #2 (hd dates) = month then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month);

fun number_in_months(dates : (int * int * int) list, months : int list) =
    if null months then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months);

fun dates_in_month(dates : (int * int * int) list, month : int) =
    if null dates then []
    else if #2 (hd dates) = month then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month);

fun dates_in_months(dates : (int * int * int) list, months : int list) =
    if null months then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);

fun get_nth(strings : string list, n : int) =
    if null strings then ""
    else if n = 1 then hd strings
    else get_nth(tl strings, n - 1);
