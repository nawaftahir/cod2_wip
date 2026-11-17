#include <stdarg.h>
#include <stdio.h>

struct entity_t
{
	entity_t *prev;
	entity_t *next;
};

struct FileWrapper
{
	void *vtable;
	FILE *fp;
};

struct brushDef_t
{
	unsigned char pad[0x20];
	float mins[3];
	float maxs[3];
};

// from entity.cpp
bool FUN_00465e10(entity_t *ent, const char *key, const char *value);
void Sys_Printf(const char *fmt, ...);

extern entity_t entities;
extern float dword_00591cdc[3];
extern float dword_00591ce8[3];

// 0x00467df0 (28 B)
void FUN_00467df0(FileWrapper *file, const char *fmt, ...)
{
	va_list args;

	va_start(args, fmt);
	vfprintf(file->fp, fmt, args);
	va_end(args);
}

// 0x00467ec0 (57 B)
bool CheckForTinyBrush(brushDef_t *b, int n, float fSize)
{
	for (int i = 0; i < 3; i++)
	{
		if (b->maxs[i] - b->mins[i] < fSize)
		{
			Sys_Printf("Possible problem brush (too small) #%i ", n);
			return true;
		}
	}
	return false;
}

// 0x00467ff0 (55 B)
entity_t *Map_FindClass(const char *classname)
{
	for (entity_t *e = entities.next; e != &entities; e = e->next)
	{
		if (FUN_00465e10(e, "classname", classname))
			return e;
	}
	return NULL;
}

// 0x004681b0 (27 B)
entity_t *FUN_004681b0(void)
{
	entity_t *ent = Map_FindClass("info_player_start");

	if (!ent)
		ent = Map_FindClass("info_player_deathmatch");
	return ent;
}

// 0x00469100 (53 B)
bool Map_IsBrushFiltered(brushDef_t *b)
{
	for (int i = 0; i < 3; i++)
	{
		if (b->mins[i] > dword_00591ce8[i])
			return true;
		if (b->maxs[i] < dword_00591cdc[i])
			return true;
	}
	return false;
}
