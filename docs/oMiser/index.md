<!-- index.md 0.1.3                 UTF-8                         2025-09-18
     ----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
     source <https://github.com/orcmid/miser/blob/master/docs/obap/index.md>
     publication <https://orcmid.github.io/miser/obap/>
     -->

<table border="0" width="100%">
  <tr>
    <td width="25%" align="left" height="6">
       <a href="../" title="The Miser Project on GitHub">
       <img src="../images/misertheory-logo.png" /></a>
    </td>
       <td width="48%" height="6"><p align="center"><font color="#990033"><strong>
    <i>The Miser Project</i><br />
    <i><big><big>oMiser Conception, Principles, and Engineering</big></big></i></strong></font></p>
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
      <br /><br />
      <b><code>
      <a href="./" target="_top">oMiser</a>&gt;</code></b>
      <br />
      <small><small>
        0.1.2 2025-09-18T23:46Z<!-- MAINTAIN THIS MANUALLY -->
      </small></small>
      </td>
  </tr>
</table>

oMiser is constructed as a software library for use on desktop computers. The
library employs object-oriented techniques for manifesting ‹ob› = 〈Ob,Of,Ot〉
in a navigational computation interpretation.  The [obap](../obap) Universal
Computation functions are delivered as oMiser operations.

This topic includes definition of software-library interfaces -- the oMiser
API -- and the derivation of supporting algorithms for manifestation of ‹ob›
through the API. This level of computer-program access is often termed an
operational model for the manifestation that is achieved.

Releases of the software are provided
under the [dev](../dev) topic.  Development of the software is managed in the
[GitHub Repository](https://github.com/orcmid/miser/tree/master/dev), along
with [discussions](https://github.com/orcmid/miser/discussions),
[projects](https://github.com/orcmid/miser/projects?type=classic) and
[issues](https://github.com/orcmid/miser/issues).

There are a number of challenges in having oMiser operate with excellent
performance.  The primitive operations defined for ‹ob› are not ideal, being
very low-level relative to the power available on today's computers.
Fortunately, faithful interpretation of ‹ob› in a computer manifestation
can provide important optimizations behind the scenes of the API.

There are two qualities that oMiser shall always preserve: immutability and
idealism.

### Immutability

The API exposes ‹ob› as immutable entities which are always "at hand", even
though there are alterations and accelerations behind the API that improve
operation without ever violating immutability of the representation.
Accelerators expedite operations behind the scenes. Conservers provide for
recovery of computer storage of no-longer reachable ob instances.  The design
and verification of such optimization techniques is covered here.

### Idealism

When oMiser operates in multiple instances, even when coordinated by local
or remote connections, there is semblance of there being only one ‹ob› domain
that is navigated by all of the instances.  Flavors of distributed operation,
even on the same computer, will maintain that appearance.

### Type Abstraction

It is valuable that every ob has an also-immutable applicative interpretation.
This allows attaching computer code to ob representations in order to expedite
applicative operation. This is valuable [obap](../obap) acceleration.

Although, interpretations of [combinators](../obreps/combinators.txt) are
type-preserving, there is no obvious oMiser mechanism for introduction of
identified types and specialized optimization of type-restricted
interpretations through their abstraction.  It is not possible to escape ‹ob›.

An important improvement would be a means to identify types and somehow guide
introduction of machine-language codes for superior representation of rich
type interpretations.  There is no means of expressing that using oMiser
alone.  Exploration of how type abstraction can be supported, along with
preservation of idealism, will follow availability of oMiser and
[oFrugal](../oFrugal) implementations.

## Related Material

This placeholder links to raw materials and notes, including text files.
There will be organized folios of content as consolidation of documentation
on the web progresses.

| **ID**                          | **Status**       | **Started** | **Topic** |
|   :-:                           |   :-:            |  :-:        |  ---  |
| [oMiser.txt](oMiser.txt) | 0.1.2 2023-11-06 | 2017-07-26  | Conception, Definition, and Implementation Notes (temporary)|
| [Technical Notes](m000000.htm)  | undated          | 2025-09-10  | Subject-matter notes and work items |
| [Folios Catalog](m000001.htm)  | undated          | 2025-09-10  | Subordinate Topics Catalog|

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
      <p align="right"><font size="-2">created 2024-01-20 by
         <a target="_top" href="../../orcmid">orcmid</a> </font></p>
    </td>
  </tr>
</table>
<!--

  0.1.3  2025-09-19T00:55Z Repair context block
  0.1.2  2025-09-18T23:46Z Link corrections and formatting touch-ups
  0.1.1  2025-09-14T16:30Z Remove construction, touch-up subject-matter links
  0.1.0  2025-09-14T16:20Z Dump sxhash, add folio substructure
  0.0.6  2025-09-03T22:38Z Touch ups, add sxhash
  0.0.5  2025-07-10T22:14Z Conform top/bottom material to 0.1.2 hybridForm
  0.0.4  2024-01-23T17:56Z Expand the overview
  0.0.3  2024-01-22T20:30Z Remove the unreasonable from the synopsis
  0.0.2  2024-01-22T18:55Z Add synopsis of key topics
  0.0.1  2024-01-22T17:36Z Touch-up oMiser.txt entry
  0.0.0  2024-01-20T20:47Z Initial Placeholder

               *** end of miser/docs/oMiser/index.md ***                  -->
