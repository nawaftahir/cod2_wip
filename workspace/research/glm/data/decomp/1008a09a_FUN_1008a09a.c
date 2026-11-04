// 1008a09a size=181 FUN_1008a09a

bool FUN_1008a09a(int param_1,int param_2,int param_3,int param_4)

{
  int iVar1;
  int in_ECX;
  int iVar2;
  uint uVar3;
  bool bVar4;
  uint local_8;
  
  uVar3 = 0;
  local_8 = 0;
  if (param_1 != -1) {
    iVar2 = param_1;
    do {
      iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4) + 0x14);
      local_8 = local_8 + 1;
    } while (iVar2 != -1);
  }
  if (param_3 != -1) {
    iVar2 = param_3;
    do {
      iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4) + 0x14);
      uVar3 = uVar3 + 1;
    } while (iVar2 != -1);
  }
  bVar4 = false;
  if (uVar3 < local_8) {
    iVar2 = local_8 - uVar3;
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
      param_2 = *(int *)(iVar1 + 0x18);
      local_8 = local_8 - 1;
      iVar2 = iVar2 + -1;
      param_1 = *(int *)(iVar1 + 0x14);
    } while (iVar2 != 0);
    bVar4 = uVar3 < local_8;
  }
  if (!bVar4 && uVar3 != local_8) {
    iVar2 = uVar3 - local_8;
    do {
      iVar2 = iVar2 + -1;
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_3 * 4);
      param_4 = *(int *)(iVar1 + 0x18);
      param_3 = *(int *)(iVar1 + 0x14);
    } while (iVar2 != 0);
  }
  if (param_1 != param_3) {
    do {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
      iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_3 * 4);
      param_2 = *(int *)(iVar2 + 0x18);
      param_4 = *(int *)(iVar1 + 0x18);
      param_1 = *(int *)(iVar2 + 0x14);
      param_3 = *(int *)(iVar1 + 0x14);
    } while (param_1 != param_3);
  }
  return param_2 != param_4;
}


