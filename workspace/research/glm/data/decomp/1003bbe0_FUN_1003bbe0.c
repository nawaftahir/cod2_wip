// 1003bbe0 size=244 FUN_1003bbe0

void FUN_1003bbe0(float param_1,float param_2)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  undefined1 local_10;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if ((DAT_1072d9bc != *(int *)(DAT_101d1b9c + 0x168)) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  puVar2 = (undefined4 *)(&DAT_1072dee0 + DAT_10730550 * 0xcd0);
  puVar3 = (undefined4 *)(&DAT_1072ebb0 + DAT_10730550 * 0xcd0);
  for (iVar1 = 0x334; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  DAT_10730550 = DAT_10730550 + 1;
  iVar1 = (int)ROUND(param_1 * 255.0 + 9.313226e-10);
  local_10 = (undefined1)iVar1;
  param_1 = (float)CONCAT13(0xff,(int3)CONCAT31(CONCAT21((short)iVar1,local_10),local_10));
  FUN_1003b0c0(param_2 * 0.0015625,param_2 * 0.0020833334,param_1);
  FUN_1003a8d0();
  FUN_1003e4b0();
  return;
}


