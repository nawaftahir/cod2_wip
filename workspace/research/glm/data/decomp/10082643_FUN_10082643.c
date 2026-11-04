// 10082643 size=88 FUN_10082643

void FUN_10082643(int param_1,int param_2)

{
  uint uVar1;
  undefined4 *in_ECX;
  _SYSTEM_INFO local_28;
  
  *in_ECX = 0;
  GetSystemInfo(&local_28);
  in_ECX[2] = 0;
  in_ECX[3] = 0;
  in_ECX[4] = 0;
  in_ECX[1] = local_28.dwPageSize;
  uVar1 = (local_28.dwPageSize - 1) + param_2 & ~(local_28.dwPageSize - 1);
  in_ECX[1] = uVar1;
  if (param_1 == 0) {
    param_1 = 0x100000;
  }
  in_ECX[5] = (uVar1 - 1) + param_1 & ~(uVar1 - 1);
  return;
}


