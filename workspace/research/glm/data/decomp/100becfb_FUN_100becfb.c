// 100becfb size=354 FUN_100becfb

int FUN_100becfb(void)

{
  uint uVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  uint uVar4;
  undefined1 local_fc [64];
  int local_bc [4];
  int aiStack_ac [4];
  int aiStack_9c [4];
  int aiStack_8c [28];
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  uint local_8;
  
  local_8 = 0;
  local_1c = 0;
  local_c = 0;
  uVar4 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_18 = 1;
  local_14 = 2;
  local_10 = 3;
  iVar2 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10118d78,local_fc,&local_8,local_bc,&local_1c
                       ,uVar4,1);
  if (iVar2 == 1) {
    local_c = 1;
    iVar2 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118df8,local_fc,&local_8,local_bc,
                         &local_1c,uVar4,1);
  }
  if (iVar2 == 0) {
    local_8 = 0;
    if (uVar4 != 0) {
      do {
        if (local_bc[local_8] != aiStack_ac[local_8]) {
          return 1;
        }
        if (aiStack_ac[local_8] != aiStack_9c[local_8]) {
          return 1;
        }
        if (local_bc[local_8] != aiStack_8c[local_8]) {
          return 1;
        }
        local_8 = local_8 + 1;
      } while (local_8 < uVar4);
    }
    if (local_c == 0) {
      uVar3 = uVar4 | 0x73800000;
    }
    else {
      uVar3 = uVar4 | 0x73700000;
    }
    **(uint **)(in_ECX + 0x100) = uVar3;
    local_c = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0);
    if (local_c == -1) {
      iVar2 = -0x7ff8fff2;
    }
    else {
      uVar3 = 0;
      if (uVar4 != 0) {
        local_8 = uVar4 << 2;
        do {
          uVar1 = local_8;
          local_8 = local_8 + 4;
          *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + uVar3 * 4) = local_bc[uVar3];
          uVar3 = uVar3 + 1;
          *(int *)(uVar1 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) = local_c;
        } while (uVar3 < uVar4);
      }
      iVar2 = 0;
    }
  }
  return iVar2;
}


