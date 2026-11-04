// 10030a40 size=111 FUN_10030a40

uint FUN_10030a40(float param_1)

{
  float fVar1;
  uint uVar2;
  undefined2 uVar3;
  
  uVar2 = *(uint *)(DAT_101ce708 + 8);
  if (((((uVar2 == 2) || (DAT_101d496d == '\0')) || (*(char *)(DAT_101ce71c + 8) == '\0')) ||
      (*(char *)(DAT_101ce6d0 + 8) != '\0')) && (*(int *)(DAT_101ce754 + 8) != 2)) {
    if (uVar2 == 2) {
LAB_10030aac:
      return uVar2 & 0xffffff00;
    }
    fVar1 = *(float *)(DAT_101ce7a4 + 8);
    uVar3 = (undefined2)(uVar2 >> 0x10);
    uVar2 = CONCAT22(uVar3,(ushort)(fVar1 < 0.0) << 8 | (ushort)NAN(fVar1) << 10 |
                           (ushort)(fVar1 == 0.0) << 0xe);
    if (fVar1 < 0.0 != 0 || (fVar1 == 0.0) != 0) {
      uVar2 = CONCAT22(uVar3,(ushort)(param_1 < 0.0) << 8 | (ushort)NAN(param_1) << 10 |
                             (ushort)(param_1 == 0.0) << 0xe);
      if (param_1 < 0.0 || (param_1 == 0.0) != 0) goto LAB_10030aac;
    }
  }
  return CONCAT31((int3)(uVar2 >> 8),1);
}


