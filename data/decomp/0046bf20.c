
undefined4 __fastcall FUN_0046bf20(ushort param_1)

{
  ushort uVar1;
  int in_EAX;
  ushort *unaff_ESI;
  
  if (in_EAX != 0) {
    param_1 = param_1 + (-1 - unaff_ESI[4]);
  }
  if (param_1 < *unaff_ESI) {
    uVar1 = *unaff_ESI - 1;
    *unaff_ESI = uVar1;
    if (param_1 < uVar1) {
      do {
        lstrcpyA((LPSTR)((uint)unaff_ESI[3] * (uint)param_1 + *(int *)(unaff_ESI + 6)),
                 (LPCSTR)((param_1 + 1) * (uint)unaff_ESI[3] + *(int *)(unaff_ESI + 6)));
        param_1 = param_1 + 1;
      } while (param_1 < *unaff_ESI);
    }
    return 1;
  }
  return 0;
}

