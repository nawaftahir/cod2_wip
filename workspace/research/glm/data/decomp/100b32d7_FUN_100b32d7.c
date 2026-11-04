// 100b32d7 size=314 FUN_100b32d7

undefined4 FUN_100b32d7(int *param_1,uint param_2,uint *param_3,int param_4)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  uint uVar4;
  bool bVar5;
  uint local_8;
  
  uVar4 = 0;
  local_8 = 0;
  if (param_4 == 0) {
    if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x14) + *param_1 * 4) + 0x3d) & 2) != 0) {
      local_8 = 0x100000;
    }
    if (param_2 != 0) {
      do {
        iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1[uVar4] * 4) + 0x10);
        uVar3 = 0;
        if (iVar2 == 0) {
          uVar3 = 0x10000;
        }
        else if (iVar2 == 1) {
          uVar3 = 0x20000;
        }
        else if (iVar2 == 2) {
          uVar3 = 0x40000;
        }
        else if (iVar2 == 3) {
          uVar3 = 0x80000;
        }
        if ((local_8 & uVar3) != 0) {
          FUN_1008b0b5();
        }
        local_8 = local_8 | uVar3;
        uVar4 = uVar4 + 1;
      } while (uVar4 < param_2);
    }
  }
  else {
    local_8 = 0xf0000;
  }
  if ((*(uint *)(in_ECX + 0xcc) & 0x20) == 0) {
    uVar4 = 0;
    bVar5 = param_2 == 0;
    if (param_2 != 0) {
      do {
        iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_1[uVar4] * 4);
        if (((*(byte *)(iVar2 + 3) & 2) == 0) &&
           ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4) + 4) & 1) == 0
             || (*(int *)(iVar2 + 0x48) == -1)) || (*(int *)(iVar2 + 0x54) != -1)))) break;
        uVar4 = uVar4 + 1;
      } while (uVar4 < param_2);
      bVar5 = uVar4 == param_2;
    }
    if (!bVar5) goto LAB_100b33c6;
  }
  local_8 = local_8 | 0x200000;
LAB_100b33c6:
  if ((((*(byte *)(in_ECX + 0xcc) & 1) != 0) && (uVar4 = 0, *(int *)(in_ECX + 0x124) != 0)) &&
     (param_2 != 0)) {
    do {
      piVar1 = param_1 + uVar4;
      iVar2 = uVar4 + *(int *)(in_ECX + 0x128) * 6;
      uVar4 = uVar4 + 1;
      *(int *)(*(int *)(in_ECX + 0x124) + -0x10 + iVar2 * 4) = *piVar1;
    } while (uVar4 < param_2);
  }
  *param_3 = local_8;
  return 0;
}


