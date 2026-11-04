#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include "src/delayed_drawing.c"

unsigned char *renderer_command_list;

int main(void)
{
    unsigned char *list;
    int marker;
    int issued;

    assert(sizeof(void *) == 4);
    list = calloc(1, 0x3000c);
    assert(list != 0);
    renderer_command_list = list;
    *(int *)(list + 0x30000) = 16;
    *(int *)(list + 0x30004) = 4;
    marker = R_BeginDelayedDrawing();
    assert(marker == 16);
    assert(*(unsigned short *)(list + marker) == 1);
    assert(*(unsigned short *)(list + marker + 2) == 8);
    assert(*(int *)(list + marker + 4) == 0);
    assert(*(int *)(list + 0x30000) == 24);
    assert(*(int *)(list + 0x30004) == 12);
    assert(*(int *)(list + 0x30008) == (int)(list + marker));

    R_EndDelayedDrawing(marker);
    assert(*(unsigned short *)(list + 24) == 3);
    assert(*(unsigned short *)(list + 26) == 4);
    assert(*(int *)(list + marker + 4) == (int)(list + 28));
    assert(*(int *)(list + 0x30004) == 16);
    issued = *(int *)(list + 0x30000);
    R_IssueDelayedDrawing(marker);
    assert(*(unsigned short *)(list + issued) == 2);
    assert(*(unsigned short *)(list + issued + 2) == 8);
    assert(*(int *)(list + issued + 4) == (int)(list + marker + 8));

    /* End's full-buffer path patches the earlier call without allocating. */
    *(int *)(list + 0x30000) = 0x2fffe;
    *(int *)(list + 0x30004) = 20;
    R_EndDelayedDrawing(marker);
    assert(*(int *)(list + 0x30000) == 0x2fffe);
    assert(*(int *)(list + 0x30004) == 20);
    assert(*(int *)(list + 0x30008) == 0);
    assert(*(int *)(list + marker + 4) == (int)(list + 0x2fffe));

    /* Exactly four bytes available must still allocate the end command. */
    *(int *)(list + 0x30000) = 0x2fffc;
    R_EndDelayedDrawing(marker);
    assert(*(int *)(list + 0x30000) == 0x30000);
    assert(*(unsigned short *)(list + 0x2fffc) == 3);
    free(list);
    return 0;
}
