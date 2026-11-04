// 1006c449 size=99 FUN_1006c449

undefined4 FUN_1006c449(uint param_1)

{
  void *pvVar1;
  int in_ECX;
  uint uVar2;
  
  uVar2 = *(uint *)(in_ECX + 0x94);
  if (uVar2 < param_1) {
    if (uVar2 == 0) {
      uVar2 = 0x10;
    }
    else {
      uVar2 = uVar2 * 2;
    }
    for (; uVar2 < param_1; uVar2 = uVar2 * 2) {
    }
    pvVar1 = operator_new(uVar2 << 2);
    if (pvVar1 == (void *)0x0) {
      return 0;
    }
    _free(*(void **)(in_ECX + 0x90));
    *(void **)(in_ECX + 0x90) = pvVar1;
    *(uint *)(in_ECX + 0x94) = uVar2;
  }
  return *(undefined4 *)(in_ECX + 0x90);
}


