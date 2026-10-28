
#include "../qcommon/qcommon.h"
#include "dvar.h"
#include "com_files.h"
#include "com_memory.h"

#include <direct.h>

#define PATH_SEP '\\'


















extern dvar_t *com_sv_running;




int com_fileAccessed = 0;
int fs_loadStack;
char fs_gamedir[MAX_OSPATH];


dvar_t *fs_homepath;







dvar_t *fs_ignoreLocalized;

searchpath_t *fs_searchpaths;



fileHandleData_t fsh[MAX_FILE_HANDLES];











#define MAX_FOUND_FILES 0x1000

void FS_Remove( const char *osPath );



void FS_BuildOSPath(const char *base, const char *game, const char *qpath, char* ospath);
int FS_FOpenFileRead(const char *filename, fileHandle_t *file, qboolean uniqueFILE);
char** FS_ListFiles(const char* path, const char* extension, FsListBehavior behavior, int* numfiles, int allocType);
char **FS_ListFilteredFilesOfDirType( const char *path, const char *extension, const char *filter, FsListBehavior behavior, int *numfiles, int dirTypes, int flags );

qboolean FS_Initialized()
{
	return fs_searchpaths != NULL;
}

void FS_CheckFileSystemStarted()
{
	if (!fs_searchpaths)
		Com_Error(ERR_FATAL, "Filesystem call made without initialization\n");
}



int FS_LoadStack()
{
	return fs_loadStack;
}

qboolean FS_UseSearchPath(const searchpath_t *pSearch)
{
	if ( pSearch->localized && fs_ignoreLocalized->current.boolean )
	{
		return qfalse;
	}

	return qtrue;
}

/*
==============
FS_LanguageHasAssets
==============
*/
qboolean FS_LanguageHasAssets( int language )
{
	searchpath_t *search;

	for ( search = fs_searchpaths; search; search = search->next )
	{
		if ( search->localized && search->language == language )
			return qtrue;
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
		if ( letter == PATH_SEP )
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

	Com_Error(ERR_DROP, "" "FS_HandleForFile: none free");
	return -1;
}







FILE *FS_FileForHandle( fileHandle_t f )
{
	assertMsg((f > 0 && f < (1 + 50 + 13)), "(f) = %i", f);
	assert(!fsh[f].zipFile);
	assert(fsh[f].handleFiles.file.o);
	return fsh[f].handleFiles.file.o;
}





























int FS_filelength( fileHandle_t f )
{
	int pos;
	int end;
	FILE*   h;
	unz_s *zfile;

	assert(f);
	FS_CheckFileSystemStarted();

	if (fsh[f].zipFile)
	{
		zfile = (unz_s*)fsh[f].handleFiles.file.z;
		return zfile->cur_file_info.uncompressed_size;
	}

	h = FS_FileForHandle( f );

	pos = ftell( h );
	fseek( h, 0, SEEK_END );
	end = ftell( h );
	fseek( h, pos, SEEK_SET );

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
				*dst++ = PATH_SEP;
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

		Com_Error(ERR_FATAL, "" "FS_BuildOSPath: os path length exceeded\n");
	}

	memcpy(ospath, base, lenBase);
	ospath[lenBase] = '/';

	memcpy(&ospath[lenBase + 1], game, lenGame);
	ospath[lenBase + 1 + lenGame] = '/';

	memcpy(ospath + lenBase + lenGame + 2, qpath, lenQpath + 1);
	FS_ReplaceSeparators(ospath);
}

void FS_BuildOSPath(const char *base, const char *game, const char *qpath, char* ospath)
{
	FS_BuildOSPath_Internal(base, game, qpath, ospath, FS_THREAD_MAIN);
}

int FS_CreatePath(char *OSPath)
{
	char	*ofs;

	// make absolutely sure that it can't back up the path
	// FIXME: is c: allowed???
	if ( strstr( OSPath, ".." ) || strstr( OSPath, "::" ) )
	{
		Com_Printf( "WARNING: refusing to create relative path \"%s\"\n", OSPath );
		return qtrue;
	}

	for (ofs = OSPath+1; *ofs ; ofs++)
	{
		if (*ofs == PATH_SEP)
		{
			// create the directory
			*ofs = 0;
			_mkdir(OSPath);
			*ofs = PATH_SEP;
		}
	}

	return qfalse;
}

void FS_CopyFile(char *fromOSPath, char *toOSPath)
{
	FILE *f;
	size_t len;
	char *buf;

	f = fopen(fromOSPath, "rb");

	if (!f)
	{
		return;
	}

	fseek(f, 0, SEEK_END);
	len = ftell(f);
	fseek(f, 0, SEEK_SET);
	buf = (char *)malloc(len);

	if (fread(buf, 1, len, f) != len)
	{
		Com_Error(ERR_FATAL, "" "Short read in FS_CopyFile()\n");
	}

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

	if (fwrite(buf, 1, len, f) != len)
	{
		Com_Error(ERR_FATAL, "" "Short write in FS_CopyFile()\n");
	}

	fclose(f);
	free(buf);
}

