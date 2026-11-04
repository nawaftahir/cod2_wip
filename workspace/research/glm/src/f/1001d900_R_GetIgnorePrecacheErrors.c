extern unsigned char g_ignorePrecacheErrors;

int R_GetIgnorePrecacheErrors(void)
{
    return g_ignorePrecacheErrors != 0;
}
