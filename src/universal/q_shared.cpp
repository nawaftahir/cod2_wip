typedef unsigned char byte;

extern "C" {

short ShortSwap(int l)
{
    byte b1, b2;
    b1 = l & 255;
    b2 = (l >> 8) & 255;
    return (b1 << 8) + b2;
}

short ShortNoSwap(int l)
{
    return (short)l;
}

int LongSwap(int l)
{
    byte b1, b2, b3, b4;
    b1 = l & 255;
    b2 = (l >> 8) & 255;
    b3 = (l >> 16) & 255;
    b4 = (l >> 24) & 255;
    return ((int)b1 << 24) + ((int)b2 << 16) + ((int)b3 << 8) + b4;
}

int LongNoSwap(int l)
{
    return l;
}

unsigned __int64 Long64Swap(unsigned __int64 l)
{
    union {
        unsigned __int64 ll;
        unsigned char b[8];
    } in, out;

    in.ll = l;
    out.b[0] = in.b[7];
    out.b[1] = in.b[6];
    out.b[2] = in.b[5];
    out.b[3] = in.b[4];
    out.b[4] = in.b[3];
    out.b[5] = in.b[2];
    out.b[6] = in.b[1];
    out.b[7] = in.b[0];
    return out.ll;
}

unsigned __int64 Long64NoSwap(unsigned __int64 ll)
{
    return ll;
}

float FloatReadSwap(int n)
{
    union { float f; int i; } u;
    u.i = LongSwap(n);
    return u.f;
}

float FloatReadNoSwap(int n)
{
    union { float f; int i; } u;
    u.i = n;
    return u.f;
}

int FloatWriteSwap(float f)
{
    union { float f; int i; } u;
    u.f = f;
    return LongSwap(u.i);
}


int FloatWriteNoSwap(float f)
{
    union { float fl; int i; } u;
    u.fl = f;
    return u.i;
}

__declspec(dllimport) void __stdcall DebugBreak(void);
int AssertFailed(const char *expr, const char *file, int line, int a4, int a5);

#define AssertAt(expr, line) \
    do { \
        static char s_assertDisable; \
        if (!(expr) && !s_assertDisable) { \
            switch (AssertFailed(#expr, "\\trees\\cod2src\\src\\universal\\q_shared.cpp", line, 0, 1)) { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = 1; \
                break; \
            } \
        } \
    } while (0)

static int I_strnicmp(const char *s0, const char *s1, int n)
{
    int c0, c1;

    do {
        c0 = (signed char)*s0++;
        c1 = (signed char)*s1++;
        if (!n--)
            return 0;
        if (c0 != c1) {
            if (c0 >= 'a' && c0 <= 'z')
                c0 -= 32;
            if (c1 >= 'a' && c1 <= 'z')
                c1 -= 32;
            if (c0 != c1)
                return c0 < c1 ? -1 : 1;
        }
    } while (c0);

    return 0;
}

int I_strncmp(const char *s0, const char *s1, int n)
{
    int c0, c1;

    do {
        c0 = (signed char)*s0++;
        c1 = (signed char)*s1++;
        if (!n--)
            return 0;
        if (c0 != c1)
            return c0 < c1 ? -1 : 1;
    } while (c0);

    return 0;
}

int I_strcmp(const char *s0, const char *s1)
{
    AssertAt(s0, 608);
    AssertAt(s1, 609);
    return I_strnicmp(s0, s1, 0x7fffffff);
}

}

