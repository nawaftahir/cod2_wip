/* 0x100fbfb0: indexed descriptor handoff */
extern unsigned char tbl_101a4b28[];
__declspec(dllimport) void __stdcall P_1010c03c(void *rec);

void FUN_100fbfb0(int idx)
{
    P_1010c03c((void *)*(unsigned int *)(tbl_101a4b28 + idx * 8));
}
