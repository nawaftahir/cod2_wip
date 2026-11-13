// Batch 2 deferred/unmatched drafts for src/radiant/brush.cpp.
// Extracted so workspace/src/radiant/brush.cpp stays clean under make gate
// (preventing uncalled bodies / /GL cross-TU optimization shifts).
//
// Also kept as required helpers inside workspace/src/radiant/brush.cpp:
// - 0x00453e70 Face_MakePlane (called by Brush_MakeFacePlanes)
// - 0x00456ed0 Texdef_SetDefault (called by Face_SetDefaultTexdefs; Attempt 3)
// - 0x00456f30 Face_SetDefaultTexdefs (called by Brush_SetDefaultTexdefs / Brush_CreateFromTexdef; Attempt 3)
// - 0x00457dd0 Brush_InitSolid (called by BrushDef_Create; Attempt 3)
//
// External /GL blockers & deferred functions:

// 0x00454600 Face_CloneWinding (not yet isolated / inline check)
void Face_CloneWinding(face_t *dst, const winding_t *w)
{
    if (w)
        dst->w = FUN_00447f60(w);
    else
        dst->w = NULL;
}

// 0x00454910 Face_Copy
void Face_Copy(face_t *dst, const face_t *src)
{
    memcpy(dst->texdef, src->texdef, sizeof(dst->texdef));
    dst->lmTexdef = src->lmTexdef;
    dst->color = src->color;
    dst->contents = src->contents;
    dst->toolFlags = src->toolFlags;
    memcpy(dst->planepts, src->planepts, sizeof(dst->planepts));
}

// 0x00454980 Face_FullClone
void Face_FullClone(face_t *dst, const face_t *src)
{
    Face_Copy(dst, src);
    memcpy(&dst->plane, &src->plane, 0x20);
    if (src->w)
        dst->w = FUN_00447f60(src->w);
    else
        dst->w = NULL;
}

// 0x00455980 Brush_UpdateAfterEdit (blocked on FUN_0045a220 / FUN_00475350 / FUN_0047a3c0)
void Brush_UpdateAfterEdit(brushdef_t *b, bool snap, bool sysUpdate)
{
    extern void FUN_0045a220(brushdef_t *b, bool snap);
    extern void FUN_00475350();
    extern void FUN_0047a3c0();
    FUN_0045a220(b, snap);
    if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
        FUN_00475350();
    if (sysUpdate)
        FUN_0047a3c0();
    b->version++;
}

// 0x00455a10 Brush_AddFace (needs Face_CloneWinding match)
face_t *Brush_AddFace(brushdef_t *b, const face_t *f)
{
    assert(b);
    assert(f);
    face_t *faceList = Face_AllocArray(b->faceCount + 1);
    assert(faceList);
    memcpy(faceList, b->faces, b->faceCount * sizeof(face_t));
    faceList[b->faceCount] = *f;
    Face_CloneWinding(&faceList[b->faceCount], f->w);
    for (int i = 0; i < b->faceCount; ++i)
        b->faces[i].w = NULL;
    if (b->faces)
        Face_FreeArray(b->faces, b->faceCount);
    b->faceCount++;
    b->faces = faceList;
    return &b->faces[b->faceCount - 1];
}

// 0x00455d10 Brush_SplitBrushByFace (needs BrushDef_CloneNoWinding, Brush_AddFace, Brush_UpdateAfterEdit, BrushDef_Free, FUN_004671b0)
void Brush_SplitBrushByFace(brushdef_t *in, const face_t *f, brushdef_t **front, brushdef_t **back)
{
    brushdef_t *b = BrushDef_CloneNoWinding(in);
    face_t *nf = Brush_AddFace(b, f);
    (*FUN_0059c468)(colorWhite, &nf->color);
    Brush_UpdateAfterEdit(b, true, true);
    Brush_RemoveEmptyFaces(b);
    if (b->faceCount < 4)
    {
        BrushDef_Free(b);
        *back = NULL;
    }
    else
    {
        FUN_004671b0(in->owner, b);
        *back = b;
    }

    b = BrushDef_CloneNoWinding(in);
    nf = Brush_AddFace(b, f);
    vec3_t temp;
    VectorCopy(nf->planepts[0], temp);
    VectorCopy(nf->planepts[1], nf->planepts[0]);
    VectorCopy(temp, nf->planepts[1]);
    (*FUN_0059c468)(colorWhite, &nf->color);
    Brush_UpdateAfterEdit(b, true, true);
    Brush_RemoveEmptyFaces(b);
    if (b->faceCount < 4)
    {
        BrushDef_Free(b);
        *front = NULL;
    }
    else
    {
        FUN_004671b0(in->owner, b);
        *front = b;
    }
}

