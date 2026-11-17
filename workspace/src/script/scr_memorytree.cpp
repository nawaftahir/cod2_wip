#include "../qcommon/qcommon.h"
#include "script_public.h"
#include "../universal/com_memory.h"

scrMemTreePub_t scrMemTreePub;
scrMemTreeGlob_t scrMemTreeGlob;

// Debug record of every allocated node: its type and its size class.
struct scrMemTreeDebugGlob_t
{
	unsigned char mt_usage[MEMORY_NODE_COUNT];
	unsigned char mt_usage_size[MEMORY_NODE_COUNT];
};

scrMemTreeDebugGlob_t scrMemTreeDebugGlob;

const char *mt_type_names[20] =
{
	"empty",
	"thread",
	"vector",
	"notetrack",
	"anim tree",
	"small anim tree",
	"external",
	"temp",
	"surface",
	"anim part",
	"model part",
	"model part map",
	"duplicate parts",
	"script parse",
	"script string",
	"class",
	"tag info",
	"animscripted",
	"config string",
	"debugger string"
};

extern "C" void *SL_GetString(unsigned int stringValue);

/*
==============
MT_GetSubTreeSize
==============
*/
int MT_GetSubTreeSize( int nodeNum )
{
	MemoryNode *node;

	if ( !nodeNum )
	{
		return 0;
	}

	node = &scrMemTreeGlob.nodes[nodeNum];

	return MT_GetSubTreeSize(node->prev) + MT_GetSubTreeSize(node->next) + 1;
}

static const char *MT_DebugConvertToString( unsigned int nodeNum )
{
	RefString *refStr;
	const char *str;

	if ( !nodeNum )
	{
		return "<NULL>";
	}

	refStr = (RefString *)SL_GetString(nodeNum);
	str = refStr->str;

	if ( str[(refStr->data - 1) & 0xff] )
	{
		str = "<BINARY>";
	}

	return str;
}

/*
==============
MT_NodeInfoString
==============
*/
const char *MT_NodeInfoString( unsigned int nodeNum )
{
	int type;

	type = scrMemTreeDebugGlob.mt_usage[nodeNum];

	if ( !type )
	{
		return "<FREE>";
	}

	return va("%s: '%s' (%d)", mt_type_names[type], MT_DebugConvertToString(nodeNum), scrMemTreeDebugGlob.mt_usage_size[nodeNum]);
}

/*
============
MT_DumpTree
============
*/
void MT_DumpTree()
{
	unsigned int nodeNum;
	int type;
	int size;
	int subTreeSize;
	int totalAlloc;
	int totalAllocBuckets;
	int totalBuckets;
	int mt_type_usage[20];

	memset(mt_type_usage, 0, sizeof(mt_type_usage));

	Com_Printf("********************************\n");

	totalAlloc = 0;
	totalAllocBuckets = 0;

	for ( nodeNum = 0; nodeNum < MEMORY_NODE_COUNT; nodeNum++ )
	{
		type = scrMemTreeDebugGlob.mt_usage[nodeNum];

		if ( type )
		{
			Com_Printf("%s\n", MT_NodeInfoString(nodeNum));
			totalAlloc++;
			totalAllocBuckets += 1 << scrMemTreeDebugGlob.mt_usage_size[nodeNum];
			mt_type_usage[type] += 1 << scrMemTreeDebugGlob.mt_usage_size[nodeNum];
		}
	}

#line 177
	assert(scrMemTreeGlob.totalAlloc == totalAlloc);
	assert(scrMemTreeGlob.totalAllocBuckets == totalAllocBuckets);

	Com_Printf("********************************\n");

	totalBuckets = scrMemTreeGlob.totalAllocBuckets;

	for ( size = 0; size <= MEMORY_NODE_BITS; size++ )
	{
		subTreeSize = MT_GetSubTreeSize(scrMemTreeGlob.head[size]);
		totalBuckets += subTreeSize * ( 1 << size );
		Com_Printf("%d subtree has %d * %d = %d free buckets\n", size, subTreeSize, 1 << size, subTreeSize * ( 1 << size ));
	}

	Com_Printf("********************************\n");

	for ( type = 1; type < 20; type++ )
	{
		Com_Printf("'%s' allocated: %d\n", mt_type_names[type], mt_type_usage[type]);
	}

	Com_Printf("********************************\n");
	Com_Printf("total memory alloc buckets: %d (%d instances)\n", scrMemTreeGlob.totalAllocBuckets, scrMemTreeGlob.totalAlloc);
	Com_Printf("total memory free buckets: %d\n", MEMORY_NODE_COUNT - 1 - scrMemTreeGlob.totalAllocBuckets);
	Com_Printf("********************************\n");

#line 207
	assert(totalBuckets == (1 << MEMORY_NODE_BITS) - 1);
}

