// 10047510 size=97 FUN_10047510

int * FUN_10047510(int param_1)

{
  int *piVar1;
  int *in_EAX;
  int iVar2;
  int in_EDX;
  int unaff_EBX;
  
  iVar2 = 0;
  if (4 < in_EDX) {
    if (0 < in_EDX) {
      do {
        in_EAX[1] = iVar2;
        *in_EAX = 1;
        in_EAX[5] = 0;
        in_EAX[6] = 0;
        in_EAX[7] = param_1;
        in_EAX[8] = unaff_EBX;
        in_EAX = in_EAX + 9;
        iVar2 = iVar2 + 1;
      } while (iVar2 < in_EDX);
    }
    return in_EAX;
  }
  *in_EAX = in_EDX;
  piVar1 = in_EAX;
  if (0 < in_EDX) {
    do {
      piVar1[1] = iVar2;
      iVar2 = iVar2 + 1;
      piVar1 = piVar1 + 1;
    } while (iVar2 < in_EDX);
  }
  in_EAX[6] = 0;
  in_EAX[5] = 0;
  in_EAX[7] = param_1;
  in_EAX[8] = unaff_EBX;
  return in_EAX + 9;
}


