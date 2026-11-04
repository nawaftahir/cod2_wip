#pragma once
typedef unsigned char byte;

// Script memory tree. From the server's script_public.h (lnxded-1.3), cut to what this binary's
// script files use; GCC __attribute__((aligned)) written as MSVC __declspec(align).

enum
{
	MEMORY_NODE_BITS = 0x10,
	MEMORY_NODE_COUNT = 0x10000,
	MT_SIZE = 0x100000,
	REFSTRING_STRING_OFFSET = 0x4,
};

enum
{
	MT_NODE_SIZE = 0x10
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

void Scr_TerminalError(const char *error);

// String list and memory tree API, from the server script_public.h (lnxded-1.3).
void MT_Init();
byte *MT_InitForceAlloc();
void MT_ForceAllocIndex(unsigned char *allocBits, unsigned int nodeNum, int numBytes);
void MT_FinishForceAlloc(unsigned char *allocBits);
unsigned short MT_AllocIndex(int numBytes, int type);
void MT_FreeIndex(unsigned int nodeNum, int numBytes);
void* MT_Alloc(int numBytes, int type);
void MT_Free(void* p, int numBytes);
int MT_Realloc(int oldNumBytes, int newNumbytes);
byte* MT_GetRefByIndex(int index);
int MT_GetIndexByRef(byte* p);
void MT_DumpTree();

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
		volatile int data;
	};
	char str[1];
};

struct RefVector
{
	union
	{
		struct
		{
			unsigned int refCount : 16;
			unsigned int user : 8;
			unsigned int byteLen : 8;
		};
		volatile int head;
	};
	vec3_t vec;
};

#define HASH_TABLE_SIZE 16384

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

const char* SL_ConvertToString(unsigned int index);
extern "C" unsigned int SL_ConvertToLowercase(unsigned int stringValue, unsigned int user, int type);
unsigned int SL_ConvertFromString(const char *str);
unsigned int SL_GetLowercaseStringOfLen(const char *upperstring, unsigned int user, unsigned int len, int type);
unsigned int SL_GetLowercaseString_(const char *str, unsigned int user, int type);
unsigned int GetHashCode(const char *str, unsigned int len);
void SL_FreeString(unsigned int stringValue, RefString *refStr, unsigned int len);
void SL_AddUserInternal(RefString *refStr, unsigned int user);
extern "C" unsigned int SL_GetStringOfLen(const char *str, unsigned int user, unsigned int len, int type);
unsigned int SL_FindStringOfLen(const char *str, unsigned int len);
unsigned int SL_FindLowercaseString(const char *upperstring);
unsigned int SL_FindString(const char *string);
extern "C" unsigned int SL_GetString_(const char *str, unsigned int user, int type);
unsigned int SL_GetString(const char *str, unsigned int user);
unsigned int SL_GetLowercaseString(const char *str, unsigned int user);
unsigned int SL_GetStringForInt(int i);
unsigned int SL_GetStringForFloat(float f);
unsigned int SL_GetStringForVector(const float *v);
int SL_GetStringLen(unsigned int stringValue);
void SL_RemoveRefToStringOfLen(unsigned int stringValue, unsigned int len);
void SL_RemoveRefToString(unsigned int stringValue);
extern "C" void SL_TransferRefToUser(unsigned int stringIndex, unsigned int user);
void SL_AddRefToString(unsigned int stringValue);
void SL_ShutdownSystem(unsigned int user);
void SL_Shutdown();
void SL_Clear();
void SL_Init();
void SL_Restart();
unsigned int SL_TransferToCanonicalString(unsigned int index);
unsigned int SL_GetCanonicalString(const char *str);
int MT_GetSubTreeSize(int nodeNum);
void MT_InitBits();
void MT_AddMemoryNode(int newNode, int size);
void MT_SafeFreeIndex( unsigned int nodeNum );
int MT_GetSize(int numBytes);
bool MT_RemoveMemoryNode(int oldNode, int size);
void MT_Error(const char *funcName, int numBytes);
void MT_RemoveHeadMemoryNode(int size);


RefString *GetRefString(unsigned int stringValue);
RefString *GetRefString(const char* string);
int SL_ConvertFromRefString(RefString *refString);
int SL_GetRefStringLen(RefString *refString);
void CreateCanonicalFilename(char *newFilename, const char *filename, int count);
void SL_RemoveAllRefToString(unsigned int stringValue);
enum hash_stat_t
{
	HASH_STAT_FREE = 0x0,
	HASH_STAT_MOVABLE = 0x4000,
	HASH_STAT_HEAD = 0x8000,
	HASH_STAT_MASK = 0xC000,
};

#define HASH_NEXT_MASK 0x3FFF
void Scr_DumpScriptThreads();
void Scr_DumpScriptVariablesDefault();
void SL_CreateCanonicalFilename(char *newFilename, const char *filename, int count);
