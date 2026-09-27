extern int renderer_min_spec_image_memory;
extern unsigned char renderer_ignore_precache_errors;

int R_GetMinSpecImageMemory(void)
{
    return renderer_min_spec_image_memory;
}

void R_SetIgnorePrecacheErrors(int enable)
{
    renderer_ignore_precache_errors = (enable != 0);
}

int R_GetIgnorePrecacheErrors(void)
{
    return renderer_ignore_precache_errors != 0;
}
