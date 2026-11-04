#include <assert.h>
#include "src/renderer_state.c"

int renderer_min_spec_image_memory;
unsigned char renderer_ignore_precache_errors;

int main(void)
{
    renderer_min_spec_image_memory = 64;
    assert(R_GetMinSpecImageMemory() == 64);
    R_SetIgnorePrecacheErrors(0);
    assert(R_GetIgnorePrecacheErrors() == 0);
    R_SetIgnorePrecacheErrors(256);
    assert(renderer_ignore_precache_errors == 1);
    R_SetIgnorePrecacheErrors(-1);
    assert(R_GetIgnorePrecacheErrors() == 1);
    renderer_ignore_precache_errors = 255;
    assert(R_GetIgnorePrecacheErrors() == 1);
    return 0;
}
