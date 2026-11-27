#include "stdafx.h"
#include <string.h>
#include <stdio.h>
#include "../universal/assertive.h"

#define eclass_assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)

struct entity_t;

struct brushdef_t
{
	brushdef_t *oprev;
	brushdef_t *onext;
	unsigned char pad08[0x14];
	int refCount;
	unsigned char pad20[0x22];
	short version;
	unsigned char pad44[4];
};

// brushes sentinel at 0x08, refCount at 0x78 (retail offsets)
struct entity_t
{
	entity_t *prev;
	entity_t *next;
	brushdef_t brushes;
	struct eclass_t *eclass;
	struct eclass_t *modelClass;
	unsigned char pad58[0x20];
	int refCount;
};

// a model entry: sentinel of its entity list at 0x08 (0x0c is its first node)
struct entitymodel_t
{
	entitymodel_t *next;
	void *handle;
	struct { entity_t *prev; entity_t *next; } entities;
	unsigned char pad10[0x74];
};

struct qtexture_s
{
	unsigned char pad00[0x14];
	int width;
	int height;
};

struct eclass_t
{
	eclass_t *next;
	char *name;
	int fixedsize;
	float mins[3];
	float maxs[3];
	float color[3];
	float f30;
	qtexture_s *mtl;
	float f38;
	float f3c;
	unsigned char pad40[0x10];
	char *comments;
	char flagnames[8][32];
	entitymodel_t *model;
	char *defaultmdl;
	char *modelpath;
	unsigned int flags;
};

extern eclass_t *eclass;
extern eclass_t *eclass_bad;
extern eclass_t *g_modelClasses;
extern char com_token[];
char *debugname;
struct XModel;
int XModelBad(XModel *model);
extern XModel *(__cdecl *dword_0059c308)(const char *);
extern void (__cdecl *dword_0059c44c)(void);
extern void (__cdecl *dword_0059c450)(void);
char *COM_Parse(char *data);
extern int dword_011298b0;
char *FUN_0046cb10(const char *str);
void Sys_Printf(const char *fmt, ...);
void FUN_0045a220(brushdef_t *b, bool snap);
void FUN_00475350();
int FUN_00468260(const char *path, entity_t *list);
char *ValueForKey(entity_t *ent, const char *key);
extern entity_t *dword_010bcd34;
qtexture_s *__fastcall FUN_00440840(char *name);
bool FUN_00463d60(eclass_t *e);
eclass_t *FUN_00464770(const char *name, int hasBrushes);
#define Eclass_hasModel FUN_00463d60

void FUN_004661f0(entity_t *e);

// 0x00462ff0: frees the entities of a model entry, model in edi
void FUN_00462ff0(entitymodel_t *model)
{
#line 35
	assert(model->entities.next);
	while (model->entities.next != (entity_t *)&model->entities)
	{
		entity_t *e = model->entities.next;
#line 39
		eclass_assert1(e->refCount == 1);
		for (brushdef_t *b = e->brushes.onext; b != &e->brushes; b = b->onext)
			b->refCount--;
		e->refCount--;
		FUN_004661f0(e);
	}
	model->entities.next = 0;
}

// 0x004630c0
void FUN_004630c0(eclass_t *ec)
{
	entitymodel_t *model = ec->model;
	while (model)
	{
		entitymodel_t *next = model->next;
		if (model->entities.next)
		{
			FUN_00462ff0(model);
#line 61
			eclass_assert1(model->entities.next == 0);
		}
		delete model;
		model = next;
	}
	delete[] ec->modelpath;
	delete[] ec->defaultmdl;
	delete[] ec->name;
	delete[] ec->comments;
	delete ec;
}

// 0x00463170
void CleanEntityList(eclass_t *&pList)
{
	while (pList)
	{
		eclass_t *pTemp = pList->next;
		FUN_004630c0(pList);
		pList = pTemp;
	}
	pList = 0;
}

// 0x004631a0
void CleanUpEntities()
{
	CleanEntityList(eclass);
	CleanEntityList(g_modelClasses);
	if (eclass_bad)
	{
		delete[] eclass_bad->name;
		delete[] eclass_bad->comments;
		delete eclass_bad;
		eclass_bad = 0;
	}
}

