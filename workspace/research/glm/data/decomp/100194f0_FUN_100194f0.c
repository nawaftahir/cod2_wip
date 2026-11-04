// 100194f0 size=303 FUN_100194f0

undefined4 FUN_100194f0(undefined4 *param_1,int param_2,undefined4 *param_3,int param_4)

{
  byte bVar1;
  char cVar2;
  int iVar3;
  byte *pbVar4;
  int in_ECX;
  byte *pbVar5;
  int iVar6;
  byte *pbVar7;
  undefined4 *puVar8;
  bool bVar9;
  int local_4;
  
  puVar8 = param_3;
  local_4 = in_ECX;
LAB_10019500:
  param_3 = puVar8;
  iVar3 = FUN_1005faf0(&DAT_10195640,1);
  if (iVar3 == 0) {
    return 0;
  }
  iVar3 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar3] != '\0') {
    (&DAT_101a6ab4)[iVar3] = 0;
    *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
    *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
  }
  pbVar4 = (byte *)FUN_1005f690(param_1);
  iVar3 = 0;
  puVar8 = param_3;
  do {
    pbVar7 = (byte *)*puVar8;
    pbVar5 = pbVar4;
    if (pbVar7 == (byte *)0x0) {
      FUN_1005f360("unknown sampler source \'%s\'\n",pbVar4);
      return 0;
    }
    do {
      bVar1 = *pbVar5;
      bVar9 = bVar1 < *pbVar7;
      if (bVar1 != *pbVar7) {
LAB_10019594:
        iVar6 = (1 - (uint)bVar9) - (uint)(bVar9 != 0);
        goto LAB_10019599;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar5[1];
      bVar9 = bVar1 < pbVar7[1];
      if (bVar1 != pbVar7[1]) goto LAB_10019594;
      pbVar7 = pbVar7 + 2;
      pbVar5 = pbVar5 + 2;
    } while (bVar1 != 0);
    iVar6 = 0;
LAB_10019599:
    if (iVar6 == 0) break;
    iVar3 = iVar3 + 1;
    puVar8 = puVar8 + 5;
  } while( true );
  if (param_3[iVar3 * 5 + 3] != 0) {
    cVar2 = FUN_10019480(param_3[iVar3 * 5 + 4],&local_4);
    if (cVar2 == '\0') {
      return 0;
    }
    param_2 = param_2 + local_4;
  }
  puVar8 = (undefined4 *)param_3[iVar3 * 5 + 2];
  if ((undefined4 *)param_3[iVar3 * 5 + 2] == (undefined4 *)0x0) {
    *(int *)(param_4 + 4) = param_3[iVar3 * 5 + 1] + param_2;
    return 1;
  }
  goto LAB_10019500;
}


