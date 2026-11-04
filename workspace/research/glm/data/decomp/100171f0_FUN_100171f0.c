// 100171f0 size=81 FUN_100171f0

int FUN_100171f0(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  
  if (((*(int *)(DAT_101d1b30 + 0x3c) != *(int *)(DAT_101d1b2c + 0x3c)) ||
      (*(int *)(DAT_101d1b30 + 0x40) != *(int *)(DAT_101d1b2c + 0x40))) ||
     (iVar2 = DAT_101d1b30, *(int *)(DAT_101d1b30 + 0x38) != *(int *)(DAT_101d1b2c + 0x38))) {
    FUN_1000c910();
    cVar1 = FUN_1000fc30(param_1);
    iVar2 = DAT_101d1b2c;
    if (cVar1 != '\0') {
      iVar2 = DAT_101d1b30;
    }
  }
  return iVar2;
}


