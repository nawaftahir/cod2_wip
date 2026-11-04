// 1009935c size=61 FUN_1009935c

int FUN_1009935c(undefined4 *param_1)

{
  int iVar1;
  int in_ECX;
  
  *(undefined4 *)(in_ECX + 0xd8) = 0;
  *(undefined4 *)(in_ECX + 0xdc) = 0;
  if (param_1 != (undefined4 *)0x0) {
    *param_1 = 0;
  }
  iVar1 = FUN_10098fd3();
  if (-1 < iVar1) {
    iVar1 = FUN_10099251();
    if (-1 < iVar1) {
      iVar1 = 0;
    }
  }
  return iVar1;
}


