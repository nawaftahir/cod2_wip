// 1009bdcd size=280 FUN_1009bdcd

int FUN_1009bdcd(int param_1,undefined4 param_2,undefined8 param_3,undefined4 param_4)

{
  int iVar1;
  int iVar2;
  int local_8;
  
  local_8 = 2;
  if (param_1 == 0) {
    local_8 = 0;
  }
  else if (0 < param_1) {
    if (param_1 < 5) {
      local_8 = 1;
    }
    else if (param_1 < 9) {
      local_8 = 2;
    }
    else if (param_1 < 0xd) {
      local_8 = 3;
    }
  }
  iVar1 = FUN_1006506e(0x50);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10083255(0,0,0,0,1,param_4);
  }
  if (iVar1 == 0) {
    return 0;
  }
  iVar2 = FUN_1006506e(0x24);
  if (iVar2 == 0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_10082e36(0,param_1,1,1,0x200);
  }
  *(int *)(iVar1 + 0x10) = iVar2;
  if (iVar2 == 0) {
    return 0;
  }
  iVar2 = FUN_1006506e(0x40);
  if (local_8 == 3) {
    if (iVar2 != 0) {
      iVar2 = FUN_100833d8(3,param_3,param_4);
      goto LAB_1009bea2;
    }
  }
  else if (iVar2 != 0) {
    iVar2 = FUN_100833a3(local_8,param_2,param_4);
    goto LAB_1009bea2;
  }
  iVar2 = 0;
LAB_1009bea2:
  *(int *)(iVar1 + 0x20) = iVar2;
  if (iVar2 != 0) {
    iVar2 = FUN_1006506e(0x14);
    if (iVar2 == 0) {
      iVar2 = 0;
    }
    else {
      iVar2 = FUN_10082872(*(undefined4 *)(iVar1 + 0x20),0,"Value");
    }
    if (iVar2 != 0) {
      *(int *)(iVar1 + 0x20) = iVar2;
      FUN_1009a568(iVar1);
      return iVar1;
    }
  }
  return 0;
}


