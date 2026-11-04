// 10006300 size=214 FUN_10006300

uint FUN_10006300(int param_1)

{
  int iVar1;
  float fVar2;
  uint uVar3;
  int in_ECX;
  byte *pbVar4;
  float *pfVar5;
  int in_EDX;
  int unaff_EBX;
  int iVar6;
  int iVar7;
  
  iVar6 = 0;
  if (0 < param_1) {
    pbVar4 = (byte *)(in_ECX + 0x13);
    do {
      if (unaff_EBX <= (int)(uint)*pbVar4) {
        *pbVar4 = 0xff;
        fVar2 = *(float *)((uint)pbVar4[-1] + in_EDX) * *(float *)(pbVar4 + -0xb) +
                *(float *)((uint)pbVar4[-2] + in_EDX) * *(float *)(pbVar4 + -0xf) +
                *(float *)((uint)pbVar4[-3] + in_EDX) * *(float *)(pbVar4 + -0x13) +
                *(float *)(pbVar4 + -7);
        if (fVar2 < 0.0 != (fVar2 == 0.0)) {
          return CONCAT31((uint3)(byte)(fVar2 < 0.0 |
                                        (byte)((ushort)((ushort)NAN(fVar2) << 10) >> 8) |
                                       (byte)((ushort)((ushort)(fVar2 == 0.0) << 0xe) >> 8)),1);
        }
      }
      iVar6 = iVar6 + 1;
      pbVar4 = pbVar4 + 0x14;
    } while (iVar6 < param_1);
  }
  iVar6 = 0;
  if (0 < (int)DAT_101ce5c0) {
    do {
      iVar1 = *(int *)(DAT_101ce5c4 + iVar6 * 4);
      if (unaff_EBX <= *(int *)(iVar1 + 0x18)) {
        pfVar5 = *(float **)(iVar1 + 0x20);
        iVar7 = 0;
        uVar3 = DAT_101ce5c0;
        do {
          if (*(int *)(iVar1 + 0x1c) <= iVar7) {
            return CONCAT31((int3)(uVar3 >> 8),1);
          }
          uVar3 = (uint)*(byte *)((int)pfVar5 + 0x13);
          if (unaff_EBX <= (int)uVar3) {
            *(undefined1 *)((int)pfVar5 + 0x13) = 0xff;
            fVar2 = *(float *)((uint)*(byte *)((int)pfVar5 + 0x12) + in_EDX) * pfVar5[2] +
                    *(float *)((uint)*(byte *)(pfVar5 + 4) + in_EDX) * *pfVar5 +
                    *(float *)((uint)*(byte *)((int)pfVar5 + 0x11) + in_EDX) * pfVar5[1] + pfVar5[3]
            ;
            uVar3 = (uint)(ushort)((ushort)(fVar2 < 0.0) << 8 | (ushort)NAN(fVar2) << 10 |
                                  (ushort)(fVar2 == 0.0) << 0xe);
            if (fVar2 < 0.0 == 0 && (fVar2 == 0.0) == 0) break;
          }
          iVar7 = iVar7 + 1;
          pfVar5 = pfVar5 + 5;
        } while( true );
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 < (int)DAT_101ce5c0);
  }
  return DAT_101ce5c0 & 0xffffff00;
}


