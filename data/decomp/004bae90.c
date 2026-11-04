
undefined4 __thiscall FUN_004bae90(int param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 uVar2;
  
  if ((*(int *)(param_1 + 0x30) < 2) && (*(int *)(param_1 + 0x3c) < 2)) {
    FUN_004be1e0(&DAT_0054c28c,param_2);
    if (0 < DAT_00598cdc) {
      _printf("Rpc invoking %s\n",param_2);
    }
    iVar1 = *(int *)(param_1 + 0x10);
    if (*(int *)(iVar1 + 0xc) != 0) {
      FUN_004bbb40();
    }
    FUN_004bc8c0(iVar1,(int *)(param_1 + 0x30));
    if (*(int *)(param_1 + 0x30) < 2) {
      iVar1 = *(int *)(param_1 + 0x10);
      uVar2 = *(undefined4 *)(iVar1 + 4);
      *(undefined4 *)(iVar1 + 0xc) = 0;
      *(undefined4 *)(iVar1 + 4) = 0;
      return uVar2;
    }
  }
  else {
    iVar1 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar1 + 0xc) = 0;
    *(undefined4 *)(iVar1 + 4) = 0;
  }
  return 0;
}

