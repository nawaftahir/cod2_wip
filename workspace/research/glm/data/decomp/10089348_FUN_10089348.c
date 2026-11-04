// 10089348 size=178 FUN_10089348

uint FUN_10089348(void)

{
  int *piVar1;
  uint uVar2;
  int in_ECX;
  uint uVar3;
  uint local_c;
  uint local_8;
  
  uVar3 = 0;
  local_8 = 0;
  if ((*(uint *)(in_ECX + 0x6c) & 0x4000000) == 0) {
    if (((*(uint *)(in_ECX + 0x6c) & 0x8000000) != 0) &&
       (uVar2 = *(uint *)(in_ECX + 0xc), uVar2 != 0)) {
      local_c = 1;
      do {
        if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x18) + uVar3 * 4) + 0x2c) & 1) != 0) &&
            (local_8 = local_8 + 1, local_c < uVar2)) &&
           (piVar1 = (int *)(*(int *)(in_ECX + 0x18) + uVar3 * 4),
           *(int *)(*piVar1 + 0x2c) == *(int *)(piVar1[1] + 0x2c))) {
          uVar3 = uVar3 + 1;
          local_c = local_c + 1;
        }
        uVar3 = uVar3 + 1;
        local_c = local_c + 1;
      } while (uVar3 < uVar2);
    }
  }
  else {
    local_8 = 0;
    if (*(uint *)(in_ECX + 0xc) != 0) {
      uVar3 = 1;
      local_8 = (uint)((*(byte *)(**(int **)(in_ECX + 0x18) + 0x2c) & 1) == 0);
      if (1 < *(uint *)(in_ECX + 0xc)) {
        do {
          if (((*(byte *)((*(int **)(in_ECX + 0x18))[uVar3] + 0x2c) & 1) != 0) &&
             (piVar1 = (int *)(*(int *)(in_ECX + 0x18) + uVar3 * 4),
             *(int *)(*piVar1 + 0x2c) != *(int *)(piVar1[-1] + 0x2c))) {
            local_8 = local_8 + 1;
          }
          uVar3 = uVar3 + 1;
        } while (uVar3 < *(uint *)(in_ECX + 0xc));
      }
    }
  }
  return local_8;
}


