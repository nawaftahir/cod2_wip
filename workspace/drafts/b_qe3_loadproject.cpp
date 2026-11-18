/* Lane B r25 drafts removed from qe3.cpp: adding them flips FUN_00467510 and Com_Filter.
 * Needs the qe3.cpp declarations block above QE_LoadProject. See ledger/defer.tsv. */
#include "stdafx.h"

struct entity_t;
struct epair_t;
struct qtexture_s;
struct searchpath_t;
void Sys_Printf(const char *text, ...);
void FUN_0047a760(const char *fmt, ...);
int LoadFileNoCrash(const char *filename, void **bufferptr);
void Com_BeginParseSession(const char *filename);
void Com_EndParseSession(void);
char *ValueForKey(epair_t *&e, const char *key);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
void Dvar_SetStringByName(const char *dvarName, const char *value);
qtexture_s *__fastcall FUN_00440840(char *name);
void FUN_004426e0(void);
void FUN_004409a0(void);
void Dvar_Shutdown(void);
extern "C" void FUN_00410e00();
void FUN_0046d190(const char *folder);
extern "C" {
entity_t *FUN_00466440(const char **data, int a, int b);
void FUN_00481990(void);
void FUN_00408f50(const char *basepath, const char *basegame, const char *game);
void FUN_00410c40(void);
void FUN_00440ca0(void);
void FUN_00464170(const char *path);
void FUN_00463ea0(const char *path, int a);
void FUN_00468d10(void);
void FUN_00440fa0(void);
}
void FUN_00477270(void);
enum FsListBehavior { FS_LIST_PURE_ONLY = 0x0, FS_LIST_ALL = 0x1 };
char **FS_ListFiles(const char *path, const char *extension, FsListBehavior behavior, int *numfiles, int allocType);
void FS_FreeFileList(char **list, int allocType);

struct eclass_t;
int FS_ReadFile(const char *qpath, void **buffer);
void FS_FreeFile(void *buffer);
int Com_sprintf(char *dest, unsigned int size, const char *fmt, ...);
const char *Info_ValueForKey(const char *s, const char *key);
void FUN_00463e40(eclass_t *e, eclass_t **head);
extern "C" eclass_t *FUN_00463860(const char *text);
extern eclass_t *dword_012334dc;

// partial view of the project entity
struct entity_t { unsigned char pad[0x64]; epair_t *epairs; };
struct qeglobals_t { unsigned char pad[0x20]; entity_t *d_project_entity; };
extern qeglobals_t g_qeglobals;
extern CString dword_012345c0;
struct QEPrefsView { unsigned char pad[0x1dc]; CString m_strLastProject; };
extern QEPrefsView *dword_01233b64;
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
		g_qeglobals.d_project_entity = FUN_00466440(&buf, 4, 1);
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
	FUN_00481990();
	Dvar_Shutdown();
	const char *basegame = ValueForKey(g_qeglobals.d_project_entity->epairs, "basegame");
	const char *game = ValueForKey(g_qeglobals.d_project_entity->epairs, "game");
	const char *basepath = ValueForKey(g_qeglobals.d_project_entity->epairs, "basepath");
	FUN_00408f50(basepath, basegame, game);
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
	FUN_00468d10();
	FUN_00440fa0();
	return 1;
}

