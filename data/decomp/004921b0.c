
short FUN_004921b0(byte *param_1,float *param_2)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  int iVar4;
  short sVar5;
  byte *pbVar6;
  bool bVar7;
  
  if (param_1 == (byte *)0x0) {
    return -1;
  }
  sVar5 = 0;
  if (0 < DAT_01154630) {
    do {
      iVar2 = (int)sVar5;
      pbVar3 = (byte *)(&DAT_01154680)[iVar2 * 0x12];
      pbVar6 = param_1;
      do {
        bVar1 = *pbVar3;
        bVar7 = bVar1 < *pbVar6;
        if (bVar1 != *pbVar6) {
LAB_00492214:
          iVar4 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
          goto LAB_00492219;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar3[1];
        bVar7 = bVar1 < pbVar6[1];
        if (bVar1 != pbVar6[1]) goto LAB_00492214;
        pbVar3 = pbVar3 + 2;
        pbVar6 = pbVar6 + 2;
      } while (bVar1 != 0);
      iVar4 = 0;
LAB_00492219:
      if (iVar4 == 0) {
        if (param_2 == (float *)0x0) {
          return sVar5;
        }
        if ((((float)(&DAT_0115469c)[iVar2 * 0x12] == *param_2) &&
            ((float)(&DAT_011546a0)[iVar2 * 0x12] == param_2[1])) &&
           ((float)(&DAT_011546a4)[iVar2 * 0x12] == param_2[2])) {
          return sVar5;
        }
      }
      sVar5 = sVar5 + 1;
    } while (sVar5 < DAT_01154630);
  }
  return -1;
}

