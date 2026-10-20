
void __fastcall FUN_0042a440(undefined4 param_1,int param_2,char param_3,int param_4)

{
  int in_EAX;
  int unaff_EBX;
  int *unaff_EDI;
  undefined8 uVar1;
  
  if ((((-1 < in_EAX + param_4) && (in_EAX + param_4 < *unaff_EDI)) && (-1 < unaff_EBX + param_2))
     && (unaff_EBX + param_2 < unaff_EDI[1])) {
    uVar1 = FUN_00429df0();
    if (((int)uVar1 != -1) &&
       ((*(byte *)(unaff_EDI + (param_4 * 0x10 + unaff_EBX) * 0xe + 0x16) & 2) == 0)) {
      if (param_3 == '\0') {
        FUN_00429f40((int)((ulonglong)uVar1 >> 0x20));
      }
      FUN_0042a0a0();
    }
  }
  return;
}

