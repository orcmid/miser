(* combdemo.sml 0.0.7                UTF-8                       dh:2018-03-19
----|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

                        OMISER ‹ob› INTERPRETATION IN SML
                        =================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/combdemo.sml> 
        
              DEMONSTRATING COMBINATOR REPRESENTATIONS IN oMISER
              --------------------------------------------------
       
   This file demonstrates successful oMiser representation of the basic
   utility combinators of the Combinatory Algebra structure, ‹ca›.  The
   representations preserve functional type interpretations of operands.  See
   <https://github.com/orcmid/miser/blob/master/oMiser/combinators.txt>.  The
   

   Demonstration uses the SML/NJ mock-up of the oMiser universal function,
   obap.ap(p,x).  Alternative mock-ups and production deliverables have 
   equivalent demonstrations as part of evolving confirmation suites.

   Related Information:
   
    * obtheory.txt Specifies the abstract mathematical structure of the 
      underlying data format on which oMiser is founded,
      <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt>.  The
      <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OB.sig.sml>
      signature asserts sound interpretation as an SML/NJ datatype.

    * obaptheory.txt Specifies the abstract mathematical representation
      of the universal function, obap.ap(p,x) and companion obap.eval(exp),
      <https://github.com/orcmid/miser/blob/master/oMiser/obaptheory.txt>.
      <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OBAP.sig.sml>
      asserts the sound interpretation as an extended SML/NJ datatype.

    * ob.txt reviews the connections from theory to notations used to express
      obs and applicative expressions that operate on obs.
      <https://github.com/orcmid/miser/blob/master/oMiser/ob.txt>

    * ob-exp.txt provides the formal grammar for expressions read and produced
      by oFrugal.  The output obstring function produces that format.
      <https://github.com/orcmid/miser/blob/master/oMiser/ob-exp.txt>
    *)
    
use "obap.sml";
open obap;
(* MODIFY THESE TWO LINES TO CHECK OTHER IMPLEMENTATION STRUCTURES.  THE 
   CHECKS SHOULD WORK DIRECTLY WITHOUT MODIFICATION, BELOW.
   *)
   
infixr 5 ## ;
(*       The ob-exp "::" for pairing is represented by "##" in SML 
         *)

(* THE BASIC COMBINATORS S, K, AND I *)

val cK = E;
 (* See <https://github.com/orcmid/miser/blob/master/oMiser/combinators.txt>
    sections 1.1, 1.2, 2.1, 2.3, and 3.2.  
    *)

val cI = NIL;
 (* See <https://github.com/orcmid/miser/blob/master/oMiser/combinators.txt>
    sections 1.1, 1.2, 2.1, 2.3, and 3.2.  
    *)

(* Representing | S f g x = | f x | g x *)
(*    This and the further utility combinators are derived using a form of
      lindy-abstraction, a hand-abstracted approach that uses lindy-tracing
      in a careful manner to confirm successful abstraction.
      *)

val cSFGX = (L"F" ## L"X") ## L"G" ## L"Y"
val cSFG = (e(L"F") ## ARG) ## e(L"G") ## ARG
val cSF = C##e(e(L"F")##ARG)##C##(E##ARG)##e(ARG)       
val cS = C##e(C)##(C##(E##(C##(E##ARG)##e(ARG)))##e(C##(E##ARG)##e(ARG))); 
         (* effectively ^lambda.F ^lambda.G ^lambda.X ‵((F :: X) :: G :: X) 
            in oFrugalese, although lindy tracing allows it to also be 
            written ^lambda.F ^lambda.G ^lambda.X F(X) G X.  
                The key rule in lindy abstraction and confirmation via 
            application to lindies is that interpretation preservation is 
            demonstrated with no lindy application happening before any 
            other supplied operator script would be applied in its exact form 
            at the same point.
                Similarly, use of unabstracted-lindy operands that require 
            them to be interpreted as structured obs by the applied procedure
            will likely fail to achieve the intended purpose of the procedure.
            In such cases, confirmation of sound interpretation is more 
            involved.
            *)
print(  "\n       cSFGX = " ^ obstring(cSFGX) 
      ^ "\n        cSFG = " ^ obstring(cSFG)
      ^ "\n     cSFG(x) = " ^ obstring( ap(cSFG, L"x") )
      ^ "\n         cSF = " ^ obstring(cSF)
      ^ "\n      cSF(g) = " ^ obstring( ap(cSF, L"g") )
      ^ "\n    cSF(g,x) = " ^ obstring( ap(ap(cSF, L"g"), L"x") )
      ^ "\n          cS = " ^ obstring(cS)
      ^ "\n       cS(f) = " ^ obstring( ap(cS, L"f") )
      ^ "\n     cs(f,g) = " ^ obstring( ap(ap(cS,L"f"),L"g") )
      ^ "\n   cS(f,g) x = " ^ obstring( ap(ap(ap(cS,L"f"),L"g"),L"x") )
      ^ "\n   Demonstrating that ^cS(f,g) x yields f(x) g x.\n" );

val cSKK = ap(ap(cS,cK),cK);
print(  "\n       cSKK = " ^ obstring(cSKK) 
      ^ "\n    cSKK(X) = " ^ obstring( ap(cSKK, L"X") )
      ^ "\n      cI(X) = " ^ obstring( ap(cI, L"X")  ) 
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
      ^ "\n Demonstrating that ^cB(f,g) x = f g x in oFrugal"
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
      ^ "\n Demonstrating that ^cC(f, x) g = f g x in oFrugal"
      ^ "\n" );   

(* Representing | D f x g y ≈ f x | g y 
   Note that | D f x  ≈ B | f x and D f x g y ≈ f x | g y.  This combinator
   is defined in [Rosenbloom1950: D4, p.113].  For oMiser the B | f x case
   allows early computation of f(x), fixing it in susequent applications. 
   In this case, cD = ap(cB,cB) is exactly the same as the manually-created
   lindy-abstraction shown.
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
      ^ "\n Demonstrating that ^cD(f, x, g) y = (f x) g y in oFrugal"
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
      ^ "\n Demonstrating that ^cT(x) f = f x in oFrugal"
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
      ^ "\n"
      ^ "\n  Demonstrating that ^cW(f) x = (f x) x in oFrugal"
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

     * Add the Θ and Ψ combinators too.  We leave everything else to
       the treatment of exotics.

*)   
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 
   0.0.7 2018-03-19-11:44 Correct glitch in version-number sequencing
   0.0.6 2018-03-19-11:24 Adjusted to align with combinators.txt, touch-ups,
         and completion of synopsis.
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
        
   