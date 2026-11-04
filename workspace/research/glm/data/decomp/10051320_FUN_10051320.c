// 10051320 size=102 FUN_10051320

void FUN_10051320(void)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  int unaff_ESI;
  undefined4 *puVar4;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_ESI + 4))();
  *(undefined4 **)(unaff_ESI + 0x1a0) = puVar1;
  *puVar1 = FUN_10050680;
  iVar3 = 0;
  puVar1[0xb] = 0;
  puVar1[0xc] = 0;
  puVar1[0xd] = 0;
  puVar1[0xe] = 0;
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_ESI + 4))();
  *(undefined4 **)(unaff_ESI + 0x94) = puVar1;
  if (0 < *(int *)(unaff_ESI + 0x2c)) {
    do {
      puVar4 = puVar1;
      for (iVar2 = 0x40; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar4 = 0xffffffff;
        puVar4 = puVar4 + 1;
      }
      iVar3 = iVar3 + 1;
      puVar1 = puVar1 + 0x40;
    } while (iVar3 < *(int *)(unaff_ESI + 0x2c));
  }
  return;
}


