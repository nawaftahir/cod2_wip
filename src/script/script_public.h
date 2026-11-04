#pragma once

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
