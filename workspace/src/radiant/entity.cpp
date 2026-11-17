#include <new>
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"

typedef float vec3_t[3];

struct epair_t
{
	epair_t *next;
	char *key;
	char *value;
};

struct eclass_t
{
	unsigned char pad00[4];
	char *unk04;
	int unk08;
	float mins[3];
	float maxs[3];
	unsigned char pad24[0x158 - 0x24];
	char *modelName;
	unsigned char pad15c[4];
	unsigned int flags;
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

// the placed instance of an entity; its definition is entity_t
struct brush_t
{
	brush_t *prev;
	brush_t *next;
	entityInst_t *owner;
	brush_t *ownerNext;
	brush_t *ownerPrev;
	unsigned char pad14[0x14];
};

struct entityInst_t
{
	entityInst_t *prev;
	entityInst_t *next;
	entity_t *def;
	brush_t brushes; // 0x0c
	void *modelInst; // 0x34
	entityInst_t *children; // 0x38
};

// brushes at 0x08 (0x48 B), eclass 0x50, epairs 0x64 (retail offsets)
struct entity_t
{
	entity_t *prev;
	entity_t *next;
	brushdef_t brushes;
	eclass_t *eclass;
	eclass_t *modelClass;
	float origin[3];
	epair_t *epairs;
	short version;
	unsigned char pad6a[2];
	int undoId;
	int redoId;
	int entityId;
	int refCount;
};

extern entity_t entities;
extern int DAT_011298b0;
extern int DAT_00591cd8;
extern char *FUN_0046cb10(const char *str);
extern eclass_t *FUN_00464770(int a, const char *name);
extern void Brush_InitSolid(brushdef_t *b, const vec3_t mins, const vec3_t maxs, eclass_t *eclass);
extern void FUN_0045a220(brushdef_t *b, bool snap);
extern void FUN_00457bd0(brushdef_t *b);
extern void FUN_00475350();
extern void Sys_MarkMapModified(void);
extern void FUN_0045b310(brushdef_t *b, const float *mins, const float *maxs);
extern void AddPointToBounds(const vec3_t v, vec3_t mins, vec3_t maxs);
void FUN_00467470(entity_t *e);
void FUN_00467510(entity_t *e);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
extern void FUN_0047a760(const char *fmt, ...);
extern char *va(const char *format, ...);
extern void FUN_00458af0(brushdef_t *def);
void FUN_00467240(brushdef_t *b);
#define assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)
extern void (__cdecl *dword_0059c490)(void *);
extern void FUN_00458c00(brush_t *b);
void FUN_004678c0(entityInst_t *e);
void FUN_004661f0(entity_t *e);

// 0x00464bb0 (88 B)
char *ValueForKey(epair_t *&e, const char *key)
{
	for (epair_t *ep = e; ep; ep = ep->next)
	{
		if (!strcmp(ep->key, key))
			return ep->value;
	}
	return "";
}

// 0x00464c10 (8 B)
char *ValueForKey(entity_t *ent, const char *key)
{
	return ValueForKey(ent->epairs, key);
}

// 0x00464c20 (60 B)
void FUN_00464c20(entityInst_t *inst)
{
	if (inst->children)
	{
		while (inst->children->next != inst->children)
			FUN_004678c0(inst->children->next);
		delete inst->children;
		inst->children = NULL;
	}
}

// 0x00464c60 (25 B)
void FUN_00464c60(entityInst_t *inst)
{
	if (inst->modelInst)
	{
		dword_0059c490(inst->modelInst);
		inst->modelInst = NULL;
	}
}

// 0x004655f0 (175 B)
void FUN_004655f0(entity_t *e, const char *key)
{
#line 202
	assert(e);
	if (e->eclass && e->eclass->unk08)
	{
		if (!_stricmp(key, "angles") || !_stricmp(key, "modelscale") || !_stricmp(key, "modelscale_vec"))
		{
			FUN_00467470(e);
			e->version++;
		}
	}
	if (!_stricmp(key, "model"))
	{
		e->modelClass = NULL;
		e->brushes.onext->modelFailed = 0;
		e->version++;
	}
}

// 0x004656a0 (5 B)
void FUN_004656a0(entity_t *e)
{
	e->version++;
}

// 0x004656b0 (202 B)
void FUN_004656b0(const char *key, entity_t *e, const char *value)
{
	if (!_stricmp(key, "classname") && e->eclass && e->eclass->unk08)
	{
		eclass_t *ec = FUN_00464770(0, value);

		if (ec->unk08)
		{
			vec3_t mins;
			vec3_t maxs;

			e->eclass = ec;
			FUN_00467510(e);
			mins[0] = ec->mins[0] + e->origin[0];
			mins[1] = ec->mins[1] + e->origin[1];
			mins[2] = ec->mins[2] + e->origin[2];
			maxs[0] = ec->maxs[0] + e->origin[0];
			maxs[1] = ec->maxs[1] + e->origin[1];
			maxs[2] = ec->maxs[2] + e->origin[2];
			brushdef_t *b = e->brushes.onext;
			Brush_InitSolid(b, mins, maxs, ec);
			FUN_0045a220(b, true);
			if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
				FUN_00475350();
			Sys_MarkMapModified();
			b->version++;
		}
	}
}

// 0x004657a0 (373 B)
void FUN_004657a0(entity_t *e, const char *key)
{
	if ((!_stricmp(key, "_color") || !_stricmp(key, "targetname")) && e->eclass->unk08)
	{
#line 277
		assert(e->brushes.onext);
#line 278
		assert(e->brushes.onext != &e->brushes);
#line 279
		assert(e->brushes.onext->onext == &e->brushes);
		if (!_stricmp(key, "_color")
			|| ((e->eclass->flags & 0x20) && strncmp(e->eclass->unk04, "node_scr", 8)
				&& strncmp(ValueForKey(e->epairs, "targetname"), "auto", 4)))
			FUN_00457bd0(e->brushes.onext);
	}
}

// 0x00465920 (328 B)
void FUN_00465920(entity_t *e, const char *key)
{
	float mins[3];
	float maxs[3];

#line 307
	assert(!stricmp( key, "radius" ) || !stricmp( key, "height" ));
	float radius = atof(ValueForKey(e->epairs, "radius"));
	if (radius <= 0)
		return;

	float height;
	if (!(e->eclass->flags & 0x80))
	{
		height = atof(ValueForKey(e->epairs, "height"));
		if (height <= 0)
			return;
	}
	else
		height = 32;
	FUN_0045a220(e->brushes.onext, true);
	mins[0] = e->origin[0] - radius;
	mins[1] = e->origin[1] - radius;
	mins[2] = e->eclass->mins[2] + e->origin[2];
	maxs[0] = e->origin[0] + radius;
	maxs[1] = e->origin[1] + radius;
	maxs[2] = mins[2] + height;
	AddPointToBounds(mins, e->brushes.onext->mins, e->brushes.onext->maxs);
	AddPointToBounds(maxs, e->brushes.onext->mins, e->brushes.onext->maxs);
}

// 0x00465a70 (111 B)
void FUN_00465a70(entity_t *e, const char *key)
{
	if (!_stricmp(key, "radius") && (e->eclass->flags & 0xc0))
	{
		float radius = atof(ValueForKey(e->epairs, "radius"));
		if (radius <= 0)
		{
			FUN_00465bf0(e, "radius", "256");
			return;
		}
		FUN_00465920(e, key);
	}
}

// 0x00465ae0 (111 B)
void FUN_00465ae0(entity_t *e, const char *key)
{
	if (!_stricmp(key, "height") && (e->eclass->flags & 0x40))
	{
		float height = atof(ValueForKey(e->epairs, "height"));
		if (height <= 0)
		{
			FUN_00465bf0(e, "height", "128");
			return;
		}
		FUN_00465920(e, key);
	}
}

// 0x00465b50 (145 B)
void FUN_00465b50(epair_t *&list, const char *key, const char *value)
{
	for (epair_t *ep = list; ep; ep = ep->next)
	{
		if (!strcmp(ep->key, key))
		{
			delete[] ep->value;
			ep->value = FUN_0046cb10(value);
			return;
		}
	}
	epair_t *ep = new epair_t;
	ep->next = list;
	list = ep;
	ep->key = FUN_0046cb10(key);
	ep->value = FUN_0046cb10(value);
}

// 0x00465bf0 (111 B)
void FUN_00465bf0(entity_t *e, const char *key, const char *value)
{
	if (e && key && *key)
	{
		FUN_00465b50(e->epairs, key, value);
		FUN_004655f0(e, key);
		FUN_004656b0(key, e, value);
		if (!_stricmp(key, "model"))
			FUN_00467510(e);
		FUN_004657a0(e, key);
		FUN_00465a70(e, key);
		FUN_00465ae0(e, key);
	}
}

// 0x00465c60 (117 B)
void DeleteKey(epair_t *&e, const char *key)
{
	epair_t **ep = &e;

	while (*ep)
	{
		epair_t *next = *ep;
		if (!strcmp(next->key, key))
		{
			*ep = next->next;
			delete[] next->key;
			delete[] next->value;
			delete next;
			return;
		}
		ep = &next->next;
	}
}

// 0x00465d10 (31 B)
float FloatForKey(entity_t *ent, const char *key)
{
	return atof(ValueForKey(ent, key));
}

// 0x00465d30 (18 B)
int IntForKey(entity_t *ent, const char *key)
{
	return atoi(ValueForKey(ent, key));
}

// 0x00465d50 (42 B)
void GetVectorForKey(entity_t *ent, const char *key, float *vec)
{
	sscanf(ValueForKey(ent, key), "%f %f %f", &vec[0], &vec[1], &vec[2]);
}

// 0x00465d80 (84 B)
bool FUN_00465d80(entity_t *ent, const char *key)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (!strcmp(ep->key, key))
			return true;
	}
	return false;
}

