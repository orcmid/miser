(* OB.sig.sml 0.0.4                  UTF-8                       dh:2017-09-14

                       OMISER ‹ob› INTERPRETATION IN SML
                       ================================
                       
  <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OB.sig.sml>
           
             THE SML OB ABSTRACT DATA TYPE SIGNATURE/INTERFACE
             -------------------------------------------------
                         
   SML/NJ manifestations of the mathematical structure, ‹ob›, support the common
   signature, OB.  For the applicable mathematical requirements, see
   <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt>.  SML/NJ
   structures that expose this signature shall provide sound computational
   manifestations as interpretations of the theory. 
   
   Script obcheck.sml has confirmation checks for any SML/NJ structure that
   is asserted to manifest <ob> via signature OB.  Inspect the structure and see
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obcheck.sml>
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
      val ## : ob * ob -> ob 
          (* requiring infixr 5 ##, for use of (x ## y) = c(x, y) *)
   end 
          
(* INTERPRETATION REQUIREMENTS FOR ‹ob› MANIFESTATION OB SIGNATURE

        miser-theory ‹ob›            OB.sig.sml interpretation
        ----------------            -------------------------
        ob.a function               a: ob -> ob
        ob.b function               b: ob -> ob
        ob.c function               c: ob * ob -> ob
        ob.e function               e: ob -> ob
        ob.is-individual predicate  is_individual: ob -> bool
        ob.is-singleton predicate   is_singleton: ob -> bool
        ob.is-pair predicate        is_pair: ob -> bool
        ob.is-enclosure predicate   is_enclosure: ob -> bool
        ob.NIL                      NIL
        
        for obs x,y, whether x = y  (op =)
        for obs x,y, whether x ¶ y  implicit in SML constructions
      
   Any extensions of the ob datatype shall constitute addition of individuals.
   
   Right-associative infix ## is the OB counterpart of SML ::.  The different
   notation compensates for the prohibition of :: overloading.  To use the ##
   with a structure s :> OB it is necessary to provide 
            val ## = s.##    -- or open s, and also
            infixr 5 ##      -- either way
   in the using procedure.
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
        
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

 0.0.4 2017-09-14 15:12 Make extension only by individuals prescriptive.
 0.0.3 2017-09-14-15:08 Touch up and review TODOs.
 0.0.2 2017-09-14-11:14 Introduce :: ob manifestation counterpart ##. 
 0.0.1 2017-09-13-15:59 Extracted from obadt.sml 0.0.9, obsoleted thereby, 
       taking advantage of SML/NJ signature reuse and structure provisions. 
       
       *)
         
(*                      *** end of ob.sig.sml ***                             *)