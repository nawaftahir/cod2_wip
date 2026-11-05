#include "stdafx.h"

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
