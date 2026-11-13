
#include "../qcommon/qcommon.h"
#include "dvar.h"
#include "com_files.h"
#include "com_memory.h"

#include <direct.h>

#define PATH_SEP '\\'

#define iassert(expr) \
	do { \
		static bool s_assertDisable; \
		if ( !(expr) && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 1, 1 ) ) \
			{ \
			case 0: DebugBreak(); break; \
			case 2: s_assertDisable = true; break; \
			} \
		} \
	} while ( 0 )
#line 28
extern dvar_t *com_sv_running;




int com_fileAccessed = 0;
int fs_loadStack;
char fs_gamedir[MAX_OSPATH];


dvar_t *fs_homepath;
dvar_t *fs_debug;
dvar_t *fs_copyfiles;
dvar_t *fs_cdpath;
dvar_t *fs_basepath;
dvar_t *fs_basegame;
dvar_t *fs_useOldAssets;
dvar_t *fs_gameDirVar;
dvar_t *fs_ignoreLocalized;

searchpath_t *fs_searchpaths;

int fs_packFiles;
static const char *default_config;
char lastValidBase[MAX_OSPATH];
char lastValidGame[MAX_OSPATH];
char *Sys_DefaultInstallPath( void );
int Sys_DirectoryHasContents( const char *directory );
void FS_FCloseFile( fileHandle_t h );
const char *IwdFileLanguage( const char *iwdname );
int iwdsort( const void *a, const void *b );

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
void FS_Remove( const char *osPath )
{
	remove(osPath);
}

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
void FS_Rename( const char *from, const char *to )
{
	char from_ospath[MAX_OSPATH];
	char to_ospath[MAX_OSPATH];

	FS_CheckFileSystemStarted();
	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, from, from_ospath);
	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, to, to_ospath);

	if ( fs_debug->current.integer )
		Com_Printf("FS_Rename: %s --> %s\n", from_ospath, to_ospath);

	if ( rename(from_ospath, to_ospath) )
	{
		FS_Remove(to_ospath);
		if ( rename(from_ospath, to_ospath) )
		{
			FS_CopyFile(from_ospath, to_ospath);
			FS_Remove(from_ospath);
		}
	}
}

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

static fileHandle_t FS_GetHandleAndOpenFile(const char *filename, const char *ospath, const char *modes, FsThread thread)
{
	fileHandle_t f;
	FILE *fp;

	fp = fopen(ospath, modes);
	if ( !fp )
		return 0;

	f = FS_HandleForFile(thread);
	fsh[f].zipFile = qfalse;
	fsh[f].handleFiles.file.o = fp;
	I_strncpyz(fsh[f].name, filename, sizeof(fsh[f].name));
	fsh[f].handleSync = 0;
	return f;
}

fileHandle_t FS_FOpenFileWrite(const char *filename)
{
	char ospath[MAX_OSPATH];

	FS_CheckFileSystemStarted();
	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, filename, ospath);

	if ( fs_debug->current.integer )
		Com_Printf("FS_FOpenFileWrite: %s\n", ospath);

	if ( FS_CreatePath(ospath) )
		return 0;

	return FS_GetHandleAndOpenFile(filename, ospath, "wb", FS_THREAD_MAIN);
}

fileHandle_t FS_FOpenTextFileWrite(const char *filename)
{
	char ospath[MAX_OSPATH];
	FILE *f;
	fileHandle_t h;

	h = 0;
	FS_CheckFileSystemStarted();

	h = FS_HandleForFile(FS_THREAD_MAIN);
	fsh[h].zipFile = qfalse;

	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, filename, ospath);

	if ( fs_debug->current.integer )
		Com_Printf("FS_FOpenFileWrite: %s\n", ospath);

	if ( FS_CreatePath(ospath) )
		return 0;

	f = fopen(ospath, "wt");
	fsh[h].handleFiles.file.o = f;
	I_strncpyz(fsh[h].name, filename, sizeof(fsh[h].name));
	fsh[h].handleSync = qfalse;

	if ( !fsh[h].handleFiles.file.o )
		h = 0;

	return h;
}

fileHandle_t FS_FOpenFileAppend(const char *filename)
{
	char ospath[MAX_OSPATH];
	FILE *f;
	fileHandle_t h;

	h = 0;
	FS_CheckFileSystemStarted();

	h = FS_HandleForFile(FS_THREAD_MAIN);
	fsh[h].zipFile = qfalse;
	I_strncpyz(fsh[h].name, filename, sizeof(fsh[h].name));

	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, filename, ospath);

	if ( fs_debug->current.integer )
		Com_Printf("FS_FOpenFileAppend: %s\n", ospath);

	if ( FS_CreatePath(ospath) )
		return 0;

	f = fopen(ospath, "at");
	fsh[h].handleFiles.file.o = f;
	fsh[h].handleSync = qfalse;

	if ( !fsh[h].handleFiles.file.o )
		h = 0;

	return h;
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




























bool FS_IsBackupSubStr(const char *filenameSubStr)
{
	if ( filenameSubStr[0] == '.' && filenameSubStr[1] == '.' )
		return 1;
	if ( filenameSubStr[0] == ':' && filenameSubStr[1] == ':' )
		return 1;
	return 0;
}

