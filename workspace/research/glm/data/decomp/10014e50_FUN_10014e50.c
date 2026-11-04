// 10014e50 size=212 FUN_10014e50

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_10014e50(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  int in_EAX;
  int in_ECX;
  
  fVar2 = DAT_101d4d04 - *(float *)(in_ECX + 4);
  fVar3 = _DAT_101d4d08 - *(float *)(in_ECX + 8);
  fVar4 = _DAT_101d4d0c - *(float *)(in_ECX + 0xc);
  fVar1 = DAT_101d4d04 - *(float *)(in_EAX + 4);
  fVar5 = _DAT_101d4d08 - *(float *)(in_EAX + 8);
  fVar6 = _DAT_101d4d0c - *(float *)(in_EAX + 0xc);
  fVar1 = (fVar1 * fVar1 + fVar5 * fVar5 + fVar6 * fVar6) *
          *(float *)(in_ECX + 0x10) * *(float *)(in_ECX + 0x10);
  fVar2 = (fVar2 * fVar2 + fVar3 * fVar3 + fVar4 * fVar4) *
          *(float *)(in_EAX + 0x10) * *(float *)(in_EAX + 0x10);
  if (fVar2 < fVar1 != (fVar2 == fVar1)) {
    return 1;
  }
  return 0;
}


