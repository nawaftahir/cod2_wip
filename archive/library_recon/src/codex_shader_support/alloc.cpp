#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#include <windows.h>

namespace D3DXCore
{
// words: block chain, commit granularity, cursor, committed, reserved, initial reserve.
CAlloc::CAlloc(unsigned reserve, unsigned commit)
{
    words[0] = 0;
    SYSTEM_INFO info;
    GetSystemInfo(&info);
    words[1] = info.dwPageSize;
    words[2] = 0;
    words[3] = 0;
    words[4] = 0;
    words[1] = (words[1] + commit - 1) & ~(words[1] - 1);
    if (!reserve) reserve = 0x100000;
    words[5] = (words[1] + reserve - 1) & ~(words[1] - 1);
}
CAlloc::~CAlloc()
{
    while (words[0])
    {
        unsigned block = words[0];
        words[0] = *(unsigned *)block;
        VirtualFree((void *)block, 0, MEM_RELEASE);
    }
}
unsigned char *CAlloc::Alloc(unsigned bytes, unsigned alignment)
{
    unsigned end = ((alignment - 1 + words[2]) & ~(alignment - 1)) + bytes;
    unsigned committed;
    if (end > words[4])
    {
        end = ((alignment + 3) & ~(alignment - 1)) + bytes;
        alignment = words[5];
        while (end > alignment) alignment *= 2;
        unsigned *block = (unsigned *)VirtualAlloc(0, alignment, MEM_RESERVE, PAGE_READWRITE);
        if (!block) return 0;
        committed = (words[1] - 1 + end) & ~(words[1] - 1);
        if (!VirtualAlloc(block, committed, MEM_COMMIT, PAGE_READWRITE))
        {
            VirtualFree(block, 0, MEM_RELEASE);
            return 0;
        }
        *block = words[0];
        words[0] = (unsigned)block;
        words[4] = alignment;
        words[3] = committed;
    }
    else if (end > words[3])
    {
        committed = (words[1] - 1 + end) & ~(words[1] - 1);
        if (!VirtualAlloc((void *)(words[0] + words[3]), committed - words[3], MEM_COMMIT, PAGE_READWRITE)) return 0;
        words[3] = committed;
    }
    words[2] = end;
    return (unsigned char *)(words[0] - bytes + end);
}
}
