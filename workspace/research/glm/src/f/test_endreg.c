#define g_1042e778 (*(int **)0x1042E778)

void R_EndRegistration(void)
{
    int *b = g_1042e778;
    int total;
    int used;
    int space;

    total = b[0x30004 / 4];
    used = b[0x30000 / 4];
    space = 0x30000;
    space -= used;
    space += total;
    space -= 0x2000;
    if (space < 4) {
        b[0x30008 / 4] = 0;
        return;
    }
    b[0x30000 / 4] = used + 4;
    b[0x30008 / 4] = (int)((char *)b + used);
    *(unsigned short *)((char *)b + used) = 0x21;
    *(unsigned short *)((char *)b + used + 2) = 4;
}