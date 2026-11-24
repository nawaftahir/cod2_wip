// FUN_00466970 draft (f14): 63%, 656/649; callers flip 4656b0/467510/465780 when linked
void FUN_00466970(entity_t *e, bool use_region, FILE *f)
{
	char buf[128];
	NormalFileWrapper wrapper(f);

	if (use_region)
	{
		if (!strcmp(ValueForKey(e->epairs, "classname"), "info_player_start"))
		{
			float origin[3];
			const float *camOrigin = dword_01233488->camWnd->origin;
			origin[0] = camOrigin[0];
			origin[1] = camOrigin[1];
			origin[2] = camOrigin[2];
			fprintf(f, "{\n");
			fprintf(f, "\"classname\" \"info_player_start\"\n");
			fprintf(f, "\"origin\" \"%.0f %.0f %.0f\"\n", origin[0], origin[1], origin[2]);
			fprintf(f, "\"angles\" \"0 %.0f 0\"\n", dword_01233488->camWnd->angles[1]);
			fprintf(f, "}\n");
			return;
		}
		brushdef_t *b = e->brushes.onext;
		while (b != &e->brushes && Map_IsBrushFiltered((brushDef_t *)b))
			b = b->onext;
		if (b == &e->brushes)
			return;
	}
	if (e->eclass->fixedsize)
	{
		sprintf(buf, "%.0f %.0f %.0f", e->origin[0], e->origin[1], e->origin[2]);
		FUN_00465bf0(e, "origin", buf);
	}
	fprintf(f, "{\n");
	for (epair_t *ep = e->epairs; ep; ep = ep->next)
	{
		FUN_004668f0(ep->key, f);
		fputc(' ', f);
		FUN_004668f0(ep->value, f);
		fputc('\n', f);
	}
	if (!e->eclass->fixedsize)
	{
		int count = 0;
		for (brushdef_t *b = e->brushes.onext; b != &e->brushes; b = b->onext)
		{
			if (use_region)
			{
				int i;
				for (i = 0; i < 3; i++)
				{
					if (b->mins[i] > DAT_00591ce8[i] || b->maxs[i] < DAT_00591cdc[i])
						break;
				}
				if (i < 3)
					continue;
			}
			fprintf(f, "// brush %i\n", count);
			count++;
			FUN_004579e0(b, &wrapper);
		}
	}
	fprintf(f, "}\n");
}
