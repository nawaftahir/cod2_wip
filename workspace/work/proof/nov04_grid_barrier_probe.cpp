#include <string.h>
extern "C" void _ReadWriteBarrier(void);
#pragma intrinsic(_ReadWriteBarrier)
typedef unsigned char byte;
byte *s_vc_log; int s_vc_logCount;
bool RB_InsertGridVisLog(int index, unsigned short x, unsigned short y, unsigned short z)
{
    if (s_vc_logCount >= 0x400000)
        return false;
    memmove(s_vc_log + (index + 1) * 6, s_vc_log + index * 6,
        (s_vc_logCount - index) * 6);
    ((unsigned short *)s_vc_log)[index * 3] = x;
    _ReadWriteBarrier();
    ((unsigned short *)s_vc_log)[index * 3 + 1] = y;
    _ReadWriteBarrier();
    ((unsigned short *)s_vc_log)[index * 3 + 2] = z;
    _ReadWriteBarrier();
    ++s_vc_logCount;
    return true;
}

// PINNED 10035c40: existing keys do not consume capacity.
int RB_GridVisLogIndex(int x, int y, int z, int insert)
{
    int top = s_vc_logCount - 1;
    int bottom = 0;
    while (bottom <= top)
    {
        int middle = (bottom + top) >> 1;
        const unsigned short *entry = (const unsigned short *)(s_vc_log + middle * 6);
        int compare = x - entry[0];
        if (!compare)
        {
            compare = y - entry[1];
            if (!compare)
            {
                compare = z - entry[2];
                if (!compare)
                    return middle;
            }
        }
        if (compare < 0)
            top = middle - 1;
        else
            bottom = middle + 1;
    }
    if (insert && RB_InsertGridVisLog(bottom, x, y, z))
        return bottom;
    return -1;
}
