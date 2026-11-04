extern int FUN_10099580();


int FUN_10099b4f(int param_1)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  
  iVar2 = 0;
  if (param_1 == 0) {
    return 0;
  }
  do {
    if (*(int *)(param_1 + 4) != 1) break;
    iVar1 = FUN_10099b4f(*(unsigned int *)(param_1 + 8));
    param_1 = *(int *)(param_1 + 0xc);
    iVar2 = iVar2 + iVar1;
  } while (param_1 != 0);
  if (param_1 == 0) {
    return iVar2;
  }
  iVar1 = *(int *)(param_1 + 4);
  if (iVar1 == 6) {
    uVar3 = *(unsigned int *)(param_1 + 0x18);
  }
  else {
    if (iVar1 == 8) {
      iVar1 = FUN_10099b4f(*(unsigned int *)(param_1 + 0x10));
      iVar1 = iVar1 * *(int *)(param_1 + 0x14);
      goto LAB_10099bd4;
    }
    if (iVar1 == 9) {
      iVar1 = *(int *)(param_1 + 0x1c) * *(int *)(param_1 + 0x18);
      goto LAB_10099bd4;
    }
    if (iVar1 != 0xb) {
      FUN_10099580();
      return 0;
    }
    uVar3 = *(unsigned int *)(param_1 + 0x20);
  }
  iVar1 = FUN_10099b4f(uVar3);
LAB_10099bd4:
  return iVar1 + iVar2;
}


