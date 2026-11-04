// 1008576b size=116 FUN_1008576b

undefined4 FUN_1008576b(void)

{
  uint uVar1;
  uint *in_ECX;
  bool bVar2;
  
  uVar1 = *in_ECX & 0xfff00000;
  if (uVar1 < 0x60800001) {
    if (uVar1 == 0x60800000) {
      return 1;
    }
    if (uVar1 == 0x10d00000) {
      return 1;
    }
    if (uVar1 == 0x10e00000) {
      return 1;
    }
    if (uVar1 == 0x60000000) {
      return 1;
    }
    if (uVar1 == 0x60200000) {
      return 1;
    }
    if (uVar1 == 0x60300000) {
      return 1;
    }
    if (uVar1 == 0x60500000) {
      return 1;
    }
    bVar2 = uVar1 == 0x60700000;
  }
  else {
    if (uVar1 == 0x60a00000) {
      return 1;
    }
    if (uVar1 == 0x60c00000) {
      return 1;
    }
    if (uVar1 == 0x60d00000) {
      return 1;
    }
    if (uVar1 == 0x60f00000) {
      return 1;
    }
    if (uVar1 == 0x61100000) {
      return 1;
    }
    bVar2 = uVar1 == 0x61200000;
  }
  if (bVar2) {
    return 1;
  }
  return 0;
}


