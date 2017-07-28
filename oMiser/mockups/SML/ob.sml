(* ob.sml 0.0.4                       UTF-8                      dh:2017-07-27

                        OMISER <ob> DEMONSTRATION IN SML
                        ================================
                         
   These definitions support a demonstration of oMiser in the existing
   functional-programming system, Standard ML of New Jersey (SML/NJ).
   *)
   
datatype ob = ob_c of ob * ob  (* used for pairing and cons notions *)
            | ob_e of ob       (* used for enclosing and quoting *)
            | ob_NIL;          (* one of distinguished ur-things, aka
                                  individuals, atoms, or units  *)
            
   (* The fundamental data structure.  The Miser Obs set
      consists of all finite constructions using this scheme.
      There will be many more individuals, such as ob_NIL, 
      and ways to introduce arbitrary others.
      *)
      
fun ob_a(x) = case x of
              ob_c(a, _) => a
            | ob_e(a) => a
            | _ => x
            
fun ob_b(x) = case x of  
              ob_c(_, b) => b  
            | _ => x
            
   (* There will be an arbitrary supply of individuals along
      with ob_NIL.  The primitive functions ob_a, ob_b, ob_c,
      and ob_e work properly for all of them.  The primitives
      are sufficient for representation of all computable 
      functions on obs.  That will be demonstrated in several
      ways.
      
      SML/NJ already provides the correct "=" for ob 
      identity, so far.  There is another crucial quality:
      SML/NJ obs, as defined here, exhibit the form of immutable
      finite trees.  There are no cycles apart from the quasi-
      self-reference cases enshrined in the definitions of 
      ob_a and of ob_b.
      *)
      

      
fun is_ob_singleton x = ob_b(x) = x

fun is_ob_individual x = ob_a(x) = x

fun is_ob_pair x = not (is_ob_singleton x)

fun is_ob_enclosure x 
       = case x of
              ob_e(_) => true
            | _ => false;

   (* Convenience functions that reflect some useful distinctions
      in the intended application of obs. *)
  
   
(* 0.0.3 2017-07-26-09:57 More wordsmithing.
   0.0.2 2017-07-26-09:20 Touch up commentary and show on Golden Geek.
   0.0.1 2017-07-25-16:15 Use wild cards and add is_ob_enclosure
   0.0.0 2017-07-25-07:45 Representation of the single/simple-type that
         is the only data structure available at the oMiser level.
         *)
         
(*                        *** end of ob.sml ***                             *)
