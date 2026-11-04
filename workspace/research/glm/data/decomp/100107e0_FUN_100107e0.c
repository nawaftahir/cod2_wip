// 100107e0 size=98 FUN_100107e0

void FUN_100107e0(undefined4 param_1,undefined4 param_2,undefined4 *param_3)

{
  float10 fVar1;
  undefined4 local_4;
  
  FUN_10059250();
  *param_3 = param_2;
  fVar1 = (float10)FUN_1002c370(0x3f800000,0x3faa9fbe,local_4);
  param_2._0_1_ = (undefined1)(int)ROUND((float)(fVar1 * (float10)255.0) + 9.313226e-10);
  *(undefined1 *)((int)param_3 + 3) = (undefined1)param_2;
  return;
}


