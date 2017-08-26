(* obtest.sml 0.0.10                   UTF-8                      dh:2017-08-**

                         OMISER <ob> CONFIRMATION IN SML
                         ===============================
                        
   These tests demonstrate how the Standard ML of New Jersey manifestation
   of oMiser obs is faithful to the mathematical conditions that apply
   to obs as mathematical objects.  This fidelity supports the quasi-
   Platonic persistence of the mathematical structure, <ob> independent
   of SML or any concrete computational realization.
   *)
   
use "ob.sml";

(*             
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
                   
   Ob7. Identity Among Primitive Individuals
        Individuals identified by upper-case namings, such as ob.NIL,
        are distinct if and only if their names differ.  Those 
        individuals are also distinct from individuals of any other
        kind that may arise. 
        
   There are a limited number of fixed-name primitive individuals.  They
   can be taken as given.  They are not definable in terms of others.
      
   With representation of primitive individuals (such as ob.NIL) by
   similarly-spelled SML ob datatype unitary constructors (such as ob_NIL),
   the SML (op =) and (op <>)  are claimed as interpretations of the miser-
   theory = and ≠ relations. 
   
   There is a discrepancy between the mathematical formulation so far and the
   way SML handles structural identity.  Consider these propositions:
   
               w = ob.c(u,v)
               v = ob.e(w)
               
   This prospect conflicts with the desire that no ob formally depend on 
   anything that depends on it.  Such cases are excluded by imposing a partial
   ordering on obs.
   
   Ob8. The ¶ Precedes Relation
   
        ¬ (x ¶ x)                                (a), irreflexive
        (x ¶ y) ⇒ ¬ (y ¶ x)                      (b), non-commutative
        (x ¶ y) ∧ (y ¶ z) ⇒ (x ¶ z)             (c), transitive
        
        x = y ⇔ ¬ (x ¶ y) ∧ ¬ (y ¶ x)           (d), ordering
        
        z = ob.e(y) ⇔ (y ¶ z)                    (e), construction
        z = ob.c(x,y) ⇔ (x ¶ z) ∧ (y ¶ z)
        
        ob.is-individual(x) ⇒ x ¶ ob.e(x)         (f), floating     
        ob.is-individual(x) ⇒ x ¶ ob.c(x,y)      
        ob.is-individual(x) ⇒ x ¶ ob.c(y,x)
   
   There is no requirement to explicate relation ¶ in an interpretation.
   It is sufficient to assure that an interpretation cannot manifest an
   ob that depends on anything that depends on it.  
   
   Ob9. Denumerability.
        The set Ob consists of all distinct, finitely-expressible obs 
        satisfying conditions Ob1-Ob8 and having no occurrences of ob.a 
        and ob.b in their formulation.  The individuals are denumerable.
        
   Ob is unbounded and denumerable provided that the individuals be 
   denumerable.
   *)   
                    
(* 0.0.10 2017-08-**-**:** Factor out obtheory.txt and add correspondence
          of interpretation to ob.sml.  
   0.0.9 2017-08-22-09:53 Demonstrate the case to be eliminated and employ
         the ¶ relationship to impose partial ordering over finite obs.
         Expand Ob1-Ob2 so that ob.a and ob.b are determined explicitly.
   0.0.8 2017-08-21-11:29 Adjust Ob7 to Named Primitive Individuals
   0.0.7 2017-08-21-08:39 Tighten identity among miser-theory obs and 
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
   