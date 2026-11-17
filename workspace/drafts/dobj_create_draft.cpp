// DObjCreate 0x004a4480: best 57% (1073/1109 B, first diff +0x5). Register allocation differs: retail keeps obj in ebx,
// numModels in edi, zero in esi, and strength-reduces models[] (ptr in [ebp-0xc]) while modelParents uses index.
// Needs SL_FindString inline (declared in dobj.cpp) and DObjSetBounds esi convention (matched).

void DObjCreate(DObjModel_s *dobjModels, unsigned int numModels, XAnimTree_s *tree, DObj *obj, unsigned int entnum)
{
	int boneIndex;
	int newNumModels;
	int j;
	int index;
	int numBones;
	unsigned int name;
	const char *parentName;
	XModel *model;

#line 1025
	assert(dobjModels);
#line 1026
	assert(numModels > 0);
#line 1027
	assert((unsigned)numModels <= DOBJ_MAX_SUBMODELS);
#line 1030
	assert(obj);

	obj->skel = 0;
	obj->timeStamp = 0;
	obj->duplicateParts = 0;
	obj->ignoreCollision = 0;

	DObjSetTree(obj, tree);

	if ( tree )
		tree->entnum = entnum;

	newNumModels = 0;
	boneIndex = 0;

	for ( newNumModels = 0; (unsigned int)newNumModels < numModels; ++newNumModels, ++dobjModels )
	{
		model = dobjModels->model;

		obj->models[newNumModels] = model;
		obj->modelParents[newNumModels] = UNDEFINED_PART;
		obj->matOffset[newNumModels] = boneIndex;

		if ( dobjModels->ignoreCollision )
			obj->ignoreCollision |= 1 << newNumModels;

		if ( newNumModels )
		{
			numBones = model->parts->numBones;
#line 1064
			assert(numBones);
#line 1065
			assert(numBones < DOBJ_MAX_PARTS);

			parentName = dobjModels->boneName;

			if ( parentName && parentName[0] )
			{
				name = SL_FindString(parentName);

				if ( name )
				{
					for ( j = 0; j < newNumModels; ++j )
					{
						index = XModelGetBoneIndex(obj->models[j], name);

						if ( index >= 0 )
						{
							obj->modelParents[newNumModels] = obj->matOffset[j] + index;
							goto setmodel;
						}
					}
				}

				Com_Printf("WARNING: Part '%s' not found in model '%s' or any of its descendants\n", parentName, obj->models[0]->name);
#line 1086
				assert(obj->modelParents[newNumModels] == UNDEFINED_PART);
			}
		}
setmodel:
		if ( model )
		{
			if ( boneIndex + model->parts->numBones >= DOBJ_MAX_PARTS )
				Com_Error(ERR_DROP, "dobj for xmodel '%s' has more than %d bones", obj->models[0]->name, DOBJ_MAX_PARTS - 1);

			boneIndex += model->parts->numBones;
		}
	}

#line 1103
	assert(newNumModels == (unsigned char)newNumModels);
	obj->numModels = newNumModels;
#line 1105
	assert(boneIndex == (unsigned char)boneIndex);
	obj->numBones = boneIndex;
#line 1108
	assert(newNumModels > 0);

	DObjSetBounds(obj);
}

