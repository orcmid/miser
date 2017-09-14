(* obcheck.sml 0.0.18              UTF-8                         dh:2017-09-14

                        OMISER ‹ob› INTERPRETATION IN SML
                        ================================
                       
 <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/obcheck.sml> 
        
       VERIFICATION AND VALIDATION OF THE SML ABSTRACT TYPE MANIFESTATION
       ------------------------------------------------------------------
       
   For a computational manifestation of the theoretical ‹ob› structure, see
   <https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/ob.sml>.
   
   See <https://github.com/orcmid/miser/blob/master/oMiser/obtheory.txt> for 
   the mathematical formulation of the abstract theory.
   
   Here, "sound interpretation" and "soundness" are specialized beyond
   the mathematical-logic usage.  When we speak of truth in a physically-
   realizable interpretation, we mean true or false as as a matter of fact.
   Deductions in the mathematical theory will have empirically-confirmable 
   particular facts in the computational interpretation.  
             
   Verifying the ob.sml ob datatype as a sound computational manifestation
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
   
use "ob.sml";
open ob;
(* MODIFY THESE TWO LINES TO CHECK OTHER IMPLEMENTATION STRUCTURES.  THE CHECKS 
   SHOULD WORK DIRECTLY.
   *)
   
infixr 5 ## ;

(* DEMONSTRATE PRIMITIVES 
   These are simple confirming demonstrations.  They are not proofs. 
   Checking simple cases confirms that nothing blatant has gone
   amiss.  These results are predictable from the declarations in 
   obadt.sml. 
   *)

val ob_logo = c(NIL, e NIL)
              (* pattern of the oMiser logo diagram at 
                 <http://miser-theory.info> *)
val nob_logo = e ob_logo
                 
(* Ob1. Pairs
        z = ob.c(x,y) ⇒ ob.a(z) = x ∧ ob.b(z) = y
        z = ob.c(ob.a(z),ob.b(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) ≠ z
        *)                 
                 
val ckOb1a = let val z = c(e ob_logo, NIL)
              in ob.a z = e ob_logo andalso b z = NIL
             end
           
val ckOb1b = let val z = a ob_logo ## b ob_logo
              in z = ob_logo andalso a z <> z andalso b z <> z
             end
             
val ck0b1c = let val z = ob_logo ## nob_logo ## NIL
              in z = c(ob_logo, c(nob_logo, NIL))
             end
           
(* Ob2. Enclosures
        z = ob.e(x) ⇒ ob.a(z) = x ∧ ob.b(z) = z
        z = ob.e(ob.a(z)) ⇔ ob.a(z) ≠ z ∧ ob.b(z) = z
        *)
   
val ckOb2a = let val z = e(b ob_logo)
              in a z = b ob_logo andalso b z = z
             end
                 
val ckOb2b = let val z = e(a nob_logo)   
              in z = nob_logo andalso a z = ob_logo andalso b z = z
             end
   
(* Ob3. Individuals
        ob.is-individual(z) ⇔ ob.a(z) = z ∧ ob.b(z) = z
        *)
   
val ckOb3 =         is_individual NIL 
            andalso not (is_individual ob_logo)
            andalso not (is_individual nob_logo)
            
(* Ob4. Structural Discrimination Predicates
        ob.is-singleton(z) ⇔ ob.b(z) = z.
        ob.is-pair(z) ⇔ ¬ ob.is-singleton(z)
        ob.is-enclosure(z) ⇔ ob.is-singleton(z) ∧ ob.a(z) ≠ z
        *)
   
val ck0b4a =         is_singleton NIL
             andalso is_singleton nob_logo
             andalso is_singleton(b nob_logo)
             andalso is_singleton(b NIL)
             andalso not(is_singleton ob_logo)
             andalso not(is_singleton(a nob_logo))
             
val ck0b4b =         is_pair ob_logo
             andalso not(is_pair nob_logo)
             andalso not(is_pair(a ob_logo))
             
val ckOb4c =         is_enclosure nob_logo
             andalso is_enclosure(b ob_logo)
             andalso not(is_enclosure ob_logo)
             andalso not(is_enclosure(a nob_logo))
             
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
        =        ( is_pair z 
                   andalso not(is_singleton z) )
          orelse ( is_enclosure z 
                   andalso not(is_pair z)
                   andalso not(is_individual z) )
          orelse ( is_individual z 
                   andalso not(is_pair z)
                   andalso not(is_enclosure z) )
          
val ckOb5 =         is_ob_proper ob_logo 
            andalso is_ob_proper nob_logo 
            andalso is_ob_proper(a ob_logo) 
            andalso is_ob_proper(a nob_logo)
            andalso is_ob_proper NIL
            
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
                
                  
(* 0.0.18 2017-09-14-11:09 Incorporate check on infix ##.
   0.0.17 2017-09-13-16:45 Refactoring to use the form of obadtcheck.sml
          and to rely on opening of the structure being checked.  Obsoletes
          obadtcheck.sml.
   0.0.16 2017-09-02-11:21 Wordsmithing and simplifying some checks.
   0.0.15 2017-09-01-11:30 Consistent "pretty-printing" of layout and the
          omission of unnecessary ( ... ), distinctly SML.
   0.0.14 2017-08-31-14:18 Replace is_ob_good with is_ob_proper and reflect
          the partitioning as well as the totality.
   0.0.13 2017-08-30-12:48 Rename to obcheck.sml to reflect that there is only
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
         
(*                          *** end of obcheck.sml ***                       *)        
        
   