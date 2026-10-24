// Sun and flare dvars.
#include "gfx.h"
#include "r_sun_state.h"

// PINNED10764590: four48-byte per-view records.
SunFlareDynamic sunFlareState[4];
typedef char SunFlareLayoutCheck[(sizeof(SunFlareDynamic) == 48
    && offsetof(SunFlareDynamic, lastDot) == 28
    && offsetof(SunFlareDynamic, hitNum) == 32) ? 1 : -1];

void R_FlushSun()
{
    for (int index = 0; index < 4; ++index)
    {
        SunFlareDynamic *flare = &sunFlareState[index];
        flare->currentBlind = 0.0f;
        flare->currentGlare = 0.0f;
        flare->flareIntensity = 0.0f;
        flare->hitNum = 0;
        flare->lastDot = 0.0f;
        flare->lastTime = 0;
        flare->lastVisibility = 0.0f;
    }
}

const dvar_t *r_sunsprite_shader;
const dvar_t *r_sunsprite_size;
const dvar_t *r_sunflare_shader;
const dvar_t *r_sunflare_min_size;
const dvar_t *r_sunflare_min_angle;
const dvar_t *r_sunflare_max_size;
const dvar_t *r_sunflare_max_angle;
const dvar_t *r_sunflare_max_alpha;
const dvar_t *r_sunflare_fadein;
const dvar_t *r_sunflare_fadeout;
const dvar_t *r_sunblind_min_angle;
const dvar_t *r_sunblind_max_angle;
const dvar_t *r_sunblind_max_darken;
const dvar_t *r_sunblind_fadein;
const dvar_t *r_sunblind_fadeout;
const dvar_t *r_sunglare_min_angle;
const dvar_t *r_sunglare_max_angle;
const dvar_t *r_sunglare_max_lighten;
const dvar_t *r_sunglare_fadein;
const dvar_t *r_sunglare_fadeout;
const dvar_t *r_sun_fx_position;

void R_RegisterSunDvars()
{
	r_sunsprite_shader = ri.Dvar_RegisterString("r_sunsprite_shader", "sun", 0x2000);
	r_sunsprite_size = ri.Dvar_RegisterFloat("r_sunsprite_size", 16.0f, 1.0f, 1000.0f, 0x2000);
	r_sunflare_shader = ri.Dvar_RegisterString("r_sunflare_shader", "sun_flare", 0x2000);
	r_sunflare_min_size = ri.Dvar_RegisterFloat("r_sunflare_min_size", 0.0f, 0.0f, 10000.0f, 0x2000);
	r_sunflare_min_angle = ri.Dvar_RegisterFloat("r_sunflare_min_angle", 45.0f, 0.0f, 90.0f, 0x2000);
	r_sunflare_max_size = ri.Dvar_RegisterFloat("r_sunflare_max_size", 2500.0f, 0.0f, 10000.0f, 0x2000);
	r_sunflare_max_angle = ri.Dvar_RegisterFloat("r_sunflare_max_angle", 2.0f, 0.0f, 90.0f, 0x2000);
	r_sunflare_max_alpha = ri.Dvar_RegisterFloat("r_sunflare_max_alpha", 1.0f, 0.0f, 1.0f, 0x2000);
	r_sunflare_fadein = ri.Dvar_RegisterFloat("r_sunflare_fadein", 1.0f, 0.0f, 60.0f, 0x2000);
	r_sunflare_fadeout = ri.Dvar_RegisterFloat("r_sunflare_fadeout", 1.0f, 0.0f, 60.0f, 0x2000);
	r_sunblind_min_angle = ri.Dvar_RegisterFloat("r_sunblind_min_angle", 30.0f, 0.0f, 90.0f, 0x2000);
	r_sunblind_max_angle = ri.Dvar_RegisterFloat("r_sunblind_max_angle", 5.0f, 0.0f, 90.0f, 0x2000);
	r_sunblind_max_darken = ri.Dvar_RegisterFloat("r_sunblind_max_darken", 0.75f, 0.0f, 1.0f, 0x2000);
	r_sunblind_fadein = ri.Dvar_RegisterFloat("r_sunblind_fadein", 0.5f, 0.0f, 60.0f, 0x2000);
	r_sunblind_fadeout = ri.Dvar_RegisterFloat("r_sunblind_fadeout", 3.0f, 0.0f, 60.0f, 0x2000);
	r_sunglare_min_angle = ri.Dvar_RegisterFloat("r_sunglare_min_angle", 30.0f, 0.0f, 90.0f, 0x2000);
	r_sunglare_max_angle = ri.Dvar_RegisterFloat("r_sunglare_max_angle", 5.0f, 0.0f, 90.0f, 0x2000);
	r_sunglare_max_lighten = ri.Dvar_RegisterFloat("r_sunglare_max_lighten", 0.75f, 0.0f, 1.0f, 0x2000);
	r_sunglare_fadein = ri.Dvar_RegisterFloat("r_sunglare_fadein", 0.5f, 0.0f, 60.0f, 0x2000);
	r_sunglare_fadeout = ri.Dvar_RegisterFloat("r_sunglare_fadeout", 3.0f, 0.0f, 60.0f, 0x2000);
	r_sun_fx_position = ri.Dvar_RegisterVec3("r_sun_fx_position", 0.0f, 0.0f, 0.0f, -360.0f, 360.0f, 0x2000);
}

