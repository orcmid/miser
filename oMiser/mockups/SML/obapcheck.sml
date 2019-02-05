(* obapcheck.sml 0.0.10             UTF-8                        dh:2018-03-**

                        OMISER ‹ob› INTERPRETATION IN SML
                        ================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obapcheck.sml> 
        
           CHECKING APPLICATIVE EXPRESSIONS IN SML OBAP STRUCTURE
           ------------------------------------------------------
       
   [Author Note: Tie to obcheck.sml, obtheory.txt, ob.sml, obaptheory, and
    the obap.sml structure or similar ones.]
    *)
    
use "obap.sml";
open obap;
(* MODIFY THESE TWO LINES TO CHECK OTHER IMPLEMENTATION STRUCTURES.  THE 
   CHECKS SHOULD WORK DIRECTLY WITHOUT MODIFICATION, BELOW.
   *)
   
infixr 5 ## ;

(* DEMONSTRATE EXTENSIONS 
   *)

(* Obap1: Additional individuals obap.A, obap.B, obap.C, obap.D, obap.E
          obap.SELF, obap.ARG, and obap.EV
          *)
          
val prims = [A,B,C,D,E,SELF,ARG,EV,NIL]

val CkObap1 
    = let fun are_inds ([]) = true
            | are_inds (x::xs') = is_individual x andalso are_inds xs'
       in are_inds prims
      end
       
(* Obap2: Literal Individuals (Lindies) *)

val lindies = [L"A",L"a",L"lindy",L"X",L"Y",L"XY"]

val CkObap2 
    = ( let fun are_lindies ([]) = true
              | are_lindies (x::xs') = is_lindy(x) andalso are_lindies xs'
         in are_lindies lindies
        end )
      andalso
      ( let fun are_diff(xs: ob list) 
                = case xs
                    of x :: xs' => not (List.exists (fn a => a = x) xs')
                                   andalso are_diff xs'
                     | _ => true
         in are_diff (prims @ lindies)
        end )
      
(* obap4: obap.ap(p,x) cases of traces where application stalls *)

val CkObap4 = ap(ARG##SELF,ARG) = e(ARG) ## e(ARG ## SELF) 
      andalso ap(e(ARG) ## e(ARG ## SELF), L"Z") = e(ARG) ## e(ARG##SELF)
      andalso ap(e(L"X"),L"Y") = L"X"
      andalso ap(L"X" ## L"Y", NIL) = L"X" ## L"Y"
      andalso ap(L"X" ## L"Y", L"Z") = (L"X" ## L"Y")##L"Z"
      
(* obap5: obap.apint(p,x) via obap.ap(p,x) with individual p *)

val CkObap5 = ap(NIL,L"X") = L"X"
      andalso ap(A, L"X" ## L"Y") = L"X"
      andalso ap(B, L"X" ## L"Y") = L"Y"
      andalso ap(C, L"X") = C ## e(L"X") ## ARG
      andalso ap(D, L"X") = D ## e(L"X") ## ARG
      andalso ap(E, L"X") = e(L"X")
      andalso ap(L"X", L"Y") = L"X" ## L"Y"
      andalso ap(L"X", NIL) = L"X" ## e(NIL)
      andalso ap(L"X", e(L"Y")) = L"X" ## e(e(L"Y"))
      andalso ap(SELF, L"X") = e(SELF) ## e(L"X")
      andalso ap(ARG, L"X") = e(ARG) ## e(L"X")
      andalso ap(EV, L"X") = e(EV) ## e(L"X")

(* obap6 obap.ev(p,x,e) via obap.ap(p,x) procedures and eval(exp) expressions 
   *)

val ckObap6 = eval(L"X" ## L"Y") = L"X" ## L"Y"
      andalso (let val xyz = L"X" ## L"Y" ## L"Z"
                in           ap(xyz, NIL) = xyz
                     andalso eval(xyz) = xyz
               end)  
      andalso ap(L"X" ## L"Z", L"Y" ## L"Z") = (L"X" ## L"Z") ## L"Y" ## L"Z"
      andalso eval((L"X" ## L"Z") ## L"Y" ## L"Z") 
                = (L"X" ## L"Z") ## L"Y" ## L"Z" 

(* Demonstrate ob cK as script for a computational manifestation of combinator 
   K having ap(ap(cK,x),y) = eval( (e(cK) ## e(x)) ## e(y) ) = x as required.
   See <https://github.com/orcmid/miser/blob/master/oMiser/combinators.txt>
   sections 1.1, 1.2, 2.1, 2.3, and 3.2.
   *)
val cK = E 
         (* effectively lambda.X lambda.Y ‵X in oFrugalese *);

val CkObap7 
    = let val cKX = e(L"X")
       in ap( cKX, NIL) = L"X"
          andalso ap( cKX, L"Y") = L"X"
          andalso ap(cK,L"X") = cKX
          andalso ap( ap(cK,L"X"), L"Y") = L"X" 
          andalso ap( e(cK) ## L"X", NIL) = e(L"X")   
          andalso ap( e(cK) ## L"X", L"Y") = e(L"X")   
          andalso eval( (e(cK) ## L"X") ## NIL ) = L"X"
          andalso eval( (cK ## L"X") ## NIL ) = L"X"
          andalso eval( (e(cK) ## e(L"X")) ## e(L"Y") ) = L"X"
           andalso eval( (cK ## e(L"X")) ## e(L"Y") ) = L"X"
      end
             
(* Demonstrate ob cS as script for a computational manifestation of combinator
   S having 
            ap(ap(ap(cS,x),y),z) = eval( ( (e(cS) ## e(x)) ## e(y) ) ## e(z) ) 
                                 = ap(ap(x,z),ap(y,z))
   as required. 
   See <https://github.com/orcmid/miser/blob/master/oMiser/combinators.txt>
   sections 1.1, 1.2, 2.1, 2.3, and 3.2.
   *)
val cS = C##e(C)##(C##(E##(C##(E##ARG)##e(ARG)))##e(C##(E##ARG)##e(ARG))) 
         (* effectively lambda.X lambda.Y lambda.Z ‵((X :: Z) :: Y :: Z) 
            in oFrugalese 
            *);
       
val CkObap8 
    = let val SXYZ = (L"X" ## L"Z") ## L"Y" ## L"Z"
          val SXY = (e(L"X") ## ARG) ## e(L"Y") ## ARG
          val SX = C##e(e(L"X")##ARG)##C##(E##ARG)##e(ARG) 
       in ap(L"X",L"Z") = L"X" ## L"Z"
          andalso ap(L"Y",L"Z") = L"Y" ## L"Z"
          andalso ap(L"X" ## L"Z", L"Y" ## L"Z") = SXYZ
          andalso ap(ap(L"X",L"Z"),ap(L"Y",L"Z")) = SXYZ
          andalso ap(SXYZ, NIL) = SXYZ
          andalso eval(SXYZ) = SXYZ 
          andalso ap(SXYZ, L"more") = SXYZ ## L"more"
          andalso eval(e(SXYZ) ## L"more") = SXYZ ## L"more"
          andalso ap(SXY,L"Z") = SXYZ
          andalso eval(e(SXY) ## L"Z") = SXYZ
          andalso ap(SX, L"Y") = SXY
          andalso ap(ap(SX, L"Y"), L"Z") = SXYZ
          andalso eval(e(SX)##L"Y") = SXY
          andalso eval((e(SX)##L"Y")##L"Z") = SXYZ
          andalso ap(cS,L"X") = SX
          andalso ap(ap(cS,L"X"),L"Y") = SXY
          andalso ap(ap(ap(cS,L"X"),L"Y"),L"Z") = SXYZ
          andalso eval(e(cS)##L"X") = SX
          andalso eval((e(cS)##L"X")##L"Y") = SXY
          andalso eval(((e(cS)##L"X")##L"Y")##L"Z") = SXYZ                         
      end

(* Demonstrate ob cI as script for a computational manifestation of combinator
   I having
            ap(cI,x) = eval( (e(cI) ## e(x)) ) = x
                     = ap(ap(ap(cS,cK),cK),x)
                     = x
   Equivalent manifestation using script ap(ap(cS,cK),cK) is also demonstrated.
   *)
val cI = NIL
val CkObap9 = let val SKK = eval((e(cS)##e(cK))##e(cK))
                in SKK = (e(cK)##ARG)##(e(cK)##ARG)
                   andalso ap(SKK,L"X") = L"X"
                   andalso eval(e(SKK)##L"X") = L"X"
                   andalso ap(cI,L"X") = L"X"
                   andalso eval(e(cI) ## L"X") = L"X"
                   andalso ap(cI, L"X") = L"X"
                   andalso eval(e(cI ## ARG)##L"X") = L"X"
               end;


(* Demonstrate comparison checks and conditional evaluation of
   the selected branches *)
val CkObap10 
    = eval(D ## L"X" ## L"X") = A
      andalso eval(D ## L"X" ## NIL) = B
      andalso eval((D ## L"X" ## L"X") ## L"true" ## L"false") = L"true"
      andalso eval((D ## L"X" ## L"Y") ## L"true" ## L"false") = L"false"
      andalso eval( EV ## (D ## L"X" ## L"X") ## e(L"true") ## e(L"false") )
                = L"true"
      andalso eval( EV ## (D ## L"X" ## L"Y") ## e(L"true") ## e(L"false") ) 
                = L"false"

(* Demonstrate a script that is one way of checking that a given ob appears
   in a list of obs.  This is tantamount to the Frugalese definitions
   
   fun has(x) List = let hasX L
                       = not is-singleton L
                         andalso (x = a L orelse hasX b L)
                      in hasX List
                      
   fun has(x) = rec.hasX lambda.L (not is-singleton L
                          andalso (x = a L orelse hasX b L)

   with a variety of idioms at the ob level.
   *)
   
val hasX = EV ## (D ## ARG ## B ## ARG)
              ## e( B ## ( EV ## (D ## e(L"X") ## A ## ARG)
                              ## e( A ## (SELF ## B ## ARG) )
                              ) );                          
                              
(*  has is effectively lambda.X ‵( hasX ) in oFrugalese *)                                 
val has 
    = C ## e(EV) 
        ## C ## e(D ## ARG ## B ## ARG)
             ## E ## C ## B 
                       ## C ## e(EV) 
                            ## C ## (C ## e(D) 
                                       ## (C ## (E ## ARG) 
                                             ## e(A ## ARG)))
                                 ## E ## e( A ## SELF ## B ## ARG);                              
                                 
val ckObap11
    = ap(hasX, NIL) = B
      andalso eval(e(hasX) ## NIL) = B
      andalso ap(hasX, L"X" ## NIL) = A
      andalso ap(hasX, L"Y" ## NIL) = B
      andalso ap(hasX, L"X") = B
      andalso ap(hasX, L"A" ## (L"X" ## L"X") ## L"B" ## NIL) = B
      andalso ap(hasX, L"A" ## L"B" ## L"C" ## L"X" ## NIL) = A
      andalso eval(e(hasX) ## e(L"A" ## (L"X" ## L"X") ## L"B" ## NIL)) = B
      andalso eval(e(hasX) ## e(L"A" ## L"B" ## L"C" ## L"X" ## NIL)) = A
      
val ckObap12 
    = ap(has, L"X") = hasX
      andalso ap(ap(has, NIL),NIL) = B 
      andalso ap(ap(has, NIL), NIL ## NIL) = A
      andalso eval( (e(has) ## L"X" ) 
                    ## e(L"A" ## L"B" ## L"C" ## L"X" ## NIL)) = A
      andalso eval( (e(has) ## L"X" ) 
                    ## e(L"A" ## (L"X" ## L"X") ## L"B" ## NIL)) = B  

(* Confirm some cases of SML/NJ expression evaluation involving infix
   operators and applicative expressions.
   *)
   
val ckObap13
    = a (L"M" ## L"X" ## NIL) :: b (L"X") :: [] = L"M" :: L"X" :: []
      andalso let fun p(f) = (fn x => f(x)) 
               in p a (L"M" ## L"X" ## NIL) :: p b (L"X") :: [] 
                  = L"M" :: L"X" :: []
              end;
              
print( "\ncK = " ^ obstring(cK) ^ "\n");         
print("\ncS = " ^ obstring(cS) ^ "\n");                 
print( "\ncI = " ^ obstring(cI) ^ "\n");   
print("\ncSKK = " ^ obstring(ap(ap(cS,cK),cK)) ^ "\n");
print("\n(cSKK) x) = " ^ obstring(ap(ap(ap(cS,cK),cK),L"x")) ^ "\n");
print("\ncI x = " ^ obstring(ap(cI,L"x")) ^ "\n");
print( "\nhasX = " ^ obstring(hasX) ^ "\n");                                     
print( "\nhas = " ^ obstring(has) ^ "\n");                 
    
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
        
      * Provide systematic treatment of lindy traces to identify any
        edge cases, any disconnects with the assertion of what traces are.
        
      * Check that (C ## x) ## y and (C ## x ## y) work the same.
      
      * Check that (D ## x) ## y and (D ## x ## y) work the same.
      
      * Get string output in Unicode and verify that functionality 
                
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 
   0.0.9 2018-02-08-10:50 Add checks that cI and cSKK are both identity
         combinators, but not the same, adjusting the cI checks and also
         simplifying cK.
   0.0.8 2018-02-07-18:12 Touch up some comments, demonstrate obstring.
   0.0.7 2018-01-22-19:57 Add ckObap13 to confirm SML's infix precedence
         (e.g., ::) being after SML applicative expressions.
   0.0.6 2018-01-09-21:15 Add and adjust cases for is_pure_lindy_trace(ob)
         evaluation and interpretation confirmations.
   0.0.5 2017-12-30-16:53 Touch up oFrugalese and also make groupings so 
         conditional pair-member selections are more evident.
   0.0.4 2017-11-02-10:33 Adjust TODOs.  Add obap.D and obap.EV checks, with
         demonstration of conditional recursion for has(x) L list membership.
   0.0.3 2017-09-20-10:24 Remove satisfied TODOs reflecting the successful
         alignment of obaptheory and the SML computational manifestation.
   0.0.2 2017-09-19-19:53 Confirm Obap4-Obap7 applicative operation for 
         manifestation of effectively-universal functions ap(p,x) and eval(exp)
   0.0.1 2017-09-16-17:00 Confirm primitives and Obap1-Obap2 interpretation.
   0.0.0 2017-09-15-12:37 Skeleton for progressive introduction of tests
         as obap.sml is extended, starting with verificaton of the traces.
         
   *)
         
(*                         *** end of obapcheck.sml ***                     *)        
        
   