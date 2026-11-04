// 100854d2 size=88 FUN_100854d2

undefined4 FUN_100854d2(void)

{
  uint uVar1;
  uint *in_ECX;
  bool bVar2;
  
  uVar1 = *in_ECX & 0xfff00000;
  if (uVar1 < 0x70700001) {
    if (uVar1 == 0x70700000) {
      return 1;
    }
    if (uVar1 == 0x50300000) {
      return 1;
    }
    if (uVar1 == 0x70100000) {
      return 1;
    }
    if (uVar1 == 0x70200000) {
      return 1;
    }
    if (uVar1 == 0x70500000) {
      return 1;
    }
    bVar2 = uVar1 == 0x70600000;
  }
  else {
    if (uVar1 == 0x70b00000) {
      return 1;
    }
    if (uVar1 == 0x70c00000) {
      return 1;
    }
    if (uVar1 == 0x70d00000) {
      return 1;
    }
    bVar2 = uVar1 == 0x71000000;
  }
  if (bVar2) {
    return 1;
  }
  return 0;
}


