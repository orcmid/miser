<!-- index.md 0.0.3                 UTF-8                         2024-01-22
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
    <i><big><big>‹oMiser Conception, Principles, and Engineering</big></big></i></strong></font></p>
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
        0.0.2 2024-01-22T20:30Z<!-- MAINTAIN THIS MANUALLY -->
      </small></small>
      </td>
  </tr>
</table>

oMiser is constructed as a software library for use on desktop computers. The
library employs object-oriented techniques for manifesting ‹ob› = 〈Ob,Of,Ot〉
in a navigational computation interpretation.  The [obap](../obap) Universal
Computation functions are implemented as oMiser operations.

This topic includes definition of the software-library interfaces (the oMiser
API) and the derivation of supporting algorithms.  The software itself is
developed separately and made available under the [dev](../dev) topic.

There are a number of challenges in having oMiser operate with excellent
performance.  The primitive operations defined for ‹ob› are not ideal, being
very low-level relative to the power available on today's computers. There are
several techniques for acceleration of operation safely behind the API, with
no detraction from ‹ob› manifestation stability.  There are three important
topics that figure into this.

### Immutability

The API exposes ‹ob› as immutable entities which are always "at hand", even
though there are alterations and accelerations behind the API that improve
operation without ever violating immutability of the abstraction.  Because
the API does not permit alteration of obs, the implementation is permitted
to exploit that in API-unseen ways.  Accelerators and their confirmed
performance will be explored here.

### Idealism

When oMiser operates in multiple instances, even when coordinated by local
or remote connections, there is semblance of there being only one ‹ob› domain
that is navigated by all of the instances.  Flavors of distributed operation,
even on the same computer, will be looked into.

### Type Abstraction

Although every ob has an applicative interpretation, those applications are
all relative to ‹ob› and cannot be accelerated in the computer implementation
as anything but machine-language speedups of obap procedures.  There is a
conundrum on how to identify types and somehow introduce machine-language
codes for superior representation of type interpretations.  There is no
means of expressing that using oMiser alone.

## Catalog (Specimen, mYYMMNN Content TBD)

This placeholder links to raw materials and notes, including text files.
There will be organized folios of content as consolidation of documentation
on the web progresses.

| **ID**                          | **Status**       | **Started** | **Topic** |
|   :-:                           |   :-:            |  :-:        |  ---  |
| [oMiser.txt](oMiser.txt) | 0.1.2 2023-11-06 | 2017-07-26  | Conception, Definition, and Implementation Notes |
| [Diary & Job Jar](c000000.htm)  | undated          | 2024-01-20  | More notes and work items |

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
      <p align="right"><font size="-2">created 2024-01-20 by
         <a target="_top" href="../../orcmid">orcmid</a> </font></p>
    </td>
  </tr>
</table>
<!--

  0.0.3  2024-01-22T20:30Z Remove the unreasonable from the synopsis
  0.0.2  2024-01-22T18:55Z Add synopsis of key topics
  0.0.1  2024-01-22T17:36Z Touch-up oMiser.txt entry
  0.0.0  2024-01-20T20:47Z Initial Placeholder

               *** end of miser/docs/oMiser/index.md ***                  -->