/*
============
Scr_GetStringUsage
============
*/
int Scr_GetStringUsage()
{
	return scrMemTreeGlob.totalAllocBuckets;
}

/*
==============
MT_InitBits
==============
*/
void MT_InitBits()
{
	int i;
	int bits;
	int temp;

	for (i = 0; i < 256; i++)
	{
		bits = 0;
		for (temp = i; temp; temp >>= 1)
		{
			if (temp & 1)
			{
				bits++;
			}
		}

		scrMemTreeGlob.numBits[i] = bits;
		for (bits = 8; i & ((1 << bits) - 1); bits--)
		{
		}

		scrMemTreeGlob.leftBits[i] = bits;
		bits = 0;
		for (temp = i; temp; temp >>= 1)
		{
			bits++;
		}
		scrMemTreeGlob.logBits[i] = bits;
	}
}

/*
============
MT_GetScore
============
*/
int MT_GetScore( int num )
{
	int score;
	int bits;
	int hi;
	int lo;

#line 260
	assert(num);
	num = MEMORY_NODE_COUNT - num;
	assert(num);

	lo = ((byte *)&num)[0];
	hi = ((byte *)&num)[1];

	score = num - ( ( (byte *)scrMemTreeGlob.numBits )[lo] + ( (byte *)scrMemTreeGlob.numBits )[hi] );
	bits = ( (byte *)scrMemTreeGlob.leftBits )[lo];

	if ( !lo )
	{
		bits += ( (byte *)scrMemTreeGlob.leftBits )[hi];
	}

	return (1 << bits) + score;
}

/*
==============
MT_AddMemoryNode
==============
*/
void MT_AddMemoryNode( int newNode, int size )
{
	int node;
	unsigned short* parentNode;
	int newScore;
	int nodeNum;
	int level;
	int score;

#line 289
	assert(size >= 0 && size <= MEMORY_NODE_BITS);

	parentNode = &scrMemTreeGlob.head[size];
	node = *parentNode;
	if (node)
	{
		newScore = MT_GetScore(newNode);
		nodeNum = 0;
		level = MEMORY_NODE_COUNT;
		do
		{
#line 302
			assert(newNode != node);
			score = MT_GetScore(node);

			assert(score != newScore);

			if (score < newScore)
			{
				while (1)
				{
#line 311
					assert(node == *parentNode);
					assert(node != newNode);

					*parentNode = newNode;
					scrMemTreeGlob.nodes[newNode] = scrMemTreeGlob.nodes[node];
					if (!node)
					{
						break;
					}
					level >>= 1;

#line 321
					assert(node != nodeNum);

					if (node < nodeNum)
					{
						parentNode = &scrMemTreeGlob.nodes[newNode].prev;
						nodeNum -= level;
					}
					else
					{
						parentNode = &scrMemTreeGlob.nodes[newNode].next;
						nodeNum += level;
					}
					newNode = node;
					node = *parentNode;
				}
				return;
			}
			level >>= 1;

#line 339
			assert(newNode != nodeNum);

			if (newNode < nodeNum)
			{
				parentNode = &scrMemTreeGlob.nodes[node].prev;
				nodeNum -= level;
			}
			else
			{
				parentNode = &scrMemTreeGlob.nodes[node].next;
				nodeNum += level;
			}

			node = *parentNode;
		}
		while (node);
	}

	*parentNode = newNode;
	scrMemTreeGlob.nodes[newNode].prev = 0;
	scrMemTreeGlob.nodes[newNode].next = 0;
}

