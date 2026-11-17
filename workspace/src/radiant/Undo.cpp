#include "stdafx.h"
#include "../universal/assertive.h"

struct entity_t;
struct epair_t;

struct eclass_t
{
	unsigned char pad00[8];
	int fixedsize;
};

// brush list node of the selection lists; the brush itself is def
struct selbrush_t
{
	selbrush_t *prev;
	selbrush_t *next;
	unsigned char pad08[0x0c];
	struct brushdef_t *def;
};

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
extern undo_t *g_redolist;
extern undo_t *g_undolist;
extern int g_redoId;
extern int g_undoId;
extern int g_undoSize;

// level-1 assert: retail passes 1 as the fourth argument
#define assert1(expr) \
	do { \
		static bool s_assertDisable; \
		if ( !(expr) && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 1, 1 ) ) \
			{ \
			case 0: \
				DebugBreak(); \
				break; \
			case 2: \
				s_assertDisable = true; \
				break; \
			} \
		} \
	} while ( 0 )

char *va(const char *format, ...);
void Sys_Printf(const char *text, ...);
extern brushdef_t *FUN_00458eb0(brushdef_t *brush);
extern entity_t *FUN_004672e0(entity_t *entity);
int BrushDef_MemorySize(const brushdef_t *b);
void Entity_AddToList(entity_t *e, entity_t *list);
int Entity_MemorySize(entity_t *e);
void FUN_00443fd0(entity_t *entity);
void FUN_00458af0(brushdef_t *def);
void FUN_004661f0(entity_t *e);
void FUN_00443590(void);

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

// 0x004433b0 (476 B)
void FUN_004433b0(void)
{
	undo_t *redo = g_redolist;
	while (redo)
	{
		undo_t *nextredo = redo->next;
		brushdef_t *brush = redo->brushlist.onext;
		while (brush != &redo->brushlist)
		{
#line 128
			assert(brush);
			brushdef_t *pNext = brush->onext;
			FUN_004432a0(brush);
			vassert((brush->refCount == 0), "(brush->refCount) = %i", brush->refCount);
			FUN_00458af0(brush);
			brush = pNext;
		}
		entity_t *entity = redo->entitylist.next;
		while (entity != &redo->entitylist)
		{
#line 136
			assert(entity);
			entity_t *pNext = entity->next;
			assert1(entity->refCount == 1);
			--entity->refCount;
			FUN_004661f0(entity);
			entity = pNext;
		}
		delete redo;
		redo = nextredo;
	}
	g_redolist = NULL;
	g_lastredo = NULL;
	g_redoId = 1;
}

// 0x00443590 (615 B)
void FUN_00443590(void)
{
	FUN_004433b0();
	undo_t *undo = g_undolist;
	while (undo)
	{
		undo_t *nextundo = undo->next;
		brushdef_t *brush = undo->brushlist.onext;
		while (brush != &undo->brushlist)
		{
#line 162
			assert(brush);
			brushdef_t *pNext = brush->onext;
			g_undoMemorySize -= BrushDef_MemorySize(brush);
			FUN_004432a0(brush);
			vassert((brush->refCount == 0), "(brush->refCount) = %i", brush->refCount);
			FUN_00458af0(brush);
			brush = pNext;
		}
		entity_t *entity = undo->entitylist.next;
		while (entity != &undo->entitylist)
		{
#line 171
			assert(entity);
			entity_t *pNext = entity->next;
			g_undoMemorySize -= Entity_MemorySize(entity);
			assert1(entity->refCount == 1);
			--entity->refCount;
			FUN_004661f0(entity);
			entity = pNext;
		}
		g_undoMemorySize -= sizeof(undo_t);
		delete undo;
		undo = nextundo;
	}
	g_undolist = NULL;
	g_lastundo = NULL;
	g_undoSize = 0;
	g_undoMemorySize = 0;
	g_undoId = 1;
}

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

