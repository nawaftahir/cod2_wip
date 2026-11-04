/* CoD2 retail 0x004a87b0: RefString memory-tree lookup.
 * Reconstructed against the documented assert sites, following
 * CoD2rev_Server's GetRefString(unsigned int) source semantics.
 * ABI, global storage identity, and original symbol still require proof.
 */
#include "../universal/assertive.h"
extern "C" void *scrMemTreeBuffer;

extern "C" void *SL_GetString(unsigned int stringValue)
{
    static bool s_assertDisablePresent;
    static bool s_assertDisableBound;
    if (!stringValue && !s_assertDisablePresent) {
        switch (FUN_0047d980("stringValue",
                "\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",
                136, 0, 1)) {
        case 0: DebugBreak(); break;
        case 2: s_assertDisablePresent = true; break;
        }
    }
    unsigned int offset = stringValue * 8;
    if (!(offset < 0x80000) && !s_assertDisableBound) {
        switch (FUN_0047d980("stringValue * MT_NODE_SIZE < MT_SIZE",
                "\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",
                137, 0, 1)) {
        case 0: DebugBreak(); break;
        case 2: s_assertDisableBound = true; break;
        }
    }
    return (char *)scrMemTreeBuffer + offset;
}

/* Original public script-string conversion (CoD2rev_Server reference).
 * Keep in script owner rather than xmodel, to avoid an extra xmodel emitter.
 */
const char *SL_ConvertToString(unsigned int stringValue)
{
    if (stringValue)
        return (const char *)((char *)SL_GetString(stringValue) + 4);
    return 0;
}
