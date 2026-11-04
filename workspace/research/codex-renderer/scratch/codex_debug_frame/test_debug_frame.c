#include <assert.h>
#include <string.h>
#include "j_debug_frame.c"

unsigned char renderer_registered;
unsigned char *renderer_front_end_data;
RendererCommandList *renderer_command_list;
RendererCommandList *debug_saved_command_list;
unsigned char *debug_saved_front_end_data;
unsigned char debug_restore_skin_cache;

static RendererCommandList current_list, saved_list;
static unsigned int current_data[0x249d18 / 4], saved_data[1];
static int stage;

void RB_ExecuteRenderCommands(void *data)
{
    assert(stage == 0 && data == current_data);
    assert(renderer_front_end_data == (unsigned char *)current_data);
    assert(current_data[0x249d0c / 4] == 0);
    assert(current_data[0x249d10 / 4] == 0);
    assert(current_data[0x249d14 / 4] == 0);
    stage = 1;
}

void RB_EndFrame(void)
{
    assert(stage == 1);
    assert(renderer_command_list == &current_list);
    stage = 2;
}

void R_LockSkinnedCache(int lockType)
{
    assert(stage == 2 && lockType == 1);
    assert(debug_restore_skin_cache == 0);
    assert(renderer_command_list == &saved_list);
    assert(renderer_front_end_data == (unsigned char *)saved_data);
    assert(debug_saved_command_list == &saved_list);
    stage = 3;
}

static void prepare(void)
{
    memset(&current_list, 0xa5, sizeof(current_list));
    current_list.usedTotal = 0;
    current_list.usedCritical = 12;
    renderer_command_list = &current_list;
    renderer_front_end_data = (unsigned char *)current_data;
    debug_saved_command_list = &saved_list;
    debug_saved_front_end_data = (unsigned char *)saved_data;
    current_data[0x249d0c / 4] = 5;
    current_data[0x249d10 / 4] = 6;
    current_data[0x249d14 / 4] = 7;
    debug_restore_skin_cache = 1;
    stage = 0;
}

int main(void)
{
    prepare();
    renderer_registered = 0;
    R_EndDebugFrame();
    assert(stage == 0 && current_list.usedTotal == 0);
    assert(debug_restore_skin_cache == 1);
    assert(debug_saved_command_list == &saved_list);
    assert(current_data[0x249d0c / 4] == 5);

    renderer_registered = 1;
    R_EndDebugFrame();
    assert(stage == 3);
    assert(current_list.usedTotal == 4 && current_list.usedCritical == 16);
    assert(current_list.lastCmd == current_list.commands);
    assert(((unsigned short *)current_list.commands)[0] == 0);
    assert(((unsigned short *)current_list.commands)[1] == 4);
    assert(current_list.commands[4] == 0xa5);
    assert(debug_saved_command_list == 0 && debug_saved_front_end_data == 0);

    prepare();
    debug_restore_skin_cache = 0;
    R_EndDebugFrame();
    assert(stage == 2 && debug_saved_front_end_data == 0);

    prepare();
    current_list.usedTotal = 0x30000 - 4;
    R_AddCmdEndOfList();
    assert(current_list.usedTotal == 0x30000);
    assert(current_list.usedCritical == 16);
    assert(((unsigned short *)(current_list.commands + 0x30000 - 4))[1] == 4);
    current_list.usedTotal = 0x30000 - 3;
    R_AddCmdEndOfList();
    assert(current_list.usedTotal == 0x30000 - 3);
    assert(current_list.usedCritical == 16 && current_list.lastCmd == 0);
    assert(current_list.commands[0x30000 - 5] == 0xa5);
    return 0;
}
