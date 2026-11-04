// Worker a1 declarations for Direct3D TUs (never mixed with gfx.h).
#pragma once
#include "r_local.h"

// opencod2 layout; only current (+8) is relied on.
union DvarValue
{
    Bool enabled;
    int integer;
    float value;
    float *vector;
    const char *string;
    unsigned char color[4];
};

union DvarLimits
{
    struct { int stringCount; const char **strings; } enumeration;
    struct { int min; int max; } integer;
    struct { float min; float max; } value;
    struct { float min; float max; } vector;
};

struct dvar_s
{
    const char *name;
    unsigned short flags;
    unsigned char type;
    Bool modified;
    DvarValue current;
    DvarValue latched;
    DvarValue reset;
    DvarLimits domain;
    dvar_s *next;
    dvar_s *hashNext;
};

// opencod2 layout; PINNED maxTextureSize..deviceSupportsGamma (vidConfig 0x101d4c6c, R_StoreDirect3DCaps).
struct vidConfig_t
{
    int width;
    int height;
    int displayFrequency;
    int isFullscreen;
    float aspectRatioWindow;
    float aspectRatioPixel;
    int maxTextureSize;
    int maxTextureMaps;
    int maxTextureCoords;
    int maxActiveLights;
    Bool deviceSupportsGamma;
};

extern vidConfig_t vidConfig;

extern const dvar_t *r_aaSamples;
extern const dvar_t *vid_xpos;
extern const dvar_t *vid_ypos;
extern const dvar_t *r_fullscreen;
extern const dvar_t *r_monitor;
extern const dvar_t *r_rendererPreference;
extern const dvar_t *r_rendererInUse;
extern const dvar_t *r_mode;
extern const dvar_t *r_displayRefresh;

void R_Error(errorParm_t code, const char *fmt, ...);
char *va(const char *format, ...);

int R_CheckDxCaps(const D3DCAPS9 *caps);