// 0x00463240: entity list of the model entry in *pm, loaded from path
bool FUN_00463240(entitymodel_t **pm, const char *path)
{
	entity_t *list = (entity_t *)&(*pm)->entities;
	list->prev = list->next = list;
	if (!FUN_00468260(path, list))
	{
		list->prev = list->next = 0;
		return false;
	}
	for (entity_t *e = list->next; e != list; e = e->next)
	{
		e->refCount++;
#line 126
		eclass_assert1(e->refCount == 1);
		for (brushdef_t *b = e->brushes.onext; b != &e->brushes; b = b->onext)
		{
			b->refCount++;
			FUN_0045a220(b, 1);
			if (dword_011298b0 == 1 || dword_011298b0 == 2)
				FUN_00475350();
			b->version++;
		}
	}
	return true;
}

// 0x00463310
void FUN_00463310(const char *name, entitymodel_t **model)
{
	if (!_strnicmp(name, "xmodel", 6) && (name[6] == '/' || name[6] == '\\'))
	{
		Sys_Printf("Loading model %s...", name);
		(*model)->handle = dword_0059c308(name);
#line 145
		assert((*model)->handle);
		if (!XModelBad((XModel *)(*model)->handle))
		{
			Sys_Printf(" successful.\n");
			return;
		}
	}
	Sys_Printf(" failed.\n");
}

// 0x004633d0
void FUN_004633d0(const char *file, entitymodel_t **model)
{
	CString path;
	Sys_Printf("Loading prefab %s...", file);
	path = ValueForKey(dword_010bcd34, "mapspath");
	if (path.GetLength() > 0 && path[path.GetLength() - 1] != '\\')
		path += '\\';
	path += file;
	if (FUN_00463240(model, path))
		Sys_Printf(" successful.\n");
	else
		Sys_Printf(" failed.\n");
}

// 0x004634f0
void FUN_004634f0(void)
{
	eclass_t **link = &eclass;
	eclass_t *e = eclass;
	while (e)
	{
		if (e->model)
		{
			*link = e->next;
			FUN_004630c0(e);
		}
		else
			link = &e->next;
		e = *link;
	}
	CleanEntityList(g_modelClasses);
}

// 0x00463560
void FUN_00463560(eclass_t *ec)
{
	eclass_t *e = g_modelClasses;
	eclass_t **link = &g_modelClasses;
	while (e != ec)
	{
#line 210
		assert(e);
		link = &e->next;
		e = e->next;
	}
	*link = e->next;

	entitymodel_t *m = ec->model;
	while (m)
	{
		entitymodel_t *next = m->next;
		if (m->entities.next)
		{
			entity_t *ent = m->entities.next;
			entity_t *sentinel = (entity_t *)&m->entities;
			for (; ent != sentinel; ent = ent->next)
			{
#line 223
				eclass_assert1(ent->refCount >= 2);
				ent->refCount--;
				for (brushdef_t *b = ent->brushes.onext; b != &ent->brushes; b = b->onext)
				{
#line 227
					eclass_assert1(b->refCount >= 2);
					b->refCount--;
				}
			}
			m->entities.next = 0;
		}
		delete m;
		m = next;
	}
	delete[] ec->modelpath;
	delete[] ec->defaultmdl;
	delete[] ec->name;
	delete[] ec->comments;
	delete ec;
}

char *FUN_0046cb10(const char *str);

// 0x00463710
void setSpecialLoad(eclass_t *e, const char *pWhat, char *&p)
{
	CString str = e->comments;
	int n = str.Find(pWhat);
	if (n >= 0)
	{
		char *pText = e->comments + n + strlen(pWhat);
		if (*pText == '\"')
			pText++;

		str = "";
		while (*pText != '\"' && *pText != '\0')
		{
			str += *pText;
			pText++;
		}
		if (str.GetLength() > 0)
			p = FUN_0046cb10(str);
	}
}

