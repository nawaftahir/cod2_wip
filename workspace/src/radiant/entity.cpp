#include <new>
#include <malloc.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"
#include "../universal/com_math.h"

typedef float vec3_t[3];

struct epair_t
{
	epair_t *next;
	char *key;
	char *value;
};

struct modelDef_t;
struct eclass_t
{
	unsigned char pad00[4];
	char *unk04;
	int fixedsize;
	float mins[3];
	float maxs[3];
	unsigned char pad24[0x34 - 0x24];
	unsigned char texdef[0x20];
	unsigned char pad54[0x154 - 0x54];
	modelDef_t *model;
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
	brushdef_t *def;
	unsigned char pad18[0x10];
};

struct entityInst_t
{
	entityInst_t *prev;
	entityInst_t *next;
	entity_t *def;
	brush_t brushes; // 0x0c
	void *modelInst; // 0x34
	entityInst_t *prefab; // 0x38
	short version; // 0x3c
	unsigned char pad3e[2];
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

// the loaded model of a prefab eclass; its entity list head sits at +0x08
struct modelDef_t
{
	unsigned char pad00[4];
	void *handle;
	struct { entity_t *prev; entity_t *next; } entities;
};

struct orientation_t { float origin[3]; float axis[3][3]; };
#define ECLASS_PREFAB 0x10

void AngleVectors(const float *angles, float *forward, float *right, float *up);
void DeleteKey(epair_t *&e, const char *key);
char *Com_Parse(const char **data_p);
char *Com_ParseOnLine(const char **data_p);
void Radiant_Error(const char *fmt, ...);
void Warning(const char *error, ...);
brushdef_t *FUN_00457270(const char *token, const char **data);
void FUN_0045b260(brushdef_t *b, const float *rot, const float *origin);
struct texdef_t;
brushdef_t *BrushDef_Create(const vec3_t mins, const vec3_t maxs, eclass_t *eclass, const texdef_t *td);
eclass_t *FUN_00464930(const char *name, entity_t *ent);
bool FUN_0045b420(brush_t *b);
void FUN_0045af00(brush_t *b);
void FUN_0045d240(const brushdef_t *b, const orientation_t *or, float *mins, float *maxs);
brush_t *FUN_00458440(brushdef_t *def, entity_t *owner);
void FUN_00459210(brush_t *b, brush_t *list);
bool FUN_00465d80(entity_t *ent, const char *key);
void FUN_00464c80(entityInst_t *e, float *mins, float *maxs);
entityInst_t *FUN_00467770(entity_t *entDef, entityInst_t *list, brush_t *brushList);
void FUN_00467640(entity_t *ent, float *vec);
void FUN_004671b0(brushdef_t *b, entity_t *owner);

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
extern void FUN_00457bd0(brushdef_t *b);
#define assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)
extern void (__cdecl *dword_0059c490)(void *);
extern void Brush_Free(brush_t *b);
void FUN_004678c0(entityInst_t *e);
void FUN_004661f0(entity_t *e);
float Vec3Normalize(vec3_t v);
void AxisToAngles(float axis[3][3], float angles[3]);

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
	if (inst->prefab)
	{
		while (inst->prefab->next != inst->prefab)
			FUN_004678c0(inst->prefab->next);
		delete inst->prefab;
		inst->prefab = NULL;
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

// 0x00464c80 (1070 B)
extern orientation_t g_editorOrientation;
extern void *(__cdecl *dword_0059c48c)(void *model, const orientation_t *or, float scale);
extern void (__cdecl *dword_0059c494)(void *inst, const orientation_t *or, float scale);
extern void (__cdecl *dword_0059c498)(void *inst, float *hi, float *lo);
void OrientationConcatenate(const orientation_t *first, const orientation_t *second, orientation_t *out);
void OrientationPosToLocal(const orientation_t *or, const float *pos, float *out);

void FUN_00464c80(entityInst_t *ent, float *mins, float *maxs)
{
	vec3_t angles;
	vec3_t right;
	orientation_t or;
	orientation_t world;
	vec3_t lo;
	vec3_t hi;
	vec3_t local;
	float scale;

#line 66
	assert(ent);
	assert(ent->def);
	assert(ent->def->modelClass);
	assert(ent->def->modelClass->model);
	assert(ent->def->modelClass->model->handle);
	if (FUN_00465d80(ent->def, "angles"))
		sscanf(ValueForKey(ent->def, "angles"), "%f %f %f", &angles[0], &angles[1], &angles[2]);
	else
	{
		angles[0] = 0;
		angles[1] = 0;
		angles[2] = 0;
	}
	char *value = ValueForKey(ent->def, "modelscale");
	if (!value || (scale = (float)atof(value)) <= 0)
		scale = 1.0f;
	AngleVectors(angles, or.axis[0], right, or.axis[2]);
	or.axis[1][0] = 0 - right[0];
	or.axis[1][1] = 0 - right[1];
	or.axis[1][2] = 0 - right[2];
	const float *org = ent->def->origin;
	or.origin[0] = org[0];
	or.origin[1] = org[1];
	or.origin[2] = org[2];
	OrientationConcatenate(&or, &g_editorOrientation, &world);
	if (ent->modelInst)
		dword_0059c494(ent->modelInst, &world, scale);
	else
		ent->modelInst = dword_0059c48c(ent->def->modelClass->model->handle, &world, scale);
#line 95
	assert((mins == NULL && maxs == NULL) || (mins != NULL && maxs != NULL));
	if (ent->modelInst && mins && maxs)
	{
		dword_0059c498(ent->modelInst, hi, lo);
		mins[0] = 131072.0f;
		mins[1] = 131072.0f;
		mins[2] = 131072.0f;
		maxs[0] = -131072.0f;
		maxs[1] = -131072.0f;
		maxs[2] = -131072.0f;
		for (int i = 0; i < 8; i++)
		{
			right[0] = (i & 1) ? hi[0] : lo[0];
			right[1] = (i & 2) ? hi[1] : lo[1];
			right[2] = (i & 4) ? hi[2] : lo[2];
			OrientationPosToLocal(&g_editorOrientation, right, local);
			AddPointToBounds(local, mins, maxs);
		}
		for (int axis = 0; axis < 3; axis++)
		{
#line 111
			assert(maxs[axis] >= mins[axis]);
			if (maxs[axis] - mins[axis] <= 8.0f)
			{
				float mid = (mins[axis] + maxs[axis]) * 0.5f;
				maxs[axis] = mid + 4.0f;
				mins[axis] = mid - 4.0f;
			}
		}
	}
}

// 0x004650b0 (290 B)
void FUN_004650b0(entity_t *ent, orientation_t *or)
{
	vec3_t angles;
	vec3_t right;

#line 127
	assert(ent);
#line 128
	assert(or);
	if (FUN_00465d80(ent, "angles"))
		sscanf(ValueForKey(ent, "angles"), "%f %f %f", &angles[0], &angles[1], &angles[2]);
	else
	{
		angles[0] = 0;
		angles[1] = 0;
		angles[2] = 0;
	}
	float (*axis)[3] = or->axis;
	AngleVectors(angles, axis[0], right, axis[2]);
	axis[1][0] = 0 - right[0];
	axis[1][1] = 0 - right[1];
	axis[1][2] = 0 - right[2];
	or->origin[0] = ent->origin[0];
	or->origin[1] = ent->origin[1];
	or->origin[2] = ent->origin[2];
}

// 0x004651e0 (876 B), ent in ebx
void FUN_004651e0(entityInst_t *ent, float *mins, float *maxs)
{
	orientation_t or;

#line 144
	assert(ent);
	assert(ent->def);
	assert(ent->def->modelClass);
	assert(ent->def->modelClass->model);
	assert(ent->def->modelClass->model->entities.next);
	assert(mins);
	assert(maxs);
	assert1(ent->prefab == NULL);
	ent->prefab = new entityInst_t;
	memset(ent->prefab, 0, sizeof(entityInst_t));
	ent->prefab->next = ent->prefab;
	ent->prefab->prev = ent->prefab;
	ent->prefab->brushes.next = &ent->prefab->brushes;
	ent->prefab->brushes.prev = &ent->prefab->brushes;
	modelDef_t *model = ent->def->modelClass->model;
	for (entity_t *def = model->entities.next; def != (entity_t *)&model->entities; def = def->next)
	{
		entityInst_t *inst = FUN_00467770(def, ent->prefab, &ent->prefab->brushes);
		if (inst->def->eclass->flags & ECLASS_PREFAB)
		{
			brush_t *b = inst->brushes.ownerNext;
#line 167
			assert(b);
			if (b != &inst->brushes)
				FUN_0045b420(b);
		}
	}
	FUN_004650b0(ent->def, &or);
	mins[0] = 131072.0f;
	mins[1] = 131072.0f;
	mins[2] = 131072.0f;
	maxs[0] = -131072.0f;
	maxs[1] = -131072.0f;
	maxs[2] = -131072.0f;
	for (brush_t *b = ent->prefab->brushes.next; b != &ent->prefab->brushes; b = b->next)
		FUN_0045d240(b->def, &or, mins, maxs);
}

// 0x00465550 (34 B)
void FUN_00465550(entityInst_t *inst)
{
	FUN_00464c20(inst);
	FUN_00464c60(inst);
}

// 0x00465580 (102 B)
void FUN_00465580(entityInst_t *inst)
{
	if (inst->prefab)
	{
		for (brush_t *b = inst->prefab->brushes.next; b != &inst->prefab->brushes; b = b->next)
			FUN_0045af00(b);
		entityInst_t *head = inst->prefab;
		for (entityInst_t *c = head->next; c != head; c = c->next)
			FUN_00465580(c);
	}
	if (inst->modelInst)
		inst->modelInst = NULL;
	inst->version = inst->def->version - 1;
}

// 0x004655f0 (175 B)
void FUN_004655f0(entity_t *e, const char *key)
{
#line 202
	assert(e);
	if (e->eclass && e->eclass->fixedsize)
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
	if (!_stricmp(key, "classname") && e->eclass && e->eclass->fixedsize)
	{
		eclass_t *ec = FUN_00464770(0, value);

		if (ec->fixedsize)
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
	const char *tn;
	if ((!_stricmp(key, "_color") || !_stricmp(key, "targetname")) && e->eclass->fixedsize)
	{
#line 277
		assert(e->brushes.onext);
#line 278
		assert(e->brushes.onext != &e->brushes);
#line 279
		assert(e->brushes.onext->onext == &e->brushes);
		if (!_stricmp(key, "_color")
			|| ((e->eclass->flags & 0x20) && strncmp(e->eclass->unk04, "node_scr", 8)
				&& strncmp(tn = ValueForKey(e->epairs, "targetname"), "auto", 4)))
			FUN_00457bd0(e->brushes.onext);
	}
}

// 0x00465780 (29 B)
void FUN_00465780(entity_t *e, const char *key)
{
	if (!_stricmp(key, "model"))
		FUN_00467510(e);
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

// 0x00465ce0 (34 B)
void FUN_00465ce0(entity_t *e, const char *key)
{
	DeleteKey(e->epairs, key);
	FUN_004655f0(e, key);
	FUN_004657a0(e, key);
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

// 0x00466400 (54 B)
epair_t *FUN_00466400(const char **data, const char *key)
{
	epair_t *ep = new epair_t;

	ep->next = NULL;
	ep->key = FUN_0046cb10(key);
	ep->value = FUN_0046cb10(Com_ParseOnLine(data));
	return ep;
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
// g_pParentWnd->m_pCamWnd (+0x78c), camera origin/angles at +0x60/+0x6c
struct EntityCamProj { unsigned char pad00[0x60]; float origin[3]; float angles[3]; };
struct EntityMainFrameProj { unsigned char pad00[0x78c]; EntityCamProj *camWnd; };
extern EntityMainFrameProj *dword_01233488;
struct brushDef_t;
bool Map_IsBrushFiltered(brushDef_t *b);
void FUN_004579e0(brushdef_t *b, AbstractFileWrapper *f);

// 0x00466970 (649 B)
extern float DAT_00591cdc[3];
extern float DAT_00591ce8[3];

extern entityInst_t *world_entity;
extern brush_t selected_brushes;
void FUN_004579e0(brushdef_t *b, AbstractFileWrapper *f);

// 0x00466c00 (383 B), stream in ecx


// 0x004671b0 (142 B)
void FUN_004671b0(brushdef_t *b, entity_t *owner)
{
	if (b->oprev || b->onext)
		FUN_0047a760("Entity_LinkBrush: Allready linked");
	b->owner = owner;
#line 1097
	assertMsg((b->refCount >= 0), "(b->refCount) = %i", b->refCount);
	b->refCount++;
	b->onext = &owner->brushes;
	b->oprev = owner->brushes.oprev;
	owner->brushes.oprev->onext = b;
	owner->brushes.oprev = b;
	FUN_00457bd0(b);
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
	if (e->eclass && e->eclass->fixedsize && e->eclass->modelName && *e->eclass->modelName)
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

// 0x00467770 (333 B)
entityInst_t *FUN_00467770(entity_t *entDef, entityInst_t *list, brush_t *brushList)
{
#line 1307
	assert(entDef);
	entityInst_t *entInst = new entityInst_t;
	memset(entInst, 0, sizeof(entityInst_t));
	entInst->def = entDef;
#line 1311
	assert1(entInst->modelInst == NULL);
	assert1(entInst->prefab == NULL);
	entInst->version = entDef->version - 1;
	entInst->next = list;
	entInst->prev = list->prev;
	list->prev->next = entInst;
	list->prev = entInst;
	entInst->brushes.ownerNext = &entInst->brushes;
	entInst->brushes.ownerPrev = &entInst->brushes;
	for (brushdef_t *b = entDef->brushes.onext; b != &entDef->brushes; b = b->onext)
		FUN_00459210(FUN_00458440(b, (entity_t *)entInst), brushList);
	entDef->refCount++;
	return entInst;
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
		Brush_Free(e->brushes.ownerNext);
	e->def->refCount--;
	if (e->def->refCount == 0)
		FUN_004661f0(e->def);
	delete e;
}

// 0x00467a70 (361 B)
void FUN_00467a70(entityInst_t *e)
{
	vec3_t mins;
	vec3_t maxs;

#line 1363
	assert(e);
	if (e->version == e->def->version)
		return;
	FUN_00464c20(e);
	FUN_00464c60(e);
	if (e->def->eclass->flags & ECLASS_PREFAB)
		FUN_004651e0(e, mins, maxs);
	else
		FUN_00464c80(e, mins, maxs);
#line 1374
	assert(e->brushes.ownerNext != &e->brushes && e->brushes.ownerNext == e->brushes.ownerPrev);
	assert(e->brushes.ownerNext->def && e->brushes.ownerNext->def->refCount >= 2);
	FUN_0045b310(e->brushes.ownerNext->def, mins, maxs);
	e->version = e->def->version;
}
