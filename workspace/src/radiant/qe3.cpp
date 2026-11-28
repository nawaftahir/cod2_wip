#include "stdafx.h"
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"
#include <stdio.h>
#include <sys/stat.h>
#include <direct.h>
#include <time.h>

// 0x0046cb10 (111 B)
char *FUN_0046cb10(const char *str)
{
#line 23
	assert(str);
	size_t size = strlen(str) + 1;
	char *copy = new char[size];
	memcpy(copy, str, size);
	return copy;
}

struct epair_t;
struct entity_t;
extern entity_t *dword_010bcd34;
extern char dword_0124b658[];
char *ValueForKey(entity_t *ent, const char *key);
void FUN_004668f0(const char *s, FILE *f);
void FUN_0046d190(const char *dir);
void Error(const char *error, ...);
void Sys_Printf(const char *text, ...);

// 0x0046cb80: game path of a file name, relative names are put under basepath
char *FUN_0046cb80(const char *name)
{
	if (name && *name)
	{
		if (*name == '/' || *name == '\\')
			return (char *)name;
		sprintf(dword_0124b658, "%s/%s", ValueForKey(dword_010bcd34, "basepath"), name);
		return dword_0124b658;
	}
	return 0;
}

extern int DAT_010bcd28;
extern int DAT_010bcd2c;
void Z_Init(void);

typedef float vec3_t[3];

struct epair_t
{
	epair_t *next;
	char *key;
	char *value;
};

struct eclass_t
{
	unsigned char pad00[8];
	int fixedsize;
};
struct entity_t;
struct entityInst_t;

struct brushdef_t
{
	brushdef_t *oprev;
	brushdef_t *onext;
	entity_t *owner;
	unsigned char pad0c[4];
	int undoId;
	int redoId;
	int ownerId;
	int refCount;
	float mins[3];
	float maxs[3];
	int faceCount;
	void *faces;
	unsigned char modelFailed;
	unsigned char pad41;
	short version;
	void *patch;
};

// entity definition: brushes at 0x08, eclass 0x50, origin 0x58, epairs 0x64 (retail offsets)
struct entity_t
{
	entity_t *prev;
	entity_t *next;
	brushdef_t brushes;
	eclass_t *eclass;
	eclass_t *modelClass;
	float origin[3];
	epair_t *epairs;
};

struct entityInst_t
{
	entityInst_t *prev;
	entityInst_t *next;
	entity_t *def;
};

struct brush_t
{
	brush_t *prev;
	brush_t *next;
	entityInst_t *owner;
	unsigned char pad0c[8];
	brushdef_t *def; // 0x14
	unsigned char pad18[4];
	void *faces; // 0x1c
};

// camera window: origin at 0x60, angles at 0x6c; held by the main frame at 0x78c
struct CamProj
{
	unsigned char pad[0x60];
	float origin[3];
	float angles[3];
};
struct MainFrameProj
{
	unsigned char pad[0x78c];
	CamProj *cam;
};

extern entity_t entities;
extern brush_t selected_brushes;
extern int DAT_01129898;
extern brush_t *DAT_0112989c;
extern entityInst_t *DAT_012334ec;
extern MainFrameProj *dword_01233488;
extern unsigned dword_0123348c;
extern HWND dword_010bcd70;
char *ValueForKey(epair_t *&e, const char *key);
void Sys_Printf(const char *text, ...);
void vectoangles(const vec3_t value1, vec3_t angles);


// 0x0046cbd0 (139 B)
bool FUN_0046cbd0(const char *pBuff, long &lSize)
{
	CFile file;
	if (file.Open(pBuff, CFile::modeRead | CFile::shareDenyNone))
	{
		lSize += (long)file.GetLength();
		file.Close();
		return true;
	}
	return false;
}

struct QEPrefsView
{
	unsigned char pad0[0x1dc];
	CString m_strLastProject;
	unsigned char pad1[0x0c];
	BOOL m_bAutoSave;
	unsigned char pad2[0x10];
	BOOL m_bSnapShots;
	unsigned char pad3[0x28];
	BOOL field_22c;
	unsigned char pad4[0x8c];
	int m_nAutoSave;
};
extern QEPrefsView *dword_01233b64;
extern char dword_010a4508[];
extern HWND dword_010bcd54;
extern int DAT_010a4908;
bool FUN_0047ad20(const char *pPath, CString &strPath, CString &strFile);
void FUN_00468910(const char *filename, bool use_region);

