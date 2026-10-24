// Renderer-side thread value lookup.
#include "../gfx_d3d/r_local.h"

void *Sys_GetValue(int valueIndex)
{
    return ri.Sys_GetValue(valueIndex);
}
