typedef void (__cdecl *dispatch_t)(unsigned int);
__declspec(dllimport) void __cdecl imp_1010c030(unsigned int);
void probe(char *p)
{
    (*(dispatch_t)0) ; /* placeholder */
    imp_1010c030((unsigned int)p + 0x20);
}
