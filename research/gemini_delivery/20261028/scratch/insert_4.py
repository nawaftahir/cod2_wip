from pathlib import Path

root = Path("/home/nawaf/cod2/test/dev/radiant/.agents/gemini")
com_files = root / "src/universal/com_files.cpp"
# Restore from backup first
backup = root / "scratch/test_cluster/com_files.cpp.bak"
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

funcs = '''
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
'''

# Place after FS_ShiftedStrStr and before FS_FOpenFileRead_Internal declaration
pos = text.index("int FS_FOpenFileRead_Internal(")
text = text[:pos] + funcs + "\n" + text[pos:]

com_files.write_text(text)
print("Inserted 4 functions into com_files.cpp with static")
