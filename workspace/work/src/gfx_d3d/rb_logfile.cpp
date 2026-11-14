// Direct3D call logging.
#include "r_local.h"
#include <time.h>

r_logfile_globals_t r_logFileGlob;

// PINNED 100377f0/29, uncalled copy; name from KisakCOD rb_logfile.cpp.
void RB_CloseLogFile()
{
    if (r_logFileGlob.fp)
    {
        fclose(r_logFileGlob.fp);
        r_logFileGlob.fp = 0;
    }
}

static void RB_OpenLogFile()
{
    time_t aclock;
    struct tm *newtime;

    if (!r_logFileGlob.fp)
    {
        r_logFileGlob.fp = fopen("dx.log", "wt");
        if (r_logFileGlob.fp)
        {
            time(&aclock);
            newtime = localtime(&aclock);
            fprintf(r_logFileGlob.fp, "%s\n", asctime(newtime));
            fflush(r_logFileGlob.fp);
        }
    }
}

bool RB_IsLogging()
{
    // Early-out form: retail keeps the fp test as a materialized bool (setne/test) at every D3D call site.
    if (!r_logFile->current.integer)
        return false;
    return r_logFileGlob.fp != 0;
}

void RB_UpdateLogging()
{
    if (RB_IsLogging())
        ri.Dvar_SetInt(r_logFile, r_logFile->current.integer - 1);
    if (!r_logFile->current.integer)
    {
        if (r_logFileGlob.fp)
        {
            fclose(r_logFileGlob.fp);
            r_logFileGlob.fp = 0;
        }
    }
    else
    {
        RB_OpenLogFile();
    }
}

void RB_LogPrint(const char *text)
{
    if (RB_IsLogging())
    {
        fprintf(r_logFileGlob.fp, "%s", text);
        fflush(r_logFileGlob.fp);
    }
}

// PINNED 10037930/304; descriptive name, historical spelling unconfirmed.
const char *RB_TechniqueName(int techType)
{
    const char *names[35];
    names[0] = "TECHNIQUE_DEPTH_PREPASS";
    names[1] = "TECHNIQUE_SKY";
    names[2] = "TECHNIQUE_BUILD_FLOAT_Z";
    names[3] = "TECHNIQUE_FOGABLE_FIRST";
    names[4] = "TECHNIQUE_UNLIT_FOG_LINEAR";
    names[5] = "TECHNIQUE_UNLIT_FOG_EXP";
    names[6] = "TECHNIQUE_LIGHTMAP";
    names[7] = "TECHNIQUE_LIGHTMAP_FOG_LINEAR";
    names[8] = "TECHNIQUE_LIGHTMAP_FOG_EXP";
    names[9] = "TECHNIQUE_LIGHTPROBE";
    names[10] = "TECHNIQUE_LIGHTPROBE_FOG_LINEAR";
    names[11] = "TECHNIQUE_LIGHTPROBE_FOG_EXP";
    names[12] = "TECHNIQUE_LIGHTPROBE_SMODEL";
    names[13] = "TECHNIQUE_LIGHTPROBE_SMODEL_FOG_LINEAR";
    names[14] = "TECHNIQUE_LIGHTPROBE_SMODEL_FOG_EXP";
    names[15] = "TECHNIQUE_LIGHTPROBE_SMODEL_CACHED";
    names[16] = "TECHNIQUE_LIGHTPROBE_SMODEL_CACHED_FOG_LINEAR";
    names[17] = "TECHNIQUE_LIGHTPROBE_SMODEL_CACHED_FOG_EXP";
    names[18] = "TECHNIQUE_POINTLIGHT";
    names[19] = "TECHNIQUE_POINTLIGHT_FOG_LINEAR";
    names[20] = "TECHNIQUE_POINTLIGHT_FOG_EXP";
    names[21] = "TECHNIQUE_EMISSIVE";
    names[22] = "TECHNIQUE_EMISSIVE_FOG_LINEAR";
    names[23] = "TECHNIQUE_EMISSIVE_FOG_EXP";
    names[24] = "TECHNIQUE_EMISSIVE_FEATHERED";
    names[25] = "TECHNIQUE_EMISSIVE_FEATHERED_FOG_LINEAR";
    names[26] = "TECHNIQUE_EMISSIVE_FEATHERED_FOG_EXP";
    names[27] = "TECHNIQUE_FAKELIGHT_NORMAL";
    names[28] = "TECHNIQUE_FAKELIGHT_VIEW";
    names[29] = "TECHNIQUE_WIREFRAME_SOLID";
    names[30] = "TECHNIQUE_WIREFRAME_SHADED";
    names[31] = "TECHNIQUE_SHADOWCOOKIE_CASTER";
    names[32] = "TECHNIQUE_SHADOWCOOKIE_RECEIVER";
    names[33] = "TECHNIQUE_DEBUG_BUMPMAP";
    names[34] = "TECHNIQUE_COUNT";
    return names[techType];
}

struct StateBitsTable
{
	int stateBits;
	const char *name;
};

void RB_LogBlend(const char *format, int blend)
{
	const char *blendNames[14];

	blendNames[0] = "Disabled";
	blendNames[1] = "Zero";
	blendNames[2] = "One";
	blendNames[3] = "SrcColor";
	blendNames[4] = "InvSrcColor";
	blendNames[5] = "SrcAlpha";
	blendNames[6] = "InvSrcAlpha";
	blendNames[7] = "DestAlpha";
	blendNames[8] = "InvDestAlpha";
	blendNames[9] = "DestColor";
	blendNames[10] = "InvDestColor";
	blendNames[11] = "SrcAlphaSat";
	blendNames[12] = "BlendFactor";
	blendNames[13] = "InvBlendFactor";
	RB_LogPrint(va(format, blendNames[blend]));
}

