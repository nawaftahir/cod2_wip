// 100330c0 size=201 FUN_100330c0

float10 FUN_100330c0(undefined4 param_1,undefined4 param_2,int param_3)

{
  int in_EAX;
  int iVar1;
  uint local_18;
  int local_14;
  uint local_10;
  int iStack_c;
  LARGE_INTEGER local_8;
  
  if (((*(int *)(in_EAX + 0x3c) == *(int *)(DAT_101d1b2c + 0x3c)) &&
      (*(int *)(in_EAX + 0x40) == *(int *)(DAT_101d1b2c + 0x40))) &&
     (*(int *)(in_EAX + 0x38) == *(int *)(DAT_101d1b2c + 0x38))) {
    return (float10)0.0;
  }
  FUN_10032f90(&local_10);
  iVar1 = param_3;
  if (0 < param_3) {
    do {
      FUN_1002e850(0,0,param_1,param_2,0,0,0x3f800000,0x3f800000);
      iVar1 = iVar1 + -1;
    } while (iVar1 != 0);
  }
  FUN_1003a8d0();
  FUN_10033010(&local_18);
  QueryPerformanceFrequency(&local_8);
  return (float10)param_3 /
         ((float10)CONCAT44((local_14 - iStack_c) - (uint)(local_18 < local_10),local_18 - local_10)
         / (float10)(longlong)local_8);
}


