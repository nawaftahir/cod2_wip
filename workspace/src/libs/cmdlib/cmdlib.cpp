// cmdlib.cpp: Q3Radiant libs/cmdlib/cmdlib.cpp + common/cmdlib.c

#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
// defer errno.h: flags.tsv omits /MT, so <errno.h> errno pulls libc.lib(crt0dat.obj) vs libcmt.lib
#include <ctype.h>
#include <time.h>
#include <stdarg.h>
#include <direct.h>

char *va(const char *format, ...);
int I_strnicmp(const char *s0, const char *s1, int n);
#include "../../src/universal/assertive.h"

#define MEM_BLOCKSIZE 4096
#define PATHSEPERATOR '/'

typedef void (*PFN_ERR)(const char *pFormat, va_list argptr);
typedef void (*PFN_PRINTF)(const char *pFormat, va_list argptr);
typedef void (*PFN_ERR_NUM)(int nErr, const char *pFormat, va_list argptr);
typedef void (*PFN_PRINTF_NUM)(int nErr, const char *pFormat, va_list argptr);

static PFN_ERR g_pfnError = NULL;
static PFN_PRINTF g_pfnPrintf = NULL;
static PFN_ERR_NUM g_pfnErrorNum = NULL;
static PFN_PRINTF_NUM g_pfnPrintfNum = NULL;

void Error(const char *pFormat, ...)
{
	if (g_pfnError)
	{
		va_list arg_ptr;
		va_start(arg_ptr, pFormat);
		g_pfnError(pFormat, arg_ptr);
		va_end(arg_ptr);
	}
}

void Printf(const char *pFormat, ...)
{
	if (g_pfnPrintf)
	{
		va_list arg_ptr;
		va_start(arg_ptr, pFormat);
		g_pfnPrintf(pFormat, arg_ptr);
		va_end(arg_ptr);
	}
}

void ErrorNum(int nErr, const char *pFormat, ...)
{
	if (g_pfnErrorNum)
	{
		va_list arg_ptr;
		va_start(arg_ptr, pFormat);
		g_pfnErrorNum(nErr, pFormat, arg_ptr);
		va_end(arg_ptr);
	}
}

void PrintfNum(int nErr, const char *pFormat, ...)
{
	if (g_pfnPrintfNum)
	{
		va_list arg_ptr;
		va_start(arg_ptr, pFormat);
		g_pfnPrintfNum(nErr, pFormat, arg_ptr);
		va_end(arg_ptr);
	}
}

void SetErrorHandler(PFN_ERR pe)
{
	g_pfnError = pe;
}

void SetPrintfHandler(PFN_PRINTF pe)
{
	g_pfnPrintf = pe;
}

void SetErrorHandlerNum(PFN_ERR_NUM pe)
{
	g_pfnErrorNum = pe;
}

void SetPrintfHandler(PFN_PRINTF_NUM pe)
{
	g_pfnPrintfNum = pe;
}

void *qblockmalloc(int nSize)
{
	void *b;
	int nAllocSize = nSize % MEM_BLOCKSIZE;
	if (nAllocSize > 0)
	{
		nSize += MEM_BLOCKSIZE - nAllocSize;
	}
	b = malloc(nSize);
	memset(b, 0, nSize);
	return b;
}

void *qmalloc(size_t nSize)
{
	void *b;
	b = malloc(nSize + 1);
	memset(b, 0, nSize);
	return b;
}

int Q_filelength(FILE *f)
{
	int pos;
	int end;

	pos = ftell(f);
	fseek(f, 0, SEEK_END);
	end = ftell(f);
	fseek(f, pos, SEEK_SET);

	return end;
}

// DEFERRED (0x00408190, 0x004081d0): SafeOpenWrite / SafeOpenRead use strerror(errno); flags.tsv omits /MT (libc.lib crt0dat.obj conflict)
#if 0
FILE *SafeOpenWrite(const char *filename)
{
	FILE *f;

	f = fopen(filename, "wb");

	if (!f)
		Error("Error opening %s: %s", filename, strerror(errno));

	return f;
}

FILE *SafeOpenRead(const char *filename)
{
	FILE *f;

	f = fopen(filename, "rb");

	if (!f)
		Error("Error opening %s: %s", filename, strerror(errno));

	return f;
}
#endif

void SafeRead(FILE *f, void *buffer, int count)
{
	int read;
#line 171
	assertMsg(count > 0, "(count) = %i", count);
	read = fread(buffer, 1, count, f);
	if (read != count)
		Error("File read failure - read %i of %i bytes", read, count);
}

void SafeWrite(FILE *f, const void *buffer, int count)
{
	int wrote;
#line 182
	assertMsg(count >= 0, "(count) = %i", count);
	wrote = fwrite(buffer, 1, count, f);
	if (wrote != count)
		Error("File write failure - wrote %i of %i bytes", wrote, count);
}

