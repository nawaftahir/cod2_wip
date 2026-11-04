// 100b5efd size=194 FUN_100b5efd

undefined4 FUN_100b5efd(int param_1,uint *param_2,undefined4 *param_3,undefined4 *param_4)

{
  int iVar1;
  uint uVar2;
  int *in_ECX;
  
  iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
  uVar2 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
  *param_2 = uVar2;
  if (param_4 != (undefined4 *)0x0) {
    *param_4 = 0;
  }
  if (iVar1 == 1) {
    if (*param_2 != 0) {
      return 0x80004005;
    }
    *param_3 = 4;
    *param_2 = 0;
    return 0;
  }
  if (iVar1 == 5) {
    if (*param_2 != 0) {
      return 0x80004005;
    }
    *param_3 = 4;
    *param_2 = 2;
  }
  else {
    if (iVar1 != 0xc) {
      if (iVar1 == 0xb) {
        if (1 < *param_2) {
          return 0x80004005;
        }
        *param_3 = 5;
        return 0;
      }
      if (iVar1 == 6) {
        if (*param_2 < 8) {
          *param_3 = 6;
          return 0;
        }
        return 0x80004005;
      }
      if (iVar1 != 0xffff) {
        return 0x80004005;
      }
      *param_3 = 0;
      return 0;
    }
    if (*param_2 != 0) {
      return 0x80004005;
    }
    *param_3 = 4;
    *param_2 = 1;
  }
  if (param_4 != (undefined4 *)0x0) {
    *param_4 = 1;
  }
  return 0;
}


