// 1007d8da size=142 FUN_1007d8da

void FUN_1007d8da(void)

{
  void *pvVar1;
  int in_ECX;
  uint uVar2;
  
  uVar2 = 0;
  if (*(int *)(in_ECX + 0x38) != 0) {
    if (*(short *)(*(int *)(in_ECX + 0x18) + 10) != 0) {
      do {
        pvVar1 = *(void **)(*(int *)(in_ECX + 0x38) + uVar2 * 4);
        if (pvVar1 != (void *)0x0) {
          FUN_1007d8da();
          _free(pvVar1);
        }
        uVar2 = uVar2 + 1;
      } while (uVar2 < *(ushort *)(*(int *)(in_ECX + 0x18) + 10));
    }
    _free(*(void **)(in_ECX + 0x38));
  }
  uVar2 = 0;
  if (*(int *)(in_ECX + 0x3c) != 0) {
    if (*(short *)(*(int *)(in_ECX + 0x18) + 8) != 0) {
      do {
        pvVar1 = *(void **)(*(int *)(in_ECX + 0x3c) + uVar2 * 4);
        if (pvVar1 != (void *)0x0) {
          FUN_1007d8da();
          _free(pvVar1);
        }
        uVar2 = uVar2 + 1;
      } while (uVar2 < *(ushort *)(*(int *)(in_ECX + 0x18) + 8));
    }
    _free(*(void **)(in_ECX + 0x3c));
  }
  _free(*(void **)(in_ECX + 0x40));
  return;
}


