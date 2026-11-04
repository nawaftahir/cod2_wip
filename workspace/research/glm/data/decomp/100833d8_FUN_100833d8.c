// 100833d8 size=53 FUN_100833d8

undefined4 * FUN_100833d8(undefined4 param_1,undefined8 param_2,undefined4 *param_3)

{
  int iVar1;
  undefined4 *extraout_EDX;
  undefined4 *puVar2;
  
  FUN_100827bb(0xe);
  *(undefined8 *)(extraout_EDX + 6) = param_2;
  extraout_EDX[4] = param_1;
  *extraout_EDX = &PTR_FUN_10110068;
  puVar2 = extraout_EDX + 8;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_3;
    param_3 = param_3 + 1;
    puVar2 = puVar2 + 1;
  }
  return extraout_EDX;
}


