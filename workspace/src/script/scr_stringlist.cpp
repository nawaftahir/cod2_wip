/* CoD2 retail 0x004a87b0: RefString memory-tree lookup.
 * Reconstructed against the documented assert sites, following
 * CoD2rev_Server's GetRefString(unsigned int) source semantics.
 * ABI, global storage identity, and original symbol still require proof.
 */
#include "../universal/assertive.h"
#include "../universal/q_shared.h"
#include "script_public.h"
#include <stdio.h>
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

scrStringGlob_t scrStringGlob;

static RefString *GetRefString(const char *str)
{
#line 145
	assert(str >= scrMemTreePub.mt_buffer && str < scrMemTreePub.mt_buffer + MT_SIZE);
	return (RefString *)(str - REFSTRING_STRING_OFFSET);
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

static RefString *GetRefString(unsigned int stringValue)
{
	return (RefString *)SL_GetString(stringValue);
}

static const char *SL_DebugConvertToString(unsigned int stringValue)
{
	RefString *refString;
	const char *str;
	int len;

	if (!stringValue)
		return "<NULL>";
	refString = GetRefString(stringValue);
	str = refString->str;
	len = (refString->data - 1) & 0xff;
	if (str[len])
		str = "<BINARY>";
	return str;
}

static int SL_GetRefStringLen(RefString *refString)
{
	int len;

	len = (refString->data - 1) & 0xff;
	while (refString->str[len])
		len += 256;
	return len;
}

int SL_GetStringLen(unsigned int stringValue)
{
#line 194
	assert(stringValue);
	return SL_GetRefStringLen(GetRefString(stringValue));
}

int SL_ConvertFromRefString(RefString *refString)
{
	return ((char *)refString - scrMemTreePub.mt_buffer) / MT_NODE_SIZE;
}

int SL_ConvertFromString(const char *str)
{
#line 208
	assert(str);
	return SL_ConvertFromRefString(GetRefString(str));
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

void SL_Init()
{
	unsigned int prev, hash;
	HashEntry *entry;

	MT_Init();

	scrStringGlob.hashTable[0].status_next = 0;
	prev = 0;

	for (hash = 1; hash < HASH_TABLE_SIZE; hash++)
	{
#line 264
		assert(!(hash & HASH_STAT_MASK));

		entry = &scrStringGlob.hashTable[hash];
		entry->status_next = 0;

		scrStringGlob.hashTable[prev].status_next |= hash;

		entry->prev = prev;
		prev = hash;
	}

#line 272
	assert(!(scrStringGlob.hashTable[prev].status_next & HASH_NEXT_MASK));
	scrStringGlob.hashTable[0].prev = prev;
	scrStringGlob.inited = true;
}

void SL_Restart()
{
	if (scrStringGlob.inited)
		SL_Clear();
	else
		SL_Init();
}

void SL_Shutdown()
{
	if (scrStringGlob.inited)
		scrStringGlob.inited = false;
}

unsigned int SL_FindStringOfLen(const char *str, unsigned int len)
{
	unsigned int stringValue, newIndex, hash, prev;
	RefString *refStr;
	HashEntry *newEntry, *entry;

#line 324
	assert(str);
	hash = GetHashCode(str, len);
	entry = &scrStringGlob.hashTable[hash];

	if ((entry->status_next & HASH_STAT_MASK) != HASH_STAT_HEAD)
		return 0;

	refStr = GetRefString(entry->prev);

	if (refStr->byteLen == (unsigned char)len && !memcmp(refStr->str, str, len))
	{
#line 341
		assert((entry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
		stringValue = entry->str;
#line 344
		assert(refStr->str == SL_ConvertToString(stringValue));
		return stringValue;
	}

	prev = hash;
	newIndex = entry->status_next & HASH_NEXT_MASK;

	for (newEntry = &scrStringGlob.hashTable[newIndex]; newEntry != entry; newEntry = &scrStringGlob.hashTable[newIndex])
	{
#line 358
		assert((newEntry->status_next & HASH_STAT_MASK) == HASH_STAT_MOVABLE);
		refStr = GetRefString(newEntry->prev);

		if (refStr->byteLen == (unsigned char)len && !memcmp(refStr->str, str, len))
		{
			scrStringGlob.hashTable[prev].status_next = scrStringGlob.hashTable[prev].status_next & HASH_STAT_MASK | newEntry->status_next & HASH_NEXT_MASK;
			newEntry->status_next = newEntry->status_next & HASH_STAT_MASK | entry->status_next & HASH_NEXT_MASK;

			entry->status_next = entry->status_next & HASH_STAT_MASK | newIndex;
			stringValue = newEntry->str;

			newEntry->prev = entry->prev;
			entry->str = stringValue;

#line 371
			assert((newEntry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
			assert((entry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
#line 374
			assert(refStr->str == SL_ConvertToString(stringValue));

			return stringValue;
		}

		prev = newIndex;
		newIndex = newEntry->status_next & HASH_NEXT_MASK;
	}

	return 0;
}

unsigned int SL_FindString(const char *str)
{
	return SL_FindStringOfLen(str, strlen(str) + 1);
}

unsigned int SL_FindLowercaseString(const char *str)
{
	int len, i;
	char buf[8192];

	len = strlen(str) + 1;

	if (len > (int)sizeof(buf))
		return 0;

	for (i = 0; i < len; i++)
		buf[i] = tolower(str[i]);

	return SL_FindStringOfLen(buf, len);
}

int SL_IsLowercaseString(unsigned int stringValue)
{
	const char *str;

#line 434
	assert(stringValue);
	str = SL_ConvertToString(stringValue);

	while (*str)
	{
		if (*str != (char)tolower(*str))
			return 0;
		str++;
	}

	return 1;
}

void SL_AddUserInternal(RefString *refStr, unsigned int user)
{
	if (!(user & refStr->user))
	{
		refStr->user |= user;
		refStr->refCount++;
	}
}

void SL_AddUser(unsigned int stringValue, unsigned int user)
{
	SL_AddUserInternal(GetRefString(stringValue), user);
}

unsigned int SL_GetStringOfLen(const char *str, unsigned int user, unsigned int len, int type)
{
	unsigned int hash, next, prev, newIndex, stringValue;
	HashEntry *entry, *newEntry;
	RefString *refStr;

#line 506
	assert(str);
	hash = GetHashCode(str, len);
	entry = &scrStringGlob.hashTable[hash];

	if ((entry->status_next & HASH_STAT_MASK) == HASH_STAT_HEAD)
	{
		refStr = GetRefString(entry->str);

		if (refStr->byteLen == (unsigned char)len && !memcmp(refStr->str, str, len))
		{
			SL_AddUserInternal(refStr, user);

#line 525
			assert((entry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
#line 528
			assert(refStr->str == SL_ConvertToString(entry->str));

			return entry->str;
		}

		prev = hash;
		newIndex = entry->status_next & HASH_NEXT_MASK;
		newEntry = &scrStringGlob.hashTable[newIndex];

		while (1)
		{
			if (newEntry == entry)
				break;

#line 542
			assert((newEntry->status_next & HASH_STAT_MASK) == HASH_STAT_MOVABLE);
			refStr = GetRefString(newEntry->prev);

			if (refStr->byteLen == (unsigned char)len && !memcmp(refStr->str, str, len))
			{
				scrStringGlob.hashTable[prev].status_next = scrStringGlob.hashTable[prev].status_next & HASH_STAT_MASK | newEntry->status_next & HASH_NEXT_MASK;

				newEntry->status_next = newEntry->status_next & HASH_STAT_MASK | entry->status_next & HASH_NEXT_MASK;
				entry->status_next = entry->status_next & HASH_STAT_MASK | newIndex;

				stringValue = newEntry->str;
				newEntry->prev = entry->prev;
				entry->str = stringValue;

				SL_AddUserInternal(refStr, user);

#line 557
				assert((newEntry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
				assert((entry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
#line 560
				assert(refStr->str == SL_ConvertToString(stringValue));

				return stringValue;
			}

			prev = newIndex;
			newIndex = newEntry->status_next & HASH_NEXT_MASK;
			newEntry = &scrStringGlob.hashTable[newIndex];
		}

		newIndex = scrStringGlob.hashTable[0].status_next;

		if (!newIndex)
			FUN_0047ae50(1, "exceeded maximum number of script strings\n");

		stringValue = MT_AllocIndex(len + REFSTRING_STRING_OFFSET, type);

		newEntry = &scrStringGlob.hashTable[newIndex];
#line 587
		assert((newEntry->status_next & HASH_STAT_MASK) == HASH_STAT_FREE);

		scrStringGlob.hashTable[0].status_next = newEntry->status_next & HASH_NEXT_MASK;
		scrStringGlob.hashTable[scrStringGlob.hashTable[0].status_next].prev = 0;

		newEntry->status_next = entry->status_next & HASH_NEXT_MASK | HASH_STAT_MOVABLE;
		entry->status_next = entry->status_next & HASH_STAT_MASK | newIndex;
		newEntry->prev = entry->prev;
	}
	else
	{
		if (entry->status_next & HASH_STAT_MASK)
		{
#line 613
			assert((entry->status_next & HASH_STAT_MASK) == HASH_STAT_MOVABLE);
			next = entry->status_next & HASH_NEXT_MASK;
			prev = next;

			while ((scrStringGlob.hashTable[prev].status_next & HASH_NEXT_MASK) != hash)
				prev = scrStringGlob.hashTable[prev].status_next & HASH_NEXT_MASK;

#line 620
			assert(prev);
			newIndex = scrStringGlob.hashTable[0].status_next;

			if (!newIndex)
				FUN_0047ae50(1, "exceeded maximum number of script strings\n");

			stringValue = MT_AllocIndex(len + REFSTRING_STRING_OFFSET, type);

			newEntry = &scrStringGlob.hashTable[newIndex];
#line 635
			assert((newEntry->status_next & HASH_STAT_MASK) == HASH_STAT_FREE);

			scrStringGlob.hashTable[0].status_next = newEntry->status_next & HASH_NEXT_MASK;
			scrStringGlob.hashTable[scrStringGlob.hashTable[0].status_next].prev = 0;
			scrStringGlob.hashTable[prev].status_next = scrStringGlob.hashTable[prev].status_next & HASH_STAT_MASK | newIndex;

			newEntry->status_next = next | HASH_STAT_MOVABLE;
			newEntry->prev = entry->prev;
		}
		else
		{
			stringValue = MT_AllocIndex(len + REFSTRING_STRING_OFFSET, type);

			next = entry->status_next & HASH_NEXT_MASK;
			prev = entry->prev;

			scrStringGlob.hashTable[prev].status_next = scrStringGlob.hashTable[prev].status_next & HASH_STAT_MASK | next;
			scrStringGlob.hashTable[next].prev = prev;
		}

#line 647
		assert(!(hash & HASH_STAT_MASK));
		entry->status_next = hash | HASH_STAT_HEAD;
	}

#line 651
	assert(stringValue);
	entry->str = stringValue;

	refStr = GetRefString(stringValue);
	memcpy(refStr->str, str, len);

	refStr->user = user;
#line 658
	assert(refStr->user == user);

	refStr->refCount = 1;
	refStr->byteLen = len;

#line 673
	assert((entry->status_next & HASH_STAT_MASK) != HASH_STAT_FREE);
	assert(refStr->str == SL_ConvertToString(stringValue));

	return stringValue;
}

unsigned int SL_GetString_(const char *str, unsigned int user, int type)
{
	return SL_GetStringOfLen(str, user, strlen(str) + 1, type);
}

unsigned int SL_GetString(const char *str, unsigned int user)
{
	return SL_GetString_(str, user, 6);
}

unsigned int SL_GetLowercaseStringOfLen(const char *str, unsigned int user, unsigned int len, int type)
{
	char buf[8192];
	unsigned int i;

	if (len > sizeof(buf))
	{
		FUN_0047ae50(1, "max string length exceeded: \"%s\"", str);
		return 0;
	}

	for (i = 0; i < len; i++)
		buf[i] = tolower(str[i]);

	return SL_GetStringOfLen(buf, user, len, type);
}

unsigned int SL_GetLowercaseString_(const char *str, unsigned int user, int type)
{
	return SL_GetLowercaseStringOfLen(str, user, strlen(str) + 1, type);
}

unsigned int SL_GetLowercaseString(const char *str, unsigned int user)
{
	return SL_GetLowercaseString_(str, user, 6);
}

unsigned int SL_ConvertToLowercase(unsigned int stringValue, unsigned int user, int type)
{
	unsigned int ns, len, i;
	const char *str;
	char buf[8192];

	len = SL_GetStringLen(stringValue) + 1;

	if (len > sizeof(buf))
		return stringValue;

	str = SL_ConvertToString(stringValue);

	for (i = 0; i < len; i++)
		buf[i] = tolower(str[i]);

	ns = SL_GetStringOfLen(buf, user, len, type);
	SL_RemoveRefToString(stringValue);

	return ns;
}

#line 765
void SL_TransferRefToUser(unsigned int stringValue, unsigned int user)
{
	RefString *refStr = GetRefString(stringValue);

	if (user & refStr->user)
	{
#line 769
		assertMsg((refStr->refCount > 1), "(SL_DebugConvertToString( stringValue )) = '%s'", SL_DebugConvertToString(stringValue));
		refStr->refCount--;
		return;
	}

	refStr->user |= user;
}

void SL_AddRefToString(unsigned int stringValue)
{
	RefString *refStr = GetRefString(stringValue);

	refStr->refCount++;
}

#line 861
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

void SL_RemoveAllRefToString(unsigned int stringValue)
{
	RefString *refStr = GetRefString(stringValue);

	if (refStr->user & 4)
	{
		refStr->refCount = 1;
		refStr->user = 4;
		return;
	}

	refStr->refCount = 0;
	refStr->user = 0;

	SL_FreeString(stringValue, refStr, SL_GetRefStringLen(refStr) + 1);
}

void SL_RemoveRefToStringOfLen(unsigned int stringValue, unsigned int len)
{
	RefString *refStr = GetRefString(stringValue);

	refStr->refCount--;
	if (!refStr->refCount)
		SL_FreeString(stringValue, refStr, len);
}

void Scr_SetString(unsigned short *to, unsigned int from)
{
	if (from)
		SL_AddRefToString(from);

	if (*to)
		SL_RemoveRefToString(*to);

	*to = from;
}

void Scr_SetStringFromCharString(unsigned short *to, const char *from)
{
	if (*to)
		SL_RemoveRefToString(*to);

	*to = SL_GetString(from, 0);
}

unsigned int Scr_AllocString(const char *s, int sys)
{
#line 1061
	assert(sys == SCR_SYS_GAME);
	return SL_GetString(s, 1);
}

unsigned int SL_GetStringForFloat(float f)
{
	char tempString[128];

	sprintf(tempString, "%g", f);
	return SL_GetString_(tempString, 0, 14);
}

unsigned int SL_GetStringForInt(int i)
{
	char tempString[128];

	sprintf(tempString, "%i", i);
	return SL_GetString_(tempString, 0, 14);
}

unsigned int SL_GetStringForVector(const float *v)
{
	char tempString[128];

	sprintf(tempString, "(%g, %g, %g)", v[0], v[1], v[2]);
	return SL_GetString_(tempString, 0, 14);
}

#line 1094
void SL_ShutdownSystem(unsigned int user)
{
	RefString *refStr;
	HashEntry *entry;
	unsigned int hash;

	assert(user);

	for (hash = 1; hash < HASH_TABLE_SIZE; hash++)
	{
		do
		{
			entry = &scrStringGlob.hashTable[hash];

			if (!(entry->status_next & HASH_STAT_MASK))
				break;

			refStr = GetRefString(entry->str);

			if (!(user & refStr->user))
				break;

			refStr->user &= ~user;
			scrStringGlob.nextFreeEntry = 0;
			SL_RemoveRefToString(entry->str);
		} while (scrStringGlob.nextFreeEntry);
	}
}

void Scr_ShutdownGameStrings()
{
	SL_ShutdownSystem(1);
}

byte *MT_InitForceAlloc();
void MT_ForceAllocIndex(byte *allocBits, unsigned int nodeNum, int numBytes);
void MT_FinishForceAlloc(byte *allocBits);

void SL_TransferSystem(unsigned int from, unsigned int to)
{
	unsigned int hash;
	HashEntry *entry;
	RefString *refStr;

#line 1142
	assert(from);
	assert(to);

	for (hash = 1; hash < HASH_TABLE_SIZE; hash++)
	{
		entry = &scrStringGlob.hashTable[hash];

		if (!(entry->status_next & HASH_STAT_MASK))
			continue;

		refStr = GetRefString(entry->str);

		if (!(refStr->user & from))
			continue;

		refStr->user &= ~from;
		refStr->user |= to;
	}
}

void SL_Clear()
{
	unsigned int hash;
	HashEntry *entry;
	byte *allocBits;
	RefString *refStr;
	const char *str;
	int len;

	for (hash = 1; hash < HASH_TABLE_SIZE; hash++)
	{
		do
		{
			entry = &scrStringGlob.hashTable[hash];

			if (!(entry->status_next & HASH_STAT_MASK))
				break;

			scrStringGlob.nextFreeEntry = 0;
			SL_RemoveAllRefToString(entry->str);
		} while (scrStringGlob.nextFreeEntry);
	}

	allocBits = MT_InitForceAlloc();
#line 1201
	assert(allocBits);

	for (hash = 1; hash < HASH_TABLE_SIZE; hash++)
	{
		entry = &scrStringGlob.hashTable[hash];

		if (!(entry->status_next & HASH_STAT_MASK))
			continue;

		refStr = GetRefString(entry->str);

		if (!(refStr->user & 4))
			continue;

		str = SL_ConvertToString(entry->str);
		len = strlen(str) + 1;
		MT_ForceAllocIndex(allocBits, entry->str, len + REFSTRING_STRING_OFFSET);
	}

	MT_FinishForceAlloc(allocBits);
}

void SL_CreateCanonicalFilename(char *newFilename, const char *filename, int count)
{
	unsigned int c;

#line 1230
	assert(count);

	do
	{
		do
		{
			do
			{
				c = *filename;
				filename++;
			} while (c == '\\');
		} while (c == '/');

		while (c >= ' ')
		{
			*newFilename = tolower(c);
			newFilename++;

			--count;

			if (!count)
				FUN_0047ae50(1, "Filename '%s' exceeds maximum length of %d", filename, count);

			if (c == '/')
				break;

			c = *filename;
			filename++;

			if (c == '\\')
				c = '/';
		}
	} while (c);

	*newFilename = 0;
}

unsigned int Scr_CreateCanonicalFilename(const char *filename)
{
	char newFilename[1024];

	SL_CreateCanonicalFilename(newFilename, filename, sizeof(newFilename));
	return SL_GetString_(newFilename, 0, 7);
}
