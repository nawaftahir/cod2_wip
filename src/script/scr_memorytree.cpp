#include "../qcommon/qcommon.h"
#include "script_public.h"
#include "../universal/com_memory.h"

scrMemTreePub_t scrMemTreePub;
scrMemTreeGlob_t scrMemTreeGlob;

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

/*
============
MT_DumpTree
============
*/

























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























/*
==============
MT_AddMemoryNode
==============
*/











































































/*
==============
MT_RemoveMemoryNode
==============
*/

























































































/*
==============
MT_RemoveHeadMemoryNode
==============
*/





























































/*
============
MT_Init
============
*/

























/*
==============
MT_Error
==============
*/







/*
==============
MT_GetSize
==============
*/




















/*
============
MT_AllocIndex
============
*/

































/*
============
MT_FreeIndex
============
*/
























/*
==============
MT_AddMemoryNode
==============
*/














































/*
============
MT_Alloc
============
*/
// 1.0 MT_Alloc passes the allocation type through; the sanitized header still
// declares the later 1-arg form, so alias the 2-arg call onto the same symbol.






/*
============
MT_Free
============
*/





/*
============
MT_InitForceAlloc
============
*/








/*
============
MT_ForceAllocIndex
============
*/


















/*
============
MT_FinishForceAlloc
============
*/

















/*
============
MT_Realloc
============
*/




