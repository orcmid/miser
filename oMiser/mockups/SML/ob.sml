(* ob.sml 0.0.6                       UTF-8                      dh:2017-08-26

                       OMISER <ob> INTERPRETATION IN SML
                       =================================
                       
           <https://github.com/orcmid/miser/oMiser/mockups/SML/ob.sml>
                         
   A computational manifestation of the mathematical structure, ‹ob›, in
   Standard ML of New Jersey (SML/NJ).  For the mathematical formulation,
   see <https://github.com/orcmid/miser/oMiser/obtheory.txt>.
   *)
   
datatype ob = ob_c of ob * ob  
            | ob_e of ob       
            | ob_NIL          
                
fun ob_a(x) = case x of
              ob_c(a, _) => a
            | ob_e(a) => a
            | _ => x
            
fun ob_b(x) = case x of  
              ob_c(_, b) => b  
            | _ => x          
      
fun is_ob_singleton x = ob_b(x) = x

fun is_ob_individual x = ob_a(x) = x

fun is_ob_pair x = not (is_ob_singleton x)

fun is_ob_enclosure x 
       = is_ob_singleton x andalso not (is_ob_individual x)
       
(* INTERPRETATION OF ‹ob› VIA ob.sml:

        miser-theory ‹ob›            ob.sml interpretation
        ----------------            ---------------------
        ob.a function               ob_a: ob -> ob
        ob.b function               ob_b: ob -> ob
        ob.c function               ob_c: ob * ob -> ob (a constructor)
        ob.e function               ob_e: ob -> ob (a constructor)
        ob.is-individual predicate  is_ob_individual: ob -> bool
        ob.is-singleton predicate   is_ob_singleton: ob -> bool
        ob.is-pair predicate        is_ob_pair: ob -> bool
        ob.is-enclosure predicate   is_ob_enclosure: ob -> bool
        
        for obs x,y, whether x = y  (op =)
        for obs x,y, whether x ¶ y  implicit in SML constructions
      
   The definitions of fun ob_a and fun ob_b are invariate.  Consequently,
   any extensions of the ob datatype have interpretation as individuals.  
   
   With the choice of names, the correspondence may seem obvious.  However
   helpful the namings, do not be misled by them.  The intended interpretation
   is explicit and confirmable, even if only by inspection and attestation.  
   See <https://github.com/orcmid/miser/oMiser/mockups/SML/obtest.sml> 
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
 
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
TODO

 * Determine whether the apply-recognized individuals can be added 
   separately or have to be updated here.  We could make an extension
   for primitives.  Then we have to see to its management as a kind of
   namespace.
   
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
         
(*                        *** end of ob.sml ***                             *)
