// 100b8143 size=57 FUN_100b8143

int FUN_100b8143(void)

{
  int in_EAX;
  int *piVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  
  uVar3 = 0;
  if (*(uint *)(in_EAX + 4) != 0) {
    piVar1 = *(int **)(in_EAX + 8);
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4);
      if (*(int *)(iVar2 + 8) != -1) {
        iVar2 = FUN_100b7415(*(undefined4 *)(iVar2 + 8));
        if (-1 < iVar2) {
          return 0;
        }
        return iVar2;
      }
      uVar3 = uVar3 + 1;
      piVar1 = piVar1 + 1;
    } while (uVar3 < *(uint *)(in_EAX + 4));
  }
  return 0;
}


