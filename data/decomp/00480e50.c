
undefined4 __fastcall FUN_00480e50(undefined4 param_1,char *param_2)

{
  char *in_EAX;
  int iVar1;
  int iVar2;
  
  do {
    iVar1 = (int)*param_2;
    iVar2 = (int)*in_EAX;
    param_2 = param_2 + 1;
    in_EAX = in_EAX + 1;
    if ((0x60 < iVar1) && (iVar1 < 0x7b)) {
      iVar1 = iVar1 + -0x20;
    }
    if ((0x60 < iVar2) && (iVar2 < 0x7b)) {
      iVar2 = iVar2 + -0x20;
    }
    if ((iVar1 == 0x5c) || (iVar1 == 0x3a)) {
      iVar1 = 0x2f;
    }
    if ((iVar2 == 0x5c) || (iVar2 == 0x3a)) {
      iVar2 = 0x2f;
    }
    if (iVar1 < iVar2) {
      return 0xffffffff;
    }
    if (iVar2 < iVar1) {
      return 1;
    }
  } while (iVar1 != 0);
  return 0;
}

