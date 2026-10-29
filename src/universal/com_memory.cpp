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

// unreferenced; its name is not known
static void Z_FreeRaw( void *ptr );




void Z_VirtualDecommit( void *ptr, int size )
{
	VirtualFree( ptr, size, MEM_DECOMMIT );
}













































































































































































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



static void *FUN_00489c70(int size)
{
    return VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_READWRITE);
}


























































































































































































































































void *Z_VirtualAllocInternal(unsigned int size)
{
    void *buf = FUN_00489c70(size);
    if (!buf)
    {
        assertFail(0, "Z_VirtualAlloc: failed to allocate %d bytes", size);
        Com_Printf("Z_VirtualAlloc: failed to allocate %d bytes\n", size);
        Com_Error(ERR_FATAL, "Z_VirtualAlloc: EXE_ERR_OUT_OF_MEMORY");
    }
    return buf;
}

// unreferenced; its name is not known
void *Z_VirtualReserve(int size);

void *Z_VirtualReserve(int size)
{
    return VirtualAlloc(0, size, MEM_RESERVE, PAGE_READWRITE);
}







void Z_VirtualCommitInternal(void *ptr, int size)
{
    if (!VirtualAlloc(ptr, size, MEM_COMMIT, PAGE_READWRITE))
    {
        assertFail(0, "Z_VirtualCommit: failed to allocate %d bytes", size);
        Com_Printf("Z_VirtualCommit: failed to allocate %d bytes\n", size);
        Com_Error(ERR_FATAL, "Z_VirtualCommit: EXE_ERR_OUT_OF_MEMORY");
    }
}

// unreferenced; its name is not known


char *CopyStringInternal( const char *in )
{
    int len = strlen( in ) + 1;
    char *buf = (char *)Z_MallocInternal( len );
    strcpy( buf, in );
    return buf;
}



void ReplaceStringInternal( const char **str, const char *in )
{
    int newLen = strlen( in );
    char *newStr = (char *)*str;

    if ( !newStr || strlen( newStr ) < newLen )
    {
        if ( newStr )
        {
            Z_FreeInternal( newStr );
        }
        newStr = (char *)Z_MallocInternal( newLen + 1 );
        *str = newStr;
    }
    strcpy( newStr, in );
}







void Com_Meminfo_f( void );















void Com_TouchMemory( void );






























































































































































































void Com_InitHunkMemory(void);













































































void Hunk_Shutdown( void )
{
	assert(s_hunkData);
	assert(s_origHunkData);
	Z_VirtualFreeInternal( s_origHunkData );
	s_hunkData = NULL;
	s_origHunkData = NULL;
	s_hunkTotal = 0;
	memset( &hunk_low, 0, sizeof( hunk_low ) );
	memset( &hunk_high, 0, sizeof( hunk_high ) );
}

void *Hunk_FindDataForFileInternal( int type, const char *name, int hash )
{
	fileData_t *searchFileData;

	for ( searchFileData = com_fileDataHashTable[hash]; searchFileData; searchFileData = searchFileData->next )
	{
		if ( searchFileData->type != type )
			continue;

		if ( !_stricmp( searchFileData->name, name ) )
			return searchFileData->data;
	}

	return NULL;
}

void *Hunk_FindDataForFile( int type, const char *name )
{
	int hash;

	hash = FS_HashFileName( name, FILEDATA_HASH_SIZE );

	return Hunk_FindDataForFileInternal( type, name, hash );
}


























qboolean Hunk_DataOnHunk( void *data )
{
	assert(s_hunkData);
	if ( data < s_hunkData )
		return 0;

	if ( data >= &s_hunkData[s_hunkTotal] )
		return 0;

	return 1;
}










const char *Hunk_SetDataForFile( int type, const char *name, void *data, void *(*alloc)(int) );




































void Hunk_AddData( int type, void *data, void *(*alloc)(int) )
{
	fileData_t *fileData;

	fileData = (fileData_t *)alloc( sizeof( fileData_t ) - 1 );
	fileData->data = data;
	fileData->type = type;
	assert(type == fileData->type);
	fileData->next = com_hunkData;
	com_hunkData = fileData;
}













void Hunk_OverrideDataForFile( int type, const char *name, void *data )
{
	int hash;
	fileData_t *fd;

	hash = FS_HashFileName( name, 1024 );
	for ( fd = com_fileDataHashTable[hash]; fd; fd = fd->next )
	{
		if ( fd->type == type && !stricmp( fd->name, name ) )
		{
			fd->data = data;
			return;
		}
	}

	assertFailMsg( 0, "Hunk_OverrideDataForFile: could not find data" );
}


