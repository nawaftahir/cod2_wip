
undefined4 FUN_0049fb60(void)

{
  byte bVar1;
  byte *pbVar2;
  byte *pbVar3;
  int iVar4;
  bool bVar5;
  
  pbVar2 = (byte *)FUN_0040af30();
  pbVar3 = (byte *)FUN_0040af30();
  while( true ) {
    bVar1 = *pbVar3;
    bVar5 = bVar1 < *pbVar2;
    if (bVar1 != *pbVar2) break;
    if (bVar1 == 0) {
      return 1;
    }
    bVar1 = pbVar3[1];
    bVar5 = bVar1 < pbVar2[1];
    if (bVar1 != pbVar2[1]) break;
    pbVar3 = pbVar3 + 2;
    pbVar2 = pbVar2 + 2;
    if (bVar1 == 0) {
      return 1;
    }
  }
  iVar4 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
  return CONCAT31((int3)((uint)iVar4 >> 8),iVar4 == 0);
}

