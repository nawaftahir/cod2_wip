// 100c41a7 size=333 FUN_100c41a7

int FUN_100c41a7(int param_1,uint *param_2,undefined4 param_3,undefined4 *param_4)

{
  uint uVar1;
  int iVar2;
  int *in_ECX;
  uint local_c;
  uint local_8;
  
  local_c = 0;
  local_8 = 0;
  if (param_4 != (undefined4 *)0x0) {
    *param_4 = 0;
  }
  iVar2 = *(int *)(param_1 + 4);
  if (in_ECX[0x22] == iVar2) {
    local_8 = *(uint *)(param_1 + 0xc);
    local_c = 0;
    if ((uint)in_ECX[0xb] <= local_8) {
LAB_100c4287:
      FUN_1008b0b5();
      return -0x7789f4a7;
    }
    uVar1 = in_ECX[0x14];
    if ((uVar1 != 0) && (uVar1 <= local_8)) {
      local_8 = local_8 - uVar1;
      local_c = 3;
    }
  }
  else if (in_ECX[0x23] == iVar2) {
    local_8 = *(uint *)(param_1 + 0xc);
    local_c = 3;
    if (local_8 != 0) goto LAB_100c4287;
  }
  else if (in_ECX[0x21] == iVar2) {
    iVar2 = (**(code **)(*in_ECX + 0x84))(param_1,&local_8,&local_c,param_4);
    if (iVar2 < 0) {
      return -0x7fffbffb;
    }
  }
  else {
    if (in_ECX[0x24] != iVar2) {
      FUN_1008b0b5();
      return -0x7fffbffb;
    }
    local_8 = *(uint *)(param_1 + 0xc);
    local_c = 0x13;
    if ((uint)in_ECX[0xd] <= local_8) goto LAB_100c4287;
  }
  if (param_2 != (uint *)0x0) {
    *param_2 = ((local_c | 0xfffffff8) << 0x14 | local_c & 0x18) << 8 | local_8 & 0x7ff;
  }
  iVar2 = (**(code **)(*in_ECX + 0x7c))(param_1,param_3);
  if (-1 < iVar2) {
    iVar2 = 0;
  }
  return iVar2;
}


