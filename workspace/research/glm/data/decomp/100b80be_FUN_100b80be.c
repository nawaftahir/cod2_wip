// 100b80be size=98 FUN_100b80be

undefined4 FUN_100b80be(int param_1,uint param_2)

{
  int iVar1;
  uint uVar2;
  int in_ECX;
  int *piVar3;
  uint local_8;
  
  local_8 = 0;
  if (*(uint *)(param_1 + 4) != 0) {
    piVar3 = *(int **)(param_1 + 8);
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar3 * 4);
      if (((*(int *)(in_ECX + 0x88) == *(int *)(iVar1 + 4)) &&
          (uVar2 = *(uint *)(iVar1 + 0x50), uVar2 < param_2)) &&
         ((*(ushort *)(*(int *)(*(int *)(in_ECX + 0x18) + uVar2 * 4) + 2) & 0xfff0) != 0)) {
        return 1;
      }
      local_8 = local_8 + 1;
      piVar3 = piVar3 + 1;
    } while (local_8 < *(uint *)(param_1 + 4));
  }
  return 0;
}


