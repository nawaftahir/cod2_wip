
void __fastcall FUN_00452c60(undefined4 *param_1,int param_2)

{
  undefined4 *in_EAX;
  
  if (*(int *)(param_2 + 0xf4) == 2) {
    *in_EAX = *param_1;
    in_EAX[1] = param_1[1];
    return;
  }
  if (*(int *)(param_2 + 0xf4) == 1) {
    *in_EAX = *param_1;
    in_EAX[2] = param_1[2];
    return;
  }
  in_EAX[1] = param_1[1];
  in_EAX[2] = param_1[2];
  return;
}

