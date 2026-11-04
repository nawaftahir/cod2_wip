// 100184d0 size=220 FUN_100184d0

undefined4 FUN_100184d0(undefined4 param_1,int param_2)

{
  int *piVar1;
  byte bVar2;
  byte *pbVar3;
  int iVar4;
  int iVar5;
  byte *in_EDX;
  undefined4 *puVar6;
  undefined **ppuVar7;
  char *pcVar8;
  int iVar9;
  bool bVar10;
  
  pcVar8 = "mtlAlphaTest";
  iVar9 = 0;
  ppuVar7 = &PTR_s_mtlAlphaTest_1018fd50;
  pbVar3 = in_EDX;
LAB_100184e7:
  do {
    bVar2 = *pbVar3;
    bVar10 = bVar2 < (byte)*pcVar8;
    if (bVar2 == *pcVar8) {
      if (bVar2 != 0) {
        bVar2 = pbVar3[1];
        bVar10 = bVar2 < (byte)pcVar8[1];
        if (bVar2 != pcVar8[1]) goto LAB_1001850b;
        pcVar8 = pcVar8 + 2;
        pbVar3 = pbVar3 + 2;
        if (bVar2 != 0) goto LAB_100184e7;
      }
      iVar4 = 0;
    }
    else {
LAB_1001850b:
      iVar4 = (1 - (uint)bVar10) - (uint)(bVar10 != 0);
    }
    if (iVar4 == 0) {
      iVar4 = FUN_1005faf0(&DAT_10195884,1);
      if (iVar4 != 0) {
        iVar4 = FUN_10018420();
        if (iVar4 != 0) {
          iVar5 = 0;
          if ((&DAT_1018fd58)[iVar9 * 4] == 0) {
            puVar6 = &DAT_1018fd58 + iVar9 * 4;
            do {
              piVar1 = puVar6 + 1;
              puVar6 = puVar6 + 1;
              iVar5 = iVar5 + 1;
            } while (*piVar1 == 0);
          }
          *(uint *)(param_2 + iVar5 * 4) =
               *(uint *)(param_2 + iVar5 * 4) | (&DAT_1018fd58)[iVar9 * 4 + iVar5];
          *(uint *)(param_2 + 8 + iVar5 * 4) =
               *(uint *)(param_2 + 8 + iVar5 * 4) | *(uint *)(iVar4 + 4);
          return 0;
        }
      }
      return 2;
    }
    pcVar8 = ppuVar7[4];
    ppuVar7 = ppuVar7 + 4;
    iVar9 = iVar9 + 1;
    pbVar3 = in_EDX;
    if ((byte *)pcVar8 == (byte *)0x0) {
      return 1;
    }
  } while( true );
}


