// Map_New 0x00468d10: matches the referee (238 B) in a non-clean build, but in the clean gate it flips entity.cpp 0x465550/0x4656b0/0x465780/0x467510, map 0x46aee0 and MainFrm 0x414ce0 (callee binding)

void Map_New(void)
{
	Sys_Printf("Map_New\n");
	FUN_00467e60();
	FUN_00468100();
	entity_t *world = new entity_t;
	memset(world, 0, sizeof(*world));
	world->brushes.onext = &world->brushes;
	world->brushes.oprev = &world->brushes;
	FUN_00465bf0(world, "classname", "worldspawn");
	world->eclass = FUN_00464770(1, "worldspawn");
	Entity_AddToList(world, &entities);
	world_entity = FUN_00467770(world, &entityInsts, &active_brushes);
	dword_01233488->cam->angles[1] = 0;
	dword_01233488->cam->angles[0] = 0;
	VectorClear(dword_01233488->cam->origin);
	dword_01233488->cam->origin[2] = 48.0f;
	VectorClear(dword_01233488->xy->origin);
	FUN_00467e30();
	DAT_010a4908 = 0;
	g_nUpdateBits = -1;
}
