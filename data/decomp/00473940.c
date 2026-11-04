
undefined1 FUN_00473940(undefined4 param_1,undefined4 param_2,char param_3,undefined4 param_4)

{
  char cVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  undefined1 uStack0000000f;
  undefined4 *local_8;
  
  if (param_3 == '\0') {
    local_8 = &DAT_010a44dc;
    FUN_0046fbe0(1);
    puVar2 = &DAT_010a44dc;
  }
  else {
    puVar2 = &DAT_010a44b4;
    local_8 = &DAT_010a44b4;
  }
  puVar3 = (undefined4 *)puVar2[1];
  uStack0000000f = 0;
  if (puVar3 == puVar2) {
    DAT_0123348c = DAT_0123348c | 1;
    return 0;
  }
  do {
    cVar1 = FUN_00473810(param_1,param_2,param_4);
    if (cVar1 != '\0') {
      uStack0000000f = 1;
    }
    puVar3 = (undefined4 *)puVar3[1];
  } while (puVar3 != local_8);
  DAT_0123348c = DAT_0123348c | 1;
  return uStack0000000f;
}

