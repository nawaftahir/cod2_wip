/* f380 v1: mip-level texture upload (thiscall-ish at binary: ECX=self,
 * EAX=fmt). Written as plain cdecl static for TU inclusion; convention
 * polish deferred. Semantics per build/f380.asm (175 insns). */
extern int (__cdecl *P_101d49d8)(unsigned int);
extern int (__cdecl *P_101d49f8)(unsigned int);
extern void Sub_10010d40(int a, int b);
extern void Sub_1000ec00(int a, int b, int c, int d);
extern void Sub_1000ea20(int a, int b);
extern unsigned char g_101d496b;

static __declspec(noinline) void Sub_1000f380(int fmt, int self)
{
    int sh;
    int w;
    int h;
    int lvl;
    int nbuf;
    int size;
    int i;
    int k;
    unsigned char f5;
    short sw6;
    short sw8;
    short swa;
    unsigned int bufs[8];
    unsigned int fills[8];
    int tmp[4];
    unsigned char stk[0x40];

    (void)tmp;
    (void)stk;
    f5 = *(unsigned char *)(self + 5);
    sw6 = *(short *)(self + 6);
    sw8 = *(short *)(self + 8);
    swa = *(short *)(self + 0xa);
    w = fmt;
    /* mip level count from min-dim shrink loop */
    lvl = 1;
    if (!(f5 & 2))
    {
        sh = 1;
        while (sh < w && sh < h && sh < swa)
        {
            sh <<= 1;
            lvl += 1;
        }
        lvl -= 1;
    }
    else
    {
        lvl = 0;
    }
    if (fmt == 3)
    {
        h = 4;
    }
    {
        int mult;

        nbuf = (*(int *)self != 5) ? 1 : 2;
        mult = sw8 * h;
        mult *= (fmt == 3) ? 4 : fmt;
        size = mult;
        i = 0;
        if (nbuf > 0)
        {
            for (k = 0; k < nbuf; k++)
            {
                bufs[k] = 0;
            }
            for (i = 0; i < nbuf; i++)
            {
                bufs[i] = (unsigned int)P_101d49d8((unsigned int)size);
            }
        }
        /* per-level upload loop */
        {
            int lv;

            lv = lvl;
            while (lv >= 0)
            {
                int bw;
                int bh;
                int bsize;

                bh = 1 - (h >> lv);
                if ((h >> lv) - 1 < 0)
                {
                    bh = h >> lv;
                }
                bw = 1 - (w >> lv);
                if ((w >> lv) - 1 >= 0)
                {
                    bw = 1;
                }
                bsize = bw * bh * ((fmt == 3) ? 4 : fmt);
                for (k = 0; k < nbuf; k++)
                {
                    fills[k] = bufs[k] - bsize;
                    bufs[k] = fills[k];
                    Sub_10010d40(fills[k], bufs[k]);
                    {
                        int upw;
                        unsigned char tag;

                        upw = lvl - *(unsigned char *)((int *)self)[2];
                        tag = *(unsigned char *)self;
                        if (tag == 4)
                        {
                            Sub_1000ec00((int)self, upw, fills[k], bsize);
                        }
                        else
                        {
                            if (!(tag == 5 && upw == 0 && g_101d496b == 0))
                            {
                                Sub_1000ea20((int)self, fills[k]);
                            }
                        }
                    }
                }
                lv -= 1;
            }
        }
        while (--i >= 0)
        {
            P_101d49f8(bufs[i]);
        }
    }
}
