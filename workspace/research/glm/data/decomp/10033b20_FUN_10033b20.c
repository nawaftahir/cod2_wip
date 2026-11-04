// 10033b20 size=256 FUN_10033b20

void FUN_10033b20(void)

{
  int iVar1;
  undefined4 uVar2;
  
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
    _fprintf(DAT_10764584,"%s","***************** RB_SwapBuffers *****************\n\n\n");
    _fflush(DAT_10764584);
  }
  iVar1 = (**(code **)(*(int *)(&DAT_101d4940)[DAT_101d4934 * 4] + 0xc))
                    ((int *)(&DAT_101d4940)[DAT_101d4934 * 4],0,0,0,0,0);
  if (iVar1 < 0) {
    if (iVar1 != -0x7789f798) {
      uVar2 = FUN_100efe3c(iVar1);
      FUN_100138c0(0,"Direct3DDevice9::Present failed: %s\n",uVar2);
    }
    DAT_101d492c = 1;
    FUN_1002baf0();
  }
  *DAT_101d497c = 0;
  DAT_1072debd = 0;
  FUN_10037890();
  if ((*(char *)(DAT_101ce62c + 7) != '\0') || (*(char *)(DAT_101ce6f8 + 7) != '\0')) {
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce62c);
    (*(code *)RI_Dvar_IsAtDefaultValue)(DAT_101ce6f8);
    if ((*(char *)(DAT_101ce6f8 + 8) == '\0') && (DAT_101d4c94 != '\0')) {
      FUN_10011f10();
      FUN_100307e0();
    }
  }
  return;
}


