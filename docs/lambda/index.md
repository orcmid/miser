<!-- index.md 0.6.4                 UTF-8                         2026-03-24
     ----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
     source <https://github.com/orcmid/miser/blob/master/docs/lambda/index.md>
     publication <https://orcmid.github.io/miser/lambda/>
     -->
<table border="0" width="100%">
  <tr>
    <td width="25%" align="left" height="6">
       <a href="../" title="The Miser Project on GitHub">
       <img src="../images/misertheory-logo.png" /></a>
    </td>
    <td width="48%" height="6" valign="middle" align="center">
       <font color="#990033">
       <strong><i>The Miser Project</i><br />
       <i><big><big>Applicative-Procedure λ-Abstraction</big></big></i>
       </strong></font>
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
       <a href="./" target="_top">lambda</a>&gt;
       </code></b>
       <br /><br />
       <b><code>
       <a href="index.html" target="_top">index.html</a>&gt;</code></b>
       <br />
       <small><small>
        0.6.4 2026-03-24T16:02Z<!-- MAINTAIN THIS MANUALLY -->
       </small></small>
    </td>
  </tr>
</table>

In the oMiser computational-model, every ob has an applicative interpretation
as a script.  Whether viewed as "just an ob" or as a purposive script depends
on how one squints at an ob.

In some cases, the intension as a script is
likely, since scripts have features that are unexpected in "just" obs.  In
essence, however, the plain/script intention is revealed only in how an ob is
employed in a computation, and every ob can occur as either or both at
various points in a script-driven computation.

