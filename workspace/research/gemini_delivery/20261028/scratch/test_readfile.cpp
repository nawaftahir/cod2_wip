int FS_ReadFile(const char *qpath, void **buffer)
{
	fileHandle_t h;
	char *buf;
	int len;

	FS_CheckFileSystemStarted();

	if ( !qpath || !qpath[0] )
	{
		Com_Error(ERR_FATAL, "FS_ReadFile with empty name\\n");
	}

	len = FS_FOpenFileRead(qpath, (fileHandle_t *)&qpath, 0);
	h = (fileHandle_t)(UINT_PTR)qpath;

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
