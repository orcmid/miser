(* obadt.sml 0.0.1                   UTF-8                      dh:2017-09-05

                       OMISER ‹ob› INTERPRETATION IN SML
                       ================================
                       
           <https://github.com/orcmid/miser/oMiser/mockups/SML/ob.sml>
           
                        THE SML ob ABSTRACT DATA TYPE
                        -----------------------------
                         
   A computational manifestation of the mathematical structure, ‹ob›, in
   Standard ML of New Jersey (SML/NJ).  For the mathematical formulation,
   see <https://github.com/orcmid/miser/oMiser/obtheory.txt>.  See
   <https://github.com/orcmid/miser/oMiser/mockups/SML/obcheck.sml>
   for consideration of the soundness of the interpretation. 
   *)
   
signature OB
 = sig
      type t
      val a: t -> t
      val b: t -> t
      val c: t * t -> t
      val e: t -> t
      val is_pair: t -> bool
      val is_enclosure: t -> bool
      val is_individual: t -> bool
      val is_singleton: t -> bool
      val NIL: t
   end
   
   
   
structure ob :> OB
 = struct
 
   datatype t = c of t * t  
               | e of t       
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
       
   end
          
(* INTERPRETATION OF ‹ob› VIA obadt.sml:

        miser-theory ‹ob›            obadt.sml interpretation
        ----------------            ------------------------
        ob.a function               ob.a: ob -> ob
        ob.b function               ob.b: ob -> ob
        ob.c function               ob.c: ob * ob -> ob
        ob.e function               ob.e: ob -> ob
        ob.is-individual predicate  ob.is_individual: ob -> bool
        ob.is-singleton predicate   ob.is_singleton: ob -> bool
        ob.is-pair predicate        ob.is_pair: ob -> bool
        ob.is-enclosure predicate   ob.is_enclosure: ob -> bool
        
        for obs x,y, whether x = y  (op =)
        for obs x,y, whether x ¶ y  implicit in SML constructions
      
   The definitions of obadt ob.a and ob.b are invariant.  Consequently,
   any extensions of the ob structure have interpretation as individuals.  
   
   With the choice of names, the correspondence may seem obvious.  However
   helpful the namings, do not be misled by them.  The intended interpretation
   is explicit and confirmable, even if only by inspection and attestation.  
   See <https://github.com/orcmid/miser/oMiser/mockups/SML/obadtcheck.sml> 
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
   0.0.1 2017-09-05-18:03 Adapt from ob.sml 0.0.9 to take advantage of the
         SML/NJ signature and structure provisions.  Note that this allows
         the ob. notation, striking the correspondence with the similar
         "namespace" usage in obtheory.txt.
         *)
         
(*                      *** end of obadt.sml ***                             *)
