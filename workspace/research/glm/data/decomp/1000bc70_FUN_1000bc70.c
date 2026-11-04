// 1000bc70 size=103 FUN_1000bc70

int FUN_1000bc70(int param_1)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  uint unaff_EDI;
  
  if ((0x1f < unaff_EDI) && (unaff_EDI < 0x80)) {
    return *(int *)(param_1 + 0x10) + (unaff_EDI * 3 + -0x60) * 8;
  }
  iVar2 = *(int *)(param_1 + 8) + -1;
  iVar4 = 0x60;
  if (0x5f < iVar2) {
    do {
      iVar1 = (iVar4 + iVar2) / 2;
      uVar3 = (uint)*(ushort *)(*(int *)(param_1 + 0x10) + iVar1 * 0x18);
      if (uVar3 == unaff_EDI) {
        return *(int *)(param_1 + 0x10) + iVar1 * 0x18;
      }
      if (uVar3 < unaff_EDI) {
        iVar4 = iVar1 + 1;
      }
      else {
        iVar2 = iVar1 + -1;
      }
    } while (iVar4 <= iVar2);
  }
  return *(int *)(param_1 + 0x10) + 0x150;
}