// 0x0046cc60 (694 B): Map_Snapshot
void Map_Snapshot(void)
{
	CString strMsg;
	CString strOrgPath, strOrgFile;
	FUN_0047ad20(dword_010a4508, strOrgPath, strOrgFile);
	if (strOrgPath.GetLength() > 0 && strOrgPath[strOrgPath.GetLength() - 1] != '\\')
		strOrgPath += '\\';
	strOrgPath += "snapshots";
	bool bGo = true;
	struct _stat Stat;
	if (_stat(strOrgPath, &Stat) == -1)
	{
		bGo = (_mkdir(strOrgPath) != -1);
	}
	if (strOrgPath.GetLength() > 0 && strOrgPath[strOrgPath.GetLength() - 1] != '\\')
		strOrgPath += '\\';
	if (bGo)
	{
		int nCount = 0;
		long lSize = 0;
		CString strNewPath = strOrgPath;
		strNewPath += strOrgFile;
		CString strFile;
		while (bGo)
		{
			strFile.Format("%s.%i", strNewPath, nCount);
			bGo = FUN_0046cbd0(strFile, lSize);
			nCount++;
		}
		FUN_00468910(strFile.GetBuffer(0), false);
		SetWindowText(dword_010bcd54, dword_010a4508);
		if (lSize > 12 * 1024 * 1024)
		{
			Sys_Printf("The snapshot files in the [%s] directory total more than 4 megabytes. You might consider cleaning the directory up.", strOrgPath);
		}
	}
	else
	{
		strMsg.Format("Snapshot save failed.. unabled to create directory\n%s", strOrgPath);
		((CWnd *)dword_01233488)->MessageBox(strMsg);
	}
}

// 0x0046cf20 (396 B): QE_CheckAutoSave
void QE_CheckAutoSave(void)
{
	static clock_t s_start;
	clock_t now;

	now = clock();

	if (DAT_010a4908 != 1 || !s_start)
	{
		s_start = now;
		return;
	}

	if (now - s_start > (CLOCKS_PER_SEC * 60 * dword_01233b64->m_nAutoSave))
	{
		if (dword_01233b64->m_bAutoSave)
		{
			CString strMsg = dword_01233b64->m_bSnapShots ? "Autosaving snapshot..." : "Autosaving...";
			Sys_Printf(strMsg.GetBuffer(0));
			Sys_Printf("\n");
			SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)strMsg.GetBuffer(0));

			if (dword_01233b64->m_bSnapShots && _stricmp(dword_010a4508, "unnamed.map") != 0)
			{
				Map_Snapshot();
			}
			else
			{
				FUN_00468910(ValueForKey(dword_010bcd34->epairs, "autosave"), false);
			}

			SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Autosaving...Saved.");
			DAT_010a4908 = 2;
		}
		else
		{
			Sys_Printf("Autosave skipped...\n");
			SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Autosave skipped...");
		}
		s_start = now;
	}
}

// 0x0046d0b0
void FUN_0046d0b0(char *out, const char *in, int size)
{
	char *filePart = 0;
	GetFullPathNameA(in, size, out, &filePart);
	if (!GetShortPathNameA(in, out, size))
		strcpy(out, in);
}

