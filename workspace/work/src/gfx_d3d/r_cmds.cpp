// Renderer console commands.
#include "r_local.h"

void R_ScreenShot_f();
void R_ScreenShotJpeg_f();
void R_ImageList_f();
void R_ApplyPicmip();
void Material_ReloadTextures_f();
void R_LoadSun_f();
void R_SaveSun_f();
void R_StaticModelCacheStats_f();
void R_StaticModelCacheFlush_f();

// PINNED 10005290/5: the registered command is a separate tail call.
void R_ApplyPicmip_f()
{
    R_ApplyPicmip();
}

// PINNED 100052c0/151: every callback has real source in its owning module.
void R_RegisterCmds()
{
    ri.Cmd_AddCommand("screenshot", R_ScreenShot_f);
    ri.Cmd_AddCommand("screenshotJpeg", R_ScreenShotJpeg_f);
    ri.Cmd_AddCommand("imagelist", R_ImageList_f);
    ri.Cmd_AddCommand("r_applyPicmip", R_ApplyPicmip_f);
    ri.Cmd_AddCommand("reloadmaterialtextures", Material_ReloadTextures_f);
    ri.Cmd_AddCommand("r_loadsun", R_LoadSun_f);
    ri.Cmd_AddCommand("r_savesun", R_SaveSun_f);
    ri.Cmd_AddCommand("r_smc_stats", R_StaticModelCacheStats_f);
    ri.Cmd_AddCommand("r_smc_flush", R_StaticModelCacheFlush_f);
}

// PINNED 10005360: shutdown also removes the legacy vertex-cache command.
void R_UnregisterCmds()
{
    ri.Cmd_RemoveCommand("r_applyPicmip");
    ri.Cmd_RemoveCommand("r_vc_stats");
    ri.Cmd_RemoveCommand("screenshot");
    ri.Cmd_RemoveCommand("screenshotJpeg");
    ri.Cmd_RemoveCommand("imagelist");
    ri.Cmd_RemoveCommand("reloadmaterialtextures");
    ri.Cmd_RemoveCommand("r_loadsun");
    ri.Cmd_RemoveCommand("r_savesun");
    ri.Cmd_RemoveCommand("r_smc_stats");
    ri.Cmd_RemoveCommand("r_smc_flush");
}
