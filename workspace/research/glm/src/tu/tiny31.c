/* 0x100222f0: enqueue a 12-byte render command */
#define g_1042e778 (*(unsigned char **)0x1042E778)

void FUN_100222f0(unsigned int pkt)
{
    unsigned char *rb;
    unsigned int head;
    unsigned int tail;
    unsigned int slot;

    if ((int)pkt <= 0) return;
    rb = g_1042e778;
    head = *(unsigned int *)(rb + 0x30000);
    tail = *(unsigned int *)(rb + 0x30004);
    if ((int)(0x30000u - head + tail - 0x2000u) < 0xc)
    {
        *(unsigned int *)(rb + 0x30008) = 0;
        return;
    }
    slot = head + (unsigned int)rb;
    head += 0xc;
    *(unsigned int *)(rb + 0x30000) = head;
    *(unsigned int *)(rb + 0x30008) = slot;
    *(unsigned short *)slot = 0x1d;
    *(unsigned short *)(slot + 2) = 0xc;
    *(unsigned int *)(slot + 4) = pkt;
}
