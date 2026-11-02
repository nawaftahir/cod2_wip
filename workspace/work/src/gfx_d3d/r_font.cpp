// Font registry.
#include "gfx.h"
#include "r_font.h"
#include <string.h>

static int registeredFontCount;
static Font_s *registeredFont[16];

// PINNED in 10013080: keep stale entries; the count owns their visibility.
void R_ShutdownFonts()
{
    registeredFontCount = 0;
}

Material *Material_Register(const char *name, int imageTrack);

Font_s *R_LoadFont(const char *name, int imageTrack);

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

Glyph *R_GetCharacterGlyph(Font_s *font, unsigned int letter)
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

// PINNED 1000c0f0: the cap counts input entries, not expanded color bytes.
static const short *R_GetConsoleString(const short *string, int *limit, char *text,
    float *color, Bool *foundIcon)
{
    if (*limit > 1023)
        *limit = 1023;
    text[0] = 0;
    *foundIcon = 0;
    int currentColor = 7;
    int markedEnd = -1;
    int pos = 0;
    int index = 0;
    const short *next = 0;
    for (; index < *limit; ++index)
    {
        unsigned short entry = (unsigned short)string[index];
        unsigned int type = entry >> 8;
        if (type != (unsigned int)currentColor)
        {
            if (type == 13 || type == 16 || type == 17 || type == 18)
            {
                next = string + index;
                markedEnd = -1;
                *foundIcon = 1;
                break;
            }
            if (type == 10 || type == 11 || type == 12)
            {
                if (color)
                    color[type - 10] = (float)(entry & 255) * 0.003921568859368563f;
                continue;
            }
            text[pos++] = '^';
            text[pos++] = (char)(type + '0');
            currentColor = type;
        }
        char ch = (char)string[index];
        text[pos] = ch;
        if (ch == ' ')
        {
            if (markedEnd == -1)
                markedEnd = pos;
        }
        else
            markedEnd = -1;
        ++pos;
    }
    text[pos] = 0;
    if (markedEnd >= 0)
        text[markedEnd] = 0;
    *limit -= index;
    return next;
}

typedef char consoleIconImportCheck[(offsetof(refimport_t, CL_GetHudMsgIconMaterialName) == 0x2a0) ? 1 : -1];

// PINNED 1000c250: only a material entry consumes the icon and updates the limit.
static const short *R_GetConsoleIcon(const short *string, int *limit, float *width,
    float *height, Material **material, float *color, Bool *horzFlip)
{
    *width = 1.0f;
    *height = 1.0f;
    *material = 0;
    if (horzFlip)
        *horzFlip = 0;
    for (int index = 0; index < *limit; ++index)
    {
        unsigned short entry = (unsigned short)string[index];
        int value = entry & 255;
        switch (entry >> 8)
        {
        case 13:
        case 14:
        case 15:
            if (color)
                color[(entry >> 8) - 13] = (float)value * 0.003921568859368563f;
            break;
        case 16:
            *width = (float)value * *width * 0.03125f;
            break;
        case 17:
            *height = (float)value * *height * 0.03125f;
            break;
        case 18:
        {
            const char *name = ri.CL_GetHudMsgIconMaterialName(value);
            *material = name[0] ? Material_Register(name, 7) : rgp.defaultMaterial;
            *limit -= index + 1;
            return string + index + 1;
        }
        case 19:
            *width = (float)value * *width * 0.03125f;
            if (horzFlip)
                *horzFlip = 1;
            break;
        }
    }
    return 0;
}

// PINNED 1000c390: icon width is added in its original unscaled units.
int R_ConsoleTextWidth(const short *string, int maxChars, Font_s *font)
{
    float width = 0.0f;
    while (string)
    {
        char text[1024];
        Bool foundIcon;
        string = R_GetConsoleString(string, &maxChars, text, 0, &foundIcon);
        width += (float)R_TextWidth(text, maxChars, font);
        if (foundIcon)
        {
            float iconWidth, iconHeight;
            Material *material;
            string = R_GetConsoleIcon(string, &maxChars, &iconWidth, &iconHeight, &material, 0, 0);
            width += iconWidth;
        }
    }
    return (int)width;
}

void R_AddCmdDrawStretchPic(float x, float y, float w, float h,
    float s0, float t0, float s1, float t1, const float *color, Material *material);

// PINNED 1000c4b0: update the text offset only when an icon follows it.
void R_DrawConsoleText(const short *string, int maxChars, Font_s *font, float x,
    float y, float xScale, float yScale, const float *color, int style)
{
    float currentColor[4];
    memcpy(currentColor, color, sizeof(currentColor));
    float xOfs = 0.0f;
    while (string)
    {
        char text[1024];
        Bool foundIcon;
        string = R_GetConsoleString(string, &maxChars, text, currentColor, &foundIcon);
        if (text[0])
        {
            R_AddCmdDrawText(text, 0x7fffffff, font, xOfs + x, y, xScale, yScale, currentColor, style);
            if (foundIcon)
                xOfs += (float)R_TextWidth(text, maxChars, font) * xScale;
        }
        if (foundIcon)
        {
            float iconWidth, iconHeight;
            Material *material;
            Bool horzFlip;
            string = R_GetConsoleIcon(string, &maxChars, &iconWidth, &iconHeight,
                &material, currentColor, &horzFlip);
            float fontHeight = (float)font->pixelHeight;
            iconWidth = iconWidth * fontHeight * xScale;
            iconHeight = iconHeight * fontHeight * yScale;
            float iconY = y - (fontHeight * yScale * 0.8f + iconHeight) * 0.5f;
            float iconX = xOfs + x;
            R_AddCmdDrawStretchPic(iconX, iconY, iconWidth, iconHeight,
                horzFlip ? 1.0f : 0.0f, 0.0f, horzFlip ? 0.0f : 1.0f, 1.0f,
                currentColor, material);
            xOfs += iconWidth;
        }
    }
}
