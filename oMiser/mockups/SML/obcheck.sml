(* obcheck.sml 0.0.13                   UTF-8                     dh:2017-08-30

                        OMISER ‹ob› INTERPRETATION IN SML
                        ================================
                       
        <https://github.com/orcmid/miser/oMiser/mockups/SML/obcheck.sml> 
        
       VERIFICATION AND VALIDATION OF THE SML COMPUTATIONAL MANIFESTATION
       ------------------------------------------------------------------
       
   See <https://github.com/orcmid/miser/oMiser/mockups/SML/ob.sml> for
   the proposed computational interpretation of the theoretical ‹ob› structure.
   
   See <https://github.com/orcmid/miser/oMiser/obtheory.txt> for the 
   mathematical formulation of the abstract theory.
   
   Here, "sound interpretation" and "soundness" are specialized beyond
   the mathematical-logic usage.  When we speak of truth in a physically-
   realizable interpretation, we mean true or false as as a matter of fact.
   Deductions in the mathematical theory will be empirically-confirmable 
   facts in the interpretation.
             
   Verifying the ob.sml ob datatype as a sound computational manifestation
   of the mathematical ‹ob› structure is not possible by any kind of exhaustive
   enumeration of confirmation tests.  Testing that theory-forbidden cases are 
   not possible is unworkable.  One might demonstrate the presence of a 
   defect; demonstrating absence of defects is out of reach.
   
   Compare two prospects for confirmation that the interpretation is
   sound: informal argument and formal proof.
   
    1. Informal Argument.
       Appeal to predictable behavior of SML/NJ implementations.  Claim that
       the interpretation satisfies all conditions of ‹ob› theory.  Provide
       test that demonstrate no obvious aberration is present.  Rely on the 
       dependability of systematic SML/NJ behavior.
       
    2. Formal (mechanical) Proof.
       Given presentation of SML/NJ semantics in a mathematical formalism,
       apply proof techniques to establish that the ‹ob› structure conditions
       are satisfied by the interpretation.  That is a worthwhile approach,
       with its own difficulties, to be taken up later.
   *)
   
use "ob.sml";

(* DEMONSTRATE PRIMITIVES 
   These are simple confirming demonstrations.  They are not proofs. 
   They check simple cases just to ensure that nothing blatant has gone
   amiss.  These results are predictable from the declarations in 
   ob.sml.  Note: None of these appeal directly to the SML datatype and
   especially patterns based on the SML ob datatype.
   *)

