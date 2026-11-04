// 100b3e25 size=110 FUN_100b3e25

undefined4 FUN_100b3e25(int param_1,uint *param_2,undefined4 *param_3)

{
  int iVar1;
  uint uVar2;
  int *in_ECX;
  
  iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
  uVar2 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
  *param_2 = uVar2;
  if (iVar1 == 0xb) {
    if ((uint)in_ECX[10] <= uVar2) {
      return 0x80004005;
    }
    *param_3 = 1;
  }
  else if (iVar1 == 6) {
    if (7 < uVar2) {
      return 0x80004005;
    }
    *param_3 = 3;
  }
  else {
    if (iVar1 != 0xffff) {
      return 0x80004005;
    }
    *param_3 = 0;
  }
  return 0;
}


