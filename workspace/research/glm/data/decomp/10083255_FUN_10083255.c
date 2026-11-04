// 10083255 size=79 FUN_10083255

undefined4 *
FUN_10083255(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5,undefined4 *param_6)

{
  int iVar1;
  undefined4 *extraout_EDX;
  undefined4 *puVar2;
  
  FUN_100827bb(0xd);
  extraout_EDX[5] = 0;
  extraout_EDX[6] = 0;
  extraout_EDX[4] = param_1;
  extraout_EDX[7] = param_2;
  extraout_EDX[8] = param_3;
  extraout_EDX[9] = param_4;
  extraout_EDX[10] = param_5;
  *extraout_EDX = &PTR_FUN_1011005c;
  puVar2 = extraout_EDX + 0xc;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_6;
    param_6 = param_6 + 1;
    puVar2 = puVar2 + 1;
  }
  return extraout_EDX;
}


