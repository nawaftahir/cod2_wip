// 1001ab70 size=311 FUN_1001ab70

void FUN_1001ab70(int param_1,undefined1 *param_2,undefined1 *param_3)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  byte *pbVar4;
  int iVar5;
  undefined4 *unaff_EBX;
  byte *pbVar6;
  bool bVar7;
  
  iVar2 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar2] != '\0') {
    (&DAT_101a6ab4)[iVar2] = 0;
    *unaff_EBX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
    *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
  }
  pbVar3 = (byte *)FUN_1005f690();
  iVar2 = 0;
  do {
    pbVar4 = (&PTR_s_gridLighting_10190250)[iVar2 * 2];
    pbVar6 = pbVar3;
    do {
      bVar1 = *pbVar4;
      bVar7 = bVar1 < *pbVar6;
      if (bVar1 != *pbVar6) {
LAB_1001abf4:
        iVar5 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_1001abf9;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar4[1];
      bVar7 = bVar1 < pbVar6[1];
      if (bVar1 != pbVar6[1]) goto LAB_1001abf4;
      pbVar4 = pbVar4 + 2;
      pbVar6 = pbVar6 + 2;
    } while (bVar1 != 0);
    iVar5 = 0;
LAB_1001abf9:
    if (iVar5 == 0) {
      iVar5 = FUN_1005faf0(&DAT_10195544,1);
      if (iVar5 != 0) {
        iVar5 = FUN_1005faf0(&DAT_10195540,1);
        if (iVar5 != 0) {
          iVar5 = FUN_1005faf0(&DAT_10195820,1);
          if (iVar5 != 0) {
            *(undefined1 *)(param_1 + (&DAT_10190254)[iVar2 * 2]) = 1;
            return;
          }
        }
      }
      *param_3 = 1;
      return;
    }
    iVar2 = iVar2 + 1;
    if (iVar2 == 5) {
      *param_2 = 1;
      iVar2 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar2] != '\0') {
        FUN_1005f2d0("UngetToken called twice");
      }
      (&DAT_101a6ab4)[iVar2] = 1;
      DAT_101aac74 = DAT_101aac78;
      return;
    }
  } while( true );
}


