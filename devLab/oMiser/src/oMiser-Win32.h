/* oMiser-Win32.h 0.0.7             UTF-8                         2026-02-05
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                             The oMiser API
 *                             ==============
 *
 *   This is the spirally-developed oMiser API.  The API is designed for use
 *   on any x64 platform, but this code depends on Microsoft Visual Studio
 *   Code, Build Tools, and Windows SDK libraries.
 *
 */

#include <WinNT.h>       // For HRESULT definition
#include <guiddef.h>     // For GUID, IID, CLSID definitions
#include <WinDef.h>      // For basic Windows types
#include <Winerror.h>    // For named HRESULT error codes

#ifdef __cplusplus
#warning oMiser.hpp is preferable for C++ use of oMiser COM interfaces.
extern "C" {
#endif

HRESULT omEstablish(CLSID* omClassID, IID* riid, void **ppvObject);

    /* The "factory" interface for establishing an oMiser universe instance.
       There is never more than one instance of the oMiser engine.  If the
       engine is already established, operation is simply a QueryInterface
       on that existing instance.

       FIXIT: Identify the possible HRESULT return values.
       */

static const CLSID CLSID_omSpitball
             = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };

    /* The Class ID for the Spitball version of the oMiser engine:
       {476EAF02-4524-4D81-9227-6272464959CB}.  This is very much pre-flight
       and having no treasured air-/space-flight significance.  Ths is the
       CLSID for initial stumblings toward a meaningful omEstablish.

       The use of CLSIDs in this manner allows determination whether there is
       agreement between the header used and the oMiser engine code used
       at runtime.
       */

static const IID IID_IUnknown
             = { 0x00000000, 0x0000, 0x0000,
                   { 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 }
                 };
    /* The Interface that every component supports and that every
       interface begins with (derives from)
                */

#define IUNKNOWN_V \
        HRESULT (*QueryInterface)(void* This, IID* riid, void **ppv); \
        ULONG (*AddRef)(void* This); \
        ULONG (*Release)(void* This)
    /* The standard IUnknown interface methods supplied at the beginning
       of every COM interface vtable
       */

typedef struct IUnknownV { IUNKNOWN_V; } IUnknownV;
    /* Just enough vtable for an instance's IUnknown interface */

typedef struct IUnknown { IUnknownV *pv; } IUnknown;
    /* An instance's IUnknown interface */


#ifdef __cplusplus
}
#endif

/*
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *  0.0.7  2026-02-05T00:55Z Clean up the types and HRESULT definitions
 *  0.0.6  2026-02-04T23:09Z Touch-up comments and formatting
 *  0.0.5  2026-02-02T18:04Z Introduce IUnknownV and IUnknown structures
 *  0.0.4  2026-02-01T17:39Z Remove Unknown reference, rename as Win32 version
 *  0.0.3  2026-01-31T20:33Z Initial staging for oMiser spitball
 *  0.0.2  2026-01-30T18:06Z Align with 0.0.1 oMiser.hpp
 *  0.0.1  2026-01-29T19:25Z Warn about using oMiser.h in C++
 *  0.0.0  2026-01-20T19:38Z Empty skeleton
 *
 *                      *** end of oMiser-Win32.h ***
 */
