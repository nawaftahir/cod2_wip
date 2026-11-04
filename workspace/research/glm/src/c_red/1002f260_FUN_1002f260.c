extern void FUN_1002f110(int a, int b, int c, int d, int e);

void FUN_1002f260(int *p)
{
    int base;

    base = *p;
    FUN_1002f110(*(int *)(base + 4), *(int *)(base + 8), *(int *)(base + 0xc),
                 *(int *)(base + 0x10), *(int *)(base + 0x14));
    *p = (unsigned)*(unsigned short *)(*p + 2) + *p;
}
