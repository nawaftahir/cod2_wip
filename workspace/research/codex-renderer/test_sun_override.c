#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include "src/sun_override.c"

unsigned char *renderer_world;
const unsigned char *renderer_in_use_dvar;

int main(void)
{
    int dvar[3];
    float color[3];
    float saved[3];
    unsigned char before[12];

    renderer_world = (unsigned char *)calloc(1, 0x100);
    assert(renderer_world != 0);
    memset(dvar, 0, sizeof(dvar));
    renderer_in_use_dvar = (const unsigned char *)dvar;
    color[0] = -0.0f;
    color[1] = 1.5f;
    color[2] = 3.0f;
    saved[0] = 0.25f;
    saved[1] = 0.5f;
    saved[2] = 0.75f;
    memcpy(renderer_world + 0xe0, saved, sizeof(saved));
    R_SetSunLightOverride(color);
    assert(memcmp(renderer_world + 0xc8, color, sizeof(color)) == 0);
    memcpy(before, renderer_world + 0xc8, sizeof(before));
    dvar[2] = 2;
    color[0] = 42.0f;
    R_SetSunLightOverride(color);
    assert(memcmp(renderer_world + 0xc8, before, sizeof(before)) == 0);
    R_ResetSunLightOverride();
    assert(memcmp(renderer_world + 0xc8, saved, sizeof(saved)) == 0);
    free(renderer_world);
    return 0;
}
