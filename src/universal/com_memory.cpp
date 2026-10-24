#include "../qcommon/qcommon.h"
#include "dvar.h"
#include "com_files.h"
#include "com_memory.h"
#include <windows.h>

#define HUNK_MAX_ALIGNEMT 4096

void Hunk_CheckTempMemoryClear( void );
void Hunk_CheckTempMemoryHighClear( void );

static fileData_t *com_fileDataHashTable[FILEDATA_HASH_SIZE];
static fileData_t *com_hunkData;

// storage in its original order; the unreferenced blocks keep that layout
static int g_largeLocalPos;
__declspec(align(4)) static char mem_unreferenced0[0x58];
static byte g_largeLocalBuf[0x100000];
static int mem_unreferenced1;

static hunkUsed_t hunk_low;
static hunkUsed_t hunk_high;
static byte *s_hunkData;
static byte *s_origHunkData;
static int s_hunkTotal;

void Z_FreeInternal( void *ptr )
{
	free( ptr );
}

void Z_VirtualFreeInternal( void *ptr )
{
	VirtualFree( ptr, 0, MEM_RELEASE );
}

void Z_VirtualDecommit( void *ptr, int size )
{
	VirtualFree( ptr, size, MEM_DECOMMIT );
}













































































































































































// unreferenced; its name is not known





static void Z_MallocFailed( int size )
{
	assertFail( 0, "Z_Malloc: failed to allocate %d bytes", size );
	Com_Printf( "Z_Malloc: failed to allocate %d bytes\n", size );
	Com_Error( ERR_FATAL, "Z_Malloc: EXE_ERR_OUT_OF_MEMORY" );
}

static void *Z_MallocRaw( int size )
{
	return malloc( size );
}

void *Z_TryMallocInternal( int size )
{
	void *buf;

	buf = Z_MallocRaw( size );
	if ( buf )
		Com_Memset( buf, 0, size );

	return buf;
}

void *Z_MallocInternal( int size )
{
	void *buf;

	buf = Z_TryMallocInternal( size );
	if ( !buf )
		Z_MallocFailed( size );

	return buf;
}

void *Z_MallocGarbageInternal( int size )
{
	void *buf;

	buf = Z_MallocRaw( size );
	if ( !buf )
		Z_MallocFailed( size );

	return buf;
}

// unreferenced; its name is not known











































































































































void Hunk_ClearDataFor( fileData_t **pFileData, unsigned char *low, unsigned char *high )
{
	fileData_t *fileData;
	void *data;

	while ( *pFileData )
	{
		fileData = *pFileData;

		if ( fileData < (fileData_t *)low || fileData >= (fileData_t *)high )
		{
			pFileData = &fileData->next;
		}
		else
		{
			*pFileData = fileData->next;
			data = fileData->data;

			switch ( fileData->type )
			{
			case FILEDATA_XMODELPARTS:
				XModelPartsFree( (XModelParts *)data );
				break;
			case FILEDATA_XMODEL:
				XModelFree( (XModel *)data );
				break;
			case FILEDATA_XANIM:
				XAnimFree( (XAnimParts *)data );
				break;
			case FILEDATA_XANIMLIST:
				XAnimFreeList( (XAnim *)data );
				break;
			}
		}
	}
}

void Hunk_ClearData( void )
{
	unsigned char *low;
	unsigned char *high;
	unsigned int hash;
	fileData_t **bucket;

	low = &s_hunkData[hunk_low.permanent];
	high = s_hunkData + s_hunkTotal - hunk_high.permanent;

	for ( hash = 0; hash < FILEDATA_HASH_SIZE; ++hash )
	{
		bucket = &com_fileDataHashTable[hash];
		Hunk_ClearDataFor( bucket, low, high );
	}

	Hunk_ClearDataFor( &com_hunkData, low, high );
}

void DB_EnumXAssetsFor( fileData_t *fileData, int fileDataType, void (*func)(XAssetHeader, void *), void *inData )
{
	void *data;
	XAssetHeader header;

	header.data = NULL;

	for ( ; fileData; fileData = fileData->next )
	{
		if ( fileData->type != fileDataType )
			continue;

		data = fileData->data;

		switch ( fileData->type )
		{
		case FILEDATA_XMODEL:
			header.model = (XModel *)data;
			func( header, inData );
			break;
		}
	}
}

void Hunk_Clear( void )
{
	hunk_low.permanent = 0;
	hunk_low.temp = 0;
	hunk_high.permanent = 0;
	hunk_high.temp = 0;
	Hunk_ClearData();
}

int Hunk_Used( void )
{
	return hunk_low.permanent + hunk_high.permanent;
}

void Hunk_ClearTempMemoryHighInternal( void )
{
	hunk_high.temp = hunk_high.permanent;
}

void Hunk_ClearTempMemoryInternal( void )
{
	if ( s_hunkData )
		hunk_low.temp = hunk_low.permanent;
}





























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































void Hunk_CheckTempMemoryClear( void )
{
	assert( s_hunkData );
	assert( hunk_low.temp == hunk_low.permanent );
}








void Hunk_CheckTempMemoryHighClear( void )
{
	assert( s_hunkData );
	assert( hunk_high.temp == hunk_high.permanent );
}

int Hunk_HideTempMemory( void )
{
	int permanent;

	permanent = hunk_low.permanent;
	hunk_low.permanent = hunk_low.temp;

	return permanent;
}

void Hunk_ShowTempMemory( int memory )
{
	Hunk_CheckTempMemoryClear();
	hunk_low.permanent = memory;
}

int Hunk_HideTempMemoryHigh( void )
{
	int permanent;

	permanent = hunk_high.permanent;
	hunk_high.permanent = hunk_high.temp;

	return permanent;
}

void Hunk_ShowTempMemoryHigh( int memory )
{
	Hunk_CheckTempMemoryHighClear();
	hunk_high.permanent = memory;
}

