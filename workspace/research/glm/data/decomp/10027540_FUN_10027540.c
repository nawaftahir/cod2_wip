// 10027540 size=69 FUN_10027540

int FUN_10027540(void)

{
  float fVar1;
  uint3 uVar2;
  int in_ECX;
  float *pfVar3;
  int iVar4;
  int unaff_ESI;
  
  iVar4 = 0;
  pfVar3 = (float *)(in_ECX + 4);
  do {
    fVar1 = *(float *)((uint)*(byte *)((int)pfVar3 + 0xe) + unaff_ESI) * pfVar3[1] +
            *(float *)((uint)*(byte *)((int)pfVar3 + 0xd) + unaff_ESI) * *pfVar3 +
            *(float *)((uint)*(byte *)(pfVar3 + 3) + unaff_ESI) * pfVar3[-1] + pfVar3[2];
    uVar2 = (uint3)(byte)(fVar1 < 0.0 | (byte)((ushort)((ushort)NAN(fVar1) << 10) >> 8) |
                         (byte)((ushort)((ushort)(fVar1 == 0.0) << 0xe) >> 8));
    if (fVar1 < 0.0 != (fVar1 == 0.0)) {
      return CONCAT31(uVar2,1);
    }
    iVar4 = iVar4 + 1;
    pfVar3 = pfVar3 + 5;
  } while (iVar4 != 5);
  return (uint)uVar2 << 8;
}


