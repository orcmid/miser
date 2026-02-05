/* oMiser-Win32.h 0.0.8             UTF-8                         2026-02-05
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                             The oMiser API
 *                             ==============
 *
 *   This is the spirally-developed oMiser API.  The API is designed for use
 *   on any x64 platform, but this code depends on Microsoft Visual Studio
 *   Code, Build Tools, and Windows SDK libraries.
 *
 *   The Component Object Model (COM) is used to provide application program
 *   interfaces (APIs) that separate implementation concerns and provide for
 *   modularity.  COM also allows for networked operation without the need for
 *   applications to attend to network details or even the presence of
 *   networked operation.  This enables distributed computing scenarios,
 *   although that is not an immediate objective.
 *
 *   COM-based reusable software components can be easily integrated into
 *   different applications and also updated without affecting the clients
 *   that use them, so long as the interfaces remain consistent.  Such safe
 *   versioning of interfaces is a key provision of COM.
 *
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *   This header provides the Win32-specific definitions for the oMiser API.
 *   Although most documentation and application of COM is oriented to the
 *   use of C++, this header provides the necessary definitions for C and
 *   the implementation of oMiser is also in C Language.
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

       FIXIT: Identify the possible HRESULT return values.  We'll also need
              to define successive Class IDs and additional Interface
              definitions as the API evolves.
       */

static const CLSID CLSID_omSpitball
             = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };

    /* The Class ID for the Spitball version of the oMiser engine:
       {476EAF02-4524-4D81-9227-6272464959CB}.  This is for tiny first
       steps in verification of COM-based interoperability.

       The use of a CLSIDs progression allows confirmation of compatibility
       between the use of this header and the oMiser engine runtime code
       actually linked to the application.
       */

/* IUNKNOWN INTERFACE CONSTRUCTIONS */

/* The following definitions demonstrate the pattern for definition of
   all interfaces supported by oMiser COM-based components.  An IUnknown
   interface is provided by every component, making it the perfect starting
   point.
   */

static const IID IID_IUnknown
             = { 0x00000000, 0x0000, 0x0000,
                   { 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46 }
                 };
    /* The COM Interface that every component supports and that every
       interface begins with (derives from)
                */

#define IUNKNOWN_V \
        HRESULT (*QueryInterface)(void* This, IID* riid, void **ppv); \
        ULONG (*AddRef)(void* This); \
        ULONG (*Release)(void* This)
    /* The standard IUnknown interface methods supplied at the beginning
       of every COM interface vtable.  Suffix _V is used for vtable macros.
       See the usage in the IUnknownV structure.
       */

typedef struct IUnknownV { IUNKNOWN_V; } IUnknownV;
    /* Just enough vtable for component IUnknown interfaces. Use of
       the V suffix is for vtable types, all of which will begin with
       IUNKNOWN_V.  Given any interface, additional interfaces are
       obtained through the interface's Query Interface method.  Here,
       just the IUnknown methods are presumed.
       */

typedef struct IUnknownPV { IUnknownV *pv; } IUnknownPV;
    /* A pointer to a vtable, here presuming just the IUnknown methods
       provided for every component.
       */

typedef IUnknownPV *pIUnknown;
    /* A pointer to the vtable pointer in an instance's state. All that
       is assumed about that state is its vtable pointer location and the
       methods that are exposed thereby.
       */

    /* Given an instance's pIUnknown, say at pThat, the instance's IUnknown
       methods can be invoked through the vtable pointer as follows:

       HRESULT hr = pThat->pv->QueryInterface( pThat,
                                               &IID_someInterface,
                                               &pForSomeInterface
                                               );

       UINT refCount = pThat->pv->AddRef( pThat );

       UINT refsLeft = pThat->pv->Release( pThat );

       All COM component instances have reusable vtables and the methods must
       operate on the particular instance state the method applies to.
       The methods are informed of that with their first parameter.

       FIXME: See if there is a way to abbreviate these calls somehow.
              Having a dot-notation work would be wonderful.
       */

#ifdef __cplusplus
}
#endif

/*
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *  0.0.8  2026-02-05T23:52Z Improve namings and explanations of the pattern.
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
