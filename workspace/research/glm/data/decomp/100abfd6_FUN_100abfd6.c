// 100abfd6 size=104 FUN_100abfd6

int FUN_100abfd6(int param_1,int param_2,uint *param_3)

{
  int iVar1;
  int in_ECX;
  uint local_8;
  
  local_8 = 0;
  if (*(int *)(param_1 + 0x1c) == 0) {
    return 0;
  }
  while( true ) {
    iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + *(int *)(*(int *)(param_1 + 0x20) + local_8 * 4) * 4)
    ;
    if (*(int *)(iVar1 + 0x28) != 1) {
      if (0xf < *param_3) {
        return -0x7fffbffb;
      }
      *(int *)(param_2 + *param_3 * 4) = iVar1;
      *param_3 = *param_3 + 1;
    }
    iVar1 = FUN_100abfd6(iVar1,param_2,param_3);
    if (iVar1 < 0) break;
    local_8 = local_8 + 1;
    if (*(uint *)(param_1 + 0x1c) <= local_8) {
      return iVar1;
    }
  }
  return iVar1;
}


