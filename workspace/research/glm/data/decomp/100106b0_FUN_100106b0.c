// 100106b0 size=256 FUN_100106b0

void FUN_100106b0(undefined4 param_1,undefined4 param_2,undefined1 *param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  undefined1 local_1c;
  float local_18;
  float fStack_14;
  float local_10;
  
  FUN_10059250();
  fVar1 = *(float *)(DAT_101d1b9c + 0xb8);
  fVar2 = *(float *)(DAT_101d1b9c + 0xbc);
  fVar3 = *(float *)(DAT_101d1b9c + 0xc0);
  FUN_100590b0();
  local_1c = (undefined1)(int)ROUND(((fVar1 - local_18) + 1.0) * 0.5 * 255.0 + 9.313226e-10);
  param_3[2] = local_1c;
  local_1c = (undefined1)(int)ROUND(((fVar2 - fStack_14) + 1.0) * 0.5 * 255.0 + 9.313226e-10);
  param_3[1] = local_1c;
  local_1c = (undefined1)(int)ROUND(((fVar3 - local_10) + 1.0) * 0.5 * 255.0 + 9.313226e-10);
  *param_3 = local_1c;
  param_3[3] = 0x80;
  return;
}