/*
==============
FS_Remove
==============
*/
void FS_Remove( const char *osPath );

/*
==============
FS_FileExists
==============
*/
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

/*
==============
FS_Rename
==============
*/
void FS_Rename( const char *from, const char *to );

void FS_FCloseFile( fileHandle_t h )
{
	FILE *f;

	FS_CheckFileSystemStarted();

	if ( fsh[h].zipFile )
	{
		unzCloseCurrentFile( fsh[h].handleFiles.file.z );
		if ( fsh[h].handleFiles.unique )
		{
			unzClose( fsh[h].handleFiles.file.z );
		}
		Com_Memset( &fsh[h], 0, sizeof( fsh[h] ) );
		return;
	}

	// we didn't find it as a pak, so close it as a unique file
	if ( h )
	{
		f = FS_FileForHandle(h);
		fclose( f );
	}

	Com_Memset( &fsh[h], 0, sizeof( fsh[h] ) );
}


















































































int FS_FilenameCompare(const char *s1, const char *s2)
{
	int c1, c2;

	do
	{
		c1 = *s1++;
		c2 = *s2++;

		if (I_islower(c1))
		{
			c1 -= ('a' - 'A');
		}
		if (I_islower(c2))
		{
			c2 -= ('a' - 'A');
		}

		if (c1 == '\\' || c1 == ':')
		{
			c1 = '/';
		}
		if (c2 == '\\' || c2 == ':')
		{
			c2 = '/';
		}

		if (c1 != c2)
		{
			return -1;      // strings not equal
		}
	}
	while (c1);

	return 0;       // strings are equal
}

/*
==============
FS_FileCompare
==============
*/
qboolean FS_FileCompare( const char *filename1, const char *filename2 )
{
	FILE *f1;
	FILE *f2;
	int len1;
	int len2;
	int pos;
	byte *buf1;
	byte *buf2;
	byte *p1;
	byte *p2;

	f1 = fopen(filename1, "rb");

	if ( !f1 )
	{
		Com_Error(ERR_FATAL, "" "FS_FileCompare: %s does not exist\n", filename1);
	}

	f2 = fopen(filename2, "rb");

	if ( !f2 )
	{
		fclose(f1);
		return qfalse;
	}

	pos = ftell(f1);
	fseek(f1, 0, SEEK_END);
	len1 = ftell(f1);
	fseek(f1, pos, SEEK_SET);

	pos = ftell(f2);
	fseek(f2, 0, SEEK_END);
	len2 = ftell(f2);
	fseek(f2, pos, SEEK_SET);

	if ( len1 != len2 )
	{
		fclose(f1);
		fclose(f2);
		return qfalse;
	}

	buf1 = (byte *)Z_Malloc(len1);

	if ( fread(buf1, 1, len1, f1) != len1 )
	{
		Com_Error(ERR_FATAL, "" "Short read in FS_FileCompare()\n");
	}

	fclose(f1);

	buf2 = (byte *)Z_Malloc(len2);

	if ( fread(buf2, 1, len2, f2) != len2 )
	{
		Com_Error(ERR_FATAL, "" "Short read in FS_FileCompare()\n");
	}

	fclose(f2);

	p1 = buf1;
	p2 = buf2;

	for ( pos = 0; pos < len1; pos++, p1++, p2++ )
	{
		if ( *p1 != *p2 )
		{
			free(buf1);
			free(buf2);
			return qfalse;
		}
	}

	free(buf1);
	free(buf2);

	return qtrue;
}

/*
==============
FS_ShiftedStrStr
==============
*/
char *FS_ShiftedStrStr( const char *string, const char *substring, int shift )
{
	char buf[256];
	int i;

	for ( i = 0; substring[i]; i++ )
		buf[i] = substring[i] + shift;

	buf[i] = 0;
	return strstr(string, buf);
}






















// size is unused




























int FS_FOpenFileRead_Internal(const char *filename, int *file, qboolean uniqueFILE, FsThread thread);

int FS_FOpenFileReadStream(const char *filename, fileHandle_t *file, qboolean uniqueFILE)
{
	int ret;

	ret = FS_FOpenFileRead_Internal(filename, file, uniqueFILE, FS_THREAD_STREAM);
	return ret;
}

int FS_FOpenFileRead(const char *filename, fileHandle_t *file, qboolean uniqueFILE)
{
	int ret;

	com_fileAccessed = 1;
	ret = FS_FOpenFileRead_Internal(filename, file, uniqueFILE, FS_THREAD_MAIN);
	return ret;
}



