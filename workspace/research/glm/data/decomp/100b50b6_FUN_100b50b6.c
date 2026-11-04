// 100b50b6 size=201 FUN_100b50b6

undefined4 FUN_100b50b6(uint *param_1)

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  uint uVar6;
  uint local_28 [5];
  int local_14;
  uint local_10;
  int local_c;
  undefined4 *local_8;
  
  uVar6 = *param_1 & 0xfffff;
  if (uVar6 == 0) {
    uVar2 = 1;
  }
  else {
    local_28[4] = param_1[1] / uVar6;
    local_10 = 0;
    if (local_28[4] != 0) {
      iVar1 = *(int *)(in_ECX + 0x6c);
      local_c = 0;
      local_14 = in_ECX;
      do {
        local_28[0] = 0xffffffff;
        local_28[1] = 0xffffffff;
        local_28[2] = 0xffffffff;
        uVar5 = 0;
        local_28[3] = 0xffffffff;
        if (uVar6 != 0) {
          iVar4 = *(int *)(local_14 + 0x14);
          piVar3 = (int *)(param_1[2] + local_c);
          do {
            local_28[uVar5] = *(uint *)(*(int *)(iVar4 + *piVar3 * 4) + 0x10);
            uVar5 = uVar5 + 1;
            piVar3 = piVar3 + 1;
          } while (uVar5 < uVar6);
        }
        if (iVar1 << 0x1e < 0) {
          uVar5 = 0;
          local_8 = &DAT_101a4218;
          do {
            iVar4 = FUN_100b3f18(local_28,local_8);
            if (iVar4 != 0) break;
            local_8 = local_8 + 4;
            uVar5 = uVar5 + 1;
          } while (uVar5 < 8);
          if (uVar5 == 8) {
            return 1;
          }
        }
        local_10 = local_10 + 1;
        local_c = local_c + uVar6 * 4;
      } while (local_10 < local_28[4]);
    }
    uVar2 = 0;
  }
  return uVar2;
}


