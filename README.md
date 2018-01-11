# orcmid / miser #
The Miser Project for practical demonstration of computation-theoretic aspects of software

## ***WORKING DRAFT*** ##

**TODO**: Synopsis here
**TODO**: Establish leveling somehow

## The Software Project ##

The practical side to the oMiser computational model is accomplished with a stacked layering of computer software.

The production/reference oMiser engine is intended for use by other software.  It will have portable implementations that operate on general-purpose computer platforms as a library to other programs on the platform.  The oMiser engine is purely algorithmic in nature.  It supports expression of a rudimentary data structure and algorithmic procedures on that structure.  The expression of algorithms is via an applicative functional notation.  oMiser lacks input-output and any kind filing system for reusable artifacts, whether data or applicative-expression scripts.  A prominent feature of oMIser is how procedures and data are expressed using the same data structure, demonstrating the essence of the stored-program concept.

![Hosting oFrugal/oMiser](https://github.com/orcmid/miser/blob/master/oMiser/mockups/SML/tutorials/omiser-2017-11-08-0920-1stStack.png).

Accompanying oFrugal software embeds an oMiser engine and delivers access to the engine via host-platform user interface.  oFrugal provides for input-output and carrying out of oMiser computations in accordance with direct input and/or previously-stored scripts.  oFrugal provides means for data and results to be expressed in visible and persistent form, known as *\[o\]Frugalese*.  oFrugal reference implementations are usable interoperably by interchange of programs and data in Frugalese reference formats.

### Current State (2018-01-11) ###

The oMiser/oFrugal level of the conceptualization is being demonstrated and confirmed using proof-of-concept mockups.  The initial mockup work uses Standard ML of New Jersey (SML/NJ) as host platform.  This provides a convenient check between the mathematical representation of the conceptualization and a close computational interpretation.  Other mockups demonstrate interpretation of the theoretical model by alternative means.

As the oMiser conceptualization stabilizes, work on oFrugal pilot mockup versions is started in order to be able to make more ambitious confirmations of oMiser capabilities in representing higher abstractions.  This will allow materials to be filed and reused and used in composition of larger works.

### Intended Progression ###

The refinement of oMiser and oFrugal mockups toward conventional-computer production code is a kind of bootstrapping spiral.  Eventually the development is expanded in two directions.

 * Expanding to additional levels of Miser engines that extend to operation over multiple forms of data, representation of mutable state, and input-output including interaction and distributed operation.
 
 * Expansion to additional levels of Frugal front-ends to provide higher-level programming-language support and compilation of programs into distributable, directly-usable forms on general-purpose computers such as Windows PCs.
 
 One long-range challenge will be to enrich Miser to the point where the engine is capable of having Frugal as a Miser application, rather than as a surrounding host-system application.  The appearance to users can be the same, whether or not the performance is as responsive.  In the other direction, the bonus challenge is having Miser able to compile Miser applications down to direct operations on the host platform.
