// 1001f030 size=195 FUN_1001f030

void FUN_1001f030(void)

{
  short sVar1;
  int in_EDX;
  int iVar2;
  
  if (*(int *)(in_EDX + 8) < 0) {
    iVar2 = *(int *)(in_EDX + 0xc);
  }
  else {
    iVar2 = *(int *)(in_EDX + 8) + DAT_101d49b0;
  }
  sVar1 = *(short *)(*(int *)(in_EDX + 4) + 6);
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    if (sVar1 != -1) {
      FUN_1001ed70();
      return;
    }
    if ((*(char *)(DAT_101ce770 + 8) != '\0') && (*(char *)(DAT_101ce7e0 + 8) != '\0')) {
      FUN_1001e6e0();
      return;
    }
    FUN_1001e920();
    return;
  }
  if (sVar1 != -1) {
    FUN_1001ee00(iVar2);
    return;
  }
  if ((*(char *)(DAT_101ce770 + 8) != '\0') && (*(char *)(DAT_101ce7e0 + 8) != '\0')) {
    FUN_1001ea80();
    return;
  }
  FUN_1001ec20();
  return;
}


