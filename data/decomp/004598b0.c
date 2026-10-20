
void FUN_004598b0(undefined4 param_1)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  
  iVar1 = 0;
  if (0 < *(int *)(in_EAX + 0x38)) {
    iVar2 = 0;
    do {
      FUN_00459530(*(int *)(in_EAX + 0x3c) + iVar2,param_1);
      iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0xa8;
    } while (iVar1 < *(int *)(in_EAX + 0x38));
  }
  FUN_0045a220(1);
  if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
    FUN_00475350();
  }
  FUN_0047a3c0();
  *(short *)(in_EAX + 0x42) = *(short *)(in_EAX + 0x42) + 1;
  return;
}

