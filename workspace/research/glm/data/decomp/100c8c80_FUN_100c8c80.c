// 100c8c80 size=79 FUN_100c8c80

int FUN_100c8c80(int param_1)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  int local_10 [3];
  
  local_10[0] = *(int *)(in_ECX + 0xf4);
  local_10[1] = *(undefined4 *)(in_ECX + 0xf0);
  local_10[2] = *(undefined4 *)(in_ECX + 0xf8);
  uVar2 = 0;
  iVar1 = param_1;
  while ((local_10[uVar2] == 0 ||
         (iVar1 = FUN_100c5108(local_10[uVar2],param_1), *(int *)(iVar1 + 0x10) == -1))) {
    uVar2 = uVar2 + 1;
    if (2 < uVar2) {
      return iVar1;
    }
  }
  return iVar1;
}


