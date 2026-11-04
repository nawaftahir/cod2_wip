// 100a5849 size=63 FUN_100a5849

int FUN_100a5849(int param_1,undefined4 param_2,undefined4 param_3,undefined4 *param_4)

{
  int iVar1;
  int *in_ECX;
  
  iVar1 = FUN_100c41a7(param_1,param_2,param_3,param_4);
  if (-1 < iVar1) {
    iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
    if (iVar1 == 0x11) {
      *param_4 = 1;
    }
    iVar1 = 0;
  }
  return iVar1;
}