// 0x00465de0 (39 B)
bool FUN_00465de0(entity_t *ent, const char *sub)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (strstr(ep->key, sub))
			return true;
	}
	return false;
}

// 0x00465e10 (156 B)
bool FUN_00465e10(entity_t *ent, const char *key, const char *value)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (!strcmp(ep->key, key))
			return !strcmp(ep->value, value);
	}
	return false;
}

// 0x00465eb0 (111 B)
bool FUN_00465eb0(entity_t *ent, const char *sub, const char *value)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (strstr(ep->key, sub) && !strcmp(ep->value, value))
			return true;
	}
	return false;
}

// 0x00465f20 (104 B)
bool FUN_00465f20(entity_t *ent, const char *sub, const char *key)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (!strcmp(ep->key, key) && strstr(ep->value, sub))
			return true;
	}
	return false;
}

// 0x00465f90 (56 B)
bool FUN_00465f90(entity_t *ent, const char *keySub, const char *valueSub)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (strstr(ep->key, keySub) && strstr(ep->value, valueSub))
			return true;
	}
	return false;
}

// 0x00465fd0 (84 B)
bool FUN_00465fd0(entity_t *ent, const char *value)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (!strcmp(ep->value, value))
			return true;
	}
	return false;
}

// 0x00466030 (39 B)
bool FUN_00466030(entity_t *ent, const char *sub)
{
	for (epair_t *ep = ent->epairs; ep; ep = ep->next)
	{
		if (strstr(ep->value, sub))
			return true;
	}
	return false;
}

