// 1006e26a size=158 FUN_1006e26a

undefined4 FUN_1006e26a(uint param_1,uint param_2,undefined4 *param_3)

{
  int in_ECX;
  int iVar1;
  uint uVar2;
  undefined4 *puVar3;
  
  iVar1 = *(int *)(in_ECX + 8);
  uVar2 = param_1;
  if (param_1 < *(uint *)(iVar1 + 8)) {
    do {
      if (*(int *)(*(int *)(iVar1 + 0x14) + uVar2 * 4) != 0) {
        FUN_1006db35(1);
      }
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 8) + 0x14) + uVar2 * 4) = 0;
      iVar1 = *(int *)(in_ECX + 8);
      uVar2 = uVar2 + 1;
    } while (uVar2 < *(uint *)(iVar1 + 8));
  }
  *(uint *)(*(int *)(in_ECX + 8) + 8) = param_1;
  iVar1 = *(int *)(in_ECX + 8);
  uVar2 = param_2;
  if (param_2 < *(uint *)(iVar1 + 0xc)) {
    do {
      if (*(int *)(*(int *)(iVar1 + 0x18) + uVar2 * 4) != 0) {
        FUN_1006c418(1);
      }
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 8) + 0x18) + uVar2 * 4) = 0;
      iVar1 = *(int *)(in_ECX + 8);
      uVar2 = uVar2 + 1;
    } while (uVar2 < *(uint *)(iVar1 + 0xc));
  }
  *(uint *)(*(int *)(in_ECX + 8) + 0xc) = param_2;
  puVar3 = *(undefined4 **)(in_ECX + 0x18);
  for (uVar2 = *(uint *)(*(int *)(in_ECX + 4) + 0x18) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
    *puVar3 = *param_3;
    param_3 = param_3 + 1;
    puVar3 = puVar3 + 1;
  }
  for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
    *(undefined1 *)puVar3 = *(undefined1 *)param_3;
    param_3 = (undefined4 *)((int)param_3 + 1);
    puVar3 = (undefined4 *)((int)puVar3 + 1);
  }
  return 0;
}


