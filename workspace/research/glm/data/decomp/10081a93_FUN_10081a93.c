// 10081a93 size=92 FUN_10081a93

undefined4 FUN_10081a93(uint param_1)

{
  undefined4 *puVar1;
  int in_ECX;
  uint uVar2;
  uint uVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  if (*(uint *)(in_ECX + 8) < param_1) {
    puVar1 = operator_new(param_1);
    if (puVar1 == (undefined4 *)0x0) {
      return 0x8007000e;
    }
    uVar3 = *(uint *)(in_ECX + 8);
    puVar4 = *(undefined4 **)(in_ECX + 0xc);
    puVar5 = puVar1;
    for (uVar2 = uVar3 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar5 = *puVar4;
      puVar4 = puVar4 + 1;
      puVar5 = puVar5 + 1;
    }
    for (uVar3 = uVar3 & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
      *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
      puVar4 = (undefined4 *)((int)puVar4 + 1);
      puVar5 = (undefined4 *)((int)puVar5 + 1);
    }
    _free(*(void **)(in_ECX + 0xc));
    *(undefined4 **)(in_ECX + 0xc) = puVar1;
    *(uint *)(in_ECX + 8) = param_1;
  }
  return 0;
}


