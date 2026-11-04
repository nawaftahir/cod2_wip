// 100cbc0c size=285 FUN_100cbc0c

void FUN_100cbc0c(int *param_1,uint *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int in_ECX;
  uint uVar6;
  int *piVar7;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  uVar6 = 0;
  local_1c = 0;
  local_10 = 0;
  local_14 = 0;
  local_c = 0;
  if (*(int *)(in_ECX + 0x38) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x3c) + local_c * 4);
      iVar5 = iVar1 * 4;
      iVar2 = *(int *)(iVar5 + *(int *)(*(int *)(in_ECX + 4) + 0x18));
      *(uint *)(iVar5 + *(int *)(in_ECX + 0x2c)) = uVar6;
      *(undefined4 *)(iVar5 + *(int *)(in_ECX + 0x28)) = 0;
      if ((*(ushort *)(iVar2 + 2) & 0xfff0) != 0) {
        iVar2 = *(int *)(iVar5 + *(int *)(in_ECX + 0xc));
        iVar3 = *(int *)(in_ECX + 0x10);
        local_8 = 0;
        uVar4 = *(uint *)(iVar5 + *(int *)(in_ECX + 8));
        if (uVar4 != 0) {
          do {
            if (iVar1 == *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) +
                                          *(int *)(iVar3 + iVar2 * 4 + local_8 * 4) * 4) + 0x58)) {
              piVar7 = (int *)(*(int *)(in_ECX + 0x28) + iVar5);
              *piVar7 = *piVar7 + -1;
            }
            local_8 = local_8 + 1;
            uVar6 = local_1c;
          } while (local_8 < uVar4);
        }
        iVar1 = *(int *)(iVar5 + *(int *)(in_ECX + 0x20));
        iVar2 = *(int *)(in_ECX + 0x24);
        uVar4 = *(uint *)(iVar5 + *(int *)(in_ECX + 0x1c));
        local_18 = 0;
        if (uVar4 != 0) {
          do {
            if (*(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) +
                                 *(int *)(iVar2 + iVar1 * 4 + local_18 * 4) * 4) + 0x5c) != 0) {
              piVar7 = (int *)(*(int *)(in_ECX + 0x28) + iVar5);
              *piVar7 = *piVar7 + 1;
            }
            local_18 = local_18 + 1;
          } while (local_18 < uVar4);
        }
        local_10 = local_10 + uVar6;
        if (local_14 < uVar6) {
          local_14 = uVar6;
        }
        uVar6 = uVar6 + *(int *)(*(int *)(in_ECX + 0x28) + iVar5);
        local_1c = uVar6;
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0x38));
  }
  if (param_1 != (int *)0x0) {
    *param_1 = local_10;
  }
  if (param_2 != (uint *)0x0) {
    *param_2 = local_14;
  }
  return;
}


