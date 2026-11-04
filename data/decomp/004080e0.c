
undefined4 * FUN_004080e0(void)

{
  uint in_EAX;
  uint uVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  uVar1 = in_EAX & 0x80000fff;
  if ((int)uVar1 < 0) {
    uVar1 = (uVar1 - 1 | 0xfffff000) + 1;
  }
  if (0 < (int)uVar1) {
    in_EAX = in_EAX + (0x1000 - uVar1);
  }
  puVar2 = _malloc(in_EAX);
  puVar3 = puVar2;
  for (uVar1 = in_EAX >> 2; uVar1 != 0; uVar1 = uVar1 - 1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  for (uVar1 = in_EAX & 3; uVar1 != 0; uVar1 = uVar1 - 1) {
    *(undefined1 *)puVar3 = 0;
    puVar3 = (undefined4 *)((int)puVar3 + 1);
  }
  return puVar2;
}

