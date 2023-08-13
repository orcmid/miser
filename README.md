<!-- README.md 1.2.2               UTF-8                           2023-08-13
     ---1----|----2----|----3----|----4----|----5----|----6----|----7----|---*

                      orcmid/miser Introduction
     -->

# The Miser Project (1.2.2 Rough Draft)

## 1. Synopsis

The Miser Project provides operational demonstration of computation-theoretic
aspects of software.  Emphasis is on the stored-program principle and the
manner in which computational representation of "higher-order" types emerges.

Achievement of the Miser Project is the career capstone project of the author.
Miser is the outgrowth of a 60-year inquiry into applicative-programming
languages and their theoretical foundations.  The operational program is
intended for the insights it provides and the fundamentals it demonstrates
rather than practical application.

* Miser is thoroughly defined using mathematical-logic formalisms.  The
  applicability of logic in computer science and software development is
  honored and demonstrated throughout.

* Run-time *oMiser* operation demonstrates computational interpretation of the
  mathematical structure, ‹ob› = 〈Ob,Of,Ot〉and its universal function
  **ap** and companion **eval**.

* The interface language, *oFrugal*, is defined with a formal grammar having
  semantics defined in terms of ‹ob› formulations, providing a complete
  specification.  Connection between formal semantics and the syntactical
  structure of programming languages is demonstrated.

* The fundamental ability of the stored-program concept to elevate levels of
  computational abstraction along with emergence of types of data/operation is
  demonstrated in a tangible manner with careful constructions.

### 2. The Software

The practical side to the *oMiser* computational model is demonstrated with a
stacked layering of computer software.

The production/reference *oMiser* run-time is intended for use by other
software.  It will have portable implementations that operate on
general-purpose computer platforms as a library to other programs on the
platform.

The interplay of implementation and theoretical foundations is accomplished in
layers.

*oMiser* run-time is purely algorithmic/procedural in
nature.  It supports expression of a rudimentary data structure and
algorithmic procedures on that structure.  The expression of algorithms is via
an applicative-function interpretation of data taken as scripts.  In
software-engineering terms, this is the model side of an interactive computer
application.

![Hosting oFrugal/oMiser](https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/tutorials/omiser-2017-11-08-0920-1stStack.png).

The accompanying *oFrugal* software embeds an *oMiser* run-time and delivers
access to *oMiser* via the host-platform user interface.  *oFrugal* provides
for input-output and carrying out of *oMiser* computations in accordance with
direct input and/or previously-stored scripts.  The commanding of *oFrugal*
operation is known as a REPL (read-evaluate-print-loop) arrangement.
It is appropriate to regard *oFrugal* as an ‹ob› calculator.

*oFrugal* provides expression of data and results in a visible and
persistent form, known as **Frugalese**.  *oFrugal* reference formats
are usable in portable interchange of programs and data.

## 3. Background

(some ideas, including Rosenbloom)

*oMiser* represents procedures and data in the same data format, demonstrating
the essence of the stored-program concept.  Inspiration is from formulation of
LISP, although Miser is not LISP.

Applicative operation is inspired by work of Peter Landin,
Christopher Strachey, and other ideas about functional programming connected
to combinatory logic and the λ-calculus.

*oMiser* lacks input-output and any kind of filing system for reusable
artifacts, whether data or applicative-expression scripts.  In this respect,
there are similarities to the formulation of Functional Programming by John
Backus.  The operational "system" layer, *oFrugal*, provides storage and
utility functions.  The *oMiser* layer provides a computational model
of the ‹ob› mathematical structure.

## 4. Available Materials

(various resources and links to them - probably a bibliography here)

## 5. Development

* Important milestones include

  * establishment that Miser provides an effective representation of the
    computable functions under the Church-Turing thesis

  * demonstration of how such a mechanism is itself amenable to mechanizing
    logical deductions and theorem proving

  * introduction of accelerators that improve operation entirely within the
    inherent computational complexity of the approach.

