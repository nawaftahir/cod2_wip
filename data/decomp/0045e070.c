
void FUN_0045e070(int param_1)

{
  int iVar1;
  int iVar2;
  
  for (iVar1 = *(int *)(param_1 + 4); iVar1 != param_1; iVar1 = *(int *)(iVar1 + 4)) {
    for (iVar2 = *(int *)(iVar1 + 0xc); iVar2 != iVar1 + 8; iVar2 = *(int *)(iVar2 + 4)) {
      FUN_0045e0b0(iVar2);
    }
  }
  return;
}