// 0x00463860
eclass_t *FUN_00463860(char *text)
{
	char *t;
	int len;
	int r, i;
	char parms[256], *p;
	eclass_t *e;

	e = new eclass_t;
	memset(e, 0, sizeof(*e));

	text += strlen("/*QUAKED ");

	text = COM_Parse(text);
	e->name = new char[strlen(com_token) + 1];
	strcpy(e->name, com_token);
	debugname = e->name;
	e->color[0] = 1.0f; e->color[1] = 1.0f; e->color[2] = 1.0f;
	e->f30 = 1.0f;
	r = sscanf(text, " (%g %g %g)", &e->color[0], &e->color[1], &e->color[2]);
	if (r != 3)
		return e;
	e->mtl = FUN_00440840("$opaque");
	e->f38 = (float)e->mtl->width * 0.25f;
	e->f3c = (float)e->mtl->height * 0.25f;

	while (*text != ')')
	{
		if (!*text)
			return e;
		text++;
	}
	text++;

	text = COM_Parse(text);
	if (com_token[0] == '(')
	{
		e->fixedsize = 1;
		r = sscanf(text, "%f %f %f) (%f %f %f)", &e->mins[0], &e->mins[1], &e->mins[2],
			&e->maxs[0], &e->maxs[1], &e->maxs[2]);
		if (r != 6)
			return e;

		for (i = 0; i < 2; i++)
		{
			while (*text != ')')
			{
				if (!*text)
					return e;
				text++;
			}
			text++;
		}
	}

	p = parms;
	while (*text && *text != '\n')
		*p++ = *text++;
	*p = 0;
	text++;

	p = parms;
	for (i = 0; i < 8; i++)
	{
		p = COM_Parse(p);
		if (!p)
			break;
		strcpy(e->flagnames[i], com_token);
	}

	for (t = text; t[0] && !(t[0] == '*' && t[1] == '/'); t++)
		;

	len = t - text;
	e->comments = new char[len + 1];
	memcpy(e->comments, text, len);
	e->comments[len] = 0;

	setSpecialLoad(e, "defaultmdl=", e->defaultmdl);
	setSpecialLoad(e, "model=", e->modelpath);

	e->flags = 0;
	if (_stricmp(e->name, "worldspawn"))
		e->flags |= 2;
	if (!_stricmp(e->name, "light"))
		e->flags |= 1;
	else if (!_stricmp(e->name, "path"))
		e->flags |= 4;
	else if (!_stricmp(e->name, "misc_model"))
		e->flags |= 8;
	else if (!_stricmp(e->name, "script_model"))
		e->flags |= 8;
	else if (!_stricmp(e->name, "script_vehicle"))
		e->flags |= 8;
	else if (!_stricmp(e->name, "misc_prefab"))
		e->flags |= 0x10;
	else if (!_stricmp(e->name, "trigger_radius"))
		e->flags |= 0x40;
	else if (!_stricmp(e->name, "trigger_disk"))
		e->flags |= 0x80;
	else if (!strncmp(e->name, "node_", 5))
		e->flags |= 0x20;

	return e;
}

// 0x00463bf0: model entries from the ';' separated modelpath
void FUN_00463bf0(eclass_t *e)
{
	CStringList list(10);
	if (!e->model)
	{
		e->model = new entitymodel_t;
		memset(e->model, 0, sizeof(entitymodel_t));
	}
	char *copy = FUN_0046cb10(e->modelpath);
	for (char *tok = strtok(copy, ";"); tok; tok = strtok(0, ";"))
		list.AddHead(tok);
	entitymodel_t *model = e->model;
	for (int i = 0; i < list.GetCount(); i++)
	{
		if (e->flags & 0x10)
			FUN_004633d0((const char *)list.GetAt(list.FindIndex(i)), &model);
		else
			FUN_00463310((const char *)list.GetAt(list.FindIndex(i)), &model);
		model->next = new entitymodel_t;
		model = model->next;
		memset(model, 0, sizeof(entitymodel_t));
	}
	delete[] copy;
	delete[] e->modelpath;
	e->modelpath = 0;
}































// 0x00463d60 (221 B)
bool FUN_00463d60(eclass_t *e)
{
	assert(e);
	if (e->modelpath)
	{
		FUN_00463bf0(e);
		eclass_assert1(e->modelpath == NULL);
	}
	if (!e->model)
		return false;
	if (e->model->handle && !XModelBad((XModel *)e->model->handle))
		return true;
	return e->model->entities.next != NULL ? true : false;
}


