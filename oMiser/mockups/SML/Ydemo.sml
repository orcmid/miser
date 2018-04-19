(* Ydemo.sml 0.0.6                    UTF-8                      dh:2018-04-19
----|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

                        OMISER ‹ob› INTERPRETATION IN SML
                        =================================

  <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/Ydemo.sml>

              DEMONSTRATING Y-COMBINATOR REPRESENTATION IN oMISER
              ---------------------------------------------------

   [Author Note: Tie to obcheck.sml, obtheory.txt, ob.sml, obaptheory, and
    the obap.sml structure or similar ones.]
    *)

use "obap.sml";
open obap;
(* MODIFY THESE TWO LINES TO CHECK OTHER IMPLEMENTATION STRUCTURES.  THE
   CHECKS SHOULD WORK DIRECTLY WITHOUT MODIFICATION, BELOW.
   *)

infixr 5 ## ;



(* RECURSION AND THE Y-COMBINATOR *)

print(  "\nRECURSION AND THE Y-COMBINATOR"
      ^ "\n------------------------------\n\n" );

fun emptied obList
    = if is_singleton obList then obList else emptied(b obList);
      (* a simple recursive function that empties a list, for illustration
         of recursively-defined function evaluations with oMiser
         *)

val aList = L"1st" ## L"2nd" ## L"3rd" ## L"end"
    (* a simple list that is just L"end" when emptied *);

print(  "\n   The sml function emptied(L) returns the empty form"
      ^ "\n   of L, the ending singleton.  It has simple recursion,"
      ^ "\n   fun emptied L = if L = b(L) then L else emptied(b L)\n\n" );
print( "\n    ob ^aList = " ^ obstring(aList) ^ "\n" );
print( "\n  emptied NIL = " ^ obstring(emptied NIL) ^ "\n" );
print( "\nemptied aList = " ^ obstring(emptied aList) ^ "\n" );

val oEmptied
    = EV ## (D ## ARG ## B ## ARG) ## `(ARG ## SELF ## B ## ARG);

print(  "\n   The oMiser script ^oEmptied is a direct counterpart of"
      ^ "\n   the SML emptied function, with explicit recursion.\n\n" );

print ("\n     ob ^oEmptied = " ^ obstring(oEmptied) ^ "\n" );
print ("\n  ^oEmptied(.NIL) = " ^ obstring(ap(oEmptied,NIL)) ^ "\n" );
print ("\n^oEmptied(^aList) = " ^ obstring(ap(oEmptied,aList)) ^ "\n" );

val oTailer
    = C ## ` EV
        ## C ## `(D ## ARG ## B ## ARG)
             ## E ## C ## ` ARG
                       ## C ## (E ## ARG)
                            ## `(B ## ARG);

print(  "\n   The oMiser script ^oTailer is a version of oEmptied where"
      ^ "\n   (^oTailer g) L returns L if L is an empty list, and returns"
      ^ "\n   g(ob.b L) when L is a pair.  The goal is to use a by-value"
      ^ "\n   Y combinator to turn oTailer into a script that's equivalent"
      ^ "\n   to oEmptied without rewriting or treating oTailer as anything"
      ^ "\n   but an interpretation-preserving combinator form.\n\n");

print ("\nob ^oTailer = " ^ obstring(oTailer) ^ "\n" );

(* If Y f ≈ f (Y f), the first operand g of (f g) x will conditionally
   evaluate g(y) for some y only when continuing by recursion is needed.  For
   oMiser, when g is cY(f) that will be available as SELF in obap.ap(g, y). So
   What is to be applied to y is (f (cY f)).  The script (`f :: SELF) :: ARG
   has precisely that quality.

   With    cY f ≈ (` f :: SELF) :: ARG,
             cY ≈ .C :: (.C :: (.E :: .ARG)
                            :: ` .SELF )
                     :: ` .ARG

   and we only need to derive cY f, since (cY f) x = f(cY f) x and the proper
   evaluation happens on application to x.
   *)

val cY = C ## (C ## (E ## ARG)
                 ## ` SELF )
           ## ` ARG;

print(  "\n   Script cY represents combinator Y such that (^cY ^oTailer) L"
      ^ "\n   evaluates as ^oTailer(^cY ^oTailer) L, equivalent in operation"
      ^ "\n   to ^oEmptied(L).\n\n" );
print("\nob ^cY =" ^ obstring(cY) ^ "\n" );

val oEmptied2 = ap(cY, oTailer);
print(  "\n    ob ^oEmptied2 = ^cY ^oTailer;"
      ^ "\n^oEmptied2 = " ^ obstring(oEmptied2) ^ "\n" );
print( "\n  ^oEmptied2(.NIL) = "
       ^ obstring(ap(oEmptied2, NIL)) ^ "\n" );
print( "\n^oEmptied2(^aList) = "
       ^ obstring(ap(oEmptied2, aList)) ^ "\n" );



(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

                       Copyright 2018 Dennis E. Hamilton

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    *)

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    TODO:

      * Work through the straightforward transformations

      * Acknowledge [Paulson1996: p.391] for an important clue concerning
        call-by-value-appropriate Y combinators.

      * Confirm the proper use of cY in the definition of has(x) L, which
        partially evaluates has(x) with x fixed and that is the recursive
        function.

      * Introduce ρf.E ≈ Y λf.E, the basis for rec.f in oMiser.

    *)

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   0.0.6 2018-04-19-13:27 Correc the permalink for the Ydemo.sml file.
   0.0.5 2018-04-19-13:22 Rename from Ycombdemo.sml to Ydemo.sml and touch
         up a little.
   0.0.4 2018-02-23-09:40 combdemo.sml forked here as Ycombdemo.sml for
         careful, standalone demonstration of this important capability.
   0.0.3 2018-02-19-10:49 Touch up, expanding TODOs
   0.0.2 2018-02-18-18:56 Derive the provisional cY and confirm simple
         operation.
   0.0.1 2018-02-17-13:00 Work through recursive emptied(list) with the Ob
         versions, confirming operation as prelude to the Y-combinator case.
   0.0.0 2018-02-17-10:12 Skeleton for progressive introduction of combinator
         representations and demonstration of their functionality.

   *)

(*                          *** end of Ydemo.sml ***                        *)
