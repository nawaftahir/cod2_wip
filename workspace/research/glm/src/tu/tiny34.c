/* 0x100fe85d: two-step dynamic import resolution + invoke */
extern void J_100fe81d(void);
extern char s_1017ce2c[];
extern char s_1017ce10[];
__declspec(dllimport) int __stdcall imp_1010c07c(const char *);
__declspec(dllimport) int __stdcall imp_1010c04c(int, const char *);

void FUN_100fe85d(void)
{
    int a;

    a = imp_1010c07c(s_1017ce2c);
    if (a == 0) goto fail;
    a = imp_1010c04c(a, s_1017ce10);
    if (a == 0) goto fail;
    ((void (__stdcall *)(int))a)(0);
    return;
fail:
    J_100fe81d();
}