/*
==============
FS_FindOSPathDir
==============
*/
const char *FS_FindOSPathDir( const char *qpath )
{
	searchpath_t *search;
	char netpath[MAX_OSPATH];
	directory_t *dir;
	FILE *f;

	for ( search = fs_searchpaths; search; search = search->next )
	{
		if ( !FS_UseSearchPath(search) )
			continue;
		if ( search->dir )
		{
			dir = search->dir;
			FS_BuildOSPath(dir->path, dir->gamedir, qpath, netpath);
			f = fopen(netpath, "rb");
			if ( !f )
				continue;
			fclose(f);
			return va("%s/%s", dir->gamedir, qpath);
		}
	}

	return NULL;
}


















/*
==============
FS_SetWritable
==============
*/
bool FS_SetWritable( const char *filename, int writable );

int FS_Read(void *buffer, int len, fileHandle_t h)
{
	size_t block;
	size_t remaining;
	int read;
	char *buf;
	int tries;
	FILE *f;

	FS_CheckFileSystemStarted();

	if (!h)
	{
		return 0;
	}

	if (fsh[h].zipFile)
	{
		read = unzReadCurrentFile(fsh[h].handleFiles.file.z, buffer, len);
		return read;
	}

	f = FS_FileForHandle(h);
	buf = (char *)buffer;
	remaining = len;
	tries = 0;

	while (remaining)
	{
		block = remaining;
		read = fread(buf, 1, block, f);

		if (!read)
		{
			if (!tries)
			{
				tries = 1;
			}
			else
			{
				return len - remaining;
			}
		}

		if (read == -1)
		{
			if (h >= 51 && h < 64)
			{
				return -1;
			}

			Com_Error(ERR_FATAL, "" "FS_Read: -1 bytes read");
		}

		remaining -= read;
		buf += read;
	}

	return len;
}

int FS_Write(const void *buffer, int len, fileHandle_t h)
{
	size_t block;
	size_t remaining;
	int written;
	char *buf;
	int tries;
	FILE *f;

	FS_CheckFileSystemStarted();

	if (!h)
	{
		return 0;
	}

	f = FS_FileForHandle(h);
	buf = (char *)buffer;
	remaining = len;
	tries = 0;

	while (remaining)
	{
		block = remaining;
		written = fwrite(buf, 1, block, f);

		if (!written)
		{
			if (tries)
			{
				return 0;
			}

			tries = 1;
		}

		if (written == -1)
		{
			return 0;
		}

		remaining -= written;
		buf += written;
	}

	if (fsh[h].handleSync)
	{
		fflush(f);
	}

	return len;
}













/*
==============
FS_SeekInternal
==============
*/
int FS_SeekInternal( int f, int offset, int origin );















































void FS_ResetFiles()
{
	fs_loadStack = 0;
}
























































































































































































































































































































































































































































































































































































































































































































































































































void FS_FreeFile(void* buffer)
{
	FS_CheckFileSystemStarted();
	assert(buffer);
	--fs_loadStack;
	Hunk_FreeTempMemory(buffer);
}






























/*
==============
FS_GetOSPath
==============
*/
int FS_GetOSPath( const char *qpath, char *ospath );



























/*
==============
FS_OpenFileForWrite
==============
*/
int FS_OpenFileForWrite( const char *filename );

































// allocType is unused





















/*
===============
FS_ListFilteredFiles

Returns a uniqued list of files that match the given criteria
from all search paths
===============
*/
char **FS_ListFilteredFiles(searchpath_t *searchPath, const char *path, const char *extension, const char *filter, FsListBehavior behavior, int *numfiles, int allocType);

















































































































































































char** FS_ListFiles(const char* path, const char* extension, FsListBehavior behavior, int* numfiles, int allocType);

/*
==============
FS_ListFilesOfDirType
==============
*/
char **FS_ListFilesOfDirType( const char *path, const char *extension, FsListBehavior behavior, int *numfiles, int dirTypes, int flags )
{
	return FS_ListFilteredFilesOfDirType(path, extension, NULL, behavior, numfiles, dirTypes, flags);
}

/*
==============
FS_IsBaseGameDirOfType
==============
*/
bool FS_IsBaseGameDirOfType( const char *dir, int dirTypes )
{
	if ( dirTypes == 0x3f )
		return true;
	if ( (dirTypes & 1) && !I_strncmp(dir, "main", 4) )
		return true;
	if ( (dirTypes & 2) && !I_strncmp(dir, "dev", 3) )
		return true;
	if ( (dirTypes & 4) && !I_strncmp(dir, "temp", 4) )
		return true;
	if ( (dirTypes & 8) && !I_strncmp(dir, "raw", 3) )
		return true;
	if ( (dirTypes & 0x10) && !I_strncmp(dir, "raw_shared", 10) )
		return true;
	if ( (dirTypes & 0x20) && !I_strncmp(dir, "devraw", 6) )
		return true;
	return false;
}

