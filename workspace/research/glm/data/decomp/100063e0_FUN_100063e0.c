// 100063e0 size=199 FUN_100063e0

uint FUN_100063e0(void)

{
  int iVar1;
  float fVar2;
  int in_EAX;
  uint uVar3;
  int in_ECX;
  byte *pbVar4;
  float *pfVar5;
  int in_EDX;
  int iVar6;
  int iVar7;
  
  iVar6 = 0;
  if (0 < in_EAX) {
    pbVar4 = (byte *)(in_ECX + 0x11);
    do {
      pbVar4[2] = 0xff;
      fVar2 = *(float *)((uint)pbVar4[1] + in_EDX) * *(float *)(pbVar4 + -9) +
              *(float *)((uint)*pbVar4 + in_EDX) * *(float *)(pbVar4 + -0xd) +
              *(float *)((uint)pbVar4[-1] + in_EDX) * *(float *)(pbVar4 + -0x11) +
              *(float *)(pbVar4 + -5);
      if (fVar2 < 0.0 != (fVar2 == 0.0)) {
        return CONCAT31((uint3)(byte)(fVar2 < 0.0 | (byte)((ushort)((ushort)NAN(fVar2) << 10) >> 8)
                                     | (byte)((ushort)((ushort)(fVar2 == 0.0) << 0xe) >> 8)),1);
      }
      iVar6 = iVar6 + 1;
      pbVar4 = pbVar4 + 0x14;
    } while (iVar6 < in_EAX);
  }
  iVar6 = 0;
  if (0 < (int)DAT_101ce5c0) {
    do {
      iVar1 = *(int *)(DAT_101ce5c4 + iVar6 * 4);
      pfVar5 = *(float **)(iVar1 + 0x20);
      iVar7 = 0;
      uVar3 = DAT_101ce5c0;
      while( true ) {
        if (*(int *)(iVar1 + 0x1c) <= iVar7) {
          return CONCAT31((int3)(uVar3 >> 8),1);
        }
        *(undefined1 *)((int)pfVar5 + 0x13) = 0xff;
        fVar2 = *(float *)((uint)*(byte *)((int)pfVar5 + 0x12) + in_EDX) * pfVar5[2] +
                *(float *)((uint)*(byte *)(pfVar5 + 4) + in_EDX) * *pfVar5 +
                *(float *)((uint)*(byte *)((int)pfVar5 + 0x11) + in_EDX) * pfVar5[1] + pfVar5[3];
        uVar3 = (uint)(ushort)((ushort)(fVar2 < 0.0) << 8 | (ushort)NAN(fVar2) << 10 |
                              (ushort)(fVar2 == 0.0) << 0xe);
        if (fVar2 < 0.0 == 0 && (fVar2 == 0.0) == 0) break;
        iVar7 = iVar7 + 1;
        pfVar5 = pfVar5 + 5;
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 < (int)DAT_101ce5c0);
  }
  return DAT_101ce5c0 & 0xffffff00;
}


