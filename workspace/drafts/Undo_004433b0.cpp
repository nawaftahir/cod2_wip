// 0x004433b0 (476 B retail, 468/480 B candidate) - Undo_ClearRedo
// Regresses GraphGetValueFromFraction 0x004832c0 to 76%, 828/832 B, first diff +0x5 under /GL.
// Moved to drafts per Rule 5.

#include "stdafx.h"
#include "../universal/assertive.h"

struct brush_t
{
	brush_t *oprev;       // 0x00
	brush_t *onext;       // 0x04
	void *owner;          // 0x08
	unsigned char pad_0c[0x10]; // 0x0c
	int refCount;         // 0x1c
	unsigned char pad_20[0x28]; // 0x20
};

struct entity_s
{
	entity_s *prev;       // 0x00
	entity_s *next;       // 0x04
	unsigned char pad_08[0x70]; // 0x08
	int refCount;         // 0x78
};

struct undo_s
{
	double time;          // 0x00
	int id;               // 0x08
	int done;             // 0x0c
	const char *operation;// 0x10
	brush_t brushlist;    // 0x14 (72 bytes)
	entity_s entitylist;  // 0x5c (124 bytes)
	undo_s *prev;         // 0xd8
	undo_s *next;         // 0xdc
};
typedef undo_s undo_t;

extern undo_s *g_redolist;
extern undo_s *g_lastredo;
extern int g_redoId;

void FUN_004432a0(brush_t *brush);
void Brush_Free_R(brush_t *def);
void Entity_Free_R(entity_s *e);

#define iassert(expr) \
	do { \
		static bool s_assertDisable; \
		if ( !(expr) && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 1, 1 ) ) \
			{ \
			case 0: DebugBreak(); break; \
			case 2: s_assertDisable = true; break; \
			} \
		} \
	} while ( 0 )

void FUN_004433b0(void)
{
	undo_s *redo = g_redolist;
	while (redo)
	{
		undo_s *nextredo = redo->next;
		brush_t *brush = redo->brushlist.onext;

		while (brush != &redo->brushlist)
		{
			assert(brush);
			brush_t *pNext = brush->onext;
			FUN_004432a0(brush);
			vassert((brush->refCount == 0), "(brush->refCount) = %i", brush->refCount);
			Brush_Free_R(brush);
			brush = pNext;
		}
		for (entity_s *entity = redo->entitylist.next; entity != &redo->entitylist; ) {
			assert(entity);
			entity_s *pNext = entity->next;
			iassert(entity->refCount == 1);
			--entity->refCount;
			Entity_Free_R(entity);
			entity = pNext;
		}

		delete redo;
		redo = nextredo;
	}
	g_redolist = NULL;
	g_lastredo = NULL;
	g_redoId = 1;
}