val ob_logo = ob_c(ob_NIL, ob_e(ob_NIL))
              (* pattern of the oMiser logo diagram at 
                 <http://miser-theory.info> *)
val nob_logo = ob_e(ob_logo)
                 
(* Ob1. Pairs
        z = ob.c(x,y) ⇒ ob.a(z) = x ∧ ob.b(z) = y
        z = ob.c(ob.a(z),ob.b(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) ≠ z
        *)                 
                 
val ckOb1a = let val z = ob_c(ob_e(ob_logo),ob_NIL)
              in ob_a(z) = ob_e(ob_logo) andalso ob_b(z) = ob_NIL
             end
           
val ckOb1b = let val z = ob_c(ob_a(ob_logo),ob_b(ob_logo))
              in z = ob_logo andalso ob_a(z) <> z andalso ob_b(z) <> z
             end
           
(* Ob2. Enclosures
        z = ob.e(x) ⇒ ob.a(z) = x ∧ ob.b(z) = z
        z = ob.e(ob.a(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) = z
        *)
   
val ckOb2a = let val z = ob_e(ob_b(ob_logo))
                  in ob_a(z) = ob_b(ob_logo) andalso ob_b(z) = z
                 end
                 
val ckOb2b = let val z = ob_e(ob_a(nob_logo))   
              in z = nob_logo andalso ob_a(z) = ob_logo andalso ob_b(z) = z
             end
   
(* Ob3. Individuals
        ob.is-individual(z) ⇔ ob.a(z) = z ∧ ob.b(z) = z
        *)
   
val ckOb3 =         is_ob_individual(ob_NIL) 
            andalso not (is_ob_individual(ob_logo))
            andalso not (is_ob_individual(nob_logo))
            
(* Ob4. Structural Discrimination Predicates
        ob.is-singleton(z) ⇔ ob.b(z) = z.
        ob.is-pair(z) ⇔ ¬ ob.is-singleton(z)
        ob.is-enclosure(z) ⇔ ob.is-singleton(z) ∧ ob.a(z) ≠ z
        *)
   
val ck0b4a =         is_ob_singleton(ob_NIL)
             andalso is_ob_singleton(nob_logo)
             andalso not(is_ob_singleton(ob_logo))
             andalso is_ob_singleton(ob_a ob_logo)
             andalso is_ob_singleton(ob_b ob_logo)
             andalso not(is_ob_singleton(ob_a nob_logo))
             andalso is_ob_singleton(ob_b nob_logo)
             andalso is_ob_singleton(ob_b ob_NIL)
             
val ck0b4b =         is_ob_pair(ob_logo)
             andalso not(is_ob_pair(nob_logo))
             andalso not(is_ob_pair(ob_a ob_logo))
             
val ckOb4c =         is_ob_enclosure(nob_logo)
             andalso is_ob_enclosure(ob_b ob_logo)
             andalso not(is_ob_enclosure(ob_logo))
             andalso not(is_ob_enclosure(ob_a nob_logo))
             andalso not(is_ob_enclosure(ob_a ob_logo))
             
(* Ob5. Totality
        ob.is-individual(z) ∨ ob.is-enclosure(z) ∨ ob.is-pair(z) 
        
   Observe that the three cases are partitioned by cases where  ob_a(z) = z
   and/or ob_b(z) = z.  The fourth case of ob_a(z) = z with ob_b(z) <> z 
   has no means of construction in the SML interpretation of the 
   primitive notions.
   *)
        
fun is_ob_good(z)
        =        (z = ob_c(ob_a(z), ob_b(z)) andalso is_ob_pair(z))
          orelse (z = ob_e(ob_a(z)) andalso is_ob_enclosure(z))
          orelse (ob_a(z) = z andalso ob_b(z) = z andalso is_ob_individual(z))
          
val ckOb5 =         is_ob_good(ob_logo) andalso is_ob_good(nob_logo) 
            andalso is_ob_good(ob_a ob_logo) andalso is_ob_good(ob_a nob_logo)
            andalso is_ob_good(ob_NIL)
            
(* Ob6-Ob7. Identity
   The SML/NJ default identity is such that obs with different constructions
   are distinct and for results of constructors taking tuples, identity is
   determined by identity of the corresponding tuple parts.  Named individuals
   are distinct constructors and automatically differentiated from each other 
   and from results of the constructors ob_c and ob_e.
   *)
   
(* Ob8. Precedence 
   Satisfaction of precedence is assured by 
     1. SML ob datatype values being immutable
     2. Eager evaluation of ob.c and ob.e constructor parameters prior to 
        determination of the datatype value instance.
   Note: The datatype definition is recursive; the datatype values are not.
   *)
                
                  
(* 0.0.13 2017-08-30-12:48 Rename to obcheck.sml to reflect that there is only
          simple informal checks that the mathematical conditions are satisfied
          by the SML/NJ ob datatype implementation.         
   0.0.12 2017-08-30-12:38 Add basic confirmation
   0.0.11 2017-08-29-13:19 Improve some wordings
   0.0.10 2017-08-27-15:42 Factor the mathematical treatment into obtheory.txt.
          Assert the interpretation correspondence in ob.sml.  Setup the 
          confirmation of interpretation soundness by informal argument and
          straightforward demonstrations.  
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
   