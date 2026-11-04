// 100191a0 size=587 FUN_100191a0

uint FUN_100191a0(undefined4 *param_1,int param_2)

{
  byte *pbVar1;
  uint uVar2;
  int iVar3;
  char *pcVar4;
  uint uVar5;
  undefined4 uVar6;
  undefined3 uVar7;
  undefined3 extraout_var;
  char *pcVar8;
  bool bVar9;
  byte local_2a;
  byte local_29;
  byte *local_28;
  undefined4 local_24;
  byte local_20 [32];
  
  local_28 = (byte *)((int)&local_24 + 2);
  local_24 = 0;
  do {
    iVar3 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar3] != '\0') {
      (&DAT_101a6ab4)[iVar3] = 0;
      *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
      *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
    }
    pcVar4 = (char *)FUN_1005f690(param_1);
    iVar3 = 7;
    bVar9 = true;
    pcVar8 = "vertex";
    do {
      if (iVar3 == 0) break;
      iVar3 = iVar3 + -1;
      bVar9 = *pcVar4 == *pcVar8;
      pcVar4 = pcVar4 + 1;
      pcVar8 = pcVar8 + 1;
    } while (bVar9);
    if (!bVar9) {
      iVar3 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar3] != '\0') {
        FUN_1005f2d0("UngetToken called twice");
      }
      (&DAT_101a6ab4)[iVar3] = 1;
      DAT_101aac74 = DAT_101aac78;
      uVar6 = FUN_10016780(local_20,local_24,&local_29);
      *(undefined4 *)(param_2 + 4) = uVar6;
      uVar7 = (undefined3)((uint)uVar6 >> 8);
      if (local_29 == 0) {
        FUN_10016740();
        uVar7 = extraout_var;
      }
      return CONCAT31(uVar7,1);
    }
    iVar3 = FUN_1005faf0(&DAT_10195640,1);
    uVar5 = 0;
    if (iVar3 == 0) goto LAB_100193e1;
    iVar3 = DAT_101aac70 * 0x45c;
    if ((&DAT_101a6ab4)[iVar3] != '\0') {
      (&DAT_101a6ab4)[iVar3] = 0;
      *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
      *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
    }
    FUN_1005f690(param_1);
    uVar5 = FUN_10018ff0();
    if ((char)uVar5 == '\0') goto LAB_100193e1;
    iVar3 = FUN_1005faf0(&DAT_1019563c,1);
    uVar5 = 0;
    if (iVar3 == 0) goto LAB_100193e1;
    iVar3 = FUN_1005faf0(&DAT_10195634,1);
    uVar5 = 0;
    if (iVar3 == 0) goto LAB_100193e1;
    iVar3 = FUN_1005faf0(&DAT_10195640,1);
    uVar5 = 0;
    if (iVar3 == 0) goto LAB_100193e1;
    FUN_1005fa50();
    uVar5 = FUN_100190c0(param_1);
    if ((char)uVar5 == '\0') goto LAB_100193e1;
    iVar3 = FUN_1005faf0(&DAT_10195820,1);
    uVar5 = 0;
    pbVar1 = local_28;
    uVar2 = local_24;
    if (iVar3 == 0) goto LAB_100193e1;
    for (; ((0 < (int)uVar2 && (local_29 <= *pbVar1)) &&
           ((*pbVar1 != local_29 || (local_2a <= pbVar1[1])))); pbVar1 = pbVar1 + -2) {
      *(undefined2 *)(pbVar1 + 2) = *(undefined2 *)pbVar1;
      uVar2 = uVar2 - 1;
    }
    local_24 = local_24 + 1;
    local_28 = local_28 + 2;
    local_20[uVar2 * 2] = local_29;
    local_20[uVar2 * 2 + 1] = local_2a;
  } while (local_24 < 0x10);
  uVar5 = FUN_1005f360("More than %i vertex mappings\n",local_24);
LAB_100193e1:
  return uVar5 & 0xffffff00;
}


