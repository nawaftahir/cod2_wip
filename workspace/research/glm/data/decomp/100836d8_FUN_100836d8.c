// 100836d8 size=121 FUN_100836d8

int FUN_100836d8(void)

{
  int iVar1;
  undefined4 uVar2;
  int *in_ECX;
  int *piVar3;
  int local_8;
  
  local_8 = 0;
  piVar3 = &local_8;
  while( true ) {
    if (in_ECX == (int *)0x0) {
      return local_8;
    }
    if (in_ECX[1] != 1) break;
    iVar1 = FUN_1006506e(0x14);
    if (iVar1 == 0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_1008285c();
    }
    *piVar3 = iVar1;
    if (iVar1 == 0) {
      return local_8;
    }
    *(int *)(iVar1 + 0x10) = in_ECX[4];
    if (in_ECX[2] != 0) {
      uVar2 = (**(code **)(*(int *)in_ECX[2] + 4))();
      *(undefined4 *)(*piVar3 + 8) = uVar2;
      if (*(int *)(*piVar3 + 8) == 0) {
        *piVar3 = 0;
        return local_8;
      }
    }
    in_ECX = (int *)in_ECX[3];
    piVar3 = (int *)(*piVar3 + 0xc);
  }
  iVar1 = (**(code **)(*in_ECX + 4))();
  *piVar3 = iVar1;
  return local_8;
}