int FS_IsPathSepChar(char c)
{
	switch (c)
	{
	case '/':
	case '\\':
		return 1;
	default:
		return 0;
	}
}

#line 1265
static bool FS_SanitizeFilename(const char *filename, char *sanitizedName, int sanitizedNameSize)
{
	int srcIndex, dstIndex;
	assert(filename);
	assert(sanitizedName);
	assertMsg((sanitizedNameSize > 0), "(sanitizedNameSize) = %i", sanitizedNameSize);
	for ( srcIndex = 0; FS_IsPathSepChar(filename[srcIndex]); ++srcIndex )
		;
	dstIndex = 0;
	while ( filename[srcIndex] )
	{
		if ( FS_IsBackupSubStr(&filename[srcIndex]) )
			return false;

		if ( filename[srcIndex] != '.' || (filename[srcIndex + 1] && !FS_IsPathSepChar(filename[srcIndex + 1])) )
		{



			assertMsg(dstIndex + 1 < sanitizedNameSize, "%s", va("%i + 1 > %i", dstIndex, sanitizedNameSize));
			if ( !FS_IsPathSepChar(filename[srcIndex]) )
				sanitizedName[dstIndex] = filename[srcIndex];
			else
			{
				sanitizedName[dstIndex] = '/';
				while ( FS_IsPathSepChar(filename[srcIndex + 1]) )
					++srcIndex;
			}
			++dstIndex;
		}
		++srcIndex;
	}
	vassert(dstIndex <= srcIndex, "%s", va("%i > %i", dstIndex, srcIndex));
	sanitizedName[dstIndex] = 0;
	return true;
}

bool FS_FilesAreLoadedGlobally(const char *filename)
{
	const char *extensions[8];
	int extensionNum;
	int filenameLen;
	extensions[0] = ".hlsl";
	extensions[1] = ".txt";
	extensions[2] = ".cfg";
	extensions[3] = ".levelshots";
	extensions[4] = ".menu";
	extensions[5] = ".arena";
	extensions[6] = ".str";
	extensions[7] = "";
	filenameLen = strlen(filename);
	for ( extensionNum = 0; *extensions[extensionNum]; ++extensionNum )
	{
		if ( !Q_stricmp(filename + filenameLen - strlen(extensions[extensionNum]), extensions[extensionNum]) )
			return true;
	}
	return false;
}

#line 1106
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

int FS_TouchFile( const char *filename )
{
	fileHandle_t file;

	FS_FOpenFileRead(filename, &file, 0);
	if ( !file )
		return 0;

	FS_FCloseFile(file);
	return 1;
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


















extern "C" __declspec(dllimport) unsigned long __stdcall GetFileAttributesA(const char *lpFileName);
extern "C" __declspec(dllimport) int __stdcall SetFileAttributesA(const char *lpFileName, unsigned long dwFileAttributes);

#line 1723
static int FS_Delete(const char *filename)
{
	char ospath[MAX_OSPATH];

	FS_CheckFileSystemStarted();


	assert(filename);
	if ( !*filename )
		return 0;

	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, filename, ospath);

	if ( remove(ospath) != -1 )
		return 1;

	return 0;
}

#line 1759
qboolean FS_SetWritable( const char *filename, int writable )
{
	char ospath[MAX_OSPATH];
	unsigned long dwFileAttributes;
	unsigned long newAttributes;

	FS_CheckFileSystemStarted();
	assert(filename && filename[0]);
	FS_BuildOSPath(fs_homepath->current.string, fs_gamedir, filename, ospath);

	dwFileAttributes = GetFileAttributesA(ospath);
	if ( !writable )
		newAttributes = dwFileAttributes & ~1u;
	else
		newAttributes = dwFileAttributes | 1u;

	if ( newAttributes == dwFileAttributes )
		return qfalse;

	SetFileAttributesA(ospath, newAttributes);
	return qtrue;
}

#line 1182
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

void FS_Printf(fileHandle_t h, const char *fmt, ...)
{
	va_list argptr;
	char msg[4096];

	va_start(argptr, fmt);
	_vsnprintf(msg, sizeof(msg), fmt, argptr);
	va_end(argptr);

	FS_Write(msg, strlen(msg), h);
}

