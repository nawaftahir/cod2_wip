
void FUN_00499af0(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *puVar1;
  int *piVar2;
  
  puVar1 = (undefined4 *)FUN_004ff450(0xc);
  if (puVar1 == (undefined4 *)0x0) {
    puVar1 = (undefined4 *)0x0;
  }
  else {
    *puVar1 = param_2;
    puVar1[1] = param_3;
    puVar1[2] = param_4;
  }
  piVar2 = (int *)(param_1 + 0x28);
  if (*(int *)(param_1 + 0x34) == 0) {
    FUN_0049f420();
  }
  if (*piVar2 == *(int *)(param_1 + 0x2c)) {
    FUN_0049f420();
  }
  *(undefined4 **)(*(int *)(param_1 + 0x34) + *piVar2 * 4) = puVar1;
  *piVar2 = *piVar2 + 1;
  return;
}

