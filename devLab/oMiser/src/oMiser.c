/* oMiser.c 0.0.0                   UTF-8                         2026-02-01
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
   Run-Time Library.  This will be the authoritative implementation, usable
   from both C and C++ language environments.

   The only difference for C++ is that the oMiser.hpp header file is used
   to provide the necessary declarations and definitions for oMMiser COM
   interfaces, even though the underlying implementation is in C Language..

   The fundamental purpose of this very-early Spitball stage of oMiser code
   is to establish the basic mechanisms of COM interface usage and to
   verify that they work correctly used from both C and C++ language
   environments.
   */

#include "oMiser.h"     // For oMiser API declarations

static const CLSID omSlowPitch
             = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };
    /* This is a differently-named value of the omSpitBall CLSID.
       It is used to confirm agreement between the header and this
       implementation source.
       */

static IUnknown *ppvIoMiser = NULL

HRESULT omEstablish(CLSID* omClassID, IID* riid, void **ppvObject)
  { /* The "factory" interface for establishing an oMiser universe instance.
       */

    /* FIXIT: Validate the parameters, exiting if no deal */

    /* If the oMiser engine is already running, use it. */

    if (ppvIoMiser != NULL)
         return( **ppvIoMiser
                    -> QueryInterface( ppvIoMiser, riid, ppvObject)
                 );

    /* HEY, IT IS TIME TO FIRE UP oMISER */

    /* FIXIT: Identify the possible HRESULT return values.
       */

    } /* omEstablish */


/* -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

   0.0.0 2026-02-01T00:58Z Placeholder for the Spitball setup for oMiser.

                           *** end of oMiser.c ***
   */
