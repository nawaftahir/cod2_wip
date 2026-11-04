from pathlib import Path
import subprocess

root = Path("/home/nawaf/cod2/test/dev/radiant/.agents/gemini")
subprocess.run(["python3", str(root / "scratch/insert_4.py")], check=True)

path = root / "src/universal/com_files.cpp"
text = path.read_text()

func = '''
int FS_ReadFile(const char *qpath, void **buffer)
{
	fileHandle_t h;
	char *buf;
	int len;

	FS_CheckFileSystemStarted();

	if ( !qpath || !qpath[0] )
	{
		Com_Error(ERR_FATAL, "" "FS_ReadFile with empty name\\n");
	}

	len = FS_FOpenFileRead(qpath, (fileHandle_t *)&qpath, 0);
	h = *(fileHandle_t *)&qpath;

	if ( !h )
	{
		if ( buffer )
		{
			*buffer = NULL;
		}
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
'''

pos = text.index("void FS_ResetFiles()")
text = text[:pos] + func + "\n" + text[pos:]
path.write_text(text)
subprocess.run(["python3", str(root / "scratch/align_clean.py")], check=True)
print("Updated FS_ReadFile with h = *(fileHandle_t *)&qpath")
