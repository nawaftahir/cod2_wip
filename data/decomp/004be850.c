
void __thiscall FUN_004be850(int *param_1,undefined **param_2,uint param_3)

{
  char cVar1;
  int iVar2;
  char **ppcVar3;
  char *pcVar4;
  int iVar5;
  undefined *local_10;
  undefined4 local_c;
  char *local_8;
  int local_4;
  
  iVar2 = (int)param_2;
  if (*param_1 != 0) {
    if (*param_1 != 1) {
      *(undefined4 *)((int)param_2 + 4) = 0;
    }
    param_2 = (undefined **)0x0;
    if ((param_3 & 4) == 0) {
      param_2 = &local_10;
      local_10 = &DAT_00529cd8;
      local_c = 4;
    }
    iVar5 = *(int *)(param_1[2] + 8);
    if (0 < iVar5) {
      do {
        iVar5 = iVar5 + -1;
        if ((param_3 & 1) != 0) {
          FUN_004bf230(&DAT_00541fe4,1);
        }
        if ((param_2 == (undefined **)0x0) ||
           (ppcVar3 = (char **)FUN_004be3f0(param_2,iVar5), ppcVar3 == (char **)0x0)) {
          local_8 = *(char **)(param_1[2] + 0x10 + iVar5 * 8);
          pcVar4 = local_8;
          do {
            cVar1 = *pcVar4;
            pcVar4 = pcVar4 + 1;
          } while (cVar1 != '\0');
          local_4 = (int)pcVar4 - (int)(local_8 + 1);
          ppcVar3 = &local_8;
        }
        FUN_004c7cd0(iVar2,ppcVar3,*(undefined4 *)(param_1[2] + 4));
      } while (((iVar5 != 0) || ((param_3 & 2) != 0)) && (FUN_004bf230(&DAT_00546ae4,1), 0 < iVar5))
      ;
    }
  }
  return;
}