// 0x00443860 (553 B)
void FUN_00443860(void)
{
	undo_t *undo = g_undolist;
	g_undolist = undo->next;
	g_undolist->prev = NULL;
	for (brushdef_t *brush = undo->brushlist.onext; brush != &undo->brushlist; brush = undo->brushlist.onext)
	{
#line 235
		assert(brush);
		g_undoMemorySize -= BrushDef_MemorySize(brush);
		assert1(brush->refCount == 1);
		FUN_004432a0(brush);
		vassert((brush->refCount == 0), "(brush->refCount) = %i", brush->refCount);
		FUN_00458af0(brush);
	}
	entity_t *entity = undo->entitylist.next;
	while (entity != &undo->entitylist)
	{
#line 244
		assert(entity);
		entity_t *pNext = entity->next;
		g_undoMemorySize -= Entity_MemorySize(entity);
		assert1(entity->refCount == 1);
		--entity->refCount;
		FUN_004661f0(entity);
		entity = pNext;
	}
	g_undoMemorySize -= sizeof(undo_t);
	delete undo;
	--g_undoSize;
}

// 0x00443c30 (159 B)
bool FUN_00443c30(undo_t *undo, brushdef_t *brush)
{
#line 335
	assert(undo);
	assert(brush);
	if (brush->undoId == g_lastundo->id)
		return true;
	return false;
}

// 0x00443cd0 (150 B)
bool FUN_00443cd0(undo_t *undo, entity_t *ent)
{
#line 351
	assert(undo);
	assert(ent);
	if (ent->undoId == undo->id)
		return true;
	if (ent == world_entity->def)
		return true;
	return false;
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

// 0x00443e70 (75 B)
void Undo_AddBrush(brushdef_t *brush)
{
	if (!g_lastundo)
	{
		Sys_Printf("Undo_AddBrush: no last undo.\n");
		return;
	}
	if (g_lastundo->entitylist.next != &g_lastundo->entitylist)
		Sys_Printf("Undo_AddBrush: WARNING adding brushes after entity.\n");
	if (brush->owner->eclass->fixedsize)
		FUN_00443fd0(brush->owner);
	FUN_00443d90(brush);
}

// 0x00443ec0 (92 B)
void Undo_AddBrushList(selbrush_t *list)
{
	if (!g_lastundo)
	{
		Sys_Printf("Undo_AddBrushList: no last undo.\n");
		return;
	}
	if (g_lastundo->entitylist.next != &g_lastundo->entitylist)
		Sys_Printf("Undo_AddBrushList: WARNING adding brushes after entity.\n");
	for (selbrush_t *b = list->prev; b != list; b = b->prev)
	{
		if (b->def->owner->eclass->fixedsize)
			FUN_00443fd0(b->def->owner);
		FUN_00443d90(b->def);
	}
}

// 0x00443f20 (34 B)
void FUN_00443f20(brushdef_t *brush)
{
	brush->undoId = g_lastundo->id;
	if (brush->owner->eclass->fixedsize)
		brush->owner->undoId = g_lastundo->id;
}

// 0x00443f50 (44 B)
void FUN_00443f50(brushdef_t *brush)
{
	if (!g_lastundo)
		return;
	if (g_lastundo->done)
		return;
	brush->undoId = g_lastundo->id;
	if (brush->owner->eclass->fixedsize)
		brush->owner->undoId = g_lastundo->id;
}

// 0x00443f80 (74 B)
void FUN_00443f80(selbrush_t *list)
{
	if (!g_lastundo)
		return;
	if (g_lastundo->done)
		return;
	for (selbrush_t *b = list->next; b != NULL && b != list; b = b->next)
	{
		brushdef_t *def = b->def;
		def->undoId = g_lastundo->id;
		entity_t *owner = def->owner;
		if (owner->eclass->fixedsize)
			owner->undoId = g_lastundo->id;
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

// 0x004440c0 (70 B)
void Undo_AddEntity(entity_t *ent)
{
	if (!g_lastundo)
	{
		Sys_Printf("Undo_AddEntity: no last undo.\n");
		return;
	}
	FUN_00443fd0(ent);
	if (ent != world_entity->def)
	{
		for (brushdef_t *b = ent->brushes.onext; b != &ent->brushes; b = b->onext)
			FUN_00443d90(b);
	}
}

// 0x00444110 (63 B)
void FUN_00444110(entity_t *ent)
{
	if (!g_lastundo)
		return;
	if (g_lastundo->done)
		return;
	if (ent == world_entity->def)
		return;
	ent->undoId = g_lastundo->id;
	for (brushdef_t *b = ent->brushes.onext; b != &ent->brushes; b = b->onext)
		b->undoId = g_lastundo->id;
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