struct qtexture_s;
void FUN_0047a760(const char *fmt, ...);
int LoadFileNoCrash(const char *filename, void **bufferptr);
void Com_BeginParseSession(const char *filename);
void Com_EndParseSession(void);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
void Dvar_SetStringByName(const char *dvarName, const char *value);
qtexture_s *__fastcall FUN_00440840(char *name);
void FUN_004426e0(void);
void FUN_004409a0(void);
void Dvar_Shutdown(void);
void FS_Shutdown(int closemfp);
extern "C" void FUN_00410e00();
extern "C" {
void FUN_00410c40(void);
}
void FUN_00408f50(const char *basepath, const char *game, const char *basegame);
entity_t *FUN_00466440(const char **data, int a, bool b);
void FUN_00440ca0(void);
void FUN_00464170(char *path);
void FUN_00463ea0(const char *path, int a);
void FUN_00440fa0(void);
void Map_New(void);
void FUN_00477270(void);
enum FsListBehavior { FS_LIST_PURE_ONLY = 0x0, FS_LIST_ALL = 0x1 };
char **FS_ListFiles(const char *path, const char *extension, FsListBehavior behavior, int *numfiles, int allocType);
void FS_FreeFileList(char **list, int allocType);
int FS_ReadFile(const char *qpath, void **buffer);
void FS_FreeFile(void *buffer);
int Com_sprintf(char *dest, unsigned int size, const char *fmt, ...);
const char *Info_ValueForKey(const char *s, const char *key);
void FUN_00463e40(eclass_t *e, eclass_t **head);
extern "C" eclass_t *FUN_00463860(const char *text);
extern eclass_t *dword_012334dc;
struct qeglobals_proj_t { unsigned char pad[0x20]; entity_t *d_project_entity; };
extern qeglobals_proj_t g_qeglobals;
extern CString dword_012345c0;
extern const char *DAT_00591cf4[3];
extern int DAT_01128d90;
extern int DAT_01128d94;
extern float DAT_01128dc4;
extern qtexture_s *DAT_01128da8;

// 0x0046d0f0 (159 B)
void FUN_0046d0f0(const char *folder, const char *ext)
{
	int numFiles;
	char path[1024];
	char **files = FS_ListFiles(folder, ext, FS_LIST_PURE_ONLY, &numFiles, 10);
	Sys_Printf("Scanning AI types folder: %s/*%s\n", folder, ext);
	for (int i = 0; i < numFiles; i++)
	{
		sprintf(path, "%s\\%s", folder, files[i]);
		FUN_00463ea0(path, 1);
	}
	if (files)
		FS_FreeFileList(files, 10);
}

// 0x0046d190 (503 B)
void FUN_0046d190(const char *folder)
{
	char displayName[1024];
	char def[1024];
	char name[1024];
	char path[1024];
	char model[64];
	int numFiles;
	char *buf;
	const char *tag = "WEAPONFILE";
	int len = strlen(tag);
	char **files = FS_ListFiles(folder, "", FS_LIST_PURE_ONLY, &numFiles, 10);
	for (int i = 0; i < numFiles; i++)
	{
		sprintf(path, "%s\\%s", folder, files[i]);
		Sys_Printf("ScanWeapon: %s\n", path);
		if (FS_ReadFile(path, (void **)&buf) > len && !strncmp(buf, tag, len))
		{
			const char *info = buf + len;
			if (!strchr(info, '"') && !strchr(info, ';'))
			{
				Com_sprintf(name, sizeof(name), "weapon_%s", files[i]);
				strcpy(displayName, Info_ValueForKey(info, "displayName"));
				strcpy(model, Info_ValueForKey(info, "worldModel"));
				sprintf(def, "/*QUAKED %s (.3 .3 1) (-16 -16 -16) (16 16 16) SUSPENDED SPIN - RESPAWN\ndefaultmdl=\"%s\"\n%s\nInternal(script) name:%s\n\"count\" - Specifies a specific amount of ammo to include with the weapon. Amount is capped to ammo max.", name, model, displayName, path);
				eclass_t *e = FUN_00463860(def);
				if (e)
					FUN_00463e40(e, &dword_012334dc);
			}
		}
		FS_FreeFile(buf);
	}
	if (files)
		FS_FreeFileList(files, 10);
}

// 0x0046d390
void FUN_0046d390(void)
{
	Sys_Printf("Scanning single player weapons: %s/*\n", "weapons/sp");
	FUN_0046d190("weapons/sp");
	Sys_Printf("Scanning multiplayer weapons: %s/*\n", "weapons/mp");
	FUN_0046d190("weapons/mp");
}