// 0x00466060 (107 B)
bool FUN_00466060(const char *classname)
{
	const char *names[3] = { "worldspawn", "func_group", "func_cullgroup" };

	for (unsigned int i = 0; i < 3; i++)
	{
		if (!strcmp(classname, names[i]))
			return true;
	}
	return false;
}

// 0x004660d0 (61 B)
void Entity_FreeEpairs(entity_t *e)
{
	epair_t *next;

	for (epair_t *ep = e->epairs; ep; ep = next)
	{
		next = ep->next;
		delete[] ep->key;
		delete[] ep->value;
		delete ep;
	}
	e->epairs = NULL;
}

// 0x00466110 (101 B)
void Entity_AddToList(entity_t *e, entity_t *list)
{
#line 623
	assert(!e->next && !e->prev);
	e->next = list;
	e->prev = list->prev;
	list->prev->next = e;
	list->prev = e;
}

// 0x00466180 (102 B)
void Entity_RemoveFromList(entity_t *e)
{
#line 634
	assert(e->next && e->prev);
	e->next->prev = e->prev;
	e->prev->next = e->next;
	e->prev = NULL;
	e->next = NULL;
}

// 0x004661f0 (446 B)
void FUN_004661f0(entity_t *e)
{
#line 645
	assert(e);
	assertMsg((e->refCount == 0), "(e->refCount) = %i", e->refCount);
	if (e->next)
		Entity_RemoveFromList(e);
	for (brushdef_t *b = e->brushes.onext; b != &e->brushes; b = e->brushes.onext)
	{
#line 654
		assert1(b->owner == e);
		assert1(b->oprev == &e->brushes);
		FUN_00467240(b);
#line 657
		vassert((b->refCount == 0), "(b->refCount) = %i", b->refCount);
		FUN_00458af0(b);
	}
	Entity_FreeEpairs(e);
	delete e;
}

