
void __fastcall FUN_00492130(undefined4 *param_1)

{
  undefined4 *in_EAX;
  
  *in_EAX = *param_1;
  in_EAX[1] = param_1[1];
  in_EAX[2] = param_1[2];
  *(undefined2 *)(in_EAX + 3) = *(undefined2 *)(param_1 + 3);
  in_EAX[4] = param_1[4];
  in_EAX[5] = param_1[5];
  in_EAX[6] = param_1[6];
  in_EAX[7] = param_1[7];
  in_EAX[8] = param_1[8];
  in_EAX[9] = param_1[9];
  in_EAX[10] = param_1[10];
  in_EAX[0xb] = param_1[0xb];
  in_EAX[0xc] = param_1[0xc];
  in_EAX[0xd] = param_1[0xd];
  in_EAX[0xe] = param_1[0xe];
  in_EAX[0xf] = param_1[0xf];
  in_EAX[0x10] = param_1[0x10];
  *(undefined2 *)(in_EAX + 0x11) = *(undefined2 *)(param_1 + 0x11);
  *(undefined2 *)((int)in_EAX + 0x46) = *(undefined2 *)((int)param_1 + 0x46);
  return;
}