// 0x0046d3d0 (674 B)
int QE_LoadProject(const char *projectfile)
{
	char path[1024];
	void *data;

	Sys_Printf("QE_LoadProject (%s)\n", projectfile);
	{
		void *file;
		if (LoadFileNoCrash(projectfile, &file) == -1)
			return 0;
		data = file;
	}
	dword_012345c0 = projectfile;
	{
		const char *buf = (const char *)data;
		Com_BeginParseSession(projectfile);
		g_qeglobals.d_project_entity = FUN_00466440(&buf, 4, true);
	}
	Com_EndParseSession();
	free(data);
	if (!g_qeglobals.d_project_entity)
		FUN_0047a760("Couldn't parse %s", projectfile);
	dword_01233b64->m_strLastProject = projectfile;

	for (int i = 0; i < 3; i++)
	{
		const char *value = ValueForKey(g_qeglobals.d_project_entity->epairs, DAT_00591cf4[i]);
		if (value[0] != '\\' && value[0] != '/' && GetFullPathName(value, sizeof(path), path, 0))
			FUN_00465bf0(g_qeglobals.d_project_entity, DAT_00591cf4[i], path);
	}

	FUN_004426e0();
	FUN_00410e00();
	FS_Shutdown(1);
	Dvar_Shutdown();
	FUN_00408f50(
		ValueForKey(g_qeglobals.d_project_entity->epairs, "basepath"),
		ValueForKey(g_qeglobals.d_project_entity->epairs, "game"),
		ValueForKey(g_qeglobals.d_project_entity->epairs, "basegame"));
	FUN_00410c40();
	FUN_004409a0();
	DAT_01128d90 = 0;
	DAT_01128d94 = 0;
	DAT_01128dc4 = 0.25f;
	DAT_01128da8 = FUN_00440840("$default");
	FUN_00440ca0();
	FUN_00464170(ValueForKey(g_qeglobals.d_project_entity->epairs, "entitypath"));
	FUN_0046d0f0("aitype", "gsc");
	FUN_0046d0f0("maps/mp/gametypes", "gsc");
	Sys_Printf("Scanning single player weapons: %s/*\n", "weapons/sp");
	FUN_0046d190("weapons/sp");
	Sys_Printf("Scanning multiplayer weapons: %s/*\n", "weapons/mp");
	FUN_0046d190("weapons/mp");
	FUN_00477270();
	Map_New();
	FUN_00440fa0();
	return 1;
}

// 0x0046d680: writes the project entity key/values
int FUN_0046d680(const char *file)
{
	FILE *f = fopen(file, "w+");
	if (!f)
		Error("Could not open project file!");
	fprintf(f, "{\n");
	for (epair_t *ep = *(epair_t **)((char *)dword_010bcd34 + 0x64); ep; ep = ep->next)
	{
		const char *value = ep->value;
		FUN_004668f0(ep->key, f);
		fputc(' ', f);
		FUN_004668f0(value, f);
		fputc('\n', f);
	}
	fprintf(f, "}\n");
	fclose(f);
	return 1;
}

// 0x0046d710 (257 B): link target numbers of a "linkTo" string, at most 5 distinct, -1 terminated
void FUN_0046d710(int *out, const char *linkTo)
{
	bool atStart = true;
	int count = 0;
	char *full = (char *)out + 0x84;

	*full = 0;
	for (unsigned int i = 0; i < strlen(linkTo); i++)
	{
#line 411
		assert(linkTo[i]);
		if (linkTo[i] == ' ')
		{
			atStart = true;
			continue;
		}
		if (!atStart)
			continue;
		int id = atol(linkTo + i);
		int j;
		for (j = 0; j < count; j++)
		{
			if (out[j] == id)
				goto next;
		}
		out[count++] = id;
		atStart = false;
		if (count >= 5)
		{
			*full = 1;
			break;
		}
next:;
	}
	out[count] = -1;
	out[32] = count;
}

// 0x0046d820 and 0x0046dab0 keep script_linkName/script_linkTo ids in this list (5 links at most)
struct LinkList
{
	int id[32];
	int size;
	bool full;
};
extern char *va(const char *format, ...);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
bool FUN_0046dab0(entity_t *src, entity_t *dst);

