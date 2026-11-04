#include <assert.h>
#include <math.h>
#include <string.h>
#include "src/font_metrics.c"
#include "src/visibility_config.c"

float renderer_cull_distance;

int main(void)
{
    int font[2];
    float negative_zero;
    unsigned int bits;

    font[0] = 0;
    font[1] = 24;
    assert(R_TextHeight(font) == 24);
    R_SetCullDist(123.5f);
    assert(renderer_cull_distance == 123.5f);
    R_SetCullDist(-1.0f);
    assert(renderer_cull_distance == 0.0f);
    bits = 0x80000000u;
    memcpy(&negative_zero, &bits, sizeof(bits));
    R_SetCullDist(negative_zero);
    memcpy(&bits, &renderer_cull_distance, sizeof(bits));
    assert(bits == 0);
    R_SetCullDist(NAN);
    assert(isnan(renderer_cull_distance));
    return 0;
}
