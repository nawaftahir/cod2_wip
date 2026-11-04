// 100c40ff size=168 FUN_100c40ff

undefined4 FUN_100c40ff(int param_1)

{
  undefined4 *puVar1;
  int in_ECX;
  uint uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  uint local_8;
  
  uVar2 = *(uint *)(in_ECX + 0x114);
  local_8 = uVar2;
  if (uVar2 == 0) {
    local_8 = 0x400;
  }
  if (local_8 < (uint)(*(int *)(in_ECX + 0x110) + param_1)) {
    do {
      local_8 = local_8 * 2;
    } while (local_8 < (uint)(param_1 + *(int *)(in_ECX + 0x110)));
  }
  if (local_8 != uVar2) {
    puVar1 = operator_new(local_8 << 2);
    if (puVar1 == (undefined4 *)0x0) {
      return 0x8007000e;
    }
    puVar4 = *(undefined4 **)(in_ECX + 0x10c);
    puVar5 = puVar1;
    for (uVar2 = *(uint *)(in_ECX + 0x110) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    _free(*(void **)(in_ECX + 0x10c));
    *(undefined4 **)(in_ECX + 0x10c) = puVar1;
    *(uint *)(in_ECX + 0x114) = local_8;
  }
  return 0;
}


