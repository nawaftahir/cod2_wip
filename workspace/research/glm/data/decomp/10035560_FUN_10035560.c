// 10035560 size=177 FUN_10035560

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10035560(float param_1)

{
  float fVar1;
  int in_ECX;
  undefined4 local_998;
  undefined1 local_994 [2432];
  undefined4 local_14;
  undefined4 local_c;
  undefined4 local_8;
  
  fVar1 = (float)*(int *)(DAT_1072ddc8 + 0x3c);
  if (*(int *)(DAT_1072ddc8 + 0x3c) < 0) {
    fVar1 = fVar1 + 4.2949673e+09;
  }
  fVar1 = fVar1 * param_1 * 0.0020833334;
  local_c = 0xb;
  local_8 = 0xc;
  local_14 = DAT_101d4848;
  local_998 = FUN_100351a0(_DAT_101d4c80 * fVar1,fVar1,DAT_101d4c6c,DAT_101d4c70,
                           *(undefined4 *)(&DAT_101d482c + in_ECX * 0x14),
                           *(undefined4 *)(&DAT_101d4830 + in_ECX * 0x14),local_994);
  FUN_10035490(&local_998);
  return;
}


