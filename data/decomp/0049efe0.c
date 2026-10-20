
int FUN_0049efe0(undefined4 *param_1)

{
  int iVar1;
  int *in_EAX;
  
  if (in_EAX[3] == 0) {
    FUN_0049f420();
  }
  if (*in_EAX == in_EAX[1]) {
    FUN_0049f420();
  }
  *(undefined4 *)(in_EAX[3] + *in_EAX * 4) = *param_1;
  iVar1 = *in_EAX;
  *in_EAX = iVar1 + 1;
  return iVar1;
}

