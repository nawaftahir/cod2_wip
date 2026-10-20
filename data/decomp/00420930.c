
void FUN_00420930(uint param_1)

{
  int *piVar1;
  int iVar2;
  int *in_EAX;
  undefined4 *unaff_EBX;
  
  if (param_1 != 0) {
    (**(code **)*unaff_EBX)();
    iVar2 = *in_EAX;
    while (iVar2 != 0) {
      if ((in_EAX[1] & param_1) == in_EAX[1]) {
        (**(code **)*unaff_EBX)();
        param_1 = param_1 & ~in_EAX[1];
      }
      piVar1 = in_EAX + 2;
      in_EAX = in_EAX + 2;
      iVar2 = *piVar1;
    }
    (**(code **)*unaff_EBX)();
  }
  return;
}

