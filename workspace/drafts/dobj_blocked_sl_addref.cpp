// Blocked on missing SL_AddRefToString (0x004a9b00, src/script/scr_stringlist.cpp).
// At 0x004a48e0 (131 B, 96% match), retail inlined SL_AddRefToString (GetRefString + inc word [eax+2]).

/*
void DObjClone(const DObj *from, XAnimTree_s *tree, DObj *obj)
{
	DObj *to;

#line 1126
	assert(obj);
	to = obj;
	*to = *from;
	to->skel = 0;

	if ( to->duplicateParts && to->duplicateParts != g_empty )
		SL_AddRefToString(to->duplicateParts);

	DObjSetTree(to, tree);
}
*/
