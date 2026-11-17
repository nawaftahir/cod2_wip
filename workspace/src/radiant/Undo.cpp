#include "stdafx.h"
#include "../universal/assertive.h"
#include <time.h>

struct entity_t;
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
	unsigned char pad54[0x64 - 0x54];
	epair_t *epairs;
	unsigned char pad68[4];
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

// instance node of the active and selected lists; the brush itself is def
struct brush_t
{
	brush_t *prev;
	brush_t *next;
	entityInst_t *owner;
	unsigned char pad0c[8];
	brushdef_t *def;
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
extern brush_t active_brushes;
extern brush_t selected_brushes;
extern entityInst_t entityInsts;
extern entity_t entities;

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
void FUN_00443860(void);
void FUN_0041d930(entityInst_t *list, const char *msg);
void FUN_0041e160(const char *msg);
void FUN_0046fbe0(int a);
void FUN_00458c00(brush_t *b);
void FUN_004671b0(brushdef_t *b, entity_t *owner);
brush_t *FUN_00458440(brushdef_t *b, entityInst_t *owner);
void FUN_00459210(brush_t *inst, brush_t *list);
void FUN_0045e0b0(brushdef_t *b);
void FUN_00467770(entity_t *e, entityInst_t *list, brush_t *brushes);
void FUN_004678c0(entityInst_t *e);
void FUN_00467240(brushdef_t *b);
void Entity_RemoveFromList(entity_t *e);
void Entity_FreeEpairs(entity_t *e);
extern char g_updateFlag;
extern int g_nUpdateBits;
void Sys_MarkMapModified(void);

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

// 0x00443a90 (411 B)
void Undo_GeneralStart(char *operation)
{
	FUN_0041e160(operation);
	if (g_lastundo)
	{
		if (!g_lastundo->done)
			Sys_Printf("Undo_Start: WARNING last undo not finished.\n");
	}
	undo_t *undo = new undo_t;
	if (!undo)
		return;
	memset(undo, 0, sizeof(undo_t));
	undo->brushlist.onext = &undo->brushlist;
	undo->brushlist.oprev = &undo->brushlist;
	undo->entitylist.next = &undo->entitylist;
	undo->entitylist.prev = &undo->entitylist;
	if (g_lastundo)
		g_lastundo->next = undo;
	else
		g_undolist = undo;
	undo->prev = g_lastundo;
	undo->next = NULL;
	g_lastundo = undo;
	undo->time = (double)clock() / CLOCKS_PER_SEC;
	if (g_undoId > g_undoMaxSize * 2 || g_undoId <= 0)
		g_undoId = 1;
	undo->id = g_undoId++;
	undo->done = 0;
	undo->operation = operation;
	for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
	{
		if (b->def->undoId == undo->id)
			b->def->undoId = 0;
	}
	for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
	{
		if (b->def->undoId == undo->id)
			b->def->undoId = 0;
	}
	for (entity_t *e = entities.next; e && e != &entities; e = e->next)
	{
		if (e->undoId == undo->id)
			e->undoId = 0;
	}
	g_undoMemorySize += sizeof(undo_t);
	g_undoSize++;
	if (g_undoSize > g_undoMaxSize)
		FUN_00443860();
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

// 0x00444150 (96 B)
void Undo_End(void)
{
	if (!g_lastundo)
		return;
	if (g_lastundo->done)
		return;
	g_lastundo->done = 1;
	while (g_undoMemorySize > g_undoMaxMemorySize)
	{
		if (g_undolist == g_lastundo)
			break;
		FUN_00443860();
	}
	Sys_MarkMapModified();
	FUN_0041e160(g_lastundo->operation);
}

// 0x004441b0 (2119 B)
void Undo_Undo(void)
{
	if (!g_lastundo)
	{
		Sys_Printf("Nothing left to undo.\n");
		return;
	}
	if (!g_lastundo->done)
		Sys_Printf("Undo_Undo: WARNING: last undo not yet finished!\n");
	FUN_0041e160(g_lastundo->operation);
	undo_t *undo = g_lastundo;
	if (undo->prev)
		undo->prev->next = NULL;
	else
		g_undolist = NULL;
	g_lastundo = undo->prev;
	undo_t *redo = new undo_t;
	if (!redo)
		return;
	memset(redo, 0, sizeof(undo_t));
	redo->brushlist.onext = &redo->brushlist;
	redo->brushlist.oprev = &redo->brushlist;
	redo->entitylist.next = &redo->entitylist;
	redo->entitylist.prev = &redo->entitylist;
	if (g_lastredo)
		g_lastredo->next = redo;
	else
		g_redolist = redo;
	redo->prev = g_lastredo;
	redo->next = NULL;
	g_lastredo = redo;
	redo->time = (double)clock() / CLOCKS_PER_SEC;
	redo->id = g_redoId++;
	redo->done = 1;
	redo->operation = undo->operation;
	FUN_0046fbe0(1);
	for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
	{
		if (b->def->redoId == redo->id)
			b->def->redoId = 0;
	}
	for (entity_t *e = entities.next; e != &entities; e = e->next)
	{
		if (e->redoId == redo->id)
			e->redoId = 0;
	}
	for (brush_t *b = active_brushes.next; b != &active_brushes; )
	{
		brush_t *pNext = b->next;
		brushdef_t *def = b->def;
		if (def->undoId == undo->id)
		{
			def->ownerId = def->owner->entityId;
#line 700
			vassert((b->def->refCount >= 2), "(brushInst->def->refCount) = %i", b->def->refCount);
			FUN_00467240(b->def);
			FUN_004431f0(&redo->brushlist, b->def);
			FUN_00458c00(b);
#line 705
			assert1(def->refCount == 1);
		}
		b = pNext;
	}
	for (entityInst_t *inst = entityInsts.next; inst != &entityInsts; )
	{
		entityInst_t *pNext = inst->next;
		entity_t *entity = inst->def;
		if (entity->undoId == undo->id)
		{
			Entity_RemoveFromList(entity);
			Entity_AddToList(entity, &redo->entitylist);
#line 718
			assert1(entity->refCount == 1);
			++entity->refCount;
			FUN_004678c0(inst);
#line 721
			assert1(entity->refCount == 1);
		}
		inst = pNext;
	}
	for (entity_t *entity = undo->entitylist.next; entity; entity = undo->entitylist.next)
	{
		if (entity == &undo->entitylist)
			break;
#line 726
		assert1(entity->refCount == 1);
		g_undoMemorySize -= Entity_MemorySize(entity);
		if (entity->entityId != world_entity->def->entityId)
		{
			Entity_RemoveFromList(entity);
			Entity_AddToList(entity, &entities);
			entity->redoId = redo->id;
#line 744
			assert1(entity->refCount == 1);
			FUN_00467770(entity, &entityInsts, &active_brushes);
			--entity->refCount;
#line 747
			assert1(entity->refCount == 1);
#line 748
			assert(entity->brushes.onext == &entity->brushes);
#line 749
			assert(entity->brushes.oprev == &entity->brushes);
		}
		else
		{
			entity_t *world = world_entity->def;
			Entity_FreeEpairs(world);
			world_entity->def->epairs = entity->epairs;
			entity->epairs = NULL;
			FUN_004661f0(entity);
		}
	}
	for (brushdef_t *brush = undo->brushlist.onext; brush != &undo->brushlist; brush = undo->brushlist.onext)
	{
		g_undoMemorySize -= BrushDef_MemorySize(brush);
		FUN_004432a0(brush);
		entityInst_t *inst = entityInsts.next;
		while (inst != &entityInsts && inst->def->entityId != brush->ownerId)
			inst = inst->next;
		if (inst == &entityInsts)
			inst = world_entity;
		FUN_004671b0(brush, inst->def);
		FUN_00459210(FUN_00458440(brush, inst), &selected_brushes);
		brush->redoId = redo->id;
	}
	Sys_Printf("%s undone.\n", undo->operation);
	g_undoMemorySize -= sizeof(undo_t);
	delete undo;
	--g_undoSize;
	if (--g_undoId <= 0)
		g_undoId = g_undoMaxSize * 2;
	g_updateFlag = 1;
	for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
		FUN_0045e0b0(b->def);
	for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
		FUN_0045e0b0(b->def);
	FUN_0041e160("after undo");
	g_nUpdateBits = -1;
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
