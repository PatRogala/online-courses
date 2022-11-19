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

(* WEEK 2 *)
(* Records *)
val rec = { bar=(1+2, true andalso true), foo=3+4, baz=(false,9) };
#bar rec;
#foo rec;
#baz rec;

(* Tuples as Syntactic Sugar *)
{2=5, 1=6} = (6, 5); (* true *)

(* Datatype Bindings *)
datatype mytype = TwoInts of int * int
                | Str of string
                | Pizza

(* Case Expressions *)
fun f(x : mytype) =
    case x of
        TwoInts(i, j) => i + j
      | Str(s) => String.size s
      | Pizza => 42;

(* Type Synonyms *)

datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype rank = Jack | Queen | King | Ace | Num of int;

type card = suit * rank;

(* Lists and Options are Datatypes *)
datatype my_int_list = Empty | Cons of int * my_int_list;

val x = Cons(4, Cons(5, Empty));

fun append_my_list(xs, ys) =
  case xs of
    Empty => ys
  | Cons(hd, tl) => Cons(hd, append_my_list(tl, ys));

(* More Nested Patterns *)
fun nondecreasing xs =
  case xs of
    [] => true
  | _::[] => true
  | head::neck::rest => head <= neck andalso nondecreasing(neck::rest);

datatype sgn = P | N | Z;

fun multsign(x1, x2) =
  let fun sign x = if x < 0 then N else if x = 0 then Z else P
  in
    case(sign x1, sign x2) of
      (P, P) => P
    | (N, N) => P
    | (Z, _) => Z
    | (_, Z) => Z
    | _ => N
  end;
