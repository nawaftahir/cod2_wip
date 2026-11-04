/* 0x100fc07d: ensure descriptor idx initialized, then hand off */
extern unsigned __int64 tbl_101a4b28[];
extern unsigned int __cdecl Ensure_100fbfdd(unsigned int idx);
extern void __cdecl Die_100f7832(unsigned int code);
__declspec(dllimport) void __stdcall P_1010c030(void *rec);

void FUN_100fc07d(unsigned int idx)
{
    unsigned char *row;

    row = (unsigned char *)&tbl_101a4b28[idx];
    if (*(unsigned int *)row == 0)
    {
        if (Ensure_100fbfdd(idx) == 0)
        {
            Die_100f7832(0x11);
        }
    }
    P_1010c030((void *)*(unsigned int *)row);
}