// 0x00457bd0 Brush_UpdateColor (blocked on external /GL callees FUN_00465d80 / FUN_00465d50 in entity.cpp)
void Brush_UpdateColor(brushdef_t *b)
{
    assert(b);
    float color[4];
    entity_t *e = b->owner;
    if (!e || !e->eclass || !e->eclass->nShowFlags)
    {
        color[0] = 1.0f;
        color[1] = 1.0f;
        color[2] = 1.0f;
        color[3] = 1.0f;
    }
    else if (FUN_00465d80(e, "_color"))
    {
        FUN_00465d50(e, "_color", color);
        color[3] = 1.0f;
    }
    else
    {
        color[0] = e->eclass->color[0];
        color[1] = e->eclass->color[1];
        color[2] = e->eclass->color[2];
        color[3] = e->eclass->color[3];
    }
    unsigned int packedColor;
    (*FUN_0059c468)(color, &packedColor);
    for (int i = 0; i < b->faceCount; ++i)
        b->faces[i].color = packedColor;
    b->version++;
}

// 0x00458440 Brush_AllocForDef (510/511; blocked on external /GL callee FUN_004392a0)
brush_t *Brush_AllocForDef(brushdef_t *def, entity_t *owner)
{
    assert(def);
    assert(owner);
    assert(def->owner == owner->def);
    brush_t *b = Brush_Alloc();
    b->def = def;
    b->version = def->version - 1;
    def->refCount++;
    if (b->def->patch)
    {
        b->patch = FUN_004392a0(b->def->patch);
        brush_assert1(b->patch->def == b->def->patch);
    }
    Brush_RemoveFromEntity(b, owner);
    brush_assert1(b->owner == owner);
    brush_assert1(b->owner->def == b->def->owner);
    return b;
}

// 0x00458af0 BrushDef_Free (blocked on external /GL callee FUN_0042f660)
void BrushDef_Free(brushdef_t *def)
{
    assert(def);
    assertMsg((def->refCount == 0), "(def->refCount) = %i", def->refCount);
    if (def->patch)
        FUN_0042f660(def->patch);
    if (def->faces)
        Face_FreeArray(def->faces, def->faceCount);
    assert(def->onext == NULL);
    delete def;
}

// 0x00458c00 Brush_Free (blocked on external /GL callees FUN_004592f0 / FUN_0042f790 / FUN_00467240)
void Brush_Free(brush_t *b)
{
    if (b->next)
        FUN_004592f0(b);
    if (b->patch)
        FUN_0042f790(b->patch);
    if (b->faces)
        FaceRender_FreeArray(b, b->faces, b->faceCount);
    Brush_RemoveFromEntity(b, NULL);
    assert(b->def);
    if (b->def->owner && b->def->onext && b->def->refCount == 2)
        FUN_00467240(b->def);
    assertMsg((b->def->refCount > 0), "(b->def->refCount) = %i", b->def->refCount);
    b->def->refCount--;
    if (b->def->refCount == 0)
        BrushDef_Free(b->def);
    delete b;
}

// 0x00458dc0 BrushDef_CloneNoWinding (blocked on external /GL callees FUN_00434880 / FUN_00467240)
brushdef_t *BrushDef_CloneNoWinding(const brushdef_t *b)
{
    if (b->patch)
    {
        int ent = FUN_00434880(b->patch);
        brushdef_t *patchDef = *(brushdef_t **)(ent + 0x3828);
        FUN_00467240(patchDef);
        return patchDef;
    }
    brushdef_t *clone = BrushDef_Alloc();
    clone->owner = b->owner;
    clone->faceCount = b->faceCount;
    clone->faces = Face_AllocArray(clone->faceCount);
    for (int i = 0; i < clone->faceCount; ++i)
    {
        face_t *dst = &clone->faces[i];
        const face_t *src = &b->faces[i];
        dst->texdef[0] = src->texdef[0];
        dst->texdef[1] = src->texdef[1];
        dst->lmTexdef = src->lmTexdef;
        dst->color = src->color;
        dst->contents = src->contents;
        dst->toolFlags = src->toolFlags;
        VectorCopy(src->planepts[0], dst->planepts[0]);
        VectorCopy(src->planepts[1], dst->planepts[1]);
        VectorCopy(src->planepts[2], dst->planepts[2]);
    }
    return clone;
}

// 0x00458eb0 BrushDef_Clone (blocked on external /GL callees + Face_FullClone)
brushdef_t *BrushDef_Clone(const brushdef_t *b)
{
    if (b->patch)
    {
        int ent = FUN_00434880(b->patch);
        brushdef_t *patchDef = *(brushdef_t **)(ent + 0x3828);
        FUN_00467240(patchDef);
        patchDef->owner = b->owner;
        FUN_0045a220(patchDef, true);
        if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
            FUN_00475350();
        FUN_0047a3c0();
        patchDef->version++;
        return patchDef;
    }
    brushdef_t *clone = BrushDef_Alloc();
    clone->owner = b->owner;
    VectorCopy(b->mins, clone->mins);
    VectorCopy(b->maxs, clone->maxs);
    clone->faceCount = b->faceCount;
    clone->faces = Face_AllocArray(clone->faceCount);
    for (int i = 0; i < clone->faceCount; ++i)
        Face_FullClone(&clone->faces[i], &b->faces[i]);
    return clone;
}
