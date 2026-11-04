// 10058f40 size=100 FUN_10058f40

uint FUN_10058f40(void)

{
  float *in_EAX;
  uint uVar1;
  uint uVar2;
  float local_c [3];
  
  local_c[0] = *in_EAX * *in_EAX;
  local_c[1] = in_EAX[1] * in_EAX[1];
  uVar2 = (uint)(local_c[0] < local_c[1]);
  uVar1 = 2;
  if (in_EAX[2] * in_EAX[2] <= local_c[uVar2]) {
    uVar1 = uVar2;
  }
  return uVar1;
}


