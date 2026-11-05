// 0x00443590 (615 B) - Undo_ClearUndo / Undo_Clear
// Uncalled function calling drafted 0x004433b0 and unwritten brush/entity functions.
// Moved to drafts per Rule 4/5.

#include "stdafx.h"
#include "../universal/assertive.h"

struct brush_t;
struct entity_s;
struct epair_t
{
	epair_t *next;
	char *key;
	char *value;
};

struct undo_s;
extern undo_s *g_undolist;
extern undo_s *g_lastundo;
extern int g_undoSize;
extern int g_undoMemorySize;
extern int g_undoId;

void Undo_ClearRedo(void);
void Undo_Refcount(brush_t *b);
int Brush_MemorySize(brush_t *b);
void Brush_Free_R(brush_t *b);
void Entity_Free_R(entity_s *e);
size_t _msize(void *memblock);

void Undo_ClearUndo(void)
{
	Undo_ClearRedo();

	// Iterates g_undolist and frees all undo nodes, updating memory size and clearing globals
}
