// 100c7b3a size=48 FUN_100c7b3a

int FUN_100c7b3a(undefined4 param_1)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  
  iVar2 = FUN_100c40ff(1);
  if (-1 < iVar2) {
    piVar1 = (int *)(in_ECX + 0x110);
    *(undefined4 *)(*(int *)(in_ECX + 0x10c) + *piVar1 * 4) = param_1;
    *piVar1 = *piVar1 + 1;
    iVar2 = 0;
  }
  return iVar2;
}