### 5.1 Principles

* Development is supported by narrative and reference materials, with
  important attributions to sources, at all times.

* Proof-of-concept demonstrations and releasable software are developed
  with freely-available and free-to-use development tools.  The project
  is conducted entirely with code in the open and the work is free to use and
  to adapt with appropriate attribution.

* The *oFrugal* REPL shall be provided as a simple standalone command-line
  program fully usable in conjunction with a text editor for creating scripts.

### 5.2 Future Prospects

The refinement of oMiser and oFrugal mockups toward conventional-computer
production code is a kind of bootstrapping spiral. Once there is a stable
*oFrugal* REPL, more-ambitious extensions are aspired to.  There are no
concrete provisions at this time.

* Expanding to additional levels of Miser engines that extend to operation
  over multiple forms of data, representation of mutable state, and
  input-output including interaction and distributed operation.

* Expansion to additional levels of Frugal front-ends to provide higher-level
  programming-language support and compilation of programs into distributable,
  directly-usable forms on general-purpose computers such as Windows PCs.

* Enrichment of Miser to the point where the  engine is capable of having
  Frugal as a Miser application, rather than as a
  surrounding host-system application.  The appearance to users can be the
  same, whether or not the performance is as responsive.

* In the other
  direction, the bonus challenge is having Miser able to compile Miser
  applications down to direct operations on the host platform in a dependable
  and disciplined manner.

### 5.3 Current State (2022-01-05)

Details of the conceptualization and its progression are reflected in project
text files (e.g. [miser.txt](miser.txt), [oMiser.txt](oMiser/oMiser.txt),
[obtheory.txt](oMiser/obtheory.txt)) and in dialogue captured in
[Issue pages](https://github.com/orcmid/miser/issues) and
[Discussion pages](https://github.com/orcmid/miser/discussions).  The
[documentation](https://orcmid.github.io/miser/) will accumulate as spiral
development cycles progress. A [wiki](https://github.com/orcmid/miser/wiki)
may become useful, and a Discord server may also provide a forum structure.

The oMiser/oFrugal level of the conceptualization is being demonstrated
and confirmed using proof-of-concept mockups.
[Initial mockup work](oMiser/mockups/mockups.txt) uses
[Standard ML of New Jersey (SML/NJ)](https://www.smlnj.org/) as host platform.
This provides a convenient check between the mathematical representation of
the conceptualization and a close computational interpretations.  Other
mockups will demonstrate interpretation of the theoretical model by
alternative means.

As the oMiser conceptualization stabilizes, work on oFrugal pilot mockup
versions is undertaken to support more-ambitious confirmations of oMiser
capabilities, including representation of higher-level abstractions above the
rudimentary level of oMiser.  It may become necessary to take one more run at
[computational monads](https://en.wikipedia.org/wiki/Monad_(functional_programming))
and embrace some
[Category Theory](https://en.wikipedia.org/wiki/Category_theory)
although some
[Computational Logic](https://www.cs.utexas.edu/users/moore/acl2/) equivalent
may need to tag along with that.

----

Discussion about the Miser Project is welcome at the
[Discussion section](https://github.com/orcmid/miser/discussions).
Improvements and removal of defects in the code and documentation can be
reported and addressed in the
[Issues section](https://github.com/orcmid/miser/issues).  There are also
relevant [projects](https://github.com/orcmid/miser/projects?type=classic)
from time to time.

<!-- ---1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

     1.2.2 2023-08-13T21:28Z Mostly-stable draft
     1.2.1 2023-08-13T17:30Z Continued re-arrangement and proofing
     1.2.0 2023-08-13T15:34Z Rough Draft re-arrangement for proofing
     1.1.0 2022-01-05T21:49Z Smoothing and Revision of Text, Progression,
           Current State
     1.0.1 2018-08-26 Added TODOs and 5Ps placeholer
     1.0.0 2018-01-11 Initial Stable README

                           end of miser/README.md
     -->
