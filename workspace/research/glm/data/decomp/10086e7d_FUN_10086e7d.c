// 10086e7d size=49 FUN_10086e7d

void FUN_10086e7d(int param_1,uint *param_2)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  
  iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4) + 0x14);
  uVar2 = 0;
  if (iVar1 != -1) {
    do {
      iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar1 * 4) + 0x14);
      uVar2 = uVar2 + 1;
    } while (iVar1 != -1);
    if (*param_2 < uVar2) {
      *param_2 = uVar2;
    }
  }
  return;
}


