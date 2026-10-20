
undefined4 switchD_0048d7df::caseD_7(void)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  int unaff_EBP;
  byte *pbVar4;
  bool bVar5;
  
  pbVar3 = *(byte **)(unaff_EBP + 8);
  if ((pbVar3 == (byte *)0x0) && (DAT_0124a4a5 == '\0')) {
    iVar2 = FUN_0047d980("val0.string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x362,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a4a5 = '\x01';
    }
  }
  pbVar4 = *(byte **)(unaff_EBP + 0xc);
  if ((pbVar4 == (byte *)0x0) && (DAT_0124a4a4 == '\0')) {
    iVar2 = FUN_0047d980("val1.string","\\trees\\cod2src\\src\\universal\\dvar.cpp",0x363,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a4a4 = '\x01';
    }
  }
  while( true ) {
    bVar1 = *pbVar3;
    bVar5 = bVar1 < *pbVar4;
    if (bVar1 != *pbVar4) break;
    if (bVar1 == 0) {
      return 1;
    }
    bVar1 = pbVar3[1];
    bVar5 = bVar1 < pbVar4[1];
    if (bVar1 != pbVar4[1]) break;
    pbVar3 = pbVar3 + 2;
    pbVar4 = pbVar4 + 2;
    if (bVar1 == 0) {
      return 1;
    }
  }
  iVar2 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
  return CONCAT31((int3)((uint)iVar2 >> 8),iVar2 == 0);
}

