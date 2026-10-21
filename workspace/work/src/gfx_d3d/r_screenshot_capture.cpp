#include "gfx.h"
#include <stdio.h>

byte *R_TakeResampledScreenshot(int width, int height, int bytesPerPixel, int headerSize);

// PINNED: retail 0x10026290 reads GfxWorld::baseName at +4.
void R_LevelShot()
{
    char filename[260];
    byte *buffer;
    sprintf(filename, "levelshots/%s.tga", rgp.world->baseName);
    buffer = R_TakeResampledScreenshot(128, 128, 3, 18);
    if (buffer)
    {
        memset(buffer, 0, 18);
        buffer[2] = 2;
        buffer[12] = 128;
        buffer[14] = 128;
        buffer[16] = 24;
        ri.FS_WriteFile(filename, buffer, 49170);
        ri.Z_FreeInternal(buffer);
        ri.Printf(0, "Wrote %s\n", filename);
    }
}
