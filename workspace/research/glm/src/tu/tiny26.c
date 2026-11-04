/* 0x100fb0db: stdcall one-arg import forwarder */
__declspec(dllimport) int __stdcall F_1010c10c(unsigned int a);

void __stdcall FUN_100fb0db(unsigned int a)
{
    F_1010c10c(a);
}
