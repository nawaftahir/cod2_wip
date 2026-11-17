// Eclass_InitFromText 0x00463860: 99%, 907/907 B, first diff +0x6d (debugname store scheduled before the second sscanf arg push; retail after).
// Standalone draft: needs the eclass_t/qtexture_s structs and setSpecialLoad from workspace/src/radiant/eclass.cpp.
// In the tree it gets inlined into Eclass_ForName (275 B vs retail 188), so it is kept out of eclass.cpp until its other callers exist.
extern char com_token[];
extern char *debugname;
char *COM_Parse(char *data);
qtexture_s *FUN_00440840(const char *name);

// 0x00463860
eclass_t *Eclass_InitFromText(char *text)
{
	char *t;
	int len;
	int r, i;
	char parms[256], *p;
	eclass_t *e;

	e = new eclass_t;
	memset(e, 0, sizeof(*e));

	text += strlen("/*QUAKED ");

	text = COM_Parse(text);
	e->name = new char[strlen(com_token) + 1];
	strcpy(e->name, com_token);
	debugname = e->name;
	e->color[0] = e->color[1] = e->color[2] = 1.0f;
	e->f30 = 1.0f;
	r = sscanf(text, " (%g %g %g)", &e->color[0], &e->color[1], &e->color[2]);
	if (r != 3)
		return e;
	e->mtl = FUN_00440840("$opaque");
	e->f38 = (float)e->mtl->width * 0.25f;
	e->f3c = (float)e->mtl->height * 0.25f;

	while (*text != ')')
	{
		if (!*text)
			return e;
		text++;
	}
	text++;

	text = COM_Parse(text);
	if (com_token[0] == '(')
	{
		e->fixedsize = 1;
		r = sscanf(text, "%f %f %f) (%f %f %f)", &e->mins[0], &e->mins[1], &e->mins[2],
			&e->maxs[0], &e->maxs[1], &e->maxs[2]);
		if (r != 6)
			return e;

		for (i = 0; i < 2; i++)
		{
			while (*text != ')')
			{
				if (!*text)
					return e;
				text++;
			}
			text++;
		}
	}

	p = parms;
	while (*text && *text != '\n')
		*p++ = *text++;
	*p = 0;
	text++;

	p = parms;
	for (i = 0; i < 8; i++)
	{
		p = COM_Parse(p);
		if (!p)
			break;
		strcpy(e->flagnames[i], com_token);
	}

	for (t = text; t[0] && !(t[0] == '*' && t[1] == '/'); t++)
		;

	len = t - text;
	e->comments = new char[len + 1];
	memcpy(e->comments, text, len);
	e->comments[len] = 0;

	setSpecialLoad(e, "defaultmdl=", e->defaultmdl);
	setSpecialLoad(e, "model=", e->modelpath);

	e->flags = 0;
	if (_stricmp(e->name, "worldspawn"))
		e->flags |= 2;
	if (!_stricmp(e->name, "light"))
		e->flags |= 1;
	else if (!_stricmp(e->name, "path"))
		e->flags |= 4;
	else if (!_stricmp(e->name, "misc_model"))
		e->flags |= 8;
	else if (!_stricmp(e->name, "script_model"))
		e->flags |= 8;
	else if (!_stricmp(e->name, "script_vehicle"))
		e->flags |= 8;
	else if (!_stricmp(e->name, "misc_prefab"))
		e->flags |= 0x10;
	else if (!_stricmp(e->name, "trigger_radius"))
		e->flags |= 0x40;
	else if (!_stricmp(e->name, "trigger_disk"))
		e->flags |= 0x80;
	else if (!strncmp(e->name, "node_", 5))
		e->flags |= 0x20;

	return e;
}


// Eclass_ForName 0x00464770 (62%, 275/188 B with 463860 as extern: LTCG inlines FUN_00463e40, first diff +0x9b; the rest equals retail)
extern eclass_t *eclass_bad;

// 0x00464770
eclass_t *Eclass_ForName(const char *name, int hasBrushes)
{
	eclass_t *e;
	char init[1024];

	if (!name)
		return eclass_bad;

	for (e = eclass; e; e = e->next)
		if (!_stricmp(name, e->name))
			return e;

	if (hasBrushes)
	{
		sprintf(init, "/*QUAKED %s (0 0.5 0) ?\nNot found in source.\n", name);
		e = Eclass_InitFromText(init);
	}
	else
	{
		sprintf(init, "/*QUAKED %s (0 0.5 0) (-8 -8 -8) (8 8 8)\nNot found in source.\n", name);
		e = Eclass_InitFromText(init);
	}

	FUN_00463e40(e, &eclass);

	return e;
}
