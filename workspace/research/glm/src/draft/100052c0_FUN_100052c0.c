extern int FUN_1000d940();


void FUN_100052c0(void)

{
  (*(void *)RI_Dvar_Reset)("screenshot",&LAB_100052a0);
  (*(void *)RI_Dvar_Reset)("screenshotJpeg",&LAB_100052b0);
  (*(void *)RI_Dvar_Reset)("imagelist",FUN_1000d940);
  (*(void *)RI_Dvar_Reset)("r_applyPicmip",&LAB_10005290);
  (*(void *)RI_Dvar_Reset)("reloadmaterialtextures",&LAB_100178b0);
  (*(void *)RI_Dvar_Reset)("r_loadsun",&LAB_10029010);
  (*(void *)RI_Dvar_Reset)("r_savesun",&LAB_100290f0);
  (*(void *)RI_Dvar_Reset)("r_smc_stats",&LAB_1002bb90);
  (*(void *)RI_Dvar_Reset)("r_smc_flush",&LAB_1002bbf0);
  return;
}


