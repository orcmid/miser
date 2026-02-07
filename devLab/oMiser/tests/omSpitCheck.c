/* omSpitCHeck.c 0.0.0              UTF-8                         2026-02-07
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                      THE MISER PROJECT ON GITHUB
 *
 *                     OMISER SPITCHECK CONFIRMATION
 *                     =============================
 *
 *   This test program is exercises the bare-minimum provisions at the
 *   oMiser Spitball level of operation.  crutch coding to sort of bootstrap our way into the project

 */

#include <stdio.h>      /* fputs */
#include <stdlib.h>     /* exit */

#include "oMiser-Win32.h"



int main(void)
{

  fputs("\n[om] omSpitCheck 0.0.0 Confirmation of oMiser Spitball", stdout);

  fputs("\n     You find yourself in a dark room with no windows", stdout);
  fputs("\n     and only one door. There is a table in the middle", stdout);
  fputs("\n     of the room. On the table is a small box.", stdout);
  fputs("\n     What do you do?\n", stdout);
  fputs("\n     ... OH WAIT, strike that set!!\n", stdout);

  fputs("\n     Nothing to see here, move along\n", stdout);

  fputs("\n   > ^C", stdout);

  exit(EXIT_SUCCESS);

 }
/*

   0.0.0 2026-02-07T23:44Z Tiny nothing-to-see stub to kick-start the code.
   */

/*                      ***** end of omSpitCheck.c *****                   */
