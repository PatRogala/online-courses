(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option(x, []) = NONE
  | all_except_option(x, y::ys) = if same_string(x, y)
      then SOME ys
      else case all_except_option (x, ys)
        of NONE => NONE
          | SOME zs => SOME (y::zs)

fun get_substitutions1([], s) = []
  | get_substitutions1(x::xs, s)  = case all_except_option(s, x) of
        NONE => get_substitutions1(xs, s)
	    | SOME y  => y @ get_substitutions1(xs, s)

fun get_substitutions2(sslist, s) =
      let fun tail (xs, s, acc) =
          case xs of
            [] => acc
          | (x::xs')  => case all_except_option(s, x) of
                NONE => tail(xs', s, acc)
              | SOME y  => tail(xs', s,  acc @ y )
     in
        tail(sslist, s, [] )
     end

fun similar_names( sslist, tmpl:{first:string, last:string, middle:string} )  =
    let fun zipn( namelist, t ) =
	case namelist of
        [] => []
	|(x'::xs') => case t of
           {first=x, middle=y, last=z}=> {first=x', middle=y, last=z} :: zipn(xs', t)
    in
      case tmpl of
      {first=a, middle=b, last=c} =>
          tmpl:: zipn( get_substitutions1(sslist, a), tmpl )
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color ( x ) =
   case x of
   (Diamonds, _) => Red
    | (Hearts, _)  => Red
    | (Spades, _) => Black
    | (Clubs, _)  => Black

fun card_value ( x ) =
   case x of
   (_, Num i) =>  i
    | (_, Ace)  => 11
    | (_, _)  => 10

fun remove_card (clist, c, ex ) =
    let fun all_except (c, [] ) = NONE
	  | all_except (c, c':: cs) =
            case c = c' of
              true => SOME cs
            | false => case all_except(c, cs) of
                         NONE => NONE
		       | SOME y  =>  SOME (c':: y)
    in
      case all_except(c, clist) of
        NONE => raise ex
      | SOME y => y

  end

fun all_same_color ( [] ) = true
  | all_same_color ( clist ) =
  let fun test_color ( x::[] ) = SOME ( card_color x )
	  | test_color ( x::xs ) = case test_color( xs ) of
                                     NONE => NONE
				   | SOME color => case color = card_color x of
                                                     false => NONE
						   | true  => SOME color
  in
    case test_color clist of
      NONE => false
    | SOME y => true
  end

fun sum_cards ( clist ) =
  let fun sum_inner ( cs, acc ) =
         case cs of
           [] => acc
	 | c::cs' => sum_inner( cs', acc + card_value(c) )
  in
     sum_inner(clist, 0)
  end

fun score ( clist, goal ) =
  let val sum = sum_cards clist;
      val pri_score = case sum > goal of
                        true => 3 * (sum - goal)
                      | false  => goal - sum
  in
    case all_same_color clist of
      true => pri_score div 2
    | false  => pri_score
  end


 fun officiate (clist, mlist, goal) =
    let fun inter_state(hlist, clist, mlist) =
        case sum_cards(hlist) > goal of
            true => hlist
          | false => case mlist of
                       [] => hlist
		     | m::ms => case m of
                           Draw =>( case clist of
                                     [] => hlist
			           | c::cs => inter_state(c::hlist, cs, ms) )
			 | Discard c' =>
                            inter_state( remove_card(hlist, c', IllegalMove), clist, ms)

   in
     score( inter_state([], clist, mlist), goal)
   end
