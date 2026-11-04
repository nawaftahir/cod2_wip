// 10030ba0 size=111 FUN_10030ba0

void FUN_10030ba0(int *param_1)

{
  int iVar1;
  char cVar2;
  
  iVar1 = *param_1;
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  DAT_10730558 = 0xe;
  cVar2 = FUN_10030a40(*(undefined4 *)(iVar1 + 4));
  if (cVar2 != '\0') {
    FUN_10030ab0(*(undefined4 *)(iVar1 + 4));
  }
  FUN_1003ea30();
  FUN_100308c0();
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


