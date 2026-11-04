/* 0x10099913: list peek */
int __fastcall Peek10099913(unsigned char *p)
{
    unsigned int n;

    n = *(unsigned int *)(p + 0x14);
    if (n == 0) return 0;
    return *(int *)(n + 8);
}