int LoadFile(const char *filename, void **bufferptr)
{
	FILE *f;
	int length;
	void *buffer;

	*bufferptr = NULL;

	if (filename == NULL || strlen(filename) == 0)
		return -1;

	f = fopen(filename, "rb");
	if (!f)
		return -1;
	length = Q_filelength(f);
	buffer = qblockmalloc(length + 1);
	((char *)buffer)[length] = 0;
	SafeRead(f, buffer, length);
	fclose(f);

	*bufferptr = buffer;
	return length;
}

int LoadFileNoCrash(const char *filename, void **bufferptr)
{
	FILE *f;
	int length;
	void *buffer;

	f = fopen(filename, "rb");
	if (!f)
		return -1;
	length = Q_filelength(f);
	buffer = qmalloc(length + 1);
	((char *)buffer)[length] = 0;
	SafeRead(f, buffer, length);
	fclose(f);

	*bufferptr = buffer;
	return length;
}

// DEFERRED (0x00408440): SaveFile calls SafeOpenWrite (uses strerror(errno); flags.tsv omits /MT)
#if 0
void SaveFile(const char *filename, void *buffer, int count)
{
	FILE *f;

	f = SafeOpenWrite(filename);
	SafeWrite(f, buffer, count);
	fclose(f);
}
#endif

void DefaultExtension(char *path, const char *extension)
{
	char *src;

	src = path + strlen(path) - 1;

	while (*src != PATHSEPERATOR && src != path)
	{
		if (*src == '.')
			return;
		src--;
	}

	strcat(path, extension);
}

void DefaultPath(char *path, char *basepath)
{
	char temp[128];

	if (path[0] == PATHSEPERATOR)
		return;
	strcpy(temp, path);
	strcpy(path, basepath);
	strcat(path, temp);
}

void StripFilename(char *path)
{
	int length;

	length = strlen(path) - 1;
	while (length > 0 && path[length] != PATHSEPERATOR)
		length--;
	path[length] = 0;
}

void StripExtension(char *path)
{
	int length;

	length = strlen(path) - 1;
	while (length > 0 && path[length] != '.')
	{
		length--;
		if (path[length] == '/')
			return;
	}
	if (length)
		path[length] = 0;
}

void ExtractFilePath(const char *path, char *dest)
{
	const char *src;

	src = path + strlen(path) - 1;

	while (src != path && *(src - 1) != PATHSEPERATOR)
		src--;

	memcpy(dest, path, src - path);
	dest[src - path] = 0;
}

void ExtractFileName(const char *path, char *dest)
{
	const char *src;

	src = path + strlen(path) - 1;

	while (src != path && *(src - 1) != '/' && *(src - 1) != '\\')
		src--;

	while (*src)
	{
		*dest++ = *src++;
	}
	*dest = 0;
}

void ExtractFileBase(const char *path, char *dest)
{
	const char *src;

	src = path + strlen(path) - 1;

	while (src != path && *(src - 1) != '/' && *(src - 1) != '\\')
		src--;

	while (*src && *src != '.')
	{
		*dest++ = *src++;
	}
	*dest = 0;
}

void ExtractFileExtension(const char *path, char *dest)
{
	const char *src;

	src = path + strlen(path) - 1;

	while (src != path && *(src - 1) != '.')
		src--;

	if (src == path)
	{
		*dest = 0;
		return;
	}

	strcpy(dest, src);
}

void ConvertDOSToUnixName(char *dst, const char *src)
{
	while (*src)
	{
		if (*src == '\\')
			*dst = '/';
		else
			*dst = *src;
		dst++; src++;
	}
	*dst = 0;
}

char *StrDup(char *pStr)
{
	if (pStr)
	{
		char *p = new char[strlen(pStr) + 1];
		return strcpy(p, pStr);
	}
	return NULL;
}

char *StrDup(const char *pStr)
{
	if (pStr)
	{
		char *p = new char[strlen(pStr) + 1];
		return strcpy(p, pStr);
	}
	return NULL;
}

static int verbose = 0;

void qprintf(const char *format, ...)
{
	va_list argptr;

	if (!verbose)
		return;

	va_start(argptr, format);
	vprintf(format, argptr);
	va_end(argptr);
}

static HWND hwndOut = NULL;
static int lookedForServer = 0;
static UINT wm_BroadcastCommand = (UINT)-1;

