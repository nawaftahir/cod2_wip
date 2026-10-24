// Font file loading.
#include "gfx.h"
#include <string.h>

Material *Material_Register(const char *name, int imageTrack);

// PINNED 1000c6a0: the disk header omits the runtime glyph pointer.
struct FontFileHeader
{
    unsigned int nameOffset;
    int pixelHeight, glyphCount;
    unsigned int materialOffset;
};
typedef char fontFileLayoutCheck[(sizeof(FontFileHeader) == 16 && sizeof(Font_s) == 20
    && sizeof(Glyph) == 24 && offsetof(Font_s, glyphs) == 16
    && offsetof(refimport_t, FS_FOpenFileRead) == 0x13c
    && offsetof(refimport_t, FS_FCloseFile) == 0x154
    && offsetof(refimport_t, FS_Read) == 0x158
    && offsetof(r_global_permanent_t, defaultMaterial) == 0x102c) ? 1 : -1];

Font_s *R_LoadFont(const char *name, int imageTrack)
{
    fileHandle_t file;
    int length = ri.FS_FOpenFileRead(name, &file, 1);
    if (length < 0)
    {
        if (length == -2)
            Com_Printf("^1ERROR: Couldn't find font in iwd files or localized directories '%s'\n", name);
        else
            Com_Printf("^1ERROR: Couldn't find font '%s'\n", name);
        return 0;
    }
    if (length < 16)
    {
        ri.FS_FCloseFile(file);
        Com_Printf("^1ERROR: Font file '%s' too small\n", name);
        return 0;
    }
    Font_s *font = (Font_s *)ri.Hunk_AllocInternal(length + 4);
    ri.FS_Read(font, 16, file);
    ri.FS_Read(font + 1, length - 16, file);
    ri.FS_FCloseFile(file);
    const FontFileHeader *header = (const FontFileHeader *)font;
    const char *materialName = (const char *)font + header->materialOffset + 4;
    font->glyphs = (Glyph *)(font + 1);
    font->name = (const char *)font + header->nameOffset + 4;
    font->material = materialName[0] ? Material_Register(materialName, imageTrack) : rgp.defaultMaterial;
    return font;
}
