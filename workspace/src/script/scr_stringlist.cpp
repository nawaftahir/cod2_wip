/* CoD2 retail 0x004a87b0: RefString memory-tree lookup.
 * Reconstructed against the documented assert sites, following
 * CoD2rev_Server's GetRefString(unsigned int) source semantics.
 * ABI, global storage identity, and original symbol still require proof.
 */
#include "../universal/assertive.h"
#include "../universal/q_shared.h"
#include "script_public.h"
extern "C" void *scrMemTreeBuffer;

extern "C" void *SL_GetString(unsigned int stringValue)
{
    static bool s_assertDisablePresent;
    static bool s_assertDisableBound;
    if (!stringValue && !s_assertDisablePresent) {
        switch (FUN_0047d980("stringValue",
                "\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",
                136, 0, 1)) {
        case 0: DebugBreak(); break;
        case 2: s_assertDisablePresent = true; break;
        }
    }
    unsigned int offset = stringValue * 8;
    if (!(offset < 0x80000) && !s_assertDisableBound) {
        switch (FUN_0047d980("stringValue * MT_NODE_SIZE < MT_SIZE",
                "\\trees\\cod2src\\src\\script\\scr_stringlist.cpp",
                137, 0, 1)) {
        case 0: DebugBreak(); break;
        case 2: s_assertDisableBound = true; break;
        }
    }
    return (char *)scrMemTreeBuffer + offset;
}

/* Original public script-string conversion (CoD2rev_Server reference).
 * Keep in script owner rather than xmodel, to avoid an extra xmodel emitter.
 */
const char *SL_ConvertToString(unsigned int stringValue)
{
    if (stringValue)
        return (const char *)((char *)SL_GetString(stringValue) + 4);
    return 0;
}

scrStringGlob_t scrStringGlob;

static RefString *GetRefString(unsigned int stringValue)
{
	return (RefString *)SL_GetString(stringValue);
}

static int SL_GetRefStringLen(RefString *refString)
{
	int len;

	len = (refString->data - 1) & 0xff;
	while (refString->str[len])
		len += 256;
	return len;
}

static const char *SL_DebugConvertToString(unsigned int stringValue)
{
	RefString *refString;
	int len;

	if (!stringValue)
		return "<NULL>";
	refString = GetRefString(stringValue);
	len = (refString->data - 1) & 0xff;
	if (refString->str[len])
		return "<BINARY>";
	return refString->str;
}

unsigned int GetHashCode(const char *str, unsigned int len)
{
	unsigned int hash;

	if (len < 0x100)
	{
		hash = 0;
		if (len)
		{
			do
			{
				hash = hash * 0x1f + *str;
				++str;
				--len;
			} while (len);
			return hash % (HASH_TABLE_SIZE - 1) + 1;
		}
	}
	else
	{
		hash = len >> 2;
	}

	return hash % (HASH_TABLE_SIZE - 1) + 1;
}
























































































































































































































































































































































































































































































































































































































































































































































































void SL_FreeString(unsigned int stringValue, RefString *refStr, unsigned int len)
{
	unsigned int index;
	unsigned int newIndex;
	unsigned int prev;
	unsigned int newNext;
	HashEntry *entry;
	HashEntry *newEntry;

	index = GetHashCode(refStr->str, len);

	assert(!refStr->refCount);


	assertMsg((!refStr->user), "(SL_DebugConvertToString( stringValue )) = '%s'", SL_DebugConvertToString(stringValue));
	MT_FreeIndex(stringValue, len + 4);
	entry = &scrStringGlob.hashTable[index];

	assertMsg(((entry->status_next & HASH_STAT_MASK) == HASH_STAT_HEAD), "(entry->status_next) = %i", entry->status_next);

	newIndex = entry->status_next & HASH_NEXT_MASK;
	newEntry = &scrStringGlob.hashTable[newIndex];
	if (entry->str == stringValue)
	{
		if (newEntry != entry)
		{
			entry->status_next = HASH_STAT_HEAD | (newEntry->status_next & HASH_NEXT_MASK);
			entry->str = newEntry->str;
			scrStringGlob.nextFreeEntry = entry;
		}
		else
		{
			newEntry = entry;
			newIndex = index;
		}
	}
	else
	{
		prev = index;
		while (1)
		{
			assert(newEntry != entry);
			assert((newEntry->status_next & HASH_STAT_MASK) == HASH_STAT_MOVABLE);
			if (newEntry->str == stringValue)
				break;
			prev = newIndex;
			newIndex = newEntry->status_next & HASH_NEXT_MASK;
			newEntry = &scrStringGlob.hashTable[newIndex];
		}

		scrStringGlob.hashTable[prev].status_next = (scrStringGlob.hashTable[prev].status_next & HASH_STAT_MASK) | (newEntry->status_next & HASH_NEXT_MASK);
	}




	assert((newEntry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
	newNext = scrStringGlob.hashTable[0].status_next;

	assert((newNext & HASH_STAT_MASK) == HASH_STAT_FREE);
	newEntry->status_next = newNext;
	newEntry->prev = 0;
	scrStringGlob.hashTable[newNext].prev = newIndex;
	scrStringGlob.hashTable[0].status_next = newIndex;
}

void SL_RemoveRefToString(unsigned int stringValue)
{
	RefString *refStr = GetRefString(stringValue);

	SL_RemoveRefToStringOfLen(stringValue, SL_GetRefStringLen(refStr) + 1);
}

void SL_RemoveRefToStringOfLen(unsigned int stringValue, unsigned int len)
{
	RefString *refStr = GetRefString(stringValue);

	refStr->refCount--;
	if (!refStr->refCount)
		SL_FreeString(stringValue, refStr, len);
}

void SL_AddRefToString(unsigned int stringValue)
{
	RefString *refStr = GetRefString(stringValue);

	refStr->refCount++;
}
