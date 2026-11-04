typedef struct RendererCommandList
{
    unsigned char commands[0x30000];
    int usedTotal;
    int usedCritical;
    void *lastCmd;
} RendererCommandList;

extern unsigned char renderer_registered;
extern unsigned char *renderer_front_end_data;
extern RendererCommandList *renderer_command_list;
extern RendererCommandList *debug_saved_command_list;
extern unsigned char *debug_saved_front_end_data;
extern unsigned char debug_restore_skin_cache;

extern void RB_ExecuteRenderCommands(void *data);
extern void RB_EndFrame(void);
extern void R_LockSkinnedCache(int lockType);

void R_AddCmdEndOfList(void)
{
    RendererCommandList *list;
    unsigned short *command;
    int used;

    list = renderer_command_list;
    used = list->usedTotal;
    if (0x30000 - used < 4)
    {
        list->lastCmd = 0;
        return;
    }
    command = (unsigned short *)(list->commands + used);
    list->usedTotal = used + 4;
    list->usedCritical += 4;
    list->lastCmd = command;
    command[0] = 0;
    command[1] = 4;
}

void R_EndDebugFrame(void)
{
    unsigned char *data;

    if (renderer_registered)
    {
        R_AddCmdEndOfList();
        data = renderer_front_end_data;
        *(unsigned int *)(data + 0x249d0c) = 0;
        *(unsigned int *)(data + 0x249d10) = 0;
        *(unsigned int *)(data + 0x249d14) = 0;
        RB_ExecuteRenderCommands(data);
        RB_EndFrame();
        renderer_command_list = debug_saved_command_list;
        renderer_front_end_data = debug_saved_front_end_data;
        if (debug_restore_skin_cache)
        {
            debug_restore_skin_cache = 0;
            R_LockSkinnedCache(1);
        }
        debug_saved_command_list = 0;
        debug_saved_front_end_data = 0;
    }
}
