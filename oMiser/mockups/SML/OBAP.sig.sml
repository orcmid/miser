(* OBAP.sig.sml 0.0.0                UTF-8                       dh:2017-09-15

                       OMISER ‹ob› INTERPRETATION IN SML
                       ================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OBAP.sig.sml>
           
           THE SML OBAP APPLICATIVE DATA TYPE SIGNATURE/INTERFACE
           ------------------------------------------------------
                         
   SML/NJ manifestations of the mathematical structure, ‹ob›, support the common
   signature, OB.  For the applicable mathematical requirements, see
   <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt>.  SML/NJ
   structures that expose this signature shall provide sound computational
   manifestations as interpretations of the theory. 
   
   Script obcheck.sml has confirmation checks for any SML/NJ structure that
   is asserted to manifest <ob> via signature OB.  Inspect the structure and see
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obcheck.sml>
   *)
   
use "OB.sig.sml";
   
signature OBAP
 = sig
       include OB;
       val L : string -> ob
       val ` : ob -> ob
       
   end 
          
(* INTERPRETATION REQUIREMENTS FOR ‹ob› APPLICATIVE ABSTRACT DATA SIGNATURE

        miser-theory ‹ob›            OBAP.sig.sml interpretation
        ----------------            ---------------------------
        obtheory                    OB.sig.sml interpretation
        Ʃs                          L : string -> ob
      

   
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
        
      * Confirm that incorporation in OBAP.sig.sml and use in obap.sig.sml, 
        obap.sml, obap.obcheck.sml and obapcheck.sml all work smoothly.
        
      * Fix the boilerplate that lingers here, avoiding repetition of
        notions in the primitive notions treatment.
        
      * Fix the footer of OB.sig.sml to capitalize OB.
        
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


 0.0.0 2017-09-15-11:34 Initial Skeleton for confirming introduction of
       Lindies and enquote prefix, `. 
       
       *)
         
(*                      *** end of OBAP.sig.sml ***                          *)
