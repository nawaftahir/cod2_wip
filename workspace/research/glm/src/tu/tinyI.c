/* 0x100f5d7e: string->number scan setup (_stscanf family). Builds the
 * {ptr,res,width,tag} block, measures via helper, feeds _input. */
extern int __cdecl P_100fa200(char *s);
extern int __cdecl P_100f9482(char *blk, const char *fmt, char *va);

void FUN_100f5d7e(char *buf, const char *fmt, ...)
{
    unsigned int blk[8];
    char *va;

    blk[3] = 0x49;
    blk[2] = (unsigned int)buf;
    blk[0] = (unsigned int)buf;
    blk[1] = (unsigned int)P_100fa200(buf);
    va = (char *)&fmt + 4;
    P_100f9482((char *)blk, fmt, va);
}