λ-Abstraction is a systematic approach to transforming script forms into
other scripts that can be applied to operands that are then used as
scripts, as data, or as both.  This is an important and powerful mechanism.
- [1. The Abstraction Idea](#1-the-abstraction-idea)
- [2. The Abstraction Challenge](#2-the-abstraction-challenge)
  - [2.1 Pure abstraction](#21-pure-abstraction)
  - [2.2 Variations on that theme](#22-variations-on-that-theme)
- [3. Symbolic Forms](#3-symbolic-forms)
  - [3.1 Symbolic form principles](#31-symbolic-form-principles)
  - [3.2 Utility of symbolic forms](#32-utility-of-symbolic-forms)
- [4. Applicative-Procedure Abstraction Techniques](#4-applicative-procedure-abstraction-techniques)
- [Related Material](#related-material)

## 1. The Abstraction Idea

| Views on Abstraction |
| --- |
| "We call the symbol λx an _abstraction operator_, and speak of the function which is denoted by (λx _M_) as obtained from the expression _M_ by _abstraction_." |
| -- [Alonzo Church](https://en.wikipedia.org/wiki/Alonzo_Church) \[[Church1941](https://orcmid.github.io/bib/logic.htm#Church1941): p.7\] |
|  |
| "This process \[of extracting common features\] can be regarded as a repeated abstraction ... and under certain circumstances such abstracting processes can be repeatedly piled on top of one another.  Here '_abstract_' has to be understood in the literal meaning of the word as 'removing', as leaving aside everything inessential for the context in question or for a particular purpose ... ." |
| -- [Hans Reichardt](https://mathshistory.st-andrews.ac.uk/Biographies/Reichardt/) \[[VNR1977](https://orcmid.github.io/bib/authors.htm#VNR1977): Introduction,p.11\] |
|  |
| "A high-level computer language _abstracts away the machine_ \[so that\] the programmer need not be an expert in the machinations of computer hardware ... in order to successfully program a computer.  High-level languages (HLLs) automate, hide, or otherwise abstract away the underlying operations of the machine ... ." |
| -- Mark Jones Lorenzo \[[Lorenzo2019](https://orcmid.github.io/bib/progsys.htm#Lorenzo2019): Introduction, p.13\] |
|  |
| "Abstraction is about digging deep into a situation to find out what is at its core making it tick.  Another way to think of it is about stripping away irrelevant details, or rather, stripping away details that are irrelevant to what we're thinking about." |
| -- [Eugenia Cheng](https://en.wikipedia.org/wiki/Eugenia_Cheng), _The Joy of Abstraction_ \[[Cheng2023](https://orcmid.github.io/bib/math.htm#Cheng2023): 2.3 Forgetting Details\] |
|  |
| "Abstraction is a verb: to abstract is to identify the basic principles and laws of a process so that it can be studied without regard to physical implementation; the abstraction can then guide many implementations.  Abstraction is also a noun: An abstraction is a mental construct that unifies a set of objects.  Objects of an abstraction have their own logic of relations with each other that does not require knowledge of lower-level details." |
| -- Peter J. Denning. Abstractions \[[Denning2025](https://orcmid.github.io/bib/compsci.htm#Denning2025): What is Abstraction?\] |

Here, the views of Alonzo Church and Peter Denning will be favored.  A view of
Aristotle will also be adapted:  In portrayal of abstractions there are
also incidentals (sometimes called accidentals) that accompany expression and
manifestation of abstractions.  Incidentals are unavoidable, especially in
treatment of computation, although it is unfortunate whenever they intrude on
grasping what might be considered as pure abstraction.  Keep that in mind.

## 2. The Abstraction Challenge

The challenge at the oMiser/oFrugal level is the fact that there are _only_
obs and _every_ ob has an applicative interpretation; _any_ ob can have an
intended operational use as both data and script.  The computational
accomplishment of abstraction for oMiser straddles that ambiguity/flexibility
of interpretation.

### 2.1 Pure abstraction

Pure abstraction operations on obs depend on an ob and its structure without
consideration of anything other than the ob "as-is."  The result from
Frugalese

> σ.*s* *M*

is an ob such that, taken as a script applied to operand *N*,

> (σ.*s* *M*) *N*

determines a form of ob *M* with *N* substituted everywhere *s* occurs in *M*.
This is based strictly on ob structure and not on any interpretation of *M*
as anything but just an ob.

Evaluation of (σ.*s* *M*) determines an ob different than *M* having no
occurrences of *s*.  (σ.*s* *M*) has *s* ***abstracted away*** (from *M*)
in the sense expressed by Alonzo Church, quoted
[above](#1-the-abstraction-idea).


((σ.*s* *M*) *s*) = *M* as-is.

Also, if *s* does not occur in *M*, ((σ.*s* *M*) *N*) = *M* for any definite
ob, *N*.

In some situations, the *s* in *M* can be though of as a variable, although
*there are no variables*, as such, in oMiser applicative scripts.  What
(σ.*s* *M*) accmplishes is to effectively make *s* "variable" in *M* by
abstracting it away, establishing a script that will substitute any ob for the
occurrences of

*s* in *M*.

This is distinct from how variables are considered in conventional
programming languages and especially in mathematics.

### 2.2 Variations on that theme

The script for *σ*, applied to an operand ob, *x*, derives a new script that
will abstract *x* from any given next operand.  In the oMiser implementation
of *σ*, operand *x* can be any ob, although usual practice is to use
lindies (literal symbols) in the handy form *σ.x*.  The operation comes down
to matching patterns and rewriting obs to a new form that satisfies the
definition of (σ.*s* *M*).

The rewriting aspect is more evident with the handy companion functions,
δ(*s*, *N*) and subst(*N*, *s*):

> δ(*s*, *N*) *M* = subst(*N*, *s*) *M* = (σ.*s* *M*) *N* = σ(*s*, *M*, *N*)

illustrating various Frugalese forms for achieving the same result, given
definite *s*, *N*, and *M*.

These and their intermediate variations, such as `subst(.ARG)`, known as
Curried forms, will be employed in the development of oFrugal utility scripts,
including those for
[applicative-procedure abstraction](#4-applicative-procedure-abstraction-techniques).

## 3. Symbolic Forms

Symbolic forms are obs comprised of lindies that have the form of applicative
expressions, but are just that, having the form but not having any other
intrinsic significance in oMiser.  Symbolic forms are just themselves.  The
benefit, beside as a form of data, is that the form can be transformed into
meanigful scripts by abstraction procedures.

Symbolic forms can be read as pseudo-code for applicative expressions.  The
actual transformation into a script is by abstraction of the symbolic form
away.

### 3.1 Symbolic form principles

It is a design principle of the oMiser universal functions **ap** and
**eval** that *when there is no specific interpretation of an **ap** operator
ob, "no change" occurs*.

In oMiser, lindies denote distinct individual obs that are invariant under the
universal functions.  In this case "no change" is accomplished by the
mathematical engineering of obaptheory such that when a lindy ob is applied to
an operand, the lindy *and the operand* are preserved: the result is pairing
of the lindy and the operand.  In this way,

> **ap**(*lindy*, *x*) yields (*lindy* :: *x*)

using (\` *x*) when *x* is not also invariant. The result is invariant in this
same sense.

The lindy-involved invariant obs are classified as **symbolic forms** and
distinguished by the obaptheory predicate is-symbolic-form(*x*); symbolic
forms are all preserved without change in this manner.  The general rules is

> **ap**(*symbolic-form*, *x*) = (*symbolic-form* :: *x*)

> using (\` *x*) when *x* is neither `ob.NIL` nor a symbolic form.  The
  result is a symbolic form.

### 3.2 Utility of symbolic forms

Symbolic forms have the appearance of applicative-procedure scripts and/or
constant list structures, perhaps in mixtures.

Harmony of symbolic forms with applicative-operation expressions is supported
by the computational interpretation of `f :: g :: x` being tantamount to the
Frugalese applicative expression `f g x`, both being right-associative and
equivalent to `f(g x)` with lindies `f`, `g`, and `x` taken as terms in an
applicative-operation formula.

For example, the oFrugal expression with lindies `a`, `b`, and `x`

```ML
(a x) b x ;
```

evaluates to

```ML
(a :: x) :: b :: x ;
```

and

```ML
!eval (a :: x) :: b :: x ;
```

the same.

## 4. Applicative-Procedure Abstraction Techniques

\[Author's Note\]: Brief introduction to the two forms.

## Related Material

This placeholder links to raw materials and notes, including text files.
There will be organized folios of content as consolidation of documentation
on the web progresses.

| **ID**                  | **Status** | **Started** | **Topic** |
|   :-:                   |   :-:      |  :-:        |  ---      |
| [sigma](oSigma.txt)    | 0.4.0 2024-06-24 | 2024-05-05 | `σ.s M`, `subst(L, s)`, `δ(s, L)` definitions (authoritative)|
| [lambda](oLambda.txt)   | 0.5.0 2025-06-12 | 2024-06-20 | `λ.x` & `ρ.p` Abstraction Operations (authoritative)|

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
       <img border="0" src="../images/hardhat-thumb.gif" alt="Hard Hat Area"
            align="left" width="80" height="57">
       </a>
    </td>
    <td width="54%" valign="middle" align="center">
      You are navigating the <a href="../">Miser Project on Github</a></td>
    <td width="30%">
      <p align="right"><font size="-2">created 2024-01-25 by
         <a target="_top" href="../../orcmid">orcmid</a> </font></p>
    </td>
  </tr>
</table>
<!--

  0.6.4  2026-03-24T16:02Z Working Over Symbolic Forms
  0.6.3  2026-03-21T16:29Z Gotcha!
  0.6.2  2026-03-21T15:46Z Try again
  0.6.1  2026-03-20T01:14Z Fix Howler in Title Block
  0.6.0  2026-03-20T21:50Z Wrestling abstraction with respect to oMiser
  0.5.3  2026-03-19T20:19Z Touch-ups on notions of abstraction
  0.5.2  2025-07-09T21:47Z adjust top/bottom matter to 0.1.2 hybridForm
  0.5.1  2025-06-12T23:22Z reflect 0.5.0 oLambda.txt
  0.5.0  2025-03-08T01:47Z Rework The Abstraction Idea, adding [Denning2025]
  0.4.1  2025-01-19T17:48Z Checking changes with small touch-ups
  0.4.0  2025-01-18T22:42Z 2 Refactoring of symbolic form introduction
  0.3.12 2025-01-15T17:23Z 2.1 touch-up with reference to section 3
  0.3.11 2025-01-14T23:12Z 2.2.1 mathematical tyhpography refined
  0.3.10 2025-01-13T19:47Z Complete mathematical forms in 2.2.1
  0.3.9  2025-01-13T18:10Z Change 2.2.1 to mathematical form for variables
  0.3.8  2024-12-23T18:09Z Develop Table of Content
  0.3.7  2024-12-22T17:41Z Tie in obaptheory.txt symbolic form treatment
  0.3.6  2024-12-21T22:25Z You are trapped in a twisty symbolic form with
                           intrpretations all the same
  0.3.5  2024-12-21T17:51Z Enough fussing with Symbolic Form for now
  0.3.4  2024-12-18T22:53Z Still struggling with Symbolic Form motivation
  0.3.3  2024-12-15T23:29Z Smooth 2.2 more
  0.3.2  2024-11-28T17:39Z Touch up 2.1 a bit more
  0.3.1  2024-10-28T19:47Z Touch up 2.2
  0.3.0  2024-10-28T18:04Z Complete 2.2 on Symbolic Forms
  0.2.13 2024-09-03T15:42Z Cleanup 2.1
  0.2.12 2024-08-31T23:13Z Continue on 2.2 Symbolic Expressions
  0.2.11 2024-08-29T18:33Z Expand 2.1 on Pure Abstractions
  0.2.10 2024-08-19T19:46Z Backup of intermediate draft on abstraction
  0.2.9  2024-08-08T18:05Z Introduce maebe and start normalizing abstraction
         notation
  0.2.8  2024-07-17T16:11Z Link to Eugenia Cheng Wikipedia
  0.2.7  2024-07-16T17:07Z Add quote from Eugenia Cheng, Joy of Abstracktion
  0.2.6  2024-07-16T16:09Z Add link to Church Wikipedia article
  0.2.5  2024-07-15T00:53Z Fix italic M in Church quotation
  0.2.4  2024-07-14T19:49Z Add Church1941 quotation
  0.2.3  2024-07-13T17:14Z Add Lorenzo2019 quotation
  0.2.2  2024-07-13T15:39Z Repair tabulation for quotations
  0.2.1  2024-07-12T21:11Z Try using a table for quotations layout
  0.2.0  2024-07-12T16:54Z Begin draft text
  0.1.0  2024-07-01T20:08Z oSigma and oLambda introduction
  0.0.0  2024-01-25T17:26Z Placeholder from 0.0.2 obap/index.md boilerplate

               *** end of miser/docs/lambda/index.md ***                  -->
