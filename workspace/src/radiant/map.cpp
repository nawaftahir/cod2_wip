#include "stdafx.h"
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

struct epair_t;
struct eclass_t
{
	unsigned char pad00[0x160];
	int nShowFlags;
};

struct entity_t
{
	entity_t *prev;
	entity_t *next;
	unsigned char pad08[0x48];
	eclass_t *eclass; // 0x50
	eclass_t *modelClass; // 0x54
	unsigned char pad58[0x0c];
	epair_t *epairs; // 0x64
	short field68;
};

struct inst14_t
{
	unsigned char pad00[0x40];
	unsigned char field40;
};

struct inst18_t
{
	unsigned char pad00[0x14];
	inst14_t *field14;
};

struct entityInst_t
{
	entityInst_t *prev;
	entityInst_t *next;
	entity_t *def;
	unsigned char pad0c[0xc];
	inst18_t *field18;
	unsigned char pad1c[0x18];
	void *modelInst; // 0x34
	entityInst_t *children; // 0x38
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
char *ValueForKey(epair_t *&e, const char *key);
int FUN_0047d980(const char *expr, const char *file, int line, int type, int skip);
#define map_assert2(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)
#define ECLASS_PREFAB 0x10
void FUN_00464c20(entityInst_t *inst);
extern void (__cdecl *dword_0059c490)(void *);
#define map_assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 0, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)
bool FUN_00465e10(entity_t *ent, const char *key, const char *value);
void Sys_Printf(const char *fmt, ...);

struct UNKNOWN_0046bba0
{
	unsigned char pad00[0x70];
	float vec[3];
};

struct UNKNOWN_0046bca0
{
	unsigned char pad00[0x58];
	int field58;
	int field5c;
};

struct UNKNOWN_0046bcc0
{
	unsigned char pad00[0x788];
	int field788;
};

struct brush_t
{
	brush_t *prev;
	brush_t *next;
	unsigned char pad08[0xc];
	brushDef_t *def; // 0x14
};

extern entity_t entities;
extern brush_t filtered_brushes;
extern brush_t active_brushes;
extern int DAT_0109fecc;
extern int g_nUpdateBits;
void FUN_004592f0(brush_t *b);
void FUN_00459210(brush_t *b, brush_t *list);
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

// 0x00469140 (206 B)
void Map_RemoveRegion()
{
	DAT_0109fecc = 0;
	for (int i = 0; i < 3; i++)
	{
		dword_00591ce8[i] = 131072.0f;
		dword_00591cdc[i] = -131072.0f;
	}
	brush_t *next;
	for (brush_t *b = filtered_brushes.next; b != &filtered_brushes; b = next)
	{
		next = b->next;
		if (Map_IsBrushFiltered(b->def))
			continue;
		FUN_004592f0(b);
		if (!active_brushes.next || !active_brushes.prev)
		{
			active_brushes.next = &active_brushes;
			active_brushes.prev = &active_brushes;
		}
		FUN_00459210(b, &active_brushes);
	}
	g_nUpdateBits = -1;
}

// xy view: size 0x58/0x5c, scale 0x60, origin 0x70; held by the main frame at 0x788 (retail offsets)
struct XYViewProj
{
	unsigned char pad00[0x58];
	int width;
	int height;
	float scale;
	unsigned char pad64[0xc];
	float origin[3];
	float *GetOrigin() { return origin; }
	int Width() { return width; }
	int Height() { return height; }
	float Scale() { return scale; }
};
struct MainFrameXYProj
{
	unsigned char pad00[0x788];
	XYViewProj *xy;
};
extern MainFrameXYProj *dword_01233488;
void FUN_00469210();

// 0x00469350 (200 B)
extern "C" void FUN_00469350()
{
	Map_RemoveRegion();
	dword_00591cdc[0] = dword_01233488->xy->GetOrigin()[0] - 0.5 * dword_01233488->xy->Width() / dword_01233488->xy->Scale();
	dword_00591ce8[0] = 0.5 * dword_01233488->xy->Width() / dword_01233488->xy->Scale() + dword_01233488->xy->GetOrigin()[0];
	dword_00591cdc[1] = dword_01233488->xy->GetOrigin()[1] - 0.5 * dword_01233488->xy->Height() / dword_01233488->xy->Scale();
	dword_00591ce8[1] = 0.5 * dword_01233488->xy->Height() / dword_01233488->xy->Scale() + dword_01233488->xy->GetOrigin()[1];
	dword_00591cdc[2] = 131072.0f;
	dword_00591ce8[2] = 131072.0f;
	FUN_00469210();
}

// 0x00469570 (284 B)
void UniqueTargetName(CString &name)
{
	int maxtarg = 0;

	for (entity_t *e = entities.next; e != &entities; e = e->next)
	{
		char *tn = ValueForKey(e->epairs, "targetname");
#line 763
		map_assert1(tn);
		if (tn[0])
		{
			int targetnum = atoi(tn + 4);
			if (targetnum > maxtarg)
				maxtarg = targetnum;
		}
		tn = ValueForKey(e->epairs, "target");
#line 772
		map_assert1(tn);
		if (tn[0])
		{
			int targetnum = atoi(tn + 4);
			if (targetnum > maxtarg)
				maxtarg = targetnum;
		}
	}
	name.Format("auto%i", maxtarg + 1);
}

// 0x00469690 (165 B)
void FUN_00469690(CString &name)
{
	int maxtarg = 0;

	for (entity_t *e = entities.next; e != &entities; e = e->next)
	{
		char *tn = ValueForKey(e->epairs, "export");
#line 794
		map_assert1(tn);
		if (tn[0])
		{
			int targetnum = atoi(tn);
			if (targetnum > maxtarg)
				maxtarg = targetnum;
		}
	}
	name.Format("%i", maxtarg + 1);
}

// 0x0046ae70 (106 B)
void FUN_0046ae70(entityInst_t *begin, entityInst_t *end, entityInst_t *skip, eclass_t *model)
{
	for (entityInst_t *e = begin; e != end; e = e->next)
	{
		entity_t *def = e->def;
		if ((def->eclass->nShowFlags & 0x10) && def->modelClass && e != skip)
		{
			if (def->modelClass == model)
				def->modelClass = NULL;
			else if (e->children)
				FUN_0046ae70(e->children->next, e->children, skip, model);
		}
	}
}

// 0x0046aee0 (212 B)
void FUN_0046aee0(entityInst_t *begin, entityInst_t *end, entityInst_t *skip, eclass_t *model)
{
	for (entityInst_t *e = begin; e != end; e = e->next)
	{
		if (e->children)
		{
#line 1306
			map_assert2(e->def->eclass->nShowFlags & ECLASS_PREFAB);
			if (e != skip)
			{
				if (e->def->modelClass != model)
					FUN_0046aee0(e->children->next, e->children, skip, model);
				else
				{
					FUN_00464c20(e);
					if (e->modelInst)
					{
						dword_0059c490(e->modelInst);
						e->modelInst = NULL;
					}
					e->def->field68++;
					e->field18->field14->field40 = 0;
				}
			}
		}
	}
}

// 0x0046b550 (96 B)
extern int prefabStackLevel;
bool FUN_0046b550(void)
{
#line 1491
	map_assert1(prefabStackLevel >= 0);
	return prefabStackLevel > 0;
}

// 0x0046bba0 (18 B)
void FUN_0046bba0(UNKNOWN_0046bba0 *obj, const float *v)
{
	obj->vec[0] = v[0];
	obj->vec[1] = v[1];
	obj->vec[2] = v[2];
}

// 0x0046bbc0 (18 B)
void FUN_0046bbc0(UNKNOWN_0046bba0 *obj, float *v)
{
	v[0] = obj->vec[0];
	v[1] = obj->vec[1];
	v[2] = obj->vec[2];
}

// vtable at 0x0054ebb0
class UNKNOWN_0054ebb0
{
public:
	UNKNOWN_0054ebb0(CFile *file);
	virtual void FUN_0046bbf0(const char *fmt, ...);

	CFile *m_file;
};

// 0x0046bbe0 (10 B)
UNKNOWN_0054ebb0::UNKNOWN_0054ebb0(CFile *file)
{
	m_file = file;
}

// 0x0046bbf0 (84 B)
void UNKNOWN_0054ebb0::FUN_0046bbf0(const char *fmt, ...)
{
	char buf[0x4000];
	va_list args;

	va_start(args, fmt);
	int len = _vsnprintf(buf, sizeof(buf), fmt, args);
	if (len > 0)
		m_file->Write(buf, len);
}

// 0x0046bca0 (4 B)
int FUN_0046bca0(UNKNOWN_0046bca0 *obj)
{
	return obj->field5c;
}

// 0x0046bcb0 (4 B)
int FUN_0046bcb0(UNKNOWN_0046bca0 *obj)
{
	return obj->field58;
}

// 0x0046bcc0 (7 B)
int FUN_0046bcc0(UNKNOWN_0046bcc0 *obj)
{
	return obj->field788;
}
