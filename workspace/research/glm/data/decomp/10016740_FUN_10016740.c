// 10016740 size=53 FUN_10016740

void FUN_10016740(void)

{
  undefined4 uVar1;
  int *unaff_EBX;
  int iVar2;
  undefined *puVar3;
  
  iVar2 = 8;
  puVar3 = &DAT_1018eac8;
  do {
    uVar1 = FUN_100165c0(*(undefined4 *)*unaff_EBX,((undefined4 *)*unaff_EBX)[1],puVar3);
    *(undefined4 *)(iVar2 + *unaff_EBX) = uVar1;
    iVar2 = iVar2 + 4;
    puVar3 = puVar3 + 0x15;
  } while (iVar2 < 0x18);
  return;
}


