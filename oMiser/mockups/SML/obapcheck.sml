(* obapcheck.sml 0.0.4               UTF-8                        dh:2017-**-**

                        OMISER ‹ob› INTERPRETATION IN SML
                        ================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obapcheck.sml> 
        
              CHECKING APPLICATIVE EXTENSIONS IN OBAP STRUCTURE
              -------------------------------------------------
       
   [Author Note: Tie to obcheck.sml, obtheory.txt, ob.sml, obaptheory, and
    the obap.sml structure or similar ones.]
    *)
    
use "obap.sml";
open obap;
(* MODIFY THESE TWO LINES TO CHECK OTHER IMPLEMENTATION STRUCTURES.  THE CHECKS 
   SHOULD WORK DIRECTLY.
   *)
   
infixr 5 ## ;

(* DEMONSTRATE EXTENSIONS 
   *)

(* Obap1: Additional individuals obap.A, obap.B, obap.C, obap.D, obap.E
          obap.SELF, and obap.ARG
          *)
          
val prims = [A,B,C,D,E,SELF,ARG,NIL]

val CkObap1 
    = let fun are_inds ([]) = true
            | are_inds (x::xs') = is_individual x andalso are_inds xs'
       in are_inds prims
      end
       
(* Obap2: Literal Individuals (Lindies) *)

val lindies = [L"A",L"a",L"lindy",L"X",L"Y",L"XY"]

val CkObap2a 
    = let fun are_lindies ([]) = true
            | are_lindies (x::xs') = is_lindy(x) andalso are_lindies xs'
       in are_lindies lindies
      end
       
val CkObap2b
    = let fun are_diff(xs: ob list) 
              = case xs
                  of x :: xs' => not (List.exists (fn a => a = x) xs')
                                 andalso are_diff xs'
                   | _ => true
       in are_diff (prims @ lindies)
      end
      
(* obap4: obap.ap(p,x) *)

val CkObap4a = ap(ARG##SELF,ARG) = e(ARG) ## e(ARG ## SELF)  

val CkObap4b = ap(e(ARG) ## e(ARG ## SELF), L"Z") = e(ARG) ## e(ARG##SELF)
      
val CkObap4c = ap(e(L"X"),L"Y") = L"X"
      
(* obap5: obap.apint(p,x) via obap.ap(p,x) with individual p *)

val CkObap5a = ap(NIL,L"X") = L"X"
val CkObap5b = ap(A, L"X" ## L"Y") = L"X"
val CkObap5c = ap(B, L"X" ## L"Y") = L"Y"
val CkObap5d = ap(C, L"X") = C ## e(L"X") ## ARG
val CkObap5e = ap(D, L"X") = D ## e(L"X") ## ARG
val CkObap5f = ap(E, L"X") = e(L"X")
val CkObap5g = ap(L"X", L"Y") = L"X" ## L"Y"
val CkObap5h = ap(L"X", NIL) = L"X" ## e(NIL)
val CkObap5i = ap(L"X", e(L"Y")) = L"X" ## e(L"Y")
val CkObap5j = ap(SELF, L"X") = e(SELF) ## e(L"X")
val CkObap5k = ap(ARG, L"X") = e(ARG) ## e(L"X")

(* obap6 obap.ev(p,x,e) via obap.ap(p,x) procedures and eval(exp) expressions *)

val CkObap6a = let val cKX = e(L"X")
                in ap( cKX, NIL) = L"X"
               end             
val cK = E ## ARG     (* currying of cKX to cK *)          
val CkObap6b =         ap(cK,L"X") = e(L"X")
               andalso ap( ap(cK,L"X"), NIL) = L"X"               
val CkObap6c = ap( e(cK)##L"X", NIL) = e(L"X")                          
val CkObap6d = eval( (e(cK)## L"X") ## NIL ) = L"X"
    (* demonstrating a computational manifestation of combinator K in obap *)
              
val CkObap6e = eval(L"X" ## L"Y") = L"X" ## L"Y"
val CkObap6f = let val xyz = L"X" ## L"Y" ## L"Z"
                in           ap(xyz, NIL) = xyz 
                     andalso eval(xyz) = xyz
               end

val cS = C##e(C)##(C##(E##(C##(E##ARG)##e(ARG)))##e(C##(E##ARG)##e(ARG)))   
val Ck0bap6g = let val SXYZ = (L"X" ## L"Z") ## L"Y" ## L"Z"
                    in         ap(L"X",L"Z") = L"X" ## L"Z"
                       andalso ap(L"Y",L"Z") = L"Y" ## L"Z"
                       andalso ap(L"X" ## L"Z", L"Y" ## L"Z") = SXYZ
                       andalso ap(ap(L"X",L"Z"),ap(L"Y",L"Z")) = SXYZ
                       andalso eval(SXYZ) = SXYZ 
                   end
val Ck0bap6h = let val SXYZ = (L"X" ## L"Z") ## L"Y" ## L"Z"   
                   val SXY = (e(L"X") ## ARG) ## e(L"Y") ## ARG
                in             ap(SXY,L"Z") = SXYZ
                       andalso eval(e(SXY) ## L"Z") = SXYZ 
                   end
val Ck0bap6i = let val SXYZ = (L"X" ## L"Z") ## L"Y" ## L"Z"   
                   val SXY = (e(L"X") ## ARG) ## e(L"Y") ## ARG
                   val SX = C##e(e(L"X")##ARG)##C##(E##ARG)##e(ARG) 
                in         ap(SX, L"Y") = SXY
                   andalso ap(ap(SX, L"Y"), L"Z") = SXYZ
                   andalso eval(e(SX)##L"Y") = SXY
                   andalso eval((e(SX)##L"Y")##L"Z") = SXYZ
               end                   
val CkObap6j = let val SXYZ = (L"X" ## L"Z") ## L"Y" ## L"Z"   
                   val SXY = (e(L"X") ## ARG) ## e(L"Y") ## ARG
                   val SX = C##e(e(L"X")##ARG)##C##(E##ARG)##e(ARG) 
                in         ap(cS,L"X") = SX
                   andalso ap(ap(cS,L"X"),L"Y") = SXY
                   andalso ap(ap(ap(cS,L"X"),L"Y"),L"Z") = SXYZ
                   andalso eval(e(cS)##L"X") = SX
                   andalso eval((e(cS)##L"X")##L"Y") = SXY
                   andalso eval(((e(cS)##L"X")##L"Y")##L"Z") = SXYZ                   
               end
    (* demonstrating a computational manifestation of combinator S in obap *)

val cI = NIL
val CkObap6k = let val SKK = eval((e(cS)##e(cK))##e(cK))
                in         SKK = (e(cK)##ARG)##(e(cK)##ARG)
                   andalso ap(SKK,L"X") = L"X"
                   andalso eval(e(SKK)##L"X") = L"X"
                   andalso ap(cI,L"X") = L"X"
                   andalso eval(cI ## L"X") = L"X"
                   andalso eval(e(cI) ## L"X") = L"X"
                   andalso ap(cI##ARG, L"X") = L"X"
                   andalso eval(e(cI##ARG)##L"X") = L"X"
               end
     (* demonstrating different computational scripts for combinator I *)
                          

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
        edge cases, any disconnects with the assertion of what traps are.
                
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 
   0.0.4 2017-**-**-**:** Adjust TODOs
   0.0.3 2017-09-20-10:24 Remove satisfied TODOs reflecting the successful
         alignment of obaptheory and the SML computational manifestation.
   0.0.2 2017-09-19-19:53 Confirm Obap4-Obap7 applicative operation for 
         manifestation of effectively-universal functions ap(p,x) and eval(exp)
   0.0.1 2017-09-16-17:00 Confirm primitives and Obap1-Obap2 interpretation.
   0.0.0 2017-09-15-12:37 Skeleton for progressive introduction of tests
         as obap.sml is extended, starting with verificaton of the traces.
         
       *)
         
(*                         *** end of obapcheck.sml ***                     *)        
        
   