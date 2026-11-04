// 100268b0 size=99 FUN_100268b0

void FUN_100268b0(int param_1)

{
  ushort uVar1;
  undefined4 uVar2;
  
  uVar2 = (*(code *)RI_Z_MallocInternal)((uint)DAT_101d4928 * (uint)DAT_101d4928 * 4);
  uVar1 = DAT_101d4928;
  *(undefined4 *)(&DAT_10696bb0 + param_1 * 4) = uVar2;
  FUN_10025e80(uVar1,uVar1,4,uVar2);
  FUN_100266f0();
  if ((0 < *(int *)(DAT_101ce668 + 8)) && (DAT_101d4c94 != '\0')) {
    FUN_10011fe0();
  }
  return;
}


