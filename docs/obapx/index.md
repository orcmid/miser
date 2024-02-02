<!-- index.md 0.0.4                 UTF-8                         2024-02-02
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
        0.0.4 2024-02-02T03:44Z<!-- MAINTAIN THIS MANUALLY -->
      </small></small>
      </td>
  </tr>
</table>

Theoretically, extensions to the [obap](../obap) Universal Computation
functions do not exceed the already-universal character of those functions
and the manifestation of the computational model.

Pragmatically, there are extensions that improve the facility of of the model,
especially in the representation of other valuable computational capabilities.

This topic covers the introduction of extended applicational interpretations
as additions to the obap specification.  Implementation in computational
manifestation is addressed as part of [oMiser](../oMiser) and
[oFrugal](../oFrugal) coverage.  Perhaps the most-evident impact of these
extensions is on the determination of canonical forms.  There are dramatic
alterations required for [CFob](../ob/CFob.txt).

## An Illustrative Extension

An extension
[under consideration](https://github.com/orcmid/miser/discussions/47) consists
of functions that introduce individuals having scripted applicative
interpretations scripts.

In the case of the **proc** extension, the idea is that **proc**(_p_) will be
an individual such that obapx.ap(**proc**(_p_), _x_) is the same as
obap.ap(_p_, _x_).  There are two consequences.

First, **proc**(_p_) is an individual and the script is generally not exposed.
Llambda-abstraction does not penetrate into _p_ although it is possible to
abstract **proc**(_p_) itself, just as for any individual.

Pragmatically, _p_ is not entirely hidden, since

**proc**(_p_) = **proc**(_q_) ⇔ _p_ = _q_

and the inverse of **proc**, **dev**, is also introduced:

**dev**(**proc**(_p_)) = _p_

If _s_ is _not_ **proc**(_p_) for some _p_, then

**dev**(_s_) = _s_

This provides a means for procedurally determining whether an individual is
a **proc** or not.  It is also the case, for oMiser, that comparison of
individuals is near-instantaneous and so is any **dev**(_s_) = _s_ check.

Pragmatically, again, the occurrence of **proc**(_s_) is also a hint for the
acceleration of the applicative interpretation of _s_ in oMiser.  It will be
pragmatically unwise to over-use the facility, however.

The **proc**/**dev** pattern may be adaptable to other situations that may
arise in expanding the computational utility of oMiser operations.  These will
all be pragmatic (and mathematically engineered) features.

Of particular benefit will be such extensions that support stateful operation,
including the ability to alter a state and carry it forward.

## Catalog (Specimen, xYYMMNN Content TBD)

This placeholder links to raw materials and notes, including text files.
There will be organized folios of content as consolidation of documentation
on the web and development of the oMiser/oFrugal software progresses.

| **ID**                          | **Status**       | **Started** | **Topic** |
|   :-:                           |   :-:            |  :-:        |  ---  |
|                                 |                  |             |       |
| [Diary & Job Jar](c000000.htm)  | undated          | 2024-01-31  | Notes |
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

  0.0.4  2024-02-02T03:44Z Fix typo
  0.0.3  2024-02-01T18:49Z Correct table layout
  0.0.2  2024-02-01T18:02Z Add proc/dev illustration
  0.0.1  2024-02-01T04:38Z Expland, add Discussion link
  0.0.0  2024-01-31T21:44Z Initial placeholder from oMiser 0.0.4 boilerplate


               *** end of miser/docs/obapx/index.md ***                  -->
