extern int g_101ce5c0;              /* 0x101ce5c0 */
extern char FUN_10007e80(void);

int FUN_10009700(void)
{
    int i;
    int n;

    n = g_101ce5c0;
    i = 0;
    if (n > 0)
    {
        do {
            if (FUN_10007e80() != 0)
            {
                return 1;
            }
            i += 1;
        } while (i < n);
    }
    return 0;
}
