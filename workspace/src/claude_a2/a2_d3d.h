// Worker a2 declarations for Direct3D TUs (never mixed with gfx.h).
#pragma once
#include "r_local.h"
#include <stdio.h>
#include <string.h>

// opencod2 layout; only current (+8) is relied on.
union DvarValue
{
    Bool enabled;
    int integer;
    float value;
    float *vector;
    const char *string;
    byte color[4];
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
    byte type;
    Bool modified;
    DvarValue current;
    DvarValue latched;
    DvarValue reset;
    DvarLimits domain;
    dvar_s *next;
    dvar_s *hashNext;
};

struct r_logfile_globals_t
{
    FILE *fp;
};

extern const dvar_t *r_logFile;
extern r_logfile_globals_t r_logFileGlob;
extern int alwaysfails;

bool RB_IsLogging();
void RB_LogPrint(const char *text);
