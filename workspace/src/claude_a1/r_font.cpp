// Font registry.
#include "a1.h"
#include <string.h>

static int registeredFontCount;
static Font_s *registeredFont[16];

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