void RB_LogBlendOp(const char *format, int blendOp)
{
	const char *blendOpNames[6];

	blendOpNames[0] = "Disabled";
	blendOpNames[1] = "Add";
	blendOpNames[2] = "Subtract";
	blendOpNames[3] = "RevSubtract";
	blendOpNames[4] = "Min";
	blendOpNames[5] = "Max";
	RB_LogPrint(va(format, blendOpNames[blendOp]));
}

__declspec(noinline) void RB_LogBool(const char *keyName, int stateBits, int changedBits, int bitMask, const char *trueName, const char *falseName)
{
	changedBits &= bitMask;
	RB_LogPrint(va("---------- (%c)%-14s: %s\n", changedBits ? '*' : ' ', keyName, (stateBits & bitMask) ? trueName : falseName));
}

__declspec(noinline) void RB_LogFromTable(const char *keyName, int stateBits, int changedBits, int bitMask, const StateBitsTable *table, int tableCount)
{
	int tableIndex;

	stateBits &= bitMask;
	changedBits &= bitMask;
	for (tableIndex = 0; tableIndex < tableCount; tableIndex++)
	{
		if (table[tableIndex].stateBits == stateBits)
		{
			RB_LogPrint(va("---------- (%c)%-14s: %s\n", changedBits ? '*' : ' ', keyName, table[tableIndex].name));
			return;
		}
	}
	RB_LogPrint(va("---------- (%c)%-14s: unknown - %08x\n", changedBits ? '*' : ' ', keyName, stateBits));
}

void RB_LogPrintState_0(int stateBits0, int changedBits0)
{
	StateBitsTable alphaTestTable[4];
	StateBitsTable cullTable[3];

	alphaTestTable[0].stateBits = 0x800;
	alphaTestTable[0].name = "Disabled";
	alphaTestTable[1].stateBits = 0x1000;
	alphaTestTable[1].name = "GT0";
	alphaTestTable[2].stateBits = 0x2000;
	alphaTestTable[2].name = "LT128";
	alphaTestTable[3].stateBits = 0x3000;
	alphaTestTable[3].name = "GE128";
	cullTable[0].stateBits = 0x4000;
	cullTable[0].name = "None";
	cullTable[1].stateBits = 0x8000;
	cullTable[1].name = "Back";
	cullTable[2].stateBits = 0xc000;
	cullTable[2].name = "Front";

	RB_LogPrint(va("---------- (%c)Blend         : ", (changedBits0 & 0x7ff) ? '*' : ' '));
	if (!(stateBits0 & 0x700))
	{
		RB_LogPrint("Disabled\n");
	}
	else
	{
		RB_LogBlendOp("%s( ", (stateBits0 >> 8) & 7);
		RB_LogBlend("%s, ", stateBits0 & 0xf);
		RB_LogBlend("%s )\n", (stateBits0 >> 4) & 0xf);
	}
	RB_LogPrint(va("---------- (%c)SeparateAlpha : ", (changedBits0 & 0x7ff0000) ? '*' : ' '));
	if (!(stateBits0 & 0x7000000))
	{
		RB_LogPrint("Disabled\n");
	}
	else
	{
		RB_LogBlendOp("%s( ", (stateBits0 >> 24) & 7);
		RB_LogBlend("%s, ", (stateBits0 >> 16) & 0xf);
		RB_LogBlend("%s )\n", (stateBits0 >> 20) & 0xf);
	}
	RB_LogFromTable("AlphaTest", stateBits0, changedBits0, 0x3800, alphaTestTable, 4);
	RB_LogPrint(va("---------- (%c)Color Write   : ", (changedBits0 & 0x18000000) ? '*' : ' '));
	RB_LogPrint(va("%s, ", (stateBits0 & 0x8000000) ? "true" : "false"));
	RB_LogPrint(va("%s, ", (stateBits0 & 0x8000000) ? "true" : "false"));
	RB_LogPrint(va("%s, ", (stateBits0 & 0x8000000) ? "true" : "false"));
	RB_LogPrint(va("%s\n", (stateBits0 & 0x10000000) ? "true" : "false"));
	RB_LogBool("Fog", stateBits0, changedBits0, 0x20000000, "Enabled", "Disabled");
	RB_LogFromTable("Cull Face", stateBits0, changedBits0, 0xc000, cullTable, 3);
}

void RB_LogPrintState_1(int stateBits1, int changedBits1)
{
	StateBitsTable depthTestTable[4];
	StateBitsTable polygonOffsetTable[3];

	depthTestTable[0].stateBits = 2;
	depthTestTable[0].name = "Disabled";
	depthTestTable[1].stateBits = 4;
	depthTestTable[1].name = "LessEqual";
	depthTestTable[2].stateBits = 8;
	depthTestTable[2].name = "Equal";
	depthTestTable[3].stateBits = 0xc;
	depthTestTable[3].name = "Always";
	polygonOffsetTable[0].stateBits = 0;
	polygonOffsetTable[0].name = "0";
	polygonOffsetTable[1].stateBits = 0x10;
	polygonOffsetTable[1].name = "1";
	polygonOffsetTable[2].stateBits = 0x20;
	polygonOffsetTable[2].name = "2";

	RB_LogBool("Depth Write", stateBits1, changedBits1, 1, "Enabled", "Disabled");
	RB_LogFromTable("Depth Test", stateBits1, changedBits1, 0xe, depthTestTable, 4);
	RB_LogFromTable("Polygon Offset", stateBits1, changedBits1, 0x30, polygonOffsetTable, 3);
}
