// Font records shared with backend drawing; storage and lookup stay in r_font.
#pragma once
#ifndef GFX_OC_TYPES
struct Material;
struct Glyph
{
    unsigned short letter;
    signed char x0, y0;
    unsigned char dx, pixelWidth, pixelHeight;
    float s0, t0, s1, t1;
};
struct Font_s
{
    const char *name;
    int pixelHeight, glyphCount;
    Material *material;
    Glyph *glyphs;
};
#endif
Glyph *R_GetCharacterGlyph(Font_s *font, unsigned int letter);
