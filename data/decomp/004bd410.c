
void __fastcall FUN_004bd410(int *param_1)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined4 uStack_4;
  
  if (-1 < param_1[1]) {
    uStack_4 = param_1;
    if (0 < DAT_00598cc8) {
      puVar2 = (undefined4 *)(**(code **)(*param_1 + 0xc))(2);
      uVar1 = *puVar2;
      puVar2 = (undefined4 *)(**(code **)(*param_1 + 8))(2);
      _printf("NetTcpTransport %s closing %s\n",*puVar2,uVar1);
    }
    if (4 < DAT_00598cc8) {
      _printf("NetTcpTransport lastRead=%d\n",param_1[9]);
    }
    if (param_1[9] != 0) {
      Ordinal_16(param_1[1],(int)&uStack_4 + 3,1,0);
    }
    Ordinal_3(param_1[1]);
  }
  param_1[1] = -1;
  return;
}

