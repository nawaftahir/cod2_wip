// 100064b0 size=264 FUN_100064b0

uint FUN_100064b0(int param_1)

{
  int iVar1;
  float fVar2;
  bool bVar3;
  int in_EAX;
  int iVar4;
  int in_ECX;
  byte *pbVar5;
  float *pfVar6;
  int iVar7;
  int iVar8;
  int unaff_EDI;
  
  iVar7 = 0;
  if (0 < in_EAX) {
    pbVar5 = (byte *)(in_ECX + 0x13);
    do {
      if (param_1 <= (int)(uint)*pbVar5) {
        *pbVar5 = 0xff;
        fVar2 = *(float *)((uint)pbVar5[-1] + unaff_EDI) * *(float *)(pbVar5 + -0xb) +
                *(float *)((uint)pbVar5[-2] + unaff_EDI) * *(float *)(pbVar5 + -0xf) +
                *(float *)((uint)pbVar5[-3] + unaff_EDI) * *(float *)(pbVar5 + -0x13) +
                *(float *)(pbVar5 + -7);
        if (fVar2 < 0.0 != (fVar2 == 0.0)) {
          return CONCAT31((uint3)(byte)(fVar2 < 0.0 |
                                        (byte)((ushort)((ushort)NAN(fVar2) << 10) >> 8) |
                                       (byte)((ushort)((ushort)(fVar2 == 0.0) << 0xe) >> 8)),1);
        }
      }
      iVar7 = iVar7 + 1;
      pbVar5 = pbVar5 + 0x14;
    } while (iVar7 < in_EAX);
  }
  iVar7 = 0;
  if (0 < (int)DAT_101ce5c0) {
    do {
      iVar1 = *(int *)(DAT_101ce5c4 + iVar7 * 4);
      if (param_1 <= *(int *)(iVar1 + 0x18)) {
        iVar4 = *(int *)(iVar1 + 0x1c);
        pfVar6 = *(float **)(iVar1 + 0x20);
        iVar8 = 0;
        bVar3 = true;
        if (iVar4 < 1) {
LAB_100065b2:
          return CONCAT31((int3)((uint)iVar4 >> 8),1);
        }
        do {
          if (param_1 <= (int)(uint)*(byte *)((int)pfVar6 + 0x13)) {
            *(undefined1 *)((int)pfVar6 + 0x13) = 0xff;
            if (*(float *)((uint)*(byte *)((int)pfVar6 + 0x12) + unaff_EDI) * pfVar6[2] +
                *(float *)((uint)*(byte *)(pfVar6 + 4) + unaff_EDI) * *pfVar6 +
                *(float *)((uint)*(byte *)((int)pfVar6 + 0x11) + unaff_EDI) * pfVar6[1] + pfVar6[3]
                <= 0.0) {
              *(undefined1 *)((int)pfVar6 + 0x13) = (undefined1)param_1;
            }
            else {
              bVar3 = false;
            }
          }
          iVar4 = *(int *)(iVar1 + 0x1c);
          iVar8 = iVar8 + 1;
          pfVar6 = pfVar6 + 5;
        } while (iVar8 < iVar4);
        if (bVar3) goto LAB_100065b2;
      }
      iVar7 = iVar7 + 1;
    } while (iVar7 < (int)DAT_101ce5c0);
  }
  return DAT_101ce5c0 & 0xffffff00;
}


