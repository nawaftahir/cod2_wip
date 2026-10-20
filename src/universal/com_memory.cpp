#include <stdlib.h>
#include <windows.h>

extern "C" {

void Z_FreeInternal(void *ptr)
{
    free(ptr);
}

void Z_VirtualFreeInternal(void *ptr)
{
    VirtualFree(ptr, 0, MEM_RELEASE);
}

void Z_VirtualDecommitInternal(void *ptr, int size)
{
    VirtualFree(ptr, size, MEM_DECOMMIT);
}

void *Z_VirtualReserve(int size)
{
    return VirtualAlloc(NULL, size, MEM_RESERVE, PAGE_READWRITE);
}

struct hunkUsed_t {
    int permanent;
    int temp;
};

struct hunkHeader_t {
    int magic;
    int size;
    int pad[2];
};

static int s_hunkTotal;
static hunkUsed_t hunk_high;
static hunkUsed_t hunk_low;
static byte *s_hunkData;

#define HUNK_MAGIC 0x89537892
#define HUNK_FREE_MAGIC 0x89537893
#define HUNK_MAX_ALIGNEMT 4096

void Com_Error(int code, const char *fmt, ...);
void Hunk_CheckTempMemoryHighClear(void);
void Hunk_CheckTempMemoryClear(void);

__declspec(dllimport) void __stdcall DebugBreak(void);
int AssertFailed(const char *expr, const char *file, int line, int a4, int a5);

#define AssertAt(expr, line) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, "\\trees\\cod2src\\src\\universal\\com_memory.cpp", line, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

void Sys_OutOfMemErrorInternal(void);
void Com_Memset(void *dest, int c, int size);

void *Z_MallocInternal(int size)
{
    void *buf = malloc(size);
    if (buf)
        Com_Memset(buf, 0, size);
    else
        Sys_OutOfMemErrorInternal();
    return buf;
}

void *Hunk_AllocateTempMemory(int size)
{
    if (!s_hunkData)
        return Z_MallocInternal(size);

    int allocSize = size + 16;
    int prevTemp = hunk_low.temp;
    int aligned = (prevTemp + 15) & ~15;
    byte *base = s_hunkData + aligned;
    int newTemp = aligned + allocSize;
    hunk_low.temp = newTemp;

    if (newTemp + hunk_high.temp > s_hunkTotal)
    {
        Com_Error(1, "Hunk_AllocateTempMemory: failed on %i bytes (total %i MB, low %i MB, high %i MB), needs %i more hunk bytes",
                  allocSize, s_hunkTotal / 1048576, newTemp / 1048576, hunk_high.temp / 1048576,
                  newTemp + hunk_high.temp - s_hunkTotal);
    }

    byte *buf = base + 16;
    AssertAt(!(((int)buf) & 15), 1639);

    *(int *)base = 0x89537892;
    *(int *)(base + 4) = hunk_low.temp - prevTemp;
    return buf;
}

void *Hunk_AllocAlignInternal(int size, int alignment)
{
    AssertAt(s_hunkData, 1367);
    AssertAt(!(alignment & (alignment - 1)), 1374);
    AssertAt(alignment <= HUNK_MAX_ALIGNEMT, 1375);

    Hunk_CheckTempMemoryHighClear();

    alignment--;
    int newHighUsed = (hunk_high.permanent + size + alignment) & ~alignment;
    hunk_high.permanent = newHighUsed;
    hunk_high.temp = newHighUsed;
    byte *buf = s_hunkData + s_hunkTotal - newHighUsed;

    if (newHighUsed + hunk_low.temp > s_hunkTotal)
    {
        Com_Error(1, "Hunk_AllocAlign failed on %i bytes (total %i MB, low %i MB, high %i MB)",
                  size, s_hunkTotal >> 20, hunk_low.temp >> 20, newHighUsed >> 20);
    }

    AssertAt(!(((int)buf) & alignment), 1403);

    memset(buf, 0, size);
    return buf;
}

void *Hunk_AllocInternal(int size)
{
    return Hunk_AllocAlignInternal(size, 32);
}


#define Assert(expr) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, "\\trees\\cod2src\\src\\universal\\com_memory.cpp", __LINE__, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

void Hunk_FreeTempMemory(void *buf)
{
    hunkHeader_t *hdr;

    if (!s_hunkData)
    {
        free(buf);
        return;
    }

    hdr = (hunkHeader_t *)buf - 1;

    if (hdr->magic != HUNK_MAGIC)
        Com_Error(0, "Hunk_FreeTempMemory: bad magic");

    hdr->magic = HUNK_FREE_MAGIC;
    do {
        static char s_assertDisable;
        if (!(hdr == (void *)(s_hunkData + ((hunk_low.temp - hdr->size + 15) & ~15))) && !s_assertDisable) {
            switch (AssertFailed("hdr == (void *)( s_hunkData + ((hunk_low.temp - hdr->size + 15) & ~15) )", "\\trees\\cod2src\\src\\universal\\com_memory.cpp", 1717, 0, 1)) {
            case 0: DebugBreak(); break;
            case 2: s_assertDisable = 1; break;
            }
        }
    } while (0);
    hunk_low.temp -= hdr->size;


}

void Hunk_CheckTempMemoryClear(void)
{
    do {
        static char s_assertDisable;
        if (!s_hunkData && !s_assertDisable) {
            switch (AssertFailed("s_hunkData", "\\trees\\cod2src\\src\\universal\\com_memory.cpp", 1756, 0, 1)) {
            case 0: DebugBreak(); break;
            case 2: s_assertDisable = 1; break;
            }
        }
    } while (0);

    do {
        static char s_assertDisable;
        if (!(hunk_low.temp == hunk_low.permanent) && !s_assertDisable) {
            switch (AssertFailed("hunk_low.temp == hunk_low.permanent", "\\trees\\cod2src\\src\\universal\\com_memory.cpp", 1757, 0, 1)) {
            case 0: DebugBreak(); break;
            case 2: s_assertDisable = 1; break;
            }
        }
    } while (0);
}

void Hunk_CheckTempMemoryHighClear(void)
{
    do {
        static char s_assertDisable;
        if (!s_hunkData && !s_assertDisable) {
            switch (AssertFailed("s_hunkData", "\\trees\\cod2src\\src\\universal\\com_memory.cpp", 1769, 0, 1)) {
            case 0: DebugBreak(); break;
            case 2: s_assertDisable = 1; break;
            }
        }
    } while (0);

    do {
        static char s_assertDisable;
        if (!(hunk_high.temp == hunk_high.permanent) && !s_assertDisable) {
            switch (AssertFailed("hunk_high.temp == hunk_high.permanent", "\\trees\\cod2src\\src\\universal\\com_memory.cpp", 1770, 0, 1)) {
            case 0: DebugBreak(); break;
            case 2: s_assertDisable = 1; break;
            }
        }
    } while (0);
}

void Hunk_ClearLow(int memory)
{
    Hunk_CheckTempMemoryClear();
    hunk_low.permanent = memory;
}

void Hunk_ClearHigh(int memory)
{
    Hunk_CheckTempMemoryHighClear();
    hunk_high.permanent = memory;
}



}
