
void FUN_0040aaa0(void)

{
  void *_Memory;
  int *piVar1;
  undefined4 *puVar2;
  int unaff_EBX;
  int iVar3;
  
  iVar3 = 0;
  *(undefined4 *)(unaff_EBX + 4) = 0;
  *(undefined1 *)(unaff_EBX + 0x14) = 0;
  *(undefined4 *)(unaff_EBX + 8) = 0;
  *(undefined4 *)(unaff_EBX + 0xc) = 0;
  *(undefined4 *)(unaff_EBX + 0x10) = 0;
  *(undefined4 *)(unaff_EBX + 0x5c) = 0x41f00000;
  *(undefined4 *)(unaff_EBX + 0x54) = 0;
  FUN_0040b010();
  *(undefined4 *)(unaff_EBX + 0x3c) = 0x42b40000;
  if (0 < *(int *)(unaff_EBX + 0x1c)) {
    do {
      piVar1 = (int *)FUN_0040abc0();
      if ((undefined4 *)*piVar1 != (undefined4 *)0x0) {
        (*(code *)**(undefined4 **)*piVar1)(1);
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < *(int *)(unaff_EBX + 0x1c));
  }
  iVar3 = 0;
  if (0 < *(int *)(unaff_EBX + 0x2c)) {
    do {
      puVar2 = (undefined4 *)FUN_0040ac60();
      _Memory = (void *)*puVar2;
      if (_Memory != (void *)0x0) {
        FUN_0040ad20();
        _free(_Memory);
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < *(int *)(unaff_EBX + 0x2c));
  }
  if (*(undefined4 **)(unaff_EBX + 0x18) != (undefined4 *)0x0) {
    (**(code **)**(undefined4 **)(unaff_EBX + 0x18))(1);
  }
  *(undefined4 *)(unaff_EBX + 0x18) = 0;
  if (*(void **)(unaff_EBX + 0x38) != (void *)0x0) {
    _free(*(void **)(unaff_EBX + 0x38));
  }
  *(undefined4 *)(unaff_EBX + 0x38) = 0;
  *(int *)(unaff_EBX + 0x2c) = 0;
  *(undefined4 *)(unaff_EBX + 0x30) = 0;
  if (*(void **)(unaff_EBX + 0x28) != (void *)0x0) {
    _free(*(void **)(unaff_EBX + 0x28));
  }
  *(undefined4 *)(unaff_EBX + 0x28) = 0;
  *(int *)(unaff_EBX + 0x1c) = 0;
  *(undefined4 *)(unaff_EBX + 0x20) = 0;
  return;
}