// 0x0046d820 (648 B): link entity e0 to entity e1 through script_linkTo/script_linkName
void FUN_0046d820(entity_t *e0, entity_t *e1)
{
	LinkList links;
	char buf[32];
	int linkName;
	int i;

	if (FUN_0046dab0(e0, e1))
		return;
	if (FUN_0046dab0(e1, e0))
		return;
	const char *name = ValueForKey(e1, "script_linkName");
	if (name && *name)
		linkName = atol(ValueForKey(e1, "script_linkName"));
	else
	{
		int highest = 0;
		for (entity_t *e = entities.next; e != &entities; e = e->next)
		{
			const char *n = ValueForKey(e, "script_linkName");
			if (n && *n)
			{
				int id = atol(n);
				if (id > highest)
					highest = id;
			}
		}
		linkName = highest + 1;
	}
	sprintf(buf, "%i", linkName);
	FUN_00465bf0(e1, "script_linkName", buf);
	const char *newName = ValueForKey(e1, "script_linkName");
	const char *linkTo = ValueForKey(e0, "script_linkTo");
	if (!linkTo || !*linkTo)
	{
		FUN_00465bf0(e0, "script_linkTo", newName);
		return;
	}
	FUN_0046d710(links.id, linkTo);
	if (links.full)
		Sys_Printf("Exceeded maximum links\n");
	for (i = 0; i < links.size; i++)
	{
		if (links.id[i] == linkName)
			goto linked;
	}
	links.id[links.size] = linkName;
	links.size++;
linked:
































	assert(links.size > 0);
	sprintf(buf, "%i", links.id[0]);
	for (i = 1; i < links.size; i++)
		strcat(buf, va(" %i", links.id[i]));
	FUN_00465bf0(e0, "script_linkTo", buf);
}

// 0x0046dab0 (389 B): drop the link from src to dst, true when it existed
bool FUN_0046dab0(entity_t *src, entity_t *dst)
{
	LinkList links;
	int kept[32];
	int keptCount;
	char buf[32];
	int i;

	const char *linkTo = ValueForKey(src, "script_linkTo");
	if (!linkTo || !*linkTo)
		return false;
	const char *name = ValueForKey(dst, "script_linkName");
	if (!name || !*name)
		return false;
	int id = atol(name);
	FUN_0046d710(links.id, linkTo);
	for (i = 0; i < links.size; i++)
	{
		if (links.id[i] != id)
			continue;
		keptCount = 0;
		for (i = 0; i < links.size; i++)
		{
			if (links.id[i] != id)
				kept[keptCount++] = links.id[i];
		}
		if (keptCount == 0)
		{
			FUN_00465bf0(src, "script_linkTo", "");
			return true;
		}
		sprintf(buf, "%i", kept[0]);
		for (i = 1; i < keptCount; i++)
			strcat(buf, va(" %i", kept[i]));
		FUN_00465bf0(src, "script_linkTo", buf);
		return true;
	}
	return false;
}

// 0x0046dc40 (382 B)
extern "C" void FUN_0046dc40(void)
{
	if (DAT_01129898 != 1)
		return;
	entityInst_t *inst = DAT_0112989c->owner;
	if (inst == DAT_012334ec)
	{
		SendMessage(dword_010bcd70, 0x401, 0, (LPARAM)"Can't connect to the world.");
		Sys_Printf("Can't connect to the world.\n");
		MessageBeep(MB_ICONASTERISK);
		return;
	}
	entity_t *e = inst->def;
	char *target = ValueForKey(e->epairs, "target");
	if (!target || !*target)
		return;
	entity_t *t;
	for (t = entities.next; t != &entities; t = t->next)
	{
		if (!strcmp(target, ValueForKey(t->epairs, "targetname")))
			goto found;
	}
	return;
found:
	if (!t)
		return;
	float *org = dword_01233488->cam->origin;
	org[0] = e->origin[0];
	org[1] = e->origin[1];
	org[2] = e->origin[2];
	vec3_t dir;
	dir[0] = t->origin[0] - e->origin[0];
	dir[1] = t->origin[1] - e->origin[1];
	dir[2] = t->origin[2] - e->origin[2];
	vec3_t angles;
	vectoangles(dir, angles);
	dword_01233488->cam->angles[0] = angles[0];
	dword_01233488->cam->angles[1] = angles[1];
	dword_01233488->cam->angles[2] = angles[2];
	dword_01233488->cam->angles[0] *= -1;
	dword_0123348c |= 3;
}

