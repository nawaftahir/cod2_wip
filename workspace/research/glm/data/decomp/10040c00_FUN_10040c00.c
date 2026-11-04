// 10040c00 size=153 FUN_10040c00

void FUN_10040c00(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int in_ECX;
  undefined4 local_4;
  
  fVar1 = *(float *)(in_ECX + 0x48) - *(float *)(in_ECX + 0x3c);
  fVar3 = *(float *)(in_ECX + 0x4c) - *(float *)(in_ECX + 0x40);
  fVar2 = *(float *)(in_ECX + 0x50) - *(float *)(in_ECX + 0x44);
  local_4 = CONCAT13(*(undefined1 *)(in_ECX + 0x5b),
                     CONCAT21(CONCAT11(*(undefined1 *)(in_ECX + 0x58),*(undefined1 *)(in_ECX + 0x59)
                                      ),*(undefined1 *)(in_ECX + 0x5a)));
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_10040920();
    return;
  }
  FUN_10040580(*(undefined4 *)(DAT_101ce6a8 + 8),local_4,0,0,0x3f800000,
               SQRT(fVar1 * fVar1 + fVar3 * fVar3 + fVar2 * fVar2) * 0.00390625);
  return;
}


