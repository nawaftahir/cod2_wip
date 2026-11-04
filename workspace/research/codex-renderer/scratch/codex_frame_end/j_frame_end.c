extern unsigned char renderer_registered;
extern unsigned char *renderer_front_end_data;
extern void *renderer_temp_skin_buffer;
extern int renderer_temp_skin_bytes;
extern void (*renderer_update_debug_data)(void);
extern void (*renderer_virtual_decommit)(void *buffer, int bytes);
extern void RB_AdaptiveGpuSyncTarget(void);
extern void R_UnlockSkinnedCache(void);
extern void R_TransferDebugGlobals(void *data);
extern void Renderer_SubmitFrame(void);

void R_EndFrame(void)
{
    if (renderer_registered)
    {
        RB_AdaptiveGpuSyncTarget();
        R_UnlockSkinnedCache();
        renderer_update_debug_data();
        R_TransferDebugGlobals(renderer_front_end_data + 0x249d18);
        Renderer_SubmitFrame();
        if (renderer_temp_skin_bytes)
        {
            renderer_virtual_decommit(renderer_temp_skin_buffer, renderer_temp_skin_bytes);
            renderer_temp_skin_bytes = 0;
        }
    }
}
