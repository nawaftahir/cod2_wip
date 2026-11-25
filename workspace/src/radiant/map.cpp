#include "stdafx.h"
#include "radiant_wnd.h"
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

struct epair_t;
struct eclass_t
{
	unsigned char pad00[4];
	char *name;
	int fixedsize; // 0x08
	unsigned char pad0c[0x148];
	struct PrefabData *prefab; // 0x154
	unsigned char pad158[8];
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
	unsigned char pad[8];
	entity_t *owner; // 0x08
	unsigned char pad0c[0x20 - 0xc];
	float mins[3];
	float maxs[3];
	int faceCount; // 0x38
	void *faces; // 0x3c
	unsigned char pad40[2];
	short version; // 0x42
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
	char name[0x400]; // 0x04
	brush_t *activeNext; // 0x404
	brush_t *activePrev; // 0x408
	brush_t *selNext; // 0x40c
	brush_t *selPrev; // 0x410
	entity_t *entNext; // 0x414
	entity_t *entPrev; // 0x418
	entityInst_t *instPrev; // 0x41c
	entityInst_t *instNext; // 0x420
	brush_t *prefabInst; // 0x424
	float camOrigin[3]; // 0x428
	float camAngles[3]; // 0x434
	float xyOrigin[2]; // 0x440
	float xyScale; // 0x448
	int xyViewType; // 0x44c
};
extern prefabLevel_t prefabStack[];

void FUN_00452b00(CXYWnd *xy);
void FUN_00452ca0(CXYWnd *xy, int type);
void Brush_Free(brush_t *b);
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
		dword_01233488->xyWnd->Copy();
	}
}

