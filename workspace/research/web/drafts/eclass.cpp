/* Candidate reconstruction of Q3Radiant's sorted eclass insertion helper.
 * Original Q3Radiant ECLASS.CPP, Id Software 1999-2005, GPL-2.0-or-later.
 * Target decompilation 0x00463e40 confirms first two 32-bit fields (next, name)
 * and the strcmp-driven linked-list insertion. Remaining eclass_t fields and
 * exact compiler/LTCG symbol ownership are NOT verified. Draft only.
 */
#include "stdafx.h"
#include <string.h>

struct eclass_s {
    eclass_s *next;
    char *name;
};
typedef eclass_s eclass_t;

extern eclass_t *eclass;

// Preserve original Q3 source spelling; MSVC 7.1 is the authoritative compiler.
void EClass_InsertSortedList(eclass_t *&pList, eclass_t *e)
{
    eclass_t *s;
    if (!pList) {
        pList = e;
        return;
    }
    s = pList;
    if (_stricmp(e->name, s->name) < 0) {
        e->next = s;
        pList = e;
        return;
    }
    do {
        if (!s->next || _stricmp(e->name, s->next->name) < 0) {
            e->next = s->next;
            s->next = e;
            return;
        }
        s = s->next;
    } while (1);
}

void Eclass_InsertAlphabetized(eclass_t *e)
{
    EClass_InsertSortedList(eclass, e);
}
