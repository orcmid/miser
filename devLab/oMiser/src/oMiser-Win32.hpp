/* oMiser-Win32.hpp 0.0.3           UTF-8                         2026-02-01
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                           The oMiser C++ API
 *                           ==================
 *
 *   This is the spirally-developed oMiser API with C++ alternatives of the
 *   Microsoft COM interfaces.  The API is designed for use on any x64
 *   platform, but the C/C++ implementation depends on Microsoft Visual
 *   Studio and Windows SDKs for some of its features.
 *
 */
#ifndef __cplusplus
#error oMiser.hpp provides the C++ API only.  Use oMiser.h for C Language.
#endif

#include <WinNT.h>       // For HRESULT definition
#include <guiddef.h>     // For GUID, IID, CLSID definitions

extern "C" {

HRESULT omEstablish(CLSID* omClassID, IID* riid, void **ppvObject);

    /* The "factory" interface for establishing an oMiser universe instance.
       There is never more than one instance of the oMiser engine.  If the
       engine is already established, operation is simply a QueryInterface
       on that existing instance.

       FIXIT: Identify the possible HRESULT return values.
       */

static const CLSID omSpitball
             = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };

    /* The Class ID for the Spitball version of the oMiser engine.
       {476EAF02-4524-4D81-9227-6272464959CB}.  This is very much pre-flight
       and having no treasured air/space flight significance.  Ths is the
       CLSID for initial stumblings toward a meaningful omEstablish.

       The use of CLSIDs in this manner allows determination whether there is
       agreement between the header used and the oMiser engine code used
       at runtime.
       */




#ifdef __cplusplus
} // extern "C"
#endif

/*
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *  0.0.3  2026-02-01T17:33Z Remove Unknown include, rename as a Win32
 *  0.0.2  2026-01-31T20:35Z Initial staging and change to oMiser spitball
 *  0.0.1  2026-01-29T23:57Z Introduce omEstablish and omOrigami CLSID
 *  0.0.0  2026-01-29T19:18Z Empty skeleton
 *
 *                      *** end of oMiser-Win32.hpp ***
 */
