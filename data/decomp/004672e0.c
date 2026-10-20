
undefined4 * FUN_004672e0(void)

{
  int in_EAX;
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *puVar5;
  
  puVar1 = (undefined4 *)FUN_004ff450(0x7c);
  puVar5 = puVar1;
  for (iVar4 = 0x1f; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar5 = 0;
    puVar5 = puVar5 + 1;
  }
  puVar1[0x1d] = DAT_00591cd8;
  DAT_00591cd8 = DAT_00591cd8 + 1;
  puVar5 = puVar1 + 2;
  *puVar5 = puVar5;
  puVar1[3] = puVar5;
  puVar1[0x14] = *(undefined4 *)(in_EAX + 0x50);
  puVar1[0x16] = *(undefined4 *)(in_EAX + 0x58);
  puVar1[0x17] = *(undefined4 *)(in_EAX + 0x5c);
  puVar1[0x18] = *(undefined4 *)(in_EAX + 0x60);
  for (puVar5 = *(undefined4 **)(in_EAX + 100); puVar5 != (undefined4 *)0x0;
      puVar5 = (undefined4 *)*puVar5) {
    puVar2 = (undefined4 *)FUN_004ff450(0xc);
    uVar3 = FUN_0046cb10();
    puVar2[1] = uVar3;
    uVar3 = FUN_0046cb10();
    puVar2[2] = uVar3;
    *puVar2 = puVar1[0x19];
    puVar1[0x19] = puVar2;
  }
  return puVar1;
}

