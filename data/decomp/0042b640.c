
void FUN_0042b640(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  int unaff_EBX;
  
  for (iVar1 = *(int *)(unaff_EBX + 4); iVar1 != unaff_EBX; iVar1 = *(int *)(iVar1 + 4)) {
    if (*(int *)(iVar1 + 0x20) != 0) {
      FUN_0042b0f0(param_1,param_2,param_3,param_4);
    }
  }
  return;
}

