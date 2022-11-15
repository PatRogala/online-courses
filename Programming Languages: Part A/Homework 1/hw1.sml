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

fun date_to_string(date : (int * int * int)) =
  let
    val (y, m, d) = date
    val months = ["January", "February", "March", "April", "May", "June",
                  "July", "August", "September", "October", "November", "December"]
  in
    get_nth(months, m) ^ " " ^ Int.toString(d) ^ ", " ^ Int.toString(y)
  end;

fun number_before_reaching_sum(sum : int, numbers : int list) =
  if null numbers then 0
  else if sum - hd numbers <= 0 then 0
  else 1 + number_before_reaching_sum(sum - hd numbers, tl numbers);

fun what_month(day_of_year : int) =
  let
    val days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    1 + number_before_reaching_sum(day_of_year, days_in_months)
  end;

fun month_range(day1 : int, day2 : int) =
  if day1 > day2 then []
  else what_month(day1) :: month_range(day1 + 1, day2);

fun oldest(given : (int * int * int) list) =
  let
    fun oldest_iter (current_oldest: int*int*int, given_: (int*int*int) list) =
      if given_ = []
      then SOME current_oldest
      else
        if is_older (hd given_, current_oldest)
        then oldest_iter (hd given_, tl given_)
        else oldest_iter (current_oldest, tl given_)
  in
    if given = []
    then NONE
    else
      oldest_iter (hd given, tl given)
  end;
