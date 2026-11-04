// 100b872e size=56 FUN_100b872e

int FUN_100b872e(undefined4 param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  
  iVar3 = FUN_100c40ff(2);
  if (-1 < iVar3) {
    iVar3 = *(int *)(in_ECX + 0x10c);
    piVar1 = (int *)(in_ECX + 0x110);
    iVar2 = *piVar1;
    *(undefined4 *)(iVar3 + iVar2 * 4) = param_1;
    *(undefined4 *)(iVar3 + 4 + iVar2 * 4) = param_2;
    *piVar1 = *piVar1 + 2;
    iVar3 = 0;
  }
  return iVar3;
}


