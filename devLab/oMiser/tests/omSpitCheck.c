/* omSpitCHeck.c 0.0.6              UTF-8                         2026-02-12
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
       /* The class we expect to be supported.  We declare this here
          because we don't know what might be set with oMiser-Win32.h
          */

extern const IUnknownV IomSpitballV;
       /* The vtable we expect to find delivered by omEstablish for
          the Spitball version of omiser-Win32.c.          */

typedef struct {const IUnknownV *pv; volatile long refs;} omSpitball;
    /* A minimal COM state for Spitball testing.  It just has
       reference counts.  This is the expected beginning of the
       static omGlobalState commencing with Spitball versions of
       omiser-Win32.c.
       */

extern omSpitball omGlobalState;
       /* The ordinarily-private omSpitball state location */

    /* FIXME: This won't work if the name is different in the linked
              oMiser-Win32.c.  It's not clear the linker will catch
              that.  That's why omGlobalState is not tied to the CLSID
              or code version, to ensure linker agreement always.
                 We might support multiple CLSIDs in the future, and it is
              desirable that earlier ones remain workable as further ones
              essentially inherit the more-limited interfaces and global
              state portions of earlier ones.
                 This might be a pipe-dream, but it would be nice having
              tests be reusable until they aren't.
              */

int main(void)
{

  fputs("\n[om] omSpitCheck 0.0.6 Confirmation of oMiser Spitball", stdout);

  /* CONFIRM ACCESS AND STATUS OF UNESTABLISHED omGlobalState */
  /* -------------------------------------------------------- */

  fputs("\n"
        "\n     Checking for unestablished omGlobalState ...", stdout);

  if (omGlobalState.pv != NULL)
      { fputs("\n     ERROR: omGlobalState.v is not NULL\n\n", stdout);
        exit(EXIT_FAILURE);
        }
  if (omGlobalState.refs != 0)
      { fputs("\n     ERROR: omGlobalState.refs is not 0\n\n", stdout);
        exit(EXIT_FAILURE);
        }
  fputs("\n     success: omGlobalState present, not established", stdout);

  /* CONFIRM DEFENSES OF omEstablish API */
  /* ----------------------------------- */

  const CLSID CLSID_omFoulTip         /* A never-supported oMiser CLSID */
              = { 0xb51e2358, 0xadad, 0x4509,
                    { 0xb0, 0xd1, 0xf0, 0x2a, 0xd, 0x14, 0x78, 0x37 }
                  };

  const CLSID CLSID_omSpitball        /* Required for oMiser Spitball */
             = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };

  const IID IID_Fake                  /* A never-supported IID */
              ={ 0x19c50c7b, 0x52ac, 0x4cf3,
                   { 0x80, 0x62, 0x5f, 0x26, 0xc7, 0xa, 0x66, 0x16 }
                 };

  const IID IID_IUnknown
              = { 0x00000000, 0x0000, 0x0000,
                    { 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 }
                  };

  pIUnknown myUnknown = (void *)0xDEADBEEF01234567;
            /* A non-NULL pointer to confirm no alteration on any of the
               pointer errors. Note that pIUnknown is established in
               oMiser-Win32.h as a pointer to an IunknownV pointer,
               and we cannot steal the IUnknown name.
               */

  fputs("\n"
        "\n     Checking omEstablish Defenses ...", stdout);

        /*  March NULL parameters through calls on omEstablish,
            Each should get E_POINTER error and the REFIID pointer
            should not be touched.
            */

  HRESULT hr = omEstablish( NULL, &IID_IUnknown, (void **)&myUnknown);
  if (hr != E_POINTER)
      { fputs("\n     ERROR: no E_POINTER for NULL CLSID\n\n", stdout);
        exit(EXIT_FAILURE);
        }

  hr = omEstablish( &CLSID_omFoulTip, NULL, (void **)&myUnknown);
  if (hr != E_POINTER)
      { fputs("\n     ERROR: no E_POINTER for NULL IID*\n\n", stdout);
        exit(EXIT_FAILURE);
        }

  hr = omEstablish( &CLSID_omFoulTip, &IID_IUnknown, NULL);
  if (hr != E_POINTER)
      { fputs("\n     ERROR: no E_POINTER for NULL IUnknown ppv\n\n", stdout);
        exit(EXIT_FAILURE);
        }

  if (myUnknown != (void *)0xDEADBEEF01234567)
      { fputs("\n     ERROR: myUnknown pointer was altered prematurely\n\n",
              stdout
              );
        exit(EXIT_FAILURE);
        }

  fputs("\n     checked: E_POINTER resulted for each NULL parameter case.",
        stdout);


  /* CONFIRM CLSID VERIFICATION */
  /* -------------------------- */

  fputs("\n"
        "\n     Checking CLSID Verification ...", stdout);

  hr = omEstablish( &CLSID_omFoulTip, &IID_Fake, (void **)&myUnknown);

  if (myUnknown != NULL)
       fputs("\n     warning: no precautionary ppv clearing done.", stdout);

  if (hr != OM_E_CLSID_UNSUPPORTED)
      { fputs("\n     ERROR: unsupported CLSID not rejected.\n\n", stdout);
        exit(EXIT_FAILURE);
        }

  hr = omEstablish( &CLSID_omSpitball, &IID_Fake, (void **)&myUnknown);

  if (hr != OM_E_CLSID_UNSUPPORTED)
       fputs("\n     omSpitball CLSID likely accepted.", stdout);

  /* Note: Since we didn't get OM_E_CLSID_UNSUPPORTED now, assume that
     the likely case is  E_NOINTERFACE because of &IID_Fake.
     There should not be any other result in the omSpitball case,
     so might have to punt otherwise.
     */

  if (hr != E_NOINTERFACE)
       { fputs("\n     UNEXPECTED HRESULT: something has gone wrong.\n\n",
               stdout);
         exit(EXIT_FAILURE);
            }

  /* CONFIRM GLOBAL STATE ESTABLISHED */
  /* -------------------------------- */
  /* We have NO_INTERFACE but we'll get around to that after we deal with
     the fact that the Spitball CLSID was accepted and there should now
     be an initialized global state.
     */

  fputs("\n"
        "\n     Confirming establishment of Global State ...", stdout);

  if (omGlobalState.pv == NULL)
       { fputs("\n     ERROR: Global State not established\n\n", stdout);
         exit(EXIT_FAILURE);
         }

  if (omGlobalState.pv != &IomSpitballV)
       fputs("\n     warning: omGlobalState is not for Spitball",
             stdout);
  else fputs("\n     omGlobalState is for Spitball, CLSID was accepted.",
             stdout);


  /* CONFIRM INTERFACE OBTAINED */
  /* -------------------------- */
  /* account for the E_NOINTERFACE and go again to get a recognized
     interface of the already-established spitball and Global State.
     */

  fputs("\n"
        "\n     Checking Interface IID Verification ..."
        "\n     E_NOINTERFACE received as expected for IID_Fake.", stdout);


  hr = omEstablish( &CLSID_omSpitball, &IID_IUnknown, (void **)&myUnknown);

  if (hr != S_OK)
       { fputs("\n     ERROR: IUnknown not obtained\n\n", stdout);
         exit(EXIT_FAILURE);
         }

  fputs("\n     IUnknown interface received as expected", stdout);

  if (2 != myUnknown->pv->AddRef(myUnknown))
       fputs("\n     IUnknown AddRef did not return expected value 2\n\n",
               stdout
               );
       fputs("\n     IUnknown AddRef returned expected value 2", stdout);

  if (1!= myUnknown->pv->Release(myUnknown))
       fputs("\n     IUnknown Release did not return expected value 1\n\n",
               stdout
               );
       fputs("\n     IUnknown Release returned expected value 1", stdout);

  fputs("\n"
        "\n     omSpitCheck completed.\n\n", stdout);


  exit(EXIT_SUCCESS);

 }
/*
   0.0.6  2026-02-12T00:06Z Include AddRef and Release success results, more.
   0.0.5  2026-02-11T04:54Z Clean up with const and myUnknown pointer.
   0.0.4  2026-02-11T03:44Z First complete draft of omSpitCheck.c.
   0.0.3  2026-02-10T20:04Z Setup before checking E_POINTER cases
   0.0.2  2026-02-10T18:37Z Add FIXMEs for the additional checsk needed
   0.0.1  2026-02-10T02:39Z Checking for unestablished omGlobalState.
   0.0.0  2026-02-07T23:44Z Tiny nothing-to-see stub to kick-start the code.
   */

/*                      ***** end of omSpitCheck.c *****                   */
