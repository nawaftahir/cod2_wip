// 1004f7c0 size=131 FUN_1004f7c0

void FUN_1004f7c0(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  int unaff_ESI;
  
  puVar1 = (undefined4 *)(*(code *)**(undefined4 **)(unaff_ESI + 4))();
  *(undefined4 **)(unaff_ESI + 0x19c) = puVar1;
  *puVar1 = &LAB_1004f790;
  puVar1[1] = &LAB_1004f280;
  puVar1[2] = FUN_1004f600;
  puVar1[6] = FUN_1004f040;
  puVar1[0x17] = 0;
  puVar2 = puVar1 + 0x18;
  iVar3 = 0x10;
  do {
    puVar2[-0x11] = FUN_1004f040;
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  puVar1[7] = FUN_1004ec80;
  puVar1[0x15] = FUN_1004ec80;
  iVar3 = *(int *)(unaff_ESI + 0x19c);
  *(undefined4 *)(unaff_ESI + 0xcc) = 0;
  *(undefined4 *)(unaff_ESI + 0x84) = 0;
  *(undefined4 *)(unaff_ESI + 0x184) = 0;
  *(undefined1 *)(iVar3 + 0xc) = 0;
  *(undefined1 *)(iVar3 + 0xd) = 0;
  *(undefined4 *)(iVar3 + 0x14) = 0;
  *(undefined4 *)(iVar3 + 0xa0) = 0;
  return;
}


