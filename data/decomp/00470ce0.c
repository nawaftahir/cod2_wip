
void FUN_00470ce0(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  
  puVar2 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      FUN_0045f340(puVar2,param_2,param_3,param_4,param_5);
      puVar1 = puVar2 + 1;
      puVar2 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  return;
}

