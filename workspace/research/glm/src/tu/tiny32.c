/* 0x100fb4b9 / 0x100fb50b: client-blob index dispatch.
 * Returning the callee's value keeps cl from tail-jumping the
 * import slot - reproduces pe's call+ret shape. */
extern int __cdecl FUN_100fc07d(int idx);
__declspec(dllimport) int __cdecl imp_1010c030(unsigned int);

int FUN_100fb4b9(char *p)
{
    unsigned int b;
    int r;

    b = 0x101a48a0u;
    if ((unsigned int)p < b) goto slow;
    if ((unsigned int)p > 0x101a4b00u) goto slow;
    r = FUN_100fc07d((((unsigned int)p - b) >> 5) + 0x10);
    goto done;
slow:
    r = imp_1010c030((unsigned int)p + 0x20);
done:
    return r;
}

int FUN_100fb50b(char *p)
{
    unsigned int b;
    int r;

    b = 0x101a48a0u;
    if ((unsigned int)p < b) goto slow;
    if ((unsigned int)p > 0x101a4b00u) goto slow;
    r = FUN_100fc07d((((unsigned int)p - b) >> 5) + 0x10);
    goto done;
slow:
    r = imp_1010c030((unsigned int)p + 0x20);
done:
    return r;
}
