(* obtest.sml 0.0.7                   UTF-8                      dh:2017-08-21

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
   don't have is a structural distinction among individuals.
   
   Notation:
       ⇔ read if-and-only-if which is true only if both are true or
          both are false, a kind of logical equality relation
        ∨ is logical or, true when the operands are not both false
        ∧ is logical and, true when the operands are both true
        ¬  is logical not, true when the operand is false, false
              when the operand is true
                
   One difference between the mathematical conditions on structure <ob>
   and a computational realization is in terms of generality.  The
   mathematical conditions are about any and all obs, simply stated in
   compact notation.  Computationally, there is no dealing with manifestations 
   of obs as a totality.  There's an inexhaustive supply, mathematically, and
   there is no prospect of exhaustive testing of a proper computational
   manifestation (disregarding that the computational is subject to resource
   exhaustion and computer failure).
     
   Absent proof of successful representation by testing, we require other
   means to have empirical confidence in the fidelity of a computational
   manifestation of any abstract mathematical structure such as <ob>.   
   
   Consider that the ob.sml definitions constitute a valid representa- 
   tion by identifying and inspecting the intended correspondence.  Here,
   
        miser-theory <ob>           ob.sml interpretation
        -----------------           ---------------------
        ob.a function               ob_a: ob -> ob
        ob.b function               ob_b: ob -> ob
        ob.c function               ob_c: ob * ob -> ob (a constructor)
        ob.e function               ob_e: ob -> ob (a constructor)
        ob.is-individual predicate  is_ob_individual: ob -> bool
        ob.is-singleton predicate   is_ob_singleton: ob -> bool
        ob.is-pair predicate        is_ob_pair: ob -> bool
        ob.is-enclosure predicate   is_ob_enclosure: ob -> bool
        
        for obs x,y, whether x = y  (op =), *provisionally*
        
   With the choice of names, the correspondence may seem obvious.  However
   helpful the namings, we must not be misled by them.  The intended
   interpretations must be explicit and verified, not inferred.  
   
   Statement of the theory is incomplete with respect to = and ≠.  It
   is intended that identity be fully determined.
   
   Ob6. Structural Identity
        u = ob.c(v,w) ∧ z = ob.c(x,y) 
                   ⇒ (u = z ⇔ v = x ∧ w = y)                  (a)
        u = ob.e(v) ∧ z = ob.e(x) 
                   ⇒ (u = z ⇔ v = x)                           (b)
        ob.is-pair(u) ^ ob.is-singleton(z)
                   ⇒ u ≠ z                                     (c)
        ob.is-individual(u) ^ ob.a(z) ≠ z
                   ⇒ u ≠ z                                     (d)
                   
        with ⇒ signifying implication: logical if-then
                   
   Ob7. Individual Identity: Named Fixed Individuals
        Individuals identified by upper-case namings, such as ob.NIL,
        are distinct if and only if their names differ.  This meta-
        formalism avoids tedious enumeration of cases.
        
   With representation of named fixed individuals (such as ob.NIL) by
   similarly-spelled SML ob datatype unitary constructors (such as ob_NIL),
   the SML (op =) and (op <>)  are claimed as interpretations of the miser-
   theory = and ≠ relations. 
   
   For the claim to be valid, there is a discrepancy to resolve in the
   mathematical characterization of abstract obs.
   *)   
                    
(* 0.0.7 2017-08-21-08:39 Tighten identity among miser-theory obs and 
         correspondence of SML (op =) and (op <>) operations.
   0.0.6 2017-08-19-12:07 Identify the miser-theory <ob> with the ob.sml
         representation, absent the handling of = in the theory.
   0.0.5 2017-08-17-09:55 Add notes about the difference between mathematical
         generality and the limitation of tested computational manifestations
         to specificity.
   0.0.4 2017-08-06-08:14 Repair erroneous nesting of comments.
   0.0.3 2017-08-06-08:10 Clean up statement about distinguishing
         individuals.
   0.0.2 2017-08-05-12:10 Touch up the axioms treatment.
   0.0.1 2017-08-04-16:24 Add the definitional axioms.
   0.0.0 2017-07-28-10:56 Placeholder for inclusion of essential
         confirmation checks.
         *)
         
(*                          *** end of obtest.sml ***                       *)        
   