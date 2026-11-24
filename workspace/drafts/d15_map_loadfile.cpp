// Map_LoadFile 0x004683e0 (retail 1320 B). Quick-build: 61%, 1437/1320, first diff +0x17; with it DoMru 0x479c00 MATCHES.
// Needs (declared in map.cpp above FUN_00468260): world_entity/entityInsts macros, map_assert1_txt, UNKNOWN_01244d70 list,
// DAT_011298d4, VectorClear(float*) inline helper (retail uses the same inline for cam/xy origin in Map_New).
// Assert lines 278/287/319 are reached by blank-line padding after the existing "#line 231" (no new #line).
// Any caller of FUN_00468100 here (even a body of only SetCursor + FUN_00468100) flips FUN_00465550 and FUN_0046aee0 in the clean gate.
// 0x004683e0 (1320 B), filename in ecx
void Map_LoadFile(const char *filename)
{
	char temp[1024];
	float origin[3];

	DAT_01129e28 = SetCursor(LoadCursor(NULL, IDC_WAIT));
	FUN_00467e60();
	FUN_0046fbe0(true);
	char *out = temp;
	for (const char *in = filename; *in; in++, out++)
	{
		if (*in == '\\')
			*out = '/';
		else
			*out = *in;
	}
	*out = 0;
	Sys_Printf("Map_LoadFile: %s\n", temp);



	map_assert1_txt(!FUN_0046b550(), "!Map_EditingPrefab()");
	FUN_00468100();
	for (UNKNOWN_01244d70 *p = dword_01244d70; p; p = p->next)
		p->field08 = 0;
	DAT_011298d4 = 0;
	strcpy(currentmap, filename);
	DAT_010bcd30 = FUN_00468260(&entities, filename);


	map_assert2(world_entity == NULL);
	entity_t *next;
	for (entity_t *e = entities.next; e != &entities; e = next)
	{
		next = e->next;
		entityInst_t *inst = FUN_00467770(e, &entityInsts, &active_brushes);
		if (!strcmp(ValueForKey(e->epairs, "classname"), "worldspawn"))
		{
			if (world_entity)
			{
				Sys_Printf("WARNING: multiple worldspawn\n");
				FUN_004678c0(inst);
			}
			else
			{
				world_entity = inst;
			}
		}
		else if (e->eclass->nShowFlags & ECLASS_PREFAB)
		{
			brush_t *first = (brush_t *)inst->field18;
			if (first != (brush_t *)inst->pad0c)
				FUN_0045b420(first);
		}
	}
	if (!world_entity)
	{
		Sys_Printf("No worldspawn in map.\n");
		Map_New();
		return;
	}

	map_assert2(entityInsts.next == world_entity);
	Sys_Printf("--- LoadMapFile ---\n");
	Sys_Printf("%s\n", temp);
	Sys_Printf("%5i brushes\n", DAT_011298d4);
	Sys_Printf("%5i entities\n", DAT_010bcd30);
	Sys_Printf("Map_BuildAllDisplayLists\n");
	FUN_00467f00();
	entity_t *ent = FUN_004681b0();
	dword_01233488->cam->angles[0] = 0;
	if (ent)
	{
		sscanf(ValueForKey(ent->epairs, "origin"), "%f %f %f", &origin[0], &origin[1], &origin[2]);
		origin[2] += 60.0f;
		dword_01233488->cam->origin[0] = origin[0];
		dword_01233488->cam->origin[1] = origin[1];
		dword_01233488->cam->origin[2] = origin[2];
		dword_01233488->xy->origin[0] = origin[0];
		dword_01233488->xy->origin[1] = origin[1];
		dword_01233488->xy->origin[2] = origin[2];
		float *angles = dword_01233488->cam->angles;
		sscanf(ValueForKey(ent->epairs, "angles"), "%f %f %f", &angles[0], &angles[1], &angles[2]);
	}
	else
	{
		dword_01233488->cam->angles[1] = 0;
		VectorClear(dword_01233488->cam->origin);
		VectorClear(dword_01233488->xy->origin);
	}
	Map_RemoveRegion();
	FUN_00441600();
	DAT_010a4908 = 0;
	SetWindowText(dword_010bcd54, temp);
	FUN_00467e30();
	if (DAT_01129e28)
	{
		SetCursor(DAT_01129e28);
		DAT_01129e28 = NULL;
	}
	brush_t *b;
	for (b = selected_brushes.next; b != &selected_brushes; b = b->next)
		FUN_0045e0b0((brushdef_t *)b->def);
	for (b = active_brushes.next; b != &active_brushes; b = b->next)
		FUN_0045e0b0((brushdef_t *)b->def);
	FUN_0041e160("loaded map");
	g_nUpdateBits = -1;
}

