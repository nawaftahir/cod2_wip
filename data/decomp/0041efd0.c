
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_0041efd0(int param_1,undefined4 param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float10 fVar4;
  
  *(undefined4 *)(param_1 + 0x14) = param_2;
  *(undefined4 *)(param_1 + 0x58) = param_2;
  *(undefined4 *)(param_1 + 0x5c) = 0;
  fVar1 = *(float *)(param_1 + 0x40) - *(float *)(param_1 + 0x4c);
  fVar2 = *(float *)(param_1 + 0x44) - *(float *)(param_1 + 0x50);
  fVar3 = *(float *)(param_1 + 0x48) - *(float *)(param_1 + 0x54);
  fVar4 = (float10)FUN_004d98d4((double)(fVar1 * fVar1 + fVar2 * fVar2 + fVar3 * fVar3));
  if (*(int *)(param_1 + 0x18) != 0) {
    *(float *)(param_1 + 0x38) = (float)fVar4 / ((float)*(int *)(param_1 + 0x18) / _DAT_00556a5c);
  }
  return;
}

