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

(* Introducting Lists *)
[] (* empty list *)
[1, 2, 3] (* list of integers *)

(* List Operations *)
2::[1, 2, 3] (* cons *)
null [] (* returns true if empty *)
hd [1, 2, 3] (* returns first element *)
tl [1, 2, 3] (* returns list without first element *)

(* List Functions *)
fun sum_list(xs : int list) =
    if null xs then 0
    else hd xs + sum_list(tl xs);

fun countdown(x : int) =
    if x = 0 then []
    else x::countdown(x - 1);

(* Let Expressions *)
(* Let you add bindings to the dynamic environment *)
fun silly(z : int) =
    let
        val x = z + 1;
        val y = x + 1;
    in
        x * y
    end;

(* Nested Functions *)
fun contup_from1(x : int) =
    let
        fun contup_from1_aux(y : int) =
            if y = 0 then []
            else (x, y)::contup_from1_aux(y - 1);
    in
        contup_from1_aux(x)
    end;

(* Booleans and Comparision Operations *)
x andalso y (* and *)
x orelse y (* or *)
not x (* not *)
(* =, <>, >, <, >=, <= *)
