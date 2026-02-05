@echo off
REM myPrompt.bat 0.0.1              UTF-8                         2023-06-09
rem |----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
rem
rem                      SETTING PROMPT COLORING
rem
rem    This batch file sets the default prompt to black and then reverts to
rem    the default colors of the CMD window.  This brings emphasis to the
rem    prompt and makes it easier to see where user entries are made.
rem
rem    To see how this works, type PROMPT /? at the command prompt.

PROMPT $E[0m$P$G$E[30m

rem |----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
rem
rem 0.0.1  2026-01-09T22:22Z Switch the colors
rem 0.0.0  2023-06-08T17:49Z Initial version.
rem
rem                      *** end of myPrompt.bat ***
