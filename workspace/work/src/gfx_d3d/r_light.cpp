// Light definition loading and registry.
#include "r_local.h"
#include "r_light.h"

GfxLightDef *R_LoadLightDef(const char *name);

// PINNED 101d7eb0: one count followed by64 definition pointers.
struct LightGlobals
{
    int count;
    GfxLightDef *defs[64];
};
static LightGlobals lightGlobals;
typedef char lightGlobalsLayoutCheck[(sizeof(LightGlobals) == 260 &&
    offsetof(LightGlobals, defs) == 4) ? 1 : -1];

// PINNED in 10013080: the definition pointers are not cleared here.
void R_ShutdownLightDefs()
{
    lightGlobals.count = 0;
}

// PINNED 10014c60/243: fallback is the registered default, not a missing-name alias.
GfxLightDef *R_RegisterLightDef(const char *name)
{
    for (;;)
    {
        for (int index = 0; index < lightGlobals.count; ++index)
            if (!_stricmp(name, lightGlobals.defs[index]->name))
                return lightGlobals.defs[index];
        if (lightGlobals.count == 64)
        {
            ri.Printf(0, "Loaded light defs:\n");
            for (int index = 0; index < lightGlobals.count; ++index)
                ri.Printf(0, "%s\n", lightGlobals.defs[index]->name);
            // PINNED original call omits the name argument required by its format.
            R_Error(ERR_DROP, "Can't load light def %s; %i unique light defs already loaded", lightGlobals.count);
        }
        GfxLightDef *definition = R_LoadLightDef(name);
        if (definition)
        {
            lightGlobals.defs[lightGlobals.count] = definition;
            ++lightGlobals.count;
            return definition;
        }
        if (!_stricmp(name, "light_dynamic"))
            R_Error(ERR_DROP, "Can't load the default light def '%s'", name);
        name = "light_dynamic";
    }
}
