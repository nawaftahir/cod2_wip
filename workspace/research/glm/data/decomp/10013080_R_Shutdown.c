// 10013080 size=379 R_Shutdown

void R_Shutdown(int param_1)

{
  int *piVar1;
  int iVar2;
  undefined4 *puVar3;
  
  DAT_101d4d00 = 0;
  if (((DAT_101d1bf8 != 0) && (DAT_101d492c == '\0')) &&
     ((DAT_10766750 != 0 || ((DAT_10766754 != 0 || (DAT_10766758 != 0)))))) {
    FUN_1003ed20(0);
  }
  FUN_10005820();
  FUN_10005820();
  FUN_10037790();
  DAT_101d7eb0 = 0;
  if (DAT_101d1b9c != 0) {
    piVar1 = *(int **)(DAT_101d1b9c + 0x30);
    if (piVar1 != (int *)0x0) {
      do {
        (**(code **)(*piVar1 + 8))(piVar1);
        piVar1 = (int *)0x0;
      } while (DAT_1076a830 != 0);
      *(undefined4 *)(DAT_101d1b9c + 0x30) = 0;
    }
    DAT_101d1b9c = 0;
  }
  DAT_1076a82c = 0;
  (*(code *)RI_DObjBad)(1,FUN_10020330,0,1);
  FUN_10017540();
  puVar3 = &DAT_101d7fc8;
  for (iVar2 = 0xa67; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  puVar3 = &DAT_101d4d28;
  for (iVar2 = 0x400; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  DAT_101d0b04 = 0;
  FUN_1000cd10();
  DAT_101d1b9c = 0;
  FUN_1001e540();
  FUN_1002baf0();
  if (param_1 != 0) {
    FUN_10012db0();
    (*(code *)RI_Dvar_RegisterVec4)(0x2000);
  }
  (*(code *)RI_Cmd_AddCommand)("r_applyPicmip");
  (*(code *)RI_Cmd_AddCommand)("r_vc_stats");
  (*(code *)RI_Cmd_AddCommand)("screenshot");
  (*(code *)RI_Cmd_AddCommand)("screenshotJpeg");
  (*(code *)RI_Cmd_AddCommand)("imagelist");
  (*(code *)RI_Cmd_AddCommand)("reloadmaterialtextures");
  (*(code *)RI_Cmd_AddCommand)("r_loadsun");
  (*(code *)RI_Cmd_AddCommand)("r_savesun");
  (*(code *)RI_Cmd_AddCommand)("r_smc_stats");
  (*(code *)RI_Cmd_AddCommand)("r_smc_flush");
  return;
}


