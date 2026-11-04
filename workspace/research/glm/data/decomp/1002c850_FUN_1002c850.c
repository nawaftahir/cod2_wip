// 1002c850 size=183 FUN_1002c850

void FUN_1002c850(int *param_1,undefined4 param_2,undefined4 param_3)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 local_4;
  
  iVar1 = *(int *)(in_EAX + 0x10);
  local_4 = *(int *)(in_EAX + 0xc);
  iVar3 = 1;
  while ((1 < local_4 || (1 < iVar1))) {
    FUN_1000de10(param_3,iVar1);
    if (*param_1 == 4) {
      FUN_1000ec00(param_1,param_2,iVar3,param_3);
    }
    else if (((*param_1 != 5) || (iVar3 == 0)) || (DAT_101d496b != '\0')) {
      FUN_1000ea20(param_2,param_3);
    }
    iVar2 = local_4 >> 1;
    local_4 = 1;
    if (1 - iVar2 < 0) {
      local_4 = iVar2;
    }
    iVar1 = iVar1 >> 1;
    if (-1 < 1 - iVar1) {
      iVar1 = 1;
    }
    iVar3 = iVar3 + 1;
  }
  return;
}


