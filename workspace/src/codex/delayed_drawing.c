extern unsigned char *renderer_command_list;

struct DelayedCommandList
{
    unsigned char commands[0x30000];
    int used_total;
    int used_critical;
    unsigned short *last_command;
};

int R_BeginDelayedDrawing(void)
{
    unsigned char *list;
    unsigned short *command;
    int used;

    list = renderer_command_list;
    used = *(int *)(list + 0x30000);
    if (0x30000 - used < 8)
    {
        *(int *)(list + 0x30008) = 0;
        command = 0;
    }
    else
    {
        command = (unsigned short *)(list + used);
        *(int *)(list + 0x30000) = used + 8;
        *(int *)(list + 0x30004) += 8;
        *(int *)(list + 0x30008) = (int)command;
        command[0] = 1;
        command[1] = 8;
    }
    *(int *)(command + 2) = 0;
    return used;
}

void R_EndDelayedDrawing(int marker)
{
    struct DelayedCommandList *list;
    unsigned char *end;
    unsigned short *command;
    int used;
    int critical;

    list = (struct DelayedCommandList *)renderer_command_list;
    used = list->used_total;
    if (0x30000 - used < 4)
    {
        end = list->commands + used;
        list->last_command = 0;
        *(int *)(list->commands + marker + 4) = (int)end;
        return;
    }
    else
    {
        command = (unsigned short *)(list->commands + used);
        list->used_total = used + 4;
        critical = list->used_critical;
        list->last_command = command;
        list->used_critical = critical + 4;
        command[0] = 3;
        command[1] = 4;
    }
    *(int *)(list->commands + marker + 4) = (int)(list->commands + list->used_total);
}

void R_IssueDelayedDrawing(int marker)
{
    unsigned short *command;
    unsigned char *list;
    int used;

    list = renderer_command_list;
    used = *(int *)(list + 0x30000);
    if (0x30000 - used < 8)
    {
        *(int *)(list + 0x30008) = 0;
        command = 0;
    }
    else
    {
        command = (unsigned short *)(list + used);
        *(int *)(list + 0x30000) = used + 8;
        *(int *)(list + 0x30004) += 8;
        *(int *)(list + 0x30008) = (int)command;
        command[0] = 2;
        command[1] = 8;
    }
    *(int *)(command + 2) = (int)(list + marker + 8);
}
