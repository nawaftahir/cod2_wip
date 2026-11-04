// 100cb9d7 size=117 FUN_100cb9d7

void FUN_100cb9d7(int param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  int iVar3;
  
  do {
    do {
      iVar3 = param_2;
      iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) + iVar3 * 4);
      param_2 = *(int *)(iVar2 + 0x38);
    } while (*(int *)(iVar2 + 0x38) != -1);
    *(undefined4 *)(iVar2 + 0x30) = 0xffffffff;
    *(int *)(iVar2 + 0x74) = param_1;
    if ((*(byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x10) + *(int *)(iVar2 + 4) * 4) + 4) &
        0x10) == 0) {
      if (*(int *)(in_ECX + 0x10) != 0) {
        *(int *)(*(int *)(in_ECX + 0x10) +
                (*(int *)(*(int *)(in_ECX + 0xc) + param_1 * 4) +
                *(int *)(*(int *)(in_ECX + 8) + param_1 * 4)) * 4) = iVar3;
      }
      piVar1 = (int *)(*(int *)(in_ECX + 8) + param_1 * 4);
      *piVar1 = *piVar1 + 1;
    }
    param_2 = *(int *)(iVar2 + 8);
  } while (*(int *)(iVar2 + 8) != -1);
  return;
}


