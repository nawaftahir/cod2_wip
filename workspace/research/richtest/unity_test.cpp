// Experiment: can 0x44f5d0 (XYWnd.cpp, argument in ESI) be produced by plain /O2 as a static
// function called from another class's method in the same compile unit?
#include <windows.h>

extern "C" int AssertFailed(const char *expr, const char *file, int line, int a4, int a5);

#define Assert(expr) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, ".\\XYWnd.cpp", __LINE__, 0, 1)) { \
            case 0: DebugBreak(); break; \
            case 2: s_assertDisable = 1; break; \
            } \
        } \
    } while (0)

struct brush_s
{
    char pad0[0x14];
    void *owner;
    char pad1[0x26 - 0x18];
    char hidden;
};

bool FilterOwner(void *owner);

static bool FilteredBrush(brush_s *b)
{
#line 2574
    Assert(b);
    if (b->hidden)
        return true;
    return FilterOwner(b->owner);
}

struct CCamWnd
{
    char pad[0x40];
    int Method(int x);
};

int CCamWnd::Method(int x)
{
    if (FilteredBrush((brush_s *)this))
        return x;
    return x + 1;
}