// 0x004663b0 (66 B)
int Entity_MemorySize(entity_t *e)
{
	int size = _msize(e);

	for (epair_t *ep = e->epairs; ep; ep = ep->next)
	{
		size += _msize(ep->key);
		size += _msize(ep->value);
		size += _msize(ep);
	}
	return size;
}

// 0x004668b0 (51 B)
void FUN_004668b0(const float *a, const float *b, float *out)
{
	out[0] = a[0] + (b[0] - a[0]) / 2;
	out[1] = a[1] + (b[1] - a[1]) / 2;
	out[2] = a[2] + (b[2] - a[2]) / 2;
}

// 0x004668f0 (73 B)
void FUN_004668f0(const char *s, FILE *f)
{
	fputc('"', f);
	for (; *s; s++)
	{
		if (*s == '\\' || *s == '"')
			fputc('\\', f);
		fputc(*s, f);
	}
	fputc('"', f);
}

// 0x00466940 (41 B)
void FUN_00466940(const char *key, FILE *f, const char *value)
{
	FUN_004668f0(key, f);
	fputc(' ', f);
	FUN_004668f0(value, f);
	fputc('\n', f);
}

// 0x00467240 (152 B)
void FUN_00467240(brushdef_t *b)
{
	if (!b->onext || !b->oprev)
		FUN_0047a760("Entity_UnlinkBrush: Not currently linked");
#line 1115
	assertMsg((b->refCount > 0), "(b->refCount) = %i", b->refCount);
	b->refCount--;
	b->onext->oprev = b->oprev;
	b->oprev->onext = b->onext;
	b->oprev = NULL;
	b->onext = NULL;
	b->owner = NULL;
}

// 0x004672e0 (135 B)
entity_t *FUN_004672e0(entity_t *e)
{
	entity_t *n = new entity_t;
	memset(n, 0, sizeof(entity_t));
	n->entityId = DAT_00591cd8++;
	n->brushes.onext = n->brushes.oprev = &n->brushes;
	n->eclass = e->eclass;
	n->origin[0] = e->origin[0];
	n->origin[1] = e->origin[1];
	n->origin[2] = e->origin[2];
	for (epair_t *ep = e->epairs; ep; ep = ep->next)
	{
		epair_t *np = new epair_t;
		np->key = FUN_0046cb10(ep->key);
		np->value = FUN_0046cb10(ep->value);
		np->next = n->epairs;
		n->epairs = np;
	}
	return n;
}

