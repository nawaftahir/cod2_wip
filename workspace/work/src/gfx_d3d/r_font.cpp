// Font registry.
#include "gfx.h"
#include <string.h>

static int registeredFontCount;
static Font_s *registeredFont[16];

// PINNED in 10013080: keep stale entries; the count owns their visibility.
void R_ShutdownFonts()
{
    registeredFontCount = 0;
}

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

// PINNED 1000bce0: this uses the same registry as font duplication.
Font_s *R_RegisterFont(const char *name, int imageTrack)
{
    for (int index = 0; index < registeredFontCount; ++index)
        if (!I_stricmp(name, registeredFont[index]->name))
            return registeredFont[index];
    if (registeredFontCount >= 16)
    {
        R_Error(ERR_DROP, "R_RegisterFont: Too many fonts registered already.\n");
        return 0;
    }
    Font_s *font = R_LoadFont(name, imageTrack);
    if (!font)
        R_Error(ERR_DROP, "R_RegisterFont: Error while reading font '%s'", name);
    registeredFont[registeredFontCount] = font;
    ++registeredFontCount;
    return font;
}

void R_DuplicateFont(Font_s *fontCopy, const char *name)
{
    int fontIndex;
    Font_s *font;
    const char *oldName;
    char *nameCopy;

    for (fontIndex = 0; fontIndex < registeredFontCount; fontIndex++)
    {
        font = registeredFont[fontIndex];
        if (!I_stricmp(name, font->name))
        {
            oldName = font->name;
            *font = *fontCopy;
            font->name = oldName;
            return;
        }
    }
    if (registeredFontCount >= 16)
    {
        R_Error(ERR_DROP, "R_DuplicateFont: Too many fonts registered already.\n");
        return;
    }
    font = (Font_s *)ri.Hunk_AllocInternal(sizeof(Font_s));
    *font = *fontCopy;
    nameCopy = (char *)ri.Hunk_AllocInternal(strlen(name) + 1);
    strcpy(nameCopy, name);
    font->name = nameCopy;
    registeredFont[fontIndex] = font;
    registeredFontCount++;
}

static Glyph *R_GetCharacterGlyph(Font_s *font, unsigned int letter)
{
    int top;
    int bottom;
    int mid;

    if (letter >= 0x20 && letter <= 0x7F)
        return &font->glyphs[letter - 0x20];
    top = font->glyphCount - 1;
    bottom = 0x60;
    while (bottom <= top)
    {
        mid = (top + bottom) / 2;
        if (font->glyphs[mid].letter == letter)
            return &font->glyphs[mid];
        if (font->glyphs[mid].letter < letter)
            bottom = mid + 1;
        else
            top = mid - 1;
    }
    return &font->glyphs[14];
}

float R_NormalizedTextScale(Font_s *font, float scale)
{
    return scale * 48.0f / font->pixelHeight;
}

int R_TextWidth(const char *text, int maxChars, Font_s *font)
{
    int maxWidth;
    int lineWidth;
    int count;
    unsigned int letter;
    Glyph *glyph;

    lineWidth = 0;
    maxWidth = 0;
    if (maxChars <= 0)
        maxChars = 0x7FFFFFFF;
    count = 0;
    while (*text && count < maxChars)
    {
        letter = ri.SEH_ReadCharFromString(&text, 0);
        if (letter == '\n')
        {
            lineWidth = 0;
            continue;
        }
        if (letter == '^' && text && *text != '^' && *text >= '0' && *text <= '9')
        {
            text++;
            continue;
        }
        glyph = R_GetCharacterGlyph(font, letter);
        lineWidth += glyph->dx;
        if (maxWidth < lineWidth)
            maxWidth = lineWidth;
        count++;
    }
    return maxWidth;
}

int R_TextHeight(Font_s *font)
{
    return font->pixelHeight;
}

void R_AddCmdDrawTextWithCursor(const char *text, int maxChars, FontHandle font, float x, float y, float xScale, float yScale, const vec_t *color, int style, int cursorPos, char cursor);

void R_AddCmdDrawText(const char *text, int maxChars, FontHandle font, float x, float y, float xScale, float yScale, const vec_t *color, int style)
{
    R_AddCmdDrawTextWithCursor(text, maxChars, font, x, y, xScale, yScale, color, style, -1, 0);
}
