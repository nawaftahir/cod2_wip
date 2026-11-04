
uint FUN_0049fc60(void)

{
  byte bVar1;
  undefined4 in_EAX;
  int iVar2;
  uint uVar3;
  uint extraout_EAX;
  byte *pbVar4;
  byte *unaff_EDI;
  bool bVar5;
  
  if (unaff_EDI == (byte *)0x0) {
    uVar3 = CONCAT31((int3)((uint)in_EAX >> 8),DAT_0124a62d);
    if (DAT_0124a62d == '\0') {
      iVar2 = FUN_0047d980(&DAT_0054ebb4,"e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",
                           0x218);
      if (iVar2 == 0) {
        DebugBreak();
        uVar3 = extraout_EAX;
      }
      else {
        uVar3 = iVar2 - 2;
        if (uVar3 == 0) {
          DAT_0124a62d = 1;
          return 0;
        }
      }
    }
    return uVar3 & 0xffffff00;
  }
  pbVar4 = (byte *)FUN_0040af30();
  while( true ) {
    bVar1 = *unaff_EDI;
    bVar5 = bVar1 < *pbVar4;
    if (bVar1 != *pbVar4) break;
    if (bVar1 == 0) {
      return 1;
    }
    bVar1 = unaff_EDI[1];
    bVar5 = bVar1 < pbVar4[1];
    if (bVar1 != pbVar4[1]) break;
    unaff_EDI = unaff_EDI + 2;
    pbVar4 = pbVar4 + 2;
    if (bVar1 == 0) {
      return 1;
    }
  }
  iVar2 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
  return CONCAT31((int3)((uint)iVar2 >> 8),iVar2 == 0);
}

