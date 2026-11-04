// 1006c4ac size=129 FUN_1006c4ac

undefined4 * FUN_1006c4ac(int param_1)

{
  undefined4 *puVar1;
  int in_ECX;
  uint uVar2;
  uint uVar3;
  
  uVar2 = param_1 + 2;
  if (*(uint *)(in_ECX + 0x8c) < uVar2) {
    uVar3 = uVar2;
    if (uVar2 < 0x2000) {
      uVar3 = 0x2000;
    }
    puVar1 = operator_new(uVar3 << 2);
    if (puVar1 == (undefined4 *)0x0) {
      return (undefined4 *)0x0;
    }
    *puVar1 = *(undefined4 *)(in_ECX + 0x88);
    puVar1[1] = -*(int *)(in_ECX + 0x8c);
    *(undefined4 **)(in_ECX + 0x88) = puVar1;
    *(uint *)(in_ECX + 0x8c) = uVar3;
  }
  else {
    puVar1 = *(undefined4 **)(in_ECX + 0x88);
    *puVar1 = puVar1;
    puVar1[1] = *(undefined4 *)(in_ECX + 0x8c);
  }
  *(int *)(in_ECX + 0x8c) = *(int *)(in_ECX + 0x8c) - uVar2;
  *(int *)(in_ECX + 0x88) = *(int *)(in_ECX + 0x88) + uVar2 * 4;
  return puVar1 + 2;
}


