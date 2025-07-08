<!-- index.md 0.3.17                UTF-8                         2025-07-04
     ----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
     source <https://github.com/orcmid/miser/blob/master/docs/index.md>
     construction structure, manifest, and job jar at
     <https://orcmid.github.io/miser/docs.txt>
     -->
# The Miser Project on GitHub

<table border="0" width="100%">
  <tr>
    <td width="72%" align="left">
       <img src="images/n170601d2.png">
    </td>
    <td width="27%" height="6" valign="middle" align="right">
          <b><code>
          <a href="../../" target="_top">orcmid.github.io</a>&gt;
          </code></b>
          <br />
          <a href="https://clustrmaps.com/site/1bw9w" title="Visit tracker">
                <img src="//www.clustrmaps.com/map_v2.png?d=3-2eQV4fOuelVHp_YtztZ0hl9Uj4ei9zLKw_nRgCgyM&cl=ffffff" />
          </a>
          <br />
          <b><code>
          <a href="../" target="_top">miser</a>&gt;
          </code></b>
          <br />
          <b><code>
          <a href="index.html" target="_top">index.html</a>&gt;</code></b>
          <br />
          <small><small>
            0.3.17 2025-07-08T17:59Z<!-- MAINTAIN THIS MANUALLY -->
          </small></small>
    </td>
  </tr>
</table>

