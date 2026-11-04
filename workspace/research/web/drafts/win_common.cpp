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

int Sys_RemoveDirTree(const char *dir)
{
    char path[256];
    struct _finddata_t findinfo;
    int length = (int)strlen(dir);
    bool hasSep = dir[length - 1] == '\\' || dir[length - 1] == '/';

    const char *searchPattern = hasSep ? "%s*" : "%s\\\\*";
    Com_sprintf(path, sizeof(path), searchPattern, dir);

    int findhandle = _findfirst(path, &findinfo);
    if (findhandle == -1)
        return _rmdir(dir) != -1;

    bool hasError = false;
    do {
        if (findinfo.name[0] == '.' &&
            (!findinfo.name[1] ||
             (findinfo.name[1] == '.' && !findinfo.name[2])))
            continue;

        if (hasSep)
            Com_sprintf(path, sizeof(path), "%s%s", dir, findinfo.name);
        else
            Com_sprintf(path, sizeof(path), "%s\\\\%s", dir, findinfo.name);

        if (findinfo.attrib & _A_SUBDIR)
            hasError = !Sys_RemoveDirTree(path);
        else
            hasError = remove(path) == -1;
    } while (!hasError && _findnext(findhandle, &findinfo) != -1);

    _findclose(findhandle);
    return !hasError && _rmdir(dir) != -1;
}









































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

/* Directory walkers adapted from id-Software/Quake-III-Arena,
 * code/win32/win_main.c, Copyright (C) 1999-2005 id Software, Inc.
 * Original material is GPL-2.0-or-later. Retail-specific adaptation under trial.
 */
static void Sys_ListFilteredFiles(const char *basedir, const char *subdirs,
                                  const char *filter, char **list, int *numfiles)
{
    char search[MAX_OSPATH];
    char filename[MAX_OSPATH];
    struct _finddata_t findinfo;
    int findhandle;

    if (*numfiles >= MAX_FOUND_FILES - 1)
        return;

    if (strlen(subdirs))
        Com_sprintf(search, sizeof(search), "%s\\\\%s\\\\*", basedir, subdirs);
    else
        Com_sprintf(search, sizeof(search), "%s\\\\*", basedir);

    findhandle = _findfirst(search, &findinfo);
    if (findhandle == -1)
        return;

    do {
        if ((findinfo.attrib & _A_SUBDIR) &&
            (!I_stricmp(findinfo.name, ".") ||
             !I_stricmp(findinfo.name, "..") ||
             !I_stricmp(findinfo.name, "CVS")))
            continue;

        if (*numfiles >= MAX_FOUND_FILES - 1)
            break;

        if (subdirs)
            Com_sprintf(filename, sizeof(filename), "%s\\\\%s", subdirs, findinfo.name);
        else
            Com_sprintf(filename, sizeof(filename), "%s", findinfo.name);

        if (!Com_FilterPath(filter, filename, 0))
            continue;

        list[*numfiles] = CopyString(filename);
        ++*numfiles;
    } while (_findnext(findhandle, &findinfo) != -1);

    _findclose(findhandle);
}

int HasFileExtension(const char *name, const char *extension)
{
    char wildcard[MAX_OSPATH];
    Com_sprintf(wildcard, sizeof(wildcard), "*.%s", extension);
    return I_stricmpwild(wildcard, name) == 0;
}







char **Sys_ListFiles(const char *directory, const char *extension,
                     const char *filter, int *numfiles, int wantsubs)
{
    char search[MAX_OSPATH];
    char *list[MAX_FOUND_FILES];
    struct _finddata_t findinfo;
    char **listCopy;
    int findhandle;
    int nfiles;
    int flag;
    int i;

    if (filter)
    {
        nfiles = 0;
        Sys_ListFilteredFiles(directory, "", filter, list, &nfiles);
        list[nfiles] = NULL;
        *numfiles = nfiles;
        if (!nfiles)
            return NULL;

        listCopy = (char **)Z_Malloc((nfiles + 1) * sizeof(*listCopy));
        for (i = 0; i < nfiles; ++i)
            listCopy[i] = list[i];
        listCopy[i] = NULL;
        return listCopy;
    }

    if (!extension)
        extension = "";
    if (extension[0] == '/' && extension[1] == 0)
    {
        extension = "";
        flag = 0;
    }
    else
        flag = _A_SUBDIR;

    if (*extension)
        Com_sprintf(search, sizeof(search), "%s\\\\*.%s", directory, extension);
    else
        Com_sprintf(search, sizeof(search), "%s\\\\*", directory);

    nfiles = 0;
    findhandle = _findfirst(search, &findinfo);
    if (findhandle == -1)
    {
        *numfiles = 0;
        return NULL;
    }

    do
    {
        if (((!wantsubs && flag != (findinfo.attrib & _A_SUBDIR))
             || (wantsubs && (findinfo.attrib & _A_SUBDIR)))
            && (!(findinfo.attrib & _A_SUBDIR)
                || (I_stricmp(findinfo.name, ".")
                    && I_stricmp(findinfo.name, "..")
                    && I_stricmp(findinfo.name, "CVS")))
            && (!*extension || HasFileExtension(findinfo.name, extension)))
        {
            list[nfiles++] = CopyString(findinfo.name);
            if (nfiles == MAX_FOUND_FILES - 1)
                break;
        }
    }
    while (_findnext(findhandle, &findinfo) != -1);

    list[nfiles] = NULL;
    _findclose(findhandle);
    *numfiles = nfiles;
    if (!nfiles)
        return NULL;

    listCopy = (char **)Z_Malloc((nfiles + 1) * sizeof(*listCopy));
    for (i = 0; i < nfiles; ++i)
        listCopy[i] = list[i];
    listCopy[i] = NULL;
    return listCopy;
}

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

