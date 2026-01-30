/* oMiser.h 0.0.2                   UTF-8                         2026-01-29
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                             The oMiser API
 *                             ==============
 *
 *   This is the spirally-developed oMiser API.  The API is designed for use
 *   on any x64 platform, but the code depends on Microsoft Visual Studio
 *   Code and Microsoft Windows SDK libraries.
 *
 */

#include <WinNT.h>       // For HRESULT definition
#include <guiddef.h>     // For GUID, IID, CLSID definitions

#ifdef __cplusplus
#warning oMiser.hpp is preferable for C++ instead of the oMiser.h C level API.
extern "C" {
#endif

HRESULT omEstablish(CLSID* omClassID, IID* riid, void **ppvObject);


    /* The Class ID for the Origami version of the oMiser engine.
       {476EAF02-4524-4D81-9227-6272464959CB}
       */
static const CLSID omOrigami
             = { 0x476eaf02, 0x4524, 0x4d81,
                   { 0x92, 0x27, 0x62, 0x72, 0x46, 0x49, 0x59, 0xcb }
                 };

#ifdef __cplusplus
}
#endif

/*
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *  0.0.2  2025-01-30T18:06Z Align with 0.0.1 oMiser.hpp
 *  0.0.1  2026-01-29T19:25Z Warn about using oMiser.h in C++
 *  0.0.0  2026-01-20T19:38Z Empty skeleton
 *
 *                        *** end of oMiser.h ***
 */