/*
==============
FS_SeekInternal
==============
*/
int FS_SeekInternal( int f, int offset, int origin )
{
	int iZipPos;
	int iZipOffset;
	FILE *file;

	FS_CheckFileSystemStarted();

	if ( fsh[f].zipFile )
	{
		if ( offset == 0 && origin == FS_SEEK_SET )
		{
			unzSetCurrentFileInfoPosition(fsh[f].handleFiles.file.z, fsh[f].zipFilePos);
			return unzOpenCurrentFile(fsh[f].handleFiles.file.z);
		}

		if ( offset == 0 && origin == FS_SEEK_CUR )
		{
			return 0;
		}

		iZipPos = unztell(fsh[f].handleFiles.file.z);

		if ( origin == FS_SEEK_CUR )
		{
#line 1985
			assert(offset != 0);
			if ( offset < 0 )
			{
				unzSetCurrentFileInfoPosition(fsh[f].handleFiles.file.z, fsh[f].zipFilePos);
				unzOpenCurrentFile(fsh[f].handleFiles.file.z);
				iZipOffset = iZipPos + offset;
			}
			else
			{
				iZipOffset = offset;
			}
		}
		else if ( origin == FS_SEEK_END )
		{
			if ( FS_filelength(f) + offset < iZipPos )
			{
				unzSetCurrentFileInfoPosition(fsh[f].handleFiles.file.z, fsh[f].zipFilePos);
				unzOpenCurrentFile(fsh[f].handleFiles.file.z);
				iZipOffset = FS_filelength(f) + offset;
			}
			else
			{
				iZipOffset = FS_filelength(f) + offset - iZipPos;
			}
		}
		else if ( origin == FS_SEEK_SET )
		{
			if ( offset < iZipPos )
			{
				unzSetCurrentFileInfoPosition(fsh[f].handleFiles.file.z, fsh[f].zipFilePos);
				unzOpenCurrentFile(fsh[f].handleFiles.file.z);
				iZipOffset = offset;
			}
			else
			{
				iZipOffset = offset - iZipPos;
			}
		}
		else
		{
#line 2029
			assertFail(0, "Bad origin %i in FS_Seek", origin);
			return -1;
		}

		if ( !unzReadCurrentFile(fsh[f].handleFiles.file.z, NULL, iZipOffset) )
			return -1;

		return 0;
	}

	file = FS_FileForHandle(f);

	switch ( origin )
	{
	case FS_SEEK_CUR:
		return FileWrapper_Seek(file, offset, SEEK_CUR);
	case FS_SEEK_END:
		return FileWrapper_Seek(file, offset, SEEK_END);
	case FS_SEEK_SET:
		return FileWrapper_Seek(file, offset, SEEK_SET);
	default:
#line 2060
		assertFail(0, "Bad origin %i in FS_Seek", origin);
		return 0;
	}
}

int FS_ReadFile(const char* qpath, void** buffer)
{
	fileHandle_t h;
	char* buf;
	int len;

	FS_CheckFileSystemStarted();

	if ( !qpath || !qpath[0] )
		Com_Error(ERR_FATAL, "FS_ReadFile with empty name\n");

	buf = NULL;
	len = FS_FOpenFileRead(qpath, &h, 0);

	if ( h == 0 )
	{
		if ( buffer )
			*buffer = NULL;
		return -1;
	}

	if ( !buffer )
	{
		FS_FCloseFile(h);
		return len;
	}

	++fs_loadStack;
	buf = (char *)Hunk_AllocateTempMemory(len + 1);
	*buffer = buf;

	FS_Read(buf, len, h);
	buf[len] = 0;

	FS_FCloseFile(h);
	return len;
}

#line 1360
void FS_ResetFiles()
{
	fs_loadStack = 0;
}
























































































































































































































































































































































































































































































































































































































































































































































































































#line 2157
void FS_FreeFile(void* buffer)
{
	FS_CheckFileSystemStarted();
	assert(buffer);
	--fs_loadStack;
	Hunk_FreeTempMemory(buffer);
}

#line 2177
int FS_WriteFile(const char* qpath, const void* buffer, int size)
{
	fileHandle_t f;
	int actualSize;

	FS_CheckFileSystemStarted();

	assert(qpath);
	assert(buffer);

	f = FS_FOpenFileWrite(qpath);
	if (!f)
	{
		Com_Printf("Failed to open %s\n", qpath);
		return 0;
	}

	actualSize = FS_Write(buffer, size, f);
	FS_FCloseFile(f);

	if (actualSize == size)
	{
		return 1;
	}

	FS_Delete(qpath);
	return 0;
}

/*
==============
FS_GetOSPath
==============
*/
#line 2213
int FS_GetOSPath( const char *filename, char *ospath )
{
	char sanitizedName[MAX_OSPATH];
	searchpath_t *search;
	directory_t *dir;
	FILE *f;

	assert(filename);
	assert(ospath);
	if ( !FS_SanitizeFilename(filename, sanitizedName, sizeof(sanitizedName)) )
		return -1;

	for ( search = fs_searchpaths; search; search = search->next )
	{
		if ( !FS_UseSearchPath(search) )
			continue;
		if ( search->iwd )
			continue;
		dir = search->dir;
		FS_BuildOSPath(dir->path, dir->gamedir, sanitizedName, ospath);
		f = fopen(ospath, "rb");
		if ( !f )
			continue;
		fclose(f);
		return 0;
	}

	return -1;
}

/*
==============
FS_OpenFileForWrite
==============
*/
#line 2252
int FS_OpenFileForWrite( const char *qpath )
{
	char ospath[MAX_OSPATH];
	unsigned long dwFileAttributes;
	unsigned long newAttributes;

	FS_CheckFileSystemStarted();
	assert(qpath);

	if ( FS_GetOSPath(qpath, ospath) < 0 )
	{
		Com_Error(ERR_DROP, "FS_FOpenFileOverWrite: Failed to open %s for writing.  It either does not exist or is in a iwd file.", qpath);
		return 0;
	}

	if ( fs_debug->current.integer )
		Com_Printf("FS_FOpenFileOverWrite: %s\n", ospath);

	dwFileAttributes = GetFileAttributesA(ospath);
	newAttributes = dwFileAttributes & ~1u;
	if ( newAttributes != dwFileAttributes )
		SetFileAttributesA(ospath, newAttributes);

	return FS_GetHandleAndOpenFile(qpath, ospath, "wb", FS_THREAD_MAIN);
}