/*
==============
MT_RemoveMemoryNode
==============
*/
bool MT_RemoveMemoryNode( int oldNode, int size )
{
	int node;
	unsigned short* parentNode;
	int prevScore;
	int nextScore;
	int nodeNum;
	int level;
	MemoryNode oldNodeValue;
	MemoryNode tempNodeValue;

#line 371
	assert(size >= 0 && size <= MEMORY_NODE_BITS);

	nodeNum = 0;
	level = MEMORY_NODE_COUNT;
	parentNode = &scrMemTreeGlob.head[size];
	for (node = *parentNode; node; node = *parentNode)
	{
		if (oldNode == node)
		{
			oldNodeValue = scrMemTreeGlob.nodes[oldNode];

			while (1)
			{
				if (!oldNodeValue.prev)
				{
					oldNode = oldNodeValue.next;
					*parentNode = oldNode;

					if (!oldNode)
					{
						return true;
					}

					parentNode = &scrMemTreeGlob.nodes[oldNode].next;
				}
				else if (!oldNodeValue.next)
				{
					oldNode = oldNodeValue.prev;
					*parentNode = oldNode;
					parentNode = &scrMemTreeGlob.nodes[oldNode].prev;
				}
				else
				{
					prevScore = MT_GetScore(oldNodeValue.prev);
					nextScore = MT_GetScore(oldNodeValue.next);

#line 406
					assert(prevScore != nextScore);

					if (prevScore < nextScore)
					{
						oldNode = oldNodeValue.next;
						*parentNode = oldNode;
						parentNode = &scrMemTreeGlob.nodes[oldNode].next;
					}
					else
					{
						oldNode = oldNodeValue.prev;
						*parentNode = oldNode;
						parentNode = &scrMemTreeGlob.nodes[oldNode].prev;
					}
				}

#line 421
				assert(oldNode);

				tempNodeValue = oldNodeValue;
				oldNodeValue = scrMemTreeGlob.nodes[oldNode];
				scrMemTreeGlob.nodes[oldNode] = tempNodeValue;
			}
		}

		if (oldNode == nodeNum)
		{
			return false;
		}

		level >>= 1;
		if (oldNode < nodeNum)
		{
			parentNode = &scrMemTreeGlob.nodes[node].prev;
			nodeNum -= level;
		}
		else
		{
			parentNode = &scrMemTreeGlob.nodes[node].next;
			nodeNum += level;
		}
	}

	return false;
}

/*
==============
MT_RemoveHeadMemoryNode
==============
*/
void MT_RemoveHeadMemoryNode( int size )
{
	int oldNode;
	unsigned short* parentNode;
	int prevScore;
	int nextScore;
	MemoryNode oldNodeValue;
	MemoryNode tempNodeValue;

#line 459
	assert(size >= 0 && size <= MEMORY_NODE_BITS);

	parentNode = &scrMemTreeGlob.head[size];
	oldNode = scrMemTreeGlob.head[size];
	oldNodeValue = scrMemTreeGlob.nodes[oldNode];

	while (1)
	{
		if (!oldNodeValue.prev)
		{
			oldNode = oldNodeValue.next;
			*parentNode = oldNode;

			if (!oldNode)
			{
				break;
			}

			parentNode = &scrMemTreeGlob.nodes[oldNode].next;
		}
		else if (!oldNodeValue.next)
		{
			oldNode = oldNodeValue.prev;
			*parentNode = oldNode;
			parentNode = &scrMemTreeGlob.nodes[oldNode].prev;
		}
		else
		{
			prevScore = MT_GetScore(oldNodeValue.prev);
			nextScore = MT_GetScore(oldNodeValue.next);

#line 488
			assert(prevScore != nextScore);

			if (prevScore < nextScore)
			{
				oldNode = oldNodeValue.next;
				*parentNode = oldNode;
				parentNode = &scrMemTreeGlob.nodes[oldNode].next;
			}
			else
			{
				oldNode = oldNodeValue.prev;
				*parentNode = oldNode;
				parentNode = &scrMemTreeGlob.nodes[oldNode].prev;
			}
		}

#line 503
		assert(oldNode);

		tempNodeValue = oldNodeValue;
		oldNodeValue = scrMemTreeGlob.nodes[oldNode];
		scrMemTreeGlob.nodes[oldNode] = tempNodeValue;
	}
}

/*
============
MT_Init
============
*/
void MT_Init()
{
	int i;

	scrMemTreePub.mt_buffer = (char *)scrMemTreeGlob.nodes;

	MT_InitBits();

	for ( i = 0; i <= MEMORY_NODE_BITS; i++ )
	{
		scrMemTreeGlob.head[i] = 0;
	}

	scrMemTreeGlob.nodes[0].prev = 0;
	scrMemTreeGlob.nodes[0].next = 0;

	for ( i = 0; i < MEMORY_NODE_BITS; i++ )
	{
		MT_AddMemoryNode(1 << i, i);
	}

	scrMemTreeGlob.totalAlloc = 0;
	scrMemTreeGlob.totalAllocBuckets = 0;
	memset(scrMemTreeDebugGlob.mt_usage, 0, sizeof(scrMemTreeDebugGlob.mt_usage));
	memset(scrMemTreeDebugGlob.mt_usage_size, 0, sizeof(scrMemTreeDebugGlob.mt_usage_size));
}

