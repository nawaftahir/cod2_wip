#pragma once

void TextureAxisFromPlane(const float normal[3], float xv[3], float yv[3]);
void TextureVecsForNormal(const float normal[3], float xv[3], float yv[3], int *s, int *t);
void BuildTextureVecs(const float normal[3], const float scale[2], const float shift[2],
                      float rotate, float skew, float texVecs[2][4]);
