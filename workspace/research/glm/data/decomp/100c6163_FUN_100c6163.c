// 100c6163 size=122 FUN_100c6163

int FUN_100c6163(void)

{
  int iVar1;
  int in_ECX;
  int *piVar2;
  uint local_8;
  
  iVar1 = *(int *)(in_ECX + 0x100);
  local_8 = 0;
  if (*(int *)(iVar1 + 4) != 0) {
    piVar2 = *(int **)(iVar1 + 8);
    do {
      if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                             *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar2 * 4) + 4) * 4) + 5)
          & 2) != 0) {
        return 1;
      }
      local_8 = local_8 + 1;
      piVar2 = piVar2 + 1;
    } while (local_8 < *(uint *)(*(int *)(in_ECX + 0x100) + 4));
  }
  *(undefined4 *)(in_ECX + 0x15c) = 0;
  iVar1 = FUN_100c5bcc(0x100000,0,*(undefined4 *)(iVar1 + 8),0x100000,0,0);
  if (-1 < iVar1) {
    iVar1 = FUN_100be137();
  }
  return iVar1;
}


