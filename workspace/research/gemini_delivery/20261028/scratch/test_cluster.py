from pathlib import Path
import subprocess

root = Path("/home/nawaf/cod2/test/dev/radiant/.agents/gemini")
backup = root / "scratch/test_cluster/com_files.cpp.bak"
path = root / "src/universal/com_files.cpp"

text = backup.read_text()

macro = '''#define FS_ASSERT_MSG(type, expr, detail) \\
    do { \\
        static bool s_assertDisable; \\
        if (!(expr) && !s_assertDisable) { \\
            switch (FUN_0047d980(va("%s\\n\\t%s", #expr, detail), __FILE__, __LINE__, type, 1)) { \\
            case 0: DebugBreak(); break; \\
            case 2: s_assertDisable = true; break; \\
            } \\
        } \\
    } while (0)

'''

text = macro + text

dvars_old = '''dvar_t *fs_homepath;







dvar_t *fs_ignoreLocalized;'''

dvars_new = '''dvar_t *fs_homepath;
dvar_t *fs_debug;
dvar_t *fs_basepath;
dvar_t *fs_cdpath;
dvar_t *fs_copyfiles;
dvar_t *fs_ignoreLocalized;'''

assert dvars_old in text, "dvars_old not found"
text = text.replace(dvars_old, dvars_new)

