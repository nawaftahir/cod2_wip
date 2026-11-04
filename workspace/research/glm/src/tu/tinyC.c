/* 0x101077f1: bit-indexed record fetch */
extern unsigned int tbl_1076aca0[];
__declspec(dllimport) void __stdcall P_1010c03c(void *rec);

void FUN_101077f1(int bit)
{
    int b = bit & 0x1f;
    int w = tbl_1076aca0[bit >> 5];

    P_1010c03c((void *)(w + (b + b * 8) * 4 + 12));
}
