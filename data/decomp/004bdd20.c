
undefined4 __thiscall FUN_004bdd20(int *param_1,FILE *param_2)

{
  int iVar1;
  int *unaff_ESI;
  int iVar2;
  int *local_28;
  undefined1 local_24 [4];
  char *pcStack_20;
  undefined4 local_1c;
  undefined4 uStack_18;
  
  iVar2 = 0;
  local_28 = param_1;
  iVar1 = (**(code **)(*param_1 + 0x10))(0,&local_1c,local_24);
  while (iVar1 != 0) {
    iVar2 = iVar2 + 1;
    uStack_18 = 0;
    local_1c = 0;
    pcStack_20 = &DAT_00598c80;
    FUN_004bf2e0(&local_28);
    FUN_004bf280(&DAT_00529ca8);
    FUN_004bf2e0(&stack0xffffffd0);
    FUN_004bf280(&DAT_00546ae4);
    _fprintf(param_2,pcStack_20);
    if (pcStack_20 != &DAT_00598c80) {
      _free(pcStack_20);
    }
    iVar1 = (**(code **)(*unaff_ESI + 0x10))(iVar2,&local_28,&stack0xffffffd0);
  }
  return 1;
}

