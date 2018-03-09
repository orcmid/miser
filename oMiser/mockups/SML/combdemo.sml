(* combdemo.sml 0.0.5                UTF-8                       dh:2018-03-08
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

(* THE BASIC COMBINATORS S, K, AND I *)

val cK = E;
 (* See <https://github.com/orcmid/miser/blob/master/oMiser/combinators.txt>
    sections 1.1, 1.2, 2.1, 2.3, and 3.2.  
    *)

val cI = NIL;
 (* See <https://github.com/orcmid/miser/blob/master/oMiser/combinators.txt>
    sections 1.1, 1.2, 2.1, 2.3, and 3.2.  
    *)

val cS = C##e(C)##(C##(E##(C##(E##ARG)##e(ARG)))##e(C##(E##ARG)##e(ARG))); 
         (* effectively lambda.X lambda.Y lambda.Z ‵((X :: Z) :: Y :: Z) 
            in oFrugalese, although lindy tracing allows it to also be 
            written     lambda.X lambda.Y lambda.Z X(Z) Y Z 
            *)

val cSKK = ap(ap(cS,cK),cK);
print(  "\n       cSKK = " ^ obstring(cSKK) 
      ^ "\n    cSKK(X) = " ^ obstring( ap(cSKK, L"X") )
      ^ "\n      cI(X) = " ^ obstring( ap(cI, L"X")  ) 
      ^ "\n         cS = " ^ obstring(cS) ^ "\n" 
      ^ "\n    Demonstrating that |SKK = I and how preferable cI is.\n" );

(* THE ADDITIONAL UTILITY COMBINATORS B, C, D, T, W *)

(* Representing | B f g x ≈ f | g x *)
val cBFG = L"F" ## L"G" ## ARG
val cBF = C ## (E ## `(L"F"))
            ## C ## (E ## ARG)
                 ## `ARG
val cB = C ## `C 
           ##  C ## (E ## E ## ARG)  
                 ## `(C ## (E ## ARG)
                        ## `ARG);
val cSaKSK = ap(ap(cS, ap(cK,cS)),cK);
print(  "\n        cS|KSK = " ^ obstring(cSaKSK)
      ^ "\n   cS|KSK(F,G) = " ^ obstring( ap(ap(cSaKSK, L"F"), L"G") )  
      ^ "\n cs|KSK(F,G) X = " 
                          ^ obstring( ap(ap(ap(cSaKSK, L"F"), L"G"), L"X") ) 
      ^ "\n       cB(F,G) = " ^ obstring( ap(ap(cB, L"F"), L"G") )    
      ^ "\n     cB(F,G) X = " ^ obstring( ap(ap(ap(cB, L"F"), L"G"), L"X") ) 
      ^ "\n            cB = " ^ obstring(cB) 
      ^ "\n" 
      ^ "\n        cS|KSK = cB is " 
                          ^ (if cSaKSK = cB then "true." else "false.")
      ^ "\n" );     

(* Representing | C f x y ≈ f | y x *)
 val cCFX = L"F" ## ARG ## L"X"
 val  cCF = C ## `(L"F")
             ## C ## `ARG ## E ## ARG
val    cC = C ## `C
              ## C ## (E ## E ## ARG)
                   ## `(C ## `ARG ## E ## ARG);
print(  "\n   cCFX(Y) = " ^ obstring( ap(cCFX, L"Y") )
      ^ "\n    cCF(X) = " ^ obstring( ap(cCF, L"X") )
      ^ "\n cCF(X)(Y) = " ^ obstring( ap(ap(cCF, L"X"), L"Y") )
      ^ "\n        cC = " ^ obstring( cC ) 
      ^ "\n     cC(F) = " ^ obstring( ap(cC, L"F") )
      ^ "\n   cC(F,X) = " ^ obstring( ap(ap(cC, L"F"), L"X") )
      ^ "\n cC(F,X) Y = " ^ obstring( ap(ap(ap(cC, L"F"), L"X"), L"Y") ) 
      ^ "\n" );   

(* Representing | D f x g y ≈ f x | g y 
   Note that | D f x  ≈ B | f x and D f x g y ≈ f x | g y.  This combinator
   is defined in [Rosenbloom1950: D4, p.113].  For oMiser the B | f x case
   allows early computation of f(x), fixing it in susequent applications. 
   In this case, cD = ap(cB,cB) is exactly the same as the manually-created
   bracket-abstraction shown.
   *)
val cDFX = `cB ## L"F" ## L"X"
val  cDF = ` cB ## L"F" ## ARG
val   cD = C ## `( `cB )
             ## C ## (E ## ARG)
                  ## ` ARG 
val cBB = ap(cB, cB);
    (* for comparison with the manually-optimized cD *)
print(  "\n             cBB = " ^ obstring( cBB )
      ^ "\n           cBB F = " ^ obstring( ap(cBB, L"F") )
      ^ "\n        cBB(F,X) = " ^ obstring( ap(ap(cBB, L"F"), L"X") )
      ^ "\n      cBB(F,X) G = " ^ obstring( ap(ap(ap(cBB, L"F"), L"X"), L"G") )
      ^ "\n    cBB(F,X,G) Y = " 
                 ^ obstring( ap(ap(ap(ap(cBB, L"F"), L"X"), L"G"),L"Y") )
      ^ "\n              cD = " ^ obstring( cD )
      ^ "\n            cD F = " ^ obstring( ap(cD, L"F") )
      ^ "\n         cD(F,X) = " ^ obstring( ap(ap(cD, L"F"), L"X") )
      ^ "\n       cD(F,X) G = " ^ obstring( ap(ap(ap(cD, L"F"), L"X"), L"G") )
      ^ "\n     cD(F,X,G) Y = " 
                 ^ obstring( ap(ap(ap(ap(cD, L"F"), L"X"), L"G"),L"Y") )  
      ^ "\n" 
      ^ "\n             cBB = cD is " 
                            ^ (if cBB = cD then "true." else "false.")
      ^ "\n        cS|DS|KK = cC is " 
                            ^ ( if cC = ap(ap(cS,ap(cD,cS)),ap(cK,cK))
                                then "true." else "false." )
      ^ "\n" );    

(* Representing | T x f ≈ f x  *)    
val cTXF = L"F" ## L"X"
val  cTX = ARG ## `( L"X" )
val   cT = C ## ` ARG
             ## E ## ARG
val cCI = ap(cC, cI);
print(  "\n          cCI = " ^ obstring(cCI)
      ^ "\n        cCI X = " ^ obstring( ap(cCI, L"X") )
      ^ "\n     cCI(X) F = " ^ obstring( ap(ap(cCI, L"X"), L"F") )
      ^ "\n           cT = " ^ obstring(cT)
      ^ "\n         cT X = " ^ obstring( ap(cT, L"X") )
      ^ "\n      cT(X) F = " ^ obstring( ap(ap(cT, L"X"), L"F") )
      ^ "\n" 
      ^ "\n          cCI = cT is " ^ (if cCI = cT then "true." else "false.")
      ^ "\n" ); 

(* Representing | W f x ≈ f x x  *)
val cWFX = (L"F" ## L"X") ## L"X"
val  cWF = (L"F" ## ARG) ## ARG   
val   cW = C ## (C ## (E ## ARG)   
                   ## ` ARG)
             ## ` ARG
val cSSaSK = ap(ap(cS,cS),ap(cS,cK));
print(  "\n    cSS|SK = " ^ obstring(cSSaSK)    
      ^ "\n  CSS|SK(f) = " ^ obstring( ap(cSSaSK, L"f") )
      ^ "\n  CSS|SK(f,x) = " ^ obstring( ap(ap(cSSaSK, L"f"), L"x") )
      ^ "\n           cW = " ^ obstring(cW)
      ^ "\n        cW(f) = " ^ obstring( ap(cW, L"f") )
      ^ "\n      cW(f,x) = " ^ obstring( ap(ap(cW, L"f"), L"x") )
      ^ "\n       cSS|SK = cW is " 
                         ^ (if cSSaSK = cW then "true." else "false.")
      ^ "\n" ); 
             
    
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
 
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

   TODO:
     * Complete this information with definition of the simple utility
       combinators.

     * Add the Φ and Ψ combinators too.  We leave everything else to
       the treatment of exotics.

*)   
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 
   0.0.5 2018-03-08-15:24 Complete with demonstration of all simple utility
         combinators.
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
        
   