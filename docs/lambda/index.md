<!-- index.md 0.2.0                 UTF-8                         2024-07-11
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
       <td width="48%" height="6"><p align="center"><font color="#990033"><strong>
	<i>The Miser Project</i><br />
    <i><big><big>λ Applicative-Procedure Abstraction</big></big></i></strong></font></p>
    </td>
    <td width="27%" height="6" valign="middle" align="right">
      <b><code>
	  <a href="../" target="_top">miser</a>&gt;
      <a href="./" target="_top">obap</a>&gt;
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
        0.2.0 2024-07-12T16:54Z<!-- MAINTAIN THIS MANUALLY -->
      </small></small>
      </td>
  </tr>
</table>

## The Abstraction Idea

> "This process \[of extracting common features\] can be regarded as a
> repeated abstraction ... and under certain circumstances such abstracting
> processes can be repeatedly piled on top of one another.  Here '_abstract_'
> has to be understood in the literal meaning of the word as 'removing', as
> leaving aside everything inessential for the context in question or for a
> particular purpose ... ."
<div align="right">[Hans Reichardt](https://mathshistory.st-andrews.ac.uk/Biographies/Reichardt/)
\[[VNR1977](https://orcmid.github.io/bib/authors.htm#VNR1977): Introduction,
p.11\]</div>


The abstraction of functions from oMiser applicative procedures is developed
as an oMiser applicative procedure itself.  oMiser is sufficiently low-level,
and the ob.ap function sufficiently universal, that lambda abstraction is
implementable as an oMiser applicative procedure.

The derivation of `^lambda` and of the companion, `^rec`, is carried out and
carefully demonstrated because of its importance in useful formulations of
oFrugal procedures.


## Catalog (Specimen, LYYMMNN Content TBD)

This placeholder links to raw materials and notes, including text files.
There will be organized folios of content as consolidation of documentation
on the web progresses.

| **ID**                  | **Status** | **Started** | **Topic** |
|   :-:                   |   :-:      |  :-:        |  ---      |
| [oSigma](oSigma.txt)    | 0.4.0 2024-06-24 | 2024-05-05 | `σ.s M` & `subst(L, s)` definition |
| [lambda](oLambda.txt)   | 0.4.0 2024-06-24 | 2024-06-20 | `λ.x` & `ρ.p` Abstraction Operations |
| [c000000](c000000.htm)  | undated    | 2024-01-25  | Construction Diary & Job Jar |

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
      <p align="right"><font size="-2">created 2024-01-25 by
         <a target="_top" href="../../orcmid">orcmid</a> </font></p>
    </td>
  </tr>
</table>
<!--

  0.2.0  2024-07-12T16:54Z Begin draft text
  0.1.0  2024-07-01T20:08Z oSigma and oLambda introduction
  0.0.0  2024-01-25T17:26Z Placeholder from 0.0.2 obap/index.md boilerplate

               *** end of miser/docs/lambda/index.md ***                  -->
