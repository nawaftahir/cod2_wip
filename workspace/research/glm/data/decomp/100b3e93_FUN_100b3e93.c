// 100b3e93 size=133 FUN_100b3e93

undefined4 FUN_100b3e93(int param_1,uint *param_2,undefined4 *param_3,undefined4 *param_4)

{
  int iVar1;
  uint uVar2;
  int *in_ECX;
  undefined4 local_8;
  
  local_8 = 1;
  iVar1 = (**(code **)(*in_ECX + 0x54))(*(undefined4 *)(param_1 + 0x6c));
  uVar2 = (**(code **)(*in_ECX + 0x58))(*(undefined4 *)(param_1 + 0x6c));
  *param_2 = uVar2;
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
    *param_3 = 9;
  }
  else {
    if (iVar1 != 0xffff) {
      return 0x80004005;
    }
    *param_3 = 0;
    local_8 = 0;
  }
  if (param_4 != (undefined4 *)0x0) {
    *param_4 = local_8;
  }
  return 0;
}


