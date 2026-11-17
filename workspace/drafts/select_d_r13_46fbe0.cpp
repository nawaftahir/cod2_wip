// Draft (lane d r13): retail 0x0046fbe0, 98% (355/355 B). Only diff: retail stores DAT_011298b4=0 at +0x88
// before the first bounds load; ours schedules the store after the first fld. CPtrArray::RemoveAll calls the lib
// (68%, 332 B); retail inlines delete + zero, so a local struct stand-in is used below. Tried: for loop vs unrolled,
// <= vs < (retail is <), inline mode switch vs FUN_0046e4a0(), struct view of the mode vars. Not landed.
// Needs in select.cpp: stdafx.h not required with the stand-in; brush_def_t pad0[0x20] + float mins[3], maxs[3] + pad[4].
struct SelArr { void *vt; void *m_pData; int m_nSize; int m_nMaxSize; };
extern SelArr g_ptrSelectedFaces;
extern int DAT_01129894;
extern int DAT_01129898;
extern int DAT_010c4d84;
extern float DAT_010bcd38[3];
extern float DAT_010bcd44[3];
void FUN_0042f5d0();
int FUN_00477cf0();

// Q3Radiant Select_Deselect shape
void FUN_0046fbe0(bool bDeselectFaces)
{
    FUN_0042f5d0();
    DAT_01129894++;
    DAT_01129898 = 0;
    DAT_010c4d84 = 0;
    brush_t *b = selected_brushes.next;
    if (bDeselectFaces)
    {
        if (g_ptrSelectedFaces.m_pData)
        {
            delete[] (unsigned char *)g_ptrSelectedFaces.m_pData;
            g_ptrSelectedFaces.m_pData = NULL;
        }
        g_ptrSelectedFaces.m_nSize = 0;
        g_ptrSelectedFaces.m_nMaxSize = 0;
    }
    if (b != &selected_brushes)
    {
        FUN_0046e4a0();
        for (int i = 0; i < 3; i++)
        {
            if (b->def->mins[i] < b->def->maxs[i])
            {
                DAT_010bcd38[i] = b->def->mins[i];
                DAT_010bcd44[i] = b->def->maxs[i];
            }
        }
        selected_brushes.next->prev = &active_brushes;
        selected_brushes.prev->next = active_brushes.next;
        active_brushes.next->prev = selected_brushes.prev;
        active_brushes.next = selected_brushes.next;
        selected_brushes.prev = selected_brushes.next = &selected_brushes;
        FUN_00477cf0();
    }
    g_nUpdateBits = -1;
}