// 0x0046e0c0
int FUN_0046e0c0(bool quiet)
{
	if (selected_brushes.next == &selected_brushes || selected_brushes.next->next != &selected_brushes)
	{
		if (!quiet)
			Sys_Printf("Error: you must have a single brush selected\n");
		return 0;
	}
	if (selected_brushes.next->owner->def->eclass->fixedsize)
	{
		if (!quiet)
			Sys_Printf("Error: you cannot manipulate fixed size entities\n");
		return 0;
	}
	return 1;
}

extern brush_t *DAT_011298a0;
void FUN_0046fbe0(bool bDeselectFaces);
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);
extern "C" void FUN_00417e00(unsigned v);

// 0x0046ddc0 (511 B): ConnectEntities
void FUN_0046ddc0(void)
{
	entity_t *e1, *e2, *e;
	const char *target;
	char newtarget[32];

	if (DAT_01129898 != 2)
	{
		SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Must have two brushes selected.");
		Sys_Printf("Must have two brushes selected.\n");
		MessageBeep(0x40);
		return;
	}

	if (DAT_0112989c->owner == DAT_012334ec || DAT_011298a0->owner == DAT_012334ec)
	{
		SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Can't connect to the world.");
		Sys_Printf("Can't connect to the world.\n");
		MessageBeep(0x40);
		return;
	}

	e1 = DAT_0112989c->owner->def;
	e2 = DAT_011298a0->owner->def;

	if (e1 == e2)
	{
		SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Brushes are from same entity.");
		MessageBeep(0x40);
		return;
	}

	target = ValueForKey(e1->epairs, "target");
	if (target && target[0])
	{
		strcpy(newtarget, target);
	}
	else
	{
		target = ValueForKey(e2->epairs, "targetname");
		if (target && target[0])
		{
			strcpy(newtarget, target);
		}
		else
		{
			int maxtarget = 0;
			for (e = entities.next; e != &entities; e = e->next)
			{
				const char *tn = ValueForKey(e->epairs, "targetname");
				if (tn && tn[0])
				{
					int i = atoi(tn + 4);
					if (i > maxtarget)
						maxtarget = i;
				}
			}
			sprintf(newtarget, "auto%i", maxtarget + 1);
		}
	}

	FUN_00465bf0(e1, "target", newtarget);
	FUN_00465bf0(e2, "targetname", newtarget);
	FUN_00417e00(3);
	if (!dword_01233b64->field_22c)
		FUN_0046fbe0(true);
	FUN_0046f0b0(DAT_011298a0, true, true, false);
}

// 0x0046dfc0 (253 B): ConnectLinkEntities
void FUN_0046dfc0(void)
{
	entity_t *e1, *e2;

	if (DAT_01129898 != 2)
	{
		SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Must have two entities selected.");
		Sys_Printf("Must have two entities selected.\n");
		MessageBeep(0x40);
		return;
	}

	if (DAT_0112989c->owner == DAT_012334ec || DAT_011298a0->owner == DAT_012334ec)
	{
		SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Can't connect to the world.");
		Sys_Printf("Can't connect to the world.\n");
		MessageBeep(0x40);
		return;
	}

	e1 = DAT_0112989c->owner->def;
	e2 = DAT_011298a0->owner->def;

	if (e1 == e2)
	{
		SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"Brushes are from same entity.");
		MessageBeep(0x40);
		return;
	}

	FUN_0046d820(e1, e2);
	FUN_00417e00(3);
	if (!dword_01233b64->field_22c)
		FUN_0046fbe0(true);
	FUN_0046f0b0(DAT_011298a0, true, true, false);
}

// 0x0046e120 (61 B)
void FUN_0046e120(void)
{
	DAT_010bcd2c = 8;
	DAT_010bcd28 = 1;
	Z_Init();
}

// 0x0046e160: backslashes to slashes
void FUN_0046e160(char *dst, const char *src)
{
	while (*src)
	{
		if (*src == '\\')
			*dst = '/';
		else
			*dst = *src;
		dst++;
		src++;
	}
	*dst = 0;
}

