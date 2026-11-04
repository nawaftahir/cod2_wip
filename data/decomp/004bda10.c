
undefined4 * __thiscall FUN_004bda10(undefined4 *param_1,undefined4 param_2)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  
  *param_1 = &PTR_LAB_00529a9c;
  param_1[5] = 0;
  param_1[4] = 0;
  param_1[3] = &DAT_00598c80;
  param_1[6] = &DAT_00598c80;
  param_1[8] = 0;
  param_1[7] = 0;
  param_1[1] = param_2;
  param_1[2] = 0;
  param_1[9] = 0;
  if (0 < DAT_00598cc8) {
    puVar2 = (undefined4 *)FUN_004bd190(2);
    uVar1 = *puVar2;
    puVar2 = (undefined4 *)FUN_004bd120(2);
    _printf("NetTcpTransport %s connected to %s\n",*puVar2,uVar1);
  }
  return param_1;
}

