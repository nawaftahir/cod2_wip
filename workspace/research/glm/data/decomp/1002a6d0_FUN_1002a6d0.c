// 1002a6d0 size=81 FUN_1002a6d0

void FUN_1002a6d0(float *param_1,undefined4 param_2)

{
  int in_EAX;
  int in_EDX;
  float10 fVar1;
  float local_c;
  float local_8;
  float local_4;
  
  local_c = (*(float *)(in_EAX + 0x20) + *(float *)(in_EAX + 0x14)) * 0.5;
  local_8 = (*(float *)(in_EAX + 0x18) + *(float *)(in_EAX + 0x24)) * 0.5;
  local_4 = (*(float *)(in_EAX + 0x1c) + *(float *)(in_EAX + 0x28)) * 0.5;
  fVar1 = (float10)FUN_100363a0(in_EDX + 0x11c,&local_c,param_2);
  *param_1 = (float)fVar1;
  return;
}


