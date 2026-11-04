#include <assert.h>
#include "scratch/codex_frame_end/j_frame_end.c"

unsigned char renderer_registered;
unsigned char *renderer_front_end_data;
void *renderer_temp_skin_buffer;
int renderer_temp_skin_bytes;
void (*renderer_update_debug_data)(void);
void (*renderer_virtual_decommit)(void *, int);
static unsigned char backend[0x249d19];
static int step;

void RB_AdaptiveGpuSyncTarget(void) { assert(step == 0); step = 1; }
void R_UnlockSkinnedCache(void) { assert(step == 1); step = 2; }
static void update_debug(void) { assert(step == 2); step = 3; }
void R_TransferDebugGlobals(void *data)
{
    assert(step == 3 && data == backend + 0x249d18);
    step = 4;
}
void Renderer_SubmitFrame(void) { assert(step == 4); step = 5; }
static void decommit(void *buffer, int bytes)
{
    assert(step == 5 && buffer == backend && bytes == 123);
    assert(renderer_temp_skin_bytes == 123);
    step = 6;
}

int main(void)
{
    renderer_front_end_data = backend;
    renderer_temp_skin_buffer = backend;
    renderer_temp_skin_bytes = 123;
    renderer_update_debug_data = update_debug;
    renderer_virtual_decommit = decommit;
    renderer_registered = 0;
    R_EndFrame();
    assert(step == 0 && renderer_temp_skin_bytes == 123);
    renderer_registered = 1;
    R_EndFrame();
    assert(step == 6 && renderer_temp_skin_bytes == 0);
    step = 0;
    R_EndFrame();
    assert(step == 5 && renderer_temp_skin_bytes == 0);
    return 0;
}
