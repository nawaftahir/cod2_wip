/* 0x10108f54: 96-bit right shift by one */
void FUN_10108f54(unsigned char *base)
{
    unsigned int *w = (unsigned int *)base;
    unsigned int hi = w[2];
    w[2] = hi >> 1;
    w[1] = (hi << 31) | (w[1] >> 1);
    w[0] = (w[1] << 31) | (w[0] >> 1);
}
