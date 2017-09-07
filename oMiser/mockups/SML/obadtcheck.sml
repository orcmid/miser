(* obadtcheck.sml 0.0.2              UTF-8                       dh:2017-09-06

                        OMISER ‹ob› INTERPRETATION IN SML
                        ================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obadtcheck.sml> 
        
       VERIFICATION AND VALIDATION OF THE SML ABSTRACT TYPE MANIFESTATION
       ------------------------------------------------------------------
       
   For the computational manifestation of the theoretical ‹ob› structure, see
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obadt.sml>.
   
   See <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt> for 
   the mathematical formulation of the abstract theory.
   
   Here, "sound interpretation" and "soundness" are specialized beyond
   the mathematical-logic usage.  When we speak of truth in a physically-
   realizable interpretation, we mean true or false as as a matter of fact.
   Deductions in the mathematical theory will have empirically-confirmable 
   particular facts in the computational interpretation.  
             
   Verifying the obadt.sml ob datatype as a sound computational manifestation
   of the mathematical ‹ob› structure is not possible by any kind of exhaustive
   enumeration of confirmation tests.  Testing that theory-forbidden cases are 
   not possible is unworkable.  One might demonstrate the presence of a 
   defect; demonstrating absence of defects is out of reach by testing.
   
   Compare two prospects for confirmation that the interpretation is
   sound: informal argument and formal proof.
   
    1. Informal Argument.
       Appeal to predictable behavior of SML/NJ implementations.  Claim that
       the interpretation satisfies all conditions of ‹ob› theory.  Provide
       check that demonstrate no obvious aberration is present.  Rely on the 
       dependability of systematic SML/NJ behavior.
       
    2. Formal (mechanical) Proof.
       Given presentation of SML/NJ semantics in a mathematical formalism,
       apply proof techniques to establish that the ‹ob› structure conditions
       are satisfied by the interpretation.  That is an appealing notion,
       with its own difficulties, to be taken up later.
   *)
   
use "obadt.sml";

(* DEMONSTRATE PRIMITIVES 
   These are simple confirming demonstrations.  They are not proofs. 
   Checking simple cases confirms that nothing blatant has gone
   amiss.  These results are predictable from the declarations in 
   obadt.sml. 
   *)

val ob_logo = ob.c(ob.NIL, ob.e ob.NIL)
              (* pattern of the oMiser logo diagram at 
                 <http://miser-theory.info> *)
val nob_logo = ob.e ob_logo
                 
(* Ob1. Pairs
        z = ob.c(x,y) ⇒ ob.a(z) = x ∧ ob.b(z) = y
        z = ob.c(ob.a(z),ob.b(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) ≠ z
        *)                 
                 
val ckOb1a = let val z = ob.c(ob.e ob_logo, ob.NIL)
              in ob.a z = ob.e ob_logo andalso ob.b z = ob.NIL
             end
           
val ckOb1b = let val z = ob.c(ob.a ob_logo, ob.b ob_logo)
              in z = ob_logo andalso ob.a z <> z andalso ob.b z <> z
             end
           
(* Ob2. Enclosures
        z = ob.e(x) ⇒ ob.a(z) = x ∧ ob.b(z) = z
        z = ob.e(ob.a(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) = z
        *)
   
val ckOb2a = let val z = ob.e(ob.b ob_logo)
              in ob.a z = ob.b ob_logo andalso ob.b z = z
             end
                 
val ckOb2b = let val z = ob.e(ob.a nob_logo)   
              in z = nob_logo andalso ob.a z = ob_logo andalso ob.b z = z
             end
   
(* Ob3. Individuals
        ob.is-individual(z) ⇔ ob.a(z) = z ∧ ob.b(z) = z
        *)
   
val ckOb3 =         ob.is_individual ob.NIL 
            andalso not (ob.is_individual ob_logo)
            andalso not (ob.is_individual nob_logo)
            
(* Ob4. Structural Discrimination Predicates
        ob.is-singleton(z) ⇔ ob.b(z) = z.
        ob.is-pair(z) ⇔ ¬ ob.is-singleton(z)
        ob.is-enclosure(z) ⇔ ob.is-singleton(z) ∧ ob.a(z) ≠ z
        *)
   
val ck0b4a =         ob.is_singleton ob.NIL
             andalso ob.is_singleton nob_logo
             andalso ob.is_singleton(ob.b nob_logo)
             andalso ob.is_singleton(ob.b ob.NIL)
             andalso not(ob.is_singleton ob_logo)
             andalso not(ob.is_singleton(ob.a nob_logo))
             
val ck0b4b =         ob.is_pair ob_logo
             andalso not(ob.is_pair nob_logo)
             andalso not(ob.is_pair(ob.a ob_logo))
             
val ckOb4c =         ob.is_enclosure nob_logo
             andalso ob.is_enclosure(ob.b ob_logo)
             andalso not(ob.is_enclosure ob_logo)
             andalso not(ob.is_enclosure(ob.a nob_logo))
             
(* Ob5. Totality
        ob.is-individual(z) ∨ ob.is-enclosure(z) ∨ ob.is-pair(z) 
        
   Observe that the three flavors are partitioned by distinct cases of  
   ob.a(z) = z and/or ob.b(z) = z.  The fourth case, ob.a(z) = z with 
   ob.b(z) ≠ z is not possible in the ‹ob› structure and has no means of 
   construction in the SML interpretation of the primitive notions.  This
   provides a "don't-care" simplification for ob.is-individual(z) and
   ob.is_individual(z).
   *)
        
fun is_ob_proper z
        =        ( ob.is_pair z 
                   andalso not(ob.is_singleton z) )
          orelse ( ob.is_enclosure z 
                   andalso  not(ob.is_pair z)
                   andalso not(ob.is_individual z) )
          orelse ( ob.is_individual z 
                   andalso not(ob.is_pair z)
                   andalso not(ob.is_enclosure z) )
          
val ckOb5 =         is_ob_proper ob_logo 
            andalso is_ob_proper nob_logo 
            andalso is_ob_proper(ob.a ob_logo) 
            andalso is_ob_proper(ob.a nob_logo)
            andalso is_ob_proper ob.NIL
            
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
                
                  
(* 0.0.2 2017-09-06-18:13 Use verified GitHub URLs and make small touch-ups.
   0.0.1 2017-09-05-21:07 Transpose from obcheck.sml 0.0.16 for applying 
         equivalent checks on obadt.sml as appplied to ob.sml.
         *)
         
(*                       *** end of obadtcheck.sml ***                       *)        
   