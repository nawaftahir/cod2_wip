// 1009a3ce size=124 FUN_1009a3ce

bool FUN_1009a3ce(int param_1)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  
  while( true ) {
    while( true ) {
      if (param_1 == 0) {
        return false;
      }
      iVar2 = *(int *)(param_1 + 4);
      if (iVar2 != 1) break;
      iVar2 = FUN_1009a3ce(*(undefined4 *)(param_1 + 8));
      if (iVar2 != 0) {
        return true;
      }
      param_1 = *(int *)(param_1 + 0xc);
    }
    if (iVar2 == 0xe) {
      return *(int *)(param_1 + 0x10) != 6;
    }
    if (iVar2 != 0xd) {
      return false;
    }
    iVar2 = *(int *)(param_1 + 0x1c);
    if (0x17 < iVar2) break;
    if (iVar2 < 0x16) {
      if (iVar2 < 0) {
        return true;
      }
      if (1 < iVar2) {
        if (iVar2 < 0x14) {
          return true;
        }
        bVar4 = SBORROW4(iVar2,0x15);
        iVar1 = -0x15;
        bVar3 = iVar2 == 0x15;
        goto LAB_1009a43b;
      }
    }
    param_1 = *(int *)(param_1 + 0x20);
  }
  if (iVar2 < 0x19) {
    return true;
  }
  bVar4 = SBORROW4(iVar2,0x1a);
  iVar1 = -0x1a;
  bVar3 = iVar2 == 0x1a;
LAB_1009a43b:
  if (bVar3 || bVar4 != iVar2 + iVar1 < 0) {
    return false;
  }
  return true;
}