// PINNED 101a5a38: the original21-name save/load list, in registration order.
const char *sunDvarNames[] =
{
    "r_sunsprite_shader", "r_sunsprite_size", "r_sunflare_shader",
    "r_sunflare_min_size", "r_sunflare_min_angle", "r_sunflare_max_size",
    "r_sunflare_max_angle", "r_sunflare_max_alpha", "r_sunflare_fadein",
    "r_sunflare_fadeout", "r_sunblind_min_angle", "r_sunblind_max_angle",
    "r_sunblind_max_darken", "r_sunblind_fadein", "r_sunblind_fadeout",
    "r_sunglare_min_angle", "r_sunglare_max_angle", "r_sunglare_max_lighten",
    "r_sunglare_fadein", "r_sunglare_fadeout", "r_sun_fx_position"
};

typedef char sunFileLayoutCheck[(sizeof(sunflare_t) == 96 &&
    offsetof(sunflare_t, spriteMaterial) == 4 && offsetof(sunflare_t, flareMaterial) == 8 &&
    offsetof(sunflare_t, flareFadeInTime) == 36 && offsetof(sunflare_t, sunFxPosition) == 84 &&
    offsetof(GfxWorld, sun) == 0x160 && sizeof(sunDvarNames) / sizeof(sunDvarNames[0]) == 21) ? 1 : -1];

Material *Material_Register(const char *name, int imageTrack);
extern const dvar_t *sv_cheats;
void R_LoadSunThroughDvars(const char *name, sunflare_t *sun);

// PINNED 10028cd0/826: half-size flares, float radians and existing biased rounding.
void R_SetSunFromDvars(sunflare_t *sun)
{
    const char *name = r_sunsprite_shader->current.string;
    sun->spriteMaterial = name[0] ? Material_Register(name, 6) : rgp.defaultMaterial;
    sun->spriteSize = r_sunsprite_size->current.value;
    name = r_sunflare_shader->current.string;
    sun->flareMaterial = name[0] ? Material_Register(name, 6) : rgp.defaultMaterial;
    sun->flareMinSize = r_sunflare_min_size->current.value * 0.5f;
    sun->flareMinDot = (float)cos(r_sunflare_min_angle->current.value * 0.017453292f);
    sun->flareMaxSize = r_sunflare_max_size->current.value * 0.5f;
    sun->flareMaxDot = (float)cos(r_sunflare_max_angle->current.value * 0.017453292f);
    sun->flareMaxAlpha = r_sunflare_max_alpha->current.value;
    sun->flareFadeInTime = I_fround(r_sunflare_fadein->current.value * 1000.0f);
    sun->flareFadeOutTime = I_fround(r_sunflare_fadeout->current.value * 1000.0f);
    sun->blindMinDot = (float)cos(r_sunblind_min_angle->current.value * 0.017453292f);
    sun->blindMaxDot = (float)cos(r_sunblind_max_angle->current.value * 0.017453292f);
    sun->blindMaxDarken = r_sunblind_max_darken->current.value;
    sun->blindFadeInTime = I_fround(r_sunblind_fadein->current.value * 1000.0f);
    sun->blindFadeOutTime = I_fround(r_sunblind_fadeout->current.value * 1000.0f);
    sun->glareMinDot = (float)cos(r_sunglare_min_angle->current.value * 0.017453292f);
    sun->glareMaxDot = (float)cos(r_sunglare_max_angle->current.value * 0.017453292f);
    sun->glareMaxLighten = r_sunglare_max_lighten->current.value;
    sun->glareFadeInTime = I_fround(r_sunglare_fadein->current.value * 1000.0f);
    sun->glareFadeOutTime = I_fround(r_sunglare_fadeout->current.value * 1000.0f);
    AngleVectors(r_sun_fx_position->current.vector, sun->sunFxPosition, 0, 0);
    sun->hasValidData = 1;
}

// PINNED 10029010/122: argument count, cheats and loaded world are checked in order.
void R_LoadSun_f()
{
    if (ri.Cmd_Argc() != 2)
        ri.Printf(0, "USAGE: r_loadsun <sunname>\n  sunname must not have an extension\n");
    else if (!sv_cheats->current.enabled)
        ri.Printf(0, "You must have cheats enabled to use r_loadsun\n");
    else if (!rgp.world)
        ri.Printf(0, "You can't r_loadsun while a map isn't loaded\n");
    else
        R_LoadSunThroughDvars(ri.Cmd_Argv(1), &rgp.world->sun);
}

// PINNED 10029080/101: only a successful dvar serialization writes the file.
void R_SaveSun(const char *name)
{
    char buffer[8192];
    if (ri.Com_SaveDvarsToBuffer(sunDvarNames, 21, buffer, sizeof(buffer)))
    {
        int length = strlen(buffer);
        ri.FS_WriteFile(va("sun/%s.sun", name), buffer, length);
    }
}

// PINNED 100290f0/46: saving does not require cheats or a loaded world.
void R_SaveSun_f()
{
    if (ri.Cmd_Argc() != 2)
    {
        ri.Printf(0, "USAGE: r_savesun <sunname>\n  sunname must not have an extension\n");
        return;
    }
    R_SaveSun(ri.Cmd_Argv(1));
}