static int FS_ReturnPath( const char *zname, char *zpath, int *depth )
{
	int len, at, newdep;

	newdep = 0;
	zpath[0] = 0;
	len = 0;
	at = 0;

	while ( zname[at] != 0 )
	{
		if ( zname[at] == '/' || zname[at] == '\\' )
		{
			len = at;
			newdep++;
		}
		at++;
	}
	strcpy( zpath, zname );
	zpath[len] = 0;
	if ( len + 1 == at )
		--newdep;
	*depth = newdep;

	return len;
}

// allocType is unused
static int FS_AddFileToList( char *name, char *list[MAX_FOUND_FILES], int nfiles, int allocType )
{
	int i;

	if ( nfiles == MAX_FOUND_FILES - 1 )
	{
		return nfiles;
	}
	for ( i = 0 ; i < nfiles ; i++ )
	{
		if ( !Q_stricmp( name, list[i] ) )
		{
			return nfiles;      // allready in list
		}
	}
	list[nfiles] = CopyString( name );
	nfiles++;

	return nfiles;
}





















/*
===============
FS_ListFilteredFiles

Returns a uniqued list of files that match the given criteria
from all search paths
===============
*/
char **FS_ListFilteredFiles(searchpath_t *searchPath, const char *path, const char *extension, const char *filter, FsListBehavior behavior, int *numfiles, int allocType)
{
	int nfiles;
	char            **listCopy;
	char            *list[MAX_FOUND_FILES];
	searchpath_t    *search;
	int i;
	int pathLength;
	int extensionLength;
	int length, pathDepth, temp;
	iwd_t           *iwd;
	fileInIwd_t     *buildBuffer;
	char zpath[MAX_ZPATH];
	char sanitizedPath[MAX_OSPATH];
	bool isDirSearch;

	FS_CheckFileSystemStarted();

	if ( !path )
	{
		*numfiles = 0;
		return NULL;
	}

	if ( !extension )
	{
		extension = "";
	}

	if ( !FS_SanitizeFilename(path, sanitizedPath, sizeof(sanitizedPath)) )
	{
		*numfiles = 0;
		return NULL;
	}

	isDirSearch = I_stricmp(extension, "/") == 0;
	pathLength = strlen( sanitizedPath );
	if ( pathLength && (sanitizedPath[pathLength - 1] == '\\' || sanitizedPath[pathLength - 1] == '/' ) )
	{
		pathLength--;
	}
	extensionLength = strlen( extension );
	nfiles = 0;
	FS_ReturnPath( sanitizedPath, zpath, &pathDepth );
	if ( sanitizedPath[0] )
		++pathDepth;

	//
	// search through the path, one element at a time, adding to list
	//
	for ( search = searchPath ; search ; search = search->next )
	{
		if ( !FS_UseSearchPath(search) )
		{
			continue;
		}

		// is the element a pak file?
		if ( search->iwd )
		{
			iwd = search->iwd;
			buildBuffer = iwd->buildBuffer;
			for ( i = 0; i < iwd->numFiles; i++ )
			{
				char    *name;
				int zpathLen, depth;
				char szTrimmedName[MAX_QPATH];

				// check for directory match
				name = buildBuffer[i].name;
				//
				if ( filter )
				{
					// case insensitive
					if ( !Com_FilterPath( filter, name, qfalse ) )
					{
						continue;
					}
					// unique the match
					nfiles = FS_AddFileToList( name, list, nfiles, allocType );
				}
				else
				{
					zpathLen = FS_ReturnPath( name, zpath, &depth );

					if ( depth != pathDepth || pathLength > zpathLen || (pathLength > 0 && name[pathLength] != '/') || I_strnicmp(name, sanitizedPath, pathLength) )
					{
						continue;
					}

					// check for extension match
					if ( isDirSearch )
					{
#line 2589
						iassert(extensionLength == 1);
						iassert(extension[0] == '/' && extension[1] == '\0');
						if ( name[strlen( name ) - 1] != '/' )
						{
							continue;
						}
					}
					else if ( extensionLength )
					{
						// unique the match
						length = strlen( name );
						if ( length <= extensionLength )
						{
							continue;
						}
						if ( name[length - extensionLength - 1] != '.' )
						{
							continue;
						}
						if ( I_stricmp( name + length - extensionLength, extension ) )
						{
							continue;
						}
					}

					temp = pathLength;
					if ( pathLength )
					{
						temp++;     // include the '/'
					}

					if ( isDirSearch )
					{
						strcpy(szTrimmedName, &name[temp]);
						szTrimmedName[strlen(szTrimmedName) - 1] = '\0';
						nfiles = FS_AddFileToList(szTrimmedName, list, nfiles, allocType);
					}
					else
					{
						nfiles = FS_AddFileToList( name + temp, list, nfiles, allocType );
					}
				}
			}
		}
		else if ( search->dir )     // scan for files in the filesystem
		{
			int numSysFiles;
			char    **sysFiles;
			char    *name;
			char netpath[MAX_OSPATH];

			FS_BuildOSPath(search->dir->path, search->dir->gamedir, sanitizedPath, netpath);
			sysFiles = Sys_ListFiles( netpath, extension, filter, &numSysFiles, isDirSearch );
			for ( i = 0 ; i < numSysFiles ; i++ )
			{
				// unique the match
				name = sysFiles[i];
				nfiles = FS_AddFileToList( name, list, nfiles, allocType );
			}
			Sys_FreeFileList( sysFiles );
		}
	}

	// return a copy of the list
	*numfiles = nfiles;

	if ( !nfiles )
	{
		return NULL;
	}

	listCopy = (char **)Z_Malloc( ( nfiles + 1 ) * sizeof( *listCopy ) );
	for ( i = 0 ; i < nfiles ; i++ )
	{
		listCopy[i] = list[i];
	}
	listCopy[i] = NULL;

	return listCopy;
}

















































































































































































