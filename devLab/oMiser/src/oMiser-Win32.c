/* oMiser-Win32.c 0.0.1              UTF-8                         2026-02-01
   -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

             C LANGUAGE IMPLEMENTATION OF oMiser RUN-TIME LIBRARY
             ****************************************************

               THE SPITBALL CONFIRMATION OF COM INTERFACE USAGE
               ================================================

   This is the minimalist "Spitball" trial for oMiser, a tiny and simple
   confirmation of the fundamental usage of COM interfaces.  The purpose is
   to simply verify that the basic mechanisms of COM are estblished correctly
   for both C and C++ language environments.

   The present version is for the C Language implementation of the oMiser
   Win32 Run-Time Library.  This will be the authoritative implementation,
   usable from both C and C++ language environments.

   The only difference for C++ is that the oMiser-Win32.hpp header file is
   used to provide the necessary declarations and definitions for oMiser COM
   interfaces, even though the underlying implementation is in C Language..

   The fundamental purpose of this very-early Spitball stage of oMiser code
   is to establish the basic mechanisms of COM interface usage and to
   verify that they work correctly used from both C and C++ language
   environments.

   There is a necessary dependency on the Windows SDK for COM interface
   definitions and declarations, with the implementation being specific to
   the Win32 x64 environment.
   */

#include "oMiser-Win32.h"     // For oMiser API declarations
#include <Unknwn.h>           // For IUnknown definition


       */

static IUnknown *pvIoMiserUniverse = NULL;


HRESULT omEstablish(CLSID* omClassID, IID* riid, void **ppvObject)

{ /* The "factory" for establishing an oMiser universe instance.*/

  const CLSID omNoPitch
              = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };
        /* This is a differently-named value of the omSpitBall CLSID.
           It is used to confirm agreement between the header and this
           implementation source.
           FIXIT: Identify the possible HRESULT return values.
        */

  /* FIXIT: Verify everything in the parameters before proceeding.*/

  if ( pvIoMiserUniverse != NULL )
       /* An oMiser universe is already established. */
       return (  (pvIoMiserUniverse)->QueryInterface
                                       ( pvIoMiserUniverse,
                                         riid,
                                         ppvObject
                                         )
                 );




  /*   FIXIT: There is never more than one instance of the oMiser engine.
       If the engine is already established, operation is simply a
       QueryInterface on that existing instance.
       */
  }  /* omEstablish */


/* -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

   0.0.1 2026-02-01T17:56Z Identify as Win32 C Language specific
   0.0.0 2023-05-26T23:12Z Placeholder for the Spitball setup for oMiser..

                         *** end of oMiser-Win32.c ***
   */
