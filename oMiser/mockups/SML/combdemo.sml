(* combdemo.sml 0.0.1                UTF-8                       dh:2018-02-17
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

(* STARTING WITH THE Y COMBINATOR
   The others are straightforward.  This one is more delicate. 
   *)

(* RECURSION AND THE Y-COMBINATOR *)

fun emptied obList
    = if is_singleton obList then obList else emptied(b obList);
      (* a simple recursive function that empties a list, illustrating
         of how recursion is accomplished with oMiser 
         *)

val aList = L"1st" ## L"2nd" ## L"3rd" ## L"end" 
    (* a simple list that is just L"end" when emptied *);

print( "\n        aList = " ^ obstring(aList) ^ "\n" );
print( "\n  emptied NIL = " ^ obstring(emptied NIL) ^ "\n" );
print( "\nemptied aList = " ^ obstring(emptied aList) ^ "\n" );

val oEmptiedNR
    = EV ## (D ## ARG ## B ## ARG) ## `(ARG ## L"oEmptiedNR" ## B ## ARG);
print ("\n        oEmptiedNR = " ^ obstring(oEmptiedNR) ^ "\n" );
print ("\n   oEmptiedNR(NIL) = " ^ obstring(ap(oEmptiedNR,NIL)) ^ "\n" );
print ("\n oEmptiedNR(aList) = " ^ obstring(ap(oEmptiedNR,aList)) ^ "\n" );


val oEmptied
    = EV ## (D ## ARG ## B ## ARG) ## `(ARG ## SELF ## B ## ARG);
print ("\n        oEmptied = " ^ obstring(oEmptied) ^ "\n" );
print ("\n   oEmptied(NIL) = " ^ obstring(ap(oEmptied,NIL)) ^ "\n" );
print ("\n oEmptied(aList) = " ^ obstring(ap(oEmptied,aList)) ^ "\n" );

val oEmptiedR
    = C ## ` EV
        ## C ## `(D ## ARG ## B ## ARG)
             ## E ## C ## ` ARG
                       ## C ## (E ## ARG)
                            ## `(B ## ARG);
print ("\n                 oEmptiedR = " ^ obstring(oEmptiedR) ^ "\n" );
print ("\n       oEmptiedR(oEmptied) = " 
       ^ obstring(ap(oEmptiedR,oEmptied)) ^ "\n" );
print ("\n   oEmptiedR(oEmptied,NIL) = "
       ^ obstring( ap(ap(oEmptiedR,oEmptied),NIL) ) ^ "\n" );
print ("\n oEmptiedR(oEmptied,aList) = "
       ^ obstring( ap(ap(oEmptiedR,oEmptied),aList) ) ^ "\n" );

(* TBD: NOW INTRODUCE THE FORM OF Y-COMBINATOR REQUIRED FOR BY-VALUE
        CONDITIONALS AND SEE HOW TO WORK THAT INTO ONE MORE LIKE HOW
        oMISER CONDITIONALS CAN BE HELPFUL.
        SEE "MS for the Working Programmer" p.341.
        *)  
    
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
                 

   0.0.1 2018-02-17-13:00 Work through recursive emptied(list) with the Ob
         versions, confirming operation as prelude to the Y-combinator case.
   0.0.0 2018-02-17-10:12 Skeleton for progressive introduction of combinator
         representations and demonstration of their functionality.
         
   *)
         
(*                         *** end of combdemo.sml ***                      *)        
        
   