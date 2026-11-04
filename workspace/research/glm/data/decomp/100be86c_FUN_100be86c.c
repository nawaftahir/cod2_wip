// 100be86c size=602 FUN_100be86c

int FUN_100be86c(void)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  int iVar3;
  uint uVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  undefined1 local_10c [64];
  undefined4 local_cc [4];
  int local_bc;
  int local_ac;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  int local_1c;
  uint local_18;
  uint local_14;
  int local_10;
  int local_c;
  uint local_8;
  
  local_28 = 1;
  uVar4 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_c = 0;
  local_2c = 0;
  local_24 = 2;
  local_20 = 3;
  local_1c = in_ECX;
  iVar1 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10118ad8,local_10c,&local_c,local_cc,
                       &local_2c,uVar4,1);
  if (iVar1 == 0) {
    local_c = 0;
    local_10 = 0;
    local_14 = 0;
    local_8 = 0;
    if (uVar4 != 0) {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + local_bc * 4);
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_ac * 4);
      local_18 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 4) & 0x100;
      do {
        if (local_18 == 0) {
          return 1;
        }
        if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 5) & 1) == 0) {
          return 1;
        }
        if (*(int *)(iVar1 + 8) != -1) {
          return 1;
        }
        if (*(int *)(iVar3 + 8) != -1) {
          return 1;
        }
        if ((*(double *)(iVar1 + 0x20) == 1.0) && (*(double *)(iVar3 + 0x20) == 0.0)) {
          local_c = 1;
        }
        else {
          if (*(double *)(iVar3 + 0x20) != 1.0) {
            return 1;
          }
          if (*(double *)(iVar1 + 0x20) != 0.0) {
            return 1;
          }
          local_10 = 1;
        }
        local_8 = local_8 + 1;
      } while (local_8 < uVar4);
      if (local_c != 0) {
        if (local_10 != 0) {
          return 1;
        }
        local_14 = uVar4 | 0x73500000;
      }
      if (local_10 != 0) {
        local_14 = uVar4 | 0x73600000;
      }
    }
    iVar1 = FUN_10085814();
    if (iVar1 == 0) {
      local_8 = 0;
    }
    else {
      local_8 = FUN_10085379();
    }
    if (local_8 == 0) {
      iVar1 = -0x7ff8fff2;
    }
    else {
      iVar1 = FUN_1008585f(local_14,uVar4 * 2,uVar4,0);
      if ((-1 < iVar1) && (iVar1 = FUN_100853b0(), -1 < iVar1)) {
        puVar5 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
        puVar6 = *(undefined4 **)(local_8 + 0x10);
        for (uVar2 = uVar4; uVar2 != 0; uVar2 = uVar2 - 1) {
          *puVar6 = *puVar5;
          puVar5 = puVar5 + 1;
          puVar6 = puVar6 + 1;
        }
        for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
          *(undefined1 *)puVar6 = *(undefined1 *)puVar5;
          puVar5 = (undefined4 *)((int)puVar5 + 1);
          puVar6 = (undefined4 *)((int)puVar6 + 1);
        }
        puVar5 = local_cc;
        puVar6 = *(undefined4 **)(local_8 + 8);
        for (uVar2 = uVar4; uVar2 != 0; uVar2 = uVar2 - 1) {
          *puVar6 = *puVar5;
          puVar5 = puVar5 + 1;
          puVar6 = puVar6 + 1;
        }
        for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
          *(undefined1 *)puVar6 = *(undefined1 *)puVar5;
          puVar5 = (undefined4 *)((int)puVar5 + 1);
          puVar6 = (undefined4 *)((int)puVar6 + 1);
        }
        iVar1 = FUN_10086139(*(undefined4 *)(local_1c + 0x78),0,0,0);
        if (iVar1 == -1) {
          iVar1 = -0x7ff8fff2;
        }
        else {
          if (uVar4 != 0) {
            iVar3 = uVar4 << 2;
            do {
              *(int *)(iVar3 + *(int *)(local_8 + 8)) = iVar1;
              iVar3 = iVar3 + 4;
              uVar4 = uVar4 - 1;
            } while (uVar4 != 0);
          }
          iVar1 = FUN_10085abe();
        }
      }
      FUN_1006c418();
    }
  }
  return iVar1;
}


