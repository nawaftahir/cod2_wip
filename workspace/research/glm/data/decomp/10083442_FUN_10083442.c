// 10083442 size=59 FUN_10083442

undefined4 *
FUN_10083442(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 *param_4)

{
  int iVar1;
  undefined4 *extraout_EDX;
  undefined4 *puVar2;
  
  FUN_100827bb(0xe);
  extraout_EDX[4] = param_1;
  extraout_EDX[6] = param_2;
  extraout_EDX[7] = param_3;
  *extraout_EDX = &PTR_FUN_10110068;
  puVar2 = extraout_EDX + 8;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_4;
    param_4 = param_4 + 1;
    puVar2 = puVar2 + 1;
  }
  return extraout_EDX;
}


