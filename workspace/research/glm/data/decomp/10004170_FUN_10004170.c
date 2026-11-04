// 10004170 size=389 FUN_10004170

void FUN_10004170(void)

{
  int *in_EAX;
  int iVar1;
  float *pfVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *piVar6;
  float *pfVar7;
  int iStack_8;
  
  iStack_8 = FUN_10001940();
  iVar5 = in_EAX[1];
  iVar4 = *(int *)(*in_EAX + 0xcc);
  iVar1 = (*(code *)RI_Hunk_AllocInternal)(iStack_8 * 0x44);
  if (0 < iStack_8) {
    piVar6 = (int *)(iVar4 + iVar5 + 8);
    pfVar7 = (float *)(iVar1 + 0xc);
    do {
      pfVar2 = (float *)(*(code *)RI_DObjSetModel)(piVar6[-2]);
      pfVar7[-1] = *pfVar2;
      *pfVar7 = pfVar2[1];
      pfVar7[1] = pfVar2[2];
      pfVar7[2] = -pfVar2[3];
      *(byte *)((int)pfVar7 + 0xd) = (((int)*pfVar7 < 1) - 1U & 0xc) + 4;
      *(byte *)(pfVar7 + 3) = ((int)pfVar7[-1] < 1) - 1U & 0xc;
      *(byte *)((int)pfVar7 + 0xe) = (((int)pfVar7[1] < 1) - 1U & 0xc) + 8;
      pfVar7[4] = (float)(piVar6[-1] * 0x3c + DAT_101ae388);
      pfVar7[5] = (float)(DAT_101ae49c + *piVar6 * 0xc);
      *(char *)(pfVar7 + 6) = (char)piVar6[1];
      *(undefined1 *)((int)pfVar7 + 0x19) = 0;
      pfVar7[7] = 0.0;
      FUN_10059f50();
      piVar6 = piVar6 + 4;
      iStack_8 = iStack_8 + -1;
      pfVar7[0xb] = pfVar7[10] * pfVar2[1] - pfVar2[2] * pfVar7[9];
      pfVar7[0xc] = pfVar7[8] * pfVar2[2] - *pfVar2 * pfVar7[10];
      pfVar7[0xd] = *pfVar2 * pfVar7[9] - pfVar7[8] * pfVar2[1];
      pfVar7 = pfVar7 + 0x11;
    } while (iStack_8 != 0);
  }
  iVar5 = 0;
  if (0 < DAT_101ae384) {
    iVar4 = 0;
    do {
      if (*(int *)(iVar4 + 0x20 + DAT_101ae388) == 0) {
        iVar3 = 0;
      }
      else {
        iVar3 = (*(int *)(iVar4 + 0x24 + DAT_101ae388) / 0x44) * 0x44 + iVar1;
      }
      *(int *)(iVar4 + 0x24 + DAT_101ae388) = iVar3;
      iVar5 = iVar5 + 1;
      iVar4 = iVar4 + 0x3c;
    } while (iVar5 < DAT_101ae384);
  }
  return;
}