cluster = '''
static bool FS_IsBackupSubStr(const char *filenameSubStr)
{
	if ( filenameSubStr[0] == '.' && filenameSubStr[1] == '.' )
		return 1;
	if ( filenameSubStr[0] == ':' && filenameSubStr[1] == ':' )
		return 1;
	return 0;
}

static int FS_IsPathSepChar(char c)
{
	switch ( c )
	{
	case '/':
	case '\\\\':
		return 1;
	default:
		return 0;
	}
}

static bool FS_SanitizeFilename(const char *filename, char *sanitizedName, int sanitizedNameSize)
{
	int srcIndex;
	int dstIndex;
	assert(filename);
	assert(sanitizedName);
	assertMsg((sanitizedNameSize > 0), "(sanitizedNameSize) = %i", sanitizedNameSize);

	for ( srcIndex = 0; FS_IsPathSepChar(filename[srcIndex]); ++srcIndex );
	dstIndex = 0;
	while ( filename[srcIndex] ) {
		if ( FS_IsBackupSubStr(&filename[srcIndex]) )
			return false;
		if ( filename[srcIndex] != '.' || filename[srcIndex + 1] && !FS_IsPathSepChar(filename[srcIndex + 1]) ) {
			FS_ASSERT_MSG(0, dstIndex + 1 < sanitizedNameSize, va("%i + 1 > %i", dstIndex, sanitizedNameSize));
			if ( !FS_IsPathSepChar(filename[srcIndex]) ) {
				sanitizedName[dstIndex] = filename[srcIndex];
			}
			else {
				sanitizedName[dstIndex] = '/';
				while ( FS_IsPathSepChar(filename[srcIndex + 1]) )
					++srcIndex;
			}
			++dstIndex;
		}
		++srcIndex;
	}
	FS_ASSERT_MSG(1, dstIndex <= srcIndex, va("%i > %i", dstIndex, srcIndex));

	sanitizedName[dstIndex] = 0;
	return true;
}

static bool FS_FilesAreLoadedGlobally(const char *filename)
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

int FS_FOpenFileRead_Internal(const char *filename, int *file, qboolean uniqueFILE, FsThread thread)
{
	searchpath_t *i;
	char src[MAX_OSPATH];
	char netpath[MAX_OSPATH];
	char copypath[MAX_OSPATH];
	iwd_t *iwd;
	fileInIwd_t *iwdFile;
	directory_t *dir;
	int hash = 0;
	void *dest;
	FILE *stream;

	assert(filename);
	FS_CheckFileSystemStarted();

	if ( !FS_SanitizeFilename(filename, src, MAX_OSPATH) )
	{
		if ( file )
		{
			*file = 0;
		}
		return -1;
	}

	if ( !file )
	{
		for ( i = fs_searchpaths; i; i = i->next )
		{
			if ( !FS_UseSearchPath(i) )
			{
				continue;
			}
			if ( i->iwd )
			{
				hash = FS_HashFileName(src, i->iwd->hashSize);
				if ( i->iwd->hashTable[hash] )
				{
					for ( iwdFile = i->iwd->hashTable[hash]; iwdFile; iwdFile = iwdFile->next )
					{
						if ( !FS_FilenameCompare(iwdFile->name, src) )
						{
							return 1;
						}
					}
					continue;
				}
			}
			if ( i->dir )
			{
				dir = i->dir;
				FS_BuildOSPath_Internal(dir->path, dir->gamedir, src, netpath, thread);
				stream = fopen(netpath, "rb");
				if ( !stream )
				{
					continue;
				}
				fclose(stream);
				return 1;
			}
		}
		return -1;
	}

	*file = FS_HandleForFile(thread);
	fsh[*file].handleFiles.unique = uniqueFILE;

	for ( i = fs_searchpaths; i; i = i->next )
	{
		if ( !FS_UseSearchPath(i) )
		{
			continue;
		}
		iwd = i->iwd;
		if ( iwd )
		{
			hash = FS_HashFileName(src, iwd->hashSize);
			if ( iwd->hashTable[hash] )
			{
				for ( iwdFile = iwd->hashTable[hash]; iwdFile; iwdFile = iwdFile->next )
				{
					if ( !FS_FilenameCompare(iwdFile->name, src) )
					{
						if ( !iwd->referenced && !FS_FilesAreLoadedGlobally(src) )
						{
							iwd->referenced = 1;
						}

						if ( uniqueFILE )
						{
							fsh[*file].handleFiles.file.z = unzReOpen(iwd->iwdFilename, iwd->handle);
							if ( !fsh[*file].handleFiles.file.z )
							{
								if ( thread )
								{
									FS_FCloseFile(*file);
									*file = 0;
									return -1;
								}
								Com_Error(ERR_FATAL, "" "Couldn't reopen %s", iwd->iwdFilename);
							}
						}
						else
						{
							fsh[*file].handleFiles.file.z = iwd->handle;
						}

						I_strncpyz(fsh[*file].name, src, MAX_OSPATH);
						fsh[*file].zipFile = (qboolean)iwd;
						dest = fsh[*file].handleFiles.file.o;
						stream = *(FILE **)dest;
						unzSetCurrentFileInfoPosition(iwd->handle, iwdFile->pos);
						Com_Memcpy(dest, iwd->handle, sizeof(unz_s));
						*(FILE **)dest = stream;
						unzOpenCurrentFile(fsh[*file].handleFiles.file.z);
						fsh[*file].zipFilePos = iwdFile->pos;

						if ( fs_debug->current.integer && !thread )
						{
							Com_Printf("FS_FOpenFileRead: %s (found in '%s')\\n", src, iwd->iwdFilename);
						}
						return ((unz_s *)dest)->cur_file_info.uncompressed_size;
					}
				}
				continue;
			}
		}

		if ( i->dir )
		{
			dir = i->dir;
			FS_BuildOSPath_Internal(dir->path, dir->gamedir, src, netpath, thread);
			fsh[*file].handleFiles.file.o = fopen(netpath, "rb");
			if ( !fsh[*file].handleFiles.file.o )
			{
				continue;
			}
			I_strncpyz(fsh[*file].name, src, MAX_OSPATH);
			fsh[*file].zipFile = qfalse;

			if ( fs_debug->current.integer && !thread )
			{
				Com_Printf("FS_FOpenFileRead: %s (found in '%s/%s')\\n", src, dir->path, dir->gamedir);
			}

			if ( fs_copyfiles->current.boolean && !I_stricmp(dir->path, fs_cdpath->current.string) )
			{
				FS_BuildOSPath_Internal(fs_basepath->current.string, dir->gamedir, src, copypath, thread);
				FS_CopyFile(netpath, copypath);
			}

			return FS_filelength(*file);
		}
	}

	if ( fs_debug->current.integer && !thread )
	{
		Com_Printf("Can't find %s\\n", filename);
	}
	*file = 0;
	return -1;
}
'''

# Replace forward declaration with cluster
fwd = "int FS_FOpenFileRead_Internal(const char *filename, int *file, qboolean uniqueFILE, FsThread thread);"
assert fwd in text
text = text.replace(fwd, cluster)

path.write_text(text)

subprocess.run(["python3", str(root.parent / "codex/scratch/codex_1028_read_graph/align.py")], cwd=root, check=True)
print("Aligned cluster successfully with hash = 0!")
