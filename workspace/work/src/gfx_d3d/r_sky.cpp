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