extern char com_token[];
extern int com_eof;


extern brush_t active_brushes;
extern int DAT_010bcd20;
extern int DAT_010bcd24;
void Sys_UpdateStatusBar(void);

// 0x0046e180 (250 B)
void QE_CountBrushesAndUpdateStatusBar(void)
{
	static int s_didonce;
	static int s_lastentitycount;
	static int s_lastbrushcount;

	DAT_010bcd24 = 0;
	DAT_010bcd20 = 0;
	if (active_brushes.next)
	{
		brush_t *next;
		for (brush_t *b = active_brushes.next; b && b != &active_brushes; b = next)
		{
			next = b->next;
			if (b->faces)
			{
#line 859
				assert(b->owner->def == b->def->owner);
				if (!b->owner->def->eclass->fixedsize)
					DAT_010bcd24++;
				else
					DAT_010bcd20++;
			}
		}
	}
	if (DAT_010bcd24 != s_lastbrushcount || DAT_010bcd20 != s_lastentitycount || !s_didonce)
	{
		Sys_UpdateStatusBar();
		s_lastbrushcount = DAT_010bcd24;
		s_lastentitycount = DAT_010bcd20;
		s_didonce = 1;
	}
}

// 0x0046e280 (229 B)
char *COM_Parse(char *data)
{
	int c;
	int len = 0;
	com_token[0] = 0;

	if (!data)
		return 0;

skipwhite:
	while ((c = *data) <= ' ')
	{
		if (c == 0)
		{
			com_eof = 1;
			return 0;
		}
		data++;
	}

	if (c == '/' && data[1] == '/')
	{
		while (*data && *data != '\n')
			data++;
		goto skipwhite;
	}

	if (c == '\"')
	{
		data++;
		do
		{
			c = *data++;
			if (c == '\"')
			{
				com_token[len] = 0;
				return data;
			}
			com_token[len] = c;
			len++;
		} while (1);
	}

	if (c == '{' || c == '}' || c == ')' || c == '(' || c == '\'' || c == ':')
	{
		com_token[len] = c;
		len++;
		com_token[len] = 0;
		return data + 1;
	}

	do
	{
		com_token[len] = c;
		data++;
		len++;
		c = *data;
		if (c == '{' || c == '}' || c == ')' || c == '(' || c == '\'' || c == ':')
			break;
	} while (c > 32);

	com_token[len] = 0;
	return data;
}

// 0x0046e370 (124 B)
int ParseCommandLine(char *cmdLine, char **argv, int maxArgs)
{
	int argc = 1;
	argv[0] = "CoD2Radiant";
	if (!cmdLine)
		return argc;
	while (argc < maxArgs)
	{
		while (*cmdLine <= ' ' || *cmdLine > '~')
		{
			if (!*cmdLine)
				return argc;
			cmdLine++;
		}
		if (*cmdLine == '"')
		{
			cmdLine++;
			argv[argc++] = cmdLine;
			while (*cmdLine != '"')
			{
				if (!*cmdLine)
					return argc;
				cmdLine++;
			}
		}
		else
		{
			argv[argc++] = cmdLine;
			while (*cmdLine > ' ' && *cmdLine <= '~')
				cmdLine++;
			if (!*cmdLine)
				return argc;
		}
		*cmdLine++ = 0;
	}
	return argc;
}

// 0x0046e3f0
int FUN_0046e3f0(const char *s)
{
	int n = 0;
	for (const char *p = s; *p; p++)
	{
		n <<= 4;
		if (*p >= '0' && *p <= '9')
			n += *p - '0';
		else if (*p >= 'a' && *p <= 'f')
			n += *p - 'a' + 10;
		else if (*p >= 'A' && *p <= 'F')
			n += *p - 'A' + 10;
		else
			Error("Bad hex number: %s", s);
	}
	return n;
}

// 0x0046e460: decimal, $hex or 0xhex
int FUN_0046e460(const char *s)
{
	if (*s == '$')
		return FUN_0046e3f0(s + 1);
	if (s[0] == '0' && s[1] == 'x')
		return FUN_0046e3f0(s + 2);
	return atol(s);
}
