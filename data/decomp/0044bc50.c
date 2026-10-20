
void __fastcall FUN_0044bc50(int param_1,char *param_2)

{
  int iVar1;
  char cVar2;
  int *piVar3;
  int iVar4;
  undefined4 uVar5;
  char *pcVar6;
  int unaff_EDI;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_0052522b;
  local_10 = ExceptionList;
  for (piVar3 = *(int **)(param_1 + 0xf0); piVar3 != (int *)0x0; piVar3 = (int *)piVar3[2]) {
    if (*piVar3 == unaff_EDI) {
      if (param_2 != (char *)0x0) {
        pcVar6 = param_2;
        do {
          cVar2 = *pcVar6;
          pcVar6 = pcVar6 + 1;
        } while (cVar2 != '\0');
        ExceptionList = &local_10;
        FUN_00402b30(param_2,(int)pcVar6 - (int)(param_2 + 1));
        ExceptionList = local_10;
        return;
      }
      ExceptionList = &local_10;
      FUN_00402b30(0,0);
      ExceptionList = local_10;
      return;
    }
  }
  iVar1 = param_1 + 0xe8;
  iVar4 = *(int *)(param_1 + 0xf0);
  while (iVar4 != 0) {
    iVar1 = *(int *)(iVar1 + 8);
    iVar4 = *(int *)(iVar1 + 8);
  }
  ExceptionList = &local_10;
  iVar4 = FUN_004ff450(0xc);
  local_8 = 0;
  if (iVar4 == 0) {
    *(undefined4 *)(iVar1 + 8) = 0;
    ExceptionList = local_10;
    return;
  }
  uVar5 = FUN_004534b0(iVar4,unaff_EDI);
  *(undefined4 *)(iVar1 + 8) = uVar5;
  ExceptionList = local_10;
  return;
}