char** FS_ListFiles(const char* path, const char* extension, FsListBehavior behavior, int* numfiles, int allocType)
{
	return FS_ListFilteredFiles(fs_searchpaths, path, extension, 0, behavior, numfiles, allocType);
}

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
#line 2741
char **FS_ListFilteredFilesOfDirType( const char *path, const char *extension, const char *filter, FsListBehavior behavior, int *numfiles, int dirTypes, int flags )
{
	char **fileList;
	searchpath_t *sp;
	searchpath_t *filteredHead;
	searchpath_t *filteredTail;
	const char *pathDir;

	filteredHead = NULL;
	filteredTail = NULL;

	for ( sp = fs_searchpaths; sp; sp = sp->next )
	{
		if ( sp->dir )
			pathDir = sp->dir->gamedir;
		else if ( sp->iwd )
			pathDir = sp->iwd->iwdGamename;
		else
			pathDir = NULL;

		assert(pathDir);
		if ( !FS_IsBaseGameDirOfType(pathDir, dirTypes) )
			continue;

		if ( filteredHead )
		{
			filteredTail->next = (searchpath_t *)Z_Malloc(sizeof(searchpath_t));
			filteredTail = filteredTail->next;
		}
		else
		{
			filteredHead = (searchpath_t *)Z_Malloc(sizeof(searchpath_t));
			filteredTail = filteredHead;
		}

		filteredTail->next = NULL;
		filteredTail->dir = sp->dir;
		filteredTail->language = sp->language;
		filteredTail->localized = sp->localized;
		filteredTail->iwd = sp->iwd;
	}

	fileList = FS_ListFilteredFiles(filteredHead, path, extension, filter, behavior, numfiles, flags);

	while ( filteredHead )
	{
		filteredTail = filteredHead->next;
		Z_Free(filteredHead);
		filteredHead = filteredTail;
	}

	return fileList;
}

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

int FS_GetFileList(const char *path, const char *extension, FsListBehavior behavior, char *listbuf, int bufsize)
{
	int fileCount;
	int i;
	int nTotal;
	int nLen;
	char** fileNames;

	*listbuf = 0;
	fileCount = 0;
	nTotal = 0;

	fileNames = FS_ListFiles(path, extension, behavior, &fileCount, 3);
	for (i = 0; i < fileCount; ++i)
	{
		nLen = strlen(fileNames[i]) + 1;
		if (nTotal + nLen + 1 < bufsize)
		{
			strcpy(listbuf, fileNames[i]);
			listbuf += nLen;
			nTotal += nLen;
		}
		else
		{
			fileCount = i;
			break;
		}
	}

	FS_FreeFileList(fileNames, 3);
	return fileCount;
}

#line 2539
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

static const char* IwdFileLanguage(const char *instr)
{
	signed int i;
	static char Array64[128];
	static qboolean flip;

	flip ^= 1u;
	if ( strlen(instr) < 10 )
	{
		Array64[64 * flip] = 0;
	}
	else
	{
		i = 10;
		memset(&Array64[64 * flip], 0, 64);
		for(; i < 64 && instr[i] != '\0' && isalpha(instr[i]) != '\0'; i++)
		{
			Array64[(64 * flip) + i - 10] = instr[i];
		}
	}

	return &Array64[64 * flip];
}

signed int iwdsort(const void *cmp1_arg, const void *cmp2_arg)
{
	const char *cmp1;
	const char *cmp2;
	const char *lang1;
	const char *lang2;

	cmp1 = *(const char**)cmp1_arg;
	cmp2 = *(const char**)cmp2_arg;

	if ( !I_strncmp(cmp1, "          ", 10) )
	{
		if ( !I_strncmp(cmp2, "          ", 10) )
		{
			lang1 = IwdFileLanguage(cmp1);
			lang2 = IwdFileLanguage(cmp2);

			if ( !I_stricmp(lang1, "english") )
			{
				if ( I_stricmp(lang2, "english") )
				{
					return -1;
				}
			}
			else
			{
				if ( !I_stricmp(lang2, "english") )
				{
					return 1;
				}
			}
		}
	}

	return FS_PathCmp(cmp1, cmp2);
}

