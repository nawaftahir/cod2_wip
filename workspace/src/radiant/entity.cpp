#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"

struct epair_t
{
	epair_t *next;
	char *key;
	char *value;
};

struct eclass_t;
struct entity_t;

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
struct entityInst_t
{
	entityInst_t *prev;
	entityInst_t *next;
	entity_t *def;
	unsigned char pad0c[0x28];
	void *modelInst; // 0x34
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
extern void FUN_0047a760(const char *fmt, ...);
extern char *va(const char *format, ...);
extern void (__cdecl *dword_0059c490)(void *);

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

// 0x00464c60 (25 B)
void FUN_00464c60(entityInst_t *inst)
{
	if (inst->modelInst)
	{
		dword_0059c490(inst->modelInst);
		inst->modelInst = NULL;
	}
}

// 0x004656a0 (5 B)
void FUN_004656a0(entity_t *e)
{
	e->version++;
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