> [**Computation Theory Made Demonstrable**](https://github.com/orcmid/miser)

The Miser Project computational model has two important qualities:

- simplicity, using a small number of concepts that take the covers off
  the power of digital abstraction in exchange for more effort in operational
  usage, akin to working in machine language to accomplish anything

- novelty and unfamiliarity, interrupting what might be already-known or
  assumed about computers, programming and programming languages

If not already, become comfortable with theoretical approaches.  Embrace a
different kind of math, one based on symbolic logic.  Tolerate the degree of
rigor; it is informally formal and doesn't have to be swallowed whole.

- [The Miser Project on GitHub](#the-miser-project-on-github)
  - [1. Taking a Look](#1-taking-a-look)
    - [1.1 Abstraction](#11-abstraction)
    - [1.2 Theory](#12-theory)
    - [1.3 Computational View](#13-computational-view)
  - [2. The Project](#2-the-project)
  - [3. The Software](#3-the-software)
  - [4. Background](#4-background)
  - [5. Available Materials](#5-available-materials)
  - [6. Development](#6-development)
    - [6.1 Principles](#61-principles)
    - [6.2 Future Prospects](#62-future-prospects)

## 1. Taking a Look

### 1.1 Abstraction

The diagram depicts a fundamental entity of the Miser Project model of
computation: a member of the abstract structure, ‹ob›.

- The entities are called *obs* and they can be visualized as *pairs*, each
  having an *a*-part and a *b*-part. The two parts of of a pair are themselves
  obs. Any ob may be a pairing of obs in this manner.

- An *individual* has both the *a*-part and *b*-part be the ob itself.  The
  lowest component depicted in the figure is an individual.  It is complete
  unto itself.  There are any number of distinct individuals.

- An *enclosure* has only the *b*-part be itself.  The middle component
  depicted in the figure is an enclosure.  As an ob, it consists of itself and
  the *a*-part taken together as a whole.

- Similarly, the top component depicted in the figure is a plain pairing.  As
  an ob, it consists of the pairing and the *a*-part and *b*-part taken
  together.

- There is no limit on such compositions of obs except that
  - no ob is part of its own composition in any other manner, and
  - every composition is finite

- Obs are distinguishable by their composition and the differentiation of
  individuals.

### 1.2 Theory

The Miser Project is very much about computational interpretation of abstract
entities, with mathematical-logic theory as guidance toward
dependable computational interpretations.  The importance of logic to
computer science is demonstrated.

Ob diagrams are props in the same manner as rulers,
compasses and pencils on paper are useful in the understanding of Euclidean
Geometry and numerals and arithmetic are helpful in the understanding of
algebra (or vice versa).  In our time, computer programs can serve similar
purposes, so long as the programs are not confused with the abstractions.

Theoretically, obs are entirely abstract
mathematical entities.  In this sense, obs arise only in language and there
is no direct concrete existence, no existence in nature.
The Miser computational model is established with definition of a universal
computational function -- a mathematical entity still.

The challenge becomes finding a dependable alignment between the computational
model as a theoretical conception and practical operation of a computing
mechanism, demonstrating an empirical bridge that cannot be crossed with
mathematics and logic alone. Observe carefully how that is accomplished in the
Miser Project.

Such dependable achievement of engineered manifestations of theoretical
wonders is a marvel of our time.

### 1.3 Computational View

The diagram is also suggestive of a possible computer representation of the
‹ob› computational model.

- Computer implementations can employ computer data
  structures where the *a*-parts and *b*-parts are addresses of ob
  representations in computer memory.

- The computational forms are immutable and without any cycles via separate
  parts, all in accordance with the mathematical formulation.

- In this perspective, the ob representations are building blocks of
  computational data structures.

For practical computations, a greater variety of data forms is desirable. In
the case of ‹ob› alone, that convenience is deferred.  Focus is on
how the stored-program model and conventional computers afford elevation of
abstraction already.

Management of computer implementations
will become more elaborate than the simple structure suggested in the diagram.
The diagram remains descriptive as a visualization.

## 2. The Project

The Miser Project provides operational demonstration of computation-theoretic
aspects of software.  Emphasis is on the stored-program principle and the
manner in which computational representation of "higher-order" structures
and types of entities emerge from the ‹ob› foundation, similarly with today's
digital computers.

Development of the Miser Project is the career-capstone project of the author.
Miser is the outgrowth of a 60-year inquiry into applicative-programming
languages and their theoretical foundations.  The operational program is
intended for the insights it provides and the fundamentals it demonstrates
rather than practical application.

- Miser is thoroughly defined using mathematical-logic formalisms.  The
  applicability of logic in computer science and software development is
  honored and demonstrated throughout.

- Run-time *oMiser* operation demonstrates computational manifestation of the
  mathematical structure, ‹ob› = 〈Ob,Of,Ot〉and its universal function
  **ap** and companion **eval**.  The *oMiser* form emphasizes the limitation
  to ‹ob› and only obs, reserving the possibility of going beyond.

- The interface language, *oFrugal*, is defined with a formal grammar having
  semantics defined in terms of ‹ob› functions, providing a complete
  specification.  Connection between formal semantics and the syntactical
  structure of programming languages is demonstrated in this direct case.

- Ability of the stored-program concept to elevate levels of
  computational abstraction along with emergence of other types of
  data/operation is demonstrated in a tangible manner with careful reusable
  constructions.

## 3. The Software

The production/reference *oMiser* run-time is intended for use by other
software.  It has portable implementations that operate on
general-purpose computer platforms as a library to other programs.

The interplay of implementation and theoretical foundations is accomplished in
layers.

*oMiser* run-time is purely algorithmic/procedural in
nature.  It supports expression of a rudimentary data structure and
algorithmic procedures on that structure.  The expression of algorithms is via
an applicative-function interpretation of data taken as scripts.  In
software-engineering terms, this is the model side of an interactive computer
application.

The Application Programming Interface (API) serves to ensure a computational
manifestation of ‹ob›, its navigation and universal functions.

![Hosting oFrugal/oMiser](images/ofrugal-2023-08-18-1839-1stStack.png).

The accompanying *oFrugal* software embeds an *oMiser* run-time and delivers
access to *oMiser* via the host-platform user interface.  *oFrugal* provides
for input-output and carrying out of *oMiser* computations in accordance with
direct input and/or previously-stored scripts.  The commanding of *oFrugal*
operation is known as a REPL (read-evaluate-print-loop) arrangement.
It is appropriate to regard *oFrugal* as an ‹ob› calculator.

*oFrugal* provides expression of data and results in a visible and
persistent form, known as **Frugalese**.  *oFrugal* reference formats
are usable in portable interchange of programs and data.

## 4. Background

*oMiser* represents procedures and data in the same data format, demonstrating
the essence and power of the stored-program concept.

The notions of individual, enclosure, singleton, and pair have their
inspiration in the nested-array work of
\[[More1979](https://orcmid.github.io/bib/compsci.htm#More1979)\] and the
foundation structure of LISP
\[[McCarthy1960](https://orcmid.github.io/bib/funprog.htm#McCarthy1960)\].

The importance of enclosure as a structural feature of obs was observed in an
incompleteness regarding nested strings in
\[[Strachey1965](https://orcmid.github.io/bib/softools.htm#Strachey1965)\].
Ob enclosures in obs are akin to representations of strings that can nest
arbitrary strings as individual beads, a limited feature of ALGOL 60
developed further by Doug Ross and colleagues in the AED system
\[[Ross1967](https://orcmid.github.io/bib/softools.htm#Ross1967)\].

Enclosures are important in the treatment of obs as scripts and in shifting
between obs as data to scripts and obs as scripts themselves in the
computational model.

The computational model founded on ‹ob› for oMiser is a fully-applicative
scheme inspired through my association with Peter Landin and William H. Burge
in the mid-1960s, with operation now via a list-processing abstraction.  The
mechanism of evaluation is based on that for LISP, although Miser is not
LISP.  oFrugal and Frugalese have inspiration in
\[[Landin1966](https://orcmid.github.io/bib/funprog.htm#Landin1966)\],
\[[Burge1975](https://orcmid.github.io/bib/funprog.htm#Burge1975)\], and some
of SML
\[[Paulson1996](https://orcmid.github.io/bib/funprog.htm#Paulson1996)\].

*oMiser* lacks input-output and any kind of filing system for reusable
artifacts, whether data or applicative-expression scripts.  In this respect,
there are similarities to the formulation of Functional Programming by John
Backus \[[Backus1978](https://orcmid.github.io/bib/compsci.htm#Backus1978)\]:
The operational "system" layer, *oFrugal*, provides storage and utility
operations.  The *oMiser* layer provides a computational *manifestation* of
the ‹ob› mathematical structure, including its universal-computation function,
via computational procedure.

## 5. Available Materials

The project is narrated with the software-development managed on GitHub
repository [orcmid/miser](https://github.com/orcmid/miser).
[Miser Project on GitHub](https://orcmid.github.io/miser/) content is
authored at the [docs](https://github.com/orcmid/miser/tree/master/docs)
folder of that repository.

Important authoritative materials are in text files that can be preserved and
employed without requiring a browser or access to the GitHub repository. These
materials are often created first; they are always available for preview from
these web pages.  Early review and discussion of preview topics is
invited.

The web material is organized in topical sections:

| **Section**       |  **General Topic** |
|   --:             |  ---               |
| [ob](ob/)         | ‹ob› Mathematical Structure (preview) |
| [obap](obap/)     | ‹ob› Universal Computation Function (preview) |
| [obreps](obreps/) | Interpretations and Representations in ‹ob› (preview) |
| | |
| [oFrugal](oFrugal/) | oFrugal REPL Principles of Operation (preview) |
| [oMiser](oMiser/)   | oMiser Conception, Principles, and Engineering (preview) |
| | |
| [lambda](lambda/) | λ Applicative-Procedure Abstraction (sketch) |
| [obapx](obapx/)   | Extensions to the ‹ob› Universal Computation Function (preview) |
| | |
| [docs.txt](docs.txt) | Text Synopsis and Job Jar for orcmid.github.io/miser
| [miser.txt](miser.txt) | Miser Project on GitHub (shadow) |
| [construction](construction/) | Miser Project Web Construction Materials |
| | |
| [Security](https://github.com/orcmid/miser/security) | Security Policy |

## 6. Development

- Important milestones include

  - establishment that Miser provides an effective representation of the
    computable functions under the Church-Turing thesis

  - demonstration of how such a mechanism is itself amenable to mechanizing
    logical deductions and theorem proving

  - introduction of accelerators that improve operation entirely within the
    inherent computational complexity of the approach.

### 6.1 Principles

- Development is supported by narrative and reference materials, with
  important attributions to sources, at all times.

- Proof-of-concept demonstrations and releasable software are developed
  with freely-available and free-to-use development tools.  The project
  is conducted entirely with code in the open and the work is free to use and
  to adapt with appropriate attribution.

- The *oFrugal* REPL shall be provided as a simple standalone command-line
  program fully usable in conjunction with a text editor for creating scripts.

### 6.2 Future Prospects

The refinement of oMiser and oFrugal mockups toward conventional-computer
production code is a kind of bootstrapping spiral. Once there is a stable
*oFrugal* REPL, more-ambitious extensions are aspired to.  There are no
concrete provisions at this time.

- Expanding to additional levels of Miser engines that extend to operation
  over multiple forms of data, representation of mutable state, and
  input-output including interaction and distributed operation.

- Expansion to additional levels of Frugal front-ends to provide higher-level
  programming-language support and compilation of programs into distributable,
  directly-usable forms on general-purpose computers such as Windows PCs.

- Enrichment of Miser to the point where the  engine is capable of having
  Frugal as a Miser application, rather than as a
  surrounding host-system application.  The appearance to users can be the
  same, whether or not the performance is as responsive.

- In the other
  direction, the bonus challenge is having Miser able to compile Miser
  applications down to direct operations on the host platform in a dependable
  and disciplined manner.

It may become necessary to take one more run at
[computational monads](https://en.wikipedia.org/wiki/Monad_(functional_programming))
and embrace some
[Category Theory](https://en.wikipedia.org/wiki/Category_theory)
although some
[Computational Logic](https://www.cs.utexas.edu/users/moore/acl2/) equivalent
may need to tag along with that.

----

Using a GitHub account, discuss Miser Project topics in the
[Discussion section](https://github.com/orcmid/miser/discussions).  Propose
improvements and removal of defects in Miser Project documentation and
software in the [Issues section](https://github.com/orcmid/miser/issues).
There are also relevant
[projects](https://github.com/orcmid/miser/projects?query=is%3Aopen)
from time to time.  For any security concerns, please consult the
[project security policy](https://github.com/orcmid/miser/security).

<table border="0" cellspacing="3" width="100%">
  <tr>
    <td width="14%">
	<a href="index.htm" target="_top">
       <img border="0" src="images/hardhat-thumb.gif" alt="Hard Hat Area"
            align="left" width="80" height="57">
       </a>
    </td>
    <td width="54%" valign="middle" align="center">
      You are navigating the <a href="./">Miser Project on Github</a></td>
    <td width="30%">
      <p align="right"><font size="-2">created 2019-11-20 by
         <a target="_top" href="../orcmid">orcmid</a> </font></p>
    </td>
  </tr>
</table>
<!--
  0.3.17 2025-07-04T19:59Z conform to latest hybridForm
  0.3.16 2025-07-04T16:54Z solidify the common footer text
  0.3.15 2025-07-04T16:26Z touch-ups, current availabilities
  0.3.14 2025-06-12T21:46Z touch-up footer information
  0.3.13 2024-12-30T19:00Z Touch up and fix PageView map placement
  0.3.12 2024-12-16T22:03Z Small typo and text fixes
  0.3.11 2024-11-28T17:06Z Fix typo, smooth nature of universal function
  0.3.10 2024-11-28T04:56Z Remove extraneous observation
  0.3.9  2024-11-26T23:41Z Polish the text for clarity
  0.3.8  2024-11-12T18:03Z Add Security Policy link
  0.3.7  2024-10-28T19:33Z Small touch-up, wordsmithing
  0.3.6  2024-10-10T17:08Z Correct projects link
  0.3.5  2024-08-22T18:37Z Important change from "reality" to "nature."
  0.3.4  2024-07-12T16:51Z Correct the title for lambda
  0.3.3  2024-06-28T16:31Z Review and fix a typo
  0.3.2  2024-06-09T21:58Z Fix citation formats, touch-up lightly
  0.3.1  2024-06-09T18:59Z More smoothing
  0.3.0  2024-05-20T17:34Z Tighten and add important background citations
  0.2.8  2024-02-02T13:45Z Add obapx
  0.2.7  2024-01-30T17:09Z Add docs.txt
  0.2.6  2024-01-25T17:40Z Add lambda
  0.2.5  2024-01-24T00:27Z Touch-ups, add oMiser
  0.2.4  2024-01-18T21:33Z Touch-ups, add oFrugal
  0.2.3  2024-01-16T00:59Z Link to topic previews
  0.2.2  2023-11-25T19:21Z Make visible brackets on citations
  0.2.1  2023-11-24T20:13Z Expanding the background
  0.2.0  2023-11-06T00:28Z Eliminate duplicate image, declare success
  0.1.29 2023-11-05T23:27Z Simplifying the top banner table
  0.1.28 2023-11-05T22:44Z Umm, still working at it
  0.1.27 2023-11-05T22:06Z Let's try something different
  0.1.26 2023-11-05T02:11Z Never mind, back to what works
  0.1.25 2023-11-05T02:00Z Just one more thing to try
  0.1.24 2023-11-04T23:43Z tidying up
  0.1.23 2023-11-04T22:54Z by Jove, I think I got it
  0.1.22 2023-11-04T21:57Z ... and still
  0.1.21 2023-11-04T19:59Z And experimenting still
  0.1.20 2023-11-04T19:35Z Still experimenting
  0.1.19 2023-11-04T17:54Z Experiment with top strip formatting
  0.1.18 2023-11-03T20:00Z Experiment with in-line HTML folio blocks
  0.1.17 2023-10-31T20:27Z more manifestation/representation smoothing
  0.1.16 2023-10-27T17:37Z computational *manifestation*
  0.1.15 2023-09-12T17:13Z Tie in challenge of theory vs. practice
  0.1.14 2023-09-08T16:23Z More smoothing of the front parts
  0.1.13 2023-09-07T19:11Z Still more wordsmithing
  0.1.12 2023-09-05T21:07Z More smoothing of the early parts
  0.1.11 2023-09-04T22:15Z Smooth the narrative, topped by brief synopsis
  0.1.10 2023-09-01T19:41Z Fix pesky indentation/title-level problem
  0.1.9 2023-09-01T18:54Z Corrections touch-ups
  0.1.8 2023-09-01T17:39Z Added TOC, more narrative for stage-setting
  0.1.7 2023-08-30T00:09Z Smoothing, opening the layout with lists
  0.1.6 2023-08-25T15:04Z Smoothing and aligning the version number
  0.1.5 2023-08-24T03:35Z Expand the first topic and update section numbers
  0.1.4 2023-08-22T21:18Z Tidy up the initial paragraphs
  0.1.3 2023-08-19T20:28Z Top-up with explanation of the diagram
  0.1.2 2023-08-19T03:03Z Correct image location once more
  0.1.1 2023-08-19T01:45Z Correct (larger) image location
  0.1.0 2023-08-19T00:43Z Transpose the README here as a better exposition
  0.0.8 2023-08-18T19:13Z Expand, focusing on status and forthcoming refactor.
  0.0.7 2023-08-15T20:27Z Simplification, linking to README and .txt files.
  0.0.6 2023-08-14T22:56Z twiddling
  0.0.5 2023-08-14T22:03Z change location of the image, simplify a bit
  0.0.4 2019-11-20 placeholder remarks

               *** end of docs/index.md ***                           -->
