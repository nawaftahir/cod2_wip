// 100cad4d size=114 FUN_100cad4d

int FUN_100cad4d(void)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  int local_c;
  uint local_8;
  
  uVar2 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_8 = 0;
  if (uVar2 != 0) {
    local_c = uVar2 << 2;
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
      iVar1 = FUN_100c9a7f(0x20,*(int *)(*(int *)(in_ECX + 0x100) + 0x10) + local_8 * 4,1,
                           iVar1 + local_8 * 4,local_c + iVar1,0,uVar2,0,0,0,0);
      if (iVar1 < 0) {
        return iVar1;
      }
      local_8 = local_8 + 1;
      local_c = local_c + 4;
    } while (local_8 < uVar2);
  }
  return 0;
}


