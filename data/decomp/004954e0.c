
undefined4 __thiscall FUN_004954e0(undefined4 *param_1,int param_2)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  byte *pbVar4;
  byte *unaff_EBX;
  bool bVar5;
  
  iVar2 = DAT_00596d48 * 0x45c;
  if ((&DAT_00592b8c)[iVar2] != '\0') {
    (&DAT_00592b8c)[iVar2] = 0;
    *param_1 = *(undefined4 *)(&DAT_00592ba0 + iVar2);
    *(undefined4 *)(&DAT_00592b88 + iVar2) = *(undefined4 *)(&DAT_00592b9c + iVar2);
  }
  pbVar3 = (byte *)FUN_00495060(param_1,1);
  pbVar4 = pbVar3;
  do {
    bVar1 = *pbVar4;
    bVar5 = bVar1 < *unaff_EBX;
    if (bVar1 != *unaff_EBX) {
LAB_00495554:
      iVar2 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
      goto LAB_00495559;
    }
    if (bVar1 == 0) break;
    bVar1 = pbVar4[1];
    bVar5 = bVar1 < unaff_EBX[1];
    if (bVar1 != unaff_EBX[1]) goto LAB_00495554;
    pbVar4 = pbVar4 + 2;
    unaff_EBX = unaff_EBX + 2;
  } while (bVar1 != 0);
  iVar2 = 0;
LAB_00495559:
  if (iVar2 == 0) {
    return 1;
  }
  if (param_2 != 0) {
    FUN_00494c10();
    return 0;
  }
  FUN_00494b60("MatchToken: %s != %s\n",pbVar3);
  return 0;
}