/*
==============
FS_ListFilteredFilesOfDirType
==============
*/
char **FS_ListFilteredFilesOfDirType( const char *path, const char *extension, const char *filter, FsListBehavior behavior, int *numfiles, int dirTypes, int flags );

// second argument is the same memory-tag id threaded through FS_ListFiles; unused here
void FS_FreeFileList( char **list, int allocType )
{
	int i;

	FS_CheckFileSystemStarted();

	if ( !list )
	{
		return;
	}

	for ( i = 0 ; list[i] ; i++ )
	{
		Z_Free( list[i] );
	}

	Z_Free( list );
}



void FS_ConvertPath(char *s)
{
	while (*s)
	{
		if (*s == '\\' || *s == ':')
		{
			*s = '/';
		}
		s++;
	}
}

static int FS_PathCmp(const char* s1, const char* s2)
{
	int c1;
	int c2;

	do
	{
		c1 = *s1++;
		c2 = *s2++;

		if (I_islower(c1))
		{
			c1 -= ('a' - 'A');
		}
		if (I_islower(c2))
		{
			c2 -= ('a' - 'A');
		}
		if (c1 == '\\' || c1 == ':')
		{
			c1 = '/';
		}
		if (c2 == '\\' || c2 == ':')
		{
			c2 = '/';
		}

		if (c1 < c2)
		{
			return -1;      // strings not equal
		}
		if (c1 > c2)
		{
			return 1;
		}
	}
	while (c1);

	return 0;       // strings are equal
}

void FS_SortFileList( char **filelist, int numfiles )
{
	int i, j, k, numsortedfiles;
	char **sortedlist;

	sortedlist = (char **)Z_Malloc( 4 * numfiles + 4 );
	sortedlist[0] = NULL;
	numsortedfiles = 0;
	for ( i = 0; i < numfiles; i++ )
	{
		for ( j = 0; j < numsortedfiles; j++ )
		{
			if ( FS_PathCmp( filelist[i], sortedlist[j] ) < 0 )
			{
				break;
			}
		}
		for ( k = numsortedfiles; k > j; k-- )
		{
			sortedlist[k] = sortedlist[k - 1];
		}
		sortedlist[j] = filelist[i];
		numsortedfiles++;
	}
	Com_Memcpy( filelist, sortedlist, numfiles * sizeof( *filelist ) );
	Z_Free( sortedlist );
}

static void FS_DisplayPath(int bLanguageCull)
{
	searchpath_t* s;
	int i;

	if (fs_ignoreLocalized->current.boolean)
	{
		Com_Printf("    localized assets are being ignored\n");
	}

	Com_Printf("Current search path:\n");

	for (s = fs_searchpaths; s; s = s->next)
	{
		if (bLanguageCull && !FS_UseSearchPath(s))
		{
			continue;
		}

		if (s->iwd)
		{
			Com_Printf("%s (%i files)\n", s->iwd, s->iwd->numFiles);
		}
		else
		{
			Com_Printf("%s/%s\n", s->dir, s->dir->gamedir);
		}
	}

	Com_Printf("\nFile Handles:\n");

	for (i = 1; i < MAX_FILE_HANDLES; ++i)
	{
		if (fsh[i].handleFiles.file.o)
		{
			Com_Printf("handle %i: %s\n", i, fsh[i].name);
		}
	}
}

void FS_FullPath_f(void)
{
	FS_DisplayPath(0);
}

void FS_Path_f(void)
{
	FS_DisplayPath(0);
}

































































































































































































































































































// closemfp is unused




















































void FS_ClearIwdReferences()
{
	searchpath_t *search;

	for ( search = fs_searchpaths; search; search = search->next )
	{
		// is the element a iwd file and has it been referenced?
		if ( search->iwd )
		{
			search->iwd->referenced = 0;
		}
	}
}







































































/*
==============
FS_ConditionalRestart
==============
*/
int FS_ConditionalRestart( int checksumFeed );







































































/*
==============
FS_FTell
==============
*/
int FS_FTell( int f );

void FS_Flush(fileHandle_t f)
{
	fflush(FS_FileForHandle(f));
}











































































































































































































































































































































































































































































































































































































































































































































































































































































































































/*
==============
GetBspExtension
==============
*/
const char *GetBspExtension()
{
	const char *gfx = Dvar_GetString("gfx_driver");

	assert(gfx);
	if ( *gfx )
		return va("%sbsp", gfx);

	return va("d3dbsp");
}
