(* obtest.sml 0.0.4                   UTF-8                      dh:2017-08-06

                         OMISER <ob> CONFIRMATION IN SML
                         ===============================
                        
   These tests demonstrate how the Standard ML of New Jersey manifestation
   of oMiser obs is faithful to the mathematical conditions that apply
   to obs as mathematical objects.  This fidelity supports the quasi-
   Platonic persistence of the mathematical structure, <ob> independent
   of SML or any concrete computational realization.
   *)
   
use "ob.sml";

(* SOME <ob> AXIOMS.  
   Here conventional mathematical equations are used as essential
   axioms and useful helpers.  These features must apply for any
   manifestation via computer representation. NOTE: The use of "." 
   here is independent of the same use in SML/NJ notation.  The 
   similarity is coincidental, although perhaps similarly-motivated.
   
   Ob1. Pairs.
        z = ob.c(ob.a(z),ob.b(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) ≠ z
       
   Ob2. Enclosures.
        z = ob.e(ob.a(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) = z
       
   Ob3. Individuals.
        ob.is-individual(z) ⇔ ob.a(z) = z ∧ ob.b(z) = z
       
   Ob4. Structural Discrimination Predicates
        ob.is-singleton(z) ⇔ ob.b(z) = z.
        ob.is-pair(z) ⇔ ¬ ob.is-singleton(z)
        ob.is-enclosure(z) ⇔ ob.is-singleton(z) ∧ ob.a(z) ≠ z
        
   Ob5. Totality
        ob.is-individual(z) ∨ ob.is-enclosure(z) ∨ ob.is-pair(z)
        
   It is a consequence that each ob is exactly one of pair, 
   enclosure, and individual and there are no others.  What we 
   don't have is a structural distinction amone individuals.
   *)
        
        
(* 0.0.4 2017-08-06-08:14 Repair erroneous nesting of comments.
   0.0.3 2017-08-06-08:10 Clean up statement about distinguishing
         individuals.
   0.0.2 2017-08-05-12:10 Touch up the axioms treatment.
   0.0.1 2017-08-04-16:24 Add the definitional axioms.
   0.0.0 2017-07-28-10:56 Placeholder for inclusion of essential
         confirmation checks.
         *)
         
(*                          *** end of obtest.sml ***                       *)        
   