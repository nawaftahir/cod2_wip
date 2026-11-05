// Undo.cpp: placeholder, no function reconstructed yet. Code goes here in retail order.

// Q3Radiant undo.cpp; only the leading fields are used here
typedef struct undo_s
{
	double time;
	int id;
	int done;
} undo_t;

undo_t *g_lastundo;

int Undo_UndoAvailable(void)
{
	if (g_lastundo)
	{
		if (g_lastundo->done)
			return true;
	}
	return false;
}