// 0x00463e40
void FUN_00463e40(eclass_t *e, eclass_t **head)
{
	eclass_t *s = *head;
	if (!s)
	{
		*head = e;
		return;
	}
	if (_stricmp(e->name, s->name) < 0)
	{
		e->next = s;
		*head = e;
		return;
	}
	for (;;)
	{
		if (!s->next || _stricmp(e->name, s->next->name) < 0)
		{
			e->next = s->next;
			s->next = e;
			return;
		}
		s = s->next;
	}
}

// 0x00463e90
void FUN_00463e90(eclass_t *e)
{
	FUN_00463e40(e, &eclass);
}

#include <io.h>
extern bool g_bBuildList;
extern CString strDefFile;
void FUN_00463ea0(const char *path, int fromPaks);
void FUN_0046e160(char *dst, const char *src);
int LoadFile(const char *filename, void **buffer);
int FS_ReadFile(const char *qpath, void **buffer);
void FS_FreeFile(void *buffer);
extern int eclass_found;
extern eclass_t *eclass_e;
extern int parsing_single;

// 0x00463ea0: scan one file for /*QUAKED blocks, from disk or from the paks
void FUN_00463ea0(const char *filename, int fromPaks)
{
	int size;
	char *data;
	eclass_t *e;
	int i;
	char temp[1024];

	FUN_0046e160(temp, filename);
	if (strstr(temp, "/.#"))
	{
		Sys_Printf("IngoringFile: %s\n", temp);
		return;
	}
	Sys_Printf("ScanFile: %s\n", temp);
	if (fromPaks)
		size = FS_ReadFile(filename, (void **)&data);
	else
		size = LoadFile(filename, (void **)&data);
	eclass_found = 0;
	for (i = 0; i < size; i++)
	{
		if (!strncmp(data + i, "/*QUAKED", 8))
		{
			if (g_bBuildList)
			{
				CString strDef = "";
				int j = i;
				while (1)
				{
					strDef += *(data + j);
					if (*(data + j) == '/' && *(data + j - 1) == '*')
						break;
					j++;
				}
				strDef += "\r\n\r\n\r\n";
				strDefFile += strDef;
			}
			e = FUN_00463860(data + i);
			if (e)
				FUN_00463e40(e, &eclass);
			else
				printf("Error parsing: %s in %s\n", debugname, filename);
			eclass_e = e;
			eclass_found = 1;
			if (parsing_single)
				break;
		}
	}
	if (fromPaks)
		FS_FreeFile(data);
	else
		free(data);
}

