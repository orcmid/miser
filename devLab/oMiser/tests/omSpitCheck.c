/* omSpitCHeck.c 0.0.1              UTF-8                         2026-02-10
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                      THE MISER PROJECT ON GITHUB
 *
 *                     OMISER SPITCHECK CONFIRMATION
 *                     =============================
 *
 *   This test program exercises the bare-minimum provisions at the
 *   oMiser Spitball level of operation.  The key interest is in
 *   confirming that the COM interfaces are compiled properly and that
 *   the expected CLSID and vtable are available.  This is an essential
 *   sanity check.

 */

#include <windows.h>

#include <stdio.h>      /* fputs */
#include <stdlib.h>     /* exit */

#include "oMiser-Win32.h"

static const CLSID CLSID_omSpitballCheck
             = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };
       /* The class we expect to be supported.  We do this, in particular,
          because we don't know what might be set with oMiser-Win32.h
          */

extern const IUnknownV IomSpitballV;
       /* The vtable we expect to find delivered by omEstablish for
          the Spitball version of omiser-Win32.c.          */

typedef struct {const IUnknownV *pv; volatile long refs;} omSpitball;
    /* A minimal COM state for Spitball testing.  It just has
       reference counts.  This is the expected beginning of the
       static omGlobalState implemented starting with Spitball
       versions of omiser-Win32.c.
       */

extern omSpitball omGlobalState;
       /* The ordinarily-private fixed omSpitball state  */

    /* FIXME: This won't work if the names are different in the linked
              oMiser-Win32.c.  It's not clear the linker will catch
              that.
                 We need an agreement on these two externs that is
              not dependent on the supported CLSID(s) of the linked
              oMiser-Win32.c and applicable oMiser-Win32.h.  We then
              need to figure out which CLSIDs are supported by the linked
              oMiser-Win32.c and applicable oMiser-Win32.h and which cannot
              be supported any longer because of incompatibilities.
              */

int main(void)
{

  fputs("\n[om] omSpitCheck 0.0.1 Confirmation of oMiser Spitball", stdout);

  fputs("\n"
        "\n     Checking unestablished omGlobalState ...", stdout);

  if (omGlobalState.pv != NULL)
      { fputs("\n     ERROR: omGlobalState.v is not NULL\n\n", stdout);
        exit(EXIT_FAILURE);
        }

  if (omGlobalState.refs != 0)
      { fputs("\n     ERROR: omGlobalState.refs is not 0\n\n", stdout);
        exit(EXIT_FAILURE);
        }

  fputs("\n     omGlobalState seems correctly unestablished", stdout);

  fputs("\n"
        "\n     MORE CHECKING TBD. STAY TUNED\n\n", stdout);



  exit(EXIT_SUCCESS);

 }
/*
   0.0.1 2026-02-10T02:39Z Checking for unestablished omGlobalState.
   0.0.0 2026-02-07T23:44Z Tiny nothing-to-see stub to kick-start the code.
   */

/*                      ***** end of omSpitCheck.c *****                   */
