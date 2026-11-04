
void FUN_0048bce0(int param_1)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  undefined4 uVar4;
  byte *unaff_EBX;
  byte *pbVar5;
  byte *pbVar6;
  bool bVar7;
  
  if ((unaff_EBX == (byte *)0x0) && (DAT_0124a4ca == '\0')) {
    iVar2 = FUN_0047d980("string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0xec);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a4ca = '\x01';
    }
  }
  pbVar6 = *(byte **)(param_1 + 8);
  if (pbVar6 != (byte *)0x0) {
    pbVar3 = unaff_EBX;
    pbVar5 = pbVar6;
    if (unaff_EBX == pbVar6) goto LAB_0048bd63;
    do {
      bVar1 = *pbVar3;
      bVar7 = bVar1 < *pbVar5;
      if (bVar1 != *pbVar5) {
LAB_0048bd5a:
        iVar2 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_0048bd5f;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar3[1];
      bVar7 = bVar1 < pbVar5[1];
      if (bVar1 != pbVar5[1]) goto LAB_0048bd5a;
      pbVar3 = pbVar3 + 2;
      pbVar5 = pbVar5 + 2;
    } while (bVar1 != 0);
    iVar2 = 0;
LAB_0048bd5f:
    if (iVar2 == 0) goto LAB_0048bd63;
  }
  pbVar6 = *(byte **)(param_1 + 0xc);
  if (pbVar6 == (byte *)0x0) {
LAB_0048bdad:
    uVar4 = FUN_0048b9b0();
    *(undefined4 *)(param_1 + 0x10) = uVar4;
    return;
  }
  pbVar3 = pbVar6;
  if (unaff_EBX != pbVar6) {
    do {
      bVar1 = *unaff_EBX;
      bVar7 = bVar1 < *pbVar3;
      if (bVar1 != *pbVar3) {
LAB_0048bda4:
        iVar2 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_0048bda9;
      }
      if (bVar1 == 0) break;
      bVar1 = unaff_EBX[1];
      bVar7 = bVar1 < pbVar3[1];
      if (bVar1 != pbVar3[1]) goto LAB_0048bda4;
      unaff_EBX = unaff_EBX + 2;
      pbVar3 = pbVar3 + 2;
    } while (bVar1 != 0);
    iVar2 = 0;
LAB_0048bda9:
    if (iVar2 != 0) goto LAB_0048bdad;
  }
LAB_0048bd63:
  *(byte **)(param_1 + 0x10) = pbVar6;
  return;
}