// 0x00464170
void FUN_00464170(char *path)
{
	struct _finddata_t fileinfo;
	char buf[1024];
	char filebase[1024];
	char temp[1024];
	char filename[1024];
	char tail[1024];
	int handle;
	char *s;

	FUN_0046e160(temp, path);
	Sys_Printf("Eclass_InitForSourceDirectory: %s\n", temp);
	strcpy(filebase, path);
	s = filebase + strlen(filebase) - 1;
	while (*s != '\\' && *s != '/' && s != filebase)
		s--;
	*s = 0;
	CleanUpEntities();
	eclass = NULL;
	if (g_bBuildList)
		strDefFile = "// THIS FILE IS AUTOGENERATED, DO NOT MODIFY \n\n";
	handle = _findfirst(path, &fileinfo);
	if (handle != -1)
	{
		do
		{
			sprintf(filename, "%s\\%s", filebase, fileinfo.name);
			FUN_00463ea0(filename, 0);
		} while (_findnext(handle, &fileinfo) != -1);
		_findclose(handle);
	}
	if (!strstr(path, ".def"))
	{
		strcpy(buf, path);
		int i = (int)strlen(buf) - 1;
		while (i > 0 && buf[i] != '/' && buf[i] != '\\')
			i--;
		if (i > 0)
		{
			strcpy(tail, buf + i);
			buf[i] = 0;
			strcat(buf, "_mp");
			strcat(buf, tail);
			FUN_0046e160(temp, buf);
			Sys_Printf("AdditionalSourceDirectory: %s\n", temp);
			strcpy(filebase, buf);
			s = filebase + strlen(filebase) - 1;
			while (*s != '\\' && *s != '/' && s != filebase)
				s--;
			*s = 0;
			handle = _findfirst(buf, &fileinfo);
			if (handle != -1)
			{
				do
				{
					sprintf(filename, "%s\\%s", filebase, fileinfo.name);
					FUN_00463ea0(filename, 0);
				} while (_findnext(handle, &fileinfo) != -1);
				_findclose(handle);
			}
			strcpy(buf, path);
			i = (int)strlen(buf);
			int seen = 0;
			i--;
			for (; i > 0; i--)
			{
				if (buf[i] == '/' || buf[i] == '\\')
				{
					if (seen)
						break;
					seen = 1;
				}
			}
			if (i > 0)
			{
				strcpy(tail, buf + i);
				buf[i] = 0;
				strcat(buf, "/b");
				strcat(buf, tail + 1);
				{
					const char *src = buf;
					char *dst = temp;
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
				Sys_Printf("AdditionalSourceDirectory: %s\n", temp);
				strcpy(filebase, buf);
				s = filebase + strlen(filebase) - 1;
				while (*s != '\\' && *s != '/' && s != filebase)
					s--;
				*s = 0;
				handle = _findfirst(buf, &fileinfo);
				if (handle != -1)
				{
					do
					{
						sprintf(filename, "%s\\%s", filebase, fileinfo.name);
						FUN_00463ea0(filename, 0);
					} while (_findnext(handle, &fileinfo) != -1);
					_findclose(handle);
				}
			}
		}
	}
	if (g_bBuildList)
	{
		CFile file;
		if (file.Open("newdefs.def", CFile::modeCreate | CFile::modeWrite))
		{
			file.Write(strDefFile.GetBuffer(0), strDefFile.GetLength());
			file.Close();
		}
	}
	eclass_bad = FUN_00463860("/*QUAKED UNKNOWN_CLASS (0 0.5 0) ?");
}

// 0x00464770
eclass_t *FUN_00464770(const char *name, int hasBrushes)
{
	eclass_t *e;
	char init[1024];

	if (!name)
		return eclass_bad;
	for (e = eclass; e; e = e->next)
		if (!_stricmp(name, e->name))
			return e;
	if (hasBrushes)
		sprintf(init, "/*QUAKED %s (0 0.5 0) ?\nNot found in source.\n", name);
	else
		sprintf(init, "/*QUAKED %s (0 0.5 0) (-8 -8 -8) (8 8 8)\nNot found in source.\n", name);
	e = FUN_00463860(init);
	FUN_00463e40(e, &eclass);
	return e;
}

// 0x00464830
bool FUN_00464830(const char *modelName)
{
#line 750
	assert(modelName);
#line 751
	assert(modelName[0]);
	for (eclass_t *e = g_modelClasses; e; e = e->next)
	{
		if (!_stricmp(modelName, e->name))
		{
#line 757
			assert(Eclass_hasModel(e));
			return true;
		}
	}
	return false;
}

// 0x00464930
eclass_t *FUN_00464930(const char *name, entity_t *ent)
{
	if (!name || !strlen(name))
		return 0;
	eclass_t *e;
	for (e = g_modelClasses; e; e = e->next)
		if (!_stricmp(name, e->name))
			break;
	if (e)
	{
		if ((ent->eclass->flags ^ e->flags) & 0x10)
			return 0;
#line 779
		assert(Eclass_hasModel(e));
		ent->modelClass = e;
		return e;
	}
	dword_0059c450();
	e = new eclass_t;
	memset(e, 0, sizeof(eclass_t));
	e->name = FUN_0046cb10(name);
	e->modelpath = FUN_0046cb10(name);
	e->flags |= ent->eclass->flags & 0x10;
	e->color[0] = e->color[2] = 0.85f;
	eclass_t *base = FUN_00464770(name, 0);
	e->mins[0] = base->mins[0];
	e->mins[1] = base->mins[1];
	e->mins[2] = base->mins[2];
	e->maxs[0] = base->maxs[0];
	e->maxs[1] = base->maxs[1];
	e->maxs[2] = base->maxs[2];
	if (base->defaultmdl)
		e->defaultmdl = FUN_0046cb10(base->defaultmdl);
	if (Eclass_hasModel(e))
	{
		FUN_00463e40(e, &g_modelClasses);
		ent->modelClass = e;
		dword_0059c44c();
		return e;
	}
	FUN_004630c0(e);
	dword_0059c44c();
	return 0;
}