void Hunk_ClearDataFor( fileData_t **pFileData, unsigned char *low, unsigned char *high )
{
	while ( *pFileData )
	{
		fileData_t *fileData = *pFileData;

		if ( (unsigned char *)fileData >= low && (unsigned char *)fileData < high )
		{
			*pFileData = fileData->next;
		}
		else
		{
			pFileData = &fileData->next;
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

void DB_EnumXAssets( XAssetType type, void (*func)(XAssetHeader, void *), void *inData, bool includeOverride );













int Hunk_SetMark( void )
{
	Hunk_CheckTempMemoryHighClear();
	return hunk_high.permanent;
}

void Hunk_ClearHigh( int memory )
{
	Hunk_CheckTempMemoryHighClear();
	hunk_high.temp = memory;
	hunk_high.permanent = memory;
	Hunk_ClearData();
}

int Hunk_GetLowPermanent( void )
{
	Hunk_CheckTempMemoryClear();
	return hunk_low.permanent;
}

void Hunk_ClearLow( int memory )
{
	Hunk_CheckTempMemoryClear();
	hunk_low.temp = memory;
	hunk_low.permanent = memory;
	Hunk_ClearData();
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

void *Hunk_AllocInternal( int size )
{
	return Hunk_AllocAlignInternal( size, 32 );
}


































































































































































































void *Hunk_AllocAlignInternal( int size, int alignment )
{
	void *buf;

	assert(s_hunkData);






	assert(!(alignment & (alignment - 1)));
	assert(alignment <= HUNK_MAX_ALIGNEMT);
	Hunk_CheckTempMemoryHighClear();
	--alignment;
	hunk_high.permanent += size;
	hunk_high.permanent = ( hunk_high.permanent + alignment ) & ~alignment;
	buf = s_hunkData + s_hunkTotal - hunk_high.permanent;
	hunk_high.temp = hunk_high.permanent;

	if ( hunk_low.temp + hunk_high.temp > s_hunkTotal )
	{
		Com_Error(
		    ERR_DROP,
		    "Hunk_AllocAlign failed on %i bytes (total %i MB, low %i MB, high %i MB)",
		    size,
		    s_hunkTotal / ( 1024 * 1024 ),
		    hunk_low.temp / ( 1024 * 1024 ),
		    hunk_high.temp / ( 1024 * 1024 ) );
	}










	assert(!(((int)buf) & alignment));
	memset( buf, 0, size );

	return buf;
}














void *Hunk_AllocateTempMemoryHighInternal( int size )
{
	void *buf;

	assert(s_hunkData);
	hunk_high.temp += size;
	hunk_high.temp = PAD( hunk_high.temp, 16 );

	if ( hunk_low.temp + hunk_high.temp > s_hunkTotal )
	{
		Com_Error(
		    ERR_DROP,
		    "Hunk_AllocateTempMemoryHigh: failed on %i bytes (total %i MB, low %i MB, high %i MB)",
		    size,
		    s_hunkTotal / ( 1024 * 1024 ),
		    hunk_low.temp / ( 1024 * 1024 ),
		    hunk_high.temp / ( 1024 * 1024 ) );
	}

	buf = s_hunkData + s_hunkTotal - hunk_high.temp;



	assert(!(((int)buf) & 15));
	return buf;
}

void Hunk_ClearTempMemoryHighInternal( void )
{
	hunk_high.temp = hunk_high.permanent;
}

void *Hunk_AllocLowInternal( int size )
{
	return Hunk_AllocLowAlignInternal( size, 32 );
}
































































void *Hunk_AllocLowAlignInternal( int size, int alignment )
{
	void *buf;

	assert(s_hunkData);






	assert(!(alignment & (alignment - 1)));
	assert(alignment <= HUNK_MAX_ALIGNEMT);
	Hunk_CheckTempMemoryClear();
	--alignment;
	hunk_low.permanent = ( hunk_low.permanent + alignment ) & ~alignment;
	buf = &s_hunkData[hunk_low.permanent];
	hunk_low.permanent += size;
	hunk_low.temp = hunk_low.permanent;

	if ( hunk_low.temp + hunk_high.temp > s_hunkTotal )
	{
		Com_Error(
		    ERR_DROP,
		    "Hunk_AllocLowAlign failed on %i bytes (total %i MB, low %i MB, high %i MB)",
		    size,
		    s_hunkTotal / ( 1024 * 1024 ),
		    hunk_low.temp / ( 1024 * 1024 ),
		    hunk_high.temp / ( 1024 * 1024 ) );
	}










	assert(!(((int)buf) & alignment));
	memset( buf, 0, size );

	return buf;
}










void Hunk_ConvertTempToPermLowInternal( void )
{
	assert( s_hunkData );

	assert( hunk_low.temp >= hunk_low.permanent );
	hunk_low.permanent = hunk_low.temp;
}























void *Hunk_AllocateTempMemoryInternal( int size );






















































void *Hunk_ReallocateTempMemoryInternal( int size );






































void Hunk_FreeTempMemory( void *buf )
{
	hunkHeader_t *hdr;

	if ( !s_hunkData )
	{
		free( buf );
		return;
	}

	hdr = (hunkHeader_t *)buf - 1;
	if ( hdr->magic != 0x89537892 )
		Com_Error( ERR_FATAL, "Hunk_FreeTempMemory: bad magic" );

	hdr->magic = 0x89537893;

	assert( hdr == (void *)( s_hunkData + ((hunk_low.temp - hdr->size + 15) & ~15) ) );
	hunk_low.temp -= hdr->size;
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

static int LargeLocalBegin( int size );










static void LargeLocalEnd( int startPos );




static void *LargeLocalGetBuf( int startPos );



















void LargeLocalReset( void );



