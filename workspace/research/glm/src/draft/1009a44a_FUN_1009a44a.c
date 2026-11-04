


unsigned char FUN_1009a44a(int param_1)

{
  int iVar1;
  unsigned int uVar2;
  
  while( true ) {
    while( true ) {
      if (param_1 == 0) {
        return true;
      }
      iVar1 = *(int *)(param_1 + 4);
      if (iVar1 != 1) break;
      iVar1 = FUN_1009a44a(*(unsigned int *)(param_1 + 8));
      if (iVar1 == 0) {
        return false;
      }
      param_1 = *(int *)(param_1 + 0xc);
    }
    if (iVar1 == 0xe) {
      return *(int *)(param_1 + 0x10) != 6;
    }
    if (iVar1 != 0xd) {
      return true;
    }
    iVar1 = *(int *)(param_1 + 0x1c);
    if (iVar1 < 0x14) break;
    if (iVar1 < 0x16) {
      return false;
    }
    if (iVar1 == 0x19) {
      return false;
    }
    if (iVar1 == 0x1a) {
      iVar1 = *(int *)(*(int *)(*(int *)(param_1 + 0x20) + 8) + 0x18);
      if (iVar1 < 0x47) {
        if (0x43 < iVar1) {
          return false;
        }
        if (iVar1 == 9) {
          return false;
        }
        if (iVar1 == 0x1a) {
          return false;
        }
        if (iVar1 == 0x28) {
          return false;
        }
        if (iVar1 == 0x3d) {
          return false;
        }
      }
      else if (0x48 < iVar1) {
        if (iVar1 < 0x4c) {
          return false;
        }
        if (0x4d < iVar1) {
          if (iVar1 < 0x51) {
            return false;
          }
          if ((0x52 < iVar1) && (iVar1 < 0x56)) {
            return false;
          }
        }
      }
      iVar1 = FUN_1009a44a(*(unsigned int *)(*(int *)(param_1 + 0x24) + 8));
      if (iVar1 == 0) {
        return false;
      }
      uVar2 = *(unsigned int *)(*(int *)(param_1 + 0x24) + 0xc);
      goto LAB_1009a550;
    }
    if (iVar1 != 0x1b) break;
    iVar1 = *(int *)(param_1 + 0x24);
    if (iVar1 == 0) {
      return false;
    }
    if (*(int *)(iVar1 + 4) != 0xd) {
      return false;
    }
    param_1 = *(int *)(iVar1 + 0x24);
  }
  iVar1 = FUN_1009a44a(*(unsigned int *)(param_1 + 0x20));
  if (iVar1 == 0) {
    return false;
  }
  uVar2 = *(unsigned int *)(param_1 + 0x24);
LAB_1009a550:
  iVar1 = FUN_1009a44a(uVar2);
  if (iVar1 != 0) {
    return true;
  }
  return false;
}


