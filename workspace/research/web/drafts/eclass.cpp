/*
 * CoD2Radiant retail eclass reconstruction candidates; source kept in
 * original retail address order. Reference: Q3Radiant/ECLASS.CPP, id Software,
 * GPL-2.0-or-later. The target binary, not Q3, determines these layouts.
 *
 * These 32-bit layout slices are supported by retail decompilation:
 *   eclass next +0, name +4, comments +0x50, model +0x154,
 *          modelpath +0x158, skinpath +0x15c;
 *   model pNext +0, entities.next +0xc.
 * Opaque gaps are intentionally NOT a proposed full class declaration.
 * Draft only: no compiler comparison or game-ledger credit yet.
 */
#include "stdafx.h"
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

struct entitymodel_s
{
    entitymodel_s *pNext;
    unsigned char undecoded_04[8];
    void *entities_next;
};
struct eclass_s
{
    eclass_s *next;
    char *name;
    unsigned char undecoded_08[0x50 - 8];
    char *comments;
    unsigned char undecoded_54[0x154 - 0x54];
    entitymodel_s *model;
    char *modelpath;
    char *skinpath;
};
typedef eclass_s eclass_t;
typedef char check_eclass_model[(offsetof(eclass_t, model) == 0x154) ? 1 : -1];
typedef char check_eclass_name[(offsetof(eclass_t, name) == 4) ? 1 : -1];
typedef char check_eclass_comments[(offsetof(eclass_t, comments) == 0x50) ? 1 : -1];
typedef char check_model_entities[(offsetof(entitymodel_s, entities_next) == 0x0c) ? 1 : -1];

extern eclass_t *eclass;
extern eclass_t *g_md3Cache;
extern eclass_t *eclass_bad;

// Real entity/model lifetime cleanup at retail 0x00462ff0, not yet compiled
// or linked as a native function in the current select/entity source graph.
extern void FUN_00462ff0(entitymodel_s *model);

// Candidate for retail 0x004630c0 / 170 B: free one eclass's entitymodels,
// names and documentation, then the eclass object. References and target
// decompilation agree on the ownership and all four string pointers.
void FUN_004630c0(eclass_t *item)
{
    entitymodel_s *model = item->model;
    while (model)
    {
        entitymodel_s *next = model->pNext;
        if (model->entities_next)
        {
            FUN_00462ff0(model);
            // Retail verifies that the entity list is now empty. This
            // assertion needs the original assert handler and line identity.
        }
        free(model);
        model = next;
    }
    free(item->skinpath);
    free(item->modelpath);
    free(item->name);
    free(item->comments);
    free(item);
}

// Candidate for retail 0x004631a0 / 155 B. The original Q3 source names
// this lifetime cleanup CleanUpEntities; CoD2's model cache and bad class
// storage are confirmed at three adjacent globals.
void CleanUpEntities()
{
    while (eclass)
    {
        eclass_t *next = eclass->next;
        FUN_004630c0(eclass);
        eclass = next;
    }
    eclass = NULL;
    while (g_md3Cache)
    {
        eclass_t *next = g_md3Cache->next;
        FUN_004630c0(g_md3Cache);
        g_md3Cache = next;
    }
    g_md3Cache = NULL;
    if (eclass_bad)
    {
        free(eclass_bad->name);
        free(eclass_bad->comments);
        free(eclass_bad);
        eclass_bad = NULL;
    }
}

// Retail 0x004634f0 / 98 B. Free classes with a model, preserve others,
// and empty the model-only eclass cache; owner name still provisional.
void FUN_004634f0()
{
    eclass_t **link = &eclass;
    while (*link)
    {
        eclass_t *item = *link;
        if (item->model)
        {
            *link = item->next;
            FUN_004630c0(item);
        }
        else
        {
            link = &item->next;
        }
    }
    while (g_md3Cache)
    {
        eclass_t *next = g_md3Cache->next;
        FUN_004630c0(g_md3Cache);
        g_md3Cache = next;
    }
    g_md3Cache = NULL;
}

// Q3 ancestor EClass_InsertSortedList: candidate at retail 0x00463e40 / 75 B.
// The retail decompiler confirms linked list +0, name +4, _stricmp ordering,
// and EDI/EBX pointer-to-pointer register flow, without fabricated data.
void EClass_InsertSortedList(eclass_t *&pList, eclass_t *item)
{
    if (!pList)
    {
        pList = item;
        return;
    }
    eclass_t *s = pList;
    if (_stricmp(item->name, s->name) < 0)
    {
        item->next = s;
        pList = item;
        return;
    }
    do
    {
        if (!s->next || _stricmp(item->name, s->next->name) < 0)
        {
            item->next = s->next;
            s->next = item;
            return;
        }
        s = s->next;
    } while (1);
}

// Q3 source's wrapper, retail 0x00463e90 / 13 B, still unverified.
void Eclass_InsertAlphabetized(eclass_t *item)
{
    EClass_InsertSortedList(eclass, item);
}
