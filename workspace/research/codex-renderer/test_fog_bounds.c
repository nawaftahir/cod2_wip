#include <assert.h>
#include <stdlib.h>
#include <string.h>
#ifndef _MSC_VER
#define __cdecl
#endif
#include "src/fog_state.c"
#include "src/model_bounds.c"
#include "src/world_bounds.c"

unsigned char renderer_fog_settings[0xa0];
int renderer_fog_index;
unsigned char *renderer_world;
static int archive_calls;

static void archive_second(void *file, int size, void *data)
{
    assert(file != 0 && archive_calls == 1);
    assert(size == 4 && data == &renderer_fog_index);
    archive_calls = 2;
}

static void archive_first(void *file, int size, void *data)
{
    typedef void (*ArchiveProc)(void *, int, void *);

    assert(archive_calls == 0);
    assert(size == 0xa0 && data == renderer_fog_settings);
    archive_calls = 1;
    *(ArchiveProc *)((unsigned char *)file + 0x10) = archive_second;
}

int main(void)
{
    typedef void (*ArchiveProc)(void *, int, void *);
    void *memory_file;
    float bounds[6];
    float mins[3];
    float maxs[3];
    int i;
    unsigned char world[0x154];

    memset(world, 0, sizeof(world));
    renderer_world = world;
    for (i = 0; i < 6; i += 1)
    {
        ((float *)(world + 0x13c))[i] = (float)i - 3.0f;
    }
    R_GetWorldBounds(mins, maxs);
    for (i = 0; i < 3; i += 1)
    {
        assert(mins[i] == (float)i - 3.0f);
        assert(maxs[i] == (float)i);
    }

    memset(renderer_fog_settings, 0xaa, sizeof(renderer_fog_settings));
    renderer_fog_index = 7;
    R_ClearFogs();
    for (i = 0; i < 0xa0; i += 1)
    {
        assert(renderer_fog_settings[i] == 0);
    }
    assert(renderer_fog_index == 0);
    memory_file = calloc(1, 0x10 + sizeof(ArchiveProc));
    assert(memory_file != 0);
    *(ArchiveProc *)((unsigned char *)memory_file + 0x10) = archive_first;
    R_ArchiveFogState(memory_file);
    assert(archive_calls == 2);
    free(memory_file);

    bounds[0] = -2.0f;
    bounds[1] = -0.0f;
    bounds[2] = 1.5f;
    bounds[3] = 3.0f;
    bounds[4] = 4.0f;
    bounds[5] = 5.0f;
    R_ModelBounds(bounds, mins, maxs);
    assert(memcmp(mins, bounds, sizeof(mins)) == 0);
    assert(memcmp(maxs, bounds + 3, sizeof(maxs)) == 0);
    R_ModelBounds(0, mins, maxs);
    for (i = 0; i < 3; i += 1)
    {
        assert(mins[i] == 0.0f && maxs[i] == 0.0f);
    }
    return 0;
}
