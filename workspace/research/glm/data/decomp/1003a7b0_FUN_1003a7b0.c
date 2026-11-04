// 1003a7b0 size=199 FUN_1003a7b0

void FUN_1003a7b0(void)

{
  int iVar1;
  undefined4 local_14;
  int local_10;
  int local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  local_10 = DAT_1072d9d4;
  local_c = DAT_1072d9d0 / 3;
  local_14 = 0;
  if (DAT_1072d9cc == 1) {
    iVar1 = ((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffdc) + 0x44;
  }
  else {
    iVar1 = ((*(int *)(DAT_101ce708 + 8) != 2) - 1 & 0xffffffe4) + 0x40;
  }
  local_4 = FUN_100386b0(DAT_1072d9b0);
  if (DAT_101d49a4[1] < DAT_1072d9d4 * iVar1 + *DAT_101d49a4) {
    *DAT_101d49a4 = 0;
  }
  FUN_100387d0(0,&DAT_106d3200);
  local_8 = 0;
  FUN_1003a580(DAT_1072d9cc,&local_14);
  DAT_1072d9d0 = 0;
  DAT_1072d9d4 = 0;
  return;
}


