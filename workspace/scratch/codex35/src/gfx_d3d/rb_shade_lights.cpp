// SUPPORTED Mac name; PINNED PC body1003a1a0/402 and D3D9 light slots.
#include "r_local.h"
#include "rb_tess.h"
#include <universal/com_math.h>

int RB_DeriveEntityLights(vec4_t *colorForDir, float sunVisibility,
    const Material *material, D3DLIGHT9 *lights, int maxLights);

void RB_SetEntityHwLightsDx7(vec4_t *colorForDir, float sunVisibility)
{
    D3DLIGHT9 lights[8];
    int lightCount = RB_DeriveEntityLights(colorForDir, sunVisibility,
        tess.material, lights, 8);
    int lightIndex;
    for (lightIndex = 0; lightIndex < lightCount; ++lightIndex)
    {
        R_DX_CALL(dx.device->LightEnable( lightIndex, 1 ));
        R_DX_CALL(dx.device->SetLight( lightIndex, &lights[lightIndex] ));
    }
    for (; (unsigned int)lightIndex < 8; ++lightIndex)
        R_DX_CALL(dx.device->LightEnable( lightIndex, 0 ));
}
