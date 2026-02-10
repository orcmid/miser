/* omSpitCHeck.c 0.0.2              UTF-8                         2026-02-10
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

  fputs("\n[om] omSpitCheck 0.0.2 Confirmation of oMiser Spitball", stdout);

  /* CONFIRM ACCESS AND STATUS OF UNESTABLISHED omGlobalState */
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

  fputs("\n     omGlobalState seems correctly not yet established", stdout);

  /* CONFIRM DEFENSES OF omEstablish API */
  const CLSID CLSID_omFowlTip         /* A never-supported oMiser CLSID */
              = { 0xb51e2358, 0xadad, 0x4509,
                    { 0xb0, 0xd1, 0xf0, 0x2a, 0xd, 0x14, 0x78, 0x37 }
                  };

  /* FIXME: CREATE NON-NULL IUnknown REFIID Pointer to confirm that
            it is not altered by any of the pointer errors
            */

  fputs("\n"
        "\n     Checking omEstablish Defenses ...", stdout);

  /* FIXME: March NULL parameters through calls on omEstablish,
            Each should get E_POINTER error and the REFIID pointer
            should not be touched.
            */

  /* FIXME: Have a valid omEstablish call but with CLSID_omFowlTip
            causing OM_E_CLSID_UNSUPPORTED *and* the REFIID has
            been NULLed.
            */

  /* FIXME: Have a valid CLSID_omSpitball call to omEstablish but
            not a recognized IID parameter.  This will again NULL
            the REFIID parameter.  The global state will be established,
            but no interface will be delivered.  The refs count should
            be 0, since no reference has been delivered.  CONFIRIM
            THIS CASE.
            */

  /* FIXME: Have a valid call on omEstablish and now confirm that
            Global State is delivered *and*, the expected VTable is
            there, and the refs value is 1.
            */

  /* FIXME: Confirm that the delivered interface is functional by calling
            AddRef and Release and confirming the expected changes in
            refs values returned.   Because it is going to dive into the
            methods, this and an unsuccessful and successful QueryInterface
            should also be checked.
            */

  fputs("\n"
        "\n     MORE CHECKING TBD. STAY TUNED\n\n", stdout);


  exit(EXIT_SUCCESS);

 }
/*
   0.0.2  2026-02-10T18:37Z Add FIXMEs for the additional checsk needed
   0.0.1  2026-02-10T02:39Z Checking for unestablished omGlobalState.
   0.0.0  2026-02-07T23:44Z Tiny nothing-to-see stub to kick-start the code.
   */

/*                      ***** end of omSpitCheck.c *****                   */
