#include "stdafx.h"
#include "../universal/assertive.h"

struct entity_t;
struct eclass_t;
struct epair_t;

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
	unsigned char pad20[0x28];
};

// retail offsets: brushes 0x08, eclass 0x50, undoId 0x6c, entityId 0x74, refCount 0x78
struct entity_t
{
	entity_t *prev;
	entity_t *next;
	brushdef_t brushes;
	eclass_t *eclass;
	unsigned char pad54[0x6c - 0x54];
	int undoId;
	int redoId;
	int entityId;
	int refCount;
};

struct entityInst_t
{
	entityInst_t *prev;
	entityInst_t *next;
	entity_t *def;
};

typedef struct undo_s
{
	double time;
	int id;
	int done;
	char *operation;
	brushdef_t brushlist;
	entity_t entitylist;
	undo_s *prev;
	undo_s *next;
} undo_t;

extern undo_t *g_lastredo;
extern undo_t *g_lastundo;
extern int g_undoMaxSize;
extern int g_undoMaxMemorySize;
extern int g_undoMemorySize;
extern entityInst_t *world_entity;

char *va(const char *format, ...);
extern brushdef_t *FUN_00458eb0(brushdef_t *brush);
extern entity_t *FUN_004672e0(entity_t *entity);
int BrushDef_MemorySize(const brushdef_t *b);
void Entity_AddToList(entity_t *e, entity_t *list);
int Entity_MemorySize(entity_t *e);

// 0x004431f0 (166 B)
void FUN_004431f0(brushdef_t *list, brushdef_t *brush)
{
#line 85
	assertMsg((brush->refCount >= 0), "(brush->refCount) = %i", brush->refCount);
	assert(brush->owner == NULL);

	++brush->refCount;
	brush->onext = list->onext;
	list->onext->oprev = brush;
	list->onext = brush;
	brush->oprev = list;
}


// 0x004432a0 (242 B)
void FUN_004432a0(brushdef_t *brush) {
	assertMsg((brush->refCount >= 1), "(brush->refCount) = %i", brush->refCount);
	--brush->refCount;

	assert(brush->onext);
	assert(brush->oprev);

	brush->onext->oprev = brush->oprev;
	brush->oprev->onext = brush->onext;
	brush->onext = NULL;
	brush->oprev = NULL;
}

// 0x004433a0 (6 B)
undo_t *Undo_RedoAvailable(void)
{
	return g_lastredo;
}

extern "C" void FUN_00443590();

// 0x00443800 (27 B)
void Undo_SetMaxSize(int size)
{
	FUN_00443590();
	if (size < 1)
		g_undoMaxSize = 1;
	else
		g_undoMaxSize = size;
}

// 0x00443820 (6 B)
int Undo_GetMaxSize(void)
{
	return g_undoMaxSize;
}

// 0x00443850 (6 B)
int Undo_GetMaxMemorySize(void)
{
	return g_undoMaxMemorySize;
}

// 0x00443c30 (159 B)
bool FUN_00443c30(undo_t *undo, brushdef_t *brush)
{
#line 335
	assert(undo);
	assert(brush);
	return brush->undoId == g_lastundo->id;
}

// 0x00443cd0 (150 B)
bool FUN_00443cd0(undo_t *undo, entity_t *ent)
{
#line 351
	assert(undo);
	assert(ent);
	return ent->undoId == undo->id || ent == world_entity->def;
}

// 0x00443d90 (157 B)
void FUN_00443d90(brushdef_t *brush)
{
#line 380
	assert(brush);
	assert(g_lastundo);

	if (!FUN_00443c30(g_lastundo, brush))
	{
		brushdef_t *clone = FUN_00458eb0(brush);
		clone->ownerId = brush->owner->entityId;
		clone->undoId = brush->undoId;
		clone->owner = NULL;
		FUN_004431f0(&g_lastundo->brushlist, clone);
		brush->undoId = g_lastundo->id;
		g_undoMemorySize += BrushDef_MemorySize(clone);
	}
}

// 0x00443fd0 (229 B)
void FUN_00443fd0(entity_t *entity)
{
#line 498
	assert(entity);

	if (!FUN_00443cd0(g_lastundo, entity))
	{
		entity_t *clone = FUN_004672e0(entity);
		vassert((clone->refCount == 0), "(clone->refCount) = %i", clone->refCount);
		++clone->refCount;
		clone->undoId = entity->undoId;
		clone->entityId = entity->entityId;
		entity->undoId = g_lastundo->id;
		Entity_AddToList(clone, &g_lastundo->entitylist);
		g_undoMemorySize += Entity_MemorySize(clone);
	}
}

// 0x00445020 (14 B)
bool FUN_00445020(void)
{
	return g_lastredo != NULL;
}

// 0x00445030 (25 B)
int Undo_UndoAvailable(void)
{
	if (g_lastundo)
	{
		if (g_lastundo->done)
			return true;
	}
	return false;
}
