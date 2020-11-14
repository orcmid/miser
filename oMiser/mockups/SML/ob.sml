(* ob.sml 0.1.0                      UTF-8                       dh:2020-11-14
----|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

                       OMISER ‹ob› INTERPRETATION IN SML
                       =================================

   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/ob.sml>

                        THE SML ob ABSTRACT DATA TYPE
                        -----------------------------

   A computational manifestation of the mathematical structure, ‹ob›, in
   Standard ML of New Jersey (SML/NJ).  For the mathematical formulation,
   see <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt>.
   For the structure/interface requirements and connection with the primitive
   notions of the mathematical formulation, see
  <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OB.sig.sml>.
   For consideration of the validity of this interpretation, see
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obcheck.sml>.
   *)

use "OB.sig.sml";

structure ob :> OB
 = struct

      datatype ob = c of ob * ob
                  | e of ob
                  | NIL

      fun a(z) = case z
                   of c(x, _) => x
                    | e(x) => x
                    | _ => z

      fun b(z) = case z
                   of c(_, y) => y
                    | _ => z

      fun is_singleton x = b(x) = x

      fun is_individual x = a(x) = x

      fun is_pair x = not (is_singleton x)

      fun is_enclosure x
          = is_singleton x andalso not (is_individual x)

      fun ` x = e(x)
         (* stick with ASCII codes but provide the ` x notation.
            This is a function, not a syntactical prefix, so it is often
            necessary to parenthesize more than is needed in the case of
            oFrugal syntax *)

      infixr 5 ##
      fun (x ## y) = c(x, y)
         (* to use this infix, either open structure ob or define
               val ## = ob.##
            and then declare
               infixr 5 ##
            *)

   end

(* EMPIRICAL INSPECTION
   Because SML/NJ is harmonius with the kind of computational interpretations
   intended for ob, the SML notation for a computational structure is concise.
   SML supports definition by cases, where "| _ ..." is for anything else.

   These definitions match directly with the definitions of primitive
   notions in obtheory.txt.  This is confirmed by inspection, direct
   comparison, adjusting for the fact that f x y is (f x) y in SML and f(x y)
   in oFrugal <https://github.com/orcmid/miser/blob/master/oMiser/ob-exp.txt>.

   The obcheck.sml script provides a kind of confirmation that nothing has
   been broken in the OB.sig.sml and ob.sml scripts.  That the cases can be
   generalized is based on being satisfied that the struct declaration, above,
   is as dependable as the SML/NJ implementation intself in that regard. See
  <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obcheck.sml>
   For the necessary setup and expected confirmation results.
   *)

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

                Copyright 2017-2020 Dennis E. Hamilton

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

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   TODO

    * Look at creating a library that can be installed via the SML/NJ
      Compilation Manager and reused easily that way.

   *)

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   0.1.0 2020-11-14-11:03 Clean up the narrative with more explanatory
         information, linking to details, and not so much on the mathematical-
         logic bits.  This is very close to baked.
  0.0.15 2018-10-17-09:54 Replaced "soundness" with "validity"
  0.0.14 2018-10-15-15:31 Clarify the introduction of unary ` and ensure that
         we speak of validity, not soundness.
  0.0.13 2018-10-09-10:23 Touch ups to align with the signature description.
  0.0.12 2018-02-17-13:04 Touch ups and addition of ` x "unary".
  0.0.11 2017-09-14-11:12 Implement ## counterpart of :: for obs
  0.0.10 2017-09-13-16:44 Refactored with the confirmation of signature and
         structure from obadt.sml, obsoleting that material.
   0.0.9 2017-08-30-12:50 Change references to obtest.sml to obcheck.sml
   0.0.8 2017-08-29-13:04 Touch up layout to reflect my preferred style of
         indentation.
   0.0.7 2017-08-27-11:57 Switch to ‹ob› and tie the three files together.
         Perform some wordsmithing, including the notion of validity.
   0.0.6 2017-08-26-11:37 Recast as an interpretation of obtheory in
         in SML/NJ.  Add license and GitHub location information.
   0.0.5 2017-07-28-11:22 Complete the quartet of structural predicates.
   0.0.4 2017-07-27-18:22 Further touch-ups and organization on GitHub
   0.0.3 2017-07-26-09:57 More wordsmithing.
   0.0.2 2017-07-26-09:20 Touch up commentary and show on Golden Geek.
   0.0.1 2017-07-25-16:15 Use wild cards and add is_ob_enclosure
   0.0.0 2017-07-25-07:45 Representation of the single/simple-type that
         is the only data structure available at the oMiser level.
         *)

(*                         *** end of ob.sml ***                            *)
