#include <string.h>

extern unsigned char renderer_fog_settings[0xa0];
extern int renderer_fog_index;

void R_ClearFogs(void)
{
    memset(renderer_fog_settings, 0, sizeof(renderer_fog_settings));
    renderer_fog_index = 0;
}

void R_ArchiveFogState(void *memory_file)
{
    typedef void (__cdecl *ArchiveProc)(void *, int, void *);

    ((ArchiveProc)*(void **)((unsigned char *)memory_file + 0x10))(
        memory_file, sizeof(renderer_fog_settings), renderer_fog_settings);
    ((ArchiveProc)*(void **)((unsigned char *)memory_file + 0x10))(
        memory_file, sizeof(renderer_fog_index), &renderer_fog_index);
}
