(* OB.sig.sml 0.1.2                 UTF-8                       dh:2020-11-14

                       OMISER ‹ob› INTERPRETATION IN SML
                       =================================

  <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OB.sig.sml>

             THE SML OB ABSTRACT DATA TYPE SIGNATURE/INTERFACE
             -------------------------------------------------

   Demonstration of oMiser computational interpretations of the mathematical
   structure, ‹ob›, is easily accomplished with a mock-up using the SML/NJ
   programming language and system.

   SML implementation is not a limitation for oMiser.  A variety of valid
   implementations will be demonstrated.  SML is convenient because its
   provisions are harmonious with the characteristics that ‹ob› interpretation
   must preserve, making for easy prototyping and verification of alternative
   implementations against an already-confirmed-to-be-valid one.

   SML/NJ interpretations of ‹ob› employ the common shared signature, OB, by
   convention.  For the mathematical requirements see
   <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt>.  SML/NJ
   structures that expose this signature shall provide valid computational
   interpretations of that applied-logic theory.

   For an exemplary computational interpretation see the implementation at
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/ob.sml>.
   This is taken as a proof-of-concept and reference implementation.

   Script obcheck.sml provides confirmation of the reference implementation.
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obcheck.sml>.
   Appropriate setup of SML/NJ for checking and using the reference
   implementation(s) are linked there as well.
   *)

signature OB
 = sig
      eqtype ob
      val a: ob -> ob
      val b: ob -> ob
      val c: ob * ob -> ob
      val e: ob -> ob
      val is_pair: ob -> bool
      val is_enclosure: ob -> bool
      val is_individual: ob -> bool
      val is_singleton: ob -> bool
      val NIL: ob
      val ` : ob -> ob (* function approximating a prefix operator for e(x) *)
      val ## : ob * ob -> ob
          (* requiring infixr 5 ## for use of (x ## y) = c(x, y) *)
   end

(* REQUIREMENTS FOR VALID INTERPRETATION OF ‹ob›

    The miser-theory ‹ob› structure conditions are completely specified at
    <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt>. The
    representation of functions/predicates in ‹ob› logical theory Ot are as at
<https://orcmid.blogspot.com/2018/12/miser-project-representing-functions-in.html>
    Valid equation, x = y, in ‹ob› formulation Ot will have computational
    interpretation of x and y formulas yielding interpretations of identical
    canonical forms.

        miser-theory ‹ob›             OB.sig.sml interpretation
        -----------------             -------------------------
        ob.a function                 a: ob -> ob
        ob.b function                 b: ob -> ob
        ob.c function                 c: ob * ob -> ob
        ob.e function                 e: ob -> ob
        ob.is-individual predicate    is_individual: ob -> bool
        ob.is-singleton predicate     is_singleton: ob -> bool
        ob.is-pair predicate          is_pair: ob -> bool
        ob.is-enclosure predicate     is_enclosure: ob -> bool
        ob.NIL                        NIL

        for obs x,y, whether x = y    (op =)
        for obs x,y, whether x ¶ y    implicit in SML type-instance
                                      constructions

        Ot-represented Of function    φr: ob * ... * ob -> ob,
            φ(x1, ..., xn), n > 0         φ effectively computable
        Ot-represented Of predicate   ρr: ob * ... * ob -> bool
            ρ(x1, ..., xn), n > 0         ρ effectively decidable

        canonical form of z when      SML evaluation of the expression
          z = φ(x1, ..., xn), n > 0      φr(xr1, ..., xrn), n > 0
        and the xi are definite obs   where the xri are the computational
                                      interpretations of the xi and the
                                      SML definition for the φr procedure
                                      is such that evaluation yields
                                      a computational interpretation
                                      of the definite z

        truth or falsity of           SML evaluation of the expression
          ρ(x1, ..., xn), n > 0           ρr(xr1, ..., xrn), n > 0
        and the xi are definite obs   where the xri are the computational
                                      interpretations of the xi and, similarly
                                      to φr conditions, the ρr procedure
                                      yields the SML bool value corresponding
                                      to the determined ρ truth value

    The OB.sig.sml interpretations are given in the language of SML/NJ.  The
   correspondence between fixed ‹ob› entities and this computational
   interpretation is not by the convenient correspondence of names but by
   their pairing in the above tabulation and by SML/NJ implementations that
   satisfy the essential characteristics, Ob1-Ob10, of the ‹ob› formulation
   at obtheory.txt.

   Right-associative infix ## is the OB counterpart of SML ::.  The different
   notation compensates for the prohibition of :: overloading in SML.  To use
   the ## with a structure s :> OB it is necessary to provide
            val ## = s.##    -- or by opening s, and also
            infixr 5 ##      -- either way
   in the using procedure.

   In SML/NJ the notation for application of procedures to operands mimics
   the mathematical notation.  The coincidence of notations should not be
   read as one having the same meaning as the other.  It is useful to view
   the evaluation of SML/NJ scripts as having defined computational
   interpretations with any computational interpretation of ‹ob› relying on
   OB.sig-restrained use of the SML language's computational interpretation.


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

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    TODO:

      * Make 1.0.0 when incorporated in a library via the Compilation
        Manager.

    *)

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 0.1.2 2020-11-14-12:10 Improve connections between the theoretical and
       computational requirements that implementations must satisfy in
       providing an interpretation of the theoretical ‹ob› structure.
 0.1.1 2018-10-30-14:37 Provide clarity on the relationship between ‹ob›
       computational interpretation and the defined computational interpreta-
       tion of the SML language.
 0.1.0 2018-10-30-10:52 Expand on how the computational-interpretation
       extends to interpretation of functions and predicates in Of and also
       how the similarity of function notations between ‹ob› and SML/NJ
       computational interpretations is a valuable convenience so long as
       the computational objects are not confused with the mathematical ones.
 0.0.12 2018-10-29-09:23 Reflect change of the tutorial-style article name
        from "Interpreting Obs as Data" to "Representing Data as Obs", since
        it is (some) Obs that are the interpretations, rather than Obs having
        such (computational) interpretations although that becomes a
        consequence.
 0.0.11 2018-10-16-09:54 Further adjustment of the commentary to smoothly
        connect with the tutorial-style article, "Representing Data as Obs."
 0.0.10 2018-10-16-08:55 Correct typos and wordsmith the commentary.
 0.0.9 2018-10-15-15:00 Use "validity" rather than "soundness" when speaking
       of interpretations.
 0.0.8 2018-10-15-09:51 Touch up layout and elaborate more on what it takes
       beside signature agreement to have valid computational interpretations.
 0.0.7 2018-10-09-10:35 Touch up and manage TODOs.
 0.0.6 2018-02-17-13:06 Adjust TODOs and add ` x as a "unary" operator
 0.0.5 2017-09-19-20:06 Touchups and confirmation of use as part of the
       ob.sml, obcheck.sml, obap.sml, obap.obcheck.sml and obapcheck.sml.
 0.0.4 2017-09-14-15:12 Make extension only by individuals prescriptive.
 0.0.3 2017-09-14-15:08 Touch up and review TODOs.
 0.0.2 2017-09-14-11:14 Introduce :: ob manifestation counterpart ##.
 0.0.1 2017-09-13-15:59 Extracted from obadt.sml 0.0.9, obsoleted thereby,
       taking advantage of SML/NJ signature reuse and structure provisions.

       *)

(*                      *** end of OB.sig.sml ***                           *)
