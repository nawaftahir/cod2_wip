
void FUN_004549b0(void)

{
  undefined4 *in_EAX;
  undefined4 uVar1;
  int iVar2;
  undefined4 *unaff_EBX;
  undefined4 *puVar3;
  undefined4 *puVar4;
  
  puVar3 = in_EAX + 9;
  puVar4 = unaff_EBX + 9;
  for (iVar2 = 0xe; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  puVar3 = in_EAX + 0x17;
  puVar4 = unaff_EBX + 0x17;
  for (iVar2 = 7; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  unaff_EBX[0x29] = in_EAX[0x29];
  unaff_EBX[0x1e] = in_EAX[0x1e];
  unaff_EBX[0x1f] = in_EAX[0x1f];
  puVar3 = in_EAX;
  puVar4 = unaff_EBX;
  for (iVar2 = 9; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  puVar3 = in_EAX + 0x20;
  puVar4 = unaff_EBX + 0x20;
  for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  if (in_EAX[0x28] != 0) {
    uVar1 = FUN_00447f60();
    unaff_EBX[0x28] = uVar1;
    return;
  }
  unaff_EBX[0x28] = 0;
  return;
}

