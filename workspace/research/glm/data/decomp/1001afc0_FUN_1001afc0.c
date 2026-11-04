// 1001afc0 size=316 FUN_1001afc0

bool FUN_1001afc0(undefined4 *param_1,undefined4 param_2,uint param_3,undefined4 *param_4)

{
  byte bVar1;
  char cVar2;
  int iVar3;
  byte *pbVar4;
  byte *pbVar5;
  char *pcVar6;
  undefined **ppuVar7;
  byte *pbVar8;
  uint uVar9;
  bool bVar10;
  
  iVar3 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar3] != '\0') {
    (&DAT_101a6ab4)[iVar3] = 0;
    *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
    *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
  }
  pbVar4 = (byte *)FUN_1005f690(param_1);
  uVar9 = 0;
  ppuVar7 = &PTR_s_select_10190100;
  do {
    pbVar8 = *ppuVar7;
    pbVar5 = pbVar4;
    do {
      bVar1 = *pbVar5;
      bVar10 = bVar1 < *pbVar8;
      if (bVar1 != *pbVar8) {
LAB_1001b044:
        iVar3 = (1 - (uint)bVar10) - (uint)(bVar10 != 0);
        goto LAB_1001b049;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar5[1];
      bVar10 = bVar1 < pbVar8[1];
      if (bVar1 != pbVar8[1]) goto LAB_1001b044;
      pbVar5 = pbVar5 + 2;
      pbVar8 = pbVar8 + 2;
    } while (bVar1 != 0);
    iVar3 = 0;
LAB_1001b049:
    if (iVar3 == 0) {
      if (((&DAT_1019010c)[uVar9 * 4] & param_3) == 0) {
        pcVar6 = "alpha";
        if (param_3 != 1) {
          pcVar6 = "color";
        }
        FUN_1005f360("%s is only valid for %s",pbVar4,pcVar6);
        return false;
      }
      *param_4 = (&DAT_10190104)[uVar9 * 4];
      cVar2 = FUN_1001af10(param_2,(&DAT_10190108)[uVar9 * 4],param_4);
      return cVar2 != '\0';
    }
    uVar9 = uVar9 + 1;
    ppuVar7 = ppuVar7 + 4;
    if (0x14 < uVar9) {
      FUN_1005f360("expected a texture function, found \'%s\' instead.\n",pbVar4);
      FUN_10061c80("Valid texture functions:.\n",pbVar4);
      uVar9 = 0;
      do {
        FUN_10061c80("  %s\n",*(undefined4 *)((int)&PTR_s_select_10190100 + uVar9));
        uVar9 = uVar9 + 0x10;
      } while (uVar9 < 0x150);
      return false;
    }
  } while( true );
}


