// l20 draft, 51% (4764/4448 B). Kept out of the build: in-tree it flips FUN_004656b0/465780/467510 (gate 3 failures, game bytes 359,364).
// Insert in map.cpp between FUN_00469950 and FUN_0046ab20, replacing the 'void FUN_004699b0(const char **data, int flags);' forward declaration.
// 0x004699b0 (4448 B): import a map buffer; renumbers script links, makes target names unique
#define MAX_LINKS 4096
struct LinkList
{
	int id[32];
	int size;
	bool full;
};
void FUN_004433b0();
void Undo_GeneralStart(char *operation);
void Undo_End();
void FUN_00444110(entity_t *ent);
void FUN_00443f50(brushdef_t *brush);
void FUN_00465ce0(entity_t *e, const char *key);
void FUN_00467240(brushdef_t *b);
void FUN_004661f0(entity_t *e);
void FUN_00469690(CString &name);
void UniqueTargetName(CString &name);
bool FUN_0045b420(brush_t *b);
int FUN_0046d710(int *out, const char *linkTo);
extern bool DAT_0058fbed;
char *va(const char *format, ...);

void FUN_004699b0(const char **data, int version)
{
	CString str;
	CString strUnique;
	CString strTarget;
	CString strTargetName;
	LinkList tokens;
	int linkIds[MAX_LINKS];
	int newIds[MAX_LINKS];
	char buf[32];
	int linkTotal = 0;
	int i;
	int j;

	FUN_0046fbe0(true);
	FUN_004433b0();
	Undo_GeneralStart("import buffer");
	for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
	{
		entity_t *ent = b->owner->def;

		str = ValueForKey(ent->epairs, "script_linkName");
		if (str.GetLength() > 0)
		{
			int id = atol(str);
			for (j = 0; j < linkTotal; j++)
			{
				if (linkIds[j] == id)
					break;
			}
			if (j >= linkTotal)
			{
				linkIds[linkTotal] = id;
				linkTotal++;
#line 910
				map_assert1(linkTotal < MAX_LINKS);
			}
		}
		str = ValueForKey(ent->epairs, "script_linkTo");
		if (str.GetLength() > 0)
		{
			FUN_0046d710(tokens.id, str);
#line 919
			map_assert1(tokens.size <= MAX_LINKS);
			for (i = 0; i < tokens.size; i++)
			{
				for (j = 0; j < linkTotal; j++)
				{
					if (linkIds[j] == tokens.id[i])
						break;
				}
				if (j >= linkTotal)
				{
					linkIds[linkTotal] = tokens.id[i];
					linkTotal++;
#line 940
					map_assert1(linkTotal < MAX_LINKS);
				}
			}
		}
	}
	for (i = 0; i < linkTotal; i++)
	{
		int newNum = 0;

		for (;;)
		{
			bool inOld = false;
			bool inNew = false;

			newNum++;
			for (j = 0; j < linkTotal; j++)
			{
				if (newNum == linkIds[j])
				{
					inOld = true;
					break;
				}
			}
			for (j = 0; j < i; j++)
			{
				if (newNum == newIds[j])
				{
					inNew = true;
					break;
				}
			}
			if (!inOld && !inNew)
				break;
		}
#line 971
		map_assert1(newNum != 0);
		newIds[i] = newNum;
	}
	CMapStringToString map(10);
	DAT_010bcd30 = 0;
	for (entity_t *ent = FUN_00466440(data, version, 0); ent; ent = FUN_00466440(data, version, 0))
	{
		FUN_00444110(ent);
		for (brushHead_t *b = ent->brushes.onext; b && b != &ent->brushes; b = b->onext)
			FUN_00443f50((brushdef_t *)b);
		if (!FUN_00465e10(ent, "classname", "worldspawn"))
		{
			entityInst_t *inst = FUN_00467770(ent, &DAT_010a43d0, &active_brushes);

			if (!DAT_012334f4)
			{
				str = ValueForKey(ent->epairs, "target");
				if (str.GetLength() > 0)
				{
					entity_t *other;

					for (other = entities.next; other != &entities; other = other->next)
					{
						if (FUN_00465e10(other, "target", str))
							break;
					}
					if (other != &entities && other)
					{
						if (!map.Lookup(str, strUnique))
						{
							UniqueTargetName(strUnique);
							map[str] = strUnique;
						}
						strTarget = strUnique;
						if (!strncmp(str, "auto", 4))
							FUN_00465bf0(ent, "target", strUnique);
					}
				}
				if (FUN_00469740(ent))
				{
					CString strExport;

					FUN_00469690(strExport);
					FUN_00465bf0(ent, "export", strExport);
				}
				str = ValueForKey(ent->epairs, "targetname");
				if (str.GetLength() > 0)
				{
					entity_t *other;

					for (other = entities.next; other != &entities; other = other->next)
					{
						if (FUN_00465e10(other, "targetname", str))
							break;
					}
					if (other != &entities && other)
					{
						if (!map.Lookup(str, strUnique))
						{
							UniqueTargetName(strUnique);
							map[str] = strUnique;
						}
						if (strncmp(str, "auto", 4))
						{
							FUN_00465bf0(ent, "targetname", str);
							strTargetName = str;
						}
						else
						{
							FUN_00465bf0(ent, "targetname", strUnique);
							strTargetName = strUnique;
						}
					}
				}
				str = ValueForKey(ent->epairs, "script_linkName");
				if (str.GetLength() > 0)
				{
					int id = atol(str);
					int idx = -1;

					for (j = 0; j < linkTotal; j++)
					{
						if (id == linkIds[j])
						{
							idx = j;
							break;
						}
					}
#line 1079
					map_assert1(idx != -1);
					str.Format("%i", newIds[idx]);
					FUN_00465bf0(ent, "script_linkName", str);
				}
				str = ValueForKey(ent->epairs, "script_linkTo");
				if (str.GetLength() > 0)
				{
					FUN_0046d710(tokens.id, str);
#line 1090
					map_assert1(tokens.size <= MAX_LINKS);
					sprintf(buf, "");
					for (i = 0; i < tokens.size; i++)
					{
						int idx = -1;

						for (j = 0; j < linkTotal; j++)
						{
							if (tokens.id[i] == linkIds[j])
							{
								idx = j;
								break;
							}
						}
#line 1110
						map_assert1(idx != -1);
						strcat(buf, va("%i ", newIds[idx]));
					}
					FUN_00465bf0(ent, "script_linkTo", buf);
				}
			}
			ent->next = &entities;
			ent->prev = entities.prev;
			entities.prev->next = ent;
			entities.prev = ent;
			DAT_010bcd30++;
			brush_t *head = (brush_t *)((char *)inst + 0xc);
			for (brush_t *sb = (brush_t *)inst->field18; sb != head; sb = *(brush_t **)((char *)sb + 0xc))
				FUN_0046f0b0(sb, true, false, false);
		}
		else
		{
			brushHead_t *next;

			for (brushHead_t *b = ent->brushes.onext; b != &ent->brushes; b = next)
			{
				next = b->onext;
				FUN_00467240((brushdef_t *)b);
				FUN_004671b0((brushdef_t *)b, DAT_012334ec->def);
				DAT_0058fbed = false;
				FUN_0045a220((brushdef_t *)b, true);
				if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
					FUN_00475350();
				((brushDef_t *)b)->version++;
				FUN_00459210(FUN_00458440((brushdef_t *)b, (entity_t *)DAT_012334ec), &selected_brushes);
				DAT_0058fbed = true;
			}
			FUN_004661f0(ent);
		}
	}
	for (entityInst_t *entInst = DAT_010a43d0.next; entInst != &DAT_010a43d0; entInst = entInst->next)
	{
#line 1132
		map_assert1(entInst);
#line 1133
		map_assert1(entInst->def);
#line 1134
		map_assert1(entInst->def->eclass);
		if (entInst->def->eclass->nShowFlags & ECLASS_PREFAB)
		{
			if ((char *)entInst->field18 != (char *)entInst + 0xc)
				FUN_0045b420((brush_t *)entInst->field18);
		}
	}
	for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
	{
		FUN_0045a220((brushdef_t *)b->def, true);
		if (DAT_011298b0 == 1 || DAT_011298b0 == 2)
			FUN_00475350();
		Sys_MarkMapModified();
		b->def->version++;
		entity_t *ent = b->owner->def;
		if (!FUN_00465e10(ent, "classname", "worldspawn"))
		{
			if (!strcmp(ValueForKey(ent->epairs, "target"), ValueForKey(ent->epairs, "targetname")))
			{
				FUN_00465ce0(ent, "targetname");
				FUN_00465ce0(b->owner->def, "target");
			}
		}
	}
	g_nUpdateBits = -1;
	DAT_010a4908 = 1;
	Undo_End();
}
