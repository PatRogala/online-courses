(* ML Variable Bindings and Expressions *)
val x = 34; (* x is bound to 34 *)
            (* Static environment: x : int *)
            (* Dynamic environment: x --> 34 *)

val y = x + 1; (* y is bound to 35 *)
               (* Dynamic environment: x --> 34, y --> 35 *)

val abs_of_x = if x < 0 then 0 - x else x;

val abs_of_y = abs y;

val p = ~1; (* negativ number *)

val pp = x div (y + 1); (* division *)


(* Functions Informally *)
fun pow(x : int, y : int) =
    if y = 0 then 1
    else x * pow(x, y - 1);

fun cube(x : int) =
    pow(x, 3);

val sixtyfour = cube(4);

(* Pairs and Other Tuples *)
val x1 = (7, (true, 9))
val x2 = #1 (#2 x1) (* bool *)