void FS_AddSearchPath(searchpath_t* search)
{
	searchpath_t** pSearch;

	pSearch = &fs_searchpaths;
	if (search->localized)
	{
		while (*pSearch && !(*pSearch)->localized)
		{
			pSearch = (searchpath_t**)*pSearch;
		}
	}
	search->next = *pSearch;
	*pSearch = search;
}

static void FS_AddIwdFilesForGameDirectory( const char *path, const char *dir )
{
	char iwdfile[MAX_OSPATH];
	char **iwdfiles;
	int numfiles;
	int i;
	char *sorted[MAX_IWDFILES];
	qboolean islocalized;
	const char *language;
	int langindex;
	iwd_t *iwd;
	searchpath_t *search;

	FS_BuildOSPath(path, dir, "", iwdfile);
	iwdfile[strlen(iwdfile) - 1] = 0;
	iwdfiles = Sys_ListFiles(iwdfile, "iwd", 0, &numfiles, 0);

	if ( numfiles > MAX_IWDFILES )
	{
		Com_Printf("WARNING: Exceeded max number of iwd files in %s/%s (%1/%1)\n", path, dir, numfiles, MAX_IWDFILES);
		numfiles = MAX_IWDFILES;
	}

	for ( i = 0; i < numfiles; i++ )
	{
		sorted[i] = iwdfiles[i];

		if ( !I_strncmp(sorted[i], "localized_", 10) )
		{
			memcpy(sorted[i], "          ", 10);
		}
	}

	qsort(sorted, numfiles, sizeof(char *), iwdsort);

	for ( i = 0; i < numfiles; i++ )
	{
		if ( !I_strncmp(sorted[i], "          ", 10) )
		{
			memcpy(sorted[i], "localized_", 10);
			islocalized = qtrue;
			language = IwdFileLanguage(sorted[i]);

			if ( !language[0] )
			{
				Com_Printf("WARNING: Localized assets iwd file %s/%s/%s has invalid name (no language specified). Proper naming convention is: localized_[language]_iwd#.iwd\n", path, dir, sorted[i]);
				continue;
			}

			if ( I_stricmp(language, "english") )
				continue;

			langindex = 0;
		}
		else
		{
			islocalized = qfalse;
			langindex = 0;
		}

		FS_BuildOSPath(path, dir, sorted[i], iwdfile);
		iwd = FS_LoadZipFile(iwdfile, sorted[i]);

		if ( !iwd )
		{
			continue;
		}

		strcpy(iwd->iwdGamename, dir);

		search = (searchpath_t *)S_Malloc(sizeof(searchpath_t));
		search->iwd = iwd;
		search->localized = islocalized;
		search->language = langindex;
		FS_AddSearchPath(search);
	}

	Sys_FreeFileList(iwdfiles);
}

static void FS_AddGameDirectoryInternal(const char *path, const char *dir, int bLanguageDirectory, int iLanguage)
{
	char szGameFolder[MAX_QPATH];
	const char *pszLanguage;
	searchpath_t *i;
	searchpath_t *search;
	char ospath[MAX_OSPATH];

	if (bLanguageDirectory)
	{
		pszLanguage = "english";
		Com_sprintf(szGameFolder, sizeof(szGameFolder), "%s/%s", dir, pszLanguage);
	}
	else
	{
		I_strncpyz(szGameFolder, dir, sizeof(szGameFolder));
	}

	for (i = fs_searchpaths; i; i = i->next)
	{
		if (i->dir && !I_stricmp(i->dir->path, path) && !I_stricmp(i->dir->gamedir, szGameFolder))
		{
			if (i->localized != bLanguageDirectory)
			{
				Com_Printf(
					"WARNING: game folder %s/%s added as both localized & non-localized. Using folder as %s\n",
					path, szGameFolder, i->localized ? "localized" : "non-localized");
			}

			if (i->localized)
			{
				if (i->language != iLanguage)
				{
					Com_Printf(
						"WARNING: game golder %s/%s re-added as localized folder with different language\n",
						path, szGameFolder);
				}
			}
			return;
		}
	}

	if (bLanguageDirectory)
	{
		FS_BuildOSPath(path, szGameFolder, "", ospath);
		ospath[strlen(ospath) - 1] = 0;
		if (!Sys_DirectoryHasContents(ospath))
		{
			return;
		}
	}
	else
	{
		I_strncpyz(fs_gamedir, szGameFolder, sizeof(fs_gamedir));
	}

	search = (searchpath_t *)Z_Malloc(sizeof(searchpath_t));
	search->dir = (directory_t *)Z_Malloc(sizeof(*search->dir));

	I_strncpyz(search->dir->path, path, sizeof(search->dir->path));
	I_strncpyz(search->dir->gamedir, szGameFolder, sizeof(search->dir->gamedir));

#line 3348
	assert(bLanguageDirectory || (!bLanguageDirectory && !iLanguage));
	search->localized = bLanguageDirectory;
	search->language = iLanguage;

	FS_AddSearchPath(search);
	FS_AddIwdFilesForGameDirectory(path, szGameFolder);
}

