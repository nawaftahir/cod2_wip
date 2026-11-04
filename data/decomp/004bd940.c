
undefined4 * __fastcall FUN_004bd940(undefined4 *param_1)

{
  int iVar1;
  undefined1 local_190 [400];
  
  param_1[3] = 0;
  param_1[2] = 0;
  param_1[1] = &DAT_00598c80;
  *param_1 = &PTR_FUN_00529bd4;
  param_1[7] = 0;
  param_1[6] = 0;
  param_1[5] = &DAT_00598c80;
  param_1[4] = 0xffffffff;
  iVar1 = Ordinal_115(0x101,local_190);
  if (iVar1 != 0) {
    FUN_004c8870("WSAStartup failure",&DAT_0053d753);
  }
  return param_1;
}

