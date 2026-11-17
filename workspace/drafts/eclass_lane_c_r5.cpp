#include <stdio.h>
#include <string.h>

struct eclass_t
{
	eclass_t *next;
	char *name;
};

extern eclass_t *eclass;
extern eclass_t *eclass_bad;
extern eclass_t *FUN_00463860(const char *text);

void FUN_00463e40(eclass_t *e, eclass_t **head)
{
	eclass_t *s = *head;
	if (!s || _stricmp(e->name, s->name) < 0)
	{
		e->next = s;
		*head = e;
		return;
	}
	for (; s->next; s = s->next)
	{
		if (_stricmp(e->name, s->next->name) < 0)
			break;
	}
	e->next = s->next;
	s->next = e;
}

eclass_t *Eclass_ForName(const char *name, int hasBrushes)
{
	char buff[1024];

	if (!name)
		return eclass_bad;
	for (eclass_t *e = eclass; e; e = e->next)
	{
		if (!_stricmp(name, e->name))
			return e;
	}
	if (hasBrushes)
		sprintf(buff, "/*QUAKED %s (0 0.5 0) ?\nNot found in source.\n", name);
	else
		sprintf(buff, "/*QUAKED %s (0 0.5 0) (-8 -8 -8) (8 8 8)\nNot found in source.\n", name);
	eclass_t *e = FUN_00463860(buff);
	FUN_00463e40(e, &eclass);
	return e;
}
