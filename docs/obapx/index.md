<!-- index.md 0.1.1                 UTF-8                         2024-02-03
     ----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
     source <https://github.com/orcmid/miser/blob/master/docs/obapx/index.md>
     publication <https://orcmid.github.io/miser/obapx/>
     -->
<table border="0" width="100%">
  <tr>
    <td width="25%" align="left" height="6">
       <a href="../" title="The Miser Project on GitHub">
       <img src="../images/misertheory-logo.png" /></a>
    </td>
       <td width="48%" height="6"><p align="center"><font color="#990033"><strong>
	<i>The Miser Project</i><br />
    <i><big><big>obapx: Extended Universal Function Facilities</big></big></i></strong></font></p>
    </td>
    <td width="27%" height="6" valign="middle" align="right">
      <b><code>
	  <a href="../" target="_top">miser</a>&gt;
      <a href="./" target="_top">oMiser</a>&gt;
      </code></b>
      <br /><br />
      <a href="https://clustrmaps.com/site/1bw9w" title="Visit tracker">
            <img src="//www.clustrmaps.com/map_v2.png?d=3-2eQV4fOuelVHp_YtztZ0hl9Uj4ei9zLKw_nRgCgyM&cl=ffffff" />
      </a>
      <br /><br />
      <b><code>
         <a href="index.html" target="_top">index</a>&gt;</code></b>
      <br />
      <small><small>
        0.1.1 2024-02-03T20:58Z<!-- MAINTAIN THIS MANUALLY -->
      </small></small>
      </td>
  </tr>
</table>

This topic covers the introduction of extended applicative interpretations
as additions to the obap specification.  Implementation in computational
manifestation is addressed as part of [oMiser](../oMiser) and
[oFrugal](../oFrugal) coverage.  Perhaps the most-evident impact of these
extensions is on the determination of canonical forms.  There are dramatic
alterations required for [CFob](../ob/CFob.txt).

## The Extension Principle

The approach to extensions involves establishment of individuals that have
specified applicative interpretations.  They remain distinguishable while
having specific interpretations, as if they are new/derived primitives.

Extensions are intended to provide the means by which oMiser can operate in
an interactive or coordinated manner such as communication with
seemingly-external/-separate entities.  Having a pseudo-random generator of
particular ob patterns is an example, as are other cases where the possession
of a state is understood, whether or not such state is completely known.

Extensions shall preserves immutability and distinguishability of individuals.
It is part of the Miser Project research agenda that this be strived for and
any ultimate limitations be understood.

## An Illustrative Conservative Extension

For oMiser, an extension is conservative if everything the extension
introduces can be accomplished without it.  In pragmatic terms, the extension
may afford more expressibility in use of oMiser (and thereby, oFrugal) and
there may also be useful improvements in operational performance.

Such an extension
[under consideration](https://github.com/orcmid/miser/discussions/47) consists
of functions that introduce individuals having specified scripts as their
applicative interpretations.

### The proc/dev extension

In the case of the **proc** extension, the idea is that **proc**(_p_) will be
an individual such that obapx.ap(**proc**(_p_), _x_) is the same as
obap.ap(_p_, _x_).  There are two consequences.

First, **proc**(_p_) is an individual and the script is generally not exposed.
λ-abstraction does not penetrate into _p_ although it is possible to
abstract **proc**(_p_) itself, just as non-primitive individuals can be
so-abstracted.

Pragmatically, _p_ is not entirely hidden, since

**proc**(_p_) = **proc**(_q_) ⇔ _p_ = _q_

and the inverse of **proc**, **dev**, is also introduced:

**dev**(**proc**(_p_)) = _p_

If _s_ is _not_ **proc**(_p_) for some _p_, then

**dev**(_s_) = _s_

### Practical considerations

The **proc**/**dev** arrangement provides a means, in oMiser, for procedurally
determining whether an individual is a **proc** or not.  It is also the case,
for oMiser, that comparison of individuals is near-instantaneous and so is
any **dev**(_s_) = _s_ determination.

It may also be the case that occurrence of **proc**(_s_) is also a hint for
acceleration of the applicative interpretation of _s_ in oMiser.  It may be
possible to over-use this implementation-dependent facility, however.

The **proc**/**dev** pattern will be adaptable to other situations that may
arise in expanding the computational utility of oMiser operations.  These will
all be pragmatic (and mathematically engineered) features.

## Quasi-Conservative Extensions

In computational settings, there are practical needs for facilities that do
not appear to fit the conservative-extension pattern of **proc**/**def**.
Most examples involve the idea of alterable state, including ones where state
cannot be entirely known, devolving to observable effects instead.

In no case are individuals ever changed.  Applicative interpretations will
be the same, with changes reflected in the determination of a separate
distinct individual as the derived result.  The mathematical challenge is
preservation of well-definedness.  Illustration and navigation of these
challenges will be expanded upon as specific extensions are devised.

## Unfathomable Cases

There may be features considered to be extensions that defy characterization
as mathematically-determined.  They may be contingent on unknown reality and
will probably be disqualified from oMiser.  To the degree that such entitites
are tolerated as a practical requirement, it is of interest to find ways to
quarantine such impurities, isolating their scope and impact from the
applicability of mathematical reasoning (or, sadly, vice versa).

## Catalog (Specimen, xYYMMNN Content TBD)

This placeholder links to raw materials and notes, including text files.
There will be organized folios of content as consolidation of documentation
on the web and development of the oMiser/oFrugal software progresses.

| **ID**                          | **Status**       | **Started** | **Topic** |
|   :-:                           |   :-:            |  :-:        |  ---  |
|                                 |                  |             |       |
| [Diary & Job Jar](c000000.htm)  | undated          | 2024-01-31  | Construction Notes |
|                                 |                  |             |       |
| [Discussions](https://github.com/orcmid/miser/discussions) |  |  | Various |

----

I invite discussion about Miser Project topics in the
[Discussion section](https://github.com/orcmid/miser/discussions).
Improvements and removal of defects in this particular documentation can be
reported and addressed in the
[Issues section](https://github.com/orcmid/miser/issues).  There are also
relevant [projects](https://github.com/orcmid/miser/projects?type=classic)
from time to time.

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
      <p align="right"><font size="-2">created 2024-01-31 by
         <a target="_top" href="../../orcmid">orcmid</a> </font></p>
    </td>
  </tr>
</table>
<!--


  0.1.1  2024-02-03T20:58Z Introduce the problem of reality-contingency.
  0.1.0  2024-02-03T19:25Z Explain concervative/quasi-conservative extension
  0.0.4  2024-02-02T03:44Z Fix typo
  0.0.3  2024-02-01T18:49Z Correct table layout
  0.0.2  2024-02-01T18:02Z Add proc/dev illustration
  0.0.1  2024-02-01T04:38Z Expland, add Discussion link
  0.0.0  2024-01-31T21:44Z Initial placeholder from oMiser 0.0.4 boilerplate


               *** end of miser/docs/obapx/index.md ***                  -->
