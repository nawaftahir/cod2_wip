/* 0x10001230: copy two 12-byte records out of the per-frame globals */
extern unsigned int g_101d1b9c;

void FUN_10001230(unsigned int dA, unsigned int dB)
{
    unsigned int s;

    s = g_101d1b9c;
    *(unsigned int *)(dA) = *(unsigned int *)(s + 0x13c);
    *(unsigned int *)(dA + 4) = *(unsigned int *)(s + 0x140);
    *(unsigned int *)(dA + 8) = *(unsigned int *)(s + 0x144);

    s = g_101d1b9c;
    *(unsigned int *)(dB) = *(unsigned int *)(s + 0x148);
    *(unsigned int *)(dB + 4) = *(unsigned int *)(s + 0x14c);
    *(unsigned int *)(dB + 8) = *(unsigned int *)(s + 0x150);
}
