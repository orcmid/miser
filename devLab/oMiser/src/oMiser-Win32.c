/* oMiser-Win32.c 0.0.3              UTF-8                         2026-02-05
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

#include <WinNT.h>            // For HRESULT definition
#include "oMiser-Win32.h"     // For oMiser API declarations

typedef struct {IUnknownV *pv; ULONG refs;} omSpitball;
    /* A minimal COM object for Spitball testing.  It just
       reference counts. */

static omSpitball pvIomSpitball = { NULL, 0 };

/* FIXME: I don't know how I got from omSpitBall to these nom* names.
          I need something else, even though I don't know what yet.
          I need to figure out what these names should be when I
          finalize the prefix for the main uber Class - These are not
          exposed, but the names should be consistent internally,
          especially as there become more classes and interfaces. */

static ULONG nomAddRef(omSpitball *This)
{  /* count a new reference */
   return InterlockedIncrement(This->refs);
   }

static ULONG nomRelease(omSpitball *This)
{  /* reduce reference count */
   return InterlockedDecrement(This->refs);
   }

HRESULT nomQueryInterface(omSpitball *This, REFIID riid, void **ppv)
{  /* provide minimal query choices */

   /* defend ourselves */
   if (This == NULL || riid == NULL || ppv == NULL)
       return E_POINTER;
   *ppv = NULL;

   /* we have only IUnknown as a SpitBall option */
   if (!IsEqualIID(riid, &IID_IUnknown))
       return E_NOINTERFACE;

   *ppv = This;
   nomAddRef(This);
   return S_OK;

   } /* nomQueryInterface */

static const IUnknownV IomSpitballV
             = { nomQueryInterface, nomAddRef, nomRelease };


HRESULT omEstablish(CLSID* omClassID, IID* riid, void **ppv)

{ /* The "factory" for establishing an oMiser universe instance.*/

  const CLSID CLSID_omNoPitch         /* Must match CLSID_omSpitBall */
              = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };
        /* This is a differently-named value of the omSpitBall CLSID.
           It is used to confirm agreement between the header and this
           implementation source.
           FIXIT: Identify the possible HRESULT return values.
        */

  /* FIXIT: Verify everything in the parameters before proceeding.*/

  /* There is never more than one instance of the oMiser engine.
     If the engine is already established, operation is simply a
     QueryInterface on that existing instance.
     */

  if ( pvIomSpitball.pv == NULL )
       /* An oMiser universe needs establishment. */
       pvIomSpitball.pv = &IomSpitballV;

  return IomSpitballV.QueryInterface( &pvIomSpitball, riid, ppv);

  }  /* omEstablish */


/* -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*

   0.0.3  2026-02-05T00:42Z Get the basic COM interface but clumsy
   0.0.2  2026-02-03T22:51Z First pass at implementation draft
   0.0.1  2026-02-01T17:56Z Identify as Win32 C Language specific
   0.0.0  2023-05-26T23:12Z Placeholder for the Spitball setup for oMiser..

                         *** end of oMiser-Win32.c ***
   */