void _printf(const char *format, ...)
{
	va_list argptr;
	char text[4096];
	ATOM a;

	va_start(argptr, format);
	vsprintf(text, format, argptr);
	va_end(argptr);

	printf(text);

	if (!lookedForServer)
	{
		lookedForServer = 1;
		hwndOut = FindWindowA(NULL, "CoD2Map Process Server");
		if (hwndOut)
		{
			wm_BroadcastCommand = RegisterWindowMessageA("Q3MPS_BroadcastCommand");
		}
	}
	if (hwndOut)
	{
		a = GlobalAddAtomA(text);
		PostMessageA(hwndOut, wm_BroadcastCommand, 0, (LPARAM)a);
	}
}

char writedir[1024];
char qdir[1024];
char gamedir[1024];

static const char *FindPrevDirComponent(const char *path, const char *pos)
{
#line 515
	assert(path);
	if (!pos)
		return NULL;
#line 520
	assert(pos >= path);
#line 521
	assert(*pos == '\0' || pos == path || pos[-1] == '/');
	if (pos == path)
		return NULL;

	do
	{
		pos--;
	} while (pos != path && pos[-1] != '/');

	return pos;
}

void CreatePathFromMaps(const char *path)
{
	char fullpath[1024];
	int len;
	int i;
	const char *baseDir;
	int mapsLen;
	const char *pos;
	const char *prev;

	len = GetFullPathNameA(path, sizeof(fullpath), fullpath, NULL);
	if (len <= 0 || len >= sizeof(fullpath))
		Error("couldn't get full path for '%s'\n", path);

	for (i = 0; i < len; i++)
	{
		if (fullpath[i] == '\\')
			fullpath[i] = '/';
	}

	baseDir = "maps";
	mapsLen = strlen(baseDir);
	pos = fullpath + strlen(fullpath);
	do
	{
		pos = FindPrevDirComponent(fullpath, pos);
		if (!pos)
			Error("No '%s' in '%s'\n", baseDir, fullpath);
	} while (_strnicmp(pos, baseDir, mapsLen) || (pos[mapsLen] != '\0' && pos[mapsLen] != '/'));

	prev = FindPrevDirComponent(fullpath, pos);
	if (!prev || prev == fullpath)
		Error("There should be two folders below '%s' in a proper install\n", baseDir);

	memcpy(qdir, fullpath, prev - fullpath);
	qdir[prev - fullpath] = '\0';

	i = 0;
	while (prev[i] != '/' && prev[i])
	{
		gamedir[i] = prev[i];
		i++;
	}
	gamedir[i] = '/';
	gamedir[i + 1] = '\0';

	qprintf("gamedir: %s\n", gamedir);

	if (!writedir[0])
	{
		strcpy(writedir, gamedir);
	}
	else
	{
		len = strlen(writedir);
		if (writedir[len - 1] != '/')
		{
			writedir[len] = '/';
			writedir[len + 1] = 0;
		}
	}
}

void SetQdirFromPath(char *path, const char *baseDirName, const char *newBaseDir)
{
	char temp[1024];
	char *c;
	const char *sep;
	int len;

	len = strlen(baseDirName);
	for (c = path + strlen(path) - 1; c != path; c--)
	{
		size_t i;

		if (!I_strnicmp(c, baseDirName, len))
		{
			sep = c + len;
			while (*sep && *sep != '/' && *sep != '\\')
				sep++;
			memset(temp, 0, sizeof(temp));
			strncpy(temp, path, c - path);
			strcat(temp, newBaseDir);
			strcat(temp, sep);
			for (i = 0; i < strlen(qdir); i++)
			{
				if (temp[i] == '\\')
					temp[i] = '/';
			}
			strcpy(path, temp);
		}
	}
}

void Q_getwd(char *out);

char *ExpandArg(const char *path)
{
	static char full[1024];

	if (path[0] != '/' && path[0] != '\\' && path[1] != ':')
	{
		Q_getwd(full);
		strcat(full, path);
	}
	else
	{
		strcpy(full, path);
	}
	return full;
}

char *ExpandPath(const char *path)
{
	static char full[1024];

	if (path[0] == '/' || path[0] == '\\' || path[1] == ':')
	{
		strcpy(full, path);
		return full;
	}
	sprintf(full, "%s%s", qdir, path);
	return full;
}

char *ExpandGamePath(const char *path)
{
	static char full[1024];

	if (path[0] == '/' || path[0] == '\\' || path[1] == ':')
	{
		strcpy(full, path);
		return full;
	}
	sprintf(full, "%s%s", gamedir, path);
	return full;
}

char *copystring(const char *s)
{
	char *b;
	b = (char *)malloc(strlen(s) + 1);
	strcpy(b, s);
	return b;
}

double I_FloatTime(void)
{
	time_t t;

	time(&t);

	return t;
}

void Q_getwd(char *out)
{
	int i = 0;

	_getcwd(out, 256);
	strcat(out, "\\");
	while (out[i])
	{
		if (out[i] == '\\')
			out[i] = '/';
		i++;
	}
}