void FS_AddGameDirectory(const char *path, const char *dir)
{
	FS_AddGameDirectoryInternal(path, dir, qtrue, 0);
	FS_AddGameDirectoryInternal(path, dir, qfalse, 0);
}

static void FS_ShutdownSearchPaths(searchpath_t *p)
{
	searchpath_t *next;

	while (p)
	{
		next = p->next;
		if (p->iwd)
		{
			unzClose(p->iwd->handle);
			Z_Free(p->iwd->buildBuffer);
			Z_Free(p->iwd);
		}
		if (p->dir)
		{
			Z_Free(p->dir);
		}
		Z_Free(p);
		p = next;
	}
}




















































































































































































































// closemfp is unused
void FS_Shutdown( int closemfp )
{
	int i;

	for (i = 1; i < MAX_FILE_HANDLES; ++i)
	{
		if (fsh[i].fileSize)
		{
			FS_FCloseFile(i);
		}
	}

	FS_ShutdownSearchPaths(fs_searchpaths);
	fs_searchpaths = NULL;
}

static bool FS_RegisterDvars()
{
	fs_debug = Dvar_RegisterInt("fs_debug", 0, 0, 2, DVAR_CHANGEABLE_RESET);
	fs_copyfiles = Dvar_RegisterBool("fs_copyfiles", false, DVAR_INIT | DVAR_CHANGEABLE_RESET);
	fs_cdpath = Dvar_RegisterString("fs_cdpath", "", DVAR_INIT | DVAR_CHANGEABLE_RESET);
	fs_basepath = Dvar_RegisterString("fs_basepath", Sys_DefaultInstallPath(), DVAR_INIT | DVAR_CHANGEABLE_RESET);
	fs_basegame = Dvar_RegisterString("fs_basegame", "", DVAR_INIT | DVAR_CHANGEABLE_RESET);
	fs_useOldAssets = Dvar_RegisterBool("fs_useOldAssets", false, DVAR_CHANGEABLE_RESET);
	fs_gameDirVar = Dvar_RegisterString("fs_game", "", DVAR_SERVERINFO | DVAR_SYSTEMINFO | DVAR_INIT | DVAR_CHANGEABLE_RESET);
	fs_ignoreLocalized = Dvar_RegisterBool("fs_ignoreLocalized", false, DVAR_LATCH | DVAR_CHEAT | DVAR_CHANGEABLE_RESET);
	fs_homepath = Dvar_RegisterString("fs_homepath", fs_basepath->current.string, DVAR_INIT | DVAR_CHANGEABLE_RESET);

	return true;
}

void FS_Startup(const char *gameName)
{
	Com_Printf("----- FS_Startup -----\n");
	FS_RegisterDvars();

	if ( fs_useOldAssets->current.boolean )
	{
		if ( fs_basepath->current.string[0] )
			FS_AddGameDirectory(fs_basepath->current.string, "tempcod");
		if ( fs_homepath->current.string[0] )
			FS_AddGameDirectory(fs_homepath->current.string, "tempcod");
	}

	if ( fs_basepath->current.string[0] )
	{
		FS_AddGameDirectory(fs_basepath->current.string, "devraw_shared");
		FS_AddGameDirectory(fs_basepath->current.string, "devraw");
		FS_AddGameDirectory(fs_basepath->current.string, "raw_shared");
		FS_AddGameDirectory(fs_basepath->current.string, "raw");
	}

	if ( fs_homepath->current.string[0] )
	{
		FS_AddGameDirectory(fs_homepath->current.string, "devraw_shared");
		FS_AddGameDirectory(fs_homepath->current.string, "devraw");
		FS_AddGameDirectory(fs_homepath->current.string, "raw_shared");
		FS_AddGameDirectory(fs_homepath->current.string, "raw");
	}

	if ( fs_cdpath->current.string[0] )
	{
		FS_AddGameDirectory(fs_cdpath->current.string, "devraw_shared");
		FS_AddGameDirectory(fs_cdpath->current.string, "devraw");
		FS_AddGameDirectory(fs_cdpath->current.string, "raw_shared");
		FS_AddGameDirectory(fs_cdpath->current.string, "raw");
		FS_AddGameDirectory(fs_cdpath->current.string, gameName);
	}

	if ( fs_basepath->current.string[0] )
		FS_AddGameDirectory(fs_basepath->current.string, gameName);
	if ( fs_basepath->current.string[0] && I_stricmp(fs_homepath->current.string, fs_basepath->current.string) )
		FS_AddGameDirectory(fs_homepath->current.string, gameName);

	if ( fs_basegame->current.string[0] && !I_stricmp(gameName, BASEGAME) && I_stricmp(fs_basegame->current.string, gameName) )
	{
		if ( fs_cdpath->current.string[0] )
			FS_AddGameDirectory(fs_cdpath->current.string, fs_basegame->current.string);
		if ( fs_basepath->current.string[0] )
			FS_AddGameDirectory(fs_basepath->current.string, fs_basegame->current.string);
		if ( fs_homepath->current.string[0] && I_stricmp(fs_homepath->current.string, fs_basepath->current.string) )
			FS_AddGameDirectory(fs_homepath->current.string, fs_basegame->current.string);
	}

	if ( fs_gameDirVar->current.string[0] && !I_stricmp(gameName, BASEGAME) && I_stricmp(fs_gameDirVar->current.string, gameName) )
	{
		if ( fs_cdpath->current.string[0] )
			FS_AddGameDirectory(fs_cdpath->current.string, fs_gameDirVar->current.string);
		if ( fs_basepath->current.string[0] )
			FS_AddGameDirectory(fs_basepath->current.string, fs_gameDirVar->current.string);
		if ( fs_homepath->current.string[0] && I_stricmp(fs_homepath->current.string, fs_basepath->current.string) )
			FS_AddGameDirectory(fs_homepath->current.string, fs_gameDirVar->current.string);
	}

	FS_DisplayPath(0);
	Dvar_ClearModified(fs_gameDirVar);
	Com_Printf("----------------------\n");
	Com_Printf("%d files in iwd files\n", fs_packFiles);
}




















































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

