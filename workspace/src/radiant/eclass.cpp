#include "stdafx.h"
#include <string.h>
#include "../universal/assertive.h"

#define eclass_assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)

struct entity_t;

struct brushdef_t
{
	brushdef_t *oprev;
	brushdef_t *onext;
	unsigned char pad08[0x14];
	int refCount;
	unsigned char pad20[0x28];
};

// brushes sentinel at 0x08, refCount at 0x78 (retail offsets)
struct entity_t
{
	entity_t *prev;
	entity_t *next;
	brushdef_t brushes;
	unsigned char pad50[0x28];
	int refCount;
};

// a model entry: sentinel of its entity list at 0x08 (0x0c is its first node)
struct entitymodel_t
{
	entitymodel_t *next;
	void *handle;
	entity_t *entPrev;
	entity_t *entNext;
	unsigned char pad10[0x74];
};

struct eclass_t
{
	eclass_t *next;
	char *name;
	unsigned char pad08[0x48];
	char *comments;
	unsigned char pad54[0x100];
	entitymodel_t *model;
	char *defaultmdl;
	char *modelpath;
	unsigned int flags;
};

extern eclass_t *eclass;
extern eclass_t *g_modelClasses;

// 0x00463560
void FUN_00463560(eclass_t *ec)
{
	eclass_t *e = g_modelClasses;
	eclass_t **link = &g_modelClasses;
	while (e != ec)
	{
#line 210
		assert(e);
		link = &e->next;
		e = e->next;
	}
	*link = e->next;

	entitymodel_t *m = ec->model;
	while (m)
	{
		entitymodel_t *next = m->next;
		if (m->entNext)
		{
			entity_t *ent = m->entNext;
			entity_t *sentinel = (entity_t *)&m->entPrev;
			for (; ent != sentinel; ent = ent->next)
			{
#line 223
				eclass_assert1(ent->refCount >= 2);
				ent->refCount--;
				for (brushdef_t *b = ent->brushes.onext; b != &ent->brushes; b = b->onext)
				{
#line 227
					eclass_assert1(b->refCount >= 2);
					b->refCount--;
				}
			}
			m->entNext = 0;
		}
		delete m;
		m = next;
	}
	delete[] ec->modelpath;
	delete[] ec->defaultmdl;
	delete[] ec->name;
	delete[] ec->comments;
	delete ec;
}

// 0x00463e40
void FUN_00463e40(eclass_t *e, eclass_t **head)
{
	eclass_t *s = *head;
	if (!s)
	{
		*head = e;
		return;
	}
	if (_stricmp(e->name, s->name) < 0)
	{
		e->next = s;
		*head = e;
		return;
	}
	for (;;)
	{
		if (!s->next || _stricmp(e->name, s->next->name) < 0)
		{
			e->next = s->next;
			s->next = e;
			return;
		}
		s = s->next;
	}
}

// 0x00463e90
void FUN_00463e90(eclass_t *e)
{
	FUN_00463e40(e, &eclass);
}
