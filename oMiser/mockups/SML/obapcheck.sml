(* obapcheck.sml 0.0.1               UTF-8                        dh:2017-09-16

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
        
      * Verify lindies first.
      
      * Confirm that even with opening of obap, only the key functions
        are accessible.
        
      * Assume that obap.obcheck.sml has been applied and should be used
        if something fundamental seems to be amiss.
        
      * Confirm that ` cannot be piled up and see if ` `x works or has a
        type error.
        
      * Use the symbolic execution of the derivation of cS and cK as checks.
        
    *)
  
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -          
                 
   0.0.1 2017-09-16-17:00 Confirm primitives and Obap1-Obap2 interpretation.
   0.0.0 2017-09-15-12:37 Skeleton for progressive introduction of tests
         as obap.sml is extended, starting with verificaton of the traces.
         
       *)
         
(*                         *** end of obapcheck.sml ***                     *)        
        
   