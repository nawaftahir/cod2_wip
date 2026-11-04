// 100a4d7f size=108 FUN_100a4d7f

undefined4 FUN_100a4d7f(int param_1,undefined4 *param_2,undefined4 *param_3)

{
  int iVar1;
  undefined4 uVar2;
  int *in_ECX;
  
  iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
  if (iVar1 == 0xffff) {
    *param_3 = 0;
    uVar2 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
  }
  else {
    if (iVar1 == 0x11) {
      *param_3 = 0x11;
      *param_2 = 1;
      return 0;
    }
    if (iVar1 == 0x12) {
      *param_3 = 0x11;
      *param_2 = 0;
      return 0;
    }
    *param_3 = 1;
    uVar2 = *(undefined4 *)(param_1 + 0xc);
  }
  *param_2 = uVar2;
  return 0;
}


