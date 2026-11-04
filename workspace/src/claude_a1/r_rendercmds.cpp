// Render command buffers.
#include "a1.h"

GfxBackEndData *frontEndDataOut;
GfxCmdArray *s_cmdList;

// Retail: ids <= 0xe count as critical, 0x15+ reserve space; the exact split in 0xf..0x15 is unobservable.
#define RC_FIRST_NONCRITICAL 0xf

// Non-critical commands leave 0x2000 bytes reserved for critical ones.
static GfxCmdHeader *R_GetCommandBuffer(int renderCmd, int bytes)
{
    GfxCmdHeader *header;
    int sizeLimit;

    sizeLimit = sizeof(s_cmdList->cmds) - s_cmdList->usedTotal;
    if (renderCmd >= RC_FIRST_NONCRITICAL)
        sizeLimit -= 0x2000 - s_cmdList->usedCritical;
    if (bytes > sizeLimit)
    {
        s_cmdList->lastCmd = 0;
        return 0;
    }
    header = (GfxCmdHeader *)&s_cmdList->cmds[s_cmdList->usedTotal];
    s_cmdList->usedTotal += bytes;
    if (renderCmd < RC_FIRST_NONCRITICAL)
        s_cmdList->usedCritical += bytes;
    s_cmdList->lastCmd = header;
    header->id = (unsigned short)renderCmd;
    header->byteCount = (unsigned short)bytes;
    return header;
}

void R_AddCmdTouchAllImages()
{
    R_GetCommandBuffer(0x21, sizeof(GfxCmdHeader));
}
