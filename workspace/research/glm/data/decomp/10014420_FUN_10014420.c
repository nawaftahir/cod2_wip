// 10014420 size=82 FUN_10014420

void FUN_10014420(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

{
  undefined4 *in_EAX;
  int in_ECX;
  undefined4 *in_EDX;
  
  *in_EAX = *in_EDX;
  in_EAX[1] = in_EDX[1];
  in_EAX[2] = in_EDX[2];
  in_EAX[3] = in_EDX[3];
  FUN_10014230(in_ECX - (int)in_EDX >> 4,param_1,param_2,param_3,param_4,param_5);
  return;
}


