/* R_FinishLoadingModels — queue finish callback when RI active */
extern int *g_pRI;                                           /* 0x101ce648 */
extern void (__cdecl *g_riSyncCmd)(int, void *, int, int);   /* 0x101d4b80 */

void FUN_10020380(void);

void R_FinishLoadingModels(void)
{
    int *ri = g_pRI;
    if (ri[2] == 0)
        return;
    g_riSyncCmd(1, (void *)FUN_10020380, 0, 1);
}
