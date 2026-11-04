// 100257a0 size=371 R_ResetSunLightOverride

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_ResetSunLightOverride(int param_1)

{
  int iVar1;
  undefined4 uStack_8;
  undefined1 uStack_4;
  
  if (DAT_101d4d00 != '\0') {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","====== R_RenderScene ======\n");
      _fflush(DAT_10764584);
    }
    if (*(char *)(DAT_101ce600 + 8) == '\0') {
      if (DAT_101d1b9c == 0) {
        FUN_100138c0(1,&DAT_10196c8c);
      }
      DAT_10678504 = *(int *)(param_1 + 0x48);
      _DAT_10678508 = (float)DAT_10678504 * 0.001;
      DAT_101d4d04 = *(undefined4 *)(param_1 + 0x18);
      _DAT_101d4d08 = *(undefined4 *)(param_1 + 0x1c);
      _DAT_101d4d0c = *(undefined4 *)(param_1 + 0x20);
      _DAT_101d4d10 = *(undefined4 *)(param_1 + 0x24);
      _DAT_101d4d14 = *(undefined4 *)(param_1 + 0x28);
      _DAT_101d4d18 = *(undefined4 *)(param_1 + 0x2c);
      iVar1 = *(int *)(DAT_101da9c8 + 0x217c7c) * 0x14c + 0x217c80 + DAT_101da9c8;
      *(int *)(DAT_101da9c8 + 0x217c7c) = *(int *)(DAT_101da9c8 + 0x217c7c) + 1;
      FUN_10025570(param_1);
      uStack_8 = *(undefined4 *)(param_1 + 0x50);
      if ((*(int *)(param_1 + 8) != DAT_101d4c6c) ||
         (uStack_4 = 1, *(int *)(param_1 + 0xc) != DAT_101d4c70)) {
        uStack_4 = 0;
      }
      FUN_10024080();
      FUN_10025380(*(undefined4 *)(param_1 + 0x54),iVar1,&uStack_8);
      if ((*(int *)(DAT_101ce824 + 8) != 0) && (*(int *)(DAT_101ce824 + 8) < DAT_1067850c)) {
        (*(code *)RI_Dvar_SetBool)(DAT_101ce824,0);
        FUN_10023920();
      }
    }
  }
  return;
}