static const char *FS_HasDefaultConfig()
{
	if ( FS_ReadFile("default_localize.cfg", NULL) > 0 )
		return "default_localize.cfg";
	if ( FS_ReadFile("default.cfg", NULL) > 0 )
		return "default.cfg";
	return NULL;
}

bool FS_DefaultConfigExists()
{
	return FS_HasDefaultConfig() != NULL;
}

void FS_InitFilesystem()
{
	FS_Startup(BASEGAME);

	default_config = FS_HasDefaultConfig();
	if ( !default_config )
	{
		Com_Error(ERR_FATAL, "Couldn't load %s.  Make sure Call of Duty is run from the correct folder.", "default_localize.cfg");
	}

	I_strncpyz(lastValidBase, fs_basepath->current.string, sizeof(lastValidBase));
	I_strncpyz(lastValidGame, fs_gameDirVar->current.string, sizeof(lastValidGame));
}

void FS_Restart(int checksumFeed)
{
	FS_Shutdown(0);
	FS_ClearIwdReferences();
	FS_Startup(BASEGAME);

#line 3901
	assert(default_config);
	if ( FS_ReadFile(default_config, NULL) <= 0 )
	{
		if ( lastValidBase[0] )
		{
			Dvar_SetString(fs_basepath, lastValidBase);
			Dvar_SetString(fs_gameDirVar, lastValidGame);
			lastValidBase[0] = '\0';
			lastValidGame[0] = '\0';
			FS_Restart(checksumFeed);
			Com_Error(ERR_DROP, "Invalid game folder\n");
		}
		Com_Error(ERR_FATAL, "Couldn't load %s.  Make sure Call of Duty is run from the correct folder.", default_config);
	}

	I_strncpyz(lastValidBase, fs_basepath->current.string, sizeof(lastValidBase));
	I_strncpyz(lastValidGame, fs_gameDirVar->current.string, sizeof(lastValidGame));
}

/*
==============
FS_ConditionalRestart
==============
*/
int FS_ConditionalRestart( int checksumFeed )
{
	if ( fs_gameDirVar->modified )
	{
		FS_Restart(checksumFeed);
		return 1;
	}

	return 0;
}

int FS_FOpenFileByMode( const char *qpath, fileHandle_t *f, fsMode_t mode )
{
	int r = 6969;
	qboolean sync;

	sync = qfalse;

	switch ( mode )
	{
	case FS_READ:
		r = FS_FOpenFileRead( qpath, f, qtrue );
		break;
	case FS_WRITE:
		*f = FS_FOpenFileWrite( qpath );
		r = 0;
		if ( *f == 0 )
		{
			r = -1;
		}
		break;
	case FS_APPEND_SYNC:
		sync = qtrue;
	case FS_APPEND:
		*f = FS_FOpenFileAppend( qpath );
		r = 0;
		if ( *f == 0 )
		{
			r = -1;
		}
		break;
	default:
		Com_Error( ERR_FATAL, "FSH_FOpenFile: bad mode" );
		break;
	}

	if ( !f )
	{
		return r;
	}

	if ( *f )
	{
		fsh[*f].fileSize = r;
		fsh[*f].streamed = qfalse;
	}

	fsh[*f].handleSync = sync;

	return r;
}

/*
==============
FS_FTell
==============
*/
int FS_FTell( int f )
{
	int pos;

	if ( fsh[f].zipFile )
		pos = unztell(fsh[f].handleFiles.file.z);
	else
		pos = ftell(FS_FileForHandle(f));

	return pos;
}







































































void FS_Flush(fileHandle_t f)
{
	fflush(FS_FileForHandle(f));
}











































































































































































































































































































































































































































































































































































































































































































































































































































































































































/*
==============
GetBspExtension
==============
*/
#line 4095
const char *GetBspExtension()
{
	const char *gfx = Dvar_GetString("gfx_driver");

	assert(gfx);
	if ( *gfx )
		return va("%sbsp", gfx);

	return va("d3dbsp");
}
