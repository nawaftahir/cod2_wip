/* 0x10013200: material table entry -> active-material sync */
extern int tbl_10696cb8[];
extern int g_10696cc8;
extern unsigned char g_10696cb0;
extern void __cdecl Sub_10020f70(int a);
extern int __cdecl Sub_10020f10(void);

void FUN_10013200(int idx)
{
    int v;

    v = tbl_10696cb8[idx];
    if (v != -1)
    {
        Sub_10020f70(v);
    }
    if (g_10696cc8 == -1)
    {
        g_10696cb0 = 1;
        g_10696cc8 = Sub_10020f10();
    }
    if (g_10696cb0 != 0)
    {
        Sub_10020f70(g_10696cc8);
        g_10696cb0 = 0;
    }
}
