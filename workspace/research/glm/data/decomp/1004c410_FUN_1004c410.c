// 1004c410 size=117 FUN_1004c410

void FUN_1004c410(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  int unaff_ESI;
  undefined4 *puStack_4;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_ESI + 4))();
  *(undefined4 **)(unaff_ESI + 0x1a4) = puVar1;
  *puVar1 = FUN_1004c0e0;
  iVar4 = 0;
  if (0 < *(int *)(unaff_ESI + 0x2c)) {
    puStack_4 = (undefined4 *)(*(int *)(unaff_ESI + 0xcc) + 0x50);
    puVar1 = puVar1 + 0xb;
    do {
      puVar2 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_ESI + 4))();
      *puStack_4 = puVar2;
      for (iVar3 = 0x40; iVar3 != 0; iVar3 = iVar3 + -1) {
        *puVar2 = 0;
        puVar2 = puVar2 + 1;
      }
      *puVar1 = 0xffffffff;
      iVar4 = iVar4 + 1;
      puStack_4 = puStack_4 + 0x15;
      puVar1 = puVar1 + 1;
    } while (iVar4 < *(int *)(unaff_ESI + 0x2c));
  }
  return;
}


