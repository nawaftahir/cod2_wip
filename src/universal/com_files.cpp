#include "../qcommon/qcommon.h"
#include "dvar.h"
#include "com_files.h"

searchpath_t *fs_searchpaths;
int fs_loadStack;

qboolean FS_Initialized()
{
	return fs_searchpaths != NULL;
}

void FS_CheckFileSystemStarted( void )
{
	if ( !fs_searchpaths )
	{
		Com_Error( ERR_FATAL, "Filesystem call made without initialization\n" );
	}
}

int FS_LoadStack()
{
	return fs_loadStack;
}

dvar_t *fs_ignoreLocalized;

qboolean FS_UseSearchPath(const searchpath_t *pSearch)
{
	if (pSearch->localized && fs_ignoreLocalized->current.boolean)
	{
		return qfalse;
	}
	return qtrue;
}

qboolean FS_LanguageHasAssets(int language)
{
	searchpath_t *search;
	for (search = fs_searchpaths; search; search = search->next)
	{
		if (search->localized && search->language == language)
		{
			return qtrue;
		}
	}
	return qfalse;
}

long FS_HashFileName( const char *fname, int hashSize )
{
	int i;
	long hash;
	int letter;

	hash = 0;
	i = 0;
	while ( fname[i] != '\0' )
	{
		letter = tolower( fname[i] );
		if ( letter == '.' )
		{
			break;
		}
		if ( letter == '\\' )
		{
			letter = '/';
		}
		hash += letter * ( i + 119 );
		i++;
	}
	hash = ( hash ^ ( hash >> 10 ) ^ ( hash >> 20 ) );
	hash &= ( hashSize - 1 );
	return hash;
}

extern "C" {
void FUN_0047ed20(const char *, const char *, const char *, int);
int dword_01143494;

void FUN_0047f2b0(const char *a, const char *b, const char *c)
{
    dword_01143494 = 1;
    FUN_0047ed20(a, b, c, 0);
}
}


