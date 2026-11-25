#include "stdafx.h"
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"
#include <stdio.h>

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

// 0x0046d0b0
void FUN_0046d0b0(char *out, const char *in, int size)
{
	char *filePart = 0;
	GetFullPathNameA(in, size, out, &filePart);
	if (!GetShortPathNameA(in, out, size))
		strcpy(out, in);
}

// 0x0046d390
void FUN_0046d390(void)
{
	Sys_Printf("Scanning single player weapons: %s/*\n", "weapons/sp");
	FUN_0046d190("weapons/sp");
	Sys_Printf("Scanning multiplayer weapons: %s/*\n", "weapons/mp");
	FUN_0046d190("weapons/mp");
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
bool FUN_0046e0c0(bool quiet)
{
	if (selected_brushes.next == &selected_brushes || selected_brushes.next->next != &selected_brushes)
	{
		if (!quiet)
			Sys_Printf("Error: you must have a single brush selected\n");
		return false;
	}
	if (selected_brushes.next->owner->def->eclass->fixedsize && !quiet)
	{
		Sys_Printf("Error: you cannot manipulate fixed size entities\n");
		return false;
	}
	return true;
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
