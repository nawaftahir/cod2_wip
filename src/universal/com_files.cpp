#include "../qcommon/qcommon.h"
#include <direct.h>
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

fileHandleData_t fsh[MAX_FILE_HANDLES];






































































































































































































































































































































































































































fileHandle_t FS_HandleForFile(FsThread streamThread)
{
	int i;
	int first;
	int count;

	if ( streamThread )
	{
		first = 51;
		count = 13;
	}
	else
	{
		first = 1;
		count = 50;
	}

	for (i = 0; i < count; ++i)
	{
		if (fsh[first + i].handleFiles.file.o == NULL)
		{
			return first + i;
		}
	}

	assert(!streamThread);

	for (i = 1; i < MAX_FILE_HANDLES; ++i)
	{
		Com_Printf("FILE %2i: '%s'\n", i, fsh[i].name);
	}

	Com_Error(ERR_DROP, "FS_HandleForFile: none free");
	return -1;
}






FILE *FS_FileForHandle( fileHandle_t f )
{
	assertMsg( (f > 0 && f < (1 + 50 + 13)), "(f) = %i", f );
	assert( !fsh[f].zipFile );
	assert( fsh[f].handleFiles.file.o );
	return fsh[f].handleFiles.file.o;
}






























int FS_filelength( fileHandle_t f )
{
	int pos;
	int end;
	FILE *h;

	assert( f );
	if ( !fs_searchpaths )
	{
		Com_Error( ERR_FATAL, "Filesystem call made without initialization\n" );
	}
	if ( fsh[f].zipFile )
	{
		return ((unz_s *)fsh[f].handleFiles.file.z)->cur_file_info.uncompressed_size;
	}
	h = FS_FileForHandle(f);
	pos = ftell(h);
	fseek(h, 0, SEEK_END);
	end = ftell(h);
	fseek(h, pos, SEEK_SET);
	return end;
}

static void FS_ReplaceSeparators(char *path)
{
	char *src;
	char *dst;
	bool wasSep = false;

	src = path;
	dst = path;

	while ( *src )
	{
		if ( *src == '/' || *src == '\\' )
		{
			if ( !wasSep )
			{
				wasSep = true;
				*dst++ = '\\';
			}
		}
		else
		{
			wasSep = false;
			*dst = *src;
			dst++;
		}
		++src;
	}
	*dst = 0;
}

char fs_gamedir[MAX_OSPATH];























static void FS_BuildOSPath_Internal(const char *base, const char *game, const char *qpath, char *ospath, FsThread thread)
{
	unsigned int lenBase;
	unsigned int lenGame;
	unsigned int lenQpath;

	assert(base);
	assert(qpath);
	assert(ospath);

	if ( !game || !game[0] )
		game = fs_gamedir;

	lenBase = strlen(base);
	lenGame = strlen(game);
	lenQpath = strlen(qpath);

	if ((int)(lenBase + lenGame + 1 + lenQpath + 1) >= MAX_OSPATH)
	{
		if (thread)
		{
			*ospath = 0;
			return;
		}

		Com_Error(ERR_FATAL, "FS_BuildOSPath: os path length exceeded\n");
	}

	memcpy(ospath, base, lenBase);
	ospath[lenBase] = '/';

	memcpy(&ospath[lenBase + 1], game, lenGame);
	ospath[lenBase + 1 + lenGame] = '/';

	memcpy(ospath + lenBase + lenGame + 2, qpath, lenQpath + 1);
	FS_ReplaceSeparators(ospath);
}

void FS_BuildOSPath(const char *base, const char *game, const char *qpath, char *ospath)
{
	FS_BuildOSPath_Internal(base, game, qpath, ospath, FS_THREAD_MAIN);
}

dvar_t *fs_homepath;

int FS_CreatePath(char *OSPath)
{
	char	*ofs;

	if ( strstr( OSPath, ".." ) || strstr( OSPath, "::" ) )
	{
		Com_Printf( "WARNING: refusing to create relative path \"%s\"\n", OSPath );
		return qtrue;
	}

	for (ofs = OSPath+1; *ofs ; ofs++)
	{
		if (*ofs == '\\')
		{
			*ofs = 0;
			_mkdir (OSPath);
			*ofs = '\\';
		}
	}

	return qfalse;
}

void FS_CopyFile(char *fromOSPath, char *toOSPath)
{
	FILE* f;
	int len;
	byte* buf;

	f = fopen(fromOSPath, "rb");
	if (!f)
		return;

	fseek(f, 0, SEEK_END);
	len = ftell(f);
	fseek(f, 0, SEEK_SET);

	buf = (byte*)malloc(len);
	if (fread(buf, 1, len, f) != (size_t)len)
		Com_Error(ERR_FATAL, "Short read in FS_CopyFile()\n");

	fclose(f);

	if (FS_CreatePath(toOSPath))
	{
		free(buf);
		return;
	}

	f = fopen(toOSPath, "wb");
	if (!f)
	{
		free(buf);
		return;
	}

	if (fwrite(buf, 1, len, f) != (size_t)len)
		Com_Error(ERR_FATAL, "Short write in FS_CopyFile()\n");

	fclose(f);
	free(buf);
}

void FS_Remove(const char *osPath)
{
	_rmdir(osPath);
}

qboolean FS_FileExists( const char *file )
{
	FILE *f;
	char testpath[MAX_OSPATH];

	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, file, testpath);
	f = fopen(testpath, "rb");

	if ( f )
	{
		fclose(f);
		return qtrue;
	}
	return qfalse;
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
