
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00499c30(undefined4 param_1,undefined4 param_2,undefined4 param_3,float param_4)

{
  int in_EAX;
  
  param_4 = param_4 * _DAT_00556a5c;
  *(undefined4 *)(in_EAX + 4) = param_1;
  *(float *)(in_EAX + 0x14) = param_4;
  *(undefined4 *)(in_EAX + 8) = param_2;
  *(undefined4 *)(in_EAX + 0xc) = param_3;
  return;
}

