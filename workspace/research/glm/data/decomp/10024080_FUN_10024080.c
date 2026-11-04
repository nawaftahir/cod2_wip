// 10024080 size=508 FUN_10024080

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10024080(void)

{
  float fVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int local_8;
  
  iVar2 = DAT_101d61ec;
  if (DAT_10678504 < DAT_101d61f4) {
    if (DAT_101d61cc == DAT_101d61ec) {
      local_8 = DAT_101d61f4 - DAT_101d61f0;
      if (local_8 < 1) {
        local_8 = 1;
      }
      fVar1 = (float)(DAT_10678504 - DAT_101d61f0) / (float)local_8;
      if (1.0 < fVar1) {
        fVar1 = 1.0;
      }
      _DAT_101d61bc = (_DAT_101d61fc - _DAT_101d61dc) * fVar1 + _DAT_101d61dc;
      _DAT_101d61c0 = (_DAT_101d6200 - _DAT_101d61e0) * fVar1 + _DAT_101d61e0;
      _DAT_101d61c4 = (_DAT_101d6204 - _DAT_101d61e4) * fVar1 + _DAT_101d61e4;
      DAT_101d61b8 = FUN_1010a8a8();
      DAT_101d61b9 = FUN_1010a8a8();
      DAT_101d61ba = FUN_1010a8a8();
      DAT_101d61bb = FUN_1010a8a8();
      DAT_101d61ac = iVar2;
      DAT_101d61c8 = 1;
      if ((DAT_101d620a != '\0') || (DAT_101d61ca = 0, DAT_101d61ea != '\0')) {
        DAT_101d61ca = 1;
      }
    }
    else {
      puVar3 = &DAT_101d61ec;
      puVar4 = &DAT_101d61ac;
      for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar4 = *puVar3;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 1;
      }
      DAT_101d61f4 = 0;
    }
  }
  else {
    puVar3 = &DAT_101d61ec;
    puVar4 = &DAT_101d61ac;
    for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar4 = *puVar3;
      puVar3 = puVar3 + 1;
      puVar4 = puVar4 + 1;
    }
  }
  if (DAT_101d620c == 0) {
    *(undefined4 *)(DAT_101da9c8 + 0x219cec) = 0;
    return;
  }
  puVar3 = &DAT_101d61ac;
  puVar4 = (undefined4 *)(DAT_101da9c8 + 0x219cec);
  for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  return;
}


