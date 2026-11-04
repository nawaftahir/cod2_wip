
uint FUN_0049fbc0(void)

{
  byte bVar1;
  byte *in_EAX;
  int iVar2;
  uint uVar3;
  uint extraout_EAX;
  byte *pbVar4;
  bool bVar5;
  
  if (in_EAX == (byte *)0x0) {
    uVar3 = 0;
    if (DAT_0124a62e == '\0') {
      iVar2 = FUN_0047d980(&DAT_0054527c,"e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",
                           0x20d);
      if (iVar2 == 0) {
        DebugBreak();
        uVar3 = extraout_EAX;
      }
      else {
        uVar3 = iVar2 - 2;
        if (uVar3 == 0) {
          DAT_0124a62e = 1;
          return 0;
        }
      }
    }
    return uVar3 & 0xffffff00;
  }
  pbVar4 = (byte *)FUN_0040af30();
  while( true ) {
    bVar1 = *pbVar4;
    bVar5 = bVar1 < *in_EAX;
    if (bVar1 != *in_EAX) break;
    if (bVar1 == 0) {
      return 1;
    }
    bVar1 = pbVar4[1];
    bVar5 = bVar1 < in_EAX[1];
    if (bVar1 != in_EAX[1]) break;
    pbVar4 = pbVar4 + 2;
    in_EAX = in_EAX + 2;
    if (bVar1 == 0) {
      return 1;
    }
  }
  iVar2 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
  return CONCAT31((int3)((uint)iVar2 >> 8),iVar2 == 0);
}

