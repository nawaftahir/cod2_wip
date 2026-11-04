// 100c0224 size=334 FUN_100c0224

int FUN_100c0224(void)

{
  int iVar1;
  uint uVar2;
  int in_ECX;
  uint uVar3;
  uint uVar4;
  undefined1 local_100 [16];
  int aiStack_f0 [4];
  int aiStack_e0 [32];
  undefined1 local_60 [64];
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  int local_10;
  uint local_c;
  int local_8;
  
  local_8 = 0;
  local_20 = 0;
  local_10 = 0;
  uVar4 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_1c = 1;
  local_18 = 2;
  local_14 = 3;
  iVar1 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10119138,local_60,&local_8,local_100,
                       &local_20,uVar4,1);
  if (iVar1 == 1) {
    local_10 = 1;
    iVar1 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10119198,local_60,&local_8,local_100,
                         &local_20,uVar4,1);
  }
  if (iVar1 == 0) {
    local_c = 0;
    if (uVar4 != 0) {
      local_8 = uVar4 << 2;
      do {
        if (aiStack_f0[local_c] != aiStack_e0[local_c]) {
          return 1;
        }
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) +
                        *(int *)(local_8 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) * 4);
        if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 5) & 1) == 0) {
          return 1;
        }
        if (*(double *)(iVar1 + 0x20) != 0.0) {
          return 1;
        }
        if (*(int *)(iVar1 + 8) != -1) {
          return 1;
        }
        local_c = local_c + 1;
        local_8 = local_8 + 4;
      } while (local_c < uVar4);
    }
    uVar2 = 0;
    if (local_10 == 0) {
      uVar3 = uVar4 | 0x74500000;
    }
    else {
      uVar3 = uVar4 | 0x74400000;
    }
    **(uint **)(in_ECX + 0x100) = uVar3;
    if (uVar4 != 0) {
      do {
        *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + uVar2 * 4) = aiStack_f0[uVar2];
        uVar2 = uVar2 + 1;
      } while (uVar2 < uVar4);
    }
    iVar1 = 0;
  }
  return iVar1;
}


