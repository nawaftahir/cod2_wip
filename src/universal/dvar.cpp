#include "dvar.h"
#include <stdlib.h>
#include <stdio.h>
#include <float.h>

extern "C" {

static dvar_t *dvarHashTable[FILE_HASH_SIZE];

__declspec(dllimport) void __stdcall DebugBreak(void);
int AssertFailed(const char *expr, const char *file, int line, int a4, int a5);
char *va(const char *format, ...);
int tolower(int c);
void Com_Error(int code, const char *fmt, ...);
int I_strcmp(const char *s1, const char *s2);

static int generateHashValue(const char *fname)
{
    int i;
    int hash;
    int letter;

    if (!fname)
        Com_Error(1, "null name in generateHashValue");

    hash = 0;
    i = 0;

    while (fname[i] != '\0')
    {
        letter = tolower(fname[i]);
        hash += letter * (i + 119);
        i++;
    }
    
    return hash & (FILE_HASH_SIZE - 1);
}

static __forceinline dvar_t *Dvar_FindVar(const char *dvarName)
{
    int hash = generateHashValue(dvarName);
    dvar_t *dvar;
    for (dvar = dvarHashTable[hash]; dvar; dvar = dvar->hashNext)
    {
        if (!I_strcmp(dvarName, dvar->name))
            break;
    }
    return dvar;
}

#define Assert(expr) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, "\\trees\\cod2src\\src\\universal\\dvar.cpp", __LINE__, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

#define AssertMsg1(expr, line, fmt, a1) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(va("%s\n\t" fmt, #expr, a1), "\\trees\\cod2src\\src\\universal\\dvar.cpp", line, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)


extern int g_assertsDisabled;

#define AssertFatalMsg(expr, line, fmt, a1) \
    do { \
        static char s_assertDisable; \
        if (!g_assertsDisabled && !s_assertDisable) { \
            switch (AssertFailed(va(fmt, a1), "\\trees\\cod2src\\src\\universal\\dvar.cpp", line, 1, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

static const char *Dvar_ValueToString(const dvar_t *dvar, DvarValue value)
{
    switch (dvar->type)
    {
    case DVAR_TYPE_BOOL:
        return value.boolean ? "1" : "0";
    case DVAR_TYPE_INT:
        return va("%i", value.integer);
    case DVAR_TYPE_FLOAT:
        return va("%g", value.decimal);
    case DVAR_TYPE_VEC2:
        return va("%g %g", value.vector[0], value.vector[1]);
    case DVAR_TYPE_VEC3:
        return va("%g %g %g", value.vector[0], value.vector[1], value.vector[2]);
    case DVAR_TYPE_VEC4:
        return va("%g %g %g %g", value.vector[0], value.vector[1], value.vector[2], value.vector[3]);
    case DVAR_TYPE_COLOR:
        return va("%g %g %g %g",
                  (float)value.color[0] * (1.0f / 255.0f),
                  (float)value.color[1] * (1.0f / 255.0f),
                  (float)value.color[2] * (1.0f / 255.0f),
                  (float)value.color[3] * (1.0f / 255.0f));
    case DVAR_TYPE_ENUM:
        AssertMsg1(value.integer >= 0 && value.integer < dvar->domain.enumeration.stringCount || value.integer == 0,
                   315, "(value.integer) = %i", value.integer);
        if (dvar->domain.enumeration.stringCount)
            return dvar->domain.enumeration.strings[value.integer];
        return "";
    case DVAR_TYPE_STRING:
        AssertMsg1(value.string, 321, "%s", va("%s", dvar->name));
        return va("%s", value.string);
    default:
        AssertFatalMsg(0, 326, "unhandled dvar type '%i'", dvar->type);
        return "";
    }
}


#define AssertAt(expr, line) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, "\\trees\\cod2src\\src\\universal\\dvar.cpp", line, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

static bool Dvar_StringToBool(const char *string)


{
    AssertAt(string, 334);
    return atol(string) != 0;
}

static int Dvar_StringToInt(const char *string)
{
    AssertAt(string, 341);
    return atol(string);
}

static float Dvar_StringToFloat(const char *string)
{
    AssertAt(string, 348);
    return (float)atof(string);
}

static void __declspec(noinline) Dvar_ClampVectorToDomain(float *vector, int components, float min, float max)
{
    int channel;

    for (channel = 0; channel < components; channel++)
    {
        if (vector[channel] < min)
            vector[channel] = min;
        else if (vector[channel] > max)
            vector[channel] = max;
    }
}

typedef void Dvar_ClampVectorToDomain_keep_fp(float *, float, float);

static void Dvar_ClampVectorToDomain_keepalive(float *vector, float min, float max)
{
    Dvar_ClampVectorToDomain(vector, 3, min, max);
}

Dvar_ClampVectorToDomain_keep_fp *dvar_keep_0048ccd0 = &Dvar_ClampVectorToDomain_keepalive;

static bool __declspec(noinline) Dvar_VectorInDomain(const float *vector, int components, float min, float max)
{
    int channel;

    for (channel = 0; channel < components; channel++)
    {
        if (vector[channel] < min)
            return false;
        if (vector[channel] > max)
            return false;
    }

    return true;
}

typedef bool Dvar_VectorInDomain_keep_fp(const float *, float, float);

static bool Dvar_VectorInDomain_keepalive(const float *vector, float min, float max)
{
    return Dvar_VectorInDomain(vector, 3, min, max);
}

Dvar_VectorInDomain_keep_fp *dvar_keep_0048cd10 = &Dvar_VectorInDomain_keepalive;

static void __declspec(noinline) Dvar_VectorDomainToString(int components, DvarLimits domain, char *outBuffer, int outBufferLen)
{
    if (domain.decimal.min != -FLT_MAX)
    {
        if (domain.decimal.max != FLT_MAX)
            _snprintf(outBuffer, outBufferLen, "Domain is any %iD vector with components from %g to %g", components, domain.decimal.min, domain.decimal.max);
        else
            _snprintf(outBuffer, outBufferLen, "Domain is any %iD vector with components %g or bigger", components, domain.decimal.min);
    }
    else
    {
        if (domain.decimal.max != FLT_MAX)
            _snprintf(outBuffer, outBufferLen, "Domain is any %iD vector with components %g or smaller", components, domain.decimal.max);
        else
            _snprintf(outBuffer, outBufferLen, "Domain is any %iD vector", components);
    }
}

typedef void Dvar_VectorDomainToString_keep_fp(char *, int, float, float);

static void Dvar_VectorDomainToString_keepalive(char *outBuffer, int outBufferLen, float min, float max)
{
    DvarLimits domain;

    domain.decimal.min = min;
    domain.decimal.max = max;
    Dvar_VectorDomainToString(2, domain, outBuffer, outBufferLen);
}

Dvar_VectorDomainToString_keep_fp *dvar_keep_0048d2c0 = &Dvar_VectorDomainToString_keepalive;

bool Dvar_GetBool(const char *dvarName)
{
    dvar_t *dvar = Dvar_FindVar(dvarName);
    if (!dvar)
        return false;

    AssertMsg1(dvar->type == DVAR_TYPE_BOOL || (dvar->type == DVAR_TYPE_STRING && (dvar->flags & DVAR_EXTERNAL)), 1122, "(dvar->type) = %i", dvar->type);

    if (dvar->type == DVAR_TYPE_BOOL)
        return dvar->current.boolean;

    return Dvar_StringToBool(dvar->current.string);
}

int Dvar_GetInt(const char *dvarName)
{
    dvar_t *dvar = Dvar_FindVar(dvarName);
    if (!dvar)
        return 0;

    AssertMsg1(dvar->type == DVAR_TYPE_INT || dvar->type == DVAR_TYPE_ENUM || (dvar->type == DVAR_TYPE_STRING && (dvar->flags & DVAR_EXTERNAL)), 1138, "(dvar->type) = %i", dvar->type);

    if (dvar->type == DVAR_TYPE_INT || dvar->type == DVAR_TYPE_ENUM)
        return dvar->current.integer;

    return Dvar_StringToInt(dvar->current.string);
}

float Dvar_GetFloat(const char *dvarName)
{
    dvar_t *dvar = Dvar_FindVar(dvarName);
    if (!dvar)
        return 0.0f;

    AssertMsg1(dvar->type == DVAR_TYPE_FLOAT || (dvar->type == DVAR_TYPE_STRING && (dvar->flags & DVAR_EXTERNAL)), 1154, "(dvar->type) = %i", dvar->type);

    if (dvar->type == DVAR_TYPE_FLOAT)
        return dvar->current.decimal;

    return Dvar_StringToFloat(dvar->current.string);
}

const char *Dvar_EnumToString(const dvar_t *dvar);


const char *Dvar_GetString(const char *dvarName)
{
    dvar_t *dvar = Dvar_FindVar(dvarName);
    if (!dvar)
        return "";

    AssertMsg1(dvar->type == DVAR_TYPE_STRING || dvar->type == DVAR_TYPE_ENUM, 1218, "(dvar->type) = %i", dvar->type);

    if (dvar->type == DVAR_TYPE_ENUM)
        return Dvar_EnumToString(dvar);

    return dvar->current.string;
}

void Com_Printf(int channel, const char *fmt, ...);
int _snprintf(char *buffer, size_t count, const char *format, ...);

bool Com_SaveDvarsToBuffer(const char **dvarnames, int numDvars, char *buffer, int bufsize)
{
    Com_Printf(0, "Com_SaveDvarsToBuffer not handled");

    for (int i = 0; i < numDvars; i++)
    {
        dvar_t *dvar = Dvar_FindVar(dvarnames[i]);
        if (!dvar)
        {
            AssertAt(dvar, 2555);
            AssertAt(dvar, 499);
        }
        const char *valueString = Dvar_ValueToString(dvar, dvar->current);
        int len = _snprintf(buffer, bufsize, "%s \"%s\"\n", dvar->name, valueString);
        if (len < 0)
            return false;
        buffer += len;
        bufsize -= len;
    }
    return true;
}

const char *Dvar_GetVariantString(const char *dvarName)
{
    dvar_t *dvar = Dvar_FindVar(dvarName);
    if (!dvar)
        return "";

    return Dvar_ValueToString(dvar, dvar->current);
}

#define DVAR_CHANGEABLE_RESET 0x1000

static void __declspec(noinline) Dvar_UpdateRegistration(dvar_t *dvar, const char *dvarName, unsigned char type, unsigned short flags, DvarValue resetValue, DvarLimits domain)
{
    if (flags & DVAR_EXTERNAL)
        return;

    if ((flags & DVAR_CHANGEABLE_RESET) && !(dvar->flags & DVAR_CHANGEABLE_RESET))
    {
        dvar->name = dvarName;
        if (dvar->type == DVAR_TYPE_ENUM)
            dvar->domain = domain;
    }
}

typedef void Dvar_UpdateRegistration_fp(dvar_t *, const char *, unsigned char, unsigned short, DvarValue, DvarLimits);

static void Dvar_UpdateRegistration_keepalive(dvar_t *dvar, const char *dvarName, unsigned char type, unsigned short flags, DvarValue resetValue, DvarLimits domain)
{
    Dvar_UpdateRegistration(dvar, dvarName, type, flags, resetValue, domain);
    if (domain.enumeration.stringCount == 12345)
        dvar->modified = true;
}

Dvar_UpdateRegistration_fp *dvar_keep_0048f240 = &Dvar_UpdateRegistration_keepalive;

}
