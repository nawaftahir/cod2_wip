
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_0041ea00(int param_1,undefined4 param_2)

{
  float10 fVar1;
  
  *(undefined4 *)(param_1 + 0x14) = param_2;
  FUN_0049a4f0(param_1 + 0x3c,param_2,*(undefined4 *)(param_1 + 0x18));
  *(undefined4 *)(param_1 + 0xb8) = *(undefined4 *)(param_1 + 0x14);
  *(undefined4 *)(param_1 + 0xbc) = 0;
  fVar1 = (float10)FUN_0049a420();
  if (*(int *)(param_1 + 0x18) != 0) {
    *(float *)(param_1 + 0x38) = (float)fVar1 / ((float)*(int *)(param_1 + 0x18) / _DAT_00556a5c);
  }
  return;
}

