/* 0x1004d520: reset a material sub-object through its vtables */
extern unsigned char code_1004d460[];

void FUN_1004d520(unsigned int m)
{
    unsigned int sub;
    unsigned int vt;
    unsigned int *fpp;

    sub = *(unsigned int *)(m + 0x198);
    *(unsigned int *)sub = (unsigned int)code_1004d460;
    *(unsigned char *)(sub + 0x10) = 0;
    *(unsigned char *)(sub + 0x11) = 0;
    *(unsigned char *)(sub + 0x14) = 1;
    vt = *(unsigned int *)m;
    ((void (__cdecl *)(unsigned int))(*(unsigned int *)(vt + 0x10)))(m);
    fpp = (unsigned int *)*(unsigned int *)(m + 0x19c);
    ((void (__cdecl *)(unsigned int))*fpp)(m);
    *(unsigned int *)(m + 0x94) = 0;
}
