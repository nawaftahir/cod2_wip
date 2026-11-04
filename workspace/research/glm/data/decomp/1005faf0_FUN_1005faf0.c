// 1005faf0 size=181 FUN_1005faf0

undefined4 FUN_1005faf0(byte *param_1,int param_2)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  undefined4 *in_ECX;
  byte *pbVar4;
  byte *pbVar5;
  bool bVar6;
  
  iVar2 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar2] != '\0') {
    (&DAT_101a6ab4)[iVar2] = 0;
    *in_ECX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
    *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
  }
  pbVar3 = (byte *)FUN_1005f690();
  pbVar4 = pbVar3;
  pbVar5 = param_1;
  do {
    bVar1 = *pbVar4;
    bVar6 = bVar1 < *pbVar5;
    if (bVar1 != *pbVar5) {
LAB_1005fb69:
      iVar2 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
      goto LAB_1005fb6e;
    }
    if (bVar1 == 0) break;
    bVar1 = pbVar4[1];
    bVar6 = bVar1 < pbVar5[1];
    if (bVar1 != pbVar5[1]) goto LAB_1005fb69;
    pbVar4 = pbVar4 + 2;
    pbVar5 = pbVar5 + 2;
  } while (bVar1 != 0);
  iVar2 = 0;
LAB_1005fb6e:
  if (iVar2 == 0) {
    return 1;
  }
  if (param_2 != 0) {
    FUN_1005f360();
    return 0;
  }
  FUN_1005f2d0("MatchToken: %s != %s\n",pbVar3,param_1);
  return 0;
}