/*
==============
MT_Error
==============
*/
void MT_Error( const char *funcName, int numBytes )
{
	FUN_0047ae50(1, "%s: failed allocation of %d bytes for script usage\n", funcName, numBytes);
}

/*
==============
MT_GetSize
==============
*/
int MT_GetSize( int numBytes )
{
	int numBuckets;
	int size;

#line 558
	assert(numBytes > 0);

	if ( numBytes < MEMORY_NODE_COUNT )
	{
		numBuckets = (numBytes + 7) / 8 - 1;
		size = numBuckets <= 256 - 1 ? scrMemTreeGlob.logBits[numBuckets] : scrMemTreeGlob.logBits[numBuckets >> 8] + 8;
	}
	else
	{
		MT_Error("MT_GetSize: max allocation exceeded", numBytes);
		size = 0;
	}

	return size;
}

/*
============
MT_AllocIndex
============
*/
unsigned short MT_AllocIndex( int numBytes, int type )
{
	int nodeNum, size, newSize;

	size = MT_GetSize(numBytes);

#line 581
	assert(size >= 0 && size <= MEMORY_NODE_BITS);

	for ( newSize = size; ; newSize++ )
	{
		if ( newSize > MEMORY_NODE_BITS )
		{
			MT_Error("MT_AllocIndex", numBytes);
			return 0;
		}

		nodeNum = scrMemTreeGlob.head[newSize];

		if ( nodeNum )
		{
			break;
		}
	}

	MT_RemoveHeadMemoryNode(newSize);

	while ( newSize != size )
	{
		newSize--;
		MT_AddMemoryNode(nodeNum + (1 << newSize), newSize);
	}

#line 598
	assertMsg((nodeNum >= 0 && nodeNum < MEMORY_NODE_COUNT), "(nodeNum) = %i", nodeNum);

	scrMemTreeGlob.totalAlloc++;
	scrMemTreeGlob.totalAllocBuckets += 1 << size;

#line 604
	assert(type);
	assertMsg((!scrMemTreeDebugGlob.mt_usage[nodeNum]), "(MT_NodeInfoString( nodeNum )) = '%s'", MT_NodeInfoString(nodeNum));
	assertMsg((!scrMemTreeDebugGlob.mt_usage_size[nodeNum]), "(MT_NodeInfoString( nodeNum )) = '%s'", MT_NodeInfoString(nodeNum));

	scrMemTreeDebugGlob.mt_usage[nodeNum] = type;
	scrMemTreeDebugGlob.mt_usage_size[nodeNum] = size;

	return nodeNum;
}

/*
============
MT_FreeIndex
============
*/
void MT_FreeIndex( unsigned int nodeNum, int numBytes )
{
	int lowBit, size;

	size = MT_GetSize(numBytes);

#line 638
	assert(size >= 0 && size <= MEMORY_NODE_BITS);
	assert(nodeNum > 0 && nodeNum < MEMORY_NODE_COUNT);

	scrMemTreeGlob.totalAlloc--;
	scrMemTreeGlob.totalAllocBuckets -= 1 << size;

#line 645
	assert(scrMemTreeDebugGlob.mt_usage[nodeNum]);
	assertMsg((scrMemTreeDebugGlob.mt_usage_size[nodeNum] == size), "(MT_NodeInfoString( nodeNum )) = '%s'", MT_NodeInfoString(nodeNum));

	scrMemTreeDebugGlob.mt_usage[nodeNum] = 0;
	scrMemTreeDebugGlob.mt_usage_size[nodeNum] = 0;

	while ( 1 )
	{
#line 653
		assert(size <= MEMORY_NODE_BITS);

		lowBit = 1 << size;
#line 656
		assert(nodeNum == (nodeNum & ~(lowBit - 1)));

		if ( size == MEMORY_NODE_BITS || !MT_RemoveMemoryNode(nodeNum ^ lowBit, size) )
		{
			MT_AddMemoryNode(nodeNum, size);
			return;
		}

		nodeNum &= ~lowBit;
		size++;
	}
}

