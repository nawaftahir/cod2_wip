/* Retail-exact reconstruction of R_NoiseInit (89 B) from original code behavior.
 * The original TU boundary and two related noise routines remain unverified.
 * Historical reference: id-Software/Quake-III-Arena, code/renderer/tr_noise.c
 * (GPL-2.0-or-later); this numeric permutation conversion is retail-specific.
 */
#include <stdlib.h>

static int s_noiseIndex[256];
static float s_noiseValue[256];

extern "C" void FUN_004944d0(void)
{
    for (int i = 0; i < 256; ++i)
    {
        float r = (float)rand();
        s_noiseValue[i] = (r / 32767.0f + r / 32767.0f) - 1.0;
        int x = rand() * 256;
        s_noiseIndex[i] = (unsigned char)(x / 32768);
    }
}
