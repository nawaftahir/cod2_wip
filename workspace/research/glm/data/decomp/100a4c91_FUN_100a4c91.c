// 100a4c91 size=238 FUN_100a4c91

undefined4 FUN_100a4c91(int param_1,uint *param_2,undefined4 *param_3,undefined4 *param_4)

{
  int iVar1;
  uint uVar2;
  int *in_ECX;
  undefined4 uVar3;
  
  iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
  uVar2 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
  *param_2 = uVar2;
  if ((*(byte *)(in_ECX + 0x1c) & 0x40) == 0) {
    uVar3 = 0;
    if (iVar1 == 0xb) {
      if (3 < uVar2) {
        return 0x80004005;
      }
      *param_3 = 8;
    }
    else if (iVar1 == 0xd) {
      if (uVar2 != 0) {
        return 0x80004005;
      }
      uVar3 = 1;
      *param_3 = 9;
    }
    else if (iVar1 == 0x11) {
      if (uVar2 != 0) {
        return 0x80004005;
      }
      *param_3 = 0x11;
      *param_2 = 1;
    }
    else if (iVar1 == 0x12) {
      if (uVar2 != 0) {
        return 0x80004005;
      }
      *param_3 = 0x11;
      *param_2 = 0;
    }
    else {
      if (iVar1 != 0xffff) {
        return 0x80004005;
      }
      *param_3 = 0;
      uVar3 = 0;
    }
    if (param_4 == (undefined4 *)0x0) {
      return 0;
    }
    *param_4 = uVar3;
    return 0;
  }
  if (param_4 != (undefined4 *)0x0) {
    *param_4 = 0;
  }
  if (iVar1 == 5) {
    if ((*param_2 != 0) || (param_4 == (undefined4 *)0x0)) goto LAB_100a4ced;
    *param_4 = 1;
  }
  if (iVar1 == 0xffff) {
    *param_3 = 0;
    return 0;
  }
LAB_100a4ced:
  *param_3 = 6;
  *param_2 = *(uint *)(param_1 + 0xc);
  return 0;
}


