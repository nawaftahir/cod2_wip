extern unsigned int DAT_101d0b04;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d492c;
extern unsigned int DAT_101d4d00;
extern unsigned int DAT_101d4d28;
extern unsigned int DAT_101d7eb0;
extern unsigned int DAT_101d7fc8;
extern unsigned int DAT_10766750;
extern unsigned int DAT_10766754;
extern unsigned int DAT_10766758;
extern unsigned int DAT_1076a82c;
extern unsigned int DAT_1076a830;
extern int FUN_10005820();
extern int FUN_1000cd10();
extern int FUN_10012db0();
extern int FUN_10017540();
extern int FUN_1001e540();
extern int FUN_10020330();
extern int FUN_1002baf0();
extern int FUN_10037790();
extern int FUN_1003ed20();


void R_Shutdown(int param_1)

{
  int *piVar1;
  int iVar2;
  unsigned int *puVar3;
  
  DAT_101d4d00 = 0;
  if (((DAT_101d1bf8 != 0) && (DAT_101d492c == '\0')) &&
     ((DAT_10766750 != 0 || ((DAT_10766754 != 0 || (DAT_10766758 != 0)))))) {
    FUN_1003ed20(0);
  }
  FUN_10005820();
  FUN_10005820();
  FUN_10037790();
  DAT_101d7eb0 = 0;
  if (g_101d1b9c != 0) {
 
	int g_101d1b9c = DAT_101d1b9c;   piVar1 = *(int **)(g_101d1b9c + 0x30);
    if (piVar1 != (int *)0x0) {
      do {
        (**(void **)(*piVar1 + 8))(piVar1);
        piVar1 = (int *)0x0;
      } while (DAT_1076a830 != 0);
      *(unsigned int *)(g_101d1b9c + 0x30) = 0;
    }
    g_101d1b9c = 0;
  }
  DAT_1076a82c = 0;
  (*(void *)RI_DObjBad)(1,FUN_10020330,0,1);
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
  g_101d1b9c = 0;
  FUN_1001e540();
  FUN_1002baf0();
  if (param_1 != 0) {
    FUN_10012db0();
    (*(void *)RI_Dvar_RegisterVec4)(0x2000);
  }
  (*(void *)RI_Cmd_AddCommand)("r_applyPicmip");
  (*(void *)RI_Cmd_AddCommand)("r_vc_stats");
  (*(void *)RI_Cmd_AddCommand)("screenshot");
  (*(void *)RI_Cmd_AddCommand)("screenshotJpeg");
  (*(void *)RI_Cmd_AddCommand)("imagelist");
  (*(void *)RI_Cmd_AddCommand)("reloadmaterialtextures");
  (*(void *)RI_Cmd_AddCommand)("r_loadsun");
  (*(void *)RI_Cmd_AddCommand)("r_savesun");
  (*(void *)RI_Cmd_AddCommand)("r_smc_stats");
  (*(void *)RI_Cmd_AddCommand)("r_smc_flush");
  return;
}


