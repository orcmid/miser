(* obap.sml 0.0.0                     UTF-8                      dh:2017-09-15

                       OMISER ‹ob› INTERPRETATION IN SML
                       ================================
                       
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obadt.sml>
           
           THE SML obap ABSTRACT DATA TYPE WITH UNIVERSAL FUNCTIONS
           --------------------------------------------------------
                         
   A computational manifestation of the mathematical structure, ‹ob›, in
   Standard ML of New Jersey (SML/NJ).  For the mathematical formulation,
   see <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt>.
   For the structure/interface requirements and connection with the primitive
   notions of the mathematical formulation, see
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/OB.sig.sml>.
   For consideration of the soundness of this interpretation, see
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obcheck.sml>.
   *)
   
use "OBAP.sig.sml";
   
structure obap :> OBAP
 = struct
 
      datatype ob = c of ob * ob  
                  | e of ob
                  | L of string 
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
          
      infixr 5 ##
      fun (x ## y) = c(x, y)
         (* to use this infix, either open structure obap or define
               val ## = obap.##
            and then declare
               infix 5 ##
            *)
            
      fun ` x = e(x)
          (* likewise ... *)
       
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
 
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
   TODO
 
    * Look at creating a library that can be installed via the SML/NJ
      Compilation Manager and reused easily that way.
   
   *)
   
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


   0.0.0 2017-07-25-11:24 Skeleton for building up the additional notions
         and implementing the universal applicative functions ap(p,x) and
         eval(e)
         *)
         
(*                         *** end of ob.sml ***                             *)
