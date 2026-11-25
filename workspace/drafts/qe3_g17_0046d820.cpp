// bulk-g17 draft, 92% (649/648 B). Kept out of the build: its call to FUN_004655f0 flips FUN_004656b0/FUN_00465780/FUN_00467510.
// 0x0046d820 (648 B): link entity e0 to entity e1 through script_linkTo/script_linkName
void FUN_0046d820(entity_t *e0, entity_t *e1)
{
	LinkList links;
	char buf[32];
	int linkName;
	int i;

	if (FUN_0046dab0(e0, e1))
		return;
	if (FUN_0046dab0(e1, e0))
		return;
	const char *name = ValueForKey(e1, "script_linkName");
	if (name && *name)
		linkName = atol(ValueForKey(e1, "script_linkName"));
	else
	{
		int highest = 0;
		for (entity_t *e = entities.next; e != &entities; e = e->next)
		{
			const char *n = ValueForKey(e, "script_linkName");
			if (n && *n)
			{
				int id = atol(n);
				if (id > highest)
					highest = id;
			}
		}
		linkName = highest + 1;
	}
	sprintf(buf, "%i", linkName);
	FUN_00465bf0(e1, "script_linkName", buf);
	const char *newName = ValueForKey(e1, "script_linkName");
	const char *linkTo = ValueForKey(e0, "script_linkTo");
	if (!linkTo || !*linkTo)
	{
		FUN_00465bf0(e0, "script_linkTo", newName);
		return;
	}
	FUN_0046d710(links.id, linkTo);
	if (links.full)
		Sys_Printf("Exceeded maximum links\n");
	for (i = 0; i < links.size; i++)
	{
		if (links.id[i] == linkName)
			goto linked;
	}
	links.id[links.size] = linkName;
	links.size++;
linked:
































	assert(links.size > 0);
	sprintf(buf, "%i", links.id[0]);
	for (i = 1; i < links.size; i++)
		strcat(buf, va(" %i", links.id[i]));
	FUN_00465bf0(e0, "script_linkTo", buf);
}
