
void __fastcall FUN_0049a8c0(undefined4 param_1,float *param_2)

{
  float *pfVar1;
  int in_EAX;
  
  pfVar1 = *(float **)(in_EAX + 0x34);
  if (pfVar1 != (float *)0x0) {
    *(undefined1 *)(in_EAX + 0x6d) = 1;
    *pfVar1 = *param_2 + *pfVar1;
    *(float *)(*(int *)(in_EAX + 0x34) + 4) = param_2[1] + *(float *)(*(int *)(in_EAX + 0x34) + 4);
    *(float *)(*(int *)(in_EAX + 0x34) + 8) = param_2[2] + *(float *)(*(int *)(in_EAX + 0x34) + 8);
  }
  return;
}

