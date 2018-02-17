(* combdemo.sml 0.0.0                UTF-8                       dh:2018-02-17
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
(* MODIFY THESE TWO LINES TO CHECK OTHER IMPLEMENTATION STRUCTURES.  THE CHECKS 
   SHOULD WORK DIRECTLY WITHOUT MODIFICATION, BELOW.
   *)
   
infixr 5 ## ;

(* START WITH THE Y COMBINATOR
   The others are straightforward.  This one is more delicate. 
   *)

              
print( "\ncK = " ^ obstring(cK) ^ "\n");         
print("\ncS = " ^ obstring(cS) ^ "\n");                 
print( "\ncI = " ^ obstring(cI) ^ "\n");   
print("\ncSKK = " ^ obstring(ap(ap(cS,cK),cK)) ^ "\n");
print("\n(cSKK) x) = " ^ obstring(ap(ap(ap(cS,cK),cK),L"x")) ^ "\n");
print("\ncI x = " ^ obstring(ap(cI,L"x")) ^ "\n");
print( "\nhasX = " ^ obstring(hasX) ^ "\n");                                     
print( "\nhas = " ^ obstring(has) ^ "\n");                 
    
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
    
      * Get Y Combinator figured out and demonstrated.
        
      * Work through the straightforward transformations
        
      * Set up more-sophisticated combinators for later.
      
                
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 

   0.0.0 2018-02-17-10:12 Skeleton for progressive introduction of combinator
         representations and demonstration of their functionality.
         
   *)
         
(*                         *** end of combdemo.sml ***                      *)        
        
   