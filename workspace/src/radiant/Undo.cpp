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

typedef struct undo_s
{
	double time;
	int id;
	int done;
} undo_t;

extern undo_t *g_lastredo;
extern undo_t *g_lastundo;
extern int g_undoMaxSize;
extern int g_undoMaxMemorySize;

char *va(const char *format, ...);

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










































// 0x004431f0 (166 B)
void FUN_004431f0(brush_t *list, brush_t *brush)
{
	assertMsg((brush->refCount >= 0), "(brush->refCount) = %i", brush->refCount);
	assert(brush->owner == NULL);

	++brush->refCount;
	brush->onext = list->onext;
	list->onext->oprev = brush;
	list->onext = brush;
	brush->oprev = list;
}


// 0x004432a0 (242 B)
void FUN_004432a0(brush_t *brush) {
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
