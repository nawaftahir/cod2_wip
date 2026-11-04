// 10069851 size=145 FUN_10069851

undefined4 FUN_10069851(uint param_1)

{
  undefined4 *puVar1;
  int in_ECX;
  uint uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  iVar3 = param_1;
  uVar2 = param_1 + *(int *)(in_ECX + 0x5c);
  param_1 = *(uint *)(in_ECX + 0x60);
  if (param_1 < uVar2) {
    if (param_1 == 0) {
      param_1 = 0x100;
    }
    if (param_1 < uVar2) {
      do {
        param_1 = param_1 * 2;
      } while (param_1 < (uint)(*(int *)(in_ECX + 0x5c) + iVar3));
    }
    puVar1 = operator_new(param_1 << 2);
    if (puVar1 == (undefined4 *)0x0) {
      return 0x8007000e;
    }
    puVar4 = *(undefined4 **)(in_ECX + 0x58);
    puVar5 = puVar1;
    for (uVar2 = *(uint *)(in_ECX + 0x5c) & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    _free(*(void **)(in_ECX + 0x58));
    *(undefined4 **)(in_ECX + 0x58) = puVar1;
    *(uint *)(in_ECX + 0x60) = param_1;
  }
  return 0;
}


