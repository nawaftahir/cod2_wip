#pragma once

// Script memory tree. From the server's script_public.h (lnxded-1.3), cut to what this binary's
// script files use; GCC __attribute__((aligned)) written as MSVC __declspec(align).

enum
{
	MEMORY_NODE_BITS = 0x10,
	MEMORY_NODE_COUNT = 0x10000,
	MT_SIZE = 0x80000,
	REFSTRING_STRING_OFFSET = 0x4,
};

enum
{
	MT_NODE_SIZE = 0x8
};

struct __declspec(align(8)) MemoryNode
{
	unsigned short prev;
	unsigned short next;
};

struct scrMemTreePub_t
{
	char *mt_buffer;
};

extern scrMemTreePub_t scrMemTreePub;

typedef struct __declspec(align(128)) scrMemTreeGlob_s
{
	MemoryNode nodes[MEMORY_NODE_COUNT];
	char leftBits[256];
	char numBits[256];
	unsigned char logBits[256];
	unsigned short head[MEMORY_NODE_BITS + 1];
	int totalAlloc;
	int totalAllocBuckets;
} scrMemTreeGlob_t;

enum
{
	HASH_TABLE_SIZE = 0x4000,
	HASH_STAT_MASK = 0xc000,
	HASH_STAT_HEAD = 0x8000,
	HASH_STAT_MOVABLE = 0x4000,
	HASH_STAT_FREE = 0x0,
	HASH_NEXT_MASK = 0x3fff
};

struct __declspec(align(4)) RefString
{
	union
	{
		struct
		{
			unsigned int byteLen : 8;
			unsigned int user : 8;
			unsigned int refCount : 16;
		};
		int data;
	};
	char str[1];
};

struct HashEntry
{
	unsigned short status_next;
	union
	{
		unsigned short prev;
		unsigned short str;
	};
};

typedef struct __declspec(align(128)) scrStringGlob_s
{
	HashEntry hashTable[HASH_TABLE_SIZE];
	bool inited;
	HashEntry *nextFreeEntry;
} scrStringGlob_t;

void Scr_TerminalError(const char *error);
enum
{
	SCR_SYS_GAME = 1
};

void MT_Init();
void SL_Clear();
unsigned short MT_AllocIndex(int numBytes, int type);
void FUN_0047ae50(int level, const char *fmt, ...);
unsigned int SL_GetStringOfLen(const char *str, unsigned int user, unsigned int len, int type);
void MT_FreeIndex(unsigned int nodeNum, int numBytes);
unsigned int GetHashCode(const char *str, unsigned int len);
void SL_FreeString(unsigned int stringValue, RefString *refStr, unsigned int len);
void SL_RemoveRefToString(unsigned int stringValue);
void SL_RemoveRefToStringOfLen(unsigned int stringValue, unsigned int len);
void SL_AddRefToString(unsigned int stringValue);
