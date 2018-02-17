(* obap.sml 0.0.11                    UTF-8                      dh:2018-02-17

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
   For the grammar used to express Canonical Obs and obaptheory terms, see
   <https://github.com/orcmid/miser/blob/master/oMiser/obstring.txt>.
   *)
   
use "OBAP.sig.sml";
   
structure obap :> OBAP
 = struct
 
      datatype ob = c of ob * ob  
                  | e of ob
                  | NIL 
                  
                  | A              (* obaptheory Obap1 additions ... *)
                  | B
                  | C
                  | D
                  | E
                  | SELF
                  | ARG
                  | EV
                  | L of string    (* Obap2 addition *)
                
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

      fun ` x = e(x)
                   
      infixr 5 ##
      fun (x ## y) = c(x, y)
         (* to use this infix, either open structure obap or define
               val ## = obap.##
            and then declare
               infix 5 ##
            *)
          
      (* Obap2: is-lindy manifestation *)
      fun is_lindy (L y) = true
        | is_lindy (_) = false
        
      (* Obap4: obap.ap(p,x)
         applies ob p interpreted as a procedure script to argument ob x
         *)
         
      fun ap(p: ob, x: ob) 
        = let fun is_pure_lindy_trace (L y) = true
                | is_pure_lindy_trace (c(x,y)) = is_pure_lindy_trace x
                                                 andalso is_pure_lindy_trace y
                | is_pure_lindy_trace (_) = false
                (* every singleton in the ob is a lindy *)
           in case p
                of c(_,_) =>  if is_pure_lindy_trace p 
                                 andalso is_pure_lindy_trace x
                              then p ## x 
                                  (* trace now in order not to lose x *) 
                              else ev(p,x,p)             
                 | e(y) => y
                 | NIL => x   (* Obap5: apint(p,x) inline *)
                 | A => a(x)
                 | B => b(x)
                 | C => C ## e(x) ## ARG
                 | D => D ## e(x) ## ARG
                 | E => e(x)
                 | L s => p ## (if is_pure_lindy_trace(x) then x else e x)
                 | _ => e(p) ## e(x)
          end        
               
      (* Obap6: obap.ev(p,x,e) evaluate e in body of obap.ap(p,x) *)        
      and ev(p: ob, x: ob, exp: ob)  
          = case exp 
              of e y => y
               | c(C,c(e1,e2)) => c( ev(p,x,e1), ev(p,x,e2) )
               | c(D,c(e1,e2)) => if ev(p,x,e1) = ev(p,x,e2) then A else B
               | c(EV,e2) => ev(p,x,ev(p,x,e2))
               | c(e1,e2) => ap( ev(p,x,e1), ev(p,x,e2) )
               | SELF => p
               | ARG => x
               | _ => exp
      
      (* Obap7: obap.eval(e) *)
      fun eval(exp: ob) = ev(SELF, ARG, exp)
      
      (* obstring.txt presentation of canonical ob structure in a string *)
      
       fun term(x: ob)
         = case x
             of L(s) => s
              | NIL => ".NIL"
              | A => ".A"
              | B => ".B"
              | C => ".C"
              | E => ".E"
              | D => ".D"
              | SELF => ".SELF"
              | ARG => ".ARG"
              | EV => ".EV"
              | _ => "?!"

       fun obstring(x: ob)
         = let fun unary(x) 
            = if is_individual(x)
                 then term(x)
                 else if is_singleton(x)
                      then "`" ^ unary(a x)
                           (* XXX: Using back-tick here *)
                      else "( " ^ obstring(x) ^ " )"
            in if is_pair(x)
               then unary(a x) ^ " :: " ^ obstring(b x)
               else unary(x)
           end;
 
      
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
      
    * Get the string operations to all work in Unicode.
   
   *)
   
(* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   0.0.11 2018-02-17-13:09 Include ' x "unary" operation for use
   0.0.10 2018-02-09-12:17 Reflect change from show-ob.txt to obstring.txt
   0.0.9 2018-02-07-17:09 Add obstring implementation to the structure
   0.0.8 2018-01-09-21:12 Switch to is_pure_lindy-trace(op).
   0.0.7 2017-10-12-11:43 Change is_every_free_lindy(p) to is_pure_lindy(p) 
         as better expression of knowing that application will not change it.
   0.0.6 2017-10-09-12:00 Align obap(p,x) handling of is-every-free-lindy(p)
         cases with 0.0.17 obaptheory.txt.
   0.0.5 2017-10-05-18:41 Touchup TODOs, Add handling of obap.EV cases.
   0.0.4 2017-09-20-19:22 Remove extraneous copy of is_lindy_everywhere and
         rename is_lindy_every_free to is_every_free_lindy.  Touch ups.
   0.0.3 2017-09-20-09:51 Make is_lindy_everywhere and is_lindy_every_free
         local to app and reconciled with corrected obaptheory specification.
   0.0.2 2017-09-19-19:48 Implement ap(p,x) and ev(p,x,exp) with avoidance
         of extraneous quotation and application on reduction to a trace.
   0.0.1 2017-09-16-16:58 Implement primitives and satisfy ap and eval 
         signatures with stubs for checking the primitives.
   0.0.0 2017-09-25-11:24 Skeleton for building up the additional notions
         and implementing the universal applicative functions ap(p,x) and
         eval(e)
         *)
         
(*                       *** end of obap.sml ***                            *)
