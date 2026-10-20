
undefined4 __thiscall FUN_0046be10(ushort param_1,int param_2)

{
  ushort *in_EAX;
  size_t unaff_ESI;
  char *unaff_EDI;
  
  if (param_2 != 0) {
    param_1 = param_1 + (-1 - in_EAX[4]);
  }
  if (*in_EAX <= param_1) {
    return 0;
  }
  _strncpy(unaff_EDI,(char *)((uint)in_EAX[3] * (uint)param_1 + *(int *)(in_EAX + 6)),unaff_ESI);
  unaff_EDI[unaff_ESI - 1] = '\0';
  return 1;
}

