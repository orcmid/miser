(* OBAP.sig.sml 0.0.5                UTF-8                       dh:2018-02-07

                       OMISER ‹ob› INTERPRETATION IN SML
                       ================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OBAP.sig.sml>
           
           THE SML OBAP APPLICATIVE DATA TYPE SIGNATURE/INTERFACE
           ------------------------------------------------------
   
   Expansion of the SML/NJ manifestation of the mathematical structure, ‹ob›,
   aligns with obaptheory, inclduing definition of two effectively universal
   functions. For the applicable mathematical requirements, see
   <https://github.com/orcmid/miser/blob/master/oMiser/obaptheory.txt>.  SML/NJ
   structures that expose this signature shall provide sound computational
   manifestations as interpretations of the theory. 
   
   Script obapcheck.sml has confirmation checks for any SML/NJ structure that
   is asserted to manifest <ob> via signature OBAP.  Inspect obap.sml and
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obapcheck.sml>
   *)
   
use "OB.sig.sml";
   
signature OBAP
 = sig
       include OB;
       val L : string -> ob
       val is_lindy: ob -> bool
       val A: ob
       val B: ob
       val C: ob
       val D: ob
       val E: ob
       val SELF: ob
       val ARG: ob
       val EV: ob
       val ap: ob * ob -> ob
       val eval: ob -> ob 
       val obstring: ob -> string
   end 
          
(* INTERPRETATION REQUIREMENTS FOR ‹ob› APPLICATIVE ABSTRACT DATA SIGNATURE

        miser-theory ‹ob› obaptheory   OBAP.sig.sml interpretation
        ---------------------------   ---------------------------
        obtheory                      OB.sig.sml interpretation
        Ʃs                            L : string -> ob
        obap.is-lindy                 is-lindy: ob -> bool
        obap.A                        A: ob
        obap.B                        B: ob
        obap.C                        C: ob
        obap.D                        D: ob
        obap.E                        E: ob
        obap.SELF                     SELF: ob
        obap.ARG                      ARG: ob
        obap.EV                       EV: ob
        obap.ap                       ap: ob * ob -> ob
        obap.eval                     eval: ob -> ob
   
   To use infix ## with a structure s :> OBAP it is necessary to provide 
            val ## = s.##    -- or open s, and also
            infixr 5 ##      -- either way
   in the structure-using procedure.
   *)

(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

                       Copyright 2017 Dennis E. Hamilton

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
    
      * Make 0.1.0 when incorporated in a library via the Compilation
        Manager.
        
      * Determine how to use Unicode and wide characters, including for
        the reverse-prime operation.
       
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 0.0.5 2018-02-07-16:52 Add obstring to the signature.
 0.0.4 2017-10-05-18:35 Adjust TODOs, Add obap.EV to the primitives
 0.0.3 2017-09-21-20:22 Update the synopsis to apply to OBAP, not OB.
 0.0.2 2017-09-19-20:04 Ditch ' x = e(x) as ineffective because not a prefix.
 0.0.1 2017-09-16-16:54 Alignment with obaptheory and obap.sml
 0.0.0 2017-09-15-11:34 Initial Skeleton for confirming introduction of
       Lindies and enquote prefix, `. 
       
       *)
         
(*                      *** end of OBAP.sig.sml ***                          *)