// 0x00467e30 (39 B)
void FUN_00467e30()
{
	if (dword_01233488->xyWnd && DAT_012334f4)
		dword_01233488->xyWnd->Paste();
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
				dword_01233488->xyWnd->Copy();
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

// 0x00467f00 (225 B)
struct brushdef_t;
struct MapPrefsView
{
	unsigned char pad00[0x204];
	float tinySize; // 0x204
	int checkTiny; // 0x208
	int checkTiny2; // 0x20c
};
extern MapPrefsView *dword_01233b64;
extern int DAT_011298b0;
extern HCURSOR DAT_01129e28;
void FUN_0045a220(brushdef_t *b, bool snap);
void FUN_00475350();
extern "C" void FUN_00467f00()
{
	if (!active_brushes.next)
		return;
	DAT_01129e28 = SetCursor(LoadCursor(NULL, IDC_WAIT));
	int n = 0;
	brush_t *b = active_brushes.next;
	while (b)
	{
		if (b == &active_brushes)
			break;
		{
			brush_t *next = b->next;
			brushDef_t *def = b->def;
			FUN_0045a220((brushdef_t *)def, false);
			if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
				FUN_00475350();
			def->version++;
			if (b->def->faces == 0)
			{
				Brush_Free(b);
				Sys_Printf("Removed degenerate brush\n");
			}
			else if (dword_01233b64->checkTiny2)
			{
				bool tiny = CheckForTinyBrush(b->def, n, dword_01233b64->tinySize);
				n++;
				if (tiny)
				{
					Brush_Free(b);
					Sys_Printf("Removed degenerate brush\n");
				}
			}
			b = next;
		}
	}
	if (DAT_01129e28)
	{
		SetCursor(DAT_01129e28);
		DAT_01129e28 = NULL;
	}
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
		Brush_Free(active_brushes.next);
	while (selected_brushes.next != &selected_brushes)
		Brush_Free(selected_brushes.next);
	while (filtered_brushes.next != &filtered_brushes)
		Brush_Free(filtered_brushes.next);
	while (DAT_010a43d0.next != &DAT_010a43d0)
		FUN_004678c0(DAT_010a43d0.next);
#line 157
	map_assert2(entities.next == &entities);
}

// 0x00468100 (175 B)
void FUN_00468100()
{
	DAT_010a4910 = 0;
	strcpy(currentmap, "unnamed.map");
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

// 0x004681d0 (134 B), data in ebx
struct MapParseInfo
{
	char token[0x400];
	int lines;
	bool ungetToken;
	bool spaceDelimited;
	bool keepStringQuotes;
	bool csv;
	bool negativeNumbers;
	bool numbers;
	const char *errorPrefix;
	const char *warningPrefix;
	int backup_lines;
	const char *backup_text;
	char parseFile[64];
};
struct ParseThreadInfo
{
	MapParseInfo parseInfo[16];
	int parseInfoNum;
};
ParseThreadInfo *Com_GetParseThreadInfo();
char *Com_Parse(const char **data_p);
char *Com_ParseOnLine(const char **data_p);
void Com_UngetToken();
void Com_BeginParseSession(const char *filename);
void Com_EndParseSession();
void Com_SetSpaceDelimited(int spaceDelimited);
void Com_SetParseNegativeNumbers(int negativeNumbers);
int LoadFile(const char *filename, void **buffer);
entity_t *FUN_00466440(const char **data, int version, int flag);

int FUN_004681d0(const char **data)
{
	char *token = Com_Parse(data);
	if (!token[0])
	{
		Sys_Printf("WARNING: empty map\n");
		return -1;
	}
	if (strcmp(token, "iwmap"))
	{
		Com_UngetToken();
		return 0;
	}
	return atol(Com_ParseOnLine(data));
}

// 0x00468260 (373 B), entList in eax, filename in ecx
int FUN_00468260(entity_t *entList, const char *filename)
{
	void *buf;
	int count = 0;

#line 231
	map_assert1(entList->next == entList);
	map_assert1(entList->prev == entList);
	if (LoadFile(filename, &buf) != -1)
	{
		Com_BeginParseSession(filename);
		Com_SetSpaceDelimited(0);
		Com_SetParseNegativeNumbers(1);
		const char *data = (const char *)buf;
		int version = FUN_004681d0(&data);
		if (version >= 0)
		{
			if (version < 4)
				Com_SetSpaceDelimited(1);
			while (entity_t *e = FUN_00466440(&data, version, 0))
			{
				count++;
				Entity_AddToList(e, entList);
			}
		}
		Com_EndParseSession();
	}
	free(buf);
	return count;
}

// 0x00468910 (1022 B)
extern int DAT_01129894;
extern HWND DAT_010bcd70;
void AddRegionBrushes();
void ConvertDOSToUnixName(char *dst, const char *src);
void FUN_00466970(entity_t *e, bool use_region, FILE *f);

void FUN_00468910(const char *filename, bool use_region)
{
	char temp[1024];
	char ro[1024];
	FILE *f;

	if (!filename || !strlen(filename))
	{
		CFileDialog dlg(FALSE, "map", NULL, OFN_OVERWRITEPROMPT | OFN_HIDEREADONLY, "Map Files (*.map)|*.map||", AfxGetMainWnd());
		if (dlg.DoModal() != IDOK)
			return;
		filename = _strdup(dlg.m_ofn.lpstrFile);
	}
	DAT_010a4910 = 0;
	ConvertDOSToUnixName(temp, filename);
	Sys_Printf("Map_SaveFile: %s\n", filename);
	f = fopen(filename, "w");
	if (!f)
	{
		FILE *rf = fopen(filename, "r");
		if (rf)
		{
			fclose(rf);
			strcpy(ro, filename);
			if (MessageBox(dword_010bcd54, "File is Read-Only! Please make the file writable and retry the save.", "File is Read-Only!", MB_OK) == IDOK)
			{
				Sys_Printf("Save of %s canceled.\n", filename);
				return;
			}
			f = fopen(filename, "w");
		}
		if (!f)
		{
			Sys_Printf("ERROR!!!! Couldn't open %s!\n", filename);
			return;
		}
	}
	fprintf(f, "iwmap %i\n", 4);
	if (use_region)
		AddRegionBrushes();
#line 438
	map_assert2(entities.next != &entities);
	map_assert2(!strcmp( entities.next->eclass->name, "worldspawn" ));
	int count = 0;
	for (entity_t *e = entities.next; e != &entities;)
	{
		entity_t *next = e->next;
		if (e->brushes.onext != &e->brushes || !strcmp(e->eclass->name, "worldspawn"))
		{
			fprintf(f, "// entity %i\n", count++);
			FUN_00466970(e, use_region, f);
		}
		e = next;
	}
	fclose(f);
	if (use_region && DAT_0109fecc)
	{
		for (int i = 0; i < 4; i++)
			Brush_Free(DAT_0109febc[i]);
	}
	Sys_Printf("Saved.\n");
	DAT_010a4908 = 0;
	if (!strstr(temp, "autosave"))
		SetWindowText(dword_010bcd54, temp);
	if (!use_region)
	{
		time_t ltime;
		time(&ltime);
		MessageBeep(MB_ICONEXCLAMATION);
		FILE *log = fopen("c:/tstamps.log", "a");
		if (log)
		{
			fprintf(log, "%s", filename);
			fclose(log);
			DAT_01129894 = 0;
		}
		SendMessage(DAT_010bcd70, 0x401, 0, (LPARAM)"Saved.\n");
	}
}

// 0x00468d10 (238 B)
void FUN_00467e60();
void FUN_00468100();
extern int DAT_0123348c;

// 0x00468e00 (705 B)
#define region_sides DAT_0109febc
#define world_entity DAT_012334ec
struct qtexture_s;
struct texdef_t
{
	qtexture_s *mat;
	float scale[2];
	float shift[2];
	float rotate;
	float crossterm;
};
struct regionBrush_t
{
	texdef_t td;
	float mins[3];
	float maxs[3];
};
qtexture_s *__fastcall FUN_00440840(char *name);
brushdef_t *Brush_CreateFromTexdef(eclass_t *ec, const texdef_t *td);
void FUN_00457dd0(const float *mins, const float *maxs, brushdef_t *def, int flag);
brush_t *FUN_00458440(brushdef_t *def, entity_t *owner);
void FUN_004671b0(brushdef_t *def, entity_t *owner);
void Sys_MarkMapModified();

void AddRegionBrushes()
{
	regionBrush_t r;

	if (!DAT_0109fecc)
		return;
	memset(&r, 0, sizeof(r.td));
	r.td.mat = FUN_00440840("region");
	r.mins[0] = dword_00591cdc[0] - 16.0f;
	r.mins[2] = -131072.0f;
	r.maxs[2] = 131072.0f;
	r.maxs[0] = dword_00591cdc[0] + 1.0f;
	r.mins[1] = dword_00591cdc[1] - 16.0f;
	r.maxs[1] = dword_00591ce8[1] + 16.0f;
	brushdef_t *def = Brush_CreateFromTexdef(NULL, &r.td);
	FUN_00457dd0(r.mins, r.maxs, def, 0);
	DAT_0109febc[0] = FUN_00458440(def, (entity_t *)DAT_012334ec);
	r.mins[0] = dword_00591ce8[0] - 1.0f;
	r.maxs[0] = dword_00591ce8[0] + 16.0f;
	def = Brush_CreateFromTexdef(NULL, &r.td);
	FUN_00457dd0(r.mins, r.maxs, def, 0);
	DAT_0109febc[1] = FUN_00458440(def, (entity_t *)DAT_012334ec);
	r.mins[0] = dword_00591cdc[0] - 16.0f;
	r.maxs[0] = dword_00591ce8[0] + 16.0f;
	r.mins[1] = dword_00591cdc[1] - 16.0f;
	r.maxs[1] = dword_00591cdc[1] + 1.0f;
	def = Brush_CreateFromTexdef(NULL, &r.td);
	FUN_00457dd0(r.mins, r.maxs, def, 0);
	DAT_0109febc[2] = FUN_00458440(def, (entity_t *)DAT_012334ec);
	r.mins[1] = dword_00591ce8[1] - 1.0f;
	r.maxs[1] = dword_00591ce8[1] + 16.0f;
	def = Brush_CreateFromTexdef(NULL, &r.td);
	FUN_00457dd0(r.mins, r.maxs, def, 0);
	DAT_0109febc[3] = FUN_00458440(def, (entity_t *)DAT_012334ec);
	for (int i = 0; i < 4; i++)
	{
		FUN_00459210(region_sides[i], &selected_brushes);
		FUN_004671b0((brushdef_t *)region_sides[i]->def, world_entity->def);
		FUN_0045a220((brushdef_t *)region_sides[i]->def, true);
		if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
			FUN_00475350();
		Sys_MarkMapModified();
		((short *)region_sides[i]->def)[0x21]++;
#line 574
		map_assert1(region_sides[i]->def->owner == world_entity->def);
		map_assert1(region_sides[i]->owner != world_entity);
		region_sides[i]->owner = world_entity;
	}
}

// 0x004690d0 (37 B)
void FUN_004690d0()
{
	if (DAT_0109fecc)
	{
		for (int i = 0; i < 4; i++)
			Brush_Free(DAT_0109febc[i]);
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
extern "C" void FUN_004692a0()
{
	Map_RemoveRegion();
	if (selected_brushes.next == &selected_brushes)
	{
		Sys_Printf("Tried to region with no selection...\n");
		return;
	}
	DAT_0109fecc = 1;
	FUN_00470a50(dword_00591cdc, dword_00591ce8);
	filtered_brushes.next = active_brushes.next;
	filtered_brushes.prev = active_brushes.prev;
	filtered_brushes.next->prev = &filtered_brushes;
	filtered_brushes.prev->next = &filtered_brushes;
	active_brushes.next = selected_brushes.next;
	active_brushes.prev = selected_brushes.prev;
	active_brushes.next->prev = &active_brushes;
	active_brushes.prev->next = &active_brushes;
	selected_brushes.prev = selected_brushes.next = &selected_brushes;
	g_nUpdateBits = -1;
}

// 0x00469740 (519 B), e in esi
bool FUN_00469740(entity_t *e)
{
	if (e && e->eclass->fixedsize)
	{
		CString cn(ValueForKey(e->epairs, "classname"));
		if (cn[0])
		{
			if (cn[0] == 'a' && cn[1] == 'c' && cn[2] == 't' && cn[3] == 'o' && cn[4] == 'r')
				return true;
			if (cn[0] == 'm' && cn[1] == 'i' && cn[2] == 's' && cn[3] == 'c' && cn[4] == '_' && cn[5] == 'm' && cn[6] == 'g' && cn[7] == '4' && cn[8] == '2')
				return true;
		}
	}
	return false;
}


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

	if (b != &selected_brushes && b->next == &selected_brushes)
	{
		if (b->owner->def->eclass->fixedsize)
		{
			Sys_Printf("Error: you cannot manipulate fixed size entities\n");
			return;
		}
	}
	else
	{
		Sys_Printf("Error: you must have a single brush selected\n");
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
static inline void Vec3Copy(const float *in, float *out) { out[0] = in[0]; out[1] = in[1]; out[2] = in[2]; }
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
	Vec3Copy(b->def->mins, dword_00591cdc);
	Vec3Copy(b->def->maxs, dword_00591ce8);
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

// 0x0046ab20 (385 B), filename in ecx
void FUN_004699b0(const char **data, int flags);

void FUN_0046ab20(const char *filename)
{
	char temp[1024];
	void *buf;

	DAT_01129e28 = SetCursor(LoadCursor(NULL, IDC_WAIT));
	char *p = temp;
	for (const char *s = filename; *s; s++)
		*p++ = (*s == '\\') ? '/' : *s;
	*p = 0;
	if (LoadFile(temp, &buf) == -1)
	{
		g_nUpdateBits = -1;
		DAT_010a4908 = 1;
	}
	else
	{
		Com_BeginParseSession(filename);
		Com_SetSpaceDelimited(0);
		Com_SetParseNegativeNumbers(1);
		const char *data = (const char *)buf;
		int version = FUN_004681d0(&data);
		if (version >= 0)
		{
			if (version < 4)
				Com_SetSpaceDelimited(1);
			FUN_004699b0(&data, version);
			Com_EndParseSession();
			free(buf);
			FUN_00467f00();
			g_nUpdateBits = -1;
			DAT_010a4908 = 1;
		}
		else
		{
			Com_EndParseSession();
			free(buf);
		}
	}
	if (DAT_01129e28)
	{
		SetCursor(DAT_01129e28);
		DAT_01129e28 = NULL;
	}
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
void FUN_0046afc0(entityInst_t *skip, eclass_t *model)
{
	for (int i = 0; i < DAT_012334f0; i++)
		FUN_0046aee0(prefabStack[i].instNext, &DAT_010a43d0, skip, model);
	FUN_0046aee0(DAT_010a43d0.next, &DAT_010a43d0, skip, model);
	for (int i = 0; i < DAT_012334f0; i++)
		FUN_0046ae70(prefabStack[i].instNext, &DAT_010a43d0, skip, model);
	FUN_0046ae70(DAT_010a43d0.next, &DAT_010a43d0, skip, model);
}

// 0x0046b070 (1245 B)
struct PrefabData
{
	unsigned char pad00[8];
	entity_t *entPrev; // 0x08
	entity_t *entNext; // 0x0c
};
struct orientation_t { float origin[3]; float axis[3][3]; };
void FUN_0041e160(const char *msg);
void FUN_0041d5e0(brush_t *brushList, const char *msg);
void FUN_0041d930(entityInst_t *list, const char *msg);
void FUN_00443590(void);
void FUN_00463560(eclass_t *ec);
void FUN_004650b0(entity_t *ent, orientation_t *or);
void OrientationPosToLocal(const orientation_t *or, const float *world, float *local);
void OrientationDirToLocal(const orientation_t *or, const float *world, float *local);
void AnglesToAxis(const float angles[3], float axis[3][3]);
void AxisToAngles(float axis[3][3], float angles[3]);
float AngleNormalize180Accurate(float angle);
char *va(const char *format, ...);
extern char *DAT_010bcd34;
extern int DAT_0123348c;

void FUN_0046b070(int arg)
{
	brush_t *brush = (brush_t *)arg;
	orientation_t orient;
	float axis[3][3];
	float local[3][3];

	if (!brush)
	{
		brush = selected_brushes.next;
		if (brush == &selected_brushes || brush->next != &selected_brushes || !(brush->owner->def->eclass->nShowFlags & ECLASS_PREFAB))
		{
			Sys_Printf("Must have a single prefab selected.\n");
			return;
		}
	}
	if (DAT_012334f0 == 16)
	{
		Sys_Printf("Max prefab nesting exceeded.\n");
		return;
	}
	FUN_0041e160("before entering prefab");
	entityInst_t *prefabInst = brush->owner;
	entityInst_t *children = prefabInst->children;
	if (!children)
	{
		Sys_Printf("Prefab not loaded.\n");
		return;
	}
	eclass_t *model = prefabInst->def->modelClass;
	entity_t *entNext = model->prefab->entNext;
	entity_t *entPrev = model->prefab->entPrev;
	FUN_0046afc0(prefabInst, model);
	if (brush == selected_brushes.next)
		FUN_0046fbe0(true);
	FUN_00463560(model);
	prefabLevel_t *lv = &prefabStack[DAT_012334f0++];
	strcpy(lv->name, currentmap);
	lv->dirty = DAT_010a4908;
	lv->activePrev = active_brushes.prev;
	lv->entPrev = entities.prev;
	lv->activeNext = active_brushes.next;
	lv->instPrev = DAT_010a43d0.prev;
	lv->entNext = entities.next;
	lv->instNext = DAT_010a43d0.next;
	lv->prefabInst = brush;
	CamViewProj *cam = dword_01233488->cam;
	XYViewProj *xy = dword_01233488->xy;
	lv->xyOrigin[0] = xy->origin[0];
	lv->xyOrigin[1] = xy->origin[1];
	lv->xyScale = xy->scale;
	lv->xyViewType = ((int *)xy)[61];
	lv->camAngles[0] = cam->angles[0];
	lv->camAngles[1] = cam->angles[1];
	lv->camAngles[2] = cam->angles[2];
	lv->camOrigin[0] = cam->origin[0];
	lv->camOrigin[1] = cam->origin[1];
	lv->camOrigin[2] = cam->origin[2];
	FUN_004650b0(brush->owner->def, &orient);
	OrientationPosToLocal(&orient, cam->origin, lv->camOrigin);
	AnglesToAxis(lv->camAngles, axis);
	OrientationDirToLocal(&orient, axis[0], local[0]);
	OrientationDirToLocal(&orient, axis[1], local[1]);
	OrientationDirToLocal(&orient, axis[2], local[2]);
	AxisToAngles(local, cam->angles);
	cam->angles[0] = AngleNormalize180Accurate(cam->angles[0]);
	cam->angles[2] = 0;
	int viewType = ((int *)dword_01233488->xy)[61];
	dword_01233488->xy->origin[viewType == 0] = 0;
	dword_01233488->xy->origin[(viewType != 2) + 1] = 0;
	entities.next = entNext;
	entities.prev = entPrev;
	entities.next->prev = &entities;
	entities.prev->next = &entities;
	DAT_010a43d0.prev = children->prev;
	DAT_010a43d0.next = children->next;
	DAT_010a43d0.next->prev = &DAT_010a43d0;
	DAT_010a43d0.prev->next = &DAT_010a43d0;
	brush_t *childBrushes = (brush_t *)((char *)children + 0xc);
	active_brushes.next = childBrushes->next;
	active_brushes.prev = childBrushes->prev;
	active_brushes.next->prev = &active_brushes;
	active_brushes.prev->next = &active_brushes;
	DAT_012334ec = DAT_010a43d0.next;
	if (brush == selected_brushes.next)
		selected_brushes.prev = selected_brushes.next = &selected_brushes;
	for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
	{
		((int *)b)[9] = ((short *)b->def)[33] - 1;
		int *patch = ((int **)b)[8];
		if (patch)
			patch[1] = ((short *)patch[0])[7190] - 1;
	}
	for (entityInst_t *e = DAT_010a43d0.next; e != &DAT_010a43d0; e = e->next)
		((int *)e)[15] = e->def->field68 - 1;
	DAT_010a4908 = 0;
	char *dst = currentmap;
	for (const char *src = ValueForKey(*(epair_t **)(DAT_010bcd34 + 0x64), "mapspath"); (*dst++ = *src++) != 0; )
		;
	int len = (int)strlen(currentmap);
	if (len && currentmap[len - 1] != '\\')
		currentmap[len++] = '\\';
	for (const char *src = ValueForKey(brush->owner->def->epairs, "model"), *d2 = currentmap + len; ; )
	{
		if (!(*(char *)d2 = *src))
			break;
		src++;
		d2++;
	}
	for (char *c = currentmap; *c; c++)
		if (*c == '\\')
			*c = '/';
	delete[] (char *)prefabInst->children;
	prefabInst->children = NULL;
	prefabInst->def->modelClass = NULL;
	prefabInst->def->field68++;
	((char *)brush->def)[0x40] = 0;
	FUN_00443590();
	DAT_0123348c = -1;
	SetWindowText(dword_010bcd54, currentmap);
	FUN_0041d5e0(&active_brushes, va("%s - active_brushes", "after entering prefab"));
	FUN_0041d5e0(&selected_brushes, va("%s - active_brushes", "after entering prefab"));
	FUN_0041d930(&DAT_010a43d0, "after entering prefab");
}

// 0x0046b550 (96 B)
extern int prefabStackLevel;
bool FUN_0046b550(void)
{
#line 1491
	map_assert1(prefabStackLevel >= 0);
	return prefabStackLevel > 0;
}

// 0x0046b5b0 (1017 B)
#define entityInsts DAT_010a43d0
bool FUN_0045b420(brush_t *b);

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
