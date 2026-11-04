extern unsigned char g_ignorePrecacheErrors;   /* 0x101d4d02 */

void R_SetIgnorePrecacheErrors(int enable)
{
    g_ignorePrecacheErrors = (enable != 0);
}
