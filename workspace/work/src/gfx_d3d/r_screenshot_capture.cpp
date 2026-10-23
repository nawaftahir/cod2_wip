#include "gfx.h"
#include <stdio.h>

extern vidConfig_t vidConfig;

// PINNED 1076a834: shared numbering for JPEG and TGA console captures.
static int lastScreenShotNumber;

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

void R_SaveJpg(const char *filename, int quality, int width, int height, byte *pixels);
Bool R_GetFrontBufferData(int x, int y, int width, int height, int bytesPerPixel, byte *buffer);
void R_TakeScreenshotTga(int x, int y, int width, int height, const char *filename);

// PINNED 10026240/78: capture failure still frees the pixel allocation.
void R_TakeScreenshotJpeg(int x, int y, int width, int height, const char *filename)
{
    byte *buffer = (byte *)ri.Z_MallocInternal(width * height * 3);
    if (R_GetFrontBufferData(x, y, width, height, 3, buffer))
        R_SaveJpg(filename, 90, width, height, buffer);
    ri.Z_FreeInternal(buffer);
}

// PINNED 10026330/101: savegame thumbnails use512-square resampled JPEGs.
void R_SaveGameShot(const char *name)
{
    char filename[264];
    sprintf(filename, "%s.jpg", name);
    byte *buffer = R_TakeResampledScreenshot(512, 512, 3, 0);
    if (buffer)
    {
        R_SaveJpg(filename, 90, 512, 512, buffer);
        ri.Z_FreeInternal(buffer);
    }
}

// PINNED 100263a0/567: preserve the original9999 rejection and negative-counter fallback.
void R_ScreenShotCmd(int type)
{
    const char *extension;
    if (type == 0)
        extension = "jpg";
    else if (type == 1)
        extension = "tga";
    else
        return;
    if (!strcmp(ri.Cmd_Argv(1), "levelshot"))
    {
        R_LevelShot();
        return;
    }
    if (!strcmp(ri.Cmd_Argv(1), "savegame") && ri.Cmd_Argc() == 3 && ri.Cmd_Argv(2)[0])
    {
        R_SaveGameShot(ri.Cmd_Argv(2));
        return;
    }
    bool silent = !strcmp(ri.Cmd_Argv(1), "silent");
    char filename[256];
    if (ri.Cmd_Argc() == 2 && !silent)
        Com_sprintf(filename, sizeof(filename), "screenshots/%s.%s", ri.Cmd_Argv(1), extension);
    else
    {
        if (lastScreenShotNumber > 9999)
        {
            ri.Printf(0, "ScreenShot: Couldn't create a file\n");
            return;
        }
        for (;;)
        {
            if (lastScreenShotNumber < 0 || lastScreenShotNumber > 9999)
                Com_sprintf(filename, sizeof(filename), "screenshots/shot9999.%s", extension);
            else
                Com_sprintf(filename, sizeof(filename), "screenshots/shot%04i.%s", lastScreenShotNumber, extension);
            if (!ri.FS_FileExists(filename))
                break;
            if (++lastScreenShotNumber > 9999)
                break;
        }
        if (lastScreenShotNumber >= 9999)
        {
            ri.Printf(0, "ScreenShot: Couldn't create a file\n");
            return;
        }
        ++lastScreenShotNumber;
    }
    if (type == 1)
        R_TakeScreenshotTga(0, 0, vidConfig.width, vidConfig.height, filename);
    else
        R_TakeScreenshotJpeg(0, 0, vidConfig.width, vidConfig.height, filename);
    if (!silent)
        ri.Printf(0, "Wrote %s\n", filename);
}

// PINNED 100052a0/9: type1 is TGA.
void R_ScreenShot_f()
{
    R_ScreenShotCmd(1);
}

// PINNED 100052b0/9: type0 is JPEG.
void R_ScreenShotJpeg_f()
{
    R_ScreenShotCmd(0);
}
