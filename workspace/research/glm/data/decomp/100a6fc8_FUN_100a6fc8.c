// 100a6fc8 size=223 FUN_100a6fc8

undefined4 FUN_100a6fc8(void)

{
  uint *puVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  int *piVar5;
  uint local_10;
  int *local_c;
  uint local_8;
  
  local_10 = *(uint *)(in_ECX + 0x4c);
  if (local_10 < *(uint *)(in_ECX + 0x224)) {
    local_c = (int *)(*(int *)(in_ECX + 0x230) + local_10 * 4);
    do {
      puVar2 = (uint *)*local_c;
      if ((((puVar2 != (uint *)0x0) && (*puVar2 != 0)) &&
          ((iVar3 = *(int *)(in_ECX + 0x14),
           *(int *)(*(int *)(iVar3 + *(int *)puVar2[4] * 4) + 4) != *(int *)(in_ECX + 0x84) ||
           ((*puVar2 & 0xfff00000) != 0x10000000)))) && (local_8 = 0, puVar2[1] != 0)) {
        piVar5 = (int *)puVar2[2];
        do {
          iVar4 = *(int *)(iVar3 + *piVar5 * 4);
          puVar1 = (uint *)(iVar4 + 0x3c);
          for (; *(int *)(iVar4 + 0x38) != -1; iVar4 = *(int *)(iVar3 + *(int *)(iVar4 + 0x38) * 4))
          {
          }
          if ((*(char *)(iVar4 + 0x6c) == '\x03') &&
             (((*(uint *)(iVar4 + 0x3c) | *puVar1) & 0x200) == 0)) {
            FUN_1008b13a();
            return 0;
          }
          local_8 = local_8 + 1;
          piVar5 = piVar5 + 1;
        } while (local_8 < puVar2[1]);
      }
      local_10 = local_10 + 1;
      local_c = local_c + 1;
    } while (local_10 < *(uint *)(in_ECX + 0x224));
  }
  return 0;
}


