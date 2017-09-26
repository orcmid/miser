(* obap.obcheck.sml 0.0.2            UTF-8                        dh:2017-09-19

                        OMISER ‹ob› INTERPRETATION IN SML
                        ================================
                       
<https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obap.obcheck.sml> 
        
          CHECKING PRIMITIVE NOTION PRESERVATION IN OBAP EXTENSIONS
          ---------------------------------------------------------
       
   [Author Note: Tie to obcheck.sml, obtheory.txt, ob.sml, obaptheory, and
    the obap.sml structure or similar ones.]
    *)
    
use "obap.sml";
open obap;
(* MODIFY THESE TWO LINES TO CHECK OTHER IMPLEMENTATION STRUCTURES.  THE CHECKS 
   SHOULD WORK DIRECTLY.
   *)
   
infixr 5 ## ;

(* DEMONSTRATE PRIMITIVES 
   *)

val ob_logo = c(NIL, e NIL)
              (* pattern of the oMiser logo diagram at 
                 <http://miser-theory.info> *)
val nob_logo = e(ob_logo)
                 
(* Ob1. Pairs
        z = ob.c(x,y) ⇒ ob.a(z) = x ∧ ob.b(z) = y
        z = ob.c(ob.a(z),ob.b(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) ≠ z
        *)                 
                 
val ckOb1a = let val z = c(e ob_logo, NIL)
              in a z = e ob_logo andalso b z = NIL
             end
           
val ckOb1b = let val z = a ob_logo ## b ob_logo
              in z = ob_logo andalso a z <> z andalso b z <> z
             end
             
val ck0b1c = let val z = ob_logo ## nob_logo ## NIL
              in z = c(ob_logo, c(nob_logo, NIL))
             end
           
(* Ob2. Enclosures
        z = ob.e(x) ⇒ ob.a(z) = x ∧ ob.b(z) = z
        z = ob.e(ob.a(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) = z
        *)
   
val ckOb2a = let val z = e(b ob_logo)
              in a z = b ob_logo andalso b z = z
             end
                 
val ckOb2b = let val z = e(a nob_logo)   
              in z = nob_logo andalso a z = ob_logo andalso b z = z
             end
   
(* Ob3. Individuals
        ob.is-individual(z) ⇔ ob.a(z) = z ∧ ob.b(z) = z
        *)
   
val ckOb3 =         is_individual NIL 
            andalso not (is_individual ob_logo)
            andalso not (is_individual nob_logo)
            
(* Ob4. Structural Discrimination Predicates
        ob.is-singleton(z) ⇔ ob.b(z) = z.
        ob.is-pair(z) ⇔ ¬ ob.is-singleton(z)
        ob.is-enclosure(z) ⇔ ob.is-singleton(z) ∧ ob.a(z) ≠ z
        *)
   
val ck0b4a =         is_singleton NIL
             andalso is_singleton nob_logo
             andalso is_singleton(b nob_logo)
             andalso is_singleton(b NIL)
             andalso not(is_singleton ob_logo)
             andalso not(is_singleton(a nob_logo))
             
val ck0b4b =         is_pair ob_logo
             andalso not(is_pair nob_logo)
             andalso not(is_pair(a ob_logo))
             
val ckOb4c =         is_enclosure nob_logo
             andalso is_enclosure(b ob_logo)
             andalso not(is_enclosure ob_logo)
             andalso not(is_enclosure(a nob_logo))
             
(* Ob5. Totality
        ob.is-individual(z) ∨ ob.is-enclosure(z) ∨ ob.is-pair(z) 
        *)
        
fun is_ob_proper z
        =        ( is_pair z 
                   andalso not(is_singleton z) )
          orelse ( is_enclosure z 
                   andalso not(is_pair z)
                   andalso not(is_individual z) )
          orelse ( is_individual z 
                   andalso not(is_pair z)
                   andalso not(is_enclosure z) )
          
val ckOb5 =         is_ob_proper ob_logo 
            andalso is_ob_proper nob_logo 
            andalso is_ob_proper(a ob_logo) 
            andalso is_ob_proper(a nob_logo)
            andalso is_ob_proper NIL

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
        
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 
   0.0.2 2017-09-19-20:01 Remove an use of `(x) that was overlooked.
         Confirm integrated operation with obap.sml, OBAP.sig.sml, and
         consistency with obaptheory.txt.
   0.0.1 2017-09-18-20:17 Eliminate use of `(x) since no better than e(x).
   0.0.0 2017-09-15-11:26 Start with obcheck.sml 0.0.18 as boilerplate
         for confirming just the primitive notions and their sugar in
         obap.sml.
         
       *)
         
(*                      *** end of obap.obcheck.sml ***                     *)        
        
   