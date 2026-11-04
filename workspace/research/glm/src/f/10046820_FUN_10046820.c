void FUN_10046820(int *self)
{
    void **vt;

    *(char *)(*(int *)(self + 0x51) + 0xC) = 0;
    vt = *(void ***)(self + 0x55);
    ((void (*)(int *))vt[1])(self);
    vt = *(void ***)(self + 0x55);
    ((void (*)(int *))vt[2])(self);
}
