(* combdemo.sml 0.0.4                UTF-8                       dh:2018-02-23
----|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

                        OMISER ‹ob› INTERPRETATION IN SML
                        =================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/combdemo.sml> 
        
              DEMONSTRATING COMBINATOR REPRESENTATIONS IN oMISER
              --------------------------------------------------
       
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
    
      * Make comblib.sml and depend on it here.

      * Work through the straightforward transformations
        
      * Set up more-sophisticated combinators for later.

      * Acknowledge [Paulson1996: p.391] for an important clue concerning
        call-by-value-appropriate Y combinators.

      * Confirm the proper use of cY in the definition of has(x) L, which
        partially evaluates has(x) with x fixed and that is the recursive
        function.

      * Introduce ρf.E ≈ Y λf.E, the basis for rec.f in oMiser.

      * Handle interpretation as Combinators here based on interpretation-
        preserving functionality.
                     
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 
   0.0.4 2018-02-23-09:37 Fork the Y combinator material to Ycombdemo.sml.
   0.0.3 2018-02-19-10:49 Touch up, expanding TODOs
   0.0.2 2018-02-18-18:56 Derive the provisional cY and confirm simple
         operation.
   0.0.1 2018-02-17-13:00 Work through recursive emptied(list) with the Ob
         versions, confirming operation as prelude to the Y-combinator case.
   0.0.0 2018-02-17-10:12 Skeleton for progressive introduction of combinator
         representations and demonstration of their functionality.
         
   *)
         
(*                         *** end of combdemo.sml ***                      *)        
        
   