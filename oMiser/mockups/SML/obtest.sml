(* obtest.sml 0.0.10                   UTF-8                      dh:2017-08-27

                        OMISER ‹ob› INTERPRETATION IN SML
                        ================================
                       
        <https://github.com/orcmid/miser/oMiser/mockups/SML/obtest.sml> 
        
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
       We appeal to the predictable behavior of SML/NJ implementations to claim
       that the interpretation satisfies the conditions of the ‹ob› theory.  Test
       cases are provided to demonstrate that no obvious aberration has been
       introduced.  Rely on the dependability of systematic SML/NJ behavior.
       
    2. Formal (mechanical) Proof.
       Given representation of SML/NJ semantics in a mathematical formalism,
       one might apply proof techniques to establish that the ‹ob› structure
       conditions are satisfied by the interpretation.  That is a worthwhile
       topic, with its own difficulties, to be taken up later.
   *)
   
use "ob.sml";
                  
(* 0.0.10 2017-08-27-15:42 Factor the mathematical treatment into obtheory.txt.
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
   