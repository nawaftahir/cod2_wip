// 10085604 size=359 FUN_10085604

undefined4 FUN_10085604(void)

{
  uint uVar1;
  uint *in_ECX;
  bool bVar2;
  
  uVar1 = *in_ECX & 0xfff00000;
  if (uVar1 < 0x73800001) {
    if (uVar1 == 0x73800000) {
      return 1;
    }
    if (uVar1 < 0x20900001) {
      if (uVar1 == 0x20900000) {
        return 1;
      }
      if (uVar1 < 0x11400001) {
        if (uVar1 == 0x11400000) {
          return 1;
        }
        if (uVar1 == 0x10f00000) {
          return 1;
        }
        if (uVar1 == 0x11100000) {
          return 1;
        }
        if (uVar1 == 0x11200000) {
          return 1;
        }
        bVar2 = uVar1 == 0x11300000;
      }
      else {
        if (uVar1 == 0x11500000) {
          return 1;
        }
        if (uVar1 == 0x20700000) {
          return 1;
        }
        bVar2 = uVar1 == 0x20800000;
      }
    }
    else if (uVar1 < 0x73400001) {
      if (uVar1 == 0x73400000) {
        return 1;
      }
      if (uVar1 == 0x73000000) {
        return 1;
      }
      if (uVar1 == 0x73100000) {
        return 1;
      }
      if (uVar1 == 0x73200000) {
        return 1;
      }
      bVar2 = uVar1 == 0x73300000;
    }
    else {
      if (uVar1 == 0x73500000) {
        return 1;
      }
      if (uVar1 == 0x73600000) {
        return 1;
      }
      bVar2 = uVar1 == 0x73700000;
    }
  }
  else if (uVar1 < 0x74100001) {
    if (uVar1 == 0x74100000) {
      return 1;
    }
    if (uVar1 < 0x73d00001) {
      if (uVar1 == 0x73d00000) {
        return 1;
      }
      if (uVar1 == 0x73900000) {
        return 1;
      }
      if (uVar1 == 0x73a00000) {
        return 1;
      }
      if (uVar1 == 0x73b00000) {
        return 1;
      }
      bVar2 = uVar1 == 0x73c00000;
    }
    else {
      if (uVar1 == 0x73e00000) {
        return 1;
      }
      if (uVar1 == 0x73f00000) {
        return 1;
      }
      bVar2 = uVar1 == 0x74000000;
    }
  }
  else if (uVar1 < 0x74600001) {
    if (uVar1 == 0x74600000) {
      return 1;
    }
    if (uVar1 == 0x74200000) {
      return 1;
    }
    if (uVar1 == 0x74300000) {
      return 1;
    }
    if (uVar1 == 0x74400000) {
      return 1;
    }
    bVar2 = uVar1 == 0x74500000;
  }
  else {
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