// 0x00467370 (114 B)
int GetUniqueTargetId(int iHint)
{
	int iMin = 0;
	int iMax = 0;
	bool fFound = false;

	for (entity_t *pe = entities.next; pe != NULL && pe != &entities; pe = pe->next)
	{
		int i = IntForKey(pe, "target");
		if (i)
		{
			if (i < iMin)
				iMin = i;
			if (i > iMax)
				iMax = i;
			if (i == iHint)
				fFound = true;
		}
	}
	if (fFound)
		return iMax + 1;
	return iHint;
}

// 0x004673f0 (52 B)
entity_t *FUN_004673f0(const char *key, const char *value)
{
	for (entity_t *e = entities.next; e != &entities; e = e->next)
	{
		if (FUN_00465e10(e, key, value))
			return e;
	}
	return NULL;
}

// 0x00467430 (58 B)
entity_t *FindEntityInt(const char *pszKey, int iValue)
{
	for (entity_t *pe = entities.next; pe != &entities; pe = pe->next)
	{
		if (atoi(ValueForKey(pe, pszKey)) == iValue)
			return pe;
	}
	return NULL;
}

// 0x00467470 (153 B)
void FUN_00467470(entity_t *e)
{
	vec3_t mins;
	vec3_t maxs;

#line 1220
	assert(e);
	mins[0] = e->eclass->mins[0] + e->origin[0];
	mins[1] = e->eclass->mins[1] + e->origin[1];
	mins[2] = e->eclass->mins[2] + e->origin[2];
	maxs[0] = e->eclass->maxs[0] + e->origin[0];
	maxs[1] = e->eclass->maxs[1] + e->origin[1];
	maxs[2] = e->eclass->maxs[2] + e->origin[2];
	FUN_0045b310(e->brushes.onext, mins, maxs);
}

// 0x00467510 (200 B)
void FUN_00467510(entity_t *e)
{
	if (e->eclass && e->eclass->unk08 && e->eclass->modelName && *e->eclass->modelName)
	{
		const char *modelName = ValueForKey(e->epairs, "model");
#line 1245
		assert(modelName);
		if (_stricmp(modelName, e->eclass->modelName))
		{
			FUN_00465bf0(e, "model", e->eclass->modelName);
			e->version++;
			e->modelClass = NULL;
			e->brushes.onext->modelFailed = 0;
		}
	}
}

// 0x00467640 (59 B)
void FUN_00467640(entity_t *ent, float *vec)
{
	if (FUN_00465d80(ent, "angles"))
	{
		GetVectorForKey(ent, "angles", vec);
	}
	else
	{
		vec[0] = 0;
		vec[1] = 0;
		vec[2] = 0;
	}
}

// 0x00467680 (237 B)
void FUN_00467680(entity_t *entity, int delta)
{
#line 1290
	assert(entity);
	entity->refCount += delta;
#line 1292
	assert(entity->refCount > 0);

	for (brushdef_t *b = entity->brushes.onext; b != &entity->brushes; b = b->onext)
	{
		b->refCount += delta;
#line 1296
		assert(b->refCount > 0);
	}
}

// 0x004678c0 (432 B)
void FUN_004678c0(entityInst_t *e)
{
#line 1336
	assert(e);
	assert(e->def);
	assertMsg((e->def->refCount > 0), "(e->def->refCount) = %i", e->def->refCount);
	assert(e->next);
	assert(e->prev);
	e->next->prev = e->prev;
	e->prev->next = e->next;
	FUN_00464c20(e);
	FUN_00464c60(e);
	while (e->brushes.ownerNext != &e->brushes)
		FUN_00458c00(e->brushes.ownerNext);
	e->def->refCount--;
	if (e->def->refCount == 0)
		FUN_004661f0(e->def);
	delete e;
}
