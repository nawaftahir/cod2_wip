// 0x00466d80 Entity_Create: 91%, sizes 1059/1059; draft, not linked
// 0x00466d80 (1059 B)
#include <windows.h>
void Sys_Printf(const char *fmt, ...);
extern entityInst_t entityInsts;
extern brush_t active_brushes;
extern int DAT_0123348c;
void Brush_RemoveFromEntity(brush_t *b, entity_t *owner);
void FUN_0046fb30();
void Entity_AddToList(entity_t *e, entity_t *list);
bool FUN_00465e10(entity_t *ent, const char *key, const char *value);
void FUN_00467240(brushdef_t *b);
void FUN_004671b0(brushdef_t *b, entity_t *owner);
brushdef_t *Brush_CreateFromTexdef(eclass_t *eclass, const texdef_t *td);

entity_t *FUN_00466d80(eclass_t *ec)
{
	vec3_t mins;
	vec3_t maxs;
	entity_t *e = NULL;
	entityInst_t *inst = NULL;
	bool found = false;

	for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
	{
		if (b->owner == world_entity)
			continue;
		if (ec->fixedsize)
		{
			Sys_Printf("Entity NOT created, can't make a point entity out of brushes\n");
			MessageBeep(MB_ICONASTERISK);
			return NULL;
		}
		if (found && e != b->def->owner)
		{
			Sys_Printf("Can't merge entities\n");
			MessageBeep(MB_ICONASTERISK);
			return NULL;
		}
		e = b->def->owner;
		inst = b->owner;
		found = true;
		if (!FUN_00465e10(e, "classname", ec->unk04))
		{
			Sys_Printf("Can't change entity type from %s to %s; ungroup first\n", ValueForKey(e->epairs, "classname"), ec->unk04);
			MessageBeep(MB_ICONASTERISK);
			return NULL;
		}
	}
	if (!found)
	{
		e = new entity_t;
		memset(e, 0, sizeof(entity_t));
		e->entityId = DAT_00591cd8++;
		e->brushes.onext = e->brushes.oprev = &e->brushes;
		FUN_00465bf0(e, "classname", ec->unk04);
		e->eclass = ec;
		Entity_AddToList(e, &entities);
		inst = FUN_00467770(e, &entityInsts, &active_brushes);
		if (ec->fixedsize)
		{
			const float *sel = selected_brushes.next->def->mins;
			for (int i = 0; i < 3; i++)
				e->origin[i] = sel[i] - ec->mins[i];
			mins[0] = e->origin[0] + ec->mins[0];
			mins[1] = ec->mins[1] + e->origin[1];
			mins[2] = ec->mins[2] + e->origin[2];
			maxs[0] = ec->maxs[0] + e->origin[0];
			maxs[1] = ec->maxs[1] + e->origin[1];
			maxs[2] = ec->maxs[2] + e->origin[2];
			brushdef_t *def = Brush_CreateFromTexdef(ec, (const texdef_t *)ec->texdef);
			Brush_InitSolid(def, mins, maxs, ec);
			FUN_004671b0(def, e);
			FUN_0045a220(def, true);
			if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
				FUN_00475350();
			Sys_MarkMapModified();
			def->version++;
			FUN_0046fb30();
			FUN_00459210(FUN_00458440(def, (entity_t *)inst), &selected_brushes);
			DAT_0123348c = -1;
			return (entity_t *)inst;
		}
		for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
		{
			FUN_00467240(b->def);
			FUN_004671b0(b->def, e);
			brushdef_t *bd = b->def;
			FUN_0045a220(bd, true);
			if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
				FUN_00475350();
			Sys_MarkMapModified();
			bd->version++;
			Brush_RemoveFromEntity(b, (entity_t *)inst);
		}
		DAT_0123348c = -1;
		return (entity_t *)inst;
	}
#line 1069
	assert1(inst);
	for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
	{
		if (b->owner != world_entity)
		{
#line 1075
			assert1(b->owner == inst);
			assert1(b->def->owner == e);
		}
		else
		{
			FUN_00467240(b->def);
			FUN_004671b0(b->def, e);
			brushdef_t *bd = b->def;
			FUN_0045a220(bd, true);
			if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
				FUN_00475350();
			Sys_MarkMapModified();
			bd->version++;
			Brush_RemoveFromEntity(b, (entity_t *)inst);
		}
	}
	DAT_0123348c = -1;
	return (entity_t *)inst;
}

