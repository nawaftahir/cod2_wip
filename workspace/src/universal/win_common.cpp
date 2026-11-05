#include <windows.h>
#include <direct.h>
#include <io.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FOUND_FILES 0x1000
#define MAX_OSPATH 256

int Com_sprintf(char *dest, unsigned int size, const char *fmt, ...);
int I_stricmp(const char *s1, const char *s2);
int I_stricmpwild(const char *wild, const char *s);
int Com_FilterPath(const char *filter, const char *name, int casesensitive);
char *CopyString(const char *in);
void *Z_Malloc(int size);

void Sys_Mkdir(const char *path)
{
	_mkdir(path);
}

int Sys_RemoveDirTree(const char *dir);









































char *Sys_Cwd(void)
{
	static char cwd[MAX_OSPATH];

	_getcwd(cwd, sizeof(cwd) - 1);
	cwd[MAX_OSPATH - 1] = 0;

	return cwd;
}

const char *Sys_DefaultCDPath(void)
{
	return "";
}

const char *Sys_DefaultHomePath(void)
{
	return NULL;
}

char *Sys_DefaultInstallPath(void)
{
	static char installPath[MAX_OSPATH];
	HMODULE hModule;
	int len;

	if (installPath[0])
		return installPath;

	hModule = GetModuleHandleA(NULL);
	len = GetModuleFileNameA(hModule, installPath, sizeof(installPath));
	if (len == sizeof(installPath))
		len = sizeof(installPath) - 1;

	while (len != 0)
	{
		char ch = installPath[len];
		if (ch == '\\' || ch == '/' || ch == ':')
			break;
		len--;
	}
	installPath[len] = 0;
	return installPath;
}

static void Sys_ListFilteredFiles(const char *basedir, const char *subdirs, const char *filter, char **list, int *numfiles);












































int HasFileExtension(const char *name, const char *extension)
{
    char wildcard[MAX_OSPATH];
    Com_sprintf(wildcard, sizeof(wildcard), "*.%s", extension);
    return I_stricmpwild(wildcard, name) == 0;
}







char **Sys_ListFiles(const char *directory, const char *extension, const char *filter, int *numfiles, int wantsubs);































































































void Sys_FreeFileList(char **list)
{
	int i;

	if (!list)
		return;

	for (i = 0; list[i]; i++)
		free(list[i]);

	free(list);
}


/* Window CRT directory walk from the 32-bit cod2rad evidence. */
int Sys_DirectoryHasContents(const char *directory)
{
    intptr_t findhandle;
    char search[MAX_OSPATH];
    struct _finddata_t finddata;

    Com_sprintf(search, MAX_OSPATH, "%s\\*", directory);
    findhandle = _findfirst(search, &finddata);
    if (findhandle == -1)
        return 0;

    do
    {
        if ((finddata.attrib & _A_SUBDIR)
            && (!I_stricmp(finddata.name, ".")
                || !I_stricmp(finddata.name, "..")
                || !I_stricmp(finddata.name, "CVS")))
            continue;
        return 1;
    } while (_findnext(findhandle, &finddata) != -1);

    return 0;
}

