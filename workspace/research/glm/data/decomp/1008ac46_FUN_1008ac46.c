// 1008ac46 size=141 FUN_1008ac46

void FUN_1008ac46(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  
  while( true ) {
    iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + param_2 * 4);
    iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
    if ((param_3 != 0) &&
       ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4) + 4) & 2) != 0)) {
      if (*(int *)(iVar1 + 0x18) != 0) {
        *(undefined4 *)(*(int *)(iVar1 + 0x18) + *(int *)(iVar1 + 0x14) * 4) =
             *(undefined4 *)(iVar2 + 0x48);
      }
      *(int *)(iVar1 + 0x14) = *(int *)(iVar1 + 0x14) + 1;
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + *(int *)(iVar2 + 0x48) * 4);
      if (*(int *)(iVar1 + 0x20) != 0) {
        *(int *)(*(int *)(iVar1 + 0x20) + *(int *)(iVar1 + 0x1c) * 4) = param_2;
      }
      *(int *)(iVar1 + 0x1c) = *(int *)(iVar1 + 0x1c) + 1;
    }
    if (*(int *)(iVar2 + 8) != -1) {
      FUN_1008ac46(*(int *)(iVar2 + 8),param_2,1);
    }
    param_1 = *(int *)(iVar2 + 0x14);
    if (param_1 == -1) break;
    param_3 = 1;
  }
  return;
}


