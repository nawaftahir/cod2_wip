// 100065c0 size=157 FUN_100065c0

uint FUN_100065c0(int param_1)

{
  float fVar1;
  bool bVar2;
  int in_EAX;
  uint uVar3;
  int in_ECX;
  byte *pbVar4;
  int in_EDX;
  ushort uVar5;
  
  bVar2 = false;
  if (0 < in_EAX) {
    pbVar4 = (byte *)(in_ECX + 0x11);
    do {
      uVar3 = (uint)pbVar4[2];
      if (param_1 <= (int)uVar3) {
        fVar1 = *(float *)((in_EDX - (uint)pbVar4[1]) + 0x1c) * *(float *)(pbVar4 + -9) +
                *(float *)((in_EDX - (uint)*pbVar4) + 0x14) * *(float *)(pbVar4 + -0xd) +
                *(float *)((in_EDX - (uint)pbVar4[-1]) + 0xc) * *(float *)(pbVar4 + -0x11) +
                *(float *)(pbVar4 + -5);
        uVar5 = (ushort)(fVar1 < 0.0) << 8 | (ushort)NAN(fVar1) << 10 |
                (ushort)(fVar1 == 0.0) << 0xe;
        uVar3 = (uint)uVar5;
        if (fVar1 < 0.0) {
          bVar2 = true;
        }
        else {
          uVar3 = (uint)CONCAT11((char)(uVar5 >> 8),(byte)param_1);
          pbVar4[2] = (byte)param_1;
        }
      }
      pbVar4 = pbVar4 + 0x14;
      in_EAX = in_EAX + -1;
    } while (in_EAX != 0);
    if (bVar2) {
LAB_10006657:
      return CONCAT31((int3)(uVar3 >> 8),1);
    }
  }
  uVar3 = 0;
  if (0 < DAT_101ce5c0) {
    do {
      if (param_1 <= *(int *)(*(int *)(DAT_101ce5c4 + uVar3 * 4) + 0x18)) goto LAB_10006657;
      uVar3 = uVar3 + 1;
    } while ((int)uVar3 < DAT_101ce5c0);
  }
  return uVar3 & 0xffffff00;
}


