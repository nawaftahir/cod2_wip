extern unsigned int DAT_101ce6d0;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce71c;
extern unsigned int DAT_101ce754;
extern unsigned int DAT_101ce7a4;
extern unsigned int DAT_101d496d;


unsigned int FUN_10030a40(float param_1)

{
  float fVar1;
  unsigned int uVar2;
  unsigned short uVar3;
  
  uVar2 = *(unsigned int *)(DAT_101ce708 + 8);
  if (((((uVar2 == 2) || (DAT_101d496d == '\0')) || (*(char *)(DAT_101ce71c + 8) == '\0')) ||
      (*(char *)(DAT_101ce6d0 + 8) != '\0')) && (*(int *)(DAT_101ce754 + 8) != 2)) {
    if (uVar2 == 2) {
LAB_10030aac:
      return uVar2 & 0xffffff00;
    }
    fVar1 = *(float *)(DAT_101ce7a4 + 8);
    uVar3 = (unsigned short)(uVar2 >> 0x10);
    uVar2 = CONCAT22(uVar3,(unsigned short)(fVar1 < 0.0) << 8 | (unsigned short)NAN(fVar1) << 10 |
                           (unsigned short)(fVar1 == 0.0) << 0xe);
    if (fVar1 < 0.0 != 0 || (fVar1 == 0.0) != 0) {
      uVar2 = CONCAT22(uVar3,(unsigned short)(param_1 < 0.0) << 8 | (unsigned short)NAN(param_1) << 10 |
                             (unsigned short)(param_1 == 0.0) << 0xe);
      if (param_1 < 0.0 || (param_1 == 0.0) != 0) goto LAB_10030aac;
    }
  }
  return CONCAT31((int3)(uVar2 >> 8),1);
}


