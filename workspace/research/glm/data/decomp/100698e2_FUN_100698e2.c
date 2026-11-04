// 100698e2 size=41 FUN_100698e2

int FUN_100698e2(undefined4 param_1)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_10069851(1);
  if (-1 < iVar1) {
    *(undefined4 *)(*(int *)(in_ECX + 0x58) + *(int *)(in_ECX + 0x5c) * 4) = param_1;
    *(int *)(in_ECX + 0x5c) = *(int *)(in_ECX + 0x5c) + 1;
    iVar1 = 0;
  }
  return iVar1;
}


