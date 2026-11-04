
void __thiscall FUN_004bc130(int param_1,undefined4 param_2)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0x2018) == 0) {
    if (4 < DAT_00598cc8) {
      _printf("NetBuffer send compressing\n");
    }
    FUN_004bbfb0(param_2);
    iVar1 = FUN_004ff450(0x38);
    *(int *)(param_1 + 0x2018) = iVar1;
    *(undefined4 *)(iVar1 + 0x20) = 0;
    *(undefined4 *)(*(int *)(param_1 + 0x2018) + 0x24) = 0;
    *(undefined4 *)(*(int *)(param_1 + 0x2018) + 0x28) = 0;
    iVar1 = FUN_004ad1c0(*(undefined4 *)(param_1 + 0x2018),0xffffffff,8,0xfffffff1,8,0,"1.1.4",0x38)
    ;
    if (iVar1 != 0) {
      FUN_004becd0(&DAT_0056340c);
      return;
    }
    *(int *)(*(int *)(param_1 + 0x2018) + 0xc) = param_1 + 0x14;
    *(undefined4 *)(*(int *)(param_1 + 0x2018) + 0x10) = 0x1000;
  }
  return;
}

