// 10019a80 size=540 FUN_10019a80

bool FUN_10019a80(undefined4 *param_1,int param_2,int param_3,undefined4 *param_4,int param_5)

{
  byte bVar1;
  char cVar2;
  int iVar3;
  byte *pbVar4;
  char *pcVar5;
  int in_ECX;
  byte *pbVar6;
  int iVar7;
  byte *pbVar8;
  uint uVar9;
  undefined4 *puVar10;
  bool bVar11;
  int local_4;
  
  puVar10 = param_4;
  local_4 = in_ECX;
LAB_10019a85:
  param_4 = puVar10;
  iVar3 = FUN_1005faf0(&DAT_10195640,1);
  if (iVar3 == 0) {
    return false;
  }
  iVar3 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar3] != '\0') {
    (&DAT_101a6ab4)[iVar3] = 0;
    *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
    *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
  }
  pbVar4 = (byte *)FUN_1005f690(param_1);
  iVar3 = 0;
  puVar10 = param_4;
  do {
    pbVar8 = (byte *)*puVar10;
    pbVar6 = pbVar4;
    if (pbVar8 == (byte *)0x0) {
      FUN_1005f360("unknown constant source \'%s\'\n",pbVar4);
      return false;
    }
    do {
      bVar1 = *pbVar6;
      bVar11 = bVar1 < *pbVar8;
      if (bVar1 != *pbVar8) {
LAB_10019b24:
        iVar7 = (1 - (uint)bVar11) - (uint)(bVar11 != 0);
        goto LAB_10019b29;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar6[1];
      bVar11 = bVar1 < pbVar8[1];
      if (bVar1 != pbVar8[1]) goto LAB_10019b24;
      pbVar8 = pbVar8 + 2;
      pbVar6 = pbVar6 + 2;
    } while (bVar1 != 0);
    iVar7 = 0;
LAB_10019b29:
    if (iVar7 == 0) break;
    iVar3 = iVar3 + 1;
    puVar10 = puVar10 + 5;
  } while( true );
  if (param_4[iVar3 * 5 + 3] != 0) {
    if ((param_4[iVar3 * 5 + 2] == 0) && (1 < *(byte *)(param_2 + 5))) {
      cVar2 = FUN_10019970(param_2,&local_4);
    }
    else {
      cVar2 = FUN_10019480(param_4[iVar3 * 5 + 4],&local_4);
    }
    if (cVar2 == '\0') {
      return false;
    }
    param_3 = param_3 + local_4;
  }
  puVar10 = (undefined4 *)param_4[iVar3 * 5 + 2];
  if ((undefined4 *)param_4[iVar3 * 5 + 2] == (undefined4 *)0x0) {
    uVar9 = (uint)*(byte *)(param_4 + iVar3 * 5 + 1) + param_3;
    if ((int)uVar9 < 0xbb) {
      *(short *)(param_5 + 4) = (short)uVar9;
      *(undefined1 *)(param_5 + 6) = 0;
      *(undefined1 *)(param_5 + 7) = *(undefined1 *)(param_2 + 5);
      return true;
    }
    if (**(short **)(param_2 + 0xc) == 3) {
      uVar9 = uVar9 ^ 2;
    }
    pcVar5 = (char *)FUN_1005fa50();
    if (*pcVar5 == ';') {
      FUN_1005f3f0();
      *(short *)(param_5 + 4) = (short)uVar9;
      *(undefined1 *)(param_5 + 6) = 0;
      *(undefined1 *)(param_5 + 7) = *(undefined1 *)(*(int *)(param_2 + 8) + 8);
      return true;
    }
    if (*pcVar5 != '[') {
      FUN_1005f360("expected \';\' or \'[\', found \'%s\' instead\n",pcVar5);
      return false;
    }
    *(short *)(param_5 + 4) = (short)uVar9;
    iVar3 = FUN_1005ff30();
    if ((-1 < iVar3) && (iVar3 < 4)) {
      *(char *)(param_5 + 6) = (char)iVar3;
      *(undefined1 *)(param_5 + 7) = 1;
      iVar3 = FUN_1005faf0(&DAT_101958a8,1);
      return iVar3 != 0;
    }
    FUN_1005f360("row index %i should be in the range [0, 3]\n",iVar3);
    return false;
  }
  goto LAB_10019a85;
}


