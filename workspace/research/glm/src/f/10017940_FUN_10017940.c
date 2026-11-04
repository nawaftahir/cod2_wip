extern void FUN_10060c10(char *buf, const char *fmt, ...);
extern void (*RI_FS_FreeFile)(char *buf, int param_1, int param_2);

void FUN_10017940(int param_1)
{
    char buf[64];
    FUN_10060c10(buf, "materials/%s", param_1);
    RI_FS_FreeFile(buf, param_1, 1);
}