#include "stdafx.h"
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct epair_t;
struct eclass_t
{
	unsigned char pad00[4];
	char *name;
	int fixedsize; // 0x08
	unsigned char pad0c[0x154];
	int nShowFlags;
};

struct brushHead_t
{
	brushHead_t *oprev;
	brushHead_t *onext;
	unsigned char pad08[0x40];
};

struct entity_t
{
	entity_t *prev;
	entity_t *next;
	brushHead_t brushes; // 0x08
	eclass_t *eclass; // 0x50
	eclass_t *modelClass; // 0x54
	unsigned char pad58[0x0c];
	epair_t *epairs; // 0x64
	short field68;
	unsigned char pad6a[2];
	int pad6c[4]; // undoId, redoId, entityId, refCount
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

// RTTI .?AVAbstractFileWrapper@@; the slot 0 name is unknown, it is named after its first body 0x00467df0
class AbstractFileWrapper
{
public:
	virtual void FUN_00467df0(const char *fmt, ...) = 0;
};

// RTTI .?AVNormalFileWrapper@@, vtable 0x0054e52c
class NormalFileWrapper : public AbstractFileWrapper
{
public:
	NormalFileWrapper(FILE *file) : fp(file) {}
	void FUN_00467df0(const char *fmt, ...);
	FILE *fp;
};

// RTTI .?AVMemoryFileWrapper@@, vtable 0x0054ebb0
class MemoryFileWrapper : public AbstractFileWrapper
{
public:
	MemoryFileWrapper(CFile *file);
	void FUN_00467df0(const char *fmt, ...);
	CFile *m_file;
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
	entityInst_t *owner; // 0x08
	unsigned char pad0c[8];
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
// camera view held at 0x78c: origin 0x60, angles 0x6c
struct CamViewProj
{
	unsigned char pad00[0x60];
	float origin[3];
	float angles[3];
};
class CXYWnd;
struct MainFrameXYProj
{
	unsigned char pad00[0x788];
	XYViewProj *xy;
	CamViewProj *cam; // 0x78c
	unsigned char pad790[0x7e0 - 0x790];
	CXYWnd *xyWnd; // 0x7e0
};
extern MainFrameXYProj *dword_01233488;
extern HWND dword_010bcd54;
extern char currentmap[1024];
extern bool DAT_012334f4;
extern int DAT_012334f0;
extern int DAT_010a4910;
extern int DAT_010bcd30;
extern int DAT_010a4908;
extern entityInst_t *DAT_012334ec;
extern entityInst_t DAT_010a43d0;
extern brush_t selected_brushes;
extern brush_t *DAT_0109febc[4];

// the prefab stack: one level per entered prefab, 0x450 B each (retail 0x109fed0)
struct prefabLevel_t
{
	int dirty;
	unsigned char pad04[0x420 - 4];
	entityInst_t *instNext; // 0x420
	unsigned char pad424[0x450 - 0x424];
};
extern prefabLevel_t prefabStack[];

void FUN_00452e30(CXYWnd *xy);
void FUN_00452f50(CXYWnd *xy);
void FUN_00458c00(brush_t *b);
void FUN_004678c0(entityInst_t *e);
entityInst_t *FUN_00467770(entity_t *entDef, entityInst_t *list, brush_t *brushList);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
eclass_t *FUN_00464770(int a, const char *name);
void Entity_AddToList(entity_t *e, entity_t *list);
void FUN_004634f0(void);
void FUN_00470a50(float mins[3], float maxs[3]);
void FUN_0046fb30();
void FUN_0046fbe0(bool bDeselectFaces);
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);
bool FUN_00469740(entity_t *e);
void FUN_0046b5b0();
bool Map_IsBrushFiltered(brushDef_t *b);
void Map_RemoveRegion();
void FUN_0046aee0(entityInst_t *begin, entityInst_t *end, entityInst_t *skip, eclass_t *model);
void FUN_0046ae70(entityInst_t *begin, entityInst_t *end, entityInst_t *skip, eclass_t *model);
void FUN_00469210();

// 0x00467df0 (28 B)
void NormalFileWrapper::FUN_00467df0(const char *fmt, ...)
{
	va_list args;

	va_start(args, fmt);
	vfprintf(fp, fmt, args);
	va_end(args);
}

// 0x00467e10 (29 B)
void FUN_00467e10()
{
	if (dword_01233488->xyWnd)
	{
		DAT_012334f4 = true;
		FUN_00452e30(dword_01233488->xyWnd);
	}
}

// 0x00467e30 (39 B)
void FUN_00467e30()
{
	if (dword_01233488->xyWnd && DAT_012334f4)
		FUN_00452f50(dword_01233488->xyWnd);
	DAT_012334f4 = false;
}

// 0x00467e60 (82 B)
void FUN_00467e60()
{
	DAT_012334f4 = false;
	if (selected_brushes.next && selected_brushes.next != &selected_brushes)
	{
		if (MessageBox(dword_010bcd54, "Copy selection?", "", MB_YESNO) == IDYES)
		{
			if (dword_01233488->xyWnd)
			{
				DAT_012334f4 = true;
				FUN_00452e30(dword_01233488->xyWnd);
			}
		}
	}
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

// 0x00468030 (203 B)
void FUN_00468030()
{
	while (active_brushes.next != &active_brushes)
		FUN_00458c00(active_brushes.next);
	while (selected_brushes.next != &selected_brushes)
		FUN_00458c00(selected_brushes.next);
	while (filtered_brushes.next != &filtered_brushes)
		FUN_00458c00(filtered_brushes.next);
	while (DAT_010a43d0.next != &DAT_010a43d0)
		FUN_004678c0(DAT_010a43d0.next);
#line 157
	map_assert2(entities.next == &entities);
}

// 0x00468100 (175 B)
void FUN_00468100()
{
	strcpy(currentmap, "unnamed.map");
	DAT_010a4910 = 0;
	SetWindowText(dword_010bcd54, currentmap);
	DAT_010bcd30 = 0;
	if (!active_brushes.next)
	{
		active_brushes.prev = active_brushes.next = &active_brushes;
		selected_brushes.prev = selected_brushes.next = &selected_brushes;
		filtered_brushes.prev = filtered_brushes.next = &filtered_brushes;
		entities.prev = entities.next = &entities;
		DAT_012334ec = NULL;
		DAT_010a43d0.prev = DAT_010a43d0.next = &DAT_010a43d0;
		return;
	}
	FUN_00468030();
	FUN_004634f0();
	DAT_012334ec = NULL;
}

// 0x004681b0 (27 B)
entity_t *FUN_004681b0(void)
{
	entity_t *ent = Map_FindClass("info_player_start");

	if (!ent)
		ent = Map_FindClass("info_player_deathmatch");
	return ent;
}

// 0x00468d10 (238 B)


// 0x004690d0 (37 B)
void FUN_004690d0()
{
	if (DAT_0109fecc)
	{
		for (int i = 0; i < 4; i++)
			FUN_00458c00(DAT_0109febc[i]);
	}
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

void FUN_00469210();

// 0x00469210 (135 B)
void FUN_00469210()
{
	brush_t *next;

	DAT_0109fecc = 1;
	for (brush_t *b = active_brushes.next; b != &active_brushes; b = next)
	{
		next = b->next;
		if (Map_IsBrushFiltered(b->def))
		{
			FUN_004592f0(b);
			FUN_00459210(b, &filtered_brushes);
		}
	}
	g_nUpdateBits = -1;
}

// 0x004692a0 (172 B)


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

// 0x00469420 (162 B)
void FUN_00469420()
{
	brush_t *b = selected_brushes.next;

	if (b == &selected_brushes || b->next != &selected_brushes)
	{
		Sys_Printf("Error: you must have a single brush selected\n");
		return;
	}
	if (b->owner->def->eclass->fixedsize)
	{
		Sys_Printf("Error: you cannot manipulate fixed size entities\n");
		return;
	}
	Map_RemoveRegion();
	dword_00591cdc[0] = b->def->mins[0];
	dword_00591cdc[1] = b->def->mins[1];
	dword_00591cdc[2] = b->def->mins[2];
	dword_00591ce8[0] = b->def->maxs[0];
	dword_00591ce8[1] = b->def->maxs[1];
	dword_00591cdc[2] = -131072.0f;
	dword_00591ce8[2] = 131072.0f;
	FUN_0046fb30();
	FUN_00469210();
}

// 0x004694d0 (150 B)
void FUN_004694d0()
{
	brush_t *b = selected_brushes.next;

	if (b == &selected_brushes || b->next != &selected_brushes)
	{
		Sys_Printf("Error: you must have a single brush selected\n");
		return;
	}
	if (b->owner->def->eclass->fixedsize)
	{
		Sys_Printf("Error: you cannot manipulate fixed size entities\n");
		return;
	}
	Map_RemoveRegion();
	dword_00591cdc[0] = b->def->mins[0];
	dword_00591cdc[1] = b->def->mins[1];
	dword_00591cdc[2] = b->def->mins[2];
	dword_00591ce8[0] = b->def->maxs[0];
	dword_00591ce8[1] = b->def->maxs[1];
	dword_00591ce8[2] = b->def->maxs[2];
	FUN_0046fb30();
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


void FUN_00466c00(entity_t *e, AbstractFileWrapper *f);

// 0x00469950 (87 B)
void FUN_00469950()
{
	FUN_0046fbe0(true);
	for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
	{
		if (b && FUN_00469740(b->owner->def))
		{
			brush_t *sel = b;
			b = b->prev;
			FUN_0046f0b0(sel, true, true, false);
		}
	}
	FUN_0046fb30();
}

// 0x0046acb0 (216 B), stream in ebx
void FUN_0046acb0(AbstractFileWrapper *f)
{
#line 1213
	map_assert2(entities.next != &entities);
	map_assert2(!strcmp( entities.next->eclass->name, "worldspawn" ));
	int count = 0;
	for (entity_t *e = entities.next; e != &entities; e = e->next)
	{
		f->FUN_00467df0("// entity %i\n", count++);
		FUN_00466c00(e, f);
	}
}

// 0x0046ad90 (93 B), filename in edi
void FUN_0046ad90(const char *filename)
{
	FILE *f = fopen(filename, "w");
	if (!f)
	{
		Sys_Printf("ERROR!!!! Couldn't open %s\n", filename);
		return;
	}
	fprintf(f, "iwmap %i\n", 4);
	NormalFileWrapper writer(f);
	FUN_0046acb0(&writer);
	fclose(f);
}

// 0x0046adf0 (30 B), file in eax
void FUN_0046adf0(CFile *file)
{
	MemoryFileWrapper f(file);
	FUN_0046acb0(&f);
}

// 0x0046ae10 (89 B), file in esi
void FUN_0046ae10(CFile *file, const char *fmt, ...)
{
	char buf[0x1000];
	va_list args;

	va_start(args, fmt);
	vsprintf(buf, fmt, args);
	file->Write(buf, strlen(buf));
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

// 0x0046afc0 (172 B), model in edi, skip in ebx
void FUN_0046afc0(eclass_t *model, entityInst_t *skip)
{
	for (int i = 0; i < DAT_012334f0; i++)
		FUN_0046aee0(prefabStack[i].instNext, &DAT_010a43d0, skip, model);
	FUN_0046aee0(DAT_010a43d0.next, &DAT_010a43d0, skip, model);
	for (int i = 0; i < DAT_012334f0; i++)
		FUN_0046ae70(prefabStack[i].instNext, &DAT_010a43d0, skip, model);
	FUN_0046ae70(DAT_010a43d0.next, &DAT_010a43d0, skip, model);
}

// 0x0046b550 (96 B)
extern int prefabStackLevel;
bool FUN_0046b550(void)
{
#line 1491
	map_assert1(prefabStackLevel >= 0);
	return prefabStackLevel > 0;
}

// 0x0046b9b0 (91 B)
void FUN_0046b9b0()
{
	for (;;)
	{
#line 1491
		map_assert1(DAT_012334f0 >= 0);
		if (DAT_012334f0 <= 0)
			return;
		FUN_0046b5b0();
	}
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

// 0x0046bbe0 (10 B)
MemoryFileWrapper::MemoryFileWrapper(CFile *file)
{
	m_file = file;
}

// 0x0046bbf0 (84 B)
void MemoryFileWrapper::FUN_00467df0(const char *fmt, ...)
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
