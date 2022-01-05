<!-- README.md 1.1.0               UTF-8                           2022-01-05
     ---1----|----2----|----3----|----4----|----5----|----6----|----7----|--*>
                      orcmid/miser Introduction
     -->

# orcmid / miser #

The Miser Project for practical demonstration of computation-theoretic aspects of software

## ***WORKING DRAFT*** ##

***PURPOSE:***

***PRINCIPLES:***

***PRIORITIES:***

***PLAN:***

***PEOPLE:***

**TODO**:

* Establish leveling somehow.

* Complete the
[5P's](https://ceklog.kindel.com/2011/06/14/the-5-ps-achieving-focus-in-any-endeavor/),
keeping them crisp.

## The Software Project ##

The practical side to the oMiser computational model is demonstrated with a
stacked layering of computer software.

The production/reference oMiser engine is intended for use by other software.
It will have portable implementations that operate on general-purpose computer
platforms as a library to other programs on the platform.

The interplay of implementation and theoretical foundations is accomplished in
layers.

A prominent feature of oMiser is how procedures and data are represented using
the same data structure interchangeably, demonstrating the essence of the
stored-program concept.  This takes inspiration from the formulation of LISP,
although Miser is not LISP.

The oMiser engine, a software library, is purely algorithmic/procedural in
nature.  It supports expression of a rudimentary data structure and
algorithmic procedures on that structure.  The expression of algorithms is via
an applicative-function interpretation of data taken as scripts. The
applicative operation takes inspiration from the work of Peter Landin and
ideas about functional programming connection to combinatory logic and the
λ-calculus.

oMiser lacks input-output and any kind of filing system for reusable
artifacts, whether data or applicative-expression scripts.  In this respect,
there are similarities to the formulation of Functional Programming by John
Backus.  That is, there is an operational "system" layer that takes care of
persistent storage and other utility functions in having oMiser be useful for
demonstrative use.  The inner, oMiser layer represents the ‹ob› mathematical
structure.

![Hosting oFrugal/oMiser](https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/tutorials/omiser-2017-11-08-0920-1stStack.png).

The accompanying oFrugal software embeds an oMiser engine and delivers access
to the engine via host-platform user interface.  oFrugal provides for
input-output and carrying out of oMiser computations in accordance with direct
input and/or previously-stored scripts.  The commanding of oFrugal operation
is known as a REPL (read-evaluate-print-loop) arrangement.  It is appropriate
to regard oFrugal as an ‹ob› calculator.

oFrugal provides means for data and results to be expressed in visible and
persistent form, known as **Frugalese***.  oFrugal reference implementations
are usable interoperably by interchange of programs and data in Frugalese
reference formats.


### Intended Progression ###

The refinement of oMiser and oFrugal mockups toward conventional-computer
production code is a kind of bootstrapping spiral.  Eventually the development
is expanded in two directions.

* Expanding to additional levels of Miser engines that extend to operation
  over multiple forms of data, representation of mutable state, and
  input-output including interaction and distributed operation.

* Expansion to additional levels of Frugal front-ends to provide higher-level
  programming-language support and compilation of programs into distributable,
  directly-usable forms on general-purpose computers such as Windows PCs.

 One long-range challenge will be to enrich Miser to the point where the
 engine is capable of having Frugal as a Miser application, rather than as a
 surrounding host-system application.  The appearance to users can be the
 same, whether or not the performance is as responsive.  In the other
 irection, the bonus challenge is having Miser able to compile Miser
 applications down to direct operations on the host platform in a dependable
 and disciplined manner.

### Current State (2022-01-05) ###

Details of the conceptualization and its progression are reflected in project
text files (e.g. [miser.txt](miser.txt)and obtheory.txt](oMiser/obtheory.txt))
and in dialogue captured in
[Issue pages](https://github.com/orcmid/miser/issues) and
[Discussion pages](https://github.com/orcmid/miser/discussions).  The
[documentation](https://orcmid.github.io/miser/) will accumulate as spiral
development cycles progress. A [wiki](https://github.com/orcmid/miser/wiki)
may become useful, and a Discord server may also provide a forum structure.

The oMiser/oFrugal level of the conceptualization is being demonstrated and confirmed using proof-of-concept mockups.
[Initial mockup work](oMiser/mockups/mockups.txt) uses
[Standard ML of New Jersey (SML/NJ)](https://www.smlnj.org/) as host platform.
This provides a convenient check between the mathematical representation of
the conceptualization and a close computational interpretations.  Other
mockups will demonstrate interpretation of the theoretical model by
alternative means.

As the oMiser conceptualization stabilizes, work on oFrugal pilot mockup
versions is undertaken to support more-ambitious confirmations of oMiser capabilities, including representation of higher-level abstractions above the
rudimentary level of oMiser.  It may become necessary to take one more run at
[computational monads](https://en.wikipedia.org/wiki/Monad_(functional_programming))
and embrace some
[Category Theory](https://en.wikipedia.org/wiki/Category_theory)
although some
[Computational Logic](https://www.cs.utexas.edu/users/moore/acl2/) equivalent
may need to tag along with that.

<!-- ---1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

1.1.0 2022-01-05T21:49Z Smoothing and Revision of Text, Progression, Current
      State
1.0.1 2018-08-26 Added TODOs and 5Ps placeholer
1.0.0 2018-01-11 Initial Stable README

                           end of miser/README.md
     -->
