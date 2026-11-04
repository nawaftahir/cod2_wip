// 1008552a size=134 FUN_1008552a

undefined4 FUN_1008552a(void)

{
  uint uVar1;
  uint *in_ECX;
  bool bVar2;
  
  uVar1 = *in_ECX & 0xfff00000;
  if (uVar1 < 0x74200001) {
    if (uVar1 == 0x74200000) {
      return 1;
    }
    if (uVar1 < 0x11500001) {
      if (uVar1 == 0x11500000) {
        return 1;
      }
      if (uVar1 == 0x11100000) {
        return 1;
      }
      if (uVar1 == 0x11200000) {
        return 1;
      }
      if (uVar1 == 0x11300000) {
        return 1;
      }
      bVar2 = uVar1 == 0x11400000;
    }
    else {
      if (uVar1 == 0x20800000) {
        return 1;
      }
      if (uVar1 == 0x20900000) {
        return 1;
      }
      bVar2 = uVar1 == 0x74100000;
    }
  }
  else {
    if (uVar1 == 0x74300000) {
      return 1;
    }
    if (uVar1 == 0x74400000) {
      return 1;
    }
    if (uVar1 == 0x74500000) {
      return 1;
    }
    if (uVar1 == 0x74600000) {
      return 1;
    }
    if (uVar1 == 0x74700000) {
      return 1;
    }
    if (uVar1 == 0x74a00000) {
      return 1;
    }
    bVar2 = uVar1 == 0x74b00000;
  }
  if (bVar2) {
    return 1;
  }
  return 0;
}


