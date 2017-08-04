(* obtest.sml 0.0.1                   UTF-8                      dh:2017-08-04

                         OMISER <ob> CONFIRMATION IN SML
                         ===============================
                        
   These tests demonstrate how the Standard ML of New Jersey manifestation
   of oMiser obs is faithful to the mathematical conditions that apply
   to obs as mathematical objects.  This fidelity supports the quasi-
   Platonic persistence of the mathematical structure, <ob>.
   *)
   
use "ob.sml";

(* We will use conventional mathematical equations for the essential
   axioms and the behavior that must be apply for any manifestation 
   via computer representation.
   
   Ob1. Pairs.
        z = ob.c(ob.a(z),ob.b(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) ≠ z
       
   Ob2. Enclosures.
        z = ob.e(ob.a(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) = z
       
   Ob3. Individuals.
        ob.is-individual(z) ⇔ ob.a(z) = z ∧ ob.b(z) = z
       
   Ob4. Discrimination
        ob.is-singleton(z) ⇔ ob.b(z) = z.
        ob.is-pair(z) ⇔ ¬ ob.is-singleton(z)
        ob.is-enclosure(z) ⇔ ob.is-singleton(z) ∧ ob.a(z) ≠ z
        
   Ob5. Totality
        ob.is-individual(z) ∨ ob.is-enclosure(z) ∨ ob.is-pair(z)
        
        Each ob is exactly one of pair, enclosure, and individual.  
        
        
(* 0.0.1 2017-08-04-16:24 Add the definitional axioms.
   0.0.0 2017-07-28-10:56 Placeholder for inclusion of essential
         confirmation checks.
         *)
         
(*                          *** end of obtest.sml ***                       *)        
   