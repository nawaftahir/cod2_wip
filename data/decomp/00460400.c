
undefined4 FUN_00460400(void)

{
  undefined4 uVar1;
  undefined1 local_10 [4];
  byte local_c [4];
  uint local_8;
  
  FUN_00460160(&local_8,local_c,0,local_10);
  if (((local_8 & 0x20000000) != 0) || (uVar1 = 1, (local_c[0] & 1) == 0)) {
    uVar1 = 0;
  }
  return uVar1;
}

