
uint FUN_00483690(void)

{
  float fVar1;
  float in_EAX;
  byte bVar2;
  float *pfVar3;
  byte bVar4;
  float *unaff_ESI;
  float local_c;
  
  bVar4 = 0;
  if (unaff_ESI == (float *)0x0) {
    return (uint)in_EAX & 0xffffff00;
  }
  local_c = 0.0;
  bVar2 = 0;
  pfVar3 = (float *)&DAT_00591f9c;
  do {
    fVar1 = *pfVar3 * unaff_ESI[1] + pfVar3[1] * unaff_ESI[2] + pfVar3[-1] * *unaff_ESI;
    in_EAX = (float)CONCAT22((short)((uint)in_EAX >> 0x10),
                             (ushort)(fVar1 < local_c) << 8 |
                             (ushort)(NAN(fVar1) || NAN(local_c)) << 10 |
                             (ushort)(fVar1 == local_c) << 0xe);
    if (fVar1 < local_c == 0 && (fVar1 == local_c) == 0) {
      in_EAX = fVar1;
      local_c = fVar1;
      bVar4 = bVar2;
    }
    bVar2 = bVar2 + 1;
    pfVar3 = pfVar3 + 3;
  } while (bVar2 < 0xa2);
  return CONCAT31((int3)((uint)in_EAX >> 8),bVar4);
}

