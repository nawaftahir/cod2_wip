
void FUN_0048a440(uint param_1)

{
  undefined4 *in_EAX;
  code *unaff_EBX;
  
  for (; in_EAX != (undefined4 *)0x0; in_EAX = (undefined4 *)in_EAX[1]) {
    if ((*(byte *)(in_EAX + 2) == param_1) && (*(byte *)(in_EAX + 2) == 4)) {
      (*unaff_EBX)(*in_EAX);
    }
  }
  return;
}

