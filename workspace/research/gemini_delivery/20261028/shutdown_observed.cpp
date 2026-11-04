// Recovered from the observed Gemini working-tree diff; requires re-verification.
static void FS_ShutdownSearchPaths(searchpath_t *p)
{
    searchpath_t *next;
    while (p)
    {
        next = p->next;
        if (p->iwd)
        {
            unzClose(p->iwd->handle);
            free(p->iwd->buildBuffer);
            free(p->iwd);
        }
        if (p->dir)
            free(p->dir);
        free(p);
        p = next;
    }
}

void FS_Shutdown(int closemfp)
{
    int i;
    for (i = 1; i < 64; ++i)
        if (fsh[i].handleFiles.file.o)
            FS_FCloseFile(i);
    FS_ShutdownSearchPaths(fs_searchpaths);
    fs_searchpaths = NULL;
}
