
void __fastcall FUN_004bbf00(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0x2014) == 0) {
    if (4 < DAT_00598cc8) {
      _printf("NetBuffer recv compressing\n");
    }
    iVar1 = FUN_004ff450(0x38);
    *(int *)(param_1 + 0x2014) = iVar1;
    *(undefined4 *)(iVar1 + 0x20) = 0;
    *(undefined4 *)(*(int *)(param_1 + 0x2014) + 0x24) = 0;
    *(undefined4 *)(*(int *)(param_1 + 0x2014) + 0x28) = 0;
    iVar1 = FUN_004b01d0(*(undefined4 *)(param_1 + 0x2014),0xfffffff1,"1.1.4",0x38);
    if (iVar1 != 0) {
      FUN_004becd0(&DAT_0056341c);
      return;
    }
    **(undefined4 **)(param_1 + 0x2014) = *(undefined4 *)(param_1 + 0xc);
    *(int *)(*(int *)(param_1 + 0x2014) + 4) = *(int *)(param_1 + 0x10) - *(int *)(param_1 + 0xc);
  }
  return;
}