/*
==============
MT_SafeFreeIndex
==============
*/
void MT_SafeFreeIndex( unsigned int nodeNum )
{
	int lowBit;
	int size;
	int nodeIndex;

#line 679
	assert(nodeNum > 0 && nodeNum < MEMORY_NODE_COUNT);

	size = 0;
	nodeIndex = nodeNum;

	while ( 1 )
	{
#line 686
		assert(size <= MEMORY_NODE_BITS);

		lowBit = 1 << size;
#line 689
		assert(nodeIndex == (nodeIndex & ~(lowBit - 1)));

		if ( MT_RemoveMemoryNode(nodeIndex, size) )
		{
			MT_AddMemoryNode(nodeIndex, size);
			return;
		}

		if ( size == MEMORY_NODE_BITS )
		{
			break;
		}

		nodeIndex &= ~lowBit;
		size++;
	}

	size = 0;
	nodeIndex = nodeNum;

	while ( 1 )
	{
#line 709
		assert(size <= MEMORY_NODE_BITS);

		lowBit = 1 << size;
#line 712
		assert(nodeIndex == (nodeIndex & ~(lowBit - 1)));

		if ( size == MEMORY_NODE_BITS || !MT_RemoveMemoryNode(nodeIndex ^ lowBit, size) )
		{
			MT_AddMemoryNode(nodeIndex, size);
			return;
		}

		nodeIndex &= ~lowBit;
		size++;
	}
}

/*
============
MT_Alloc
============
*/
void* MT_Alloc( int numBytes, int type )
{
	return scrMemTreeGlob.nodes + MT_AllocIndex( numBytes, type );
}

/*
============
MT_Free
============
*/
void MT_Free( void *p, int numBytes )
{
#line 734
	assertMsg(((MemoryNode *) p - scrMemTreeGlob.nodes >= 0 && (MemoryNode *) p - scrMemTreeGlob.nodes < MEMORY_NODE_COUNT), "((MemoryNode *) p - scrMemTreeGlob.nodes) = %i", (MemoryNode *) p - scrMemTreeGlob.nodes);

	MT_FreeIndex( (MemoryNode *)p - scrMemTreeGlob.nodes, numBytes );
}

/*
============
MT_InitForceAlloc
============
*/
byte *MT_InitForceAlloc()
{
	memset(scrMemTreeDebugGlob.mt_usage, 0, sizeof(scrMemTreeDebugGlob.mt_usage));

	scrMemTreeGlob.totalAlloc = 0;
	scrMemTreeGlob.totalAllocBuckets = 0;

	memset(scrMemTreeDebugGlob.mt_usage_size, 0, sizeof(scrMemTreeDebugGlob.mt_usage_size));

	return (byte *)Z_VirtualAlloc( 8192 );
}

/*
============
MT_ForceAllocIndex
============
*/
void MT_ForceAllocIndex( byte *allocBits, unsigned int nodeNum, int numBytes )
{
	int size, newSize;

	size = MT_GetSize(numBytes);

#line 769
	assert(size >= 0 && size <= MEMORY_NODE_BITS);

	scrMemTreeGlob.totalAlloc++;

	newSize = 1 << size;
	scrMemTreeGlob.totalAllocBuckets += newSize;

#line 776
	assertMsg((!scrMemTreeDebugGlob.mt_usage[nodeNum]), "(MT_NodeInfoString( nodeNum )) = '%s'", MT_NodeInfoString(nodeNum));
	assertMsg((!scrMemTreeDebugGlob.mt_usage_size[nodeNum]), "(MT_NodeInfoString( nodeNum )) = '%s'", MT_NodeInfoString(nodeNum));

	scrMemTreeDebugGlob.mt_usage[nodeNum] = 6;
	scrMemTreeDebugGlob.mt_usage_size[nodeNum] = size;

	while ( newSize )
	{
		allocBits[ nodeNum >> 3 ] |= 1 << ( nodeNum & 7 );
		nodeNum++;
		newSize--;
	}
}

/*
============
MT_FinishForceAlloc
============
*/
void MT_FinishForceAlloc( byte *allocBits )
{
	int nodeNum;

	for ( nodeNum = 1; nodeNum < MEMORY_NODE_COUNT; nodeNum++ )
	{
		if ( allocBits[nodeNum >> 3] & ( 1 << ( nodeNum & 7 ) ) )
		{
			continue;
		}

		MT_SafeFreeIndex(nodeNum);
	}

	Z_VirtualFree(allocBits);
}

/*
============
MT_Realloc
============
*/
int MT_Realloc( int oldNumBytes, int newNumbytes )
{
	return MT_GetSize(oldNumBytes) >= MT_GetSize(newNumbytes);
}
